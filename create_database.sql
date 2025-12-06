-- BAAC PM Database Schema
-- PostgreSQL Database Creation Script
-- Created for: BAAC Project Management System

-- ============================================
-- 1. CORE LARAVEL TABLES
-- ============================================

-- Users Table (Authentication)
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    email_verified_at TIMESTAMP NULL,
    password VARCHAR(255) NOT NULL,
    remember_token VARCHAR(100) NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


-- Password Reset Tokens
CREATE TABLE password_reset_tokens (
    email VARCHAR(255) PRIMARY KEY,
    token VARCHAR(255) NOT NULL,
    created_at TIMESTAMP NULL
);

-- Sessions Table
CREATE TABLE sessions (
    id VARCHAR(255) PRIMARY KEY,
    user_id INTEGER NULL REFERENCES users(id) ON DELETE SET NULL,
    ip_address INET NULL,
    user_agent TEXT NULL,
    payload TEXT NOT NULL,
    last_activity INTEGER NOT NULL
);

-- Cache Tables
CREATE TABLE cache (
    key VARCHAR(255) PRIMARY KEY,
    value MEDIUMTEXT NOT NULL,
    expiration INTEGER NOT NULL
);

CREATE TABLE cache_locks (
    key VARCHAR(255) PRIMARY KEY,
    owner VARCHAR(255) NOT NULL,
    expiration INTEGER NOT NULL
);

-- Jobs Tables (Queue System)
CREATE TABLE jobs (
    id SERIAL PRIMARY KEY,
    queue VARCHAR(255) NOT NULL,
    payload TEXT NOT NULL,
    attempts SMALLINT NOT NULL DEFAULT 0,
    reserved_at INTEGER NULL,
    available_at INTEGER NOT NULL,
    created_at INTEGER NOT NULL
);

CREATE TABLE job_batches (
    id VARCHAR(255) PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    total_jobs INTEGER NOT NULL,
    pending_jobs INTEGER NOT NULL,
    failed_jobs INTEGER NOT NULL,
    failed_job_ids TEXT NOT NULL,
    options MEDIUMTEXT NULL,
    cancelled_at INTEGER NULL,
    created_at INTEGER NOT NULL,
    finished_at INTEGER NULL
);

