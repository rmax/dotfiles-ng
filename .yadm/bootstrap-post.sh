
# TODO Install conda.


# VIM
mkdir -p $HOME/.local/share/vim/{backup,swap,undo}

if command -v vim >/dev/null 2>&1; then
  echo "Bootstraping Vim"
  vim '+PlugInstall' '+qall'
fi
