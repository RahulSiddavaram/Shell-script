#!/bin/bash

DATE=$(date +%F:%H:%M:%S)
LOGSDIR=/home/centos/shellscript-log
SCRIPT_NAME=$0
LOGFILE=$LOGSDIR/$$0-$DATE.log

R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"

USERID=$(id -u)

if [ $USERID -ne 0 ];
then 
    echo -e "$R ERROR :: PLEASE RUN WITH ROOT ACCESS $N"
    exit 1
# else    
#     echo "INFO:: YOU ARE ROOT USER"
fi

VALIDATE(){
    if [ $1 -ne 0 ];
    then
        echo -e " Installing $2 ... $R FAILURE $N"
        exit 1
    else    
        echo -e "Installing $2 .. $G SUCCESS $N"
    fi
}

# all arguments are in $@

for i in $@
do
    yum list installed $i
    if [ $? -ne 0]
    then    
        echo "$i is not installed, lets install it"
        yum install $i -y &>>$LOGFILE
        VALIDATE $? "$i"
    else
        echo -e "$Y $i is already installed $N"
    fi

done
