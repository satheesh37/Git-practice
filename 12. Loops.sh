#!/bin/bash

    USERID=$(id -u)
    
    R="\e[31m"
    G="\e[32m"
    Y="\e[33m"

CHECK-ROOT(){
    if [ $USERID -ne 0 ]
    then
        echo "Please run this script"
        exit 1
     fi
}

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e "$2 is ....$R FAILED $N"
        exit 1
    else 
        echo -e "$2 is ... $R SUCCESS $N"
    fi    
}

CHEECK_ROOT

for package in $@
do
   dnf list installed $package  
   if [ $? -ne 0 ]
then
   echo "$package not installed...going to installed"
   dnf install $package -y 
   VALIDATE $? "installimg $package"
   else 
    echo "$package is installed"
    fi
done

    
