#!/usr/bin/env bash
echo "adding repo and installing neovim"
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt-get update
sudo apt-get install neovim
echo "adding python dependencies for plugvim and nvim"
sudo apt-get install python-dev python-pip python3-dev python3-setuptools
pip install --upgrade neovim #remember to us :UpdateRemotePlugins in nvim
#move and create ~/.local/share/nvim/site/autoload to add plug.vim
cd
cd .local/share
mkdir -p nvim/site/autoload
cd nvim/site/autoload
#retrieves plug.vim instead of cloning whole git
wget https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
#creates init.vim director since ubuntu does not have $XDG.CONFIG_HOME defined
#so it doesn't create a default init.vim on install
cd
cd .config
mkdir nvim
echo " pkg-config and autoconf packages needed to install ctag plugins"
sudo apt-get install pkg-config
sudo apt-get install autoconf
echo "packcc install and compile from git"
cd ~
git clone https://github.com/Leandros/PackCC.git
cd packcc
gcc -o packcc src/packcc.c
sudo cp packcc /usr/bin/
echo "installing universal ctags from git"
cd ~
git clone https://github.com/universal-ctags/ctags.git
cd ctags
# configure --prefix=/where/you/want # defaults to /usr/local 
# make install requires root to put files in /usr/bin
./autogen.sh || ./configure || make || sudo make install

echo "remember to add init.vim to ~/.config/nvim and use :UpdateRemotePlugins in nvim for python modules"
echo "Also use PlugInstall! to install in in nvim"
