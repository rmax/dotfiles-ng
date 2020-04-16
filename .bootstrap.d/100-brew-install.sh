# Skip non-OSX.
[[ "${BOOTSTRAP_OS}" != "osx" ]] && return
# Skip if brew is already installed.
test -n "$(command -v brew)" && return

# Fail earlier.
ruby -v

# Install latest homebrew.
curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install | ruby
