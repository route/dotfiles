#!/usr/bin/env bash
set -e

DOTFILES=$HOME/.dotfiles

link() {
  src="$DOTFILES/$1"
  dst="$HOME/$2"

  ln -sf "$src" "$dst"
  echo "Linked $dst → $src"
}

link ".bash_profile" ".bash_profile"
link ".gemrc" ".gemrc"
link ".gitconfig" ".gitconfig"
link ".gitignore" ".gitignore"
link ".gitignore_global" ".gitignore_global"
link ".inputrc" ".inputrc"
link ".irbrc" ".irbrc"
link ".npmrc" ".npmrc"
link ".profile" ".profile"
link ".psqlrc" ".psqlrc"
link ".tmux.conf" ".tmux.conf"

# if [[ "$OSTYPE" == linux* ]]; then
#   link "linux/some_config" ".config/some_app/config"
# fi
# if [[ "$OSTYPE" == darwin* ]]; then
#   link "macos/some_config" ".config/some_app/config"
# fi

echo "Done!"
