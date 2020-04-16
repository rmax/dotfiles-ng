GEMFILE="${HOME}/.Gemfile"

# Skip if gem file not present.
test -f $GEMFILE || return

gem install --user-install -g $GEMFILE
