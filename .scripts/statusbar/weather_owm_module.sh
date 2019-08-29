#!/bin/bash

# Weather Icons (DAY)
sunny_D=$HOME/.icons/dunst/weather_icons/icon_01d.png
cloudy_D=$HOME/.icons/dunst/weather_icons/icon_02d.png
partly_cloudy_D=$HOME/.icons/dunst/weather_icons/icon_03d.png
scattered_clouds_D=$HOME/.icons/dunst/weather_icons/icon_04d.png
rain_D=$HOME/.icons/dunst/weather_icons/icon_09d.png
heavy_rain_D=$HOME/.icons/dunst/weather_icons/icon_10d.png
thunderstorms_D=$HOME/.icons/dunst/weather_icons/icon_11d.png
snow_D=$HOME/.icons/dunst/weather_icons/icon_13d.png
# Weather Icons (NIGHT)
sunny_N=$HOME/.icons/dunst/weather_icons/icon_01n.png
cloudy_N=$HOME/.icons/dunst/weather_icons/icon_02n.png
partly_cloudy_N=$HOME/.icons/dunst/weather_icons/icon_03n.png
scattered_clouds_N=$HOME/.icons/dunst/weather_icons/icon_04n.png
rain_N=$HOME/.icons/dunst/weather_icons/icon_09n.png
heavy_rain_N=$HOME/.icons/dunst/weather_icons/icon_10n.png
thunderstorms_N=$HOME/.icons/dunst/weather_icons/icon_11n.png
snow_N=$HOME/.icons/dunst/weather_icons/icon_13n.png
# Weather Icons (BOTH)
fog_D=$HOME/.icons/dunst/weather_icons/icon_50d.png
na=$HOME/.icons/dunst/weather_icons/icon_na.png

# icon_01d = ""
# icon_02d = ""
# icon_03d = ""
# icon_04d = ""
# icon_09d = ""
# icon_10d = ""
# icon_11d = ""
# icon_13d = ""
# icon_50d = ""

# Dunst Settings
script="/usr/bin/python3 ~/.scripts/cron/open_weather_map/main_script.py > ~/.locks/.weather_owm"
data="$HOME/.locks/.weather_owm"
title_fg="foreground='#E8E713'"
notify_time="50000"

# i3blocks Temperature
temperature=$(grep "i3block" .locks/.weather_owm | awk '{print $3}')

# i3blocks emoji
# ☁️ 🌥️ ⛅ 🌤️ ☀️ 🌦️ 🌧️ ☔ 🌨️ ⛈️ 🌩️ 🌬️ 🌫️ ❄️ 🌙 🥶 🥵 ❓
emoji_01n="🌙"  # Night clear sky
emoji_01d="☀️"  # clear sky
emoji_02d="🌤️"  # few clouds
emoji_03d="☁️"  # scattered clouds
emoji_04d="☁️"  # broken clouds
emoji_09d="🌦️"  # shower rain
emoji_10d="🌧️"  # rain
emoji_11d="⛈️"  # thunderstorm
emoji_13d="🌨️"  # snowing
emoji_50d="🌫️"  # mist/fog
emoji_na="❓"


icon_id=$(grep "i3block" .locks/.weather_owm | awk '{print $2}')
icon=""
if [[ $icon_id = "01d" ]]; then
    icon="$sunny_D"
    echo $emoji_01d $temperature
elif [[ $icon_id = "01n" ]]; then
    icon="$sunny_N"
    echo $emoji_01n $temperature
elif [[ $icon_id = "02d" ]]; then
    icon="$partly_cloudy_D"
    echo $emoji_02d $temperature
elif [[ $icon_id = "02n" ]]; then
    icon="$partly_cloudy_N"
    echo $emoji_02d $temperature
elif [[ $icon_id = "03d" ]]; then
    icon="$cloudy_D"
    echo $emoji_03d $temperature
elif [[ $icon_id = "03n" ]]; then
    icon="$cloudy_N"
    echo $emoji_03d $temperature
elif [[ $icon_id = "04d" ]]; then
    icon="$scattered_clouds_D"
    echo $emoji_04d $temperature
elif [[ $icon_id = "04n" ]]; then
    icon="$scattered_clouds_N"
    echo $emoji_04d $temperature
elif [[ $icon_id = "09d" ]]; then
    icon="$rain_D"
    echo $emoji_09d $temperature
elif [[ $icon_id = "09n" ]]; then
    icon="$rain_N"
    echo $emoji_09d $temperature
elif [[ $icon_id = "10d" ]]; then
    icon="$heavy_rain_D"
    echo $emoji_10d $temperature
elif [[ $icon_id = "10n" ]]; then
    icon="$heavy_rain_N"
    echo $emoji_10d $temperature
elif [[ $icon_id = "11d" ]]; then
    icon="$thunderstorms_D" 
    echo $emoji_11d $temperature
elif [[ $icon_id = "11n" ]]; then
    icon="$thunderstorms_N"
    echo $emoji_11d $temperature
elif [[ $icon_id = "13d" ]]; then
    icon="$snow_D"
    echo $emoji_13d $temperature
elif [[ $icon_id = "13n" ]]; then
    icon="$snow_N"
    echo $emoji_13n $temperature
elif [[ $icon_id = "50d" ]] || [[ $icon_id = "50n" ]]; then
    icon="$fog_D"
    echo $emoji_50d $temperature
else
    icon="$na"
    echo $emoji_na $temperature
fi


############################################################
# THIS WORKS MANUALLY: notify-send "$(tail -n 8 test2.txt)"
#  2) $TERMINAL -e sudo pacman -Syu && pacman -Qu | wc -l > ~/.locks/.pacman-downloads && pkill -RTMIN+8 i3blocks ;;

case $BLOCK_BUTTON in
    1) pgrep -x dunst >/dev/null && notify-send -i $icon -t $notify_time  \
    "Open Weather Map API

$(tail -n 11 $data)


 - Right click for descriptions"  ;;
    2) $TERMINAL -e /usr/bin/python3 ~/.scripts/cron/open_weather_map/main_script.py > ~/.locks/.weather_owm && pkill -RTMIN+8 i3blocks ;;
    3) pgrep -x dunst >/dev/null && notify-send -i $icon -t 9000  \
    "OWM Summary Page

  =  Current weather condition
   =  Current IP location

   =  Temperature &amp; min/max
   =  Humidity%
   =  Pressue%
  =  Cloud%
  =  Wind Speed and direction
  =  UV Index
       0-2.9 = Low
       3-5.9 = Moderate
       6-7.9 = High
       8-10.9 = Very high
       11+ = Extreme
  =  Sunrise
  =  Sunset
"  ;;
esac
