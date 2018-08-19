#!/bin/bash

# Check if the script is running as root
if [ "$EUID" -ne 0 ]
  then printf "Please run this script as root"
  exit
fi

printf "*********************************"
printf "* Init Script for: Ansible Host *"
printf "*********************************"

printf "\nTASK: [Update Host]"
sudo yum update -y

printf "\nTASK: [Intall EPEL Repository]"
sudo yum install epel-release

printf "\nTASK: [Intall Ansible]"
sudo yum install ansible

printf "\nTASK: [Create Ansible Hosts File]"

#curl -sSL https://raw.githubusercontent.com/ed-wright/ansible-scripts/master/version.txt
