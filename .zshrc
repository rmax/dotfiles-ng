source $HOME/.zplug/init.zsh

# Plug OMZ plugins
zplug "lib/*.zsh", from:oh-my-zsh
zplug "plugins/brew",   from:oh-my-zsh, defer:1
zplug "plugins/cp",   from:oh-my-zsh, defer:1
zplug "plugins/docker",   from:oh-my-zsh, defer:1
zplug "plugins/docker-compose",   from:oh-my-zsh, defer:1
zplug "plugins/fancy-ctrl-z",   from:oh-my-zsh, defer:1
zplug "plugins/git",   from:oh-my-zsh, defer:1
zplug "plugins/history",   from:oh-my-zsh, defer:1
zplug "plugins/httpie",   from:oh-my-zsh, defer:1
zplug "plugins/rsync",   from:oh-my-zsh, defer:1
zplug "plugins/safe-paste",   from:oh-my-zsh, defer:1
zplug "plugins/shrink-path",   from:oh-my-zsh, defer:1
zplug "plugins/ssh-agent",   from:oh-my-zsh, defer:1
zplug "plugins/tmux",   from:oh-my-zsh, defer:1
zplug "plugins/vi-mode",   from:oh-my-zsh, defer:1
zplug "plugins/z",   from:oh-my-zsh, defer:1
zplug "plugins/zsh-navigation-tools",   from:oh-my-zsh, defer:1

# Plug other plugins
zplug "Tarrasch/zsh-autoenv"
zplug "ndbroadbent/scm_breeze", hook-build:"$ZPLUG_HOME/repos/ndbroadbent/scm_breeze/install.sh"
zplug "supercrabtree/k"
zplug "zsh-users/zsh-autosuggestions", defer:2
zplug "zsh-users/zsh-completions", use:src
zplug "zsh-users/zsh-history-substring-search", defer:2
zplug "zsh-users/zsh-syntax-highlighting", defer:2

# Plug commands
zplug "stedolan/jq", from:gh-r, as:command, rename-to:jq
zplug "junegunn/fzf", as:command, use:bin/fzf-tmux
zplug "junegunn/fzf-bin", from:gh-r, as:command, rename-to:fzf, use:"*darwin*amd64*"
zplug "k4rthik/git-cal", as:command
zplug "so-fancy/diff-so-fancy", as:command

# Plug theme
zplug "oskarkrawczyk/honukai-iterm-zsh", as:theme

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

HIST_STAMPS="yyyy-mm-dd"

# Then, source plugins and add commands to $PATH
zplug load

#
# END ZPLUG
#

# options
setopt MENU_COMPLETE  # select first menu option automatically
setopt NO_NOMATCH  # stop zsh from catching ^ chars.
setopt PROMPT_SUBST  # prompt substitution

export ENHANCD_FILTER=fzf-tmux
export EDITOR='vim'
export CONDA_HOME=$HOME/miniconda

# Explicit path to avoid surprises.
export PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin"
export MANPATH="/usr/local/man:$MANPATH"

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export WHEELHOUSE=$HOME/.pip/wheels
export PIP_WHEEL_DIR=$WHEELHOUSE
export PIP_FIND_LINKS=$WHEELHOUSE
export TOX_TESTENV_PASSENV="WHEELHOUSE PIP_WHEEL_DIR PIP_FIND_LINKS"

alias vi="nocorrect vim"
alias osxdnsflush="sudo dscacheutil -flushcache;sudo killall -HUP mDNSResponder; say cache flushed"

[ -f "$HOME/.travis/travis.sh" ] && source "$HOME/.travis/travis.sh"
[ -s "$HOME/.scm_breeze/scm_breeze.sh" ] && source "$HOME/.scm_breeze/scm_breeze.sh"
[ -s "$HOME/.fzf.zsh" ] && source "$HOME/.fzf.zsh"

export PATH="$HOME/.zplug/bin/:$PATH"
export PATH="$HOME/bin:$PATH"

func mkcd() { mkdir -p "$@" && cd "${@: -1}" }
