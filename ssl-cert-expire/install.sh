#!/bin/sh

CUSTOM_INTEGRATIONS=/var/db/newrelic-infra/custom-integrations
ETC_CONFIG=/etc/newrelic-infra/integrations.d

# Create these directories if they don't exist
mkdir ${CUSTOM_INTEGRATIONS}/bin
mkdir ${CUSTOM_INTEGRATIONS}/template

# Copy the config file to the integrations.d directory
cp ./config/*.yaml $ETC_CONFIG
echo "All config files copied."

# Copy the configuration file to the custom-integrations directory
cp ./definition/ssl-cert-expire-def.yaml $CUSTOM_INTEGRATIONS
echo "ssl-cert-expire-definition YAML file copied."

# Copy the template file to a template directory
cp ./template/ssl-cert-expire-template.json ${CUSTOM_INTEGRATIONS}/template
echo "ssl-cert-expire-template JSON files copied."

# Copy the shell script the bin directory
cp ./bin/ssl-cert-expire.sh ${CUSTOM_INTEGRATIONS}/bin
echo "ssl-cert-expire script copied."

# Make sure the executable can be executed
chmod 755 ${CUSTOM_INTEGRATIONS}/bin/ssl-cert-expire.sh
echo "ssl-cert-expire made into an executable."

# Restart the newrelic-infra agent
service newrelic-infra restart
echo "Infrastructure service restarted"