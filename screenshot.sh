#!/bin/bash

screenshot_name=`zenity --title 'Screenshot' --entry --text 'Write the name of screenshot'`

if [[ $screenshot_name == '' ]]; then
    exit 0
fi

screenshot_url=`zenity --title 'Open a folder' --file-selection --directory`


if [[ $screenshot_url == '' ]]; then
    exit 0
fi

sleep 0.5

# Creating the screenshot
scrot "$screenshot_name" -e "mv \$f ${screenshot_url}"

zenity --title 'Success' --info --text 'Screenshot created successfully!'
