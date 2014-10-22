#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# fix a bug with awesome and java applications
wmname LG3D

# ensure that our synergy server is running
# synergys

# start the dropbox deamon
dropboxd &

# start the SparkleShare client
#sparkleshare start &

# enable the numlock while logging in
numlockx &

# enable the network-manager applet
nm-applet &

# enable the tool for controlling the snd
volumeicon &

# enable the taskwarrior webserver
task-web --port 5678 --host 127.0.0.1 --no-launch

# start the window manager
#exec gnome-session
exec awesome >> ~/.cache/awesome/stdout 2>> ~/.cache/awesome/stderr
