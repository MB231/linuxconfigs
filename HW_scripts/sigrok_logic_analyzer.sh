#!/bin/bash 
echo "installing saleae logic analyzer firmware"
sudo dnf install sigrok-firmware-fx2lafw
echo "installing sigrock command line interface"
sudo dnf install sigrok-cli
echo "installin sirok gui /"PulseView/""
sudo dnf install pulseview
