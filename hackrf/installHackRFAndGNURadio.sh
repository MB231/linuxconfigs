#!/usr/bin/env bash

#Script to install GNU radio in Fedora
sudo dnf update
sudo dnf install xterm #needed for gnu radio wt gui
sudo dnf install gnuradio
sudo dnf install gr-osmosdr # install hackRF One for gnuradio
sudo dnf install gqrx
