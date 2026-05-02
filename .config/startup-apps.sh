#!/usr/bin/env bash

function run {
    pgrep -f "$1" || $@ & disown
}

commands=(
    "picom -b --config $HOME/.config/picom/picom.conf"
    "sxhkd -c $HOME/.config/sxhkd/sxhkdrc"
    "ibus-daemon -rxRd"
)

for cmd in "${commands[@]}"
do
    run $cmd
done