CREATE TABLE failed_jobs (
    id SERIAL PRIMARY KEY,
    uuid VARCHAR(255) UNIQUE NOT NULL,
    connection TEXT NOT NULL,
    queue TEXT NOT NULL,
    payload TEXT NOT NULL,
    exception TEXT NOT NULL,
    failed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Migrations Table
CREATE TABLE migrations (
    id SERIAL PRIMARY KEY,
    migration VARCHAR(255) NOT NULL,
    batch INTEGER NOT NULL
);

-- ============================================
-- 2. PROJECT MANAGEMENT TABLES
-- ============================================
  
-- BAAC Users Table (Project Management System)
-- ตารางข้อมูล ผู้ใช้งาน/บุคลากร 
CREATE TABLE bpm_ms_users (
    user_id SERIAL PRIMARY KEY, -- รหัสผู้ใช้งาน
    username VARCHAR(100) UNIQUE NOT NULL, -- ชื่อผู้ใช้งาน    
    email VARCHAR(255) UNIQUE, -- อีเมล
    contact_info VARCHAR(100), -- ข้อมูลติดต่อ
    department_code VARCHAR(100), -- รหัสหน่วยงาน
    UserLogin VARCHAR(100) UNIQUE NOT NULL, -- ชื่อเข้าสู่ระบบ
    UserPassword VARCHAR(255) NOT NULL, -- รหัสผ่าน
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE INDEX idx_username ON bpm_ms_users(username);
CREATE INDEX idx_email ON bpm_ms_users(email);
CREATE INDEX idx_userlogin ON bpm_ms_users(UserLogin);

-- ข้อมูล วัตถุประสงค์เชิงยุทธศาสตร์
CREATE TABLE bpm_ms_strategic_objectives (    
    so_code VARCHAR(50) UNIQUE,  -- รหัส SO
    so_name VARCHAR(255) NOT NULL, -- ชื่อ SO    
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,    
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- ข้อมูล : ยุทธศาสตร์
CREATE TABLE bpm_ms_strategic_objectives (    
    so_code VARCHAR(50) UNIQUE,
    so_name VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ข้อมูล - กลยุทธ์
CREATE TABLE bpm_ms_tactics (    
    tactic_code VARCHAR(50) UNIQUE, --รหัสกลยุทธ์
    tactic_name VARCHAR(255) NOT NULL, -- 	ชื่อกลยุทธ์
    strategy_code VARCHAR(50), -- รหัสยุทธศาสตร์
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP    
)  ;

CREATE INDEX idx_tactic_code ON bpm_ms_tactics(tactic_code);
CREATE INDEX idx_strategy_id ON bpm_ms_tactics(strategy_code);


-- Table: โครงการหลัก
CREATE TABLE bpm_projects (
    project_id INT AUTO_INCREMENT PRIMARY KEY, --- 	รหัสโครงการ    
    project_name VARCHAR(255) NOT NULL, -- ชื่อโครงการ
    project_status VARCHAR(50) NOT NULL DEFAULT 'Draft', -- สถานะโครงการ
    fiscal_year INT NOT NULL, -- 	ปีบัญชี
    principles_rationale TEXT,  -- หลักการและเหตุผล
    project_objectives TEXT, -- วัตถุประสงค์โครงการ
    coordinator_name VARCHAR(100), -- ชื่อผู้ประสานงาน
    coordinator_phone VARCHAR(20), -- เบอร์โทรผู้ประสานงาน
    department_code INT, -- ผู้จัดการโครงการ (user_id)
    strategic_objective_id INT, -- วัตถุประสงค์เชิงยุทธศาสตร์ (SO)
    strategy_code INT, -- ยุทธศาสตร์
    tactic_code INT,-- กลยุทธ์    
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, 
    INDEX idx_project_code (project_code),
    INDEX idx_project_status (project_status),
    INDEX idx_fiscal_year (fiscal_year),
    INDEX idx_project_manager (project_manager_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


----- Table: งบประมาณโครงการ
CREATE TABLE bpm_project_budget (
    budget_id INT AUTO_INCREMENT PRIMARY KEY, -- 	รหัสงบประมาณ
    project_id INT NOT NULL, -- รหัสโครงการ
    budget_amount DECIMAL(15,2) DEFAULT 0.00, --งบประมาณ
    personnel_count INT DEFAULT 0, -- จำนวนบุคลากร
    knowledge_organization TEXT, -- องค์ความรู้
    external_personnel_count INT DEFAULT 0, -- จำนวนบุคลากรภายนอก
    technology TEXT, -- 	เทคโนโลยี
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,    
    INDEX idx_project_id (project_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



-- Table: แผนการดำเนินงาน
CREATE TABLE bpm_project_action_plan (
    plan_id INT AUTO_INCREMENT PRIMARY KEY, -- 	รหัสแผน
    project_id INT NOT NULL, -- 	รหัสโครงการ
    phase VARCHAR(100) NOT NULL, -- 	ระยะ/ขั้นตอน (Phase)
    action_name VARCHAR(255), -- 
--    responsible_person VARCHAR(100),
    estimate_percentage DECIMAL(5,2) DEFAULT 0.00, -- ร้อยละความก้าวหน้าคาดการณ์
    estimate_income DECIMAL(5,2) DEFAULT 0.00, -- รายได้คาดการณ์

    result_percentage DECIMAL(5,2) DEFAULT 0.00, -- ร้อยละผลสำเร็จสะสม
    result_income DECIMAL(5,2) DEFAULT 0.00, -- รายไดด้
--    assigned_task VARCHAR(255), 
--    sequence_order INT DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,    
    INDEX idx_project_id (project_id),
    INDEX idx_sequence_order (sequence_order)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- Table:  ผลผลิต KPI
CREATE TABLE bpm_project_kpi_output (
    kpi_output_id INT AUTO_INCREMENT PRIMARY KEY, -- รหัส KPI Output
    project_id INT NOT NULL, -- รหัสโครงการ
    kpi_indicator VARCHAR(255) NOT NULL, -- ตัวชี้วัด
    kpi_target VARCHAR(255) NOT NULL, -- เป้าหมาย
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,    
    INDEX idx_project_id (project_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Table: ผลลัพธ์ KPI
CREATE TABLE bpm_project_outcome (
    outcome_id INT AUTO_INCREMENT PRIMARY KEY, -- รหัสผลลัพธ์
    project_id INT NOT NULL, -- รหัสโครงการ
    kpi_indicator VARCHAR(255) NOT NULL, --- ตัวชี้วัด
    kpi_target VARCHAR(255) NOT NULL, -- เป้าหมาย
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,    
    INDEX idx_project_id (project_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

