#!/bash/bin

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[34m"

if [ $USERID -ne 0 ]
then
    echo -e "$R ERROR: please run the script with root access$N"
    exit 1
else
    echo "your running the script with root access"
fi

VALIDATE(){
    if [ $1 -eq 0 ]
    then
        echo -e "Installing $2 is $G success $N"
    else
        echo "Installing $2 is $R failure $N"
    fi
}

dnf list installed mysql
    if [ $? -ne 0 ]
    then
        echo "mysql is not installed...going to install"
        dnf install mysql -y
        VALIDATE $? mysql
    else
        echo "mysql is already installed nothing to do"
        fi

dnf list installed python3
    if [ $? -ne 0 ]
    then
        echo "Python3 is not installed....going to install"
        dnf install python3 -y
        VALIDATE $? python3
    else
        echo "Python3 already install... nothing to do"
        fi
