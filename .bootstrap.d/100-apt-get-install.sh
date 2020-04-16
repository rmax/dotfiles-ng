# This assumes that apt-get presence means a debian-based linux.

# Skip if apt-get is not present (non-debian).
test -z "$(command -v apt-get)" && return

APTGET="sudo apt-get -qq -y"

$APTGET update

cat $BOOTSTRAP_DIR/data/apt-packages | xargs $APTGET install
