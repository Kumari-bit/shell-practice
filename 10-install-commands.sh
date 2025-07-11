#!/bin/bash

USERID=$(id -u)

if[ $USERID -ne 0 ]

echo "ERROR: please run this script with root access"

exit 1

else

 echo " you are running with root access "

 fi

 dnf list installed mysql

# check already installed or not. if Installed $? is 0, then 
# If not installed $? is not 0. expression is true

if [ $? -ne 0]
then

echo " mysql not installed going to install"
dnf install mysql -y

if [ $? -eq 0 ]
then
        echo "Installing MySQL is ... SUCCESS"
    else
        echo "Installing MySQL is ... FAILURE"
        exit 1
    fi
else
 echo "Mysql is already installed nothing to do"

 fi

 else
  echo "Mysql is already installed nothing to do"
  fi