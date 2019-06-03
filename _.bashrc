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
