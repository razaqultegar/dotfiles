# Compress folder
compress() {
  if [ -z "$1" ]; then
    echo "Usage: compress <directory>"
    return 1
  fi

  echo -e "⏱️ Creating zip archive..."
  zip -r "${1%/}.zip" "$1" -x "*.DS_Store" > /dev/null 2>&1

  echo -e "\n✅ Done!"
}

# Extract archive
extract() {
  if [ -z "$1" ]; then
    echo "Usage: extract <archive>"
    return 1
  fi

  case "$1" in
    *.zip)
      echo -e "⏱️ Extracting zip archive..."
      unzip "$1" -d "${1%.*}" > /dev/null 2>&1
      ;;
    *.rar)
      echo -e "⏱️ Extracting rar archive..."
      unrar x "$1" "${1%.*}" > /dev/null 2>&1
      ;;
    *.tar.gz|*.tgz)
      echo -e "⏱️ Extracting tar.gz archive..."
      tar -xzf "$1" -C "${1%.*}" > /dev/null 2>&1
      ;;
    *.tar.bz2|*.tbz2)
      echo -e "⏱️ Extracting tar.bz2 archive..."
      tar -xjf "$1" -C "${1%.*}" > /dev/null 2>&1
      ;;
    *.tar.xz|*.txz)
      echo -e "⏱️ Extracting tar.xz archive..."
      tar -xJf "$1" -C "${1%.*}" > /dev/null 2>&1
      ;;
    *.7z)
      echo -e "⏱️ Extracting 7z archive..."
      7z x "$1" -o"${1%.*}" > /dev/null 2>&1
      ;;
    *)
      echo "Unsupported archive format"
      return 1
      ;;
  esac

  echo -e "\n✅ Done!"
}

# Get size of folder or file
sizeof() {
  if [ -z "$1" ]; then
    echo "Usage: sizeof <directory|file>"
    return 1
  fi

  if [ ! -e "$1" ]; then
    echo "Error: $1 does not exist"
    return 1
  fi

  du -sh "$1"
}