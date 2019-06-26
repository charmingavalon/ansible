#!/bin/bash -e

# Add the ansible repo to get the latest version
sudo apt-add-repository ppa:ansible/ansible -y

sudo apt-get -qq install python3 ansible