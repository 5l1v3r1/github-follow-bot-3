#!/bin/bash

# Install dependencies
sudo apt-get update
sudo apt-get install -y git automake build-essential pkg-config libevent-dev libncurses-dev

# Clone the tmux repository
git clone https://github.com/tmux/tmux.git
cd tmux

# Run autogen.sh to generate the configure script
sh autogen.sh

# Configure, build, and install tmux
./configure
make
sudo make install

# Cleanup
cd ..
rm -rf tmux
