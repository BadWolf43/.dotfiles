#!/bin/sh


icon=~/.icons/dunst/battery-icon.png
title_fg="foreground='#E8E713'"
color_bg="string:bgcolor:#252732"
color_fg="string:fgcolor:#05ffaf"
time="5000"
tlp="$(sudo tlp-stat -b)"

case $BLOCK_BUTTON in
    1) notify-send  -i $icon \
                    -h $color_fg \
                    -h $color_bg  \
                    -t $time  \
    "<span $title_fg><u><b>Battery Module</b></u></span>

$tlp" ;;

esac