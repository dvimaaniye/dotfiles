#!/usr/bin/env bash

function run {
	pgrep -f "$1" || $@ & disown
}

commands=(
	"/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1"
	"picom -b --config $HOME/.config/picom/picom.conf"
	"nm-applet"
	"xfce4-power-manager"
	"pamac-tray"
	"clipit"
	"sxhkd -c $HOME/.config/sxhkd/sxhkdrc"
	"fix_xcursor"
	"$HOME/.config/polybar/launch"
	"feh --bg-fill -z $HOME/wallpapers/current/"
	"flameshot"
)

for cmd in "${commands[@]}"
do
	run $cmd
done
