#!/usr/bin/env bash
sudo systemctl mask sleep.target suspend.target hibernate.target hybrid-sleep.target
#Above is equivalent to this below which will not run the service even to satisfy dependecies
#$ sudo ln -s /dev/null /etc/systemd/system/httpd.service
#This links the service file to the nothing file so even if called as a dependency it cannot start

#Systemd will start a service even if disabled IF it's a dependency of another service
#Start and Stop controls a service only for that instance and will also be started if a dependency

#To enable sleep/hibernate/hybrid-sleep
#sudo systemctl unmask sleep.target suspend.target hibernate.target hybrid-sleep.target

#From unix.stackexchange
#If you just want to prevent suspending when the lid is closed you can set the following options in /etc/systemd/logind.conf:

#[Login]
#HandleLidSwitch=ignore
#HandleLidSwitchDocked=ignore
#restart the service or reboot your machine

#systemctl restart systemd-logind.service
