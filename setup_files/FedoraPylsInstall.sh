#!/usr/bin/env bash
echo "installing JEDI, pyls dependency for vim linkup"
sudo python -m pip install jedi
echo "install development libraries for python"
sudo python -m pip install python-devel
echo "installing pyls and all options"
sudo python -m pip install python-language-server[all]
