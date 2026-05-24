-- ============================================
-- QuizML Database Schema - Kalkulus Purcell
-- MySQL 8.0+
-- ============================================

CREATE DATABASE IF NOT EXISTS quiz CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE quiz;

-- Table: students
CREATE TABLE IF NOT EXISTS students (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nim VARCHAR(20) NOT NULL UNIQUE,
    nama VARCHAR(100) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    INDEX idx_nim (nim)
) ENGINE=InnoDB;

-- Table: questions
CREATE TABLE IF NOT EXISTS questions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    soal TEXT NOT NULL,
    pilihan_a VARCHAR(500) NOT NULL,
    pilihan_b VARCHAR(500) NOT NULL,
    pilihan_c VARCHAR(500) NOT NULL,
    pilihan_d VARCHAR(500) NOT NULL,
    pilihan_e VARCHAR(500),
    jawaban_benar ENUM('A','B','C','D','E') NOT NULL,
    materi VARCHAR(100) NOT NULL,
    bab VARCHAR(50) NOT NULL,
    tingkat_kesulitan ENUM('Mudah','Sedang','Sulit') DEFAULT 'Sedang',
    INDEX idx_materi (materi),
    INDEX idx_kesulitan (tingkat_kesulitan)
) ENGINE=InnoDB;

-- Table: quiz_sessions
CREATE TABLE IF NOT EXISTS quiz_sessions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT NOT NULL,
    started_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    finished_at TIMESTAMP NULL,
    waktu_pengerjaan INT COMMENT 'dalam detik',
    FOREIGN KEY (student_id) REFERENCES students(id) ON DELETE CASCADE
) ENGINE=InnoDB;

-- Table: quiz_answers
CREATE TABLE IF NOT EXISTS quiz_answers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    session_id INT NOT NULL,
    question_id INT NOT NULL,
    jawaban_mahasiswa ENUM('A','B','C','D','E') NOT NULL,
    is_correct BOOLEAN NOT NULL,
    FOREIGN KEY (session_id) REFERENCES quiz_sessions(id) ON DELETE CASCADE,
    FOREIGN KEY (question_id) REFERENCES questions(id) ON DELETE CASCADE
) ENGINE=InnoDB;

-- Table: quiz_results
CREATE TABLE IF NOT EXISTS quiz_results (
    id INT AUTO_INCREMENT PRIMARY KEY,
    session_id INT NOT NULL UNIQUE,
    student_id INT NOT NULL,
    total_score DECIMAL(5,2) NOT NULL,
    jumlah_benar INT NOT NULL,
    jumlah_salah INT NOT NULL,
    limit_score DECIMAL(5,2) DEFAULT 0,
    turunan_score DECIMAL(5,2) DEFAULT 0,
    aplikasi_turunan_score DECIMAL(5,2) DEFAULT 0,
    teknik_integrasi_score DECIMAL(5,2) DEFAULT 0,
    integral_lipat_score DECIMAL(5,2) DEFAULT 0,
    mudah_score DECIMAL(5,2) DEFAULT 0,
    sedang_score DECIMAL(5,2) DEFAULT 0,
    sulit_score DECIMAL(5,2) DEFAULT 0,
    materi_terlemah VARCHAR(100),
    kategori_kemampuan ENUM('Beginner','Intermediate','Advanced'),
    cluster_label INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (session_id) REFERENCES quiz_sessions(id) ON DELETE CASCADE,
    FOREIGN KEY (student_id) REFERENCES students(id) ON DELETE CASCADE
) ENGINE=InnoDB;

-- Table: recommendations
CREATE TABLE IF NOT EXISTS recommendations (
    id INT AUTO_INCREMENT PRIMARY KEY,
    result_id INT NOT NULL,
    materi VARCHAR(100) NOT NULL,
    judul VARCHAR(255) NOT NULL,
    url VARCHAR(500),
    tipe ENUM('Video','Artikel','Latihan','Buku') DEFAULT 'Video',
    FOREIGN KEY (result_id) REFERENCES quiz_results(id) ON DELETE CASCADE
) ENGINE=InnoDB;

