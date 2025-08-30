#!/bin/bash

USER=$(id -u)

if [ $USER -ne 0 ]
then
    echo -e "ERROR: Please run the script with root access"
    exit 1
else
    echo "User is running with root access"
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

if [ $? -ne 0 ]
then
    echo "MySQL is not installed... going to install it"
    dnf install mysql-server -y
    VALIDATE $? "mysql"
else
    echo "Mysql is already install nothing to do"
fi

dnf list installed nginx

if [ $? -ne 0 ]
then
    echo "Nginx is not installed... going to install it"
    dnf install nginx -y
    VALIDATE $? "nginx"
else
    echo "nginx is already install nothing to do"
fi

dnf list installed Python3

if [ $? -ne 0 ]
then
    echo "Python3 is not installed... going to install it"
    VALIDATE $? "Python3"
else
    echo "Python3 is already install nothing to do"
fi