#!/usr/bin/env bash

#instals the software collections library which allows switch ing between 
#multiple software versions on the same machine with "scl enable llvm-toolset-7 bash"
sudo yum install centos-release-scl
sudo yum install llvm-toolset-7
sudo yum install llvm-toolset-7-clang-tools-extra
sudo yum install llvm-toolset-7-llvm-devel
scl enable llvm-toolset-7 bash
echo "should state \"gcc (GCC) 8.2.1 20180905 (Red Hat 8.2.1-3)\" if gcc8 was installed"
echo "gcc8 is commented out by default"
clang --version
echo "should state \"clang version 6.0.1 (tags/RELEASE_601/final)\" if clang6 is installed"
echo "Optionally permanently enable by adding line below to .bashrc"
echo "scl enable llvm-toolset-7 bash"
