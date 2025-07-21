#!/usr/bin/env bash

function run {
	pgrep -f "$1" || $@ & disown
}

commands=(
	"picom -b --config $HOME/.config/picom/picom.conf"
	"clipit"
	"Thunar --daemon"
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
