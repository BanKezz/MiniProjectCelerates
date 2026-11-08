# Web App Monitoring Kesehatan Ibu & Anak serta Jadwal Posyandu

## Deskripsi Studi Kasus
Pencatatan kesehatan ibu hamil dan balita di posyandu umumnya masih manual (buku KIA dan kertas). Akibatnya data sulit ditelusuri, riwayat pertumbuhan anak tidak terpantau berkelanjutan, dan informasi jadwal kegiatan sering terlambat sampai ke warga. Web app ini mendigitalkan pencatatan pemeriksaan, memantau status gizi, dan menyediakan jadwal posyandu yang dapat diakses kapan saja.

## Pengguna
- Admin/Kader posyandu: mengelola data dan jadwal
- Tenaga kesehatan (bidan): meninjau hasil pemeriksaan
- Ibu/Orang tua: melihat data anak dan jadwal

## Kebutuhan Fungsional
1. Login dan manajemen akun berbasis peran
2. CRUD data ibu dan anak
3. Pencatatan pemeriksaan ibu (berat badan, tekanan darah, LILA, usia kehamilan)
4. Pencatatan pemeriksaan anak (berat, tinggi, lingkar kepala, imunisasi)
5. Grafik pertumbuhan anak dan status gizi
6. CRUD jadwal posyandu dan kalender kegiatan
7. Pengingat jadwal dan imunisasi
8. Laporan rekap bulanan (ekspor PDF/Excel)

## Kebutuhan Non-Fungsional
Responsif (mobile-first), data pribadi terlindungi (password hash, .env tidak di-commit), antarmuka sederhana untuk pengguna awam.
