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
offlineimap
