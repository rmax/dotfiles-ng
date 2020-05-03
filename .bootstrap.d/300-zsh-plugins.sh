# TODO skil if zplug rc didnt change

# This may run first time under another shell.
# FIXME: zplug install returns non-zero code when there are no packages to install.
/usr/local/bin/zsh -c "source $HOME/.zshrc; zplug install || true"
