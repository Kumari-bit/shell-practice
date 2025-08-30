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

