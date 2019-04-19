#!/bin/sh

# Notify me with notify-send if my battery is below 20%.
# set with crontab -e

[ "$(cat /sys/class/power_supply/BAT0/status)" = "Charging" ] && exit
[ "$(cat /sys/class/power_supply/BAT0/capacity)" -lt 20 ] &&
export DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus &&
notify-send -u critical "Battery critically low."
