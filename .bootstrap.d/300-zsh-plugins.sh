# TODO skil if zplug rc didnt change

# This may run first time under another shell.
# FIXME: zplug install returns non-zero code when there are no packages to install.
export ZPLUG_LOADFILE="$ZSH_FILES/zplug.zsh"

ZSH_BIN=$(command -v zsh)

$ZSH_BIN -c "source $ZPLUG_HOME/init.zsh; zplug update; zplug install" || true
