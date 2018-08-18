#!/bin/bash

# Check the script is running as root
if [ "$EUID" -ne 0 ]; then
	printf "Please run this script as root\n"
	exit 1
fi

# Check this script is up to date
	
	curl -sSL https://raw.githubusercontent.com/ed-wright/ansible-scripts/master/version.txt
	cat /opt/ansible-scripts/version.txt
	
# Show user selection of scripts
# Execute selection

PS3='Please enter your choice: '
options=("Option 1" "Option 2" "Option 3" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Option 1")
            echo "you chose choice 1"
            ;;
        "Option 2")
            echo "you chose choice 2"
            ;;
        "Option 3")
            echo "you chose choice $REPLY which is $opt"
            ;;
        "Quit")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done
