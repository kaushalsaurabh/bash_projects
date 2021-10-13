#!/bin/bash

# This script accepts user name from the command line, generates random password and hence creates user

# Make sure the script is being executed with superuser privileges.
CURRENT_USER=$(whoami)
#echo "Current User:$CURRENT_USER"
if [ "$CURRENT_USER" != "root" ]
then
    echo "Exiting because current user is not root"
    exit 1
fi

# If the user doesn't supply at least one argument, then give them help.
if [ "$#" -lt 1 ]
then
    echo "Usage  $0 USER_NAME [USER_NAME] ..."
    exit 1
fi

# The first parameter is username
USER_NAME="$1"

# The rest of the parameters are comments
shift
COMMENT="$*"

# Generate a password.
PASS_WORD="$( date +%s%N | sha256sum | head -c8)"
#echo "Password : $PASS_WORD"

# Create a new user
useradd -c "$COMMENT" -m "$USER_NAME"

# Check to see if the useradd command succeeded.
user_add_status=$?
if [ "$user_add_status" -ne 0 ]
then
    echo "User was not created"
    exit 1
fi

# Set the password.
echo -e "$PASS_WORD\n$PASS_WORD" | passwd "$USER_NAME"

# Check to see if the passwd command succeeded.
passwd_status=$?
if [ "$passwd_status" -ne 0 ]
then
    echo "Password was not set correctly"
    exit 1
fi

# Force password change on first login.
passwd -e "$USER_NAME"

# Display the username, password, and the host where the user was created.
echo "User created"
echo "Username: $USER_NAME"
echo "Password: $PASS_WORD"
echo "Host: $HOSTNAME"