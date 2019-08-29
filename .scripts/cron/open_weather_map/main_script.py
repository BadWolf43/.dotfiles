import requests
from icons_and_codes import Icons
import datetime


'''
----------------------------
id: "4177887"
name: "West Palm Beach"
country: "US"
coord:
    lon: -80.053368
    lat: 26.71534
-----------------------------
'''
"""
Weather API from openWeatherMap.com
Weather conditions and icons: https://openweathermap.org/weather-conditions

Example of API call:
   api.openweathermap.org/data/2.5/forecast?id=524901&APPID=1111111111
   r=requests.get('http://api.openweathermap.org/data/2.5/weather?id=4177887&units=imperial&APPID=)
   
---------------[pyowm example]
owm = pyowm.OWM(APIKEY)
observation = owm.weather_at_id(4177887)
w = observation.get_weather()
print(w)
"""


class API:
    openweathermap = "/home/rnader/.creds/.openweathermap_apikey"
    ipstack = "/home/rnader/.creds/.ipstack_apikey"

    with open(openweathermap, 'r') as file:
        for line in file:
            OWM = line.rsplit('\n')[0]

    with open(ipstack, 'r') as file:
        for line in file:
            IPS = line.rsplit('\n')[0]


def time_converter(time):
    converted_time = datetime.datetime.fromtimestamp(int(time)).strftime('%I:%M %p')
    return converted_time


def wind_direction(wind_degree):
    if 0 <= wind_degree <= 25:
        icon_direction = Icons.icon_wind_n
        print("( {} )".format(icon_direction))
    elif 26 <= wind_degree <= 65:
        icon_direction = Icons.icon_wind_ne
        print("( {} )".format(icon_direction))
    elif 66 <= wind_degree <= 115:
        icon_direction = Icons.icon_wind_e
        print("( {} )".format(icon_direction))
    elif 116 <= wind_degree <= 155:
        icon_direction = Icons.icon_wind_se
        print("( {} )".format(icon_direction))
    elif 156 <= wind_degree <= 205:
        icon_direction = Icons.icon_wind_s
        print("( {} )".format(icon_direction))
    elif 206 <= wind_degree <= 245:
        icon_direction = Icons.icon_wind_sw
        print("( {} )".format(icon_direction))
    elif 246 <= wind_degree <= 295:
        icon_direction = Icons.icon_wind_w
        print("( {} )".format(icon_direction))
    elif 296 <= wind_degree <= 335:
        icon_direction = Icons.icon_wind_nw
        print("( {} )".format(icon_direction))
    elif 336 <= wind_degree <= 360:
        icon_direction = Icons.icon_wind_n
        print("( {} )".format(icon_direction))
    else:
        icon_direction = Icons.icon_na
        print("( {} )".format(icon_direction))


def condition(icon_id, description):
    if icon_id == '01d':  # Day
        id_icon = Icons.icon_01d
        print("{}   {}".format(id_icon, description.capitalize()))
    elif icon_id == '01n':  # Night
        id_icon = Icons.icon_01n
        print("{}   {}".format(id_icon, description.capitalize()))
    elif icon_id == '02d':  # Day
        id_icon = Icons.icon_02d
        print("{}   {}".format(id_icon, description.capitalize()))
    elif icon_id == '02n':  # Night
        id_icon = Icons.icon_02n
        print("{}   {}".format(id_icon, description.capitalize()))
    elif icon_id == '03d':  # Day
        id_icon = Icons.icon_03d
        print("{}   {}".format(id_icon, description.capitalize()))
    elif icon_id == '03n':  # Night
        id_icon = Icons.icon_03n
        print("{}   {}".format(id_icon, description.capitalize()))
    elif icon_id == '04d':  # Day
        id_icon = Icons.icon_04d
        print("{}   {}".format(id_icon, description.capitalize()))
    elif icon_id == '04n':  # Night
        id_icon = Icons.icon_04n
        print("{}   {}".format(id_icon, description.capitalize()))
    elif icon_id == '09d':  # Day
        id_icon = Icons.icon_09d
        print("{}   {}".format(id_icon, description.capitalize()))
    elif icon_id == '09n':  # Night
        id_icon = Icons.icon_09n
        print("{}   {}".format(id_icon, description.capitalize()))
    elif icon_id == '10d':  # Day
        id_icon = Icons.icon_10d
        print("{}   {}".format(id_icon, description.capitalize()))
    elif icon_id == '10n':  # Night
        id_icon = Icons.icon_10n
        print("{}   {}".format(id_icon, description.capitalize()))
    elif icon_id == '11d':  # Day
        id_icon = Icons.icon_11d
        print("{}   {}".format(id_icon, description.capitalize()))
    elif icon_id == '11n':  # Night
        id_icon = Icons.icon_11n
        print("{}   {}".format(id_icon, description.capitalize()))
    elif icon_id == '13d':  # Day
        id_icon = Icons.icon_13d
        print("{}   {}".format(id_icon, description.capitalize()))
    elif icon_id == '13n':  # Night
        id_icon = Icons.icon_13n
        print("{}   {}".format(id_icon, description.capitalize()))
    elif icon_id == '50d':  # Day
        id_icon = Icons.icon_50d
        print("{}   {}".format(id_icon, description.capitalize()))
    elif icon_id == '50n':  # Night
        id_icon = Icons.icon_50n
        print("{}   {}".format(id_icon, description.capitalize()))
    else:
        id_icon = Icons.icon_na
        print("{}   {}".format(id_icon, description.capitalize()))


