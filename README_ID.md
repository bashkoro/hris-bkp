# HRIS-BKP - Panduan Pengembangan

## 📋 Gambaran Umum Proyek

**HRIS-BKP** adalah prototype Sistem Informasi Kepegawaian (HRIS) yang dibangun dengan **CodeIgniter 4**, dikonversi dari proyek Laravel. Ini adalah **prototype yang berfungsi TANPA koneksi database** - semua data saat ini adalah data statis/sampel di controller.

### Informasi Proyek
- **Framework**: CodeIgniter 4.6.3
- **Versi PHP**: 8.2.4
- **Server**: XAMPP (Apache)
- **Lokasi**: `/Applications/XAMPP/htdocs/hris-bkp`
- **Status**: ✅ Fase Prototype (Tanpa Database)
- **Sumber Asli**: Laravel HRIS-PCO (`/Applications/XAMPP/htdocs/HRIS-PCO`)

---

## 🎯 Fase Pengembangan

### ✅ **Fase 1: Prototype (SELESAI)**
- Konversi Laravel Blade ke CodeIgniter 4 Pure PHP views
- Buat controller dengan data sampel/statis
- Implementasi UI/UX dengan Bootstrap 5
- Tidak perlu koneksi database

### 🔄 **Fase 2: Integrasi Database (DIRENCANAKAN)**
- Setup database MySQL
- Buat migrations
- Buat models (User, Cuti, HakKeuangan, BuktiPotongPajak, dll.)
- Ganti data statis dengan query database
- Implementasi operasi CRUD

### 🔐 **Fase 3: Autentikasi (DIRENCANAKAN)**
- Login/logout pengguna
- Manajemen session
- Kontrol akses berbasis role (RBAC)
- Hashing password
- Sistem registrasi

---

## 🏗️ Struktur Proyek

```
hris-bkp/
├── app/
│   ├── Config/
│   │   ├── Constants.php          # Berisi polyfill Locale untuk macOS
│   │   └── Routes.php              # Semua route aplikasi
│   ├── Controllers/
│   │   ├── AccountSettings.php     # Pengaturan akun & ubah password
│   │   ├── BuktiPotongPajak.php   # Manajemen dokumen pajak
│   │   ├── Cuti.php                # Manajemen cuti/izin
│   │   ├── Dashboard.php           # Dashboard utama dengan presensi
│   │   ├── HakKeuangan.php        # Hak keuangan/slip gaji
│   │   └── Profile.php             # Manajemen profil pengguna
│   ├── Libraries/
│   │   └── LocalePolyfill.php     # Perbaikan untuk masalah intl macOS Sequoia/Sonoma
│   ├── Models/                     # (Kosong - untuk Fase 2)
│   └── Views/
│       ├── account_settings/
│       │   └── index.php
│       ├── bukti_potong_pajak/
│       │   └── index.php
│       ├── components/
│       │   └── pagination.php
│       ├── cuti/
│       │   └── index.php
│       ├── dashboard/
│       │   └── index.php
│       ├── hak_keuangan/
│       │   └── index.php
│       ├── layout/
│       │   └── main.php           # Layout utama dengan navigasi
│       └── profile/
│           └── index.php
├── public/
│   ├── css/
│   │   └── custom.css
│   ├── js/
│   │   └── dashboard.js
│   └── img/
│       └── FA-Logo-PCO_Horizontal-Emas-Putih.png
└── writable/                      # Log dan cache
```

---

## 🔧 Perbaikan Kritis: Masalah Ekstensi intl macOS

### Masalah
CodeIgniter 4 memerlukan ekstensi PHP `intl`, yang rusak di macOS Sequoia/Sonoma, menyebabkan error:
```
Class 'Locale' not found
```

### ✅ Solusi (Sudah Diimplementasikan)
Membuat **polyfill Locale** yang menyediakan fungsionalitas class Locale minimal:

**File**: `app/Libraries/LocalePolyfill.php`
```php
<?php
if (!class_exists('Locale')) {
    class Locale {
        public const DEFAULT_LOCALE = 'en';
        public static function getDefault(): string {
            return self::DEFAULT_LOCALE;
        }
        // ... method lainnya
    }
}
```

**Auto-load di**: `app/Config/Constants.php`
```php
if (!extension_loaded('intl')) {
    require_once APPPATH . 'Libraries/LocalePolyfill.php';
}
```

**Perbaikan ini dapat digunakan kembali untuk SEMUA proyek CodeIgniter 4 di macOS!** 🎉

---

## 📄 Halaman yang Dikonversi (6 Halaman)

