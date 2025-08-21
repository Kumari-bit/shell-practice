#!/bin/bash
USER=$(id -u)
if [ $USER -ne 0 ]
then
    echo "ERROR: Please run this script with  root access"
    exit 1
else
    echo "your running with root access"
fi

VALIDATE() {
    if [ $1 -eq 0 ]
    then
        echo "Installing $2 is success"
    else
        echo "Installing $2 is failure"
        exit 1
        fi
    }

dnf list installed mysql
if [ $? -eq 0 ]
then    
    echo "Installing mysql is success.....nothing to do"
else
    echo "Mysql is not installed.....going to install"
    VALIDATE $? "Mysql"
fi

dnf list installed nginx
if [ $? -eq 0 ]
then    
    echo "Installing nginx is success.....nothing to do"
else
    echo "nginx is not installed.....going to install"
    VALIDATE $? "nginx"
fi

dnf list installed Python
if [ $? -eq 0 ]
then    
    echo "Installing Python is success.....nothing to do"
else
    echo "python is not installed.....going to install"
    VALIDATE $? "Python"
fi