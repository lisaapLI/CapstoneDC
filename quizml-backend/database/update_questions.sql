-- ============================================
-- Update Soal: Hapus soal lama, isi soal baru
-- Jalankan di database: quiz
-- ============================================
USE quiz;

-- Hapus data jawaban & soal lama dulu (urutan penting karena ada FK)
DELETE FROM recommendations;
DELETE FROM quiz_results;
DELETE FROM quiz_answers;
DELETE FROM quiz_sessions;
DELETE FROM questions;

-- Reset auto increment
ALTER TABLE questions AUTO_INCREMENT = 1;

-- ============================================
-- INSERT SOAL BARU (60 soal Purcell Edisi 9)
-- BAGIAN I: MUDAH (1-20)
-- ============================================
INSERT INTO questions
  (soal, pilihan_a, pilihan_b, pilihan_c, pilihan_d, jawaban_benar, materi, bab, tingkat_kesulitan)
VALUES

-- MUDAH: Bab 1 Limit (1-10)
(
  'Tentukan nilai dari limit fungsi aljabar berikut: lim (x → 2) (3x² - 5x + 4)',
  '6','8','10','12','A','Limit','Bab 1','Mudah'
),
(
  'Berapakah nilai dari: lim (x → 0) (sin(3x) / x)',
  '0','3','1','1/3','B','Limit','Bab 1','Mudah'
),
(
  'Hitunglah nilai limit berikut: lim (x → 4) ((x² - 16) / (x - 4))',
  '0','4','8','16','C','Limit','Bab 1','Mudah'
),
(
  'Tentukan limit di tak hingga: lim (x → ∞) ((5x³ - 2x + 1) / (2x³ + 7x²))',
  '0','1','∞','2.5','D','Limit','Bab 1','Mudah'
),
(
  'Manakah nilai dari: lim (x → 3) ((√x - √3) / (x - 3))',
  '1/(2√3)','1/√3','2√3','0','A','Limit','Bab 1','Mudah'
),
(
  'Jika lim (x→c) f(x)=5 dan lim (x→c) g(x)=-2, tentukan: lim (x→c) (f(x)·g(x)²)',
  '10','100','49','25','B','Limit','Bab 1','Mudah'
),
(
  'Evaluasi limit sepihak berikut: lim (x → 1⁻) ((x - 1) / |x - 1|)',
  '1','0','-1','Tidak ada','C','Limit','Bab 1','Mudah'
),
(
  'Nilai dari: lim (x → ∞) (√(x² + 2x) - x)',
  '0','2','∞','1','D','Limit','Bab 1','Mudah'
),
(
  'Tentukan nilai dari: lim (x → 0) ((1 - cos x) / x)',
  '0','1','1/2','Tidak terdefinisi','A','Limit','Bab 1','Mudah'
),
(
  'Berapakah nilai dari: lim (x → 2⁺) (1 / (x - 2))',
  '0','∞','-∞','1','B','Limit','Bab 1','Mudah'
),

