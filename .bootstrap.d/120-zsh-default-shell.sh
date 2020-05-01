#!/usr/bin/env sh

ZSH_BIN="/usr/local/bin/zsh"
ETC_SHELLS="/etc/shells"

#
# Set ZSH as default shell.
#
if [[ -z $(grep $ZSH_BIN $ETC_SHELLS) ]]; then
  # backup just in case :)
  sudo cp $ETC_SHELLS ${ETC_SHELLS}.orig

  echo "\n$ZSH_BIN" | sudo tee -a $ETC_SHELLS
fi

# Update default shell.
sudo chsh -s $ZSH_BIN $USER
