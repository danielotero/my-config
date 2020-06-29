#!/bin/sh

# Timeout in minutes
LOCK_TIMEOUT=5
DPMS_TIMEOUT=6
LOCK_CMD="i3exit lock"

if [ "${SWAYSOCK}" ]; then
    swayidle\
      timeout $(( ${LOCK_TIMEOUT} * 60 )) "${LOCK_CMD}" \
      timeout $(( ${DPMS_TIMEOUT} * 60 )) 'swaymsg "output * dpms off"'\
      resume                              'swaymsg "output * dpms on"'\
      before-sleep                        "${LOCK_CMD}"
else
    xautolock -time ${LOCK_TIMEOUT} -locker "${LOCK_CMD}"
fi
