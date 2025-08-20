#!/bin/bash
USER=$(id -u)
if [ $USER -ne 0 ]
then
    echo "ERORR:please run the script with root access"
    exit 1
else
    echo "user is running with root access"
fi

dnf list installed mysql

if [ $? -ne 0 ]
then
    echo "MySQL is NOT installed.....installing now"

    dnf install mysql -y
    if [ $? -eq 0 ]
    then
        echo "Installing mysql is success"
    else
        echo "Installing mysql is failure"
    fi
else
    echo "Mysql is already installed...Nothing to do"
fi





