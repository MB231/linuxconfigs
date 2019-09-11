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

#scl enable for llvm don't use "scl enable llvm-toolset-7 bash" except on CLI
#Remove this line to disable and restart bash. no current command for that 6/2019
#9-9-19 compiled and deployed latest clang so no more scl
#source scl_source enable llvm-toolset-7

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
