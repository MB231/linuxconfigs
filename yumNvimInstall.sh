#!/usr/bin/env bash
echo "adding python dependencies for plugvim and nvim"

echo "do not run sudo script will ask as required"
#yum will not install any package past a fail. Seperate lines to debug install fail point
sudo yum install epel-release #necessary before nvim install
sudo yum install make
sudo yum install automake
sudo yum install libtool
sudo yum install python-pip

#python 3 not available standard on centos7 used https://janikarhunen.fi/how-to-install-python-3-6-1-on-centos-7
#to install 3.6 without disturbing python2 and it's pip. must call with python3.6 until alias and set
# g:python3_host_prog to usr/bin/python3.6
sudo yum install yum-utils
sudo yum groupinstall development
sudo yum install https://centos7.iuscommunity.org/ius-release.rpm
sudo yum install python36u
sudo yum install python36u-devel
#uses command sub $(command) to check if python 2 is still called by python command

sudo yum install neovim
sudo pip install --upgrade neovim #remember to us :UpdateRemotePlugins in nvim
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
sudo yum install pkg-config
sudo yum install autoconf
echo "packcc install and compile from git"
cd ~
git clone https://github.com/Leandros/PackCC.git
cd PackCC
gcc -o packcc src/packcc.c
sudo cp packcc /usr/bin/
echo "installing universal ctags from git"
cd ~
git clone https://github.com/universal-ctags/ctags.git
cd ctags
# configure --prefix=/where/you/want # defaults to /usr/local 
# make install requires root to put files in /usr/bin
./autogen.sh
./configure
make
sudo make install

cp ~/linuxconfigs/init.vim ~/.config/nvim
python -V
python3.6 -V
echo "\n\n\nremember to add init.vim to ~/.config/nvim and use :UpdateRemotePlugins in nvim for python modules"
echo "Also use PlugInstall! to install in in nvim and check python 2 is still installed correctly"
