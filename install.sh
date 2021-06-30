#!/bin/bash

echo 'Setting up your Mac...'

# Hide "last login" line when starting a new terminal session
touch $HOME/.hushlogin

# Check for Oh My Zsh and install if we don't have it
echo 'Checking oh-my-zsh'
echo '-----------------'
if test ! $(which omz); then
  echo 'Install oh-my-zsh'
  rm -rf $HOME/.oh-my-zsh
  /bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/HEAD/tools/install.sh)"
fi

# Check for Homebrew and install if we don't have it
echo 'Checking homebrew'
if test ! $(which brew); then
  echo 'Install homebrew'
  echo '----------------'
  sudo rm -rf /usr/local/Cellar /usr/local/.git && brew cleanup
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

echo 'Install git'
echo '-------------'
brew install git

echo 'Install mysql'
echo '-------------'
brew install mysql
brew services start mysql

echo 'Install node'
echo '------------'
brew install node

echo 'Install yarn'
echo '------------'
brew install yarn

echo 'Install php'
echo '-----------'
brew install php@7.4
brew install php@8.0

echo 'Install composer'
echo '----------------'
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

# Symlink zsh prefs
echo 'Configure zsh'
echo '------------'
rm $HOME/.zshrc
ln -s $HOME/.dotfiles/shell/.zshrc $HOME/.zshrc

# Fix missing font characters (see https://github.com/robbyrussell/oh-my-zsh/issues/1906)
echo 'Configure themes'
echo '------------'
cd ~/.oh-my-zsh/themes/
git checkout d6a36b1 agnoster.zsh-theme

# Add global gitignore
echo 'Configure git'
echo '------------'
ln -s $HOME/.dotfiles/shell/.gitignore_global $HOME/.gitignore_global
git config --global core.excludesfile $HOME/.gitignore_global

# Set default MySQL root password and auth type
echo 'Configure mysql'
echo '------------'
mysql -u root -e "ALTER USER root@localhost IDENTIFIED WITH mysql_native_password BY 'password'; FLUSH PRIVILEGES;"

# Create a directory for global packages and tell npm where to store globally installed packages
echo 'Configure npm'
echo '-------------'
mkdir "${HOME}/.npm-packages"
npm config set prefix "${HOME}/.npm-packages"

echo 'Install required applications'
echo '------------------'
echo 'This will take a long time. Are you sure you want to to this? (y/n) '
read -p 'Answer: '  reply

if [[ $reply =~ ^[Yy]$ ]]
then
  source ~/.dotfiles/opt/app.sh
fi

echo 'Clone required repository'
echo '------------------'
echo 'This will take a long time. Are you sure you want to to this? (y/n) '
read -p 'Answer: '  reply

if [[ $reply =~ ^[Yy]$ ]]
then
  source ~/.dotfiles/opt/clone.sh
fi

echo '++++++++++++++++++++++++++++++'
echo '++++++++++++++++++++++++++++++'
echo 'All done!'
echo 'Things to do to make the agnoster terminal theme work:'
echo '1. Install menlo patched font included in ~/.dotfiles/misc https://gist.github.com/qrush/1595572/raw/Menlo-Powerline.otf'
echo '2. Install patched solarized theme included in ~/.dotfiles/misc'
echo '3. Restart your computer to finalize the process'
echo '++++++++++++++++++++++++++++++'
echo '++++++++++++++++++++++++++++++'
