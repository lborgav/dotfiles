#!/bin/bash

# Dotfiles installation script
# This script clones the dotfiles repository and sets up the home directory

set -e

REPO_URL="https://github.com/lborgav/dotfiles.git"
DOTFILES_DIR="$HOME/.df"
PREFIX_INFO="\033[1;36m[dotfiles]\033[0m"
PREFIX_WARN="\033[1;33m[⚠️  DOTFILES]\033[0m"
PREFIX_SUCCESS="\033[1;32m[✓]\033[0m"

echo -e "$PREFIX_INFO Starting installation..."
echo ""

# Clone the bare repository
echo -e "$PREFIX_WARN Using repo in \$HOME/.df" >&2
git clone --bare "$REPO_URL" "$DOTFILES_DIR"

# Define the dotfiles function
dotfiles() {
  echo -e "$PREFIX_WARN Using repo in $DOTFILES_DIR" >&2
  echo "" >&2
  /usr/bin/git --git-dir="$DOTFILES_DIR/" --work-tree="$HOME" "$@"
  echo "" >&2
}

# Create backup directory
mkdir -p "$HOME/.dotfiles-backup"

# Checkout and handle conflicts
echo -e "$PREFIX_INFO Checking for conflicts..."
conflicts=$(dotfiles checkout 2>&1 | egrep "\s+\." | awk '{print $1}')

if [ -n "$conflicts" ]; then
  echo -e "$PREFIX_WARN Conflicts found. Copying conflicted files to backup..."
  echo "$conflicts" | while read -r file; do
    mkdir -p "$HOME/.dotfiles-backup/$(dirname "$file")"
    cp "$HOME/$file" "$HOME/.dotfiles-backup/$file"
  done
fi

# Final checkout
dotfiles checkout

# Configure git to not show untracked files
dotfiles config status.showUntrackedFiles no

echo ""
echo -e "$PREFIX_SUCCESS Dotfiles installed successfully!"
echo ""
echo -e "$PREFIX_INFO Next steps:"
echo "  1. Run 'source ~/.zshrc' to reload your shell configuration"
echo "  2. (Optional) Run 'sh ~/.bootstrap-mac' to install packages and configure macOS"
