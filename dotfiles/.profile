#
# This should be the main entry point for all shells and only the common
# functionality should be considered.
#
# That includes:
#   - Setting the user and host environment
#   - Forward to a non POSIX shell if necessary
#

#
# Environment configuration:
#
HOSTNAME=$(command -v hostname >/dev/null 2>&1 && hostname)
USER_ENV=~/.config/myconfig/environment/default
HOST_ENV=~/.config/myconfig/environment/$HOSTNAME

set -o allexport
[[ -e "$USER_ENV.env" ]] && source "$USER_ENV.env"
[[ -d "$USER_ENV.d" ]] && for file in "$USER_ENV.d/"*.env; do source "$file"; done
[[ -e "$HOST_ENV.env" ]] && source "$HOST_ENV.env"
[[ -d "$HOST_ENV.d" ]] && for file in "$HOST_ENV.d/"*.env; do source "$file"; done
unset file
set +o allexport

#
# Keyring
#
if [ $(command -v gnome-keyring-daemon) ] && [ -z "$SSH_AUTH_SOCK" ]; then
    eval $(gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
    export SSH_AUTH_SOCK
fi

#
# Desktop environment
#
if [ "$(tty)" = "/dev/tty1" ]; then
    if grep "nvidia" /proc/modules &> /dev/null; then
        if grep "amdgpu" /proc/modules &> /dev/null; then
            # Allow sway with hybrid amd/nvidia situations (it works for me!)
            exec systemd-cat sway --my-next-gpu-wont-be-nvidia
        else
            exec systemd-cat startx
	fi
    else
        exec systemd-cat sway
    fi
fi
