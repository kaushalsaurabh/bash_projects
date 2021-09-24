#!/bin/bash

# This script will create users on the given linux system. 
# If the user executing this script is not a super user (root) then it will exit with status 1

# Exit if the current user is not root
CURRENT_USER=$(whoami)
echo "Current User:$CURRENT_USER"
if [ "$CURRENT_USER" != "root" ]
then
  echo "Exiting because current user is not root"
  exit 1
fi

# Prompting user name and password for the new account
read -p "Enter username: "  USER_NAME
read -p "Enter fullname: " FULL_NAME
read -p "Enter password: "  PASS_WORD

# Create a new user
CREATE_USER_CMD=$(useradd -c "{FULL_NAME}" -m "${USER_NAME}")
CHANGE_PASSWD_CMD=$(echo "${PASS_WORD}" | passwd "${USER_NAME}")
if [  ! "$CREATE_USER_CMD" ] || [ ! "$CHANGE_PASSWD_CMD" ] 
then
  echo "User was not created"
else
  echo "User Created successfully"
fi


echo "Username entered: $USER_NAME"
echo "Password entered: $PASS_WORD"
