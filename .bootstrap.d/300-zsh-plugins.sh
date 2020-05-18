# TODO skil if zplug rc didnt change

# This may run first time under another shell.
# FIXME: zplug install returns non-zero code when there are no packages to install.
export ZPLUG_LOADFILE="$ZSH_FILES/zplug.zsh"
/usr/local/bin/zsh -c "source $ZPLUG_HOME/init.zsh; zplug install" || true
