#!/bin/sh

# The ssl-cert-check command has output like this:
# 1 certificate(s) will expire (FILE:/Users/kahrens/.ssh/testmac1.crt on Nov 24 2017)|days=21
 
# Run the command and grab the value after the equal sign
DAYS=`./ssl-cert-check/ssl-cert-check -c ${cert_location} -N | cut -d "=" -f2`

# Read in the JSON
JSON=`cat ./templates/ssl-days-template.json`

# Replace the values in the JSON
# The @ in the sed command is a delimiter
# s@CERT@${CERT} replaces CERT from the JSON template with ${CERT}
JSON=`echo ${JSON} | sed -e "s@CERT_NAME@${cert_name}@"`
JSON=`echo ${JSON} | sed -e "s@CERT_LOCATION@${cert_location}@"`
JSON=`echo ${JSON} | sed -e "s@DAYS@${DAYS}@"`

# Remove all the whitespace from the JSON
JSON=`echo ${JSON} | tr -d ' \t\n\r\f'`

# Print the result
echo "${JSON}"
