#!/usr/bin/env bash
set -euo pipefail

export ZSH="${ZSH:-$HOME/.oh-my-zsh}"
export ZSH_CUSTOM="${ZSH_CUSTOM:-$ZSH/custom}"
export PLUGIN_DIR="$ZSH_CUSTOM/plugins"
export THEME_DIR="$ZSH_CUSTOM/themes/powerlevel10k"

if [[ ! -d "$ZSH" ]]; then
    git clone --depth=1 https://github.com/ohmyzsh/ohmyzsh.git "$ZSH"
fi

if [[ ! -d "$THEME_DIR/.git" ]]; then
    git clone --depth=1 \
        https://github.com/romkatv/powerlevel10k.git \
        "$THEME_DIR"
fi


if [[ ! -d "$PLUGIN_DIR/zsh-autosuggestions" ]]; then
    git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions.git "$PLUGIN_DIR/zsh-autosuggestions"
fi

if [[ ! -d "$PLUGIN_DIR/zsh-syntax-highlighting" ]]; then
    git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting.git "$PLUGIN_DIR/zsh-syntax-highlighting"
fi

if [[ ! -f "$HOME/.zshrc" ]]; then
    cp "$ZSH/templates/zshrc.zsh-template" "$HOME/.zshrc"
fi

echo '--- set zsh plugin and theme ---'
echo 'set: ZSH_THEME="powerlevel10k/powerlevel10k"'
echo 'set: plugins=(git zsh-autosuggestions zsh-syntax-highlighting)'
echo '---'


echo "Oh My Zsh installed at: $ZSH"
echo "Plugins installed at: $PLUGIN_DIR"
echo "Powerlevel10k theme installed at: $THEME_DIR"
