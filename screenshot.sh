#!/bin/bash

screenshot_name=`zenity --title 'Screenshot' --entry --text 'Write the name of screenshot'`

if [[ $screenshot_name == '' ]]; then
    echo "Exiting..."
    exit 0
fi

screenshot_url=`zenity --title 'Open a folder' --file-selection --directory`

if [[ $screenshot_url == '' ]]; then
    echo "Exiting..."
    exit 0
fi

screenshot_manager=$(
    zenity --title "Screenshot Manager" --forms \
        --text "Select screenshot manager" \
        --add-combo="Select screenshot manager" \
        --combo-values="scrot|import"
)

if [[ $screenshot_manager == '' ]]; then
    echo "Exiting..."
    exit 0
fi

sleep 0.5

# Creating the screenshot

if [[ "$screenshot_manager" == "scrot" ]]; then
    scrot "$screenshot_name" -e "mv \$f ${screenshot_url}"
elif [[ "$screenshot_manager" == "import" ]]; then
    import "$screenshot_name"
    mv "$screenshot_name" "$screenshot_url"
fi

zenity --title 'Success' --info --text 'Screenshot created successfully!'
