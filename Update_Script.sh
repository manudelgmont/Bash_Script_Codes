#!/bin/bash

release_file=/etc/os-release

if grep -q "CentOS" $release_file
then
   # The host is based on Arch, run the pacman update command
   sudo yum update
   sudo yum upgrade
fi

if grep -q "Ubuntu" $release_file || grep -q "Debian" $release_dile
then
   # the host is based on debian or ubuntu,
   # Run the apt version of the command
   sudo apt update
   sudo apt dist-upgrade
fi

