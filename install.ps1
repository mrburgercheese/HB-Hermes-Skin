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

# Pasang desktop plugin lexa-welcome jika tersedia
$pluginSource = Join-Path $PSScriptRoot "desktop-plugins\lexa-welcome"
if (Test-Path $pluginSource) {
    if ($env:HERMES_HOME) {
        $pluginTarget = Join-Path $env:HERMES_HOME "desktop-plugins\lexa-welcome"
    } elseif ($env:LOCALAPPDATA) {
        $pluginTarget = Join-Path $env:LOCALAPPDATA "hermes\desktop-plugins\lexa-welcome"
    } else {
        $pluginTarget = Join-Path $HOME ".hermes\desktop-plugins\lexa-welcome"
    }
    Write-Host "🧩 Memasang desktop plugin 'lexa-welcome'..." -ForegroundColor Cyan
    if (-not (Test-Path $pluginTarget)) {
        New-Item -ItemType Directory -Path $pluginTarget -Force | Out-Null
    }
    Copy-Item -Path "$pluginSource\*" -Destination $pluginTarget -Recurse -Force
    Write-Host "  ✓ Plugin lexa-welcome tersimpan di: $pluginTarget" -ForegroundColor Green
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
