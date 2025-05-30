#!/bin/bash

echo "All variables passed to the script : $@"
echo "Number of variables" : $#
echo "Script Name : $0"
echo "Current Directory : $PWD"
echo "User running this script : $user"
echo "Home Directory of user : $HOME"
echo "PID of the script : $$"
Sleep 10&
echo "PID of last command in background : $!"