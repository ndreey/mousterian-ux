#!/usr/bin/env bash

STAMP=$(date +"%Y-%m-%d_%Hh%Mm%Ss")
BAK="$HOME/oldowan-backup/$STAMP"

mkdir -p "$BAK"

echo "Backing up existing dotfiles and configs to $BAK..."

# Files to backup (add/remove as needed)
FILES=(
  "$HOME/.bashrc"
  "$HOME/.bashrc.bak"
  "$HOME/.profile"
  "$HOME/.gitconfig"
  "$HOME/.tmux.conf"
  "$HOME/.config/autostart"
  "$HOME/.config/gtk-3.0/settings.ini"
  "$HOME/.config/gtk-4.0/settings.ini"
  "$HOME/.config/Code/User/settings.json"
  "$HOME/.config/ulauncher/settings.json"
)

# Only backup files that exist
EXISTING=()
for f in "${FILES[@]}"; do
  [[ -e "$f" ]] && EXISTING+=("$f")
done

if [[ ${#EXISTING[@]} -eq 0 ]]; then
  echo "No existing dotfiles found. Nothing to backup."
  exit 0
fi

rsync -a --relative --remove-source-files "${EXISTING[@]}" "$BAK/"

echo "Backup complete."
echo "Path to the Oldowan site: $BAK"