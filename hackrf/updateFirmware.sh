#!/usr/bin/env bash

#Script to flash firmware of Hack RF/Portapack

handle_help() {
    echo "USE: updateFirmware.sh [mode]"
    echo -e "modes:\nhackrf- Update hackrf only \n"
    echo -e "havoc - update hackRF and portapack with havoc FW "
    echo -e "Make sure portapack_h1_havoc.bin from havoc is in firmware_bin dir \n"
    echo -e "portapack - update hackRF and portapack with vanilla FW"
    echo -e "Make sure portapack_h1_firmware.bin from portapack is in firmware_bin dir \n"


    return $1
}

#update hackRF One only
handle_hackRF() {
echo "updating HackRF One FW then CPLD FW-No Portapack Update"
echo "Run from untared directory"
#below only works if dfu version has been used before
#dfu version(hold dfu button on startup of HackRF) works every time
#dfu-util --device 1fc9:000c --alt 0 --download hackrf_one_usb.dfu
hackrf_spiflash -w firmware_bin/hackrf_one_usb.bin
#cpld is done this way not dfu
hackrf_cpldjtag -x firmware/cpld/sgpio_if/default.xsvf
}

#Update Portapack equiped HackRF One
handle_portaPackVanilla() {
echo "updating HackRF One with Portapack"
echo "Make sure portapack_h1_firmware.bin from portapack is in firmware_bin dir"
dfu-util --device 1fc9:000c --download firmware_bin/hackrf_one_usb.dfu --reset
hackrf_spiflash -w firmware_bin/portapack-h1-firmware.bin
echo -e "If blank screen on startup may be in dead mode. Needs Up,Down,Left, Right, Center"
}

#Update Portapack equiped HackRF One with Havoc FW
handle_portaPackHavoc() {
echo "updating HackRF One with Portapack as Havoc FW"
echo "Make sure portapack_h1_havoc.bin from havoc is in firmware_bin dir"
dfu-util --device 1fc9:000c --download firmware_bin/hackrf_one_usb.dfu --reset
hackrf_spiflash -w firmware_bin/portapack-h1-havoc.bin
echo -e "If blank screen on startup may be in dead mode. Needs Up,Down,Left, Right, Center"
}

handle_error(){
echo "Error"
}

#handle no arguments given
if [ $# -eq 0 ] ; then
    handle_help
    exit 0
fi

#handle given arguments
for var in "$@"
do
    case $var in
        --help|-h)
            handle_help 0
            exit 0
            ;;

        portapack)
            handle_portaPackVanilla
            exit $?
            ;;

        havoc)
            handle_portaPackHavoc
            exit $?
            ;;

        hackrf)
            handle_hackRF
            exit $?
            ;;

        *)
            handle_error
            exit 1
            ;;
    esac
done
