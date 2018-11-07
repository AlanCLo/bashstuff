#!/bin/bash
### Changes the terminal theme.

# Install themes from https://github.com/lysyi3m/macos-terminal-themes first!
# Set TERMINAL_THEMES as a comma separated list in environment to have local perferences
# Otherwise the default list are two from the default OSX themes
if [ ${#TERMINAL_THEMES[@]} -eq 0 ]; then
    TERMINAL_ARRAY=("Novel" "Man Page")
else
    IFS=',' read -r -a TERMINAL_ARRAY <<< "$TERMINAL_THEMES"
fi

if [ -z "$1" ]; then
	RANDOM=$$$(date +%s)
	pick=${TERMINAL_ARRAY[$RANDOM % ${#TERMINAL_ARRAY[@]}]}
elif [ "$1" == "-h" ]; then
    echo "Usage:"
    echo "   chcolor.sh (name of theme)"
    echo "Changes the current theme of an OSX terminal."
    echo "Name of theme is optional. If omitted, it selects randomly from list of 'TERMINAL_THEMES' array."
    echo ""
	echo "Current TERMINAL_THEMES=\""$(IFS=,;printf "%s" "${TERMINAL_ARRAY[*]}")"\""
    echo ""
    echo "TERMINAL_THEMES is a comma list of theme names because bash doesn't export arrays well"
    echo ""
	exit
else
	pick=$1
fi

script="tell application \"Terminal\" to set current settings of selected tab of window 1 to (first settings set whose name is \"$pick\")"

osascript -e "$script"


