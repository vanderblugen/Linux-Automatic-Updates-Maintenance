#!/bin/bash
PATH=/bin:/usr/bin
THISFILENAME="$(openssl rand -hex 8).txt"
THISSTRING="\n*****************************************************************\n"

echo "Maintenance for $HOSTNAME" >> /home/pi/$THISFILENAME
echo -e $THISSTRING >> /home/pi/$THISFILENAME

gpu=$(/opt/vc/bin/vcgencmd measure_temp | awk -F "[=\']" '{print $2}')
cpu=$(</sys/class/thermal/thermal_zone0/temp)
cpu=$(echo "$cpu / 100 * 0.1" | bc)
cpuf=$(echo "(1.8 * $cpu) + 32" |bc)
gpuf=$(echo "(1.8 * $gpu) + 32" |bc)

echo "[Starting]" 2>&1 | ts >> /home/pi/$THISFILENAME

echo "[Changing File System to read/write]" 2>&1 | ts >> /home/pi/$THISFILENAME
sudo mount -o remount,rw /boot 2>&1 | >> /home/pi/$THISFILENAME
echo -e $THISSTRING >> /home/pi/$THISFILENAME

echo "[Current GPU Temp] GPU => $gpu'C ($gpuf'F)" 2>&1 | ts >> /home/pi/$THISFILENAME
echo "[Current CPU Temp] CPU => $cpu'C ($cpuf'F)" 2>&1 | ts >> /home/pi/$THISFILENAME
echo -e $THISSTRING >> /home/pi/$THISFILENAME

echo "[Running Update]" 2>&1 | ts >> /home/pi/$THISFILENAME
apt-get update -y 2>&1 | ts >> /home/pi/$THISFILENAME
echo -e $THISSTRING >> /home/pi/$THISFILENAME

echo "[Running Upgrade]" 2>&1 | ts >> /home/pi/$THISFILENAME
apt-get upgrade -y 2>&1 | ts >> /home/pi/$THISFILENAME
echo -e $THISSTRING >> /home/pi/$THISFILENAME

echo "[Running Dist-Upgrade]" 2>&1 | ts >> /home/pi/$THISFILENAME
apt-get dist-upgrade -y 2>&1 | ts >> /home/pi/$THISFILENAME
echo -e $THISSTRING >> /home/pi/$THISFILENAME

echo "[Running Autoremove]" 2>&1 | ts >> /home/pi/$THISFILENAME
apt-get autoremove -y 2>&1 | ts >> /home/pi/$THISFILENAME
echo -e $THISSTRING >> /home/pi/$THISFILENAME

echo "[Running Autoclean]" 2>&1 | ts >> /home/pi/$THISFILENAME
apt-get autoclean -y 2>&1 | ts >> /home/pi/$THISFILENAME
echo -e $THISSTRING >> /home/pi/$THISFILENAME

echo "[Showing Free Space Information]" 2>&1 | ts >> /home/pi/$THISFILENAME
sudo df 2>&1 | ts >> /home/pi/$THISFILENAME
echo -e $THISSTRING >> /home/pi/$THISFILENAME

echo "[Changing File System to read only]" 2>&1 | ts >> /home/pi/$THISFILENAME
sudo mount -o remount,ro /boot 2>&1 | >> /home/pi/$THISFILENAME
echo -e $THISSTRING >> /home/pi/$THISFILENAME

echo "[Finishing and rebooting: sudo reboot now]" 2>&1 | ts >> /home/pi/$THISFILENAME
echo -e $THISSTRING >> /home/pi/$THISFILENAME

#cat /home/pi/$THISFILENAME | gpg -ear "<address1@mail.com>" | mail -a "Subject: Monthly Maintenance" -a "X-Custom-Header: yes" "address2@mail.com"

srm -vz  /home/pi/$THISFILENAME
unset THISFILENAME
sudo reboot now

exit 0
