# 🌲 Hosterbyte Dark — Evergreen Dark Theme for Hermes Agent

Tema *Dark Mode* bernuansa hutan evergreen yang dalam dan tenang, terinspirasi dari identitas visual Hosterbyte dan antarmuka gelap [img.hosterbyte.com](https://img.hosterbyte.com/).

```
┌────────────────────────────────────────────────────────┐
│  🌲 VELVETY DEEP EVERGREEN — HOSTERBYTE                │
├────────────────────────────────────────────────────────┤
│  Latar Canvas  : #122017 (Velvety Deep Forest Canvas)  │
│  Teks Utama    : #F4F8F3 (Herbal Sage Crisp White)     │
│  Teks Isi      : #E1ECE3 (Soft Mint Cream)             │
│  Teks Sekunder : #7CA289 (Eucalyptus Slate Muted)      │
│  Aksen Brand   : #10B981 (Vibrant Emerald / Mint)      │
│  Tool Marker   : #10B981 (Glowing Emerald Spinner)     │
│  Border Line   : #224230 (Deep Forest Divider)         │
│  Status Sukses : #10B981 (Vibrant Emerald)             │
│  Status Peringatan: #FBBF24 (Sunlight Warm Amber)      │
│  Status Error  : #E11D48 (Retro Crimson Red)           │
└────────────────────────────────────────────────────────┘
```

---

## ⚡ Cara Pasang Cepat (1-Line Auto Installer)

### Linux / macOS / WSL:
```bash
curl -fsSL https://raw.githubusercontent.com/mrburgercheese/HB-Hermes-Skin/main/hosterbyte-dark/install.sh | bash
```

### Windows (PowerShell):
```powershell
irm https://raw.githubusercontent.com/mrburgercheese/HB-Hermes-Skin/main/hosterbyte-dark/install.ps1 | iex
```

---

## 🛠️ Instalasi Manual

1. Salin berkas `skin.yaml` ke direktori skins Hermes:
   - **Linux / macOS**: `~/.hermes/skins/hosterbyte-dark.yaml`
   - **Windows**: `%LOCALAPPDATA%\hermes\skins\hosterbyte-dark.yaml`
2. Aktifkan skin melalui CLI:
   ```bash
   hermes config set display.skin hosterbyte-dark
   ```

---

## ✨ Fitur Indikator Sesi Aktif & Mini-Badge (Desktop GUI)

Tema ini menyertakan injeksi `customCSS` bawaan yang mengoptimalkan pengalaman navigasi multi-sesi di Hermes Desktop:

- **Running Arc Border + Stardust**: Border card yang berputar halus memutari sesi aktif (`.arc-row`) lengkap dengan percikan kilau mint/putih diagonal.
- **6px High-Contrast Dimmer Dot**:
  - `working`: Electric Green `#00ff87` berdenyut lembut (halo 16px).
  - `stalled / bg`: Cincin hollow Electric Green dengan bagian tengah transparan.
  - `needs-input`: Sun Orange `#ff9500` berdenyut cepat (1.5s).
  - `unread`: Neon Magenta/Purple `#d946ef` bernapas tenang.
- **Stacked Status Badges**: Mini-badge monospace padat yang diletakkan persis di atas timestamp jam sesi (`WORKING`, `INPUT`, `NEW`, `STALLED`). Otomatis tersembunyi saat sesi idle.
