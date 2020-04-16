# Skip if Brewfile not present.
test -f "${HOME}/.Brewfile" || return

brew bundle --global
