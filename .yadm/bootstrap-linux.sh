APTGET="apt-get"
if [ ! `id -u` = 0 ]; then
  APTGET="sudo $APTGET"
fi

$APTGET update -qq -y
$APTGET install -qq -y \
  curl \
  exuberant-ctags \
  vim-nox \
  python \
  python-dev \
  rake \
  ruby \
  ruby-dev \
  zsh-beta

if [ ! -x "$(command -v rvm || true)" ]; then
  curl -sSL https://get.rvm.io | bash -s stable --ruby
  source ~/.rvm/scripts/rvm
  rvm install ruby-2
  rvm use 2 --default
fi