### 1. **Dashboard** (`/dashboard`)
- **Controller**: `app/Controllers/Dashboard.php`
- **View**: `app/Views/dashboard/index.php`
- **Fitur**:
  - Kartu ringkasan kehadiran
  - Check-in/check-out berbasis geolokasi
  - Integrasi peta Leaflet.js
  - Tabel riwayat kehadiran
  - Tampilan jam real-time

### 2. **Cuti (Manajemen Cuti)** (`/cuti`)
- **Controller**: `app/Controllers/Cuti.php`
- **View**: `app/Views/cuti/index.php`
- **Fitur**:
  - Kartu ringkasan cuti (total, disetujui, ditolak, pending)
  - Tabel riwayat cuti dengan filter
  - Modal form pengajuan cuti
  - Perhitungan durasi cuti otomatis
  - Fungsi pencarian & filter

### 3. **Hak Keuangan** (`/hak-keuangan`)
- **Controller**: `app/Controllers/HakKeuangan.php`
- **View**: `app/Views/hak_keuangan/index.php`
- **Fitur**:
  - Tabel slip gaji
  - Format mata uang Rupiah Indonesia
  - Dropdown filter periode
  - Fungsi pencarian
  - Badge status (dibayar, disetujui, pending)

### 4. **Bukti Potong Pajak** (`/bukti-potong-pajak`)
- **Controller**: `app/Controllers/BuktiPotongPajak.php`
- **View**: `app/Views/bukti_potong_pajak/index.php`
- **Fitur**:
  - Daftar dokumen pajak dengan tombol lihat/unduh
  - Modal preview dokumen
  - Filter periode
  - Fungsi pencarian
  - Indikator status ketersediaan

### 5. **Profil** (`/profile`)
- **Controller**: `app/Controllers/Profile.php`
- **View**: `app/Views/profile/index.php`
- **Fitur**:
  - 5 tab: Biodata, Alamat, Keputusan, Fasilitas, Files
  - Tampilan foto profil
  - Modal edit profil (2 tab: Info Pribadi & Alamat)
  - Modal upload dokumen
  - Fitur auto-copy alamat (domisili ke KTP)
  - Validasi form

### 6. **Pengaturan Akun** (`/account-settings`)
- **Controller**: `app/Controllers/AccountSettings.php`
- **View**: `app/Views/account_settings/index.php`
- **Fitur**:
  - Form ubah password dengan validasi
  - Bagian Two-Factor Authentication (disabled)
  - Kartu ringkasan profil di sidebar
  - Pesan flash untuk sukses/error
  - Validasi konfirmasi password real-time

---

## 🗺️ Peta Routes

**File**: `app/Config/Routes.php`

```php
// Home
$routes->get('/', 'Home::index');

// Dashboard
$routes->get('dashboard', 'Dashboard::index');

// Cuti
$routes->get('cuti', 'Cuti::index');
$routes->post('cuti/store', 'Cuti::store');

// Hak Keuangan
$routes->get('hak-keuangan', 'HakKeuangan::index');

// Bukti Potong Pajak
$routes->get('bukti-potong-pajak', 'BuktiPotongPajak::index');
$routes->get('bukti-potong-pajak/download/(:num)', 'BuktiPotongPajak::download/$1');

// Profil
$routes->get('profile', 'Profile::index');
$routes->post('profile/update', 'Profile::update');

// Pengaturan Akun
$routes->get('account-settings', 'AccountSettings::index');
$routes->post('account-settings/update-password', 'AccountSettings::updatePassword');

// Logout
$routes->get('logout', function() {
    return redirect()->to('/');
});
```

---

## 🎨 Komponen UI/UX

### Bootstrap 5 + CSS Kustom
- **Framework**: Bootstrap 5.3.0
- **Icons**: Bootstrap Icons 1.10.0
- **Custom CSS**: `public/css/custom.css`
- **Custom JS**: `public/js/dashboard.js`

### Pola UI Utama
1. **Cards**: `.card.card-custom` dengan shadow kustom
2. **Badges**: Indikator status (success, warning, danger, info)
3. **Modals**: Modal Bootstrap untuk form dan preview
4. **Tables**: `.table.table-hover` dengan wrapper responsif
5. **Forms**: `.form-control`, `.form-select` dengan validasi
6. **Navigasi**: Navbar atas dengan dropdown menu
7. **Alerts**: Pesan flash dengan auto-dismiss

---

## 📊 Struktur Data Sampel

### Data User (Umum di semua controller)
```php
$userData = [
    'id' => 1,
    'name' => 'John Doe',
    'email' => 'john@hris-pco.com',
    'unit_kerja' => 'IT Department',
    'status_pns' => 'PNS',
    'status_kepegawaian' => 'Aktif',
    'sisa_cuti' => 12
];
```

