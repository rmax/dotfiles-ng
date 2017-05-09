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

autoload -U parseopts
autoload -U zargs
autoload -U zcalc
autoload -U zed
autoload -U zmv

source $HOME/.zplug/init.zsh

zplug "robbyrussell/oh-my-zsh", use:"lib/*.zsh", nice:-1
zplug "plugins/brew",   from:oh-my-zsh
zplug "plugins/bundler",   from:oh-my-zsh
zplug "plugins/cp",   from:oh-my-zsh
zplug "plugins/dnf",   from:oh-my-zsh
zplug "plugins/docker",   from:oh-my-zsh
zplug "plugins/docker-compose",   from:oh-my-zsh
zplug "plugins/gem",   from:oh-my-zsh
zplug "plugins/git",   from:oh-my-zsh, nice:10
zplug "plugins/golang",   from:oh-my-zsh, nice:10
#zplug "plugins/gpg-agent",   from:oh-my-zsh
zplug "plugins/history",   from:oh-my-zsh, nice:11
zplug "plugins/httpie",   from:oh-my-zsh, nice:10
zplug "plugins/mvn",   from:oh-my-zsh
zplug "lukechilds/zsh-nvm"
zplug "lukechilds/zsh-better-npm-completion", nice:10
zplug "plugins/node",   from:oh-my-zsh
zplug "plugins/npm",   from:oh-my-zsh
zplug "plugins/rake",   from:oh-my-zsh
zplug "plugins/rsync",   from:oh-my-zsh
zplug "plugins/ruby",   from:oh-my-zsh
zplug "plugins/shrink-path",   from:oh-my-zsh
zplug "plugins/ssh-agent",   from:oh-my-zsh
zplug "plugins/systemd",   from:oh-my-zsh
zplug "plugins/tmux",   from:oh-my-zsh, nice:10
zplug "plugins/kubectl",   from:oh-my-zsh, nice:10
zplug "plugins/vagrant",   from:oh-my-zsh
zplug "plugins/z",   from:oh-my-zsh
zplug "plugins/zsh_reload",   from:oh-my-zsh

zplug "k4rthik/git-cal", as:command
zplug "michaeldfallen/git-radar", as:command, use:git-radar

zplug "ndbroadbent/scm_breeze", hook-build:"$ZPLUG_HOME/repos/ndbroadbent/scm_breeze/install.sh"
zplug "djui/alias-tips"
#zplug "junegunn/fzf-bin", as:command, from:gh-r, rename-to:fzf, use:"*linux*amd64*"
#zplug "b4b4r07/enhancd", use:enhancd.sh, on:"junegunn/fzf-bin"
zplug "junegunn/fzf", as:command, use:bin/fzf-tmux
#zplug "junegunn/fzf", use:"shell/key-bindings.zsh"
zplug "supercrabtree/k"
zplug "chriskempson/base16-shell", use:"base16-3024.dark.sh"
zplug "zsh-users/zsh-completions", use:src
zplug "zsh-users/zsh-autosuggestions", nice:10
zplug "zsh-users/zsh-syntax-highlighting", nice:10
zplug "zsh-users/zsh-history-substring-search", nice:10
zplug "knu/zsh-manydots-magic"
zplug "mafredri/zsh-async"
zplug "so-fancy/diff-so-fancy", as:command
zplug "Masterminds/glide", as:command, from:gh-r, use:"*linux*amd64*", rename-to:glide
zplug "jimmidyson/07b69911f783e3afd8cd4c8f8358c8f6", from:gist, nice:10

zplug "junegunn/fzf-bin", \
  from:gh-r, \
  as:command, \
  rename-to:fzf, \
  use:"*darwin*amd64*"

zplug "plugins/git",   from:oh-my-zsh
zplug "plugins/scrapy",   from:oh-my-zsh

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

# Then, source plugins and add commands to $PATH
zplug load --verbose

#
# END ZPLUG
#

# options
stty start undef  # disable C-s stopping receiving keyboard signals.
stty stop undef
setopt MENU_COMPLETE  # select first menu option automatically
setopt NO_NOMATCH  # stop zsh from catching ^ chars.
setopt PROMPT_SUBST  # prompt substitution

export ENHANCD_FILTER=fzf-tmux


# scm_breeze
[ -s "~/.scm_breeze/scm_breeze.sh" ] && source "~/.scm_breeze/scm_breeze.sh"

alias vi="nocorrect vim"
alias osxdnsflush="sudo dscacheutil -flushcache;sudo killall -HUP mDNSResponder; say cache flushed"

# added by travis gem
[ -f $HOME/.travis/travis.sh ] && source $HOME/.travis/travis.sh
#[ -f $HOME/.fzf.zsh ] && source $HOME/.fzf.zsh


bindkey -v
bindkey -M vicmd "?" history-incremental-pattern-search-forward
bindkey -M vicmd "/" history-incremental-pattern-search-backward
bindkey -M vicmd v edit-command-line
bindkey -M vicmd 'u' undo
bindkey -M vicmd '^r' redo
bindkey -M vicmd '~' vi-swap-case
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey '^[[Z' reverse-menu-complete
bindkey '^l' clear-screen
bindkey '^k' kill-line
bindkey '^u' backward-kill-line
bindkey '^r' history-incremental-search-backward
bindkey '^p' history-search-backward
bindkey '^n' insert-last-word
bindkey '^?' backward-delete-char

func mkcd() { mkdir -p "$@" && cd "${@: -1}" }

[ -s "$HOME/.scm_breeze/scm_breeze.sh" ] && source "$HOME/.scm_breeze/scm_breeze.sh"
[ -s "$HOME/.fzf.zsh" ] && source "$HOME/.fzf.zsh"

export PATH="$HOME/bin:$PATH"
