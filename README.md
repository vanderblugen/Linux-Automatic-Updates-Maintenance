# Linux Automatic Updates and Maintenance
Automatic Linux Updates

This script is meant to be scheduled to run on a regular basis.
- maintenance-email sends an encrpted email to a recippeint.
- maintenance-log generates a log put into /var/log and maintenance-log-rotate rotates that log on a monthly basis for 6 months

For set it and forget it, put into the ````/etc/cron.daily````, ````/etc/cron.weekly````, or ````/etc/cron.monthly```` folders

This is a work in progress.

Using ````maintenance-email````
-- Install timestamp with ````sudo apt install moreutils -y````
-- Install bc with ````sudo apt instal bc -y````
-- Install finger with ````sudo apt install finger -y````
-- Able to email on the system from the command line.  Using postfix in this case.  Instructions are [here](https://medium.com/codingtown/send-mail-using-postfix-server-bbb08331d39d).
-- Able to encrypt emails from command line.  Instructions are [here](https://github.com/vanderblugen/Send-Encrypted-Email-From-Linux)

Using ````maintenance-log````
- ````maintenance-log-rotate
--Move ````maintenance-log-rotate``` into ````/etc/logrotate.d/````
--````sudo mv maintenance-log-rotate /etc/logrotate.d/````
-````maintenance-log````
- Move ````maintenance-log```` into ````/etc/cron.weekly/```` for weekly updates
-- ````sudo mv maintenance-log /etc/cron.weekly/````
