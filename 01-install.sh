#!/bin/bash

USER=$(id -u)
DATE=$(date +%F)
LogFile=/tmp/$0-$DATE.log

if ( $USER -eq 0 )
then 
 echo -e "\e[31m its root user \e[0m"
else
 echo -e "\e[32m it's not root user"
 fi