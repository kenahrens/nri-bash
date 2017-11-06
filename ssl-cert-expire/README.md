# SSL Cert Expire On Host Integration
This on-host integration has several pieces that work together:
* bin/ssl-cert-expire.sh - the binary script to be run
* config/ssl-cert-expire-config.COPYME - this config must be copied and customized for the specific host
* definition/ssl-cert-expire-def.yaml - this has the filename of the script and the frequency / interval
* template/ssl-cert-expire-template.json - this is the structure of the data to send to New Relic
* install.sh - this will copy all the files to the correct locations and restart the agent

## Customizing
This script expects you to supply 2 variables:
* CERT_LOCATION - the location of the certificate file
* CERT_NAME - a name to use in the Insights UI

In order to run this you do the following
* Copy `config/ssl-cert-expire-config.COPYME` to `config/ssl-cert-expire-config.yaml`
* Edit your YAML file, add an instance for each file you want to track

```
integration_name: com.adg.ssl-cert-expire

instances:
  - name: Instance 1
    command: ssl-cert-expire
    arguments:
      CERT_LOCATION: /home/kahrens/.ssh/test1.crt
      CERT_NAME: Basic Test 1
```

Now that you have your own config file you run the installer (with sudo). It will put all the files in the correct places and will restart the newrelic-infra agent. After you run it for the first time you'll see those `File exists` warnings which are no problem.

```
nri-bash/ssl-cert-expire$ sudo sh install.sh 
mkdir: cannot create directory ‘/var/db/newrelic-infra/custom-integrations/bin’: File exists
mkdir: cannot create directory ‘/var/db/newrelic-infra/custom-integrations/template’: File exists
mkdir: cannot create directory ‘/var/db/newrelic-infra/custom-integrations/ssl-cert-check’: File exists
All config files copied.
ssl-cert-expire-definition YAML file copied.
ssl-cert-expire-template JSON files copied.
ssl-cert-expire script copied.
ssl-cert-expire made into an executable.
ssl-cert-check subproject copied.
ssl-cert-check subproject made into an executable.
Infrastructure service restarted
```

## Viewing Data
When this is working you will see a new event type named `SSLCertExpire` show up in Insights. Query used:
```
SELECT average(expireDays) FROM SSLCertExpire FACET certName SINCE 60 MINUTES AGO TIMESERIES
```
(insights.png)
