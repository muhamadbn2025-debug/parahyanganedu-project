# Parahyangan Edu – Affordable Online Learning Platform

Platform pembelajaran online terjangkau yang dirancang khusus untuk komunitas Bandung.

**Live Demo:** [Coming Soon]  
**GitHub:** https://github.com/muhamadbn2025-debug/parahyanganedu-project/  
**Developer:** Muhamad Awod

---

## Deskripsi Proyek

Parahyangan Edu adalah Learning Management System (LMS) yang mengatasi keterbatasan akses pendidikan online berkualitas di Bandung. Platform ini menyediakan katalog kursus dengan filter kategori dan harga yang intuitif, sehingga pelajar dapat menemukan kursus yang sesuai kebutuhan dan anggaran mereka.

---

## Technology Stack

| Layer | Teknologi |
|-------|-----------|
| Frontend | React.js, HTML5, Tailwind CSS, JavaScript (ES6+) |
| Backend | Laravel 11, PHP 8.2, Composer |
| Database | MySQL |
| API | RESTful API dengan Laravel Sanctum |
| Version Control | Git & GitHub |

---

## Fitur Utama

- Registrasi dan login mahasiswa
- Katalog kursus dengan filter kategori & harga
- Sistem enrollment (pendaftaran kursus)
- Profil instruktur/mentor
- Dashboard mahasiswa (kursus yang diambil, progres)
- Admin panel untuk manajemen kursus

---

## Database Structure (ERD)

```
STUDENTS
├── id (PK)
├── name
├── email
├── password
└── created_at

COURSES
├── id (PK)
├── title
├── category
├── price
├── duration
├── instructor
└── description

ENROLLMENT (Join Table)
├── id (PK)
├── student_id (FK → STUDENTS)
├── course_id  (FK → COURSES)
├── enrolled_at
└── status
```

**Relasi:**
- Students `1 ──── *` Enrollment
- Courses `1 ──── *` Enrollment
- Students `*` ────(melalui Enrollment)──── `*` Courses

---

## Cara Instalasi & Menjalankan Aplikasi

### Prerequisites

Pastikan sudah terinstall:
- PHP >= 8.2
- Composer
- Node.js >= 18
- MySQL
- Git

---

### 1. Clone Repository

```bash
git clone https://github.com/muhamadbn2025-debug/parahyangan-edu.git
cd parahyangan-edu
```

---

### 2. Setup Backend (Laravel)

```bash
# Masuk ke folder backend
cd backend

# Install dependencies PHP
composer install

# Copy environment file
cp .env.example .env

# Generate application key
php artisan key:generate
```

**Edit file `.env`** sesuai konfigurasi database lokal:

```env
DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=parahyangan_edu
DB_USERNAME=root
DB_PASSWORD=your_password
```

```bash
# Jalankan migrasi database
php artisan migrate

# (Opsional) Isi data dummy
php artisan db:seed

# Jalankan server backend
php artisan serve
```

Backend berjalan di: `http://localhost:8000`

---

### 3. Setup Frontend (React.js)

```bash
# Masuk ke folder frontend
cd ../frontend

# Install dependencies Node.js
npm install

# Copy environment file
cp .env.example .env
```

**Edit file `.env`** frontend:

```env
VITE_API_URL=http://localhost:8000/api
```

```bash
# Jalankan development server
npm run dev
```

Frontend berjalan di: `http://localhost:5173`

---

## API Endpoints

| Method | Endpoint | Deskripsi |
|--------|----------|-----------|
| POST | `/api/register` | Registrasi mahasiswa baru |
| POST | `/api/login` | Login & mendapatkan token |
| GET | `/api/courses` | Daftar semua kursus |
| GET | `/api/courses?category=tech` | Filter kursus by kategori |
| POST | `/api/enroll` | Daftar kursus (auth required) |
| GET | `/api/my-courses` | Kursus yang diambil mahasiswa |
| POST | `/api/logout` | Logout |

---

## Struktur Folder

```
parahyangan-edu/
├── backend/              # Laravel API
│   ├── app/
│   │   ├── Models/       # Student, Course, Enrollment
│   │   └── Http/Controllers/Api/
│   ├── database/
│   │   ├── migrations/   # Skema database
│   │   └── seeders/      # Data dummy
│   └── routes/api.php    # API routes
│
└── frontend/             # React.js
    ├── src/
    │   ├── components/   # Reusable components
    │   ├── pages/        # Halaman utama
    │   └── services/     # API calls (Axios)
    └── public/
```

---

## Cara Penggunaan

1. **Buka** `http://localhost:5173` di browser
2. **Daftar** akun baru via halaman Register
3. **Login** dengan email & password
4. **Jelajahi** katalog kursus, gunakan filter kategori/harga
5. **Klik "Enroll"** untuk mendaftar kursus yang diminati
6. **Akses dashboard** untuk melihat kursus yang sudah diambil

---

## Kontribusi

Pull request sangat diterima! Untuk perubahan besar, buka issue terlebih dahulu untuk mendiskusikan perubahan yang diinginkan.

---

## Lisensi

MIT License – Muhamad Awod © 2026
