#!/bin/bash -e

declare -A osInfo;
# RHEL/CentOS/Amazon Linux
osInfo[/etc/system-release]="sudo yum -y install python3"
# Debian/Ubuntu
osInfo[/etc/debian_version]="sudo apt-get -qq install python3"

for f in ${!osInfo[@]}
do
    if [[ -f $f ]]
    then
        echo $f "found!"
        exec ${osInfo[$f]}
    fi
done
