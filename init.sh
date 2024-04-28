export GPG_TTY=$(tty)
source .venv/bin/activate
sudo apt install gnupg2 pass
pip install pip-tools
pip-compile requirements.in
pip install -r requirements.txt
ansible-galaxy collection install -r ./collections/requirements.yml