#!/usr/bin/bash

#change settings. Never works left for reference
#exec  xset s off
#exec  xset -dpms
#exec  xset s noblank

#for the current session

xset s off || echo "fail to set screensaver off"
xset -dpms || echo "fail to set energy star power off"
xset s noblank || echo "fail to set blank screen off"
