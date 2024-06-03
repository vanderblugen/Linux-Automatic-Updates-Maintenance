# Linux Automatic Updates and Maintenance
Automatic Linux Updates

This script is meant to be scheduled to run on a regular basis.
- set EMAIL to 1 for sending an encrpted email to a recippeint.
- maintenance-log generates a log put into /var/log and maintenance-log-rotate rotates that log on a monthly basis for 6 months

For set it and forget it, put into the ````/etc/cron.daily````, ````/etc/cron.weekly````, or ````/etc/cron.monthly```` folders

This is a work in progress.

# If emailing with this log.
- Using postfix.  Instructions are [here](https://medium.com/codingtown/send-mail-using-postfix-server-bbb08331d39d).
- Able to encrypt emails from command line.  Instructions are [here](https://github.com/vanderblugen/Send-Encrypted-Email-From-Linux)

# Update permissions on both
````sudo 700 maintenance-log-rotate````

````sudo 700 maintenance-log````

# Using maintenance-log
- Move maintenance-log-rotate to /etc/logrotate.d/
  - ````sudo mv maintenance-log-rotate /etc/logrotate.d/````
- Move maintenance-log into /etc/cron.weekly/ for weekly updates
  -  ````sudo mv maintenance-log /etc/cron.weekly/````
