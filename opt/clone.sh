#!/bin/sh

echo 'Create directory'
mkdir "${HOME}/GitHub"
mkdir "${HOME}/Sites"

echo 'Cloning repositories...'
# Personal
git clone git@github.com:razaqultegar/razaqultegar.com.git $HOME/GitHub/razaqultegar.com
git clone git@github.com:razaqultegar/notebook.git $HOME/GitHub/notebook

# Office
git clone git@github.com:razaqultegar/limbodigital-site.git $HOME/GitHub/limbodigital-site
git clone git@gitlab.com:biker-shop/biker-shop-server.git $HOME/Sites/biker-shop-server
git clone git@gitlab.com:limboproject/babershop.git $HOME/Sites/babershop
