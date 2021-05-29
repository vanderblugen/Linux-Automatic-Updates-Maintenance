# automatic-pi-updates-maintenance
Automatic Raspberry and Linux Updates

A script is meant to be scheduled to run on a regular basis and emails encrypted email to a specified email address
For set it and forget it mentailty, put into the ````/etc/cron.weekly```` or ````/etc/cron.monthly```` folders


Prerequisites
- Install timestamp with ````sudo apt-get install moreutils -y````
- Install secure delete with ````sudo apt-get install secure-delete -y````
- Able to email on the system from the command line.  Using postfix in this case.  Instructions are [here](https://medium.com/codingtown/send-mail-using-postfix-server-bbb08331d39d).
- Able to encrypt emails from command line.  Instructions are [here](https://github.com/vanderblugen/Send-Encrypted-Email-From-Linux)
