# ==============================================================================
# Hosterbyte Skins Suite - Master Auto Installer for Hermes Agent
# Windows PowerShell
# Repository: https://github.com/mrburgercheese/HB-Hermes-Skin
# ==============================================================================
param (
    [string]$Skin = "all" # Opsi: sage, dark, all
)

$ErrorActionPreference = "Stop"

if ($env:HERMES_HOME) {
    $SkinsDir = Join-Path $env:HERMES_HOME "skins"
} elseif ($env:LOCALAPPDATA) {
    $SkinsDir = Join-Path $env:LOCALAPPDATA "hermes\skins"
} else {
    $SkinsDir = Join-Path $HOME ".hermes\skins"
}

if (-not (Test-Path $SkinsDir)) {
    New-Item -ItemType Directory -Path $SkinsDir -Force | Out-Null
}

function Install-SingleSkin ($name) {
    $target = Join-Path $SkinsDir "$name.yaml"
    $localFile = Join-Path $PSScriptRoot "$name\skin.yaml"
    $rawUrl = "https://raw.githubusercontent.com/mrburgercheese/HB-Hermes-Skin/main/$name/skin.yaml"

    Write-Host "📦 Memasang skin '$name'..." -ForegroundColor Cyan
    if (Test-Path $localFile) {
        Copy-Item -Path $localFile -Destination $target -Force
    } else {
        Invoke-WebRequest -Uri $rawUrl -OutFile $target -UseBasicParsing
    }
    Write-Host "  ✓ Tersimpan di: $target" -ForegroundColor Green
}

Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor DarkGreen
Write-Host "🌿 HOSTERBYTE HERMES SKINS INSTALLER" -ForegroundColor Green
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor DarkGreen

switch ($Skin.ToLower()) {
    "sage" {
        Install-SingleSkin "hosterbyte-sage"
        $ActiveSkin = "hosterbyte-sage"
    }
    "light" {
        Install-SingleSkin "hosterbyte-sage"
        $ActiveSkin = "hosterbyte-sage"
    }
    "dark" {
        Install-SingleSkin "hosterbyte-dark"
        $ActiveSkin = "hosterbyte-dark"
    }
    "evergreen" {
        Install-SingleSkin "hosterbyte-dark"
        $ActiveSkin = "hosterbyte-dark"
    }
    default {
        Install-SingleSkin "hosterbyte-sage"
        Install-SingleSkin "hosterbyte-dark"
        $ActiveSkin = "hosterbyte-dark"
    }
}

Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor DarkGreen
if (Get-Command hermes -ErrorAction SilentlyContinue) {
    hermes config set display.skin $ActiveSkin
    Write-Host "✨ [SUKSES] Skin aktif diset ke: $ActiveSkin" -ForegroundColor Green
} else {
    Write-Host "✨ [SELESAI] Seluruh berkas skin berhasil dipasang!" -ForegroundColor Green
    Write-Host "ℹ️  Pilih skin dengan perintah:" -ForegroundColor Yellow
    Write-Host "   hermes config set display.skin hosterbyte-sage  # Light Mode" -ForegroundColor White
    Write-Host "   hermes config set display.skin hosterbyte-dark  # Dark Mode" -ForegroundColor White
}
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor DarkGreen
