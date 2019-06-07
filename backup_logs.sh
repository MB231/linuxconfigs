#!/usr/bin/env bash

#Script for automating dowload of log files from core to NAS

#Vars
IP="10.1.0.66"
SITE_NICKNAME="UNKNWN"
DESCRIPTION="LogFile"
DIR="MUDLAN"
USER_PASS='fuseadm:Fuse1234!'

#Functions
handle_help() {
    echo -e "Usage: backup_logs [-ip IPAddress]\n"
    echo -e "Script will package /var/log/mss files in to a tarball and\n"
    echo -e "send over ftp to NAS server at "
    echo "Optional Arguments:"
    echo -e "-ip ip_address\t\t\tTo set a different IP address to send to"
    echo -e "-h, --help\t\t\t Displays this help menu."
    echo -e "-v, --version\t\t\t Displays the version"

    return $1
}

handle_version() {
    echo -e "version 1.0"
    return $1
}

handle_error() {
    echo -e "\nUnhandled argument received\n"
    handle_help 1
}

handle_backup() {
    echo $@
}

handle_backup1() {
    FILE_NAME="$(date '+%Y%m%d_%H%M%S')_$SITE_NICKNAME_$DESCRIPTION.tar.gz"
    #absolute names option so "remove leading '/' ..." error will not result
    tar -czf "$FILE_NAME" /var/log/mss/ --absolute-names
    #single quotes around user and password for ! and similiar
    curl -T $FILE_NAME "ftp://$IP/$DIR/" --user $USER_PASS -#
    rm $FILE_NAME
    echo "$(date '+%Y%m%d_%H%M%S')_$SITE_NICKNAME_$DESCRIPTION sent to $IP"
}



#Process Input
if [ $# -eq 0 ] ; then
    handle_backup
    exit 0
fi
# put in getopts loop
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
