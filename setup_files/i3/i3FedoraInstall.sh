#!/usr/bin/env bash
echo "Installing i3 window manager no fonts or extra dependencies needed in Fedora"
sudo dnf install i3
echo "Python Status Bar install"
sudo dnf install py3status
echo "feh image viewer install"
sudo dnf install feh
echo "pavucontrol for audio control install"
sudo dnf install pavucontrol
echo "copy config file to user config area"
cp ./config ~/.config/i3/config
echo "installing power manager"
sudo dnf install xfce4-power-manager
#sets gnome privacy lock screen and screensaver to off. Will blank screen after 10 minutes if on
gsettings set org.gnome.desktop.screensaver lock-enabled 'false'
gsettings set org.gnome.desktop.lockdown disable-lock-screen 'false'
#use below to check settings
#gsettings get org.gnome.desktop.screensaver lock-enabled 'false'
#gsettings get org.gnome.desktop.lockdown disable-lock-screen 'false'
echo "change settings for screen timeout"
exec --no-startup-id xset s off
exec --no-startup-id xset -dpms
exec --no-startup-id xset s noblank


echo "for the current session"

xset s off && xset -dpms && xset s noblan
