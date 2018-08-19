#!/bin/bash
# shellcheck disable=SC1091

# Check the script is running as root
if [ "$EUID" -ne 0 ]; then
	printf "Please run this script as root\n"
	exit 1
fi

# Check this script is up to date
sudo git fetch
varA=$(git rev-parse HEAD)
varB=$(git rev-parse @{u})

if  [ "$varA" != "$varB" ]; then
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
options=("Install Ansible Host" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Install Ansible Host")
			source /opt/ansible-scripts/scripts/ansible-host-init.sh
            ;;
        "Quit")
            exit 0
            ;;
        *) echo "invalid option $REPLY";;
    esac
done
