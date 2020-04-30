# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
BLINKA_FT232H=1

alias testit="make clean;make;./build/test"
alias buildit="mkdir build;cd build;cmake3 ../ && make -j3"
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
