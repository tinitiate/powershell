#!/bin/sh

if brew --version > /dev/null; then 
  echo "brew is already installed"
else 
    echo "Installing brew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    
if python3 --version > /dev/null; then 
  echo "python3 is already installed"
else 
    echo "Installing python3..."
    brew install python
