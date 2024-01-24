#!/bin/bash

DATE=$(date +%F:%H:%M:%S)
SCRIPT_NAME=$0
LOGFILE=/tmp/$SCRIPT_NAME-$DATE.log

R="\e[31m"
G="\e[32m"
N="\e[0m"

USERID=$(id -u)

if [ $USERID -ne 0 ];
then 
    echo -e "$R ERROR :: PLEASE RUN WITH ROOT ACCESS $N"
    exit 1
# else    
#     echo "INFO:: YOU ARE ROOT USER"
fi

# all arguments are in $@
for i in $@
do
    yum install $i -y
done
