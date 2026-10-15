# ==============================================================================
# Hosterbyte Sage (Light) - Auto Installer for Hermes Agent
# Windows PowerShell
# Repository: https://github.com/mrburgercheese/HB-Hermes-Skin
# ==============================================================================
$ErrorActionPreference = "Stop"

$SkinName = "hosterbyte-sage"
$RawUrl   = "https://raw.githubusercontent.com/mrburgercheese/HB-Hermes-Skin/main/hosterbyte-sage/skin.yaml"

Write-Host "🌿 [Hosterbyte Sage] Memulai instalasi skin..." -ForegroundColor Cyan

# 1. Tentukan direktori skins Hermes
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

$TargetFile = Join-Path $SkinsDir "$SkinName.yaml"

# 2. Salin dari lokal jika ada atau unduh dari GitHub
$LocalFile = Join-Path $PSScriptRoot "skin.yaml"
if (Test-Path $LocalFile) {
    Copy-Item -Path $LocalFile -Destination $TargetFile -Force
    Write-Host "🌿 [OK] Menggunakan berkas lokal skin.yaml -> $TargetFile" -ForegroundColor Green
} else {
    Write-Host "🌐 [INFO] Mengunduh skin dari GitHub..." -ForegroundColor Cyan
    Invoke-WebRequest -Uri $RawUrl -OutFile $TargetFile -UseBasicParsing
    Write-Host "🌿 [OK] Berhasil mengunduh -> $TargetFile" -ForegroundColor Green
}

# 3. Aktifkan skin jika hermes CLI tersedia
if (Get-Command hermes -ErrorAction SilentlyContinue) {
    hermes config set display.skin $SkinName
    Write-Host "✨ [SUKSES] Skin '$SkinName' berhasil dipasang dan diaktifkan!" -ForegroundColor Green
} else {
    Write-Host "✨ [SUKSES] Berkas skin terpasang di: $TargetFile" -ForegroundColor Green
    Write-Host "ℹ️  Jalankan perintah berikut untuk mengaktifkan:" -ForegroundColor Yellow
    Write-Host "   hermes config set display.skin $SkinName" -ForegroundColor White
}
