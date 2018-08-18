#!/bin/bash

cd /opt/ansible-scripts
git fetch --all
git reset --hard origin/master
git pull origin master

bin/bash /opt/ansible-scripts/scripts/menu.sh
