#!/bin/sh

CUSTOM_INTEGRATIONS=/var/db/newrelic-infra/custom-integrations
ETC_CONFIG=/etc/newrelic-infra/integrations.d

# Create these directories if they don't exist
mkdir ${CUSTOM_INTEGRATIONS}/bin
mkdir ${CUSTOM_INTEGRATIONS}/templates

# Copy the config file to the integrations.d directory
cp ./config/*.yaml $ETC_CONFIG
echo "All config files copied."

# Copy the configuration file to the custom-integrations directory
cp ./definition/OHINAME-def.yaml $CUSTOM_INTEGRATIONS
echo "OHINAME-definition YAML file copied."

# Copy the template file to a template directory
cp ./template/OHINAME-template.json ${CUSTOM_INTEGRATIONS}/template
echo "OHINAME-template JSON files copied."

# Copy the shell script the bin directory
cp ./bin/OHINAME.sh ${CUSTOM_INTEGRATIONS}/bin
echo "OHINAME script copied."

# Make sure the executable can be executed
chmod 755 ${CUSTOM_INTEGRATIONS}/bin/OHINAME.sh
echo "OHINAME made into an executable."

# Restart the newrelic-infra agent
service newrelic-infra restart
echo "Infrastructure service restarted"
