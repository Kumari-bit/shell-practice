#!/bin/bash

USER=$(id -u)

if [ $USER -ne 0 ]
then
    echo -e "ERROR: Please run the script with root access"
    exit 1
else
    echo "User is running with root access"
fi



dnf list installed mysql

if [ $? -ne 0 ]
then
    echo "MySQL is not installed... going to install it"
    dnf install mysql-server -y
    if [ $? -eq 0 ]
    then
        echo "Installing mysql is success"
    else
        echo "Installing mysql is failure"
        exit 1
    fi
else
    echo "Mysql is already install nothing to do"
fi

echo "Starting nginx installation..."

dnf list installed nginx

if [ $? -ne 0 ]
then
    echo "Nginx is not installed... going to install it"
    dnf install nginx -y
    if [ $? -eq 0 ]
    then
        echo "Installing nginx is success"
    else
        echo "Installing nginx is failure"
        exit 1
    fi
else
    echo "nginx is already install nothing to do"
fi

echo "Starting Python3 installation..."

dnf list installed Python3

if [ $? -ne 0 ]
then
    echo "Python3 is not installed... going to install it"
    dnf install python3 -y
    if [ $? -eq 0 ]
    then
        echo "Installing python3 is success"
    else
        echo "Installing python3 is failure"
        exit 1
    fi
else
    echo "Python3 is already install nothing to do"
fi