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
#"  ⛅  🌦️  🌨️ 🌩️ 🌙 🥶 🥵

icon_cloudy="☁️"
icon_partly_cloudy="🌤️"
icon_mostly_cloudy="🌥️"
icon_foggy="🌫️"
icon_rain="🌧️☔"
icon_thunderstorm="⛈️"
icon_snow="❄️"
icon_windy="🌬️"
icon_sunny="☀️"
icon_unknow="❓"

cl="Cloudy"
mc="Mostly cloudy"
pc="Partly cloudy"
rn="Rain"
wd="Windy"
su="Sunny"
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

#wttr=$(curl wttr.in/33409?format="%l+%t+%C+%h+%w+%p+%P+%m" | awk '{ print $1 }' )

# Both are needed for the color output to work
# echo "$TEMP_c°C"
# echo "$TEMP_c°C"

if [[ $condition == "Thunderstorm" ]]; then
    echo $icon_thunderstorm $temp
elif [[ $condition == "Sunny" ]]; then
    echo $icon_sunny $temp
elif [[ $condition == "Rain" ]]; then
    echo $icon_rain $temp
elif [[ $condition == "Mostly cloudy" ]]; then
    echo $icon_partly_cloudy $temp
elif [[ $condition == "Partly cloudy" ]]; then
    echo $icon_mostly_cloudy $temp
elif [[ $condition == "Windy" ]]; then
    echo $icon_windy $temp
else
    echo "FIX ME"
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
 Condition.....: $(echo $condition)
 Humidity......: $(echo $wttr | awk '{print $3}')
 Wind..........: $(echo $wttr | awk '{print $4 $5}')
 Precipitation.: $(echo $wttr | awk '{print $6}')
 pressure......: $(echo $wttr | awk '{print $7}')
 Moonphase.....: $(echo $wttr | awk '{print $8}')
" ;;
    
    3) notify-send  -i $icon \
                    -t $time  \
    "<span $title_fg><u><b>Current Location - Weather Module</b></u></span>

----------[ Current Location ]----------
 Location......: $(echo $wttr_location | awk '{print $1}')
 Temperature...: $(echo $wttr_current | awk '{print $2}')
 Condition.....: $(echo $condition)
 Humidity......: $(echo $wttr_current | awk '{print $3}')
 Wind..........: $(echo $wttr_current | awk '{print $4 $5}')
 Precipitation.: $(echo $wttr_current | awk '{print $6}')
 pressure......: $(echo $wttr_current | awk '{print $7}')
 Moonphase.....: $(echo $wttr_current | awk '{print $8}')
" ;;
esac
