#!/bin/bash

#Script to install My SQL

# 1. check root user or not
# 2. if not root user, exit the program and inform user to run with sudo access
# 3. if root user install mysql 

# root user id -u --> 0
# normal user id -u --> not 0

DATE=$(date +&F:%H:%M:%S)
SCRIPT_NAME=$0
LOGFILE=/tmp/$SCRIPT_NAME-$DATE.log


VALIDATE (){

#$1 --> it will receive the argument1
#$1 --> it will receive the argument2

    if [ $1 -ne 0 ]
    then 
        echo "$2 ERROR"
        exit 1
    else 
        echo "$2 SUCCCESS"
    fi

}

USERID=$(id -u)

if [ $USERID -ne 0 ]
    then 
        echo "ERROR :: PLEASE RUN WITH ROOT ACCESS"
        exit 1
    # else    
    #     echo "INFO:: YOU ARE ROOT USER"
fi

# it is our responsibility  again to check whether installation is SUccess or not

yum install mysql -y &>>$LOGFILE

VALIDATE $? "Installing MySQL" 

yum install postfix -y &>>$LOGFILE

VALIDATE $? "Installing PostFix"


