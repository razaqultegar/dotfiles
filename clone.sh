#!/bin/sh

echo "Cloning repositories..."

SITES=$HOME/Sites

# Personal
git clone git@github.com:razaqultegar/razaqultegar.com.git $SITES/razaqultegar.com
git clone git@github.com:razaqultegar/notebook.git $SITES/notebook

# Office
git clone git@github.com:razaqultegar/limbodigital-site.git $SITES/limbodigital-site.git