### Data Cuti
```php
$cutiHistory = [
    [
        'id' => 1,
        'jenis_cuti' => 'CT',        // Cuti Tahunan
        'tanggal_mulai' => '2024-10-15',
        'tanggal_selesai' => '2024-10-17',
        'durasi' => 3,
        'alasan' => 'Keperluan keluarga',
        'status' => 'approved',
        'tanggal_pengajuan' => '2024-10-01'
    ]
    // ... lebih banyak record
];
```

### Data Hak Keuangan (Gaji)
```php
$hakKeuanganData = [
    [
        'id' => 1,
        'slip_gaji' => 'SG-2024-10-001',
        'periode' => '2024-10',
        'status' => 'paid',
        'hak_keuangan' => 15000000,
        'pph_21' => 750000,
        'iuran_bpjs' => 450000,
        'penghasilan_bersih' => 13800000
    ]
    // ... lebih banyak record
];
```

### Data Bukti Potong Pajak
```php
$buktiPotongPajakData = [
    [
        'id' => 1,
        'periode' => '2024-10',
        'formatted_periode' => 'Oktober 2024',
        'is_available' => true,
        'file_path' => 'uploads/bukti_potong/2024-10-john-doe.pdf',
        'keterangan' => 'Bukti potong PPh 21 masa Oktober 2024'
    ]
    // ... lebih banyak record
];
```

---

## 🚀 Menjalankan Aplikasi

### Mulai Development Server
```bash
cd /Applications/XAMPP/htdocs/hris-bkp
php spark serve --port=8080
```

### URL Akses
- **Base URL**: `http://localhost:8080`
- **Dashboard**: `http://localhost:8080/dashboard`
- **Cuti**: `http://localhost:8080/cuti`
- **Hak Keuangan**: `http://localhost:8080/hak-keuangan`
- **Bukti Potong Pajak**: `http://localhost:8080/bukti-potong-pajak`
- **Profil**: `http://localhost:8080/profile`
- **Pengaturan Akun**: `http://localhost:8080/account-settings`

---

## 🔮 Panduan Integrasi MySQL Fase 2

### Langkah 1: Konfigurasi Database
Edit `app/Config/Database.php`:
```php
public array $default = [
    'DSN'          => '',
    'hostname'     => 'localhost',
    'username'     => 'root',
    'password'     => '',
    'database'     => 'dukungan',  // Gunakan database yang ada
    'DBDriver'     => 'MySQLi',
    'DBPrefix'     => '',
    'pConnect'     => false,
    'DBDebug'      => true,
    'charset'      => 'utf8mb4',
    'DBCollat'     => 'utf8mb4_general_ci',
    'swapPre'      => '',
    'encrypt'      => false,
    'compress'     => false,
    'strictOn'     => false,
    'failover'     => [],
    'port'         => 3306,
    'numberNative' => false,
];
```

### Langkah 2: Import Database
```bash
# Import file dukungan.sql yang sudah ada
mysql -u root -p < /Applications/XAMPP/xamppfiles/htdocs/dukungan.sql
```

### Langkah 3: Lihat Skema Database

Lihat `DATABASE_SCHEMA.md` dan `EXISTING_DATABASE_MAPPING.md` untuk struktur tabel lengkap.

### Langkah 4: Buat Models
Generate models menggunakan CLI CodeIgniter:
```bash
php spark make:model UserModel
php spark make:model CutiModel
php spark make:model HakKeuanganModel
php spark make:model BuktiPotongPajakModel
```

### Langkah 5: Update Controllers
Ganti array data statis dengan query database:

**Sebelum (Statis)**:
```php
$cutiHistory = [
    ['id' => 1, 'jenis_cuti' => 'CT', ...]
];
```

**Sesudah (Database)**:
```php
$db = \Config\Database::connect();
$cutiHistory = $db->table('cuti')
    ->where('pegawai_id', $userId)
    ->get()
    ->getResultArray();
```

---

## 🔐 Panduan Autentikasi Fase 3

### Langkah 1: Install CodeIgniter Shield (Direkomendasikan)
```bash
composer require codeigniter4/shield
```

### Langkah 2: Routes Autentikasi
```php
// Login
$routes->get('login', 'Auth\Login::index');
$routes->post('login', 'Auth\Login::authenticate');

// Register
$routes->get('register', 'Auth\Register::index');
$routes->post('register', 'Auth\Register::store');

// Logout
$routes->get('logout', 'Auth\Login::logout');
```

### Langkah 3: Lindungi Routes dengan Filter
```php
$routes->group('', ['filter' => 'auth'], function($routes) {
    $routes->get('dashboard', 'Dashboard::index');
    $routes->get('cuti', 'Cuti::index');
    // ... route terlindungi lainnya
});
```

---

## 🐛 Masalah Umum & Solusi

