APTGET="apt-get"
if [ ! `id -u` = 0 ]; then
  APTGET="sudo $APTGET"
fi

$APTGET update -q -y
$APTGET install -q -y \
  curl \
  exuberant-ctags \
  vim \
  python \
  python-dev \
  rake \
  ruby \
  ruby-dev \
  zsh-beta
