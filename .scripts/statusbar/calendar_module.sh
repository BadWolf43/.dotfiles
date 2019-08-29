#!/bin/bash


icon=~/.icons/dunst/calendar-icon3.png
title_fg="foreground='#E8E713'"
DATEFMT="$(date +%a/%m/%d/%y) "
TIMEFMT="$(date +%l:%M%p)"

today=`date '+%e'`
time="5000"
calendar="$(cal -m)"

case $BLOCK_BUTTON in
    1) notify-send  -i $icon \
                    -t $time  \
    "Calendar Module

$calendar" ;;
esac

# Status bar clock
echo $DATEFMT  $TIMEFMT

# case $BLOCK_BUTTON in
#     1) notify-send  -i $icon \
#                     -t $time  \
#     "<span $title_fg><u><b>Calendar Module</b></u></span>

# $calendar" ;;
# esac