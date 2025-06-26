#!/usr/bin/env zsh

# Get the directory where this script is located
DOTFILES_DIR="$(cd "$(dirname "${(%):-%x}")" && pwd)"

# Create symlinks for dotfiles
ln -sf $DOTFILES_DIR/.zshrc $HOME/.zshrc
ln -sf $DOTFILES_DIR/.zprofile $HOME/.zprofile
ln -sf $DOTFILES_DIR/.claude.json $HOME/.claude.json

# Create .claude directory if it doesn't exist and symlink only commands
mkdir -p $HOME/.claude
ln -sf $DOTFILES_DIR/.claude/commands $HOME/.claude/commands

echo "Symlinks created successfully!"