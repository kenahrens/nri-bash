#!/bin/sh

# Get the count of files
# ls gets the list, wc counts the lines, tr trims whitespace
FILE_COUNT=`ls ${DIR_NAME} | wc -l | tr -d ' '`

# Read in the JSON template
JSON=`cat ./template/OHINAME-template.json`

# Replace the values in the JSON
# The @ in the sed command is a delimiter
# s@FILE_COUNT@${FILE_COUNT} replaces FILE_COUNT from the template
JSON=`printf "${JSON}" | sed -e "s@FILE_COUNT@${FILE_COUNT}@"`
JSON=`echo ${JSON} | sed -e "s@DIR_NAME@${DIR_NAME}@"`

# Remove all the whitespace from the JSON
JSON=`printf "${JSON}" | tr -d [:space:]`

# Print the result
echo "${JSON}"
