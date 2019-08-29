data="$HOME/.locks/.wallhaven-scraper_available"
title_fg="foreground='#E8E713'"
notify_time="7000"
icon=$HOME/.icons/dunst/wallhaven_icon.png

script="/usr/bin/python3 ~/.scripts/cron/wallhaven_scraper/wallhaven-scraper.py"
available=$data

# 🖼️            
echo  $(cat $data)

case $BLOCK_BUTTON in
    1) pgrep -x dunst >/dev/null && notify-send -i $icon -t $notify_time  \
    "Wallhaven-Scraper Module


$(tail -n 1 $data): Wallpapers ready for download

 - Left click to show this page
 - Right click to update the available list
 - Middle click to download all new wallpapers
   Downloaded location: /mnt/storage/Pictures-X1e/Scraped-wallhaven/"  ;;

    2) $TERMINAL -e /usr/bin/python3 ~/.scripts/cron/wallhaven_scraper/wallhaven-scraper.py -d download && pkill -RTMIN+8 i3blocks ;;
    3) $TERMINAL -e /usr/bin/python3 ~/.scripts/cron/wallhaven_scraper/wallhaven-scraper.py -l list && pkill -RTMIN+8 i3blocks ;;
#     3) pgrep -x dunst >/dev/null && notify-send -i $icon -t 9000  \
#     "<span $title_fg><u><b>Wallhaven-Scraper Module</b></u></span>


# 🖼️ {number} = New wallpapers" ;;
esac

# <span $title_fg><u><b>Wallhaven-Scraper Module</b></u></span>