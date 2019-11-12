#!/usr/bin/env bash
#put loop for all of llvm9 repos, until then place in each directory and run
#tar -xvf llvm-9.0.0.src.tar.xz
#cd llvm-9.0.0.src
mkdir build
cd build
cmake3 -DCMAKE_BUILD_TYPE=Release ../
make -j3
sudo cmake3 --build . --target install

