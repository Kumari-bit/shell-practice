#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ] 

then
  echo "ERROR: Please run this script with root access"
  exit 1
else
  echo "you are running with root access"
  fi

VALIDATE(){
    if [ $1 -eq 0 ]
    then
        echo "installing $2 is success"
    else
        echo "installing $2 is failure"
    exit1
    fi
}

dnf list installed Mysql
if [ $? -ne 0 ]
then
    echo"Mysql is not installed....going to install"
    dnf install Mysql -y
    VALIDATE $? "Mysql"
else
    echo"Mysql is already installed...nothing to do"
fi

dnf list installed Python
if [ $? -ne 0 ]
then
    echo"Python is not installed...going to install"
    dnf list install python -y
    VALIDATE $? "Python"
else
    echo"Python is already installed...nothing to do"
fi

dnf list installed nginx
if [ $? -ne 0 ]
then 
    echo"Nginx is not installed....going to install"
    dnf install nginx -y
    VALIDATE $? "Nginx"
else
    echo "nginx is already installed...nothing to do"
fi
    
   