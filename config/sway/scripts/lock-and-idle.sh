#!/bin/sh

LOCK="gtklock --config ~/.config/gtklock/config.ini"

# kill any existing swayidle (prevents duplicates)
pkill -x swayidle

# start timer: suspend after 30 min IF still locked
swayidle -w \
  timeout 1800 'pgrep -x gtklock && systemctl suspend' \
  before-sleep "$LOCK" &

# lock immediately
$LOCK
