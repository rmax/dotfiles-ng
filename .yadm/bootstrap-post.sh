
# VIM
mkdir -p $HOME/.local/share/vim/{swap,backup,undo}

if command -v vim >/dev/null 2>&1; then
  echo "Bootstraping Vim"
  vim '+PlugInstall' '+qall'
fi
