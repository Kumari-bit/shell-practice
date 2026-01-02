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

# check already installed or not. if Installed $? is 0, then 
# If not installed $? is not 0. expression is true
if [ $? -ne 0 ]
then
    echo "MySQL is not installed... going to install it"
    dnf install mysql -y
    if [ $? -eq 0 ]
    then
        echo "Installing MySQL is ... SUCCESS"
    else
        echo "Installing MySQL is ... FAILURE"
        exit 1
    fi
else
    echo "MySQL is already installed...Nothing to do"
fi

