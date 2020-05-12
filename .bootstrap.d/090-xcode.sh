# Skip non-OSX.
[[ "${BOOTSTRAP_OS}" != "osx" ]] && return

# This runs in the background by default and subsequent calls fail if it is
# already running.
xcode-select --install || true
