#!/usr/bin/bash
#Change to different version if desired
VERSION=2.6

#Uncomment to install dependencies for build
#sudo apt-get -y remove tmux
#sudo apt-get -y install wget tar libevent-dev libncurses-dev
#CENTOS7
#sudo yum -y remove tmux
#sudo yum -y install wget tar libevent-devel ncurses-dev

echo "downloading latest tmux and untar/rm it"
wget https://github.com/tmux/tmux/releases/download/${VERSION}/tmux-${VERSION}.tar.gz
tar xf tmux-${VERSION}.tar.gz
rm -f tmux-${VERSION}.tar.gz

echo "Killing any active tmux then building and installing to /usr/local/src"
#must kill all running instances before install
#sudo killall -9 tmux

cd tmux-${VERSION}
./configure
make
#sudo make install
#cd -
#sudo rm -rf /usr/local/src/tmux-\*
#sudo mv tmux-${VERSION} /usr/local/src
