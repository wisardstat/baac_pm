
# BAAC PM - คู่มือพัฒนาฉบับกระชับ (Laravel + PostgreSQL)

## 📖 เอกสารสำคัญสำหรับ Agent
- **อ่านก่อนทำงาน**: [`AGENT_QUICK_REFERENCE.md`](AGENT_QUICK_REFERENCE.md) - ข้อมูลเร็ว (ลด token)
- **รายละเอียดเต็ม**: [`SYSTEM_STRUCTURE.md`](SYSTEM_STRUCTURE.md) - โครงสร้างระบบ
- **ติดตั้ง**: [`SETUP_INSTRUCTIONS.md`](SETUP_INSTRUCTIONS.md) - วิธีติดตั้ง

## ⚠️ คำสั่งสำหรับ AI Model
- ห้ามอธิบายหรือสรุปงานที่ทำ (ลด token)
- ทำงานเสร็จให้ใช้ `attempt_completion` ทันที
- ใช้ภาษาไทยเสมอ
- อ่าน [`AGENT_QUICK_REFERENCE.md`](AGENT_QUICK_REFERENCE.md) ก่อนเริ่มงานทุกครั้ง

## ❌ ห้ามใช้
- Password แบบ plain text (ใช้ password_hash)
- ภาษาจีนใน code
- ตัวแปรภาษาไทย
- SQL queries โดยตรง (ใช้ parameterized)
- localStorage สำหรับ sensitive data (ใช้ sessionStorage + cookies)

## ✅ ต้องใช้
- ภาษาไทยเสมอ
- try-catch สำหรับ async operations
- ตรวจสอบ null/undefined ก่อนเข้าถึง properties
- JSDoc/TSDoc สำหรับ public functions
- parameterized SQL queries
- ตรวจสอบ JWT token expiration
- middleware สำหรับ auth
- handle OPTIONS requests
- proper HTTP status codes (200, 201, 400, 401, 403, 404, 500)

## 🏗️ โครงสร้างระบบ (Laravel + PostgreSQL)
- **Framework**: Laravel 12.x
- **Database**: PostgreSQL (baac_pm)
- **Server**: http://127.0.0.1:8000
- **PHP**: ^8.2

## 📁 ไฟล์หลัก
- `app/Http/Controllers/` - Controller
- `app/Models/` - Models
- `routes/web.php` - Routes
- `database/migrations/` - DB structure

## 🛣️ Routes หลัก
- `/` - หน้าหลัก
- `/test-db` - ทดสอบ DB

## 🔧 คำสั่งที่ใช้บ่อย
```bash
php artisan serve
php artisan migrate
php artisan make:controller Name
php artisan make:model Name
```
  
❌ BAD (89 tokens):
Summary:
I have successfully implemented JWT validation in the login
system. Additionally, I fixed the timeout issue by increasing
it from 5 seconds to 30 seconds. I also updated all the
authentication tests to reflect these changes.

✅ GOOD (12 tokens):
JWT validation implemented, timeout increased to 30s, tests updated.

