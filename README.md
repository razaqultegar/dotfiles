## Introduction

This repository serves as my way to help me setup and maintain my Mac. It takes the effort out of installing everything manually. Everything needed to install my preferred setup of macOS is detailed in this readme. Feel free to explore, learn and copy parts for your own dotfiles. Enjoy!

## Getting Started

If you did all of the above you may now follow these install instructions to setup a new Mac.

1. [Generate a new public and private SSH key](https://docs.github.com/en/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent) by running:

  ```bash
  curl https://raw.githubusercontent.com/razaqultegar/dotfiles/HEAD/ssh.sh | sh -s "<your-email-address>"
  ```

2. Clone this repo to `~/.dotfiles` with:

  ```zsh
  git clone git@github.com:razaqultegar/dotfiles.git ~/.dotfiles
  ```

3. Run `~/.dotfiles/install.sh` to start the installation
4. Restart your computer to finalize the process

## Configuration

Things to do to make the agnoster terminal theme work:

1. Install menlo patched font included in `.dotfiles/misc` folder or download [Menlo Powerline](https://gist.github.com/qrush/1595572/raw/Menlo-Powerline.otf).
2. Install patched solarized theme included in same folder (`.dotfiles/misc`).

## Optional

1. Make a `.dotfiles-custom/shell/.aliases` for your personal commands.
2. Make a `~/.dotfiles/opt/app.sh` for your required applications.
3. Make a `~/.dotfiles/opt/clone.sh` for clone your required repository.