-- ============================================
-- SEED: 60 Soal Kalkulus Purcell
-- ============================================

INSERT INTO questions (soal, pilihan_a, pilihan_b, pilihan_c, pilihan_d, pilihan_e, jawaban_benar, materi, bab, tingkat_kesulitan) VALUES

-- BAGIAN I: MUDAH (Soal 1-20)

-- Bab 1: Limit Mudah (1-10)
('Tentukan nilai dari lim (x → 2) (3x² - 5x + 4).','4','6','8','10','12','A','Limit','Bab 1','Mudah'),
('Berapakah nilai dari lim (x → -1) (x³ - 2x + 7)?','6','8','4','10','5','A','Limit','Bab 1','Mudah'),
('Nilai dari lim (x → 0) (x² + 4x) / x adalah...','0','2','4','6','Tidak terdefinisi','C','Limit','Bab 1','Mudah'),
('Jika f(x) = 2x - 3, maka lim (x → 4) f(x) adalah...','1','3','5','7','9','C','Limit','Bab 1','Mudah'),
('Hitung nilai lim (x → 3) (x² - 9) / (x - 3).','0','3','6','9','12','C','Limit','Bab 1','Mudah'),
('Nilai dari lim (x → ∞) (2x + 3) / (x - 5) adalah...','0','1','2','3','∞','C','Limit','Bab 1','Mudah'),
('Cari nilai dari lim (x → 0) (sin 3x) / x.','0','1','2','3','1/3','D','Limit','Bab 1','Mudah'),
('Berapakah lim (x → ∞) (3x² - x + 2) / (5x² + 4x - 1)?','0','3/5','1','-2','∞','B','Limit','Bab 1','Mudah'),
('Nilai dari lim (x → 1) (√x - 1) / (x - 1) adalah...','0','1/2','1','2','Tidak ada','B','Limit','Bab 1','Mudah'),
('Tentukan lim (x → 2) (x² - 4) / (x² - 2x).','1','2','3','4','0','B','Limit','Bab 1','Mudah'),

-- Bab 2: Turunan Mudah (11-15)
('Jika f(x) = 5x³ - 4x² + 2x - 1, maka turunan pertama f\'(x) adalah...','15x² - 8x + 2','15x³ - 4x + 2','5x² - 4x + 2','15x² - 8x','3x² - 2x + 2','A','Turunan','Bab 2','Mudah'),
('Turunan dari f(x) = sin x + cos x adalah f\'(x) = ...','cos x - sin x','cos x + sin x','-cos x + sin x','-cos x - sin x','sin x - cos x','A','Turunan','Bab 2','Mudah'),
('Jika f(x) = 4 / x, maka f\'(x) bernilai...','4 / x²','-4 / x²','-4 / x','4x','-2 / x²','B','Turunan','Bab 2','Mudah'),
('Carilah turunan pertama dari f(x) = (2x + 3)⁴.','4(2x + 3)³','8(2x + 3)³','2(2x + 3)³','8(2x + 3)⁴','4(2x + 3)⁵','B','Turunan','Bab 2','Mudah'),
('Jika f(x) = x ln x, maka f\'(x) adalah...','ln x','1','ln x + 1','ln x - 1','1 / x','C','Turunan','Bab 2','Mudah'),

-- Bab 3: Aplikasi Turunan Mudah (16-20)
('Nilai stasioner dari fungsi f(x) = x² - 6x + 5 terjadi pada saat x = ...','1','2','3','4','6','C','Aplikasi Turunan','Bab 3','Mudah'),
('Grafik fungsi f(x) = x³ - 3x² akan naik pada interval...','x < 0 atau x > 2','0 < x < 2','x > 0','x < 2','Semua x riil','A','Aplikasi Turunan','Bab 3','Mudah'),
('Titik belok dari fungsi f(x) = x³ - 3x diperoleh pada saat x = ...','-1','0','1','2','Tidak ada','B','Aplikasi Turunan','Bab 3','Mudah'),
('Nilai maksimum dari f(x) = -x² + 4x + 1 pada interval riil adalah...','1','3','5','7','9','C','Aplikasi Turunan','Bab 3','Mudah'),
('Persamaan garis singgung kurva y = x² di titik (2, 4) adalah...','y = 4x - 4','y = 4x + 4','y = 2x - 4','y = 2x + 4','y = 4x','A','Aplikasi Turunan','Bab 3','Mudah'),

