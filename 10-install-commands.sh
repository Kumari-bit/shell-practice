#!/bin/bash

USER=$(id -u)

if [ $USER -ne 0 ]
then 
	echo "ERROR: Please run the script with root access"
	exit 1
else
	echo "your running with root access
fi

dnf installed mysql -y
if [ $? -ne 0]
then
	echo "Myql is not installed....going to install it"
	dnf install mysql -y
	if [ $? -eq 0 ]
	then
		echo "Installing mysql is.....success"
	else
		echo "installing mysql is...failure"
		exit 1
	fi
else
	echo "Mysql is already install..Nothing to do"
fi
	