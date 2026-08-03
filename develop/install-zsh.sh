#!/usr/bin/env bash
set -euo pipefail

export ZSH="${ZSH:-$HOME/.oh-my-zsh}"
export ZSH_CUSTOM="${ZSH_CUSTOM:-$ZSH/custom}"
export PLUGIN_DIR="$ZSH_CUSTOM/plugins"
export THEME_DIR="$ZSH_CUSTOM/themes/powerlevel10k"

mkdir -p "$HOME"
mkdir -p "$PLUGIN_DIR"
mkdir -p "$THEME_DIR"

if [ ! -d "$ZSH" ]; then
    git clone --depth=1 https://github.com/ohmyzsh/ohmyzsh.git "$ZSH"
fi

if [ ! -d "$PLUGIN_DIR/zsh-autosuggestions" ]; then
    git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions.git "$PLUGIN_DIR/zsh-autosuggestions"
fi

if [ ! -d "$PLUGIN_DIR/zsh-syntax-highlighting" ]; then
    git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting.git "$PLUGIN_DIR/zsh-syntax-highlighting"
fi

if [ ! -d "$THEME_DIR" ] || [ ! -f "$THEME_DIR/powerlevel10k.zsh-theme" ]; then
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$THEME_DIR"
fi

if [ ! -f "$HOME/.zshrc" ]; then
    cp "$ZSH/templates/zshrc.zsh-template" "$HOME/.zshrc"
fi

if grep -q '^ZSH_THEME=' "$HOME/.zshrc"; then
    sed -i 's|^ZSH_THEME=.*|ZSH_THEME="powerlevel10k/powerlevel10k"|' "$HOME/.zshrc"
else
    echo 'ZSH_THEME="powerlevel10k/powerlevel10k"' >> "$HOME/.zshrc"
fi

if ! grep -q 'zsh-autosuggestions' "$HOME/.zshrc" || ! grep -q 'zsh-syntax-highlighting' "$HOME/.zshrc"; then
    echo 'plugins=(git zsh-autosuggestions zsh-syntax-highlighting)' >> "$HOME/.zshrc"
fi

ensure_rc_block() {
    local rc_file="$1"

    if [ ! -f "$rc_file" ]; then
        return 0
    fi

    if grep -q 'nvs use lts' "$rc_file"; then
        return 0
    fi

    cat >> "$rc_file" <<'EOF'

# nvs init
[ -f "$HOME/.nvs/nvs.sh" ] && . "$HOME/.nvs/nvs.sh"
nvs use lts >/dev/null 2>&1 || true
EOF
}

CURRENT_SHELL="${SHELL##*/}"

case "$CURRENT_SHELL" in
    bash)
        ensure_rc_block "$HOME/.bashrc"
        ;;
    zsh)
        ensure_rc_block "$HOME/.zshrc"
        ;;
    *)
        echo "Skip rc file auto-init because no supported shell rc target was detected."
        ;;
esac

USER_NAME="${USER:-root}"
ZSH_BIN="$(command -v zsh || true)"

if [ -n "$ZSH_BIN" ]; then
    if command -v chsh >/dev/null 2>&1; then
        chsh -s "$ZSH_BIN" "$USER_NAME" || true
    fi

    if command -v usermod >/dev/null 2>&1; then
        usermod -s "$ZSH_BIN" "$USER_NAME" || true
    fi
fi

echo "Oh My Zsh installed at: $ZSH"
echo "Plugins installed at: $PLUGIN_DIR"
echo "Powerlevel10k theme installed at: $THEME_DIR"
