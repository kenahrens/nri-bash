#!/bin/sh

# Get the count of files
# ls gets the list, wc counts the lines, tr trims whitespace
UPTIME=`cat /proc/uptime | cut -f1 -d ' '`

# Read in the JSON template
JSON=`cat ./template/uptime-template.json`

# Replace the values in the JSON
# The @ in the sed command is a delimiter
# s@UPTIME@${UPTIME} replaces UPTIME from the template
JSON=`printf "${JSON}" | sed -e "s@UPTIME@${UPTIME}@"`

# Remove all the whitespace from the JSON
JSON=`printf "${JSON}" | tr -d [:space:]`

# Print the result
echo "${JSON}"