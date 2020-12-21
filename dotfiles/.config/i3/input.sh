if [ "${SWAYSOCK}" ]; then
    # Sway manages input per-device in its config
    exit
else
    setxkbmap -layout es
fi
