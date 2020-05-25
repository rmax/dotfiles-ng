REQUIREMENTS=$BOOTSTRAP_DIR/python-requirements.txt

for APP in $(cat $REQUIREMENTS); do
  pipx install "$APP"
done
