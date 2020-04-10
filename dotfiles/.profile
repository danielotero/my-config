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
