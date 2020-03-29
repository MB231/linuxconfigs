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
