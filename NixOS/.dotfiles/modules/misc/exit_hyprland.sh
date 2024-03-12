
if [[ ! $(pgrep -x "swaynag") ]]; then
    swaynag --background 333333 \
            --border 333333 \
            --border-bottom 333333 \
            --button-background 1F1F1F \
	          --button-border-size 0 \
            --button-padding 8 \
            --text FFFFFF \
            --button-text FFFFFF \
            --edge bottom \
	          -t warning -m '' \
            -B 'Power Off' 'systemctl poweroff' \
            -B 'Restart' 'systemctl reboot' \
            -B 'Logout' 'killall -u $USER'
fi
