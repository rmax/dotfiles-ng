
# VIM
if command -v vim >/dev/null 2>&1; then
  echo "Bootstraping Vim"
  mkdir -p $HOME/.local/share/vim/{swap,backup,undo}
  vim '+PlugClean' '+PlugInstall' '+PlugUpdate' '+qall'
fi

# Conda
if command -v conda >/dev/null 2>&1; then
  echo "Bootstraping Conda"
  CONDA_HOME=${CONDA_HOME:-"$HOME/miniconda"}
  if [ `uname -s` = "Darwin" ]; then
    CONDA_PLAT=MacOSX
  else
    CONDA_PLAT=Linux
  fi
  wget https://repo.continuum.io/miniconda/Miniconda3-latest-${CONDA_PLAT}-x86_64.sh -O /tmp/miniconda.sh;
  bash /tmp/miniconda.sh -b -p $CONDA_HOME
  rm -f /tmp/miniconda.sh
  $CONDA_HOME/bin/conda update -q -y conda
  if [ -f "$HOME/.Condafile" ]; then
    $CONDA_HOME/bin/conda install -n root --file $HOME/.Condafile
  fi
fi
