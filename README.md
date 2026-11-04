# 🌿 HB-Hermes-Skin — Official Hosterbyte Skin Suite for Hermes Agent

Kumpulan tema (skins) resmi **Hosterbyte** untuk [Hermes Agent](https://github.com/NousResearch/hermes-agent), kompatibel penuh dengan antarmuka **Desktop GUI**, **Ink TUI**, dan **CLI Terminal**.

Repositori ini disusun modular per folder sehingga memudahkan penambahan koleksi skin baru di masa mendatang.

```
┌────────────────────────────────────────────────────────────────────────┐
│                   🌿 HOSTERBYTE HERMES SKIN SUITE                      │
├────────────────────────────────────────────────────────────────────────┤
│  [1] hosterbyte-sage : Light Retro Sage Green (img.hosterbyte.com)     │
│  [2] hosterbyte-dark : Dark Retro Deep Evergreen (Hosterbyte Forest)   │
└────────────────────────────────────────────────────────────────────────┘
```

---

## 🎨 Katalog Tema

### 1. `hosterbyte-sage` (Light Mode)
Terinspirasi langsung dari antarmuka berbagi gambar retro [img.hosterbyte.com](https://img.hosterbyte.com/). Menampilkan nuansa hijau herbal adem yang nyaman di mata untuk sesi kerja siang hari.

- **Canvas Latar**: `#F4F8F3` (Herbal Sage Pastel)
- **Teks Utama**: `#132E20` (Deep Forest)
- **Aksen Brand**: `#2E7D52` (Matcha Green)
- **Teks Muted**: `#527863` (Eucalyptus Slate)
- **Status Ok / Warn / Error**: `#2E7D52` / `#B45309` / `#E11D48`

### 2. `hosterbyte-dark` (Dark Mode)
Varian malam bernuansa hutan evergreen yang dalam (*velvety deep forest*). Menghilangkan silau cahaya dengan mempertahankan kontras tinggi dan aksen emerald yang hidup. Dilengkapi **Interactive Session Status Indicators** (Running Arc, 6px High-Contrast Dimmer Dot, & Stacked Mini Status Badges).

- **Canvas Latar**: `#122017` (Deep Evergreen)
- **Teks Utama**: `#F4F8F3` (Herbal Sage White)
- **Teks Isi**: `#E1ECE3` (Soft Mint Cream)
- **Aksen Brand**: `#10B981` (Vibrant Emerald)
- **Teks Muted**: `#7CA289` (Eucalyptus Slate)
- **Status Ok / Warn / Error**: `#10B981` / `#FBBF24` / `#E11D48`

#### 💡 Spesifikasi Indikator Sesi Aktif (Desktop GUI):
- **Running Arc Border**: Animasi border gradien emerald menyala berkecepatan 2.2s memutari card sesi aktif dengan 4 layer percikan kilau stardust (`radial-gradient`).
- **6px Outer Dimmer Halo**: Inti dot 6px tajam dengan pendaran aura luar bernapas (*breathing dimmer pulse*) tanpa mengaburkan titik tengah.
- **Stacked Status Badges**: Mini badge monospace di atas jam sesi pada sidebar:
  - `WORKING` (Electric Green `#00ff87` pulse) — Sedang memproses turn / tool call.
  - `STALLED` (Electric Green Hollow dashed) — Turn hening / background process berjalan.
  - `INPUT` (Sun Orange `#ff9500` pulse 1.5s) — Menunggu konfirmasi / klarifikasi user.
  - `NEW` (Neon Magenta/Purple `#d946ef`) — Hasil turn selesai saat aplikasi di background.

---

### 🌟 Simulasi Visual Indikator Status & Mini-Badge

```text
┌────────────────────────────────────────────────────────┐
│ 🟢 APPS-BMCentral                          [ WORKING ] │  <-- Electric Green Pulse + Running Arc
│    gemini-3.8-flash-high · 102 msgs             now    │
├────────────────────────────────────────────────────────┤
│ 🟠 Cek log bm-attend gudang CAM            [  INPUT  ] │  <-- Sun Orange Pulse (Menunggu respon)
│    gemini-3.8-flash-high · 150 msgs             1m     │
├────────────────────────────────────────────────────────┤
│ 🟣 SOC - Graylog Alert Monitor             [   NEW   ] │  <-- Neon Purple (Turn selesai belum dibuka)
│    gemini-3.8-flash-high · 64 msgs              4m     │
├────────────────────────────────────────────────────────┤
│ ⚪ Cek drive 10TB server 152.2                         │  <-- Idle / Diam (Badge otomatis sembunyi)
│    gemini-3.8-flash-high · 42 msgs             22m     │
└────────────────────────────────────────────────────────┘
```

---

## ⚡ Instalasi Cepat (1-Line Auto Installer)

Pilih metode instalasi otomatis yang sesuai dengan sistem operasi Anda:

### 🌟 Pasang Semua Tema Sekaligus (Suite)

**Linux / macOS / WSL (Bash):**
```bash
curl -fsSL https://raw.githubusercontent.com/mrburgercheese/HB-Hermes-Skin/main/install.sh | bash
```

**Windows (PowerShell):**
```powershell
irm https://raw.githubusercontent.com/mrburgercheese/HB-Hermes-Skin/main/install.ps1 | iex
```

---

### 🌿 Pasang Hanya Skin Tertentu

#### A. Hosterbyte Sage (Light Mode)

- **Linux / macOS / WSL:**
  ```bash
  curl -fsSL https://raw.githubusercontent.com/mrburgercheese/HB-Hermes-Skin/main/hosterbyte-sage/install.sh | bash
  ```
- **Windows PowerShell:**
  ```powershell
  irm https://raw.githubusercontent.com/mrburgercheese/HB-Hermes-Skin/main/hosterbyte-sage/install.ps1 | iex
  ```

#### B. Hosterbyte Dark (Evergreen Dark Mode)

- **Linux / macOS / WSL:**
  ```bash
  curl -fsSL https://raw.githubusercontent.com/mrburgercheese/HB-Hermes-Skin/main/hosterbyte-dark/install.sh | bash
  ```
- **Windows PowerShell:**
  ```powershell
  irm https://raw.githubusercontent.com/mrburgercheese/HB-Hermes-Skin/main/hosterbyte-dark/install.ps1 | iex
  ```

---

## 🎮 Cara Beralih & Menggunakan Skin

Setelah terpasang, Anda dapat berpindah skin kapan saja menggunakan perintah resmi Hermes:

```bash
# Aktifkan Light Mode (Sage)
hermes config set display.skin hosterbyte-sage

# Aktifkan Dark Mode (Evergreen)
hermes config set display.skin hosterbyte-dark

# Cek daftar semua skin yang terpasang
hermes skin list

# Kembalikan ke skin default bawaan
hermes config set display.skin default
```

> **Tips Desktop GUI**: Jika beralih antara tema Light dan Dark di aplikasi Desktop Hermes, sesuaikan juga mode tampilan jendela via palette `Cmd+K` atau menu Appearance.

---

## 📁 Struktur Direktori Repositori

```
HB-Hermes-Skin/
├── install.sh                  # Master installer suite (Linux/macOS/WSL)
├── install.ps1                 # Master installer suite (Windows PowerShell)
├── README.md                   # Dokumentasi utama dan panduan lengkap
├── hosterbyte-sage/            # [LIGHT MODE] Referensi img.hosterbyte.com
│   ├── skin.yaml               # Definisi token warna hosterbyte-sage
│   ├── install.sh              # 1-line auto installer mandiri (Bash)
│   ├── install.ps1             # 1-line auto installer mandiri (PowerShell)
│   └── README.md               # Dokumentasi spesifik hosterbyte-sage
└── hosterbyte-dark/            # [DARK MODE] Hosterbyte Deep Evergreen
    ├── skin.yaml               # Definisi token warna hosterbyte-dark
    ├── install.sh              # 1-line auto installer mandiri (Bash)
    ├── install.ps1              # 1-line auto installer mandiri (PowerShell)
    └── README.md               # Dokumentasi spesifik hosterbyte-dark
```

---

## 🛠️ Panduan Menambah Skin Baru (Untuk Kontributor)

Untuk menambahkan tema baru ke dalam suite ini:

1. Buat folder baru dengan nama tema (misal: `hosterbyte-sunset/`).
2. Buat berkas `skin.yaml` di dalam folder tersebut mengacu pada spesifikasi skema skin Hermes:
   ```yaml
   name: hosterbyte-sunset
   description: Tema Hermes bernuansa sunset
   colors:
     background: "#..."
     ui_accent: "#..."
     # ...
   ```
3. Sertakan berkas `install.sh`, `install.ps1`, dan `README.md` pada folder tersebut.
4. Daftarkan opsi skin baru pada berkas `install.sh` & `install.ps1` di root direktori.
5. Jalankan pengujian instalasi dan ajukan commit / pull request.

---

## 📄 Lisensi

Didistribusikan di bawah lisensi MIT. Hak cipta &copy; 2026 **Hosterbyte Webhosting**.
Dikelola oleh [@mrburgercheese](https://github.com/mrburgercheese).
