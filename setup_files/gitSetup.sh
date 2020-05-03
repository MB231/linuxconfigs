#!/usr/bin/env bash
git config --global user.name "mb231"
git config --global user.email m231@n.com
git config --global core.editor nvim

# use if changing to nvim for diffs. Vimdiff3 generates script for using vim/nvim for diffs.
#not that useful as highlights organization not as good as commandline yet. Keep default.
#git config --global diff.tool vimdiff3
#git config --global difftool.vimdiff.path nvim
#git config --global merge.tool vimdiff3
#git config --global mergetool.vimdiff.path nvim

#for log and diff outputs
#git config --global core.pager 'nvim'
