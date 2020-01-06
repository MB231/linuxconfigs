#!/usr/bin/env bash

#get cpt.py from: wget https://raw.githubusercontent.com/root-project/cling/master/tools/packaging/cpt.py
./cpt.py --check-requirements && ./cpt.py --create-dev-env Debug --with-workdir=./cling-build/
