# Skip if Brewfile not present.
[[ "${BOOTSTRAP_OS}" != "osx" ]] && return

test -f "${HOME}/.Brewfile" || return

brew bundle --global
