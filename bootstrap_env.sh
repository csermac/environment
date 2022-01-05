sudo apt update && sudo apt upgrade -y

sudo apt install -y make build-essential libssl-dev zlib1g-dev\
libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm \
xz-utils tk-dev libffi-dev liblzma-dev python-openssl\
git

git clone https://github.com/pyenv/pyenv.git ~/.pyenv

echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(pyenv init --path)"' >> ~/.bashrc

exec "$SHELL"

pyenv install 3.9.1

#Clone Virtualenv Pyenv plugin
git clone https://github.com/pyenv/pyenv-virtualenv.git $(pyenv root)/plugins/pyenv-virtualenv

#Set environment variables
echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.bashrc
exec "$SHELL"

#Create an enviroment named "ai" and set it as the global python interpreter
pyenv virtualenv 3.9.1 ai
pyenv global ai
