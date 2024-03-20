#!/bin/bash

USER=$(id -u)
DATE=$(date +%F)
LogDir=/tmp/script-logs
LogFile=$LogDir/$0-$DATE.log
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ $USER -ne 0 ]
then 
 echo -e "$R Error: Please run the script with root user/access "
 exit 1
fi
Validate(){
    if [ $1 -ne 0 ]
    then
      echo -e "Installing $2 ....$R FAILURE"
      exit 1
    else
      echo -e "Installing $2 ....$G SUCCESS"
    fi
}

# Installed pacakes passed at runtime
for i in $@
do 
 yum list installed $i &>> $LogFile
 if [ $? -ne 0 ]
 then 
   echo "Let's install $i"
   yum install $i -y &>> $LogFile
   Validate $? $i
 else
  echo -e "$Y The $i package is alredy installed $N"
 fi  
done


