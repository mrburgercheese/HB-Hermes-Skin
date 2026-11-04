# Changelog

Semua perubahan penting pada repositori **HB-Hermes-Skin** didokumentasikan di berkas ini. Format mengacu pada [Keep a Changelog](https://keepachangelog.com/id/1.0.0/) dan [Semantic Versioning](https://semver.org/).

## [v1.2.0] - 2026-11-04 20:50 WIB

### Added
- **Desktop Plugin: Lexa Welcome Screen**: Menyertakan modul plugin resmi `desktop-plugins/lexa-welcome/` (`plugin.js` dan aset avatar) yang terintegrasi langsung pada area `CHAT_EMPTY_AREA`, Statusbar kanan, dan Command Palette (`Ctrl+K`).
- **Auto-Installer Plugin Deployment**: Memperbarui `install.sh` dan `install.ps1` agar otomatis memasang desktop plugin ke direktori Hermes desktop-plugins lokal.

### Fixed & Improved
- **Horizontal Alignment Precision**: Mengeliminasi pergeseran horizontal (offset ~66px ke kiri) pada jam sesi (`time` / `now`) terhadap badge status (`STALLED`, `WORKING`, `NEW`, `INPUT`) dengan menyetel `position: static !important` pada container `[data-row-actions]` sehingga berlabuh tepat pada parent row.
- **Double-Padding Elimination**: Menghapus padding berlebih pada label judul dan teks metadata di sidebar sehingga nama sesi tampil penuh tanpa terpotong prematur.

## [v1.1.1] - 2026-11-04 18:30 WIB

### Fixed & Improved
- **Stacked Layout Optimization**: Memisahkan badge status dan timestamp jam sesi di sidebar card mode secara rapi. Badge status diposisikan di sudut kanan atas (`top: 7px, right: 8px`), sedangkan jam sesi berada di bawah badge (`top: 24px, right: 8px`).
- **Inline Pseudo-Element Badges**: Merender status badge (`WORKING`, `INPUT`, `NEW`, `STALLED`) murni via CSS pseudo-element (`::after`) pada session row tanpa dependensi plugin eksternal.
- **Dual-Theme Support**: Menyelaraskan implementasi stacked status badge dan timestamp pada skin `hosterbyte-dark` dan `hosterbyte-sage`.

## [v1.1.0] - 2026-11-03 17:30 WIB

### Added
- **Interactive Session Status Indicators (Desktop GUI)** pada skin `hosterbyte-dark`:
  - **Running Arc Enhancement**: Menambahkan efek stardust sparkles diagonal (`radial-gradient`) dan perputaran border bercahaya emerald neon (`#00ff87`) pada sesi aktif.
  - **6px High-Contrast Outer Dimmer Halo**: Indikator dot status dengan pendaran aura luar (*breathing dimmer halo*) yang kontras:
    - `working`: Electric Green `#00ff87` berdenyut lembut (halo 16px).
    - `stalled` / `background`: Cincin Electric Green hollow border 2px.
    - `needs-input`: Sun Orange `#ff9500` berdenyut cepat (1.5s).
    - `unread`: Neon Magenta/Purple `#d946ef` bernapas tenang (2.6s).
  - **Stacked Mini Status Badges**: Badge status monospace padat (`WORKING`, `INPUT`, `NEW`, `STALLED`) yang diletakkan di atas jam timestamp sesi pada sidebar. Otomatis tersembunyi saat sesi idle.
- Dokumentasi visual dan simulasi ASCII status di `README.md` dan `hosterbyte-dark/README.md`.

---

## [v1.0.0] - 2026-10-15 14:00 WIB

### Added
- Rilis perdana HB-Hermes-Skin suite:
  - `hosterbyte-sage`: Light mode terinspirasi dari `img.hosterbyte.com`.
  - `hosterbyte-dark`: Dark mode velvety deep evergreen forest.
  - Skrip instalasi otomatis 1-line (`install.sh` & `install.ps1`).