-- MUDAH: Bab 2 Turunan (11-20)
(
  'Jika f(x) = 4x³ - 2x² + 7x, maka f''(x) adalah:',
  '12x² - 4x','12x² - 4x + 7x','12x² - 4x + 7','4x² - 2x + 7','C','Turunan','Bab 2','Mudah'
),
(
  'Tentukan turunan pertama dari f(x) = 1/x²:',
  '2x','-2x⁻¹','x⁻³','-2x⁻³','D','Turunan','Bab 2','Mudah'
),
(
  'Jika y = cos(x²), maka dy/dx adalah:',
  '-2x sin(x²)','2x sin(x²)','-sin(x²)','-2 sin x','A','Turunan','Bab 2','Mudah'
),
(
  'Turunan dari f(x) = tan x adalah:',
  'sin²x','sec²x','cot x','sec x tan x','B','Turunan','Bab 2','Mudah'
),
(
  'Diberikan f(x) = √(3x + 1), berapakah nilai f''(1)?',
  '1/2','3/2','3/4','1/4','C','Turunan','Bab 2','Mudah'
),
(
  'Jika f(x) = sin x cos x, maka f''(x) sama dengan:',
  'cos²x + sin²x','sin(2x)','-cos(2x)','cos(2x)','D','Turunan','Bab 2','Mudah'
),
(
  'Aturan hasil bagi untuk y = x/(x+1). Hasilnya adalah:',
  '1/(x+1)²','(2x+1)/(x+1)²','-1/(x+1)²','1','A','Turunan','Bab 2','Mudah'
),
(
  'Turunan kedua f''''(x) dari f(x) = x⁴ - 5x² adalah:',
  '4x³ - 10x','12x² - 10','12x - 10','4x² - 5','B','Turunan','Bab 2','Mudah'
),
(
  'Cari dy/dx dari persamaan implisit x² + y² = 25:',
  'x/y','-2x','-x/y','y/x','C','Turunan','Bab 2','Mudah'
),
(
  'Laju perubahan sesaat luas lingkaran terhadap jari-jari r ketika r = 5 adalah:',
  '5π','25π','10','10π','D','Turunan','Bab 2','Mudah'
),

-- ============================================
-- BAGIAN II: SEDANG (21-40)
-- ============================================

-- SEDANG: Bab 3 Aplikasi Turunan (21-30)
(
  'Tentukan nilai maksimum lokal dari f(x) = (1/3)x³ - x² - 3x + 4:',
  'f(-1)','f(3)','f(0)','f(1)','A','Aplikasi Turunan','Bab 3','Sedang'
),
(
  'Pada interval manakah grafik f(x) = x³ - 3x² bersifat cekung ke atas?',
  '(-∞,1)','(1,∞)','(0,∞)','(-∞,0)','B','Aplikasi Turunan','Bab 3','Sedang'
),
(
  'Partikel bergerak dengan s(t)=2t³-9t²+12t. Kapan partikel berhenti sejenak?',
  't=0 dan t=1','t=2 dan t=3','t=1 dan t=2','Hanya t=1.5','C','Aplikasi Turunan','Bab 3','Sedang'
),
(
  'Titik kritis dari f(x) = |x| pada interval [-1, 2] adalah:',
  'x=-1 dan x=2','x=1','x=-1, 0, 2','x=0','D','Aplikasi Turunan','Bab 3','Sedang'
),
(
  'Nilai c yang memenuhi Mean Value Theorem untuk f(x)=x² pada [0,2] adalah:',
  '1','0.5','1.5','√2','A','Aplikasi Turunan','Bab 3','Sedang'
),
(
  'Kawat 20 cm dibentuk persegi panjang. Luas maksimum yang dapat dibentuk adalah:',
  '20 cm²','25 cm²','30 cm²','100 cm²','B','Aplikasi Turunan','Bab 3','Sedang'
),
(
  'Jika f''''(c)=0 dan f''''(x) berubah tanda di sekitar c, titik (c,f(c)) disebut:',
  'Titik stasioner','Titik singular','Titik belok','Titik maksimum','C','Aplikasi Turunan','Bab 3','Sedang'
),
(
  'Fungsi f(x) = x + (1/x) untuk x>0 memiliki nilai minimum di:',
  'x=0.5','x=2','x=4','x=1','D','Aplikasi Turunan','Bab 3','Sedang'
),
(
  'Menurut Mean Value Theorem, terdapat c ∈ (a,b) sehingga f''(c) sama dengan:',
  '(f(b)-f(a))/(b-a)','0','(f(a)+f(b))/2','f(b)-f(a)','A','Aplikasi Turunan','Bab 3','Sedang'
),
(
  'Grafik f(x) = x⁴ - 4x³ turun (decreasing) pada interval:',
  '(0,3)','(-∞,3)','(3,∞)','(-∞,0)','B','Aplikasi Turunan','Bab 3','Sedang'
),

-- SEDANG: Bab 4 Integral Tentu (31-40)
(
  'G(x) = ∫(1 sampai x²) (1/(t+1)) dt, tentukan G''(x) menggunakan FTC I:',
  '1/(x²+1)','2x/(x+1)','2x/(x²+1)','2x ln(x²+1)','C','Integral Tentu','Bab 4','Sedang'
),
(
  'Jika ∫(1→4) f=7 dan ∫(1→4) g=3, hitunglah ∫(1→4) (3f(x)-2g(x)) dx:',
  '12','18','21','15','B','Integral Tentu','Bab 4','Sedang'
),
(
  '∫(a→b) x dx melalui jumlah Riemann dengan xi*=(1/2)(xi-1+xi) menyusut menjadi:',
  '(1/2)(b²-a²)','b-a','(1/3)(b³-a³)','b²-a²','C','Integral Tentu','Bab 4','Sedang'
),
(
  'f(x)=√(x+1) dan g(x)=x+1 pada [0,3]. Pernyataan mana yang benar tentang integralnya?',
  '∫f = ∫g','∫f ≤ ∫g','∫f ≥ ∫g','∫f · ∫g = 1','D','Integral Tentu','Bab 4','Sedang'
),
(
  'Hitunglah ∫(-2→2) (x⁵+x³+x) dx dengan sifat fungsi ganjil:',
  '2','16','0','32','A','Integral Tentu','Bab 4','Sedang'
),
(
  'Jika 3 ≤ f(x) ≤ 6 untuk x ∈ [1,5], maka batas nilai ∫(1→5) f(x) dx adalah:',
  '3 dan 6','6 dan 12','15 dan 30','12 dan 24','B','Integral Tentu','Bab 4','Sedang'
),
(
  'Evaluasi ∫(-1→1) |x| dx dengan menganggap |x| sebagai fungsi genap:',
  '1','0','2','0.5','C','Integral Tentu','Bab 4','Sedang'
),
(
  'Tentukan nilai dari ∫(0→π/2) cos x dx:',
  '0','1','-1','π/2','D','Integral Tentu','Bab 4','Sedang'
),
(
  'Jika ∫(0→9) f(x) dx=12, hitunglah ∫(0→3) x·f(x²) dx menggunakan substitusi:',
  '12','24','6','3','A','Integral Tentu','Bab 4','Sedang'
),
(
  'Hitunglah luas daerah di bawah kurva y=x² dari x=0 hingga x=3:',
  '3','6','27','9','B','Integral Tentu','Bab 4','Sedang'
),

-- ============================================
-- BAGIAN III: SULIT (41-60)
-- ============================================

-- SULIT: Bab 7 Teknik Integrasi (41-50)
(
  'Gunakan integrasi parsial untuk menentukan ∫ x² eˣ dx:',
  'eˣ(x²-2x+2)+C','eˣ(x²+2x+2)+C','x²eˣ-2xeˣ+C','(1/3)x³eˣ+C','C','Teknik Integrasi','Bab 7','Sulit'
),
(
  'Hitunglah ∫(0→1) (x³/√(1-x²)) dx menggunakan substitusi x=sin θ:',
  '1/3','2/3','1','π/4','D','Teknik Integrasi','Bab 7','Sulit'
),
(
  'Tentukan ∫ ((5x-7)/(x²-3x+2)) dx dengan metode pecahan parsial:',
  '2 ln|x-1|+3 ln|x-2|+C','5 ln|x²-3x+2|+C','2 ln|x-2|+3 ln|x-1|+C','3 ln|x-2|+2 ln|x-1|+C','A','Teknik Integrasi','Bab 7','Sulit'
),
(
  'Evaluasi ∫ eˣ cos x dx menggunakan integrasi parsial dua kali:',
  'eˣ(sin x+cos x)+C','(1/2)eˣ(sin x-cos x)+C','eˣ sin x+C','(1/2)eˣ(sin x+cos x)+C','B','Teknik Integrasi','Bab 7','Sulit'
),
(
  'Tentukan ∫ (dx/(x²√(x²+4))) menggunakan substitusi x=2tan θ:',
  '-√(x²+4)/(4x)+C','√(x²+4)/(2x)+C','(1/2)ln|x+√(x²+4)|+C','x/√(x²+4)+C','C','Teknik Integrasi','Bab 7','Sulit'
),
(
  'Hitunglah nilai dari ∫(0→π/4) tan³x sec²x dx:',
  '1/2','1/4','1','1/3','D','Teknik Integrasi','Bab 7','Sulit'
),
(
  'Evaluasi ∫ ((x²+1)/(x(x-1)²)) dx menggunakan dekomposisi pecahan parsial:',
  'ln|x|+2/(x-1)+C','ln|x|-2/(x-1)+C','ln|x|-ln|x-1|-2/(x-1)+C','2 ln|x-1|+C','A','Teknik Integrasi','Bab 7','Sulit'
),
(
  'Hitung ∫ x ln x dx dengan teknik integrasi parsial:',
  '(1/2)x² ln x-(1/2)x²+C','x² ln x-x²+C','(1/2)x² ln x-x+C','(1/2)x² ln x-(1/4)x²+C','B','Teknik Integrasi','Bab 7','Sulit'
),
(
  'Tentukan hasil dari ∫ (dx/√(e²ˣ-1)) menggunakan substitusi u=eˣ:',
  'arcsec(eˣ)+C','ln|eˣ+√(e²ˣ-1)|+C','arctan(eˣ)+C','eˣ√(e²ˣ-1)+C','C','Teknik Integrasi','Bab 7','Sulit'
),
(
  'Hitunglah ∫ sin⁴x dx dengan identitas trigonometri:',
  '(3/8)x-(1/4)sin(2x)+(1/32)sin(4x)+C','(3/8)x+(1/4)sin(2x)+(1/32)sin(4x)+C','(1/5)sin⁵x+C','-(1/4)cos⁴x+C','D','Teknik Integrasi','Bab 7','Sulit'
),

-- SULIT: Bab 13 Integral Lipat (51-60)
(
  'Balik urutan integrasi untuk menghitung ∫(0→1)∫(y→1) eˣ² dx dy:',
  'e-1','e/2','(1/2)(e-1)','2e','A','Integral Lipat','Bab 13','Sulit'
),
(
  'Hitung ∬R (x+y) dA di mana R dibatasi oleh y=x² dan y=√x:',
  '1/2','1/4','3/10','3/20','B','Integral Lipat','Bab 13','Sulit'
),
(
  'Evaluasi integral lipat dua ∫(0→π)∫(0→sin x) y dy dx:',
  'π/4','π/2','1','2','C','Integral Lipat','Bab 13','Sulit'
),
(
  'Hitung volume di bawah z=xy di atas R=[0,2]×[0,3]:',
  '4','6','8','12','D','Integral Lipat','Bab 13','Sulit'
),
(
  'Tentukan ∫(0→1)∫(0→√(1-x²)) (x²+y²) dy dx dengan koordinat polar:',
  'π/4','π/2','π/8','π','A','Integral Lipat','Bab 13','Sulit'
),
(
  'Evaluasi ∫(0→1)∫(0→z)∫(0→y) x dx dy dz:',
  '1/6','1/12','1/24','1/48','B','Integral Lipat','Bab 13','Sulit'
),
(
  'Hitung ∬R y² dA di mana R adalah daerah persegi panjang [0,3]×[1,2]:',
  '7','3','9','21','C','Integral Lipat','Bab 13','Sulit'
),
(
  'Tentukan nilai ∫(1→2)∫(0→ln x) x eʸ dy dx:',
  '1/2','5/6','1','2/3','D','Integral Lipat','Bab 13','Sulit'
),
(
  'Hitung ∫(0→1)∫(x→1) sin(y²) dy dx dengan mengubah urutan integrasi:',
  '(1/2)(1-cos 1)','1-cos 1','cos 1','1/2','A','Integral Lipat','Bab 13','Sulit'
),
(
  'Hitunglah ∬R (1/(1+x+y)) dA di mana R=[0,1]×[0,1]:',
  'ln(2)','2 ln(2)','3 ln(3)-4 ln(2)','4 ln(4)-3 ln(3)','B','Integral Lipat','Bab 13','Sulit'
);

-- Verifikasi
SELECT tingkat_kesulitan, COUNT(*) as jumlah FROM questions GROUP BY tingkat_kesulitan;
SELECT materi, COUNT(*) as jumlah FROM questions GROUP BY materi;
