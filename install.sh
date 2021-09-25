#!/bin/bash

echo 'Setting up your Mac...'

# Hide "last login" line when starting a new terminal session
touch $HOME/.hushlogin

# Check for Oh My Zsh and install if we don't have it
echo 'Checking oh-my-zsh'
if test ! $(which omz); then
  /bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/HEAD/tools/install.sh)"
fi

# Check for Homebrew and install if we don't have it
echo 'Checking homebrew'
if test ! $(which brew); then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Create a directory for global my project, this optional
mkdir "${HOME}/Developments"
mkdir "${HOME}/GitHub"
mkdir "${HOME}/Sites"

# Installing required packages
brew install mysql
brew services start mysql
brew install node
brew install yarn
brew install php@7.4

# Installing Composer
EXPECTED_COMPOSER_CHECKSUM="$(curl https://composer.github.io/installer.sig)"
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
ACTUAL_COMPOSER_CHECKSUM="$(php -r "echo hash_file('sha384', 'composer-setup.php');")"
if [ "$EXPECTED_COMPOSER_CHECKSUM" != "$ACTUAL_COMPOSER_CHECKSUM" ]
then
  >&2 echo 'ERROR: Invalid installer checksum'
  rm composer-setup.php
  exit 1
fi
php composer-setup.php
rm composer-setup.php
mv composer.phar /usr/local/bin/composer

# Installing Laravel
composer global require laravel/installer

# Symlink zsh prefs
rm -rf $HOME/.zshrc
ln -s $HOME/.dotfiles/shell/.zshrc $HOME/.zshrc

# Add global .gitignore
ln -s $HOME/.dotfiles/shell/.gitignore_global $HOME/.gitignore_global
git config --global core.excludesfile $HOME/.gitignore_global

# Set default MySQL root password and auth type
mysql -u root -e "ALTER USER root@localhost IDENTIFIED WITH mysql_native_password BY 'password'; FLUSH PRIVILEGES;"

# Create a directory for global packages and tell npm where to store globally installed packages
mkdir "${HOME}/.npm-packages"
npm config set prefix "${HOME}/.npm-packages"

echo 'Install required applications'
echo 'This will take a long time. Are you sure you want to to this? (y/n) '
read -p 'Answer: '  reply

if [[ $reply =~ ^[Yy]$ ]]
then
  source ~/.dotfiles/opt/app.sh
fi

echo 'All done! Please restart your computer to finalize the process'
