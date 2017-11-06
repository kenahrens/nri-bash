# ssl-cert-expire On Host Integration
This on-host integration has several pieces that work together:
* bin/ssl-cert-expire.sh - the binary script to be run
* config/ssl-cert-expire-config.COPYME - this config must be copied and customized for the specific host
* definition/ssl-cert-expire-def.yaml - this has the filename of the script and the frequency / interval
* template/ssl-cert-expire-template.json - this is the structure of the data to send to New Relic
* install.sh - this will copy all the files to the correct locations and restart the agent

## Customizing
At this point you can edit the files:
* bin/ssl-cert-expire.sh - put your custom commands in here that you want to run
* config/ssl-cert-expire-config.COPYME - copy this file to config/OHINAME-config.yaml and edit the values
* definition/ssl-cert-expire-def.yaml - if you want to send in new inputs, edit this file
* template/ssl-cert-expire-template.json - if you want to send out new values, edit this file