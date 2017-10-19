# Setup fzf
# ---------
if [[ ! "$PATH" == *$ZPLUG_REPOS/junegunn/fzf/bin* ]]; then
  export PATH="$PATH:$ZPLUG_REPOS/junegunn/fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "$ZPLUG_REPOS/junegunn/fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "$ZPLUG_REPOS/junegunn/fzf/shell/key-bindings.zsh"


if (( $+commands[rg]  )) ; then
  export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'
fi
