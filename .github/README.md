# . files

## About this system

This system is totally based on git.
So, we gonna have our dotfiles and scripts always versioned in the "HOME" folder.

Right now, this is mac only

_Reference: [best-way-to-store-dotfiles-git-bare-repo](https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/)_

## Repository Structure

#### Shell environment

* `.aliases`
* `.exports`
* `.zshrc` - My ZSH config
* `.functions` - Small utilitary shell functions

#### Git

* `.gitconfig` - Personal git preferences

#### NeoVIM

* `.config/nvim/init.vim`

#### Command lines and Apps

* `.brew` - Command line tools using Homebrew
* `.cask` - Applications using Homebrew Cask
* `.mas` - Mac App Store apps
* `.npm-apps` - Global npm applications
* `.py-apps` - Global python applications

#### Setup

* `.bootstrap-mac` - Setup my personal macbook
* `.macos` - Personal macbook preferences

## Installing dotfiles on a new computer

### Quick install (one-liner)

```sh
curl -sSL https://raw.githubusercontent.com/lborgav/dotfiles/master/install.sh | bash
```

Then reload your shell:
```sh
source ~/.zshrc
```

## Post-installation

After installing dotfiles, you can optionally run the bootstrap script to install packages and configure macOS preferences:

```sh
sh ~/.bootstrap-mac
```
