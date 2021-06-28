#!/bin/bash

echo 'Setting up your Mac...'

# Hide "last login" line when starting a new terminal session
touch $HOME/.hushlogin

# Add global gitignore
ln -s $HOME/.dotfiles/shell/.gitignore_global $HOME/.gitignore_global
git config --global core.excludesfile $HOME/.gitignore_global

# Install zsh
echo 'Install oh-my-zsh'
echo '-----------------'
rm -rf $HOME/.oh-my-zsh
curl -L https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh

# Symlink zsh prefs
rm $HOME/.zshrc
ln -s $HOME/.dotfiles/shell/.zshrc $HOME/.zshrc

# Fix missing font characters (see https://github.com/robbyrussell/oh-my-zsh/issues/1906)
cd ~/.oh-my-zsh/themes/
git checkout d6a36b1 agnoster.zsh-theme

echo 'Install homebrew'
echo '----------------'
echo install homebrew
sudo rm -rf /usr/local/Cellar /usr/local/.git && brew cleanup
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

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

echo 'Configure npm'
echo '-------------'
# Create a directory for global packages and tell npm where to store globally installed packages
mkdir "${HOME}/.npm-packages"
npm config set prefix "${HOME}/.npm-packages"

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

# Create optional directory
mkdir "${HOME}/GitHub"
mkdir "${HOME}/Sites"

echo 'All done!'
echo 'Restart your computer to finalize the process'
