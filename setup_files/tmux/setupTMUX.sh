#!/usr/bin/bash

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
cp ./_.tmux.conf ~/.tmux.conf
cp ./_.bash_profile ~/.bash_profile
echo "Ensure you use prefix + I to install all packages"
