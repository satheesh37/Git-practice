#!/bin/bash

LOGS_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%d-%H-%m-%S)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME-$TIMESTAMP.log"
mkdir -p $LOGS_FOLDER


USERID=$(id -u)
    
    R="\e[31m"
    G="\e[32m"
    Y="\e[33m"
    N=\"e[0m"

CHECK-ROOT(){
    if [ $USERID -ne 0 ]
    then
        echo -e "$R Please run this script $N" &>>$LOGS_FILE
        exit 1
     fi
}

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e "$2 is ....$R FAILED $N" &>>$LOGS_FILE
        exit 1
    else 
        echo -e "$2 is ... $R SUCCESS $N" &>>$LOGS_FILE
    fi    
}

CHEECK_ROOT