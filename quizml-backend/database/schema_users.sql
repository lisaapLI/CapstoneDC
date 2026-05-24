-- ============================================
-- Tambahan tabel users untuk autentikasi
-- Jalankan di database: quiz
-- ============================================
USE quiz;

-- Hapus tabel users lama kalau ada
DROP TABLE IF EXISTS users;

-- Table: users (akun mahasiswa)
CREATE TABLE IF NOT EXISTS users (
    id         INT AUTO_INCREMENT PRIMARY KEY,
    nim        VARCHAR(20)  NOT NULL UNIQUE,
    nama       VARCHAR(100) NOT NULL,
    password   VARCHAR(255) NOT NULL COMMENT 'hashed dengan SHA2',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    last_login TIMESTAMP NULL,
    INDEX idx_nim (nim)
) ENGINE=InnoDB;

-- Ubah tabel students agar terhubung ke users
-- (students tetap ada untuk backward compat, tapi sekarang pakai users)
ALTER TABLE quiz_results
    ADD COLUMN IF NOT EXISTS waktu_detik INT DEFAULT 0 AFTER cluster_label;
