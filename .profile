#!/bin/sh
# .profile file runs at login
#                                .d888 d8b 888
#                               d88P"  Y8P 888
#                               888        888
#      88888b.  888d888 .d88b.  888888 888 888  .d88b.
#      888 `88b 888P'  d88--88b 888    888 888 d8P  Y8
#      888  888 888    888  888 888    888 888 8888888
#  d8b 888 d88P 888    Y88__88P 888    888 888 Y8b
#  Y8P 88888P'  888     `Y88P"  888    888 888  `Y8888
#      888
#      888
#      888
#-------------------------------------------------------
# - Anything related to 'Graphical Applications' or '.sh'
#   MUST go in this file.
# - All 'Enviorment Variables' go in thie file.
#-------------------------------------------------------

## Enviorment variables
## Adds `~/.scripts` and all subdirectories to $PATH
export PATH="$PATH:$HOME/.scripts/"
export VISUAL="nano"
export EDITOR="nano"
export TERMINAL="urxvt"
export CALCULATOR="speedcrunch"
export BROWSER="vivaldi"
#export READER="zathura"
#export FILE="ranger"
export FILE="thunar"
# VLC scaling fix
export QT_AUTO_SCREEN_SCALE_FACTOR=1

## less/man colors
export LESS=-R
export LESS_TERMCAP_mb=$'\E[1;31m'     # begin bold
export LESS_TERMCAP_md=$'\E[1;36m'     # begin blink
export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
export LESS_TERMCAP_so=$'\E[01;44;33m' # begin reverse video
export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
export LESS_TERMCAP_ue=$'\E[0m'        # reset underline

#[ ! -f ~/.shortcuts ] && shortcuts >/dev/null 2>&1
#echo "$0" | grep "bash$" >/dev/null && [ -f ~/.bashrc ] && source "$HOME/.bashrc"

## Source ~/.bashrc
[ -f ~/.bashrc ] && source ~/.bashrc

# Start graphical server if i3 not already running.
[ "$(tty)" = "/dev/tty1" ] && ! pgrep -x i3 >/dev/null && exec startx

## Setting the screen resolution
#~/.scripts/screenlayout/resolution_2560x1440.sh
#NOT THIS ONE exec xrandr --output eDP1 --primary --mode 2560x1440 --pos 0x0 --rotate normal

## Setting the Wallpaper
#exec feh --bg-scale ~/Documents/Wallpapers/2560x1440/a-poisoned-world_2560x1440.jpeg
