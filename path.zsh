# Add directories to the PATH and prevent to add the same directory multiple times upon shell reload.
add_to_path() {
  if [[ -d "$1" ]] && [[ ":$PATH:" != *":$1:"* ]]; then
    export PATH="$1:$PATH"
  fi
}

# Load dotfiles binaries
add_to_path "$DOTFILES/bin"

# Load global Composer tools
add_to_path "$HOME/.composer/vendor/bin"

# Load global Flutter
add_to_path "$HOME/Developments/flutter/bin"

# Load global MySQL
add_to_path "/usr/local/opt/mysql@8.0/bin"

# Load global Node
add_to_path "$HOME/.node/bin"

# Load global PHP
if command -v php &> /dev/null; then
  PHP_VERSION=$(php -r 'echo PHP_MAJOR_VERSION . "." . PHP_MINOR_VERSION;')
  if [[ "$PHP_VERSION" == "7.4" ]]; then
    add_to_path "/usr/local/opt/php@7.4/bin"
    add_to_path "/usr/local/opt/php@7.4/sbin"
  elif [[ "$PHP_VERSION" == "8.4" ]]; then
    add_to_path "/usr/local/opt/php@8.4/bin"
    add_to_path "/usr/local/opt/php@8.4/sbin"
  fi
else
  echo "PHP is not installed"
fi

# Use project specific binaries before global ones
add_to_path "node_modules/.bin"
add_to_path "vendor/bin"
