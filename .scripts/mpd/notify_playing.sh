#!/bin/sh

icon=~/.icons/dunst/music-icon.png
title_fg="foreground='#E8E713'"

notify-send -i $icon \
    "Now Playing

$(mpc --format "\n[[date: %date% \nArtist: %artist%] \nAlbum: %album% \nTrack: %title% \nLength: %time%\n" | grep -A 4 date)"
