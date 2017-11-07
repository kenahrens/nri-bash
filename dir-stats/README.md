# Dir Stats On Host Integration
This script expects you to supply 1 variable:
* DIR_NAME - the location of a directory from which to collect extra stats.

In order to run this you do the following
* Copy `config/dir-stats-config.COPYME` to `config/dir-stats-config.yaml`
* Edit your YAML file, add an instance for each directory you want to track

```
integration_name: com.adg.dir-stats

instances:
  - name: Instance 1
    command: dir-stats
    arguments:
      dir_name: /tmp
```

Now that you have your own config file you run the installer (with sudo). It will put all the files in the correct places and will restart the newrelic-infra agent. After you run it for the first time you'll see those `File exists` warnings which are no problem.

```
dir-stats$ sudo sh install.sh 
mkdir: cannot create directory ‘/var/db/newrelic-infra/custom-integrations/bin’: File exists
mkdir: cannot create directory ‘/var/db/newrelic-infra/custom-integrations/template’: File exists
All config files copied.
dir-stats-definition YAML file copied.
dir-stats-template JSON files copied.
dir-stats script copied.
dir-stats made into an executable.
Infrastructure service restarted
```

## Viewing Data
You will see new attributes in  `ComputeSample` called `dirName`, `dirSize` and `fileCount`. Example uery used:
```
SELECT average(dirSize) FROM ComputeSample WHERE  dirName = '/tmp' TIMESERIES
```