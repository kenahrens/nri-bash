# dir-stats On Host Integration
This on-host integration has several pieces that work together:
* bin/dir-stats.sh - the binary script to be run
* config/dir-stats-config.COPYME - this config must be copied and customized for the specific host
* definition/dir-stats-def.yaml - this has the filename of the script and the frequency / interval
* template/dir-stats-template.json - this is the structure of the data to send to New Relic
* install.sh - this will copy all the files to the correct locations and restart the agent

## Customizing
At this point you can edit the files:
* bin/dir-stats.sh - put your custom commands in here that you want to run
* config/dir-stats-config.COPYME - copy this file to config/OHINAME-config.yaml and edit the values
* definition/dir-stats-def.yaml - if you want to send in new inputs, edit this file
* template/dir-stats-template.json - if you want to send out new values, edit this file