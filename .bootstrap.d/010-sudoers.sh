#!/usr/bin/env sh

# Adding user to sudoers passwordless.
USER_SUDOERS_PATH="/etc/sudoers.d/$USER"
if [[ ! -f $USER_SUDOERS_PATH ]]; then
  echo "$USER    ALL=(ALL) NOPASSWD:ALL" | sudo tee $USER_SUDOERS_PATH
fi
