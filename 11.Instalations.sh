#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
       echo "Please run this script"
       exit 1
fi

dnf install git -y


