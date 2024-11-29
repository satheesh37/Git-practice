#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
       echo "Please run this script"
       exit 1
fi

dnf list installed mysql

if [ $? -ne 0 ]
then
   echo "mysql not installed...going to installed"
   dnf install mysql -y
   if [ $? -ne 0 ]
   then
    echo "mysql installation is failure"
    exit 1
   else
    echo "my sql is installed success" 
    fi
else
 echo "mysql is already installed"
fi 





