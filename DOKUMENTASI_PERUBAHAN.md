# Dokumentasi Perubahan Project – Profile Card App

Tanggal: 26 Oktober 2025

Dokumen ini merangkum semua perubahan struktur folder, file baru, file yang diubah, serta fitur yang ditambahkan pada project Flutter ini.

## Ringkasan

- Mengubah project latihan menjadi aplikasi mini "Profile Card App".
- Menambahkan manajemen tema (Light, Dark, dan Auto/ThemeMode.system).
- Menambah halaman Profil dengan mode edit (form TextField + setState()).
- Menambah halaman Tentang (About) dengan navigasi menggunakan `Navigator.push()`.
- Mengganti foto profil menjadi asset lokal dengan fallback jaringan.
- Memperbarui pengujian (widget test) agar sesuai dengan aplikasi baru.

---

## Struktur Folder/Files (baru & diubah)

```
latihan_basic_widgets/
├── DOKUMENTASI_PERUBAHAN.md            # Dokumen ini
├── README.md                           # Diperbarui dengan penjelasan fitur dan cara menjalankan
├── pubspec.yaml                        # Diperbarui: deklarasi asset lokal
├── lib/
│   ├── main.dart                       # Diubah: MaterialApp + ThemeMode + navigasi About
│   ├── assets/
│   │   └── bayu.JPG                    # Foto profil lokal (asset)
│   ├── screens/
│   │   ├── profile_page.dart           # Baru: Halaman profil + mode edit
│   │   └── about_page.dart             # Baru: Halaman Tentang (scrollable)
│   └── theme/
│       └── app_theme.dart              # Baru: Konfigurasi tema light/dark (Material 3)
└── test/
    └── widget_test.dart                # Diubah: tes dasar + tes navigasi About
```

Catatan:

- Path asset yang dipakai aplikasi: `lib/assets/bayu.JPG` (terdaftar di `pubspec.yaml`).
- Jika ingin memindahkan ke folder `assets/` di root project, cukup pindahkan file dan ubah path di `pubspec.yaml` serta di `profile_page.dart`.

---

## File Baru

### 1) `lib/theme/app_theme.dart`

- Menyediakan dua tema: `lightTheme` dan `darkTheme`.
- Menggunakan Material 3 (`useMaterial3: true`) dan `ColorScheme.fromSeed` dengan warna seed `Colors.teal`.
- Mengatur `fontFamily: 'Poppins'` (menyiapkan dukungan font kustom).

### 2) `lib/screens/profile_page.dart`

- StatefulWidget untuk menampilkan kartu profil.
- Memiliki mode Edit dengan `TextField` untuk: nama, title, deskripsi, email, dan telepon.
- Tombol aksi: Edit → Save/Cancel (menggunakan `setState`).
- Foto profil: mencoba `Image.asset('lib/assets/bayu.JPG')` terlebih dahulu, jika gagal fallback ke `Image.network(...)`, jika tetap gagal menampilkan placeholder icon.

### 3) `lib/screens/about_page.dart`

- StatelessWidget untuk menampilkan informasi aplikasi.
- Menggunakan `SingleChildScrollView` untuk mencegah overflow.
- Konten: judul, versi, deskripsi aplikasi, daftar fitur, dan teknologi yang digunakan.

---

## File yang Diubah

### 1) `lib/main.dart`

- Mengganti aplikasi menjadi `ProfileCardApp` (StatefulWidget).
- Menambahkan `ThemeMode _themeMode = ThemeMode.system` dan fungsi toggle untuk beralih: Auto → Light → Dark → Auto.
- Menggunakan `MaterialApp(theme, darkTheme, themeMode)` agar tema otomatis bekerja.
- Membungkus `home:` dengan `Builder` untuk mendapatkan `BuildContext` yang valid saat memanggil `Navigator.push(...)` dari AppBar/ FAB.
- Menambahkan tombol:
  - IconButton untuk toggle tema (ikon berubah mengikuti mode).
  - `PopupMenuButton` item "Tentang" -> push ke `AboutPage`.
  - `FloatingActionButton` (ikon info) -> push ke `AboutPage`.

### 2) `lib/screens/profile_page.dart`

- Mengganti foto profil dari hanya `Image.network` menjadi `Image.asset` dengan fallback `Image.network` lalu placeholder icon.
- Menambahkan form edit, kontroler teks, dan logika `setState()` untuk menyimpan/ membatalkan perubahan.

### 3) `pubspec.yaml`

- Menambahkan deklarasi asset:
  ```yaml
  flutter:
    uses-material-design: true
    assets:
      - lib/assets/bayu.JPG
  ```

### 4) `test/widget_test.dart`

- Mengubah tes default menjadi:
  - Tes dasar untuk memeriksa teks awal (nama, title, tombol edit, ikon toggle tema).
  - Tes navigasi ke halaman About (tap ikon info → halaman "Tentang Aplikasi" muncul → kembali lagi).

### 5) `README.md`

- Diperbarui dengan deskripsi fitur, struktur project, konsep yang digunakan, cara menjalankan, dan ide pengembangan lanjut.

---

## Fitur yang Ditambahkan

- Toggle tema: Auto (mengikuti sistem), Light, Dark.
- Halaman Profil interaktif dengan mode Edit (TextField + setState()).
- Halaman Tentang dengan informasi aplikasi dan teknologi.
- Navigasi menggunakan `Navigator.push()` dari AppBar menu dan FloatingActionButton.
- Penanganan gambar profil yang reliabel (asset → network → placeholder).

---

## Cara Menjalankan (Windows PowerShell)

Jalankan perintah berikut dari folder project `latihan_basic_widgets`:

```powershell
flutter pub get
flutter analyze
flutter test
flutter run
```

Opsional menjalankan di Chrome (jika web diaktifkan):

```powershell
flutter run -d chrome
```

---

## Status Kualitas (Quality Gates)

- Build/Analyze: PASS (`flutter analyze` tanpa issue)
- Tests: PASS (`flutter test` semua lulus)

---

## Catatan & Saran Lanjutan

- Jika ingin menyimpan perubahan profil secara permanen: gunakan `SharedPreferences` atau database lokal.
- Tambahkan validasi form (email/telepon) dan masking input.
- Tambahkan pemilihan foto profil dari galeri/ kamera (package `image_picker`).
- Pindahkan asset ke folder root `assets/` agar konvensi lebih umum, lalu sesuaikan `pubspec.yaml`.
