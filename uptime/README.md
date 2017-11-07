# uptime On Host Integration
This on-host integration has several pieces that work together:
* bin/uptime.sh - the binary script to be run
* config/uptime-config.COPYME - this config must be copied and customized for the specific host
* definition/uptime-def.yaml - this has the filename of the script and the frequency / interval
* template/uptime-template.json - this is the structure of the data to send to New Relic
* install.sh - this will copy all the files to the correct locations and restart the agent

## Customizing
At this point you can edit the files:
* bin/uptime.sh - put your custom commands in here that you want to run
* config/uptime-config.COPYME - copy this file to config/OHINAME-config.yaml and edit the values
* definition/uptime-def.yaml - if you want to send in new inputs, edit this file
* template/uptime-template.json - if you want to send out new values, edit this file