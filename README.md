# Pyenv + Virtualenv + ROS Noetic

## Pyenv


    sudo apt update && sudo apt upgrade -y

Install dependencies

    sudo apt install -y make build-essential libssl-dev zlib1g-dev\
    libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev\
    libncursesw5-dev xz-utils tk-dev libffi-dev liblzma-dev python-openssl\
    git

Clone Pyenv

    git clone https://github.com/pyenv/pyenv.git ~/.pyenv

Set environment variables

    echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
    echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
    echo 'eval "$(pyenv init --path)"' >> ~/.bashrc

    exec "$SHELL"
    
Install the desired Python version
    
    pyenv install 3.9.1


Other useful commands

    pyenv install --list
    pyenv versions


## Pyenv Virtualenv Plugin

Clone Virtualenv Pyenv plugin

    git clone https://github.com/pyenv/pyenv-virtualenv.git $(pyenv root)/plugins/pyenv-virtualenv

Set environment variables

    echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.bashrc
    exec "$SHELL"

Create an enviroment named "ai" and set it as the global python interpreter

    pyenv virtualenv 3.9.1 ai
    pyenv global ai

Or only set to local in a folder

    pyenv local ai

Or only activate and deactivate on demand

    pyenv activate ai
    pyenv deactivate


## ROS Noetic

Add keys

    sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
    curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -

Update and install ROS Noetic Desktop

    sudo apt update
    sudo apt install ros-noetic-desktop-full

Set environment variables

    echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc
    source ~/.bashrc

Install the ROS Python tools

    pyenv activate ai
    pip install rosdep rosinstall rosinstall-generator wstool catkin_tools


## ROS Workspace

Create the workspace

    mkdir -p ~/catkin_ws/src
    cd ~/catkin_ws

Initialize the workspace

    catkin init
    catkin build
  
Source the setup.bash file (repeat after a build)

    source devel/setup.bash

You can add that to .bashrc if you want (but you still have to call it after a build)

    echo "source ~/catkin_ws/devel/setup.bash" >> ~/.bashrc

To build packages in release mode

    cd ~/catkin_ws/
    catkin config -DCMAKE_BUILD_TYPE=Release

