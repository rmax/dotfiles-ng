# Predefinfed vim dirs.
mkdir -p $HOME/.local/share/vim/{swap,backup,undo}

# TODO: skip if vimrc didnt change.

# This requires vim-plug in .vimrc.
vim +PlugUpgrade +PlugUpdate +PlugInstall +quit +quit
