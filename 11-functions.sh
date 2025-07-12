#!/bash/bin

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "ERROR: please run the script with root access"
    exit 1
else
    echo "your running the script with root access"
fi

VALIDATE(){
    if [ $1 -eq 0 ]
    then
        echo "Installing $2 is success"
    else
        echo "Installing $2 is failure"
    fi

dnf list installed mysql
    if [ $? -nq 0]
    then
        echo "mysql is not installed...going to install"
        dnf install mysql -y
        VALIDATE $? mysql
        echo "mysql is already installed nothing to do"
        fi

dnf list installed python3
    if [ $? -nq 0 ]
    then
        echo "Python3 is not installed....going to install"
        dnf install python3 -y
        VALIDATE $? python3
    else
        echo "Python3 already install... nothing to do"
        fi