-- BAGIAN II: SEDANG (Soal 21-40)

-- Bab 1: Limit Sedang (21-25)
('Tentukan nilai dari lim (x → 0) (1 - cos x) / x².','0','1/2','1','2','Tidak ada','B','Limit','Bab 1','Sedang'),
('Hitunglah nilai lim (x → 3) (√(x + 1) - 2) / (x - 3).','1/2','1/4','1','2','0','B','Limit','Bab 1','Sedang'),
('Nilai dari lim (x → ∞) [√(x² + 4x) - x] adalah...','0','1','2','4','∞','C','Limit','Bab 1','Sedang'),
('Tentukan lim (x → 0) (tan 4x) / (sin 2x).','1','2','4','1/2','0','B','Limit','Bab 1','Sedang'),
('Nilai dari lim (x → 1) (x³ - 1) / (x² - 1) adalah...','1','1/2','3/2','2','3','C','Limit','Bab 1','Sedang'),

-- Bab 2: Turunan Sedang (26-30)
('Jika y = sin(x² + 3), maka dy/dx adalah...','cos(x² + 3)','2x cos(x² + 3)','-2x cos(x² + 3)','x² cos(x² + 3)','2 cos(x² + 3)','B','Turunan','Bab 2','Sedang'),
('Turunan pertama dari f(x) = (2x - 1) / (x + 3) adalah f\'(x) = ...','7 / (x + 3)²','5 / (x + 3)²','1 / (x + 3)²','-7 / (x + 3)²','(4x + 5) / (x + 3)²','A','Turunan','Bab 2','Sedang'),
('Jika x² + y² = 25, maka nilai dy/dx pada titik (3, 4) adalah...','-3/4','3/4','-4/3','4/3','-1','A','Turunan','Bab 2','Sedang'),
('Tentukan turunan dari f(x) = tan(4x).','sec²(4x)','4 sec(4x)','4 sec²(4x)','4 cot²(4x)','-4 sec²(4x)','C','Turunan','Bab 2','Sedang'),
('Jika f(x) = √(3x² + 1), maka f\'(x) adalah...','3x / √(3x² + 1)','1 / 2√(3x² + 1)','6x / √(3x² + 1)','x / √(3x² + 1)','3 / √(3x² + 1)','A','Turunan','Bab 2','Sedang'),

-- Bab 7: Teknik Integrasi Sedang (31-35)
('Tentukan hasil dari ∫ x √(x² + 1) dx menggunakan substitusi u.','1/3 (x² + 1)^(3/2) + C','2/3 (x² + 1)^(3/2) + C','1/2 (x² + 1)² + C','1/3 (x² + 1)³ + C','1/2 (x² + 1)^(1/2) + C','A','Teknik Integrasi','Bab 7','Sedang'),
('Bentuk transformasi dari ∫ dx / √(9 - x²) jika x = 3 sin θ adalah...','∫ dθ','∫ cos θ dθ','∫ 1/3 dθ','∫ 3 dθ','∫ sin θ dθ','A','Teknik Integrasi','Bab 7','Sedang'),
('Gunakan metode parsial untuk menghitung ∫ x eˣ dx.','x eˣ + C','x eˣ - eˣ + C','x eˣ + eˣ + C','1/2 x² eˣ + C','-x eˣ + eˣ + C','B','Teknik Integrasi','Bab 7','Sedang'),
('Hasil dari ∫ ln x dx adalah...','1/x + C','x ln x + C','x ln x - x + C','x ln x + x + C','1/2 (ln x)² + C','C','Teknik Integrasi','Bab 7','Sedang'),
('Tentukan hasil dari ∫ x ln x dx menggunakan integral parsial.','1/2 x² ln x - 1/2 x² + C','1/2 x² ln x - 1/4 x² + C','x² ln x - x² + C','1/2 x² ln x + 1/4 x² + C','1/2 x ln x - 1/4 x + C','B','Teknik Integrasi','Bab 7','Sedang'),

