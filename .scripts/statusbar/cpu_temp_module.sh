#!/bin/bash

# CPU Temp Module (Lenovo laptop MAX temp=82c)

icon=~/.icons/dunst/thermometer_icon.png
title_fg="foreground='#E8E713'"
time="10000"
#temp="$(sensors | awk '/^Core /{++r; gsub(/[^[:digit:]]+/, "", $3); s+=$3} END{print s/(10*r) "°C"}')"
TEMP_c="$(acpi -t | awk '{ print int($4) }')"
TEMP_f="$(acpi -tf | awk '{ print $4 }')"
FANS="$(sensors | grep "fan" | awk '{ print $2 }')"
FAN_i="🌀"
#   ﴛ

# 2 echos are needed for the color output to work
if [ $FANS -ge 1 ]; then
    echo "$TEMP_c°C $FAN_i $FANS RPMs"
    echo "$TEMP_c°C $FAN_i $FANS RPMs"
else
    echo "$TEMP_c°C"
    echo "$TEMP_c°C"
fi


# #05FFAF
if [[ $TEMP_c -ge 70 ]]; then
    echo "#FF4848"
elif [[ $TEMP_c -ge 60 ]]; then
    echo "#FF9228"
elif [[ $TEMP_c -ge 50 ]]; then
    echo "#FFFF48"
else
    echo "#839496"
fi


case $BLOCK_BUTTON in
    1) notify-send  -i $icon \
                    -t $time  \
    "CPU Temp Module

 Avarge Core Temp...: $(echo $TEMP_c"°C") / $(echo $TEMP_f"°F")
 Fan .......: $(echo $FANS"(rpm's)")
" ;;
esac
