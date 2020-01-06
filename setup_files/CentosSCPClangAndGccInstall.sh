#!/usr/bin/env bash

#installs the software collections library which allows switch ing between 
#multiple software versions on the same machine with "scl enable llvm-toolset-7 bash"
echo "Installing and enabling Clang 5"
sudo yum install centos-release-scl
sudo yum install llvm-toolset-7
sudo yum install llvm-toolset-7-clang-tools-extra
sudo yum install llvm-toolset-7-llvm-devel
scl enable llvm-toolset-7 bash
echo "Installing and enabling GCC 7"
sudo yum install devtoolset-7
scl enable devtoolset-7 bash
gcc --version
echo "not enabled by default"
echo "should state \"gcc (GCC) 8.2.1 20180905 (Red Hat 8.2.1-3)\" if gcc8 was installed"
echo "gcc8 is commented out by default"
clang --version
echo "should state \"clang version 6.0.1 (tags/RELEASE_601/final)\" if clang6 is installed"
echo "Optionally permanently enable by adding line below to .bashrc"
echo "source scl_source enable llvm-toolset-7"
