#!/bin/bash

echo "Setting up your Mac..."

# Hide "last login" line when starting a new terminal session
touch $HOME/.hushlogin

# Check for Oh My Zsh and install if we don't have it
if test ! $(which omz); then
  /bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/HEAD/tools/install.sh)"
fi

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Removes .zshrc folders (if it exists) and symlinks zsh prefs
rm -rf $HOME/.zshrc
ln -s $HOME/.dotfiles/.zshrc $HOME/.zshrc

# Installing binaries packages
brew install bash
brew install coreutils
brew install ffmpeg
brew install git
brew install httpie

# Installing development packages
brew install imagemagick
brew install php@7.4
brew install composer
brew install mysql
brew install node
brew install yarn

# Set default MySQL root password and auth type
mysql -u root -e "ALTER USER root@localhost IDENTIFIED WITH mysql_native_password BY 'password'; FLUSH PRIVILEGES;"

# Install global Composer packages
/usr/local/bin/composer global require laravel/installer

# Create a directory for global my project (this optional)
mkdir "${HOME}/.npm-packages"
mkdir "${HOME}/Development"
mkdir "${HOME}/GitHub"
mkdir "${HOME}/Sites"

# Create github subdirectories
mkdir "${HOME}/GitHub/Personal"
mkdir "${HOME}/GitHub/Work"

# Configure npm
npm config set prefix "${HOME}/.npm-packages"

# Add global .gitignore
ln -s $HOME/.dotfiles/.gitignore_global $HOME/.gitignore_global
git config --global core.excludesfile $HOME/.gitignore_global

echo "Install required applications"
echo "This will take a long time. Are you sure you want to to this? (y/n)"
read -p "Answer: "  reply

if [[ $reply =~ ^[Yy]$ ]] then
  source ~/.dotfiles/opt/app.sh
fi

echo "All done! Please restart your computer to finalize the process :)"
