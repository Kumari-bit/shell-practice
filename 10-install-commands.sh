#!/bin/bash

USER=$(id -u)

if [ $USER -ne 0 ]
then
    echo "ERROR: Please run the script with root access"
    exit 1
else
    echo "User is running with root access"
fi

echo "Starting MySQL installation..."

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
    

