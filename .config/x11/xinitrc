#!/bin/sh

if (xrandr | grep "HDMI1 disconnected"); then
  xlayoutdisplay -p eDP1
else
  xlayoutdisplay -p HDMI1 -o HDMI1
  xrandr --output eDP1 --off
fi

setxkbmap -rules evdev -model evdev -layout us -variant intl
hsetroot -solid "#44475a"

exec bspwm
