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
cp ./definition/uptime-def.yaml $CUSTOM_INTEGRATIONS
echo "uptime-definition YAML file copied."

# Copy the template file to a template directory
cp ./template/uptime-template.json ${CUSTOM_INTEGRATIONS}/template
echo "uptime-template JSON files copied."

# Copy the shell script the bin directory
cp ./bin/uptime.sh ${CUSTOM_INTEGRATIONS}/bin
echo "uptime script copied."

# Make sure the executable can be executed
chmod 755 ${CUSTOM_INTEGRATIONS}/bin/uptime.sh
echo "uptime made into an executable."

# Restart the newrelic-infra agent
service newrelic-infra restart
echo "Infrastructure service restarted"