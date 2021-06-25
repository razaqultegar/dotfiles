## Introduction

This repository serves as my way to help me setup and maintain my Mac. It takes the effort out of installing everything manually. Everything needed to install my preferred setup of macOS is detailed in this readme. Feel free to explore, learn and copy parts for your own dotfiles. Enjoy!

## Getting Started

You can install them by cloning the repository as `.dotfiles` in your home directory and running the bootstrap script.

```bash
git clone https://github.com/razaqultegar/dotfiles.git ~/.dotfiles
cd .dotfiles
./install.sh
```

Custom your applications bundle on `app.sh`, and run the command:

```bash
./app.sh
```

## Configuration

Things to do to make the agnoster terminal theme work:

1. Install menlo patched font included in `.dotfiles/misc` folder or download [Menlo Powerline](https://gist.github.com/qrush/1595572/raw/Menlo-Powerline.otf).
2. Install patched solarized theme included in same folder.
3. Make a `.dotfiles-custom/shell/.aliases` for your personal commands.
