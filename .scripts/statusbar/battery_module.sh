#!/bin/sh


icon=~/.icons/dunst/battery-icon.png
title_fg="foreground='#E8E713'"
time="10000"
tlp="$(sudo tlp-stat -b)"
charge="$(sudo tlp-stat -b | grep "Charge" | awk '{print substr($3,1, length($3)-2)}')"



# Both are needed for the color output to work
echo $charge'%'
echo $charge'%'

# color F2A272 FF9228
if [[ $charge -ge 80 ]]; then
    echo "#05FFAF"
elif [[ $charge -ge 50 ]]; then
    echo "#FFFF48"
elif [[ $charge -ge 30 ]]; then
    echo "#FF9228"
else
    echo "#FF4848"
fi


case $BLOCK_BUTTON in
    1) notify-send  -i $icon \
                    -t $time  \
    "<span $title_fg><u><b>Battery Module</b></u></span>

$tlp" ;;

esac
