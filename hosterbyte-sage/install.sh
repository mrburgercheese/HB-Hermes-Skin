#!/usr/bin/env bash
# ==============================================================================
# Hosterbyte Sage (Light) - Auto Installer for Hermes Agent
# Linux, macOS, & Windows (WSL / Git Bash)
# Repository: https://github.com/mrburgercheese/HB-Hermes-Skin
# ==============================================================================
set -e

SKIN_NAME="hosterbyte-sage"
RAW_URL="https://raw.githubusercontent.com/mrburgercheese/HB-Hermes-Skin/main/hosterbyte-sage/skin.yaml"

echo "🌿 [Hosterbyte Sage] Memulai instalasi skin..."

# 1. Tentukan direktori skins Hermes
if [ -n "$HERMES_HOME" ]; then
    SKINS_DIR="$HERMES_HOME/skins"
elif [ -d "$HOME/AppData/Local/hermes" ]; then
    SKINS_DIR="$HOME/AppData/Local/hermes/skins"
elif [ -n "$LOCALAPPDATA" ] && [ -d "$LOCALAPPDATA/hermes" ]; then
    SKINS_DIR="$LOCALAPPDATA/hermes/skins"
else
    SKINS_DIR="$HOME/.hermes/skins"
fi

# Deteksi jika dijalankan di WSL dengan Hermes di Windows
SKINS_DIR_WIN=""
if [ -d "/mnt/c/Users/$USER/AppData/Local/hermes" ]; then
    SKINS_DIR_WIN="/mnt/c/Users/$USER/AppData/Local/hermes/skins"
fi

mkdir -p "$SKINS_DIR"
TARGET_FILE="$SKINS_DIR/${SKIN_NAME}.yaml"

# 2. Salin dari lokal jika ada atau unduh dari GitHub
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" 2>/dev/null && pwd)"
if [ -f "$SCRIPT_DIR/skin.yaml" ]; then
    cp "$SCRIPT_DIR/skin.yaml" "$TARGET_FILE"
    echo "🌿 [OK] Menggunakan berkas lokal skin.yaml -> $TARGET_FILE"
else
    echo "🌐 [INFO] Mengunduh skin dari GitHub..."
    curl -fsSL "$RAW_URL" -o "$TARGET_FILE"
    echo "🌿 [OK] Berhasil mengunduh -> $TARGET_FILE"
fi

if [ -n "$SKINS_DIR_WIN" ] && [ -d "$SKINS_DIR_WIN" ]; then
    cp "$TARGET_FILE" "$SKINS_DIR_WIN/${SKIN_NAME}.yaml"
    echo "🌿 [OK] Tersinkron ke Windows: $SKINS_DIR_WIN/${SKIN_NAME}.yaml"
fi

# 3. Aktifkan skin secara otomatis jika hermes CLI tersedia
if command -v hermes >/dev/null 2>&1; then
    hermes config set display.skin "$SKIN_NAME"
    echo "✨ [SUKSES] Skin '$SKIN_NAME' berhasil dipasang dan diaktifkan!"
elif [ -n "$SKINS_DIR_WIN" ] && command -v hermes.exe >/dev/null 2>&1; then
    hermes.exe config set display.skin "$SKIN_NAME"
    echo "✨ [SUKSES] Skin '$SKIN_NAME' berhasil dipasang dan diaktifkan di Windows!"
else
    echo "✨ [SUKSES] Berkas skin terpasang di: $TARGET_FILE"
    echo "ℹ️  Jalankan perintah berikut untuk mengaktifkan:"
    echo "   hermes config set display.skin $SKIN_NAME"
fi
