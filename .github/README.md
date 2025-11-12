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
git clone --bare https://github.com/lborgav/dotfiles.git "$HOME/.df"

function dotfiles {
  echo -e "\033[1;33m[⚠️  DOTFILES]\033[0m Using repo in \$HOME/.df" >&2
  echo "" >&2
  /usr/bin/git --git-dir=$HOME/.df/ --work-tree="$HOME" "$@";
  echo "" >&2
}

mkdir -p .dotfiles-backup

conflicts=$(dotfiles checkout 2>&1 | egrep "\s+\." | awk '{print $1}')

if [ -n "$conflicts" ]; then
  echo "⚠️  Conflicts founded. Copying conflicted files to backup..."
  echo "$conflicts" | while read -r file; do
    mkdir -p "$HOME/.dotfiles-backup/$(dirname "$file")"
    cp "$HOME/$file" "$HOME/.dotfiles-backup/$file"
  done
fi

dotfiles checkout
dotfiles config status.showUntrackedFiles no

echo "✅ Dotfiles installed!"
```

Now, run **sh .bootstrap-mac**
