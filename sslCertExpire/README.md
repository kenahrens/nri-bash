# SSL Days
This on host extension will track how many days until a given SSL certificate expires.

## Installation
Here are the steps to install:
* Clone the repository
* Copy `sslDays/config/ssl-days-config.COPYME` to `sslDays/config/ssl-days-config.yaml`
* Edit `sslDays/config/ssl-days-config.yaml` for your cert files
* Run `install.sh` (probably as sudo) to copy all the files and restart the NRI Agent

## Viewing Data
This on host integration creates a new event called `SSLCertExpire`

## Setting Up Alerts
