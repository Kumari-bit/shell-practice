#!/bin/bash
USER=$(id -u)
if [ $USER -ne 0 ]
then
    echo "ERORR:please run the script with root access"
    exit 1
else
    echo "user is running with root access"
fi

dnf install mysql -y


