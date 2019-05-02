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


icon=~/.icons/dunst/weather-icon.png
title_fg="foreground='#E8E713'"
time="10000"
wttr=$(curl wttr.in/33409?format="%l+%t+%h+%w+%p+%P+%m")
condition_icon=$(curl wttr.in/33409?format="%c+%t")
condition=$(curl wttr.in/33409?format="%C")
#wttr=$(curl wttr.in/33409?format="%l+%t+%C+%h+%w+%p+%P+%m" | awk '{ print $1 }' )

# Both are needed for the color output to work
# echo "$TEMP_c°C"
# echo "$TEMP_c°C"

# # color
# if [[ $TEMP_c -ge 60 ]]; then
#     echo "#F2A272"
# elif [[ $TEMP_c -ge 50 ]]; then
#     echo "#FFFF48"
# elif [[ $TEMP_c -ge 30 ]]; then
#     echo "#05FFAF"
# else
#     echo "#FF4848"
# fi

# i3bar temp
echo $condition_icon

case $BLOCK_BUTTON in
    1) notify-send  -i $icon \
                    -t $time  \
    "<span $title_fg><u><b>Weather Module</b></u></span>

 Location......: $(echo $wttr | awk '{print $1}')
 Temperature...: $(echo $wttr | awk '{print $2}')
 Condition.....: $(echo $condition)
 Humidity......: $(echo $wttr | awk '{print $3}')
 Wind..........: $(echo $wttr | awk '{print $4 $5}')
 Precipitation.: $(echo $wttr | awk '{print $6}')
 pressure......: $(echo $wttr | awk '{print $7}')
 Moonphase.....: $(echo $wttr | awk '{print $8}')
" ;;
esac
