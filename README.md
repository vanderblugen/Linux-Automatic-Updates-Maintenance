# automatic-pi-updates-maintenance
Automatic Raspberry and Linux Updates

This script is meant to be scheduled to run on a regular basis and emails encrypted email to a specified email address
For set it and forget it mentailty, put into the ````/etc/cron.weekly```` or ````/etc/cron.monthly```` folders

This is a work in progress, a sort of alphe or beta version.


Prerequisites
- Install timestamp with ````sudo apt install moreutils -y````
- Install finger with ````sudo apt install finger -y````
- Able to email on the system from the command line.  Using postfix in this case.  Instructions are [here](https://medium.com/codingtown/send-mail-using-postfix-server-bbb08331d39d).
- Able to encrypt emails from command line.  Instructions are [here](https://github.com/vanderblugen/Send-Encrypted-Email-From-Linux)
