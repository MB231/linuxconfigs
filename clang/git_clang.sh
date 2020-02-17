#!/usr/bin/env bash

echo -e "Ensure you have at least GCC 5.1 enabled"
echo -e "git cloning from llvm repo and placing each in llvm dir"
git clone https://github.com/llvm-mirror/llvm llvm
git clone https://github.com/llvm-mirror/clang llvm/tools/clang
git clone https://github.com/llvm-mirror/clang-tools-extra llvm/tools/clang/tools/extra
git clone https://github.com/llvm-mirror/compiler-rt llvm/projects/compiler-rt
git clone https://github.com/llvm-mirror/libcxx llvm/projects/libcxx
git clone https://github.com/llvm-mirror/libcxxabi llvm/projects/libcxxabi
git clone https://github.com/llvm-mirror/lld llvm/tools/lld

echo -e "making build dir and running cmake"
mkdir build
pushd ./build
cmake3 -DCMAKE_BUILD_TYPE=Release ../llvm
make -j3
sudo cmake3 --build . --target install
popd

echo -e "use make -j<# of proc> to compile"
