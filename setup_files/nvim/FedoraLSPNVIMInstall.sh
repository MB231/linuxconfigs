#!/usr/bin/env bash
echo "do not run sudo script will ask as required"
#yum will not install any package past a fail. Seperate lines to debug install fail point
sudo dnf install make
sudo dnf install automake
sudo dnf install cmake
sudo dnf install clang
#pip3 installs with python37 package
sudo dnf install python37
sudo dnf install python37-devel
sudo pip3 install --upgrade neovim #remember to us :UpdateRemotePlugins in nvim
#Install nightly neovim
sudo dnf copr enable agriffis/neovim-nightly
#only install python3 support use python{2,3} for both
sudo dnf install -y neovim python3-neovim
#Install rust and rust analyzer
sudo dnf copr enable robot/rust-analyzer
sudo dnf install -y rust cargo rust-analyzer

#move and create ~/.local/share/nvim/site/autoload to add plug.vim
cd ~/.local/share
mkdir -p nvim/site/autoload
cd nvim/site/autoload
#retrieves plug.vim instead of cloning whole git
wget https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
#creates init.vim director since ubuntu does not have $XDG.CONFIG_HOME defined
#so it doesn't create a default init.vim on install
mkdir ~/.config/nvim


#no longer using COC but node is good to have
echo "Installing Nodejs, NVM and Yarn for plugins"
sudo dnf module install nodejs:12 #install nodejs 12 (pyright min)
#Alternate method, but only sudo is updated
#sudo npm install -g n #installs nodejs via npm
#sudo n <stable,latest, version #> #define release to use
sudo npm install yarn -g

echo "installing python palantir LSP dependencies"
sudo pip install -U setuptools 
echo "Installing JEDI"
sudo pip install jedi
echo "Installing pyright python language server"
sudo npm install -g pyright
echo "Installing pynvim to interface neovim with deoplete-jedi"
sudo pip install pynvim
echo "Installing flake8"
sudo pip install flake8

echo "Installing node js support neovim"
sudo npm install -g neovim


echo "Moving config files over to ~/.config/nvim/"
cp -r ~/linuxconfigs/setup_files/nvim/nvim_LSP_Config/* ~/.config/nvim/
