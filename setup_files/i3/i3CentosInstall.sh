#!/usr/bin/env bash
echo "add EPEL repo"
sudo -c 'rpm -Uvh http://download.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-9.noarch.rpm'
echo "add COPRS repo"
sudo yum install -y dnf dnf-plugins-core
sudo dnf config-manager --add-repo https://copr.fedorainfracloud.org/coprs/admiralnemo/i3wm-el7/repo/epel-7/admiralnemo-i3wm-el7-epel-7.repo
echo "Make sure XORG is installed"
sudo yum groupinstall "X Window System" "Desktop" "Desktop Platform"
echo "install i3wm with status and fonts"
sudo yum install dejavu-sans-fonts dejavu-sans-mono-fonts dejavu-serif-fonts i3 i3status 
echo "start GUI and make default"
sudo systemctl isolate graphical.target
#uncomment to make above default. Should be default without having to do this.
#sudo systemctl set-default graphical.target
echo "installing python customization to i3 status"
sudo yum install py3status
echo "install background manager"
sudo yum install feh

echo "installing power manager"
sudo yum install xfce4-power-manager
cp -r ./i3 ~/.config/
