#!/usr/bin/env bash

## Close ncmpcpp & polybar/mpd

# Terminate already running bar instances
mpc stop
killall -q polybar ncmpcpp

# Wait until the processes have been shut down
#while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done


# Start Polybar/mpd
#polybar mpd &
#urxvt -e ncmpcpp

echo "ncmpcpp & bar/mpd closed...."