### Masalah 1: "Class 'Locale' not found"
**Solusi**: Sudah diperbaiki dengan `LocalePolyfill.php` di `app/Libraries/`

### Masalah 2: 404 di semua routes
**Solusi**: Cek `.htaccess` di direktori `public/`:
```apache
RewriteEngine On
RewriteCond %{REQUEST_FILENAME} !-f
RewriteCond %{REQUEST_FILENAME} !-d
RewriteRule ^(.*)$ index.php/$1 [L]
```

### Masalah 3: CSS/JS tidak loading
**Solusi**: Pastikan base URL benar di `app/Config/App.php`:
```php
public string $baseURL = 'http://localhost:8080/';
```

---

## 📚 Sumber Daya Tambahan

### Dokumentasi CodeIgniter 4
- **Docs Resmi**: https://codeigniter.com/user_guide/
- **Database**: https://codeigniter.com/user_guide/database/index.html
- **Models**: https://codeigniter.com/user_guide/models/model.html
- **Views**: https://codeigniter.com/user_guide/outgoing/views.html

### Dokumentasi Bootstrap 5
- **Docs Resmi**: https://getbootstrap.com/docs/5.3/

### Leaflet.js (Maps)
- **Docs Resmi**: https://leafletjs.com/

---

## 💡 Tips Pengembangan

1. **Selalu test di development server** (`php spark serve`) sebelum deploy
2. **Gunakan debugging built-in CodeIgniter**: Set `CI_ENVIRONMENT = development` di `.env`
3. **Cek logs**: `/writable/logs/` untuk pesan error
4. **Gunakan migrations** untuk perubahan database (Fase 2)
5. **Ikuti pola MVC**: Simpan business logic di Models, bukan Controllers
6. **Sanitasi input pengguna**: Selalu gunakan `esc()` untuk output, validasi input
7. **Gunakan proteksi CSRF**: Sudah diaktifkan secara default di CI4

---

## 🎯 Langkah Selanjutnya untuk Pengembangan

### Langkah Segera:
1. ✅ Review dokumentasi ini
2. ✅ Rencanakan skema database (lihat `DATABASE_SCHEMA.md` dan `EXISTING_DATABASE_MAPPING.md`)
3. 🔄 Import database MySQL yang sudah ada (dukungan.sql)
4. 🔄 Buat file Model
5. 🔄 Update Controllers untuk menggunakan Models alih-alih data statis
6. 🔄 Implementasi sistem Autentikasi
7. 🔄 Tambah otorisasi/akses berbasis role
8. 🔄 Implementasi fungsi upload file
9. 🔄 Tambah pagination untuk dataset besar
10. 🔄 Deploy ke server produksi

### Fitur Jangka Panjang:
- Notifikasi email
- Export ke Excel/PDF
- Reporting lanjutan
- Perbaikan responsif mobile
- Endpoint API untuk aplikasi mobile

---

## 👨‍💻 Catatan Developer

**Konversi Selesai**: 7 Oktober 2025
**Developer**: Dibantu oleh Claude Code
**Status**: ✅ Fase Prototype Selesai
**Fase Berikutnya**: Integrasi Database dengan MySQL

**Penting**: Ini adalah PROTOTYPE. Semua data saat ini adalah data statis/sampel di controller. Saat mengintegrasikan dengan MySQL, ingat untuk:
- Gunakan skema database yang sudah ada (dukungan.sql)
- Tambahkan aturan validasi
- Implementasikan penanganan error yang proper
- Tambahkan langkah keamanan (proteksi CSRF, XSS)
- Test semua operasi CRUD secara menyeluruh

---

## 📝 Change Log

### Version 1.0.0 (Prototype) - 7 Oktober 2025
- ✅ Dikonversi 6 halaman utama dari Laravel ke CodeIgniter 4
- ✅ Implementasi polyfill Locale untuk macOS
- ✅ Dibuat data sampel di controller
- ✅ Dipertahankan 100% UI/UX dari versi Laravel
- ✅ Ditambahkan Bootstrap 5 + CSS kustom
- ✅ Integrasi Leaflet.js untuk geolokasi
- ✅ Dibuat dokumentasi lengkap

---

## 📖 Dokumentasi Lainnya

- **CLAUDE.md** - Panduan pengembangan lengkap (Bahasa Inggris)
- **PAGE_DOCUMENTATION.md** - Dokumentasi detail setiap halaman (Bahasa Inggris)
- **DATABASE_SCHEMA.md** - Skema database yang direncanakan (Bahasa Inggris)
- **EXISTING_DATABASE_MAPPING.md** - Pemetaan database yang sudah ada (Bahasa Inggris)

---

**Selamat Coding! 🚀**