-- Bab 13: Integral Lipat Sedang (36-40)
('Hitunglah integral lipat dua ∫(0→1) ∫(0→2) (x + y) dy dx.','3','4','5','6','2','A','Integral Lipat','Bab 13','Sedang'),
('Nilai dari ∫(0→2) ∫(1→3) xy² dx dy adalah...','8/3','16/3','32/3','12','6','B','Integral Lipat','Bab 13','Sedang'),
('Evaluasi integral lipat dua ∫(0→π) ∫(0→1) x sin y dx dy.','1','2','1/2','π','0','A','Integral Lipat','Bab 13','Sedang'),
('Tentukan luas daerah yang dibatasi oleh ∫(0→1) ∫(x→√x) dy dx.','1/2','1/3','1/6','1/12','1','C','Integral Lipat','Bab 13','Sedang'),
('Nilai dari ∫(0→ln2) ∫(0→1) x eʸ dx dy adalah...','1/2','1','ln 2','1/2 ln 2','2','A','Integral Lipat','Bab 13','Sedang'),

-- BAGIAN III: SULIT (Soal 41-60)

-- Bab 1: Limit Formal ε-δ (41-45)
('Berdasarkan definisi formal limit ε-δ, jika lim (x → 2) (3x - 1) = 5, berapakah nilai δ terbesar?','ε/3','ε','3ε','ε/2','ε²','A','Limit','Bab 1','Sulit'),
('Pada pembuktian formal lim (x → 3) (2x + 4) = 10, relasi antara δ dan ε yang tepat adalah...','δ = ε/2','δ = ε','δ = 2ε','δ = ε/4','δ = ε²','A','Limit','Bab 1','Sulit'),
('Untuk membuktikan lim (x → 1) (x²) = 1, batas lokal δ ≤ 1 menghasilkan batas atas |x + 1| sebesar...','1','2','3','4','5','A','Limit','Bab 1','Sulit'),
('Manakah yang merupakan logika formal dari lim (x → c) f(x) = L?','Untuk setiap ε > 0 terdapat δ > 0 sehingga jika 0 < |x - c| < δ maka |f(x) - L| < ε','Untuk setiap δ > 0 terdapat ε > 0 sehingga jika 0 < |x - c| < δ maka |f(x) - L| < ε','Terdapat ε > 0 untuk setiap δ > 0 sehingga jika 0 < |x - c| < δ maka |f(x) - L| < ε','Untuk setiap ε > 0 dan setiap δ > 0 berlaku |f(x) - L| < ε','Logika limit tidak bergantung pada nilai ε dan δ','A','Limit','Bab 1','Sulit'),
('Pada pembuktian formal lim (x → 4) √x = 2 dengan δ ≤ 1, nilai pembagi maksimum untuk ε adalah...','1','2','3','1/2','4','A','Limit','Bab 1','Sulit'),

