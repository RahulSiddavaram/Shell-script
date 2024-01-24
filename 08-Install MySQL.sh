#!/bin/bash

#Script to install My SQL

# 1. check root user or not
# 2. if not root user, exit the program and inform user to run with sudo access
# 3. if root user install mysql 

# root user id -u --> 0
# normal user id -u --> not 0

USERID=$(id -u)

if [ $USERID -ne 0 ]
then 
    echo "ERROR :: PLEASE RUN WITH ROOT ACCESS"
    exit 1
# else    
#     echo "INFO:: YOU ARE ROOT USER"
fi

# it is our responsibility  again to check whether installation is SUccess or not
yum install mysql -y 

if [ $? -ne 0 ]
then 
    echo "Installation of MySQL is ERROR"
    exit 1
else 
    echo "Installation of My SQL is SuCCCESS"
fi