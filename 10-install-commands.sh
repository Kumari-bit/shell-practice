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
    exit 1
else
    echo "Mysql is already installed.....nothing to do"
fi

