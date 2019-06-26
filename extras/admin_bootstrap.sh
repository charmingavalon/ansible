#!/bin/bash -e

sudo apt-add-repository ppa:ansible/ansible -y

declare -A osInfo;
# RHEL/CentOS/Amazon Linux
osInfo[/etc/system-release]="sudo yum -y install "
# Debian/Ubuntu
osInfo[/etc/debian_version]="sudo apt-get -qq install "

for f in ${!osInfo[@]}
do
    if [[ -f $f ]]
    then
        echo $f "found!"
        exec ${osInfo[$f]} python3 ansible
    fi
done
