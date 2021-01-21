#!/bin/bash

# Copyright (c) 2021. AlphaTechnolog
# Screenshot.sh - A simple bash script to realize a simple screenshots
# uninstall.sh - Uninstall screenshot.sh

# -- Functions --

# Function Name: Exists

exists__core() {
    which "$1" >/dev/null 2>&1 &&
        echo "0" ||
        echo "1"
}

exists__actions() {
    msg="[F]: $2 is not installed, please install it!"

    if [[ $4 != "" ]]; then
        msg="$4"
    fi

    if [[ $1 == "$3" ]]; then
        echo "$msg"
        exit 1
    fi
}

exists() {
    local stdout=$(exists__core "$1")
    exists__actions "$stdout" "$1" "$2" "$3"
}

# Function Name: Is in root

is_in_root__core() {
    local user_id=`id -u`
    local is_root=0
    if [[ $user_id != "0" ]]; then
        is_root=1
    fi
    echo "$is_root"
}

is_in_root__actions() {
    if [[ $1 == "1" ]]; then
        echo "[F]: Invalid user, please execute this as root!"
        exit 1
    fi
}

is_in_root() {
    local in_root_number=$(is_in_root__core)
    is_in_root__actions "$in_root_number"
}

# -- Healtly --

echo "[I]: Checking for a healtly system..."
exists 'screenshot' '1'
is_in_root
echo '[S]: The system is healtly!'

# -- Uninstallation --

echo '[I]: Removing the executable'
rm /usr/bin/screenshot
echo '[S]: Screenshot.sh is uninstalled!'
