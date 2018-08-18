#!/bin/bash
# shellcheck disable=SC1091

# Check the script is running as root
if [ "$EUID" -ne 0 ]; then
	printf "Please run this script as root\n"
	exit 1
fi

# Check this script is up to date
varA=$(curl -sSL https://raw.githubusercontent.com/ed-wright/ansible-scripts/master/version.txt)
varB=$(cat /opt/ansible-scripts/version.txt)

if  [ "$varA" != "$varB" ]; then
		#printf "You version is out of date please run the following command:\n"
		#printf '\033[32msudo git reset --hard origin/master\033[0m\n';
		#exit 1;
		
		printf "Your script is out of date, updating..."
		#remove any old versions of the update script
		sudo rm -rf /tmp/ansible-scripts
		#make temp directory
		sudo mkdir /tmp/ansible-scripts
		#copy the update script to the tmp dir
		cp /opt/ansible-scripts/scripts/update.sh /tmp/ansible-scripts/update.sh
		/bin/bash /tmp/ansible-scripts/update.sh
fi
	#curl -sSL https://raw.githubusercontent.com/ed-wright/ansible-scripts/master/version.txt
	#cat /opt/ansible-scripts/version.txt
	
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
