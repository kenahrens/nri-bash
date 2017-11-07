# Uptime On Host Integration
This one is pretty simple. It reads the uptime from `/proc/uptime` and reports into the `ComputeSample` event type. Since there are no configuration options, it has a pre-built config file. All you have to do is run the installer (with sudo) and you're done.

## Installation
Run the installer:
```
uptime$ sudo sh install.sh 
mkdir: cannot create directory ‘/var/db/newrelic-infra/custom-integrations/bin’: File exists
mkdir: cannot create directory ‘/var/db/newrelic-infra/custom-integrations/template’: File exists
All config files copied.
uptime-definition YAML file copied.
uptime-template JSON files copied.
uptime script copied.
uptime made into an executable.
Infrastructure service restarted
```

## Viewing Data
You will see a new attribute in `ComputeSample` called uptime in Insights. Query used:
```
SELECT average(uptime) FROM ComputeSample SINCE 30 MINUTES AGO TIMESERIES
```