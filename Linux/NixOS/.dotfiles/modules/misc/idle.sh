#!/usr/bin/env bash
swayidle -w \
         timeout 300 'swaylock -f -c 000000' \
         timeout 600 'swaymsg "output * dpms off"' \
              resume 'swaymsg "output * dpms on"' \
         before-sleep 'swaylock -f -c 000000' 
