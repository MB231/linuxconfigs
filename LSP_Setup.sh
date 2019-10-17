#!/usr/bin/env bash
mkdir temp
pushd ./temp
cmake3 -DCMAKE_EXPORT_COMPILE_COMMANDS=ON ../
mv compile_commands.json ../
popd
rm -rf ./temp
