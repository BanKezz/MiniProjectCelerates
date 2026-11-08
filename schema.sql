-- Web App Monitoring Kesehatan Ibu & Anak serta Jadwal Posyandu
CREATE DATABASE IF NOT EXISTS posyandu_db;
USE posyandu_db;

CREATE TABLE ibu (
  id_ibu INT AUTO_INCREMENT PRIMARY KEY,
  nik CHAR(16) UNIQUE NOT NULL,
  nama VARCHAR(100) NOT NULL,
  tanggal_lahir DATE NOT NULL,
  alamat TEXT,
  no_hp VARCHAR(15),
  status_kehamilan ENUM('hamil','tidak_hamil') DEFAULT 'tidak_hamil',
  hpl DATE NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE anak (
  id_anak INT AUTO_INCREMENT PRIMARY KEY,
  id_ibu INT NOT NULL,
  nama VARCHAR(100) NOT NULL,
  jenis_kelamin ENUM('L','P') NOT NULL,
  tanggal_lahir DATE NOT NULL,
  berat_lahir DECIMAL(4,2),
  FOREIGN KEY (id_ibu) REFERENCES ibu(id_ibu) ON DELETE CASCADE
);

CREATE TABLE jadwal_posyandu (
  id_jadwal INT AUTO_INCREMENT PRIMARY KEY,
  nama_kegiatan VARCHAR(100) NOT NULL,
  tanggal DATE NOT NULL,
  jam_mulai TIME NOT NULL,
  jam_selesai TIME NOT NULL,
  lokasi VARCHAR(150) NOT NULL,
  keterangan TEXT
);

CREATE TABLE pemeriksaan_ibu (
  id_periksa INT AUTO_INCREMENT PRIMARY KEY,
  id_ibu INT NOT NULL,
  id_jadwal INT NOT NULL,
  berat_badan DECIMAL(5,2),
  tekanan_darah VARCHAR(10),
  lila DECIMAL(4,1),
  usia_kehamilan_minggu INT,
  catatan TEXT,
  FOREIGN KEY (id_ibu) REFERENCES ibu(id_ibu) ON DELETE CASCADE,
  FOREIGN KEY (id_jadwal) REFERENCES jadwal_posyandu(id_jadwal)
);

CREATE TABLE pemeriksaan_anak (
  id_periksa INT AUTO_INCREMENT PRIMARY KEY,
  id_anak INT NOT NULL,
  id_jadwal INT NOT NULL,
  berat_badan DECIMAL(5,2),
  tinggi_badan DECIMAL(5,1),
  lingkar_kepala DECIMAL(4,1),
  imunisasi VARCHAR(100),
  status_gizi ENUM('baik','kurang','buruk','lebih') DEFAULT 'baik',
  catatan TEXT,
  FOREIGN KEY (id_anak) REFERENCES anak(id_anak) ON DELETE CASCADE,
  FOREIGN KEY (id_jadwal) REFERENCES jadwal_posyandu(id_jadwal)
);

-- ===== DATA DUMMY =====
INSERT INTO ibu (nik, nama, tanggal_lahir, alamat, no_hp, status_kehamilan, hpl) VALUES
('3214010101900001','Siti Aminah','1992-03-14','Jl. Melati No. 5, Purwakarta','081234560001','hamil','2027-01-20'),
('3214010101910002','Rina Marlina','1995-07-22','Jl. Mawar No. 12, Purwakarta','081234560002','tidak_hamil',NULL),
('3214010101930003','Dewi Lestari','1993-11-05','Jl. Anggrek No. 8, Purwakarta','081234560003','hamil','2026-12-10');

INSERT INTO anak (id_ibu, nama, jenis_kelamin, tanggal_lahir, berat_lahir) VALUES
(1,'Aisyah Putri','P','2024-05-10',3.10),
(2,'Raka Pratama','L','2025-02-18',3.40),
(3,'Naufal Hakim','L','2023-09-01',2.90);

INSERT INTO jadwal_posyandu (nama_kegiatan, tanggal, jam_mulai, jam_selesai, lokasi, keterangan) VALUES
('Posyandu Melati','2026-11-15','08:00:00','11:00:00','Balai RW 03','Penimbangan dan imunisasi'),
('Posyandu Melati','2026-12-13','08:00:00','11:00:00','Balai RW 03','Pemeriksaan ibu hamil'),
('Posyandu Mawar','2026-11-22','09:00:00','12:00:00','Balai RW 05','Penimbangan balita');

INSERT INTO pemeriksaan_ibu (id_ibu, id_jadwal, berat_badan, tekanan_darah, lila, usia_kehamilan_minggu, catatan) VALUES
(1,1,62.5,'110/70',25.0,24,'Kondisi baik'),
(3,1,68.0,'120/80',26.5,34,'Disarankan kontrol bidan');

INSERT INTO pemeriksaan_anak (id_anak, id_jadwal, berat_badan, tinggi_badan, lingkar_kepala, imunisasi, status_gizi, catatan) VALUES
(1,1,11.2,82.0,46.5,'Campak','baik','Perkembangan normal'),
(2,1,8.5,70.0,44.0,'DPT-HB-Hib 3','baik','Sehat'),
(3,3,12.0,88.0,48.0,'-','kurang','Perlu pemantauan gizi');
