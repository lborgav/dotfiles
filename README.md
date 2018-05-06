<img src="https://i.imgur.com/XW6tppE.png" title="source: imgur.com" />

## About this system

This system is totally based on git.
So, we gonna have our dotfiles and scripts always versioned in the $HOME folder.

Right now, this is mac only

_Reference: [best-way-to-store-dotfiles-git-bare-repo](https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/)_


## Installing dotfiles on a new computer

```sh
git clone --bare https://github.com/lborgav/dotfiles.git $HOME/.cfg

function config {
   /usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME $@
}

mkdir -p .config-backup
config checkout

if [ $? = 0 ]; then
  echo "Checked out config.";
  else
    echo "Backing up pre-existing dot files.";
    config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .config-backup/{}
fi;
config checkout
config config status.showUntrackedFiles no

```
