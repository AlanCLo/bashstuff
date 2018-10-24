#!/bin/bash
### Changes the terminal theme.


# Install themes from https://github.com/lysyi3m/macos-terminal-themes first!
profiles=("3024 Day" "3024 Night" "AdventureTime" "Material" "SeaShells" "Tomorrow Night Blue")


if [ -z "$1" ]; then
	RANDOM=$$$(date +%s)
	pick=${profiles[$RANDOM % ${#profiles[@]}]}
elif [ "$1" == "-h" ]; then
    echo "Usage:"
    echo "   chcolor.sh (name of theme)"
    echo "Name of theme is optional. If omitted, it selects randomly from list of 'profiles' array."
    echo ""
	echo "profiles=${profiles[@]}"
	exit
else
	pick=$1
fi

script="tell application \"Terminal\" to set current settings of selected tab of window 1 to (first settings set whose name is \"$pick\")"

osascript -e "$script"


