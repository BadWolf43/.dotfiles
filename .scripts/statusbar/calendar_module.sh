#!/bin/bash


icon=~/.icons/dunst/calendar-icon.png
title_fg="foreground='#E8E713'"
color_bg="string:bgcolor:#252732"
color_fg="string:fgcolor:#05ffaf"

DATEFMT="$(date +%a/%m/%d/%y) "
TIMEFMT="$(date +%l:%M%p)"

today=`date '+%e'`
time="5000"
calendar="$(cal -m)"

case $BLOCK_BUTTON in
    1) notify-send  -i $icon \
                    -t $time  \
                    -h $color_fg \
                    -h $color_bg  \
    "<span $title_fg><u><b>Calendar Module</b></u></span>

$calendar" ;;
esac

# Status bar clock
echo $DATEFMT  $TIMEFMT