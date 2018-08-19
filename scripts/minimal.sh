#!/bin/bash

#####################
# Command Line Help #
#####################

if [ "$1" == "-h" ] || [ "$1" == "--help" ]; then
	printf 'Usage: sudo sh minimal.sh [option...]\n\n';
	printf '\t-h, --help\tShows this dialogue\n\n'
	printf 'Description: This is the minimal install script that pulls the repository with all of the other installation scripts. The script does the following:\nChecks that your system is up to date\nInstalls git\nclones the git repository\n'
	exit 0;
fi;
# Check if the script is running as root
if [ "$EUID" -ne 0 ]; then
	printf "Please run this script as root\n"
	exit 1
fi
printf "*********************************\n"
printf "*        Minimal Install        *\n"
printf "*********************************\n"

printf "\n\033[32mTASK: [Update Host]\n"
# Check the host is up to date
sudo yum update -y

printf "\n\033[32mTASK: [Install Git]\033[0m\n"
# check if git is installed, if it is install otherwise skip
if command -v git != "0" ; then
	printf "git already installed skipping"	
else
	sudo yum install git -y
fi

printf "\n\033[32mTASK: [Prepare Directories]\033[0m\n"
# Remove old versions of scripts
sudo rm -rf /opt/ansible-scripts/
# Change directory to /opt
cd /opt || exit 1

printf "\n\033[32mTASK: [Fetch Latest Version of the Repo]\033[0m\n"
sudo git clone https://github.com/ed-wright/ansible-scripts.git
printf -- '\033[32mDONE \033[0m\n';
/bin/bash /opt/ansible-scripts/scripts/menu.sh
exit 0;
