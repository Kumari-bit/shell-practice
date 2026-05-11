#!/bin/bash

USER=$(id -u)

if [ $USER -ne 0 ]
then
    echo "ERROR: Please run this script with user access"
    exit 1
else
    echo "your running with root access"
fi

VALIDATE (){
    if [ $1 -eq 0 ]
    then
        echo "Installing $2....is success"
    else
        echo "Installing $2....is failure"
        exit 1
    fi

dnf list inatalled mysql -y

if [ $? -ne 0 ]
then
    echo "Mysql is not installed going to install"
    dnf install mysql-server -y
    VALIDATE $? "mysql"
else
    echo "Mysql is already installed...nothing to do"
fi

dnf list installed python -y

if [ $? -ne 0 ]
then
    echo "python is not installed ....going to install"
    dnf install python3 -y
    VALIDATE $? "python"
else
    echo "Python is already install...nothing to do"
fi

dnf list installed nginx -y

if [ $? -ne 0 ]
then    
    echo "Nginx is not installed.....going to install"
    dnf install nginx -y
    VALIDATE $? "Nginx"
else
    echo "nginx is already install...nothing to do"
fi
