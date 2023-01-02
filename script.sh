#!/bin/sh

export HOMEBREW_BREW_GIT_REMOTE="..."  # put your Git mirror of Homebrew/brew here
export HOMEBREW_CORE_GIT_REMOTE="..."  # put your Git mirror of Homebrew/homebrew-core here

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

brew_install() {
    echo "\n Installing $1"
    if brew list $1 &> /dev/null; then
        echo "${1} is already installed"
    else 
        brew tap aws/tap
        brew install $1 && echo "$1 is installed"
    fi
}

brew_install "python" 
brew_install "visual-studio-code" 
brew_install "awscli" 
brew_install "aws-sam-cli" 
brew_install "dbeaver-community" 
brew_install "brew-pip"
brew_install "git"
brew_install "docker"
pip3 install PyMySQL
pip3 install django
pip3 install djangorestframework
pip3 install pytz 
pip3 install psycopg2-binary
