#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "ERROR:: Please run this script with root access"
    exit 1 #give other than 0 upto 127
else
    echo "You are running with root access"
fi

dnf list installed nginx

# check already installed or not. if Installed $? is 0, then 
# If not installed $? is not 0. expression is true
if [ $? -ne 0 ]
then
    echo "nginx is not installed... going to install it"
    dnf install nginx -y
    if [ $? -eq 0 ]
    then
        echo "Installing nginx is ... SUCCESS"
    else
        echo "Installing nginx is ... FAILURE"
        exit 1
    fi
else
    echo "Nginx is already installed...Nothing to do"
fi
# dnf install mysql -y

# if [ $? -eq 0 ]
# then
#     echo "Installing MySQL is ... SUCCESS"
# else
#     echo "Installing MySQL is ... FAILURE"
#     exit 1
# fi