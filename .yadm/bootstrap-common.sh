
# TODO Install conda.

# VIM
if command -v vim >/dev/null 2>&1; then
  echo "Bootstraping Vim"
  vim '+PlugInstall' '+qall'
fi
