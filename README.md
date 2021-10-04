# Pyenv + Virtualenv + ROS Noetic

## Pyenv

```console
sudo apt update && sudo apt upgrade -y
```

```console
sudo apt install -y make build-essential libssl-dev zlib1g-dev\
libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev\
libncursesw5-dev xz-utils tk-dev libffi-dev liblzma-dev python-openssl\
git
```

```console
git clone https://github.com/pyenv/pyenv.git ~/.pyenv
```

```console
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(pyenv init --path)"' >> ~/.bashrc
```

```console
exec "$SHELL"
```

```console
pyenv install 3.9.1
```

Useful commands

```console
pyenv install --list
pyenv versions
```



## Virtualenv

```console
git clone https://github.com/pyenv/pyenv-virtualenv.git $(pyenv root)/plugins/pyenv-virtualenv
```

```console
echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.bashrc
exec "$SHELL"
```

```console
pyenv virtualenv 3.9.1 ai
pyenv global ai
```

Or only set to local in a folder

```console
pyenv local ai
```

Or only activate and deactivate on demand

```console
pyenv activate ai
pyenv deactivate
```


## ROS Noetic

```console
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -
```

```console
sudo apt update
sudo apt install ros-noetic-desktop-full
```

```console
echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc
source ~/.bashrc
```

```console
pyenv activate ai
pip install rosdep rosinstall rosinstall-generator wstool catkin_tools
```


## ROS Workspace

```console
mkdir -p ~/catkin_ws/src
cd ~/catkin_ws
```

```console
catkin init
catkin build
```

```console
source devel/setup.bash
```

You can add that to .bashrc if you want

```console
echo "source ~/catkin_ws/devel/setup.bash" >> ~/.bashrc
```

To build packages in release mode

```console
cd ~/catkin_ws/
catkin config -DCMAKE_BUILD_TYPE=Release
```
