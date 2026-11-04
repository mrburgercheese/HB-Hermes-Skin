# Changelog

Semua perubahan penting pada repositori **HB-Hermes-Skin** didokumentasikan di berkas ini. Format mengacu pada [Keep a Changelog](https://keepachangelog.com/id/1.0.0/) dan [Semantic Versioning](https://semver.org/).

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
