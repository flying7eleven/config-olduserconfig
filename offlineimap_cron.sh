#!/usr/bin/bash
PIDS=$(pgrep awesome)
for p in $PIDS; do
	dbus=$(grep -z DBUS_SESSION_BUS_ADDRESS /proc/$p/environ | sed 's/DBUS_SESSION_BUS_ADDRESS=//')
	user=$(grep -z USER /proc/$p/environ | sed 's/USER=//')
	dply=$(grep -z DISPLAY /proc/$p/environ | sed 's/DISPLAY=//')
done
export DBUS_SESSION_BUS_ADDRESS=$dbus
export DISPLAY=$dply
export USER=$user
idToReplace=`cat /tmp/offlineimap_cron_eventid.tmp`
if [ -z "$idToReplace" ]; then
	idToReplace=-1
fi
echo $idToReplace
echo "DISPLAY=$dply" > /home/$user/.offlineimap.log
echo "DBUS_SESSION_BUS_ADDRESS=$dbus" >> /home/$user/.offlineimap.log
echo "USER=$user" >> /home/$user/.offlineimap.log
offlineimap -l /home/$user/.offlineimap.log
newMails=`find /home/$user/.mutt/maildir/work/INBOX/new/ -type f -print | wc -l`
if [ $newMails -gt 0 ]; then
	lastId=`echo "local naughty = require(\"naughty\"); return naughty.notify({title = \"New email\", text = \"Your local inbox has $newMails new message(s)!\", timeout = 0, replaces_id = $idToReplace}).id" | awesome-client -`
fi
lastEventId=$(echo $lastId | sed 's/double\ //')
echo $lastEventId > /tmp/offlineimap_cron_eventid.tmp
