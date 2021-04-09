#!/usr/bin/env bash
enable_compiler() {
    #use both -dumpfullversion and -dumpversion because at some point gcc -dumpversion only prints the major version
    #https://stackoverflow.com/questions/45168516/gcc-7-1-1-on-fedora-26-dumpversion-now-only-includes-major-version-by-default
    gcc_version=$(gcc -dumpfullversion -dumpversion)
    echo "Detected GCC version ${gcc_version}"
    expected_version="9"
    if [ "$(printf '%s\n' "$expected_version" "$gcc_version" | sort -V | head -n1)" = "$gcc_version" ]; then
        #current version is too low. Attempt to enable devtoolset-9
        echo "Default gcc version detected is too low. Attempting to enable devtoolset-9..."
        source /opt/rh/devtoolset-9/enable
        if [ "$?" != "0" ]
        then
            #Print that there was an error, but allow program to procede
            echo "!!! Failed to enable devtoolset-9 !!!"
        fi;
    fi
}
mkdir temp
pushd ./temp
enable_compiler
cmake3 -DCMAKE_EXPORT_COMPILE_COMMANDS=ON ../
mv compile_commands.json ../
popd
rm -rf ./temp
