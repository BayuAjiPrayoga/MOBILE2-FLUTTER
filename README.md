# latihan_basic_widgets

# Profile Card App

Aplikasi Flutter yang menggabungkan semua konsep widget dasar, layout, font, dan theme dengan logika StatefulWidget.

## 🚀 Fitur Utama

### ✅ Fitur Dasar (Sesuai Spesifikasi)

- **StatelessWidget & StatefulWidget**: Kombinasi antara ProfilePage (StatelessWidget) dan ProfileCardApp (StatefulWidget)
- **Theme Management**: Tema light dan dark dengan konfigurasi konsisten
- **Layout**: Menggunakan Column, Row, Padding, dan Card untuk tampilan yang rapi
- **Custom Font**: Menggunakan font Poppins untuk konsistensi tipografi

### ✨ Fitur Tambahan (Tugas Akhir)

- **Form Editing**: TextField untuk mengedit nama, email, telepon dengan setState()
- **Navigasi**: Halaman "Tentang" dengan Navigator.push()
- **Tema Otomatis**: ThemeMode.system untuk mengikuti pengaturan sistem
- **UI/UX Enhancements**:
  - Edit mode dengan tombol Save/Cancel
  - Icon indicators untuk kontak
  - Placeholder untuk gambar yang gagal dimuat
  - Floating Action Button untuk akses cepat ke halaman About
  - PopupMenu untuk navigasi tambahan

## 📁 Struktur Project

```
lib/
├── main.dart                 # Entry point dengan StatefulWidget dan theme switching
├── screens/
│   ├── profile_page.dart     # StatefulWidget untuk profil dengan form editing
│   └── about_page.dart       # StatelessWidget untuk informasi aplikasi
└── theme/
    └── app_theme.dart        # Konfigurasi tema light dan dark
```

## 🎨 Konsep Flutter yang Diimplementasikan

| Konsep              | Implementasi                                  | File                |
| ------------------- | --------------------------------------------- | ------------------- |
| **StatelessWidget** | AboutPage - halaman statis informasi aplikasi | `about_page.dart`   |
| **StatefulWidget**  | ProfilePage - form editing dengan setState()  | `profile_page.dart` |
| **StatefulWidget**  | ProfileCardApp - theme switching              | `main.dart`         |
| **Theme & Font**    | Tema light/dark dengan font Poppins           | `app_theme.dart`    |
| **Layout**          | Column, Row, Card, Padding                    | Semua file          |
| **Navigation**      | Navigator.push() ke halaman About             | `main.dart`         |
| **Form Input**      | TextField dengan controller dan setState()    | `profile_page.dart` |
| **Theme Modes**     | ThemeMode.system, light, dark                 | `main.dart`         |

## 🔧 Mode Tema

Aplikasi mendukung 3 mode tema yang dapat diubah dengan tombol di AppBar:

1. **Auto** (🌓): Mengikuti pengaturan sistem
2. **Light** (☀️): Tema terang
3. **Dark** (🌙): Tema gelap

## 📱 Screenshot Fitur

### Mode Edit Profil

- Klik tombol "Edit Profile" untuk masuk ke mode editing
- Gunakan TextField untuk mengubah data
- Tombol "Save" untuk menyimpan atau "Cancel" untuk membatalkan

### Navigasi

- **Floating Action Button**: Akses cepat ke halaman About
- **PopupMenu**: Menu tambahan di AppBar
- **Back Button**: Navigasi kembali dari halaman About

## 🛠️ Cara Menjalankan

1. Pastikan Flutter SDK sudah terinstall
2. Clone atau download project ini
3. Buka terminal dan navigasi ke folder project
4. Jalankan perintah:
   ```bash
   flutter pub get
   flutter run
   ```

## 🧪 Testing

Jalankan test dengan perintah:

```bash
flutter test
```

Test mencakup:

- Verifikasi tampilan widget utama
- Keberadaan tombol-tombol penting
- Rendering data profil

## 📚 Pembelajaran

Project ini mengajarkan:

### Widget Dasar

- Text, Image, Icon
- Button, TextField
- Card, Container, SizedBox

### Layout

- Column, Row
- Padding, Margin
- MainAxisAlignment, CrossAxisAlignment

### State Management

- StatelessWidget vs StatefulWidget
- setState() untuk update UI
- TextEditingController untuk form

### Navigation

- Navigator.push()
- MaterialPageRoute
- AppBar dengan actions

### Theming

- ThemeData configuration
- ColorScheme
- ThemeMode (system, light, dark)
- Custom fonts

## 👨‍💻 Pengembangan Selanjutnya

Ide untuk pengembangan lebih lanjut:

- Persistent storage dengan SharedPreferences
- Validasi form input
- Upload foto profil
- Animasi transisi
- Internationalization (i18n)
- Unit tests yang lebih komprehensif

---

**© 2024 Profile Card App** - Dikembangkan untuk pembelajaran Flutter
