#!/bin/sh

# Close ncmpcpp and polybar

#      

case "$1" in
    --toggle)
        if [ "$(pgrep -x polybar)" ]; then
            pkill ncmpcpp &
            pkill polybar
        fi
        ;;
    *)
        if [ "$(pgrep -x ncmpcpp)" ]; then
            echo " "
        fi
        ;;
esac
