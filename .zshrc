# Explicit path to avoid surprises.
export PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin"
export MANPATH="/usr/local/man:$MANPATH"

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export ZPLUG_HOME="$HOME/.zplug"
export ZPLUG_REPOS="$ZPLUG_HOME/repos"

if [ -d "$ZPLUG_HOME" ]; then
  source $ZPLUG_HOME/init.zsh

  # Plug OMZ plugins
  zplug "lib/*.zsh", from:oh-my-zsh
  zplug "plugins/fancy-ctrl-z",   from:oh-my-zsh, defer:1
  zplug "plugins/git",   from:oh-my-zsh, defer:1
  zplug "plugins/history",   from:oh-my-zsh, defer:1
  zplug "plugins/httpie",   from:oh-my-zsh, defer:1
  zplug "plugins/rsync",   from:oh-my-zsh, defer:1
  zplug "plugins/shrink-path",   from:oh-my-zsh, defer:1
  zplug "plugins/ssh-agent",   from:oh-my-zsh, defer:1
  zplug "plugins/vi-mode",   from:oh-my-zsh, defer:1
  zplug "plugins/z",   from:oh-my-zsh, defer:1

  # Plug other plugins
  zplug "Tarrasch/zsh-autoenv"
  zplug "b4b4r07/enhancd", use:init.sh
  zplug "ndbroadbent/scm_breeze", hook-build:"$ZPLUG_REPOS/ndbroadbent/scm_breeze/install.sh"
  zplug "supercrabtree/k"
  zplug "zsh-users/zsh-autosuggestions"
  zplug "zsh-users/zsh-completions", use:src
  zplug "zsh-users/zsh-history-substring-search"
  zplug "zsh-users/zsh-syntax-highlighting"

  # Plug shell scripts or small programs
  zplug "junegunn/fzf", as:command, use:bin/fzf-tmux
  zplug "junegunn/fzf-bin", from:gh-r, as:command, rename-to:fzf, use:"*darwin*amd64*"
  zplug "k4rthik/git-cal", as:command
  zplug "paulirish/git-open", as:command
  zplug "so-fancy/diff-so-fancy", as:command
  zplug "stedolan/jq", from:gh-r, as:command, rename-to:jq
  zplug "rolando-contrib/gister", as:command, use:gister.sh, rename-to:gister

  # Plug theme
  zplug "oskarkrawczyk/honukai-iterm-zsh", as:theme

  # Install plugins if there are plugins that have not been installed
  if ! zplug check --verbose; then
      printf "Install? [y/N]: "
      if read -q; then
          echo; zplug install
      fi
  fi

  # Then, source plugins and add commands to $PATH
  zplug load

fi

HIST_STAMPS="yyyy-mm-dd"
HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000

setopt BANG_HIST
setopt EXTENDED_HISTORY
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_SAVE_NO_DUPS
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY
setopt HIST_BEEP

stty start undef # disable C-s
stty stop undef

#
# END ZPLUG
#

# options
setopt NO_NOMATCH
setopt PROMPT_SUBST  # prompt substitution

zstyle ':completion:*' menu 'select=0'

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

export ENHANCD_FILTER=fzf-tmux
export CONDA_HOME=$HOME/miniconda

export WHEELHOUSE=$HOME/.pip/wheels
export PIP_WHEEL_DIR=$WHEELHOUSE
export PIP_FIND_LINKS=$WHEELHOUSE
export TOX_TESTENV_PASSENV="WHEELHOUSE PIP_WHEEL_DIR PIP_FIND_LINKS"

export EDITOR=vim

alias vi="nocorrect vim"
alias osxdnsflush="sudo dscacheutil -flushcache;sudo killall -HUP mDNSResponder; say cache flushed"

func mkcd() { mkdir -p "$@" && cd "${@: -1}" }

[ -d "$ZPLUG_HOME/bin" ] && export PATH="$ZPLUG_HOME/bin/:$PATH"
[ -d "$CONDA_HOME/bin" ] && export PATH="$CONDA_HOME/bin/:$PATH"
[ -d "$HOME/bin" ] && export PATH="$HOME/bin:$PATH"

[ -f "$HOME/.travis/travis.sh" ] && source "$HOME/.travis/travis.sh"
[ -s "$HOME/.scm_breeze/scm_breeze.sh" ] && source "$HOME/.scm_breeze/scm_breeze.sh"
[ -s "$HOME/.fzf.zsh" ] && source "$HOME/.fzf.zsh"
