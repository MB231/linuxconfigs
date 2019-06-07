#!/usr/bin/env bash
#getopts takes 3 args first:valid options as a sequence of letters
#second: variable to populate with option or argument to process next
#third: list of arguments and options to be processed. default is $@ when not provided
#VARS
#OPTIND=holds number of options parsed by getopts. Use "shift $((OPTIND -1))" to at end of 
#prcessing loopt ot remove options already handled.
#OPTARG=options that have arguments are signified with : e.g. e: is -e <arg> expected. see e
#option below. If no argument provided erro can be caught with : option

#":ht" vs "ht" is -h and -t are valid option with the default disabled in the first example
#:must be first to disable default
#'ht' and "ht" are equivalent
while getopts ":hte:" opt; do #opt holds value of CURRENT option
    case ${opt} in
        h_)
            #statement for h
        ;;
        t )
            #statement for t
        ;;
        e )
            e_argument=$OPTARG
        ;;
        : )  #NOT A CASE IF SUBCOMMAND
            echo "invalid option: $OPTARG requires and argument" 1>$2
        ;;
        \?)
            #default statement getops returns ? for invalid options. bash backslash
            echo "invalid option; $OPTARG" 1>$2
        ;;
    esac
done #more than 1 done in subcommand implementation. One for each subcommand.
shift $((OPTIND -1)) #shifts last argument out so new argument is loaded then decrements OPTIND
#---------------------------------------------subcommand part see below
subcommand=$1; shift  # Remove 'pip' from the argument list
case "$subcommand" in
  # Parse options to the install sub command
  install)
    package=$1; shift  # Remove 'install' from the argument list

    # Process package options
    while getopts ":t:" opt; do
      case ${opt} in
        t )
          target=$OPTARG
          ;;
        \? )
          echo "Invalid Option: -$OPTARG" 1>&2
          exit 1
          ;;
        : )
          echo "Invalid Option: -$OPTARG requires an argument" 1>&2
          exit 1
          ;;
      esac
    done
    shift $((OPTIND -1))
    ;;
esac

#use of subcommand is for commands like pip install urllib3 -t ./src/lib which is the above EX
#this command has a subcommand that is executed with the rest of the arguments as it's own
pakckge=""
target=""
#above vars are defined at beginning of script

#
