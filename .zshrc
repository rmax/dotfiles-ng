export EDITOR='vim'
export CONDA_HOME=$HOME/miniconda

# Explicit path to avoid surprises.
export PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin"
export MANPATH="/usr/local/man:$MANPATH"

export GOPATH=$HOME/.go
export PATH=$GOPATH/bin:$PATH

export TEXLIVE_HOME=/usr/local/texlive/2015basic/
export PATH=$TEXLIVE_HOME/bin/x86_64-darwin:$PATH

export SCALA_HOME=/usr/local/bin/scala  
export PATH=$SCALA_HOME/bin:$PATH

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export WHEELHOUSE=$HOME/.pip/wheels

export PIP_WHEEL_DIR=$WHEELHOUSE
export PIP_FIND_LINKS=$WHEELHOUSE
export TOX_TESTENV_PASSENV="WHEELHOUSE PIP_WHEEL_DIR PIP_FIND_LINKS"

export PATH=$HOME/.zplug/bin/:$PATH

[ -f $HOME/.zplug/init.zsh ] && source $HOME/.zplug/init.zsh

zplug "zsh-users/zsh-history-substring-search"

zplug "junegunn/fzf-bin", \
  from:gh-r, \
  as:command, \
  rename-to:fzf, \
  use:"*darwin*amd64*"

zplug "plugins/git",   from:oh-my-zsh
zplug "plugins/scrapy",   from:oh-my-zsh
zplug "lib/clipboard", from:oh-my-zsh, if:"[[ $OSTYPE == *darwin* ]]"

zplug 'dracula/zsh', as:theme

zplug "stedolan/jq", \
  from:gh-r, \
  as:command, \
  rename-to:jq

zplug "Tarrasch/zsh-autoenv"

zplug "oskarkrawczyk/honukai-iterm-zsh", as:theme

# Can manage local plugins
export ZSH_LOCAL="$HOME/.zsh-local"
zplug "$ZSH_LOCAL", from:local

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

HIST_STAMPS="mm/dd/yyyy"
HISTSIZE=100000
SAVEHIST=100000

zplug "lib/history", from:oh-my-zsh

# Then, source plugins and add commands to $PATH
zplug load --verbose

#
# END ZPLUG
#

alias vi="nocorrect vim"
alias osxdnsflush="sudo dscacheutil -flushcache;sudo killall -HUP mDNSResponder; say cache flushed"

# added by travis gem
[ -f $HOME/.travis/travis.sh ] && source $HOME/.travis/travis.sh
#[ -f $HOME/.fzf.zsh ] && source $HOME/.fzf.zsh

export PATH="$HOME/bin:$PATH"
