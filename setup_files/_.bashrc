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

alias buildit="mkdir build;cd build;cmake3 ../ && make -j3"
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
