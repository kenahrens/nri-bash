# On Host Integrations for New Relic Infrastructure
This project includes on-host integrations to use with New Relic Infrastructure. These should not require additional languages, although they may require that certain packages are installed.

# Integrations Included
* Dir Stats - File counts and size of files in a directory
* SSL Cert Expire - Track the number of days before a SSL certificate expires
* Uptime - Track the server uptime

# Project Generator
There is a generator which can be used to make a new integration. It will create a set of directories including a shell script, config example, definition file, JSON template, installer and readme. You can use it like this:
```
kahrens:nri-bash kahrens$ ./generator.sh example
Made directories under: ./example
Translated file: ./example/bin/example.sh
Translated file: ./example/config/example-config.COPYME
Translated file: ./example/definition/example-def.yaml
Translated file: ./example/template/example-template.json
Translated file: ./example/install.sh
Translated file: ./example/README.md
```
Now that my project has been created I can run a quick test:
```
kahrens:example kahrens$ sh ./bin/example.sh 
{"name":"com.adg.example","protocol_version":"1","integration_version":"1.0.0","metrics":[{"event_type":"ComputeSample","dirName":"DIR_NAME","fileCount":6}]}
```
Basically it shows me that the example.sh shell script worked properly and returned a JSON.