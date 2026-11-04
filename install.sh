#!/usr/bin/env bash
# ==============================================================================
# Hosterbyte Skins Suite - Master Auto Installer for Hermes Agent
# Linux, macOS, & Windows (WSL / Git Bash)
# Repository: https://github.com/mrburgercheese/HB-Hermes-Skin
# ==============================================================================
set -e

CHOICE="${1:-all}" # opsi: sage, dark, all

# Tentukan direktori skins
if [ -n "$HERMES_HOME" ]; then
    SKINS_DIR="$HERMES_HOME/skins"
elif [ -d "$HOME/AppData/Local/hermes" ]; then
    SKINS_DIR="$HOME/AppData/Local/hermes/skins"
elif [ -n "$LOCALAPPDATA" ] && [ -d "$LOCALAPPDATA/hermes" ]; then
    SKINS_DIR="$LOCALAPPDATA/hermes/skins"
else
    SKINS_DIR="$HOME/.hermes/skins"
fi

SKINS_DIR_WIN=""
if [ -d "/mnt/c/Users/$USER/AppData/Local/hermes" ]; then
    SKINS_DIR_WIN="/mnt/c/Users/$USER/AppData/Local/hermes/skins"
fi

mkdir -p "$SKINS_DIR"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" 2>/dev/null && pwd)"

install_skin() {
    local name="$1"
    local raw_url="https://raw.githubusercontent.com/mrburgercheese/HB-Hermes-Skin/main/${name}/skin.yaml"
    local target="$SKINS_DIR/${name}.yaml"
    
    echo "📦 Memasang skin '$name'..."
    if [ -f "$SCRIPT_DIR/${name}/skin.yaml" ]; then
        cp "$SCRIPT_DIR/${name}/skin.yaml" "$target"
    else
        curl -fsSL "$raw_url" -o "$target"
    fi

    if [ -n "$SKINS_DIR_WIN" ] && [ -d "$SKINS_DIR_WIN" ]; then
        cp "$target" "$SKINS_DIR_WIN/${name}.yaml"
    fi
    echo "  ✓ Berkas tersimpan di: $target"
}

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "🌿 HOSTERBYTE HERMES SKINS INSTALLER"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

case "$CHOICE" in
    sage|light)
        install_skin "hosterbyte-sage"
        ACTIVE_SKIN="hosterbyte-sage"
        ;;
    dark|evergreen)
        install_skin "hosterbyte-dark"
        ACTIVE_SKIN="hosterbyte-dark"
        ;;
    all|*)
        install_skin "hosterbyte-sage"
        install_skin "hosterbyte-dark"
        ACTIVE_SKIN="hosterbyte-dark"
        ;;
esac

# Pasang desktop plugin lexa-welcome jika tersedia
if [ -d "$SCRIPT_DIR/desktop-plugins/lexa-welcome" ]; then
    PLUGIN_TARGET=""
    if [ -n "$HERMES_HOME" ]; then
        PLUGIN_TARGET="$HERMES_HOME/desktop-plugins/lexa-welcome"
    elif [ -d "$HOME/AppData/Local/hermes" ]; then
        PLUGIN_TARGET="$HOME/AppData/Local/hermes/desktop-plugins/lexa-welcome"
    elif [ -n "$LOCALAPPDATA" ] && [ -d "$LOCALAPPDATA/hermes" ]; then
        PLUGIN_TARGET="$LOCALAPPDATA/hermes/desktop-plugins/lexa-welcome"
    else
        PLUGIN_TARGET="$HOME/.hermes/desktop-plugins/lexa-welcome"
    fi

    echo "🧩 Memasang desktop plugin 'lexa-welcome'..."
    mkdir -p "$PLUGIN_TARGET"
    cp -r "$SCRIPT_DIR/desktop-plugins/lexa-welcome/"* "$PLUGIN_TARGET/"
    if [ -n "$SKINS_DIR_WIN" ] && [ -d "/mnt/c/Users/$USER/AppData/Local/hermes" ]; then
        mkdir -p "/mnt/c/Users/$USER/AppData/Local/hermes/desktop-plugins/lexa-welcome"
        cp -r "$SCRIPT_DIR/desktop-plugins/lexa-welcome/"* "/mnt/c/Users/$USER/AppData/Local/hermes/desktop-plugins/lexa-welcome/"
    fi
    echo "  ✓ Plugin lexa-welcome tersimpan di: $PLUGIN_TARGET"
fi

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
if command -v hermes >/dev/null 2>&1; then
    hermes config set display.skin "$ACTIVE_SKIN"
    echo "✨ [SUKSES] Skin aktif diset ke: $ACTIVE_SKIN"
elif [ -n "$SKINS_DIR_WIN" ] && command -v hermes.exe >/dev/null 2>&1; then
    hermes.exe config set display.skin "$ACTIVE_SKIN"
    echo "✨ [SUKSES] Skin aktif diset ke: $ACTIVE_SKIN (Windows)"
else
    echo "✨ [SELESAI] Seluruh berkas skin berhasil dipasang!"
    echo "ℹ️  Pilih skin dengan perintah:"
    echo "   hermes config set display.skin hosterbyte-sage  # Light Mode"
    echo "   hermes config set display.skin hosterbyte-dark  # Dark Mode"
fi
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
