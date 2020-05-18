# Skip if exists.
test -n "$(command -v nix)" && return

# A workaround to SIP in latest MacO which doesn't allow creating root
# directory /nix.
# This needs: csrutil disable
sudo mount -uw /

export NIX_ROOT=/System/Volumes/Data/nix

sudo mkdir -p -m 0755 $NIX_ROOT
sudo chown $USER $NIX_ROOT

# See https://github.com/NixOS/nix/issues/2925
export NIX_IGNORE_SYMLINK_STORE=1
test ! -d /nix && sudo ln -s $NIX_ROOT /nix

# TODO: verify sha1sum 😱
curl -fsSL https://nixos.org/nix/install | sh
