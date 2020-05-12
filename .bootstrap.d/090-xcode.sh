# Skip non-OSX.
[[ "${BOOTSTRAP_OS}" != "osx" ]] && return

xcode-select --install
