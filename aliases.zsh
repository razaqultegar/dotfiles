# Shortcuts
alias c="clear"
alias l="ls -laF"
alias ll="/opt/homebrew/opt/coreutils/libexec/gnubin/ls -AhlFo --color --group-directories-first"
alias copyssh="pbcopy < $HOME/.ssh/id_ed25519.pub"
alias reloadshell="source $HOME/.zshrc"
alias flushdns="dscacheutil -flushcache && sudo killall -HUP mDNSResponder"
alias ip="curl https://diagnostic.opendns.com/myip ; echo"
alias localip="ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"

# Directories
alias dotfiles="cd $HOME/.dotfiles"
alias dev="cd $HOME/Developments"
alias github="cd $HOME/GitHub"
alias personal="github && cd Personal/"
alias work="github && cd Work/"
alias sites="cd $HOME/Sites"

# PHP
alias cda="composer dump-autoload -o"
alias cfresh="rm -rf vendor/ composer.lock && composer update && composer install"
alias composer="php -d memory_limit=-1 /usr/local/bin/composer"
alias switch-php74="brew unlink php && brew link --overwrite --force php@7.4"

# Laravel
alias sl="php artisan serve"
alias fresh="php artisan migrate:fresh --seed"
alias seed="php artisan db:seed"

# JS
alias check="yarn upgrade-interactive --latest"
alias nfresh="rm -rf node_modules/ package-lock.json && npm install"
alias yfresh="rm -rf node_modules/ package-lock.json && yarn"
alias watch="npm run watch"

# Git
alias gb="git branch"
alias gc="git checkout"
alias gl="git log --oneline --decorate --color"
alias gst="git status"
alias force="git push --force"
alias pop="git stash pop"
alias pull="git pull"
alias push="git push"
alias reset="git clean -df && git reset --hard"
alias resolve="git add . && git commit --no-edit"
alias stash="git stash -u"
alias unstage="git restore --staged ."
