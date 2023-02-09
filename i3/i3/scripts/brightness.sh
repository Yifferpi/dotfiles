#! /bin/bash

current=$(xrandr --current --verbose | grep "Brightness:" | cut -d " " -f2)
step=0.1

if [ $1 = "up" ]; then
    newval=$(echo "$current+$step" | bc)
    xrandr --output eDP-1 --brightness "$newval"
fi
if [ $1 = "down" ]; then
    newval=$(echo "$current-$step" | bc)
    xrandr --output eDP-1 --brightness "$newval"
fi
