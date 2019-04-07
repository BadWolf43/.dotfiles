#!/bin/sh

xrandr --setprovideroutputsource modesetting NVIDIA-0
xrandr --auto


[ -f ~/.Xmodmap ] && xmodmap ~/.Xmodmap
[ -f ~/.Xresources ] && xrdb -merge ~/.Xresources


## Start udiskie with tray icon
udiskie -s &
## Start i3 window manager
exec i3



# This might not be doing anything
# after the first 'exec' is ran the rest might be skipped.
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

## system audio bell
#set bell-style none
