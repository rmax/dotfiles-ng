# Explicit path to avoid surprises.
export PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin"
export MANPATH="/usr/local/man:$MANPATH"

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export ZSH_FILES="$HOME/.zsh"
export ZPLUG_HOME="$HOME/.zplug"
export ZPLUG_REPOS="$ZPLUG_HOME/repos"
export ZPLUG_SUDO_PASSWORD=
export ZPLUG_PROTOCOL=ssh

HIST_STAMPS="yyyy-mm-dd"
HISTFILE="$HOME/.zsh_history"
HISTSIZE=100000
SAVEHIST=100000

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

# options
setopt NO_NOMATCH
setopt PROMPT_SUBST  # prompt substitution

zstyle ':completion:*' menu 'select=0'


if [ -d "$ZPLUG_HOME" ]; then
  export ZPLUG_LOADFILE="$ZSH_FILES/zplug.zsh"
  source $ZPLUG_HOME/init.zsh

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
#
# END ZPLUG
#

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

export ENHANCD_FILTER=fzf-tmux
export CONDA_HOME=$HOME/miniconda
export RVM_HOME=$HOME/.rvm

export WHEELHOUSE=$HOME/.pip/wheels
export PIP_WHEEL_DIR=$WHEELHOUSE
export PIP_FIND_LINKS=$WHEELHOUSE
export TOX_TESTENV_PASSENV="WHEELHOUSE PIP_WHEEL_DIR PIP_FIND_LINKS"

export EDITOR=vim

alias vi="nocorrect vim"
alias osxdnsflush="sudo dscacheutil -flushcache;sudo killall -HUP mDNSResponder; say cache flushed"

func mkcd() { mkdir -p "$@" && cd "${@: -1}" }

[ -f "$HOME/.zshrc.local" ] && source "$HOME/.zshrc.local"

[ -d "$ZPLUG_HOME/bin" ] && export PATH="$ZPLUG_HOME/bin:$PATH"
[ -d "$CONDA_HOME/bin" ] && export PATH="$CONDA_HOME/bin:$PATH"
[ -d "$RVM_HOME/bin" ] && export PATH="$$RVM_HOME/bin:$PATH"
[ -d "$HOME/bin" ] && export PATH="$HOME/bin:$PATH"

[ -s "$RVM_HOME/scripts/rvm" ] && source "$RVM_HOME/scripts/rvm" 

[ -s "$HOME/.fzf.zsh" ] && source "$HOME/.fzf.zsh"
[ -s "$HOME/.scm_breeze/scm_breeze.sh" ] && source "$HOME/.scm_breeze/scm_breeze.sh"
[ -s "$HOME/.travis/travis.sh" ] && source "$HOME/.travis/travis.sh"

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh
