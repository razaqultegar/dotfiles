## Load Composer tools
export PATH="$HOME/.composer/vendor/bin:$PATH"

## Load Node global installed binaries
export PATH="$HOME/.node/bin:$PATH"

# Sudoless npm https://github.com/sindresorhus/guides/blob/master/npm-global-without-sudo.md
NPM_PACKAGES="${HOME}/.npm-packages"
export PATH="$PATH:$NPM_PACKAGES/bin"

# PHP
export PATH="/usr/local/opt/php@7.4/bin:$PATH"
export PATH="/usr/local/opt/php@7.4/sbin:$PATH"
export PATH="/usr/local/sbin:$PATH"

# MySQL
export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"
