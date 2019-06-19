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
sudo yum install python36u-pip
#uses command sub $(command) to check if python 2 is still called by python command

sudo yum install neovim
sudo pip install --upgrade neovim #remember to us :UpdateRemotePlugins in nvim
sudo pip3.6 install --upgrade neovim #for 3.6 version python as well
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

echo "Installing Nodejs, NVM and Yarn for COC plugin"
echo "Requires gcc and make"
curl -sL https://rpm.nodesource.com/setup_10.x | sudo -E bash -
sudo yum install nodejs
sudo npm install yarn -g

#using cquery ccls cannot get clang directory for compiler
#echo "Installing ccls"
#pushd .
#git clone --depth=1 --recursive https://github.com/MaskRay/ccls
#cd ccls
#cmake3 -H. -BRelease -DCMAKE_BUILD_TYPE=Release -DCMAKE_PREFIX_PATH=/path/to/clang+llvm-xxx
#cmake3 --build Release
#popd

#using vim-lsp with clangd, but this is viable option.
#COMPILER MUST BE CHANGED TO CLANG 5 OR GCC 6 and above
#echo "Installing ccls REMEMBER TO CHANGE COC JSON CONFIG"
#pushd .
#git clone --recursive https://github.com/cquery-project/cquery.git
#cd cquery
#git submodule update --init
#mkdir build && cd build
#cmake3 .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=release -DCMAKE_EXPORT_COMPILE_COMMANDS=YES  -D CMAKE_C_COMPILER=/opt/rh/llvm-toolset-7/root/usr/bin/clang -D CMAKE_CXX_COMPILER=/opt/rh/llvm-toolset-7/root/usr/bin/clang++
#cmake3 --build .
#cmake3 --build . --target install

cp ~/linuxconfigs/nvim/init.vim ~/.config/nvim
cp ~/linuxconfigs/nvim/config/* ~/.config/nvim/
python -V
python3.6 -V

echo "\n\n\nremember to add init.vim to ~/.config/nvim and use :UpdateRemotePlugins in nvim for python modules"
echo "Also use PlugInstall! to install in in nvim and check python 2 is still installed correctly"