-- Bab 3: Aplikasi Turunan Sulit (46-50)
('Kotak tanpa tutup dari karton 12×12 cm dengan potongan x cm di sudutnya. Nilai x agar volume maksimum adalah...','2 cm','3 cm','4 cm','1.5 cm','2.5 cm','A','Aplikasi Turunan','Bab 3','Sulit'),
('Fungsi biaya C(x) = 2x² + 40x + 800. Tingkat produksi agar biaya rata-rata per unit minimum adalah...','10 unit','15 unit','20 unit','25 unit','30 unit','C','Aplikasi Turunan','Bab 3','Sulit'),
('Tentukan jarak terdekat dari titik (0, 5) ke kurva parabola y = x².','√19 / 2','√17 / 2','2','4','5','A','Aplikasi Turunan','Bab 3','Sulit'),
('Persegi panjang di dalam setengah lingkaran jari-jari R dengan satu sisi pada diameter. Luas maksimumnya adalah...','R²','1/2 R²','2 R²','√2 R²','1/4 R²','A','Aplikasi Turunan','Bab 3','Sulit'),
('Laju pertambahan luas permukaan bola saat r = 10 cm dan dr/dt = 2 cm/s adalah...','80π cm²/s','160π cm²/s','400π cm²/s','800π cm²/s','100π cm²/s','B','Aplikasi Turunan','Bab 3','Sulit'),

-- Bab 13: Integral Lipat Sulit (51-55)
('Hitunglah ∫(0→1) ∫(x→1) sin(y²) dy dx dengan mengubah urutan integrasi.','1/2 (1 - cos 1)','1/2 sin 1','cos 1','1 - cos 1','1/2','A','Integral Lipat','Bab 13','Sulit'),
('Nilai dari ∫(0→∞) ∫(x→∞) e^(-y²) dy dx setelah diubah urutan integrasinya adalah...','1/2','1/4','1','√π / 2','∞','A','Integral Lipat','Bab 13','Sulit'),
('Evaluasi ∫(0→1) ∫(0→√(1-x²)) (x² + y²) dy dx dengan koordinat polar.','π/4','π/8','π/16','π/2','π','B','Integral Lipat','Bab 13','Sulit'),
('Hitunglah integral dari e^(x² + y²) pada daerah lingkaran x² + y² ≤ 4.','π(e⁴ - 1)','2π(e⁴ - 1)','π/2 (e⁴ - 1)','π e⁴','4π e⁴','A','Integral Lipat','Bab 13','Sulit'),
('Volume benda pejal di bawah z = xy dan di atas 0 ≤ x ≤ 1, 0 ≤ y ≤ 2 adalah...','1','2','1/2','4','3','A','Integral Lipat','Bab 13','Sulit'),

-- Bab 7: Teknik Integrasi Sulit (56-60)
('Tentukan konstanta A dan B dari: 1 / (x² - 1) = A / (x - 1) + B / (x + 1).','A = 1/2, B = -1/2','A = 1/2, B = 1/2','A = 1, B = -1','A = -1/2, B = 1/2','A = 1, B = 0','A','Teknik Integrasi','Bab 7','Sulit'),
('Nilai integral ∫ dx / (x² - 4) adalah...','1/4 ln|(x-2)/(x+2)| + C','1/2 ln|(x-2)/(x+2)| + C','1/4 ln|(x+2)/(x-2)| + C','1/4 arctan(x/2) + C','ln|x² - 4| + C','A','Teknik Integrasi','Bab 7','Sulit'),
('Pada 1/[x(x²+1)] = A/x + (Bx+C)/(x²+1), nilai B dan C berturut-turut adalah...','B = -1, C = 0','B = 1, C = 0','B = -1, C = 1','B = 0, C = -1','B = 1, C = 1','A','Teknik Integrasi','Bab 7','Sulit'),
('Hasil dari integral ∫ (x + 2) / (x² + x) dx adalah...','2 ln|x| - ln|x+1| + C','ln|x| + ln|x+1| + C','2 ln|x| + ln|x+1| + C','ln|x| - 2 ln|x+1| + C','2 ln|x² + x| + C','A','Teknik Integrasi','Bab 7','Sulit'),
('Tentukan hasil integrasi: ∫ dx / (x² - 3x + 2).','ln|(x-2)/(x-1)| + C','ln|(x-1)/(x-2)| + C','1/2 ln|(x-2)/(x-1)| + C','ln|x² - 3x + 2| + C','arctan(x) + C','A','Teknik Integrasi','Bab 7','Sulit');
