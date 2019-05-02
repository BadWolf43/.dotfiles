#!/bin/bash

# CPU Temp

icon=~/.icons/dunst/thermometer_icon.png
title_fg="foreground='#E8E713'"
time="5000"
#temp="$(sensors | awk '/^Core /{++r; gsub(/[^[:digit:]]+/, "", $3); s+=$3} END{print s/(10*r) "°C"}')"
TEMP_c="$(acpi -t | awk '{ print int($4) }')"
TEMP_f="$(acpi -tf | awk '{ print $4 }')"
FANS="$(sensors | grep "fan" | awk '{ print $2 }')"

# Both are needed for the color output to work
echo "$TEMP_c°C"
echo "$TEMP_c°C"

# color
if [[ $TEMP_c -ge 60 ]]; then
    echo "#F2A272"
elif [[ $TEMP_c -ge 50 ]]; then
    echo "#FFFF48"
elif [[ $TEMP_c -ge 30 ]]; then
    echo "#05FFAF"
else
    echo "#FF4848"
fi


case $BLOCK_BUTTON in
    1) notify-send  -i $icon \
                    -t $time  \
    "<span $title_fg><u><b>CPU Temp Module</b></u></span>

 Avarge Core Temp...: $(echo $TEMP_c"°C") / $(echo $TEMP_f"°F")
 Fan .......: $(echo $FANS"(rpm's)")
" ;;
esac
