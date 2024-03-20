#!/bin/bash

USER=$(id -u)
DATE=$(date +%F)
LogFile=/tmp/$0-$DATE.log

if [ $USER -ne 0 ]
then 
 echo -e "\e[31m Error: Please run the script with root access \e[0m"
 exit 1
fi

