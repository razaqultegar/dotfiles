# Shortcuts
alias l="/usr/local/Cellar/coreutils/9.6/libexec/gnubin/ls -AhlFo --color --group-directories-first"
alias t="tree --gitignore"
alias copyssh="pbcopy < $HOME/.ssh/id_ed25519.pub"
alias reloadshell="omz reload"
alias reloaddns="dscacheutil -flushcache && sudo killall -HUP mDNSResponder"

# Directories
alias dotfiles="cd $DOTFILES"
alias library="cd $HOME/Library"
alias projects="cd $HOME/Code"
alias sites="cd $HOME/Sites"

# Git
alias log="git log --oneline --decorate --color"
alias status="git status"
alias pull="git pull"
alias push="git push"

# JS
alias check="yarn upgrade-interactive --latest"
alias nfresh="rm -rf node_modules/ package-lock.json && npm install"
alias yfresh="rm -rf node_modules/ package-lock.json && yarn"
alias watch="npm run watch"

# PHP
alias cda="composer dump-autoload -o"
alias cfresh="rm -rf vendor/ composer.lock && composer i"
alias 74="brew unlink php && brew link php@7.4 --force --overwrite"
alias 84="brew unlink php@7.4 && brew link php --force --overwrite"

# Laravel
alias fresh="php artisan migrate:fresh --seed"
alias migrate="php artisan migrate"
alias optimize="php artisan optimize:clear"
alias seed="php artisan db:seed"
alias serve="php artisan serve"
