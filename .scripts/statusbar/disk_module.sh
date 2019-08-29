#!/bin/sh


icon=~/.icons/dunst/ssd-icon.png
title_fg="foreground='#E8E713'"
color_bg="string:bgcolor:#252732"
color_fg="string:fgcolor:#05ffaf"
time="10000"

filesystem="$(dfc)"
diskroot="$(dfc | grep '/')"
#diskhome="$(dfc | grep '/home')"
homeused="$(dfc | grep "/home" | awk '{print $3}')"
homefree="$(dfc | grep "/home" | awk '{print $4 `}')"

case $BLOCK_BUTTON in
    1) notify-send  -i $icon \
                    -h $color_fg \
                    -h $color_bg  \
                    -t $time  \
    "Disk Module

$filesystem"  ;;
esac

echo $homeused'/'$homefree
# DIR="${BLOCK_INSTANCE:-$HOME}"

# # color will turn red under this value (default: 10%)
# ALERT_LOW="${1:-10}"

# df -h -P -l "$DIR" | awk -v alert_low=$ALERT_LOW '
# /\/.*/ {
#     # full text
#     print $4

#     # short text
#     print $4

#     use=$5

#     exit 0
# }

# END {
#     gsub(/%$/,"",use)
#     if (100 - use < alert_low) {
#         # color
#         print "#FF0000"
#     }
# }
# '

