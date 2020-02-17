#!/usr/bin/bash
#xrandr -q
display=$(xrandr -q | grep ' connected' | head -n 1 | cut -d ' ' -f1)

echo $display
xrandr --output $display --brightness $1
