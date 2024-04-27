#!/bin/bash

release_file=/etc/os-release
logfile=/var/log/updater.log #Save the standard output in this file
errorlog=/var/log/updater_errors.log #Save the standard error in this file

if grep -q "CentOS" $release_file
then
   # The host is based on Arch, run the pacman update command
   sudo yum update 1>> $logfile 2>>$errorlog
   if [ $? -ne 0 ]
   then
       echo "An error occurred, please check the $errorlog file."
   fi
fi

if grep -q "Ubuntu" $release_file || grep -q "Debian" $release_dile
then
   # the host is based on debian or ubuntu,
   # Run the apt version of the command
   sudo apt update 1>>$logfile 2>>$errorlog
   if [ $? -ne 0 ]
   then
       echo "An error occurred, please check the $errorlog file."
   fi
   sudo apt dist-upgrade -y 1>>$logfile 2>>$errorlog
   if [ $? -ne 0 ]
   then
       echo "An error occurred, please check the $errorlog file."
   fi
fi
