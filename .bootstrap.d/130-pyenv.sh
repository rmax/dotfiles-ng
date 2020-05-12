
function pip-install() {
  pyenv exec pip install --upgrade $1
}

function pyver-install() {
  PYVER=$1

  pyenv install --skip-existing --verbose $PYVER
  pyenv local $PYVER

  pip-install pip wheel
  pip-install pipenv
}

pyver-install 3.6.10
pyver-install 3.7.7
pyver-install 3.8.2

pyenv global 3.7.7
pyenv local 3.7.7