def uv_rays(uv_index):
    """
    0-2.9 = Low
    3-5.9 = Moderate
    6-7.9 = High
    8-10.9 = Very high
    11+ = Extreme
    :param uv_index:
    :return:
    """
    if uv_index >= 11:
        print("{}   {} (Extreme)".format(Icons.icon_uv, uv_index))
    elif uv_index >= 9:
        print("{}   {} (High)".format(Icons.icon_uv, uv_index))
    elif uv_index >= 6:
        print("{}   {} (Moderate)".format(Icons.icon_uv, uv_index))
    else:
        print("{}   {} (Low)".format(Icons.icon_uv, uv_index))


class CurrentWeather(Icons, API):
    IP_URL = requests.get("http://ifconfig.me")
    BASE_IPS_URL = "http://api.ipstack.com/"
    BASE_URL = "http://api.openweathermap.org/data/2.5/"
    WAN = IP_URL.text
    UNITS = "imperial"

    GEO_URL = requests.get(BASE_IPS_URL + WAN + '?access_key=' + API.IPS + '&fields=latitude,longitude')
    geo = GEO_URL.json()
    LAT = str(geo['latitude'])
    LON = str(geo['longitude'])

    URL = requests.get(BASE_URL + 'weather' + '?lat=' + LAT + '&lon=' + LON + '&units=' + UNITS + '&APPID=' + API.OWM)
    UV_URL = requests.get(BASE_URL + 'uvi' + '?lat=' + LAT + '&lon=' + LON + '&APPID=' + API.OWM)

    # print('JSON..............:', URL.json())
    # print('URL...............:', URL.url)
    # print('UV_URL............:', UV_URL.url)
    # print('Status Code.......:', URL.status_code)

    if URL.status_code == 200:  # ......................................................[ Weather Group/Condition ]
        data = URL.json()
        uv_data = UV_URL.json()
        icon_id = data['weather'][0]['icon']
        description = data['weather'][0]['description']
        temp = (data['main'])  # ..........................................................[ Temperature/Humidity ]
        clouds = (data['clouds'])  # ....................................................................[ Clouds ]
        wind = (data['wind'])  # .........................................................[  Wind Speed/Direction ]
        wind_degree = int(wind['deg'])
        uv_index = (uv_data['value'])  # .............................................................[  UV Index ]
        utc_time = data['sys']  # .................................................................[Sunrise/Sunset]
        sunrise = int(utc_time['sunrise'])
        sunset = int(utc_time['sunset'])

        # Line 1 Temperature for i3blocks
        print('i3block', icon_id, int(temp['temp']), end=''), print(Icons.icon_fahrenheit, '\n')

        # Location
        loc1 = Icons.icon_globe
        loc2 = data['name']
        if loc2 == "Schall Circle":  # Forces WPB when at home
            loc2 = "West Palm Beach"
        # Temperature
        tmp1 = Icons.icon_temp
        tmp2 = Icons.icon_fahrenheit
        tmp3 = int(temp['temp'])
        tmp4 = int(temp['temp_min'])
        tmp5 = int(temp['temp_max'])
        # Humidity
        hum1 = Icons.icon_humidity
        hum2 = temp['humidity']
        # Pressure
        pre1 = Icons.icon_pressure
        pre2 = temp['pressure']
        # Clouds
        clo1 = Icons.icon_clouds
        clo2 = clouds['all']
        # Wind Speed
        wnd1 = Icons.icon_wind
        wnd2 = wind['speed']

        # Condition
        condition(icon_id, description)
        # location (West Palm Beach)
        print("{}   {}\n".format(loc1, loc2))
        # Temperature
        print("{}   {}{} ({}/{}{})".format(tmp1, tmp3, tmp2, tmp4, tmp5, tmp2))
        # Humidity
        print("{}   {}%".format(hum1, hum2))
        # Pressure
        print("{}   {}hPa".format(pre1, pre2))
        # Clouds
        print("{}   {}%".format(clo1, clo2))
        # Wind Speed
        print("{}   {}mph".format(wnd1, wnd2), end=' ')
        # Wind Directon
        wind_direction(wind_degree)
        # UV Index
        uv_rays(uv_index)
        # Sunrise and Sunset
        print("{}   {}".format(Icons.icon_sunrise, time_converter(sunrise)))
        print("{}   {}".format(Icons.icon_sunset, time_converter(sunset)))

    else:
        print('Status Code:...:', URL.status_code)
