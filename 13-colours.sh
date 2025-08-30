#!/bin/bash

#!/bin/bash

USER=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"


if [ $USER -ne 0 ]
then
    echo -e "$R ERROR: Please run the script with root access $N"
    exit 1
else
    echo -e "User is running with root access"
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
    echo -e "Nothing to do MySQL... $Y already installed $N"
fi

dnf list installed nginx

if [ $? -ne 0 ]
then
    echo "Nginx is not installed... going to install it"
    dnf install nginx -y
    VALIDATE $? "nginx"
else
    echo -e "Nothing to do python... $Y already installed $N"
fi

dnf list installed Python3

if [ $? -ne 0 ]
then
    echo "Python3 is not installed... going to install it"
    VALIDATE $? "Python3"
else
    echo -e "Nothing to do nginx... $Y already installed $N"
fi