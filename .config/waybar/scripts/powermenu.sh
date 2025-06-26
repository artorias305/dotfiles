#!/bin/bash

chosen=$(echo -e "󰤄 Lock\n⏾ Suspend\n Power Off\n Reboot\n Logout" | wofi --dmenu -p "Power Menu")

case "$chosen" in
  "󰤄 Lock")     swaylock ;;
  "⏾ Suspend")  systemctl suspend ;;
  " Power Off") poweroff ;;
  " Reboot")   reboot ;;
  " Logout")   hyprctl dispatch exit ;;
esac

