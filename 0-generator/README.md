# OHINAME On Host Integration
This on-host integration has several pieces that work together:
* bin/OHINAME.sh - the binary script to be run
* config/OHINAME-config.COPYME - this config must be copied and customized for the specific host
* definition/OHINAME-def.yaml - this has the filename of the script and the frequency / interval
* template/OHINAME-template.json - this is the structure of the data to send to New Relic
* install.sh - this will copy all the files to the correct locations and restart the agent

## Customizing
At this point you can edit the files:
* bin/OHINAME.sh - put your custom commands in here that you want to run
* config/OHINAME-config.COPYME - copy this file to config/OHINAME-config.yaml and edit the values
* definition/OHINAME-def.yaml - if you want to send in new inputs, edit this file
* template/OHINAME-template.json - if you want to send out new values, edit this file
