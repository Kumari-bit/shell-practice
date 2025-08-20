#!/bin/bash

USER=$(id -u)

if [ $USER -ne 0 ]
then
    echo "ERROR: Please run the script with root access"
    exit 1
else
    echo "User is running with root access"
fi

dnf list installed mysql

if [ $? -ne 0 ]
then
    echo "Mysql is not installed.....going to install it"
    dnf install mysql -y
    if [ $? -eq 0 ]
    then
        echo "Mysql installing....success"
    else
        echo "Mysql installing....failure"
    exit 1
fi
else
    echo "Mysql is already installed nothing to do"
fi


