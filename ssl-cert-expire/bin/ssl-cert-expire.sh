#!/bin/sh

# The ssl-cert-check command has output like this:
# 1 certificate(s) will expire (FILE:/Users/kahrens/.ssh/testmac1.crt on Nov 24 2017)|days=21
# We just want the number at the end (21).

# Run the command and grab the value after the equal sign
DAYS=`./ssl-cert-check/ssl-cert-check -c ${CERT_LOCATION} -N | cut -d "=" -f2`

# Read in the JSON template
JSON=`cat ./template/ssl-cert-expire-template.json`

# Replace the values in the JSON
# The @ in the sed command is a delimiter
# s@CERT_NAME@${CERT_NAME} replaces CERT_NAME from the template
JSON=`echo ${JSON} | sed -e "s@CERT_NAME@${CERT_NAME}@"`
JSON=`echo ${JSON} | sed -e "s@CERT_LOCATION@${CERT_LOCATION}@"`
JSON=`echo ${JSON} | sed -e "s@DAYS@${DAYS}@"`

# Remove all the whitespace from the JSON
JSON=`printf "${JSON}" | tr -d [:space:]`

# Print the result
echo "${JSON}"