# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
alias python3="python3.6"
#alias doesn't work, dir is appended to ls command if used.
cdl () { cd "$@" && ls -a; }

alias cmake="cmake3"
#scl enable for llvm don't use "scl enable llvm-toolset-7 bash" except on CLI
#Remove this line to disable and restart bash. no current command for that 6/2019
#source scl_source enable llvm-toolset-7
#gcc8 required now
source scl_source enable devtoolset-8

alias testit="make clean;make;./build/test"
alias buildit="rm -rf build;mkdir build;cd build;cmake3 ../ && make -j3"
#alias buildit="rm -rf build;mkdir build;cd build;cmake3 ../ -DCMAKE_BUILD_TYPE=Release -DCMAKE_CXX_FLAGS="-pthread"&& make -j3"
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

export PATH="$HOME/nvim/bin:$PATH"

export TERMINAL=xfce4-terminal

if [[ "$SSH_AUTH_SOCK" = "" ]]; then
    # on the first round, we do this...
    exec ssh-agent bash
    # start the ssh agent
else
    # ... and when ssh-agent is running, we do this instead.
    ssh-add
    # add keys to the agent
fi

#Turns off the screen saver and power saving features associated with X11
xset s off
xset -dpms
