
PYVER_LEGACY="3.6.10"
PYVER_STABLE="3.7.7"
PYVER_EDGE="3.8.2"

PYVER_BASE_PACKAGES="pip wheel"
PYVER_EXTRA_PACKAGES="pipenv ipython"

for PYVER in $PYVER_LEGACY $PYVER_STABLE $PYVER_EDGE; do
  pyenv install --skip-existing --verbose $PYVER
  pyenv local $PYVER
  pyenv exec pip install --upgrade $PYVER_BASE_PACKAGES
  pyenv exec pip install --upgrade $PYVER_EXTRA_PACKAGES
done

pyenv global $PYVER_STABLE
pyenv local $PYVER_STABLE
