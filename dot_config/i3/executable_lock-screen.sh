#!/usr/bin/env bash

icon="$HOME/.config/lock-icon.png"
bg="$HOME/wallpapers/current/stairs-dark-001.png"
tmpbg="$HOME/wallpapers/lock-wallpaper.png"

if [ ! -f $tmpbg ]; then
	convert "$bg" -filter Gaussian -thumbnail 20% -sample 500% "$tmpbg"
	convert "$tmpbg" "$icon" -gravity center -composite "$tmpbg"
fi

i3lock -i "$tmpbg"
