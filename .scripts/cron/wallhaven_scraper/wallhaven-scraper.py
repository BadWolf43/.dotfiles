import requests
import os
import argparse


'''
########################################################
#                 __ __ __                             #
# .--.--.--.---.-|  |  |  |--.---.-.--.--.-----.-----. #
# |  |  |  |  _  |  |  |     |  _  |  |  |  -__|     | #
# |________|___._|__|__|__|__|___._|\___/|_____|__|__| #
#       .-----.----.----.---.-.-----.-----.----.       #     
#       |__ --|  __|   _|  _  |  _  |  -__|   _|       #     
#       |_____|____|__| |___._|   __|_____|__|         #     
#                             |__|                     #
#                                                      #
#                  https://wallhaven.cc/               #
#                                                      #
#                 Author - Ryan Nader                  #
#                 Created - 07/27/2019                 #
#                 version - 2.0                        #
########################################################
'''


# .......................................................................................................... [ Script Arguments ]
parser = argparse.ArgumentParser()
parser.add_argument('--list', '-l', help='{wallhaven-scraper.py -l list} to Count all available wallpapers')
parser.add_argument('--download', '-d', help='{wallhaven-scraper.py -d download} to Download all available wallpapers')
args = parser.parse_args()


# ............................................................................................................... [ Directories ]
api_key = "/home/rnader/.creds/.wallhaven_apikey"
# os.makedirs('/home/rnader/PycharmProjects/wallhaven-scraper/downloaded', exist_ok=True)
dest = '/mnt/storage/Pictures-X1e/Scraped-wallhaven'
id_file = '/home/rnader/.scripts/cron/wallhaven_scraper/id_file.txt'
available_images = '/home/rnader/.locks/.wallhaven-scraper_available'
# ......................................................................................................... [ Search Parameters ]
# -----[ purity ]-----
# 100 = Safe For Work
# 010 = Sketchy
# 001 = Not Safe For Work
# 110 = SFW and Sketchy
# 101 = SFW and NSFW
# 011 = Sketchy and NSFW
# 111 = SFW, Sketchy and NSFW
# -----[ categories ]-----
# 111 = Every
# 100 = General
# 010 = Anime
# 001 = People
# 110 = General and Anime
# 101 = General and People
# -----[ range ]-----
# 1d = 1 Day
# 3d = 3 days
# 1w = 1 week
# 1m = 1 month
# 3m = 3 months
# 6m = 6 months
# 1y = 1 year

res = '&atleast=3840x2160'  # ......... Resolution
purity = '&purity=110'  # ............. Purity (SFW and NSFW)
general_people = '&categories=101'  # . Categories (General and People)
sorting = '&sorting=toplist'  # ....... Sorting
top_range = '&topRange=3m'  # ......... Range
order = '&order=asc'  # ............... Order
page = '&page='  # .................... Page Number
# ................................................................................................................... [ API Key ]


def get_apikey(key_path):
    with open(key_path, 'r') as file:
        for line in file:
            return line.rsplit('\n')[0]


APIKEY = '?apikey=' + get_apikey(api_key)
cookies = dict()
# ............................................................................................................ [ URL Parameters ]
BASEURL = "https://wallhaven.cc/api/v1/"
URL = (BASEURL + 'search' + APIKEY + general_people + purity + res + top_range + sorting + order + page)
URL_json = requests.get(URL)
meta_data = URL_json.json()
start_page = int(1)
end_page = int(meta_data['meta']['last_page'])
missing_count = int(0)


def count_available(missing_count):
    print("Updating the available wallpaper list\n")
    for page_num in range(start_page, end_page + start_page):
        url_req = requests.get(URL + str(page_num))
        data = url_req.json()
        # print(url_req.url, '\n')
        for i in data['data']:
            # print('ID:', i['id'])
            with open(id_file, 'r+') as f:
                if (i['id']) not in f.read():
                    missing_count += 1
                    # print(missing_count)
                    print("\n NEW Image Found")
                # else:
                #     print('Already Exists\n')
            f.close()
            with open(available_images, 'w') as w:
                w.write(str(missing_count))
        if missing_count > int(0):
            print('\nPage:', page_num, "| Total New:", missing_count)
        else:
            print('Searching Page:', page_num)


def download_images(image):
    filename = os.path.basename(image['path'])
    path = os.path.join(dest, filename)
    imgreq = requests.get(image['path'], cookies=cookies)

    if imgreq.status_code == 200:
        print("Downloading: ", image['path'], '\n')
        with open(path, 'ab') as imageFile:
            for chunk in imgreq.iter_content(1024):
                imageFile.write(chunk)
    elif imgreq.status_code != 403 and imgreq.status_code != 404:
        print("ERROR - Problem Downloading:", filename, '\nStatus Code:', imgreq.status_code, '\n')


def scrape_images():
    for page_num in range(start_page, end_page + start_page):
        url_req = requests.get(URL + str(page_num))
        data = url_req.json()
        print('===============================[ PAGE:', page_num, ']')
        #print(url_req.url, '\n')
        for i in data['data']:
            print('ID:', i['id'])
            with open(id_file, 'r+') as f:
                if (i['id']) not in f.read():
                    f.write('\n')
                    f.write(i['id']), '\n'
                    download_images(i)
                else:
                    print('Already Exists\n')
            f.close()


# Option 1: count
if args.list:
    count_available(missing_count)

# Option 2: download
elif args.download:
    scrape_images()
    count_available(missing_count)


# if __name__ == '__main__':
#     scrape_images()
