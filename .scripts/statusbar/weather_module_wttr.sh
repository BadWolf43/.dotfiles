#!/bin/bash

#Get Weather info from wttr.in
# See: https://github.com/chubin/wttr.in

#    c    Weather condition,
#    C    Weather condition textual name,
#    h    Humidity,
#    t    Temperature,
#    w    Wind,
#    l    Location,
#    m    Moonphase 🌑🌒🌓🌔🌕🌖🌗🌘,
#    M    Moonday,
#    p    precipitation (mm),
#    P    pressure (hPa),

## command
#curl wttr.in/33409?format="%l+%t+%C+%h+%w+%p+%P+%m"

## returns
#33409 +82°F Partly cloudy 65% ←22 mph 2.6mm 1019hPa 🌘
#" ☁️ 🌥️ ⛅ 🌤️ ☀️ 🌦️ 🌧️ ☔ 🌨️ ⛈️ 🌩️ 🌬️ 🌫️ ❄️ 🌙 🥶 🥵 ❓

icon_cloudy="☁️"
icon_partly_cloudy="🌤️"
icon_mostly_cloudy="🌥️"
icon_foggy="🌫️"
icon_rain="🌧️"
icon_light_rain="☔"
icon_thunderstorm="⛈️"
icon_light_snow="🌨️"
icon_snow="❄️"
icon_windy="🌬️"
icon_sunny="☀️"
icon_unknow="❓"
icon_hot="🥵"
icon_cold="🥶"

cl="Cloudy"
mc="Mostly cloudy"
pc="Partly cloudy"
lr="Light Rain"
rn="Rain"
wd="Windy"
su="Sunny"
ls="Light Snow"
sn="Snow"
fg="Foggy"
ts="Thunderstorm"
oc="Overcast"
uk="Unknow"

icon=~/.icons/dunst/weather-icon.png
title_fg="foreground='#E8E713'"
time="10000"
wttr_location=$(curl wttr.in/?format="%l")
wttr_current=$(curl wttr.in/?format="%l+%t+%h+%w+%p+%P+%m")
wttr=$(curl wttr.in/33409?format="%l+%t+%h+%w+%p+%P+%m")
condition_icon=$(curl wttr.in/33409?format="%c+%t")
condition=$(curl wttr.in/33409?format="%C")
temp=$(curl wttr.in/33409?format="%t")


tempNum=$(curl wttr.in/33409?format="%t" | head -c 3)
face=""
# Adds 🥵 if over 100
if [[ $tempNum -ge 100 ]]; then
    face=$icon_hot
fi
# Adds 🥶 if under 10
if [[ $tempNum -le 10 ]]; then
    face=$icon_cold
fi
#wttr=$(curl wttr.in/33409?format="%l+%t+%C+%h+%w+%p+%P+%m" | awk '{ print $1 }' )

# Both are needed for the color output to work
# echo "$TEMP_c°C"
# echo "$TEMP_c°C"

## EXAMPLE: if this = this OR this - this 
#  if [ "a string" = "another one" ] || [ "$foo" = "bar" ] ; then

if [[ $condition = "Thunderstorm" ]]; then
    emoji="$icon_thunderstorm"
    echo $icon_thunderstorm $temp $face
elif [[ $condition = "Sunny" ]]; then
    emoji="$icon_sunny"
    echo $icon_sunny $temp $face
elif [[ $condition = "Light Rain" ]]; then
    emoji="$icon_light_rain"
    echo $icon_light_rain $temp $face
elif [[ $condition = "Rain" ]]; then
    emoji="$icon_rain"
    echo $icon_rain $temp $face
elif [[ $condition = "Mostly cloudy" ]]; then
    emoji="$icon_partly_cloudy"
    echo $icon_partly_cloudy $temp $face
elif [[ $condition = "Partly cloudy" ]]; then
    emoji="$icon_mostly_cloudy"
    echo $icon_mostly_cloudy $temp $face
elif [[ $condition = "Windy" ]]; then
    emoji="$icon_windy"
    echo $icon_windy $temp $face
else
    echo "🤕 FIX ME"
fi

# i3bar temp
#echo $condition_icon

case $BLOCK_BUTTON in
    1) notify-send  -i $icon \
                    -t $time  \
    "<span $title_fg><u><b>33409 - Weather Module</b></u></span>
- Left Click.: West Palm Beach (by zipcode) 
- Right Click: Current Location (by IP)

----------[ West Palm Beach ]----------
 Location......: $(echo $wttr | awk '{print $1}')
 Temperature...: $(echo $wttr | awk '{print $2}')
 Condition.....: $(echo $emoji $condition)
 Humidity......: $(echo $wttr | awk '{print $3}')
 Wind..........: $(echo $wttr | awk '{print $4 $5}')
 Precipitation.: $(echo $wttr | awk '{print $6}')
 pressure......: $(echo $wttr | awk '{print $7}')
 Moonphase.....: $(echo $wttr | awk '{print $8}')
" ;;
    
    3) notify-send  -i $icon \
                    -t $time  \
    "<span $title_fg><u><b>Current IP Location - Weather Module</b></u></span>

----------[ Current IP Location ]----------
 Location......: $(echo $wttr_location | awk '{print $1}')
 Temperature...: $(echo $wttr_current | awk '{print $2}')
 Condition.....: $(echo $emoji $condition)
 Humidity......: $(echo $wttr_current | awk '{print $3}')
 Wind..........: $(echo $wttr_current | awk '{print $4 $5}')
 Precipitation.: $(echo $wttr_current | awk '{print $6}')
 pressure......: $(echo $wttr_current | awk '{print $7}')
 Moonphase.....: $(echo $wttr_current | awk '{print $8}')
" ;;
esac


<<COMMENT
## WeatherCode Conditions
#########################
Clear/Sunny
Partly Cloudy
Cloudy
Overcast
Mist
Fog
Light rain
Heavy rain

Freezing fog
Patchy rain nearby
Patchy light drizzle
Light rain shower
Moderate rain at times
Heavy rain at times
Moderate or heavy rain shower
Light sleet showers
Moderate or heavy sleet showers
Light showers of ice pellets
Thundery outbreaks in nearby
Light drizzle
Patchy light rain
Moderate rain
Heavy rain
Torrential rain shower
Moderate or heavy sleet
Patchy sleet nearby
Patchy freezing drizzle nearby
Freezing drizzle
Heavy freezing drizzle
Light freezing rain
Moderate or Heavy freezing rain
Light sleet
Ice pellets
Moderate or heavy showers of ice pellets
Moderate or heavy rain in area with thunder
Blizzard
Patchy light rain in area with thunder
Patchy light snow in area with thunder
Blowing snow
Patchy moderate snow
Moderate snow
Heavy snow
Patchy light snow
Light snow
Light snow showers
Patchy heavy snow
Moderate or heavy snow showers
Moderate or heavy snow in area with thunder
Patchy snow nearby
COMMENT