#!/bin/sh

export DISPLAY=:0
export DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus

dunstify -t 10000 -u critical --icon="none" "It's $(date +'%H:%M')"
