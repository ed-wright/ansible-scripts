#!/bin/bash

# Check if the script is running as root
if [ "$EUID" -ne 0 ]
  then printf "Please run this script as root"
  exit 1
fi

printf "*********************************"
printf "* Init Script for: Ansible Host *"
printf "*********************************"

printf "\n\033[32mTASK: [Update Host]\033[0m\n"
sudo yum update -y

printf "\n\033[32mTASK: [Intall EPEL Repository]\033[0m\n"
sudo yum install epel-release -y

printf "\n\033[32mTASK: [Intall Ansible]\033[0m\n"
sudo yum install ansible -y

printf "\n\033[32mTASK: [Create Ansible Hosts File]\033[0m\n"
sudo touch /etc/ansible

#curl -sSL https://raw.githubusercontent.com/ed-wright/ansible-scripts/master/version.txt

exit 0
