#!/bin/bash

## This script restarts dunst and updates any dunstrc configuration changes.

pid=$(pidof dunst)

pidof dunst && killall dunst
dunst &

notify-send "Dunst Restarted: pid = $pid"

