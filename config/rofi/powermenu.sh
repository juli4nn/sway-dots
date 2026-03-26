#!/bin/sh

chosen=$(printf "lock\nlogout\nsleep\nreboot\nshutdown" | rofi -dmenu -i -p "Power" -theme ~/.config/rofi/powermenu.rasi)

case "$chosen" in
lock)
  ~/.config/sway/scripts/lock-and-idle.sh
  ;;
logout)
  swaymsg exit
  ;;
sleep)
  gtklock --config ~/.config/gtklock/config.ini & sleep 0.5 && systemctl suspend
  ;;
reboot)
  systemctl reboot
  ;;
shutdown)
  systemctl poweroff
  ;;
esac