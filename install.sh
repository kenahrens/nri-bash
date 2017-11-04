#!/bin/sh

CUSTOM_INTEGRATIONS=/var/db/newrelic-infra/custom-integrations
ETC_CONFIG=/etc/newrelic-infra/integrations.d

# Create these directories if they don't exist
mkdir ${CUSTOM_INTEGRATIONS}/bin
mkdir ${CUSTOM_INTEGRATIONS}/ssl-cert-check
mkdir ${CUSTOM_INTEGRATIONS}/templates

# Copy the config file to the integrations.d directory
cp ./config/*.yaml $ETC_CONFIG
echo "All config files copied."

# Copy the configuration file to the custom-integrations directory
cp ./definition/*.yaml $CUSTOM_INTEGRATIONS
echo "All definition files copied."

# Copy the template file to a template directory
cp ./templates/*.json ${CUSTOM_INTEGRATIONS}/templates
echo "All template files copied."

# Copy the shell script the bin directory
cp ./bin/* ${CUSTOM_INTEGRATIONS}/bin
echo "All binary files copied."

# Copy the ssl-cert-check
cp ./ssl-cert-check/* ${CUSTOM_INTEGRATIONS}/ssl-cert-check
echo "Extra ssl-cert-check files copied."

# Make sure the executable can be executed
chmod 755 ${CUSTOM_INTEGRATIONS}/bin/*.sh
echo "Integration made into an executable."

# Make sure the ssl-cert-check can be executed
chmod 755 ${CUSTOM_INTEGRATIONS}/ssl-cert-check/ssl-cert-check
echo "Extra ssl-cert-check made into an executable."

# Restart the newrelic-infra agent
service newrelic-infra restart
echo "Infrastructure service restarted"