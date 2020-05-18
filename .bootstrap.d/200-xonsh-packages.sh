
function _xpip_install() {
  xonsh -c "xpip install $@"
}

_xpip_install \
  xontrib-autojump \
  xonsh-autoxsh \
  xonsh-docker-tabcomplete \
  xontrib-fzf-widgets \
  xontrib-histcpy \
  xontrib-powerline \
  xontrib-prompt-vi-mode \
  xonsh-scrapy-tabcomplete \
  xontrib-ssh-agent \
  xonsh-vox-tabcomplete \
  xontrib-z
