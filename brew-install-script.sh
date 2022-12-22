#!/bin/sh

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
brew install aws-sam-cli
pip3 install PyMySQL
pip3 install django
pip3 install djangorestframework
pip3 install pytz 
pip3 install psycopg2-binary
