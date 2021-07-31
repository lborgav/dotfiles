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

```sh
git clone --bare https://github.com/lborgav/dotfiles.git $HOME/.df

function dotfiles {
   /usr/bin/git --git-dir=$HOME/.df/ --work-tree=$HOME $@
}

mkdir -p .dotfiles-backup

dotfiles checkout

if [ $? = 0 ]; then
  echo "Checked out config.";
  else
    echo "Backing up pre-existing dot files.";
    dotfiles checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .dotfiles-backup/{}
fi;

dotfiles checkout
dotfiles config status.showUntrackedFiles no
```

Now, run **sh .bootstrap-mac**
