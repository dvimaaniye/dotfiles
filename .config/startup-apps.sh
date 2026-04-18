#!/usr/bin/env bash

function run {
	pgrep -f "$1" || $@ & disown
}

commands=(
	"picom -b --config $HOME/.config/picom/picom.conf"
	"Thunar --daemon"
	"sxhkd -c $HOME/.config/sxhkd/sxhkdrc"
	"clipit"
	"fix_xcursor"
	"ibus-daemon -rxRd"
)

for cmd in "${commands[@]}"
do
	run $cmd
done
