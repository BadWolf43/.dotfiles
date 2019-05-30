#!/bin/sh
# Syncs repositories and downloads updates, Runs as a cronjob.

time="10000"

ping -q -c 1 8.8.8.8 > /dev/null || exit

notify-send -t $time "📦 Downloading pacakge updates..."

sudo pacman -Syyuw --noconfirm || notify-send "Error downloading updates.

Check your internet connection, if pacman is already running, or run update manually to see errors."
pkill -RTMIN+8 i3blocks

if pacman -Qu | grep -v "\[ignored\]"
then
    notify-send "🎁 Package updates available. Click statusbar icon (📦) to install."
else
    notify-send "👍 Repository sync complete. No new packages."
fi
