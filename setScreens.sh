#!/usr/bin/bash

function turnScreenFeaturesOff {
    echo "Turning screen saver and energy star features off"
    xset s off
    xset -dpms
    # for screensaver on, but no blank of screen. For ref only
    #xset s noblank
}

function changeBrightness {
    # $1 is brightness to set and $2 is the display to set if desired
    if [ "$2" = "" ]
    then
        displays=$(xrandr -q | grep ' connected' | cut -d ' ' -f1)
    else
        displays="$2"
    fi

    for i in $displays
    do
        echo "Changing display $i to $1"
        xrandr --output $i --brightness $1
    done
}
# main control switch
for command in "$@"
do
    case $command in

        # specific display to change brightness
        -d=*|--display=*)
            display="${command#*=}"
            ;;

        # specific brightness
        -db=*|--displaybrightness=*)
            brightness="${command#*=}"
            ;;

        # change brightness for all monitors
        -b=*|--brightness=*)
            brightness="${command#*=}"
            changeBrightness $brightness
            ;;

        # change display to right of given display (with -d)
        -r=*|--rightof=*)
            rightof="${command#*=}"
            ;;

        # change display to left of given display (with -d)
        -l=*|--leftof=*)
            leftof="${command#*=}"
            ;;

        # change display to above of given display (with -d)
        -a=*|--above=*)
            above="${command#*=}"
            ;;

        # change display to under given display (with -d)
        -u=*|--under=*)
            below="${command#*=}"
            ;;

        # rotate display given (with -d)
        -rot=*|--rotate=*)
            rotate="${command#*=}"
            ;;

        # disable screensaver/energy star features
        -s|--screensaver)
            turnScreenFeaturesOff
            ;;

        # print displays, matches disconnected and connected
        -pd|--printdisplays)
            xrandr | grep connected
            ;;

         -h|--help)
            echo "use -pd to get all displays connected or disconnected"
            echo "-d|--display <display> -db|--displaybrightness <change brightness of display>"
            echo "-b|--brightness <change brightness of all display>"
            echo "brightness from 0-1"
            echo "-d|--display <display> -rot|--rotate <rotate display left, right, inverted, normal>"
            echo "-d|--display <display to place> -l|--leftof <place left of this display>"
            echo "-d|--display <display to place> -r|--rightof <place right of this display>"
            echo "-d|--display <display to place> -a|--above <place above this display>"
            echo "-d|--display <display to place> -u|--below <place below this display>"
            echo "-s|--screensaver to turn off screensaver and power saver settings to prevent blank screen"
            ;;
        *)
            ;;
    esac
done
#Multi Input commands
# run command if display and brightness set
if [ -v display ] && [ -v brightness ]; then
    changeBrightness $brightness $display
fi

# run command if display and right of set
if [ -v display ] && [ -v rightof ]; then
    xrandr --output $display --auto --right-of $rightof
fi

# run command if display and left of set
if [ -v display ] && [ -v leftof ]; then
    xrandr --output $display --auto --left-of $leftof
fi

# run command if display and above set
if [ -v display ] && [ -v above ]; then
    xrandr --output $display --auto --above $above
fi

# run command if display and below set
if [ -v display ] && [ -v below ]; then
    xrandr --output $display --auto --below $below
fi

# run command if display and rotate set, normal left right or inverted may be set
if [ -v display ] && [ -v rotate ]; then
    xrandr --output $display --auto --rotate $rotate
fi

