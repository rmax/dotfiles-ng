
function pip-install() {
  pyenv exec pip install --upgrade $@
}

function pyver-install() {
  PYVER=$1

  pyenv install --skip-existing --verbose $PYVER
  pyenv local $PYVER

  pip-install pip wheel
  pip-install -r ${BOOTSTRAP_DIR}/python-requirements.txt
}

pyver-install 3.6.10
pyver-install 3.7.7
pyver-install 3.8.2

# FIXME: Could not fetch URL https://pypi.python.org/simple/pipenv/: There was
# a problem confirming the ssl certificate: [SSL: TLSV1_ALERT_PROTOCOL_VERSION]
# tlsv1 alert protocol version - skipping
#pyver-install pypy-5.7.1

pyenv global 3.8.2
pyenv local 3.8.2
