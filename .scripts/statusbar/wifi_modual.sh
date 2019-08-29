#!/bin/bash

#------------------------------------------------------------------------
if [[ -z "$INTERFACE" ]] ; then
    INTERFACE="${BLOCK_INSTANCE:-wlp0s20f3}"
fi
#------------------------------------------------------------------------

# As per #36 -- It is transparent: e.g. if the machine has no battery or wireless
# connection (think desktop), the corresponding block should not be displayed.
[[ ! -d /sys/class/net/${INTERFACE}/wireless ]] && exit

# If the wifi interface exists but no connection is active, "down" shall be displayed.
if [[ "$(cat /sys/class/net/$INTERFACE/operstate)" = 'down' ]]; then
    echo "down"
    echo "down"
    echo "#FF0000"
    exit
fi

#------------------------------------------------------------------------
icon=$HOME/.icons/dunst/wifi-icon.png
title_fg="foreground='#E8E713'"
TEMP="$(sensors | grep -A 2 "iwlwifi" | grep "temp" | awk '{print $2}')"
SSID="$(iw dev wlp0s20f3 link | grep SSID | cut -d " " -f 2-)"
IP="$(ip addr show wlp0s20f3 | grep "inet "| awk '{ print $2 }')"
SIGNAL="$(iw dev wlp0s20f3 link | grep signal | cut -d " " -f 2-)"
QUALITY=$(grep $INTERFACE /proc/net/wireless | awk '{ print int($3 * 100 / 70) }')
BANDWIDTH="$(.scripts/statusbar/get-bandwidth)"
#LAN_USBC1="ip addr show ens20u1 | grep "inet "| awk '{ print ": " $2 }'"
#LAN_THINKPAD="ip addr show enp0s31f6 | grep "inet "| awk '{ print ": " $2 }'"

#------------------------------------------------------------------------

echo $QUALITY% $BANDWIDTH
echo $QUALITY% $BANDWIDTH

# color
if [[ $QUALITY -ge 70 ]]; then
    echo "#839496"
elif [[ $QUALITY -ge 60 ]]; then
    echo "#FFFF48"
elif [[ $QUALITY -ge 50 ]]; then
    echo "#FF9228"
else
    echo "#FF4848"
fi

# ~/.icons/dunst/wifi-circle-icon.png
# 1) notify-send -u normal 
case $BLOCK_BUTTON in
    1) notify-send  -i $icon \
                    -t 9000  \
    "WiFi Module

 Bandwidth...: $(echo $BANDWIDTH)
 Strength....: $(echo $QUALITY%)
 SIGNAL......: $(echo $SIGNAL)
 SSID........: $(echo $SSID)
 IP..........: $(echo $IP)
 Adapter Temp: $(echo $TEMP) 🌡️
"  ;;
esac

