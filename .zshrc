umask 022
limit coredumpsize 0
bindkey -d

# Return if zsh is called from vim
if [[ -n $VIMRUNTIME ]]; then
  return 0
fi

# Explicit path to avoid surprises.
export PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin"
export MANPATH="/usr/local/man:$MANPATH"

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export ZSH_FILES="$HOME/.zsh"
export ZPLUG_HOME="$HOME/.zplug"
export ZPLUG_REPOS="$ZPLUG_HOME/repos"
export ZPLUG_SUDO_PASSWORD=
export ZPLUG_PROTOCOL=https

HIST_STAMPS="yyyy-mm-dd"
HISTFILE="$HOME/.zsh_history"
HISTSIZE=200000
SAVEHIST=200000

setopt BANG_HIST
setopt EXTENDED_HISTORY
setopt HIST_BEEP
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
setopt HIST_SAVE_NO_DUPS
setopt HIST_VERIFY
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY

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
#  if ! zplug check --verbose; then
#      printf "Install? [y/N]: "
#      if read -q; then
#          echo; zplug install
#      fi
#  fi

  # Then, source plugins and add commands to $PATH
  zplug load  #--verbose

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
alias tf="terraform"
alias v="nocorrect vim"

func mkcd() { mkdir -p "$@" && cd "${@: -1}" }

[ -f "$HOME/.zshrc.local" ] && source "$HOME/.zshrc.local"
[ -f "$HOME/.theme" ] && source "$HOME/.theme"

[ -d "$ZPLUG_HOME/bin" ] && export PATH="$ZPLUG_HOME/bin:$PATH"
[ -d "$CONDA_HOME/bin" ] && export PATH="$CONDA_HOME/bin:$PATH"
[ -d "$RVM_HOME/bin" ] && export PATH="$$RVM_HOME/bin:$PATH"

[ -d "$HOME/bin" ] && export PATH="$HOME/bin:$PATH"
[ -d "$HOME/go" ] && export GOPATH="$HOME/go"
[ -d "$HOME/.cargo" ] && export PATH="$HOME/.cargo/bin:$PATH"

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

[ -d "$HOME/.nvm" ] && export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # homebrew location

[ -d "$HOME/.rbenv" ] && eval "$(rbenv init -)"

export TF_GLOBAL_DIR="${HOME}/.terraform"
export TF_PLUGIN_DIR="${TF_GLOBAL_DIR}/plugins"

# FZF
export BAT_THEME="TwoDark"
export FZF_COMPLETION_OPTS="--preview '(bat --color=always {} || cat {} || tree -C {}) 2> /dev/null | head -200'"
export FZF_CTRL_T_OPTS="$FZF_COMPLETION_OPTS"
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*" --glob "!node_modules/*"'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

[ -s "/Users/rmax/.scm_breeze/scm_breeze.sh" ] && source "/Users/rmax/.scm_breeze/scm_breeze.sh"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/usr/local/Caskroom/miniconda/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/usr/local/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]; then
        . "/usr/local/Caskroom/miniconda/base/etc/profile.d/conda.sh"
    else
        export PATH="/usr/local/Caskroom/miniconda/base/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

