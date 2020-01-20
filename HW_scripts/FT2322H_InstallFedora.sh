#!/bin/bash
echo "install development libararies for python3"
sudo dnf install python3-devel
echo "installing libusb (dependency of FTDI)"
sudo dnf install libusb
echo "copying 11-ftdi.rules to /etc/udev/rules.d/"
sudo cp ./11-ftdi.rules /etc/udev/rules.d/
echo "installing python library for ftdi use"
sudo pip3 install pyftdi
echo "installing adafruit blinka for circuit python API"
sudo pip3 install adafruit-blinka
echo "setting blinka environmental variable"
echo "BLINKA_FT232H=1" >> ~/.bashrc
echo "Creating group plugdev and adding $USER to group"
sudo groupadd plugdev
sudo usermod -aG plugdev $USER
