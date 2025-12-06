# BAAC PM - Agent Quick Reference (Minimize Tokens)

## 🎯 โปรเจค
- **ชื่อ**: BAAC PM (ระบบจัดการโครงการ)
- **Tech**: Laravel 12.x + PostgreSQL
- **Server**: http://127.0.0.1:8000

## 📁 โครงสร้าง
```
app/Http/Controllers/     - Controller
app/Models/              - Models
database/migrations/     - DB structure
routes/web.php          - Routes
```

## 🗄️ Database
- **Type**: PostgreSQL
- **Name**: baac_pm
- **Tables**: users, migrations, cache, jobs, sessions

## 🛣️ Routes
- `/` - welcome
- `/test-db` - DB test

## 🔧 Commands
```bash
php artisan serve
php artisan migrate
php artisan make:controller Name
php artisan make:model Name
php artisan make:migration name
```

## ⚠️ Rules
- ใช้ภาษาไทยเสมอ
- ไม่ใช้ password plain text
- ใช้ parameterized queries
- ตรวจสอบ null ก่อนเข้าถึง
- ใช้ try-catch สำหรับ async

## 📋 Status
- ✅ Laravel + PostgreSQL พร้อมใช้
- ✅ Migration เริ่มต้นเสร็จ
- ⏳ รอฟีเจอร์เพิ่มเติม

## 📖 อ่านเพิ่ม
- [`SYSTEM_STRUCTURE.md`](SYSTEM_STRUCTURE.md) - รายละเอียดเต็ม
- [`instructions.md`](instructions.md) - คำสั่ง AI
- [`SETUP_INSTRUCTIONS.md`](SETUP_INSTRUCTIONS.md) - ติดตั้ง
- [`create_database.sql`](create_database.sql) - SQL สร้างตาราง