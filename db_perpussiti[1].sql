-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 21 Feb 2024 pada 03.08
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_perpussiti`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_buku`
--

CREATE TABLE `t_buku` (
  `bukuID` int(11) NOT NULL,
  `Foto` varchar(255) NOT NULL,
  `kategoriID` int(11) NOT NULL,
  `judul` varchar(255) DEFAULT NULL,
  `penulis` varchar(255) DEFAULT NULL,
  `penerbit` varchar(255) DEFAULT NULL,
  `tahunTerbit` int(11) DEFAULT NULL,
  `stok` int(11) NOT NULL,
  `deskripsi` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `t_buku`
--

INSERT INTO `t_buku` (`bukuID`, `Foto`, `kategoriID`, `judul`, `penulis`, `penerbit`, `tahunTerbit`, `stok`, `deskripsi`) VALUES
(7, 'mariposa.jpg', 1, 'Mariposa', 'Luluk HF', 'Gramedia Pustaka', 2018, 8, 'Novel Mariposa mengisahkan seorang gadis cantik bernama Natasha Kay Loovi atau kerap disapa Acha yang memperjuangkan cintanya terhadap seorang laki-laki berhati beku dan super dingin–bagaikan es–dengan kehidupannya yang serba monoton, bernama Iqbal. Mereka berdua adalah siswa yang sangat pintar di sekolah.'),
(8, 'senjakala.jpg', 1, 'Senjakala', 'Risa Saraswati', 'Bukuné', 2018, 16, 'Setiap orang punya perasaan yang berbeda tentang gurat merah yang menghiasi langit senja itu. Ada yang menganggapnya indah,tenang, bahkan romantis—seperti yang sekarang kian populer disajakkan para penyair.  Namun, bagiku, Peter, Hans, Hendrick, William, dan Janshen, saat itu artinya tidak boleh ke mana-mana. Kami akan berada di kamar dan aku bercerita tentang hal mengerikan apa saja yang bisa muncul di waktu senja.'),
(9, 'dearj.jpg', 1, 'Dear J', 'Lilaclullaby', 'Self publishing', 2018, 7, 'Dear J— bercerita tentang kehidupan Na Jaemin,seorang pemuda yang digambarkan sebagai orang yang mempunyai kekurangan fisik. Hidup sebagai tunawicara, jaemin disebut lelaki cacat,yang karena kekurangannya,ia selalu menjadi bahan bulian teman-temannya. Walaupun demikian, kekurangannya tidak menjadi halangan untuk hidupnya. '),
(10, 'cerpen.jpeg', 4, 'Inspiratif Untuk Membentuk Karakter Anak', 'Dilla Fadhillah, Rizka Ezzafira, Syafani Mayang Septi, Cut Dihe Zayhaqqi Ali', 'KataBuku', 2017, 6, 'Di sebuah desa terdapat tiga remaja yang bersahabat dari kecil. Ketiga remaja itu bernama Aisyah, Keylla, dan Natasya. Mereka berumur 8 tahun. Rumah mereka saling berdekatan sehingga sering keluar bersama. Saat TK sampai sekarang mereka satu sekolah dan berangkat bersama-sama. '),
(11, 'ancika.jpg', 1, 'Ancika', 'Pidi Baiq', 'Pastel Books', 2021, 16, 'Ancika: Dia Yang Bersamaku Tahun 1995 menceritakan tentang persahabatan antara Dilan dan Ancika Mehrunisa Rabu. Hubungan mereka yang semakin dekat membuat benih-benih cinta tumbuh dan hubungan mereka pun naik tingkat menjadi hubungan sepasang kekasih. Ancika merupakan gadis cantik yang memiliki sifat tegas, rajin, dan memiliki pendirian yang kuat.'),
(12, 'pendidikan.jpg', 6, 'Implementasi Penguatan Pendidikan Karakter', 'Hamdani, S.Pd.,M.Pd', 'Erlangga', 2022, 23, 'Inspirasi bagi para pendidik tentang bagaimana cara menerapkan pendidikan karakter anak dalam pembelajaran di sekolah. Dengan adanya buku ini, para anak dapat mengikuti karakter yang baik ketika melakukan pembelajaran disekolah.');

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_kategoribuku`
--

CREATE TABLE `t_kategoribuku` (
  `kategoriID` int(11) NOT NULL,
  `namaKategori` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `t_kategoribuku`
--

INSERT INTO `t_kategoribuku` (`kategoriID`, `namaKategori`) VALUES
(1, 'Novel '),
(3, 'Sejarah'),
(4, 'Cerita Pendek'),
(5, 'Legenda'),
(6, 'Pendidikan');

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_peminjaman`
--

CREATE TABLE `t_peminjaman` (
  `peminjamanID` int(11) NOT NULL,
  `Kode_pinjam` varchar(10) NOT NULL,
  `userID` int(11) DEFAULT NULL,
  `bukuID` int(11) DEFAULT NULL,
  `tgl_peminjaman` date DEFAULT NULL,
  `tgl_pengembalian` date DEFAULT NULL,
  `jumlah` int(11) NOT NULL,
  `statusPeminjaman` enum('dipinjam','dikembalikan') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `t_peminjaman`
--

INSERT INTO `t_peminjaman` (`peminjamanID`, `Kode_pinjam`, `userID`, `bukuID`, `tgl_peminjaman`, `tgl_pengembalian`, `jumlah`, `statusPeminjaman`) VALUES
(15, 'PB003', 6, 10, '2024-02-12', '2024-02-19', 2, 'dikembalikan'),
(16, 'PB004', 6, 8, '2024-02-12', '2024-02-19', 2, 'dikembalikan'),
(17, 'PB005', 6, 7, '2024-02-12', '2024-02-19', 2, 'dikembalikan'),
(18, 'PB006', 10, 8, '2024-02-13', '2024-02-20', 1, 'dikembalikan'),
(20, 'PB008', 9, 9, '2024-02-17', '2024-02-24', 3, 'dipinjam'),
(21, 'PB009', 11, 7, '2024-02-21', '2024-02-28', 0, 'dikembalikan');

--
-- Trigger `t_peminjaman`
--
DELIMITER $$
CREATE TRIGGER `kembali_buku` AFTER UPDATE ON `t_peminjaman` FOR EACH ROW begin 
update t_buku set stok = stok + old.jumlah
where bukuID = old.bukuID;
end
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `tambah_buku` AFTER INSERT ON `t_peminjaman` FOR EACH ROW BEGIN 
UPDATE t_buku set stok = stok-new.jumlah
WHERE bukuID = new.bukuID;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_ulasanbuku`
--

CREATE TABLE `t_ulasanbuku` (
  `ulasanID` int(11) NOT NULL,
  `userID` int(11) DEFAULT NULL,
  `bukuID` int(11) DEFAULT NULL,
  `ulasan` text DEFAULT NULL,
  `rating` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `t_ulasanbuku`
--

INSERT INTO `t_ulasanbuku` (`ulasanID`, `userID`, `bukuID`, `ulasan`, `rating`) VALUES
(4, 6, 8, 'Buku ini sangat bagus, rekomendasi untuk yang suka cerita horror', 9),
(5, 11, 11, 'Buku ini bagus sekali, cocok untuk anak remaja yang suka cerita romance', 8),
(6, 9, 9, 'Buku ini sangat bagus, banyak pelajaran yang dapat diambil dari buku ini', 10),
(7, 6, 7, 'Saya suka buku ini karena buku ini mengajarkan saya untuk jangan terlalu mengerjar seseorang yang tidak mau untuk digapai', 9);

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_user`
--

CREATE TABLE `t_user` (
  `userID` int(11) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `telp` varchar(14) DEFAULT NULL,
  `namaLengkap` varchar(150) DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `level` enum('admin','petugas','anggota','') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `t_user`
--

INSERT INTO `t_user` (`userID`, `username`, `password`, `email`, `telp`, `namaLengkap`, `alamat`, `level`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'admin@email.com', NULL, 'administrator', 'admin', 'admin'),
(6, 'peminjam', '55f3894bc5fc71fead8412d321c2952c', 'peminjam@gmail.com', 'NULL', 'Peminjam', 'peminjam', 'anggota'),
(7, 'petugas', 'afb91ef692fd08c445e8cb1bab2ccf9c', 'petugas@gmail.com', '097371938193', 'petugas', 'petugas', 'petugas'),
(9, 'akhdalayalia', '5aa0e17f61dfa2f6365a1301476285ae', 'akhdalayalia6@gmail.com', '083116977886', 'Akhda Layalia Nur Azka', 'Perumahan Pesona Prima Citapen', 'anggota'),
(10, 'Andinirgn_', 'b3e0d57ba78cbdc6fcba9c7a467e8fad', 'andinirgn@gmail.com', '088102326042', 'Andini Regina Utami', 'Cigintung', 'anggota'),
(11, 'sitikomrh_', '121a8b582fac5d6112b01bddb4d26624', 'sitykomariah935@gmail.com', '085211069517', 'Siti Komariah', 'Jl. Raya Batujajar', 'anggota'),
(12, 'haloo', 'b37d149d7ac13a281bc524e684c73b61', 'haloo@gmail.com', 'NULL', 'haloooo', 'haloo', 'anggota'),
(13, 'fadel', 'b2f1b83629db8b1b7f0ddc8dc879f7a4', 'fadel@gmail.com', 'NULL', 'fadelia', 'citapen', 'petugas'),
(14, 'saya', '20c1a26a55039b30866c9d0aa51953ca', 'saya@gmail.com', 'NULL', 'saya siapa', 'NULL', 'petugas'),
(15, 'hsakj', '47bce5c74f589f4867dbd57e9ca9f808', 'aaa', '09', 'aa', 'aa', 'petugas');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `t_buku`
--
ALTER TABLE `t_buku`
  ADD PRIMARY KEY (`bukuID`),
  ADD KEY `kategoriID` (`kategoriID`);

--
-- Indeks untuk tabel `t_kategoribuku`
--
ALTER TABLE `t_kategoribuku`
  ADD PRIMARY KEY (`kategoriID`);

--
-- Indeks untuk tabel `t_peminjaman`
--
ALTER TABLE `t_peminjaman`
  ADD PRIMARY KEY (`peminjamanID`),
  ADD KEY `userID` (`userID`),
  ADD KEY `bukuID` (`bukuID`);

--
-- Indeks untuk tabel `t_ulasanbuku`
--
ALTER TABLE `t_ulasanbuku`
  ADD PRIMARY KEY (`ulasanID`),
  ADD KEY `userID` (`userID`),
  ADD KEY `bukuID` (`bukuID`);

--
-- Indeks untuk tabel `t_user`
--
ALTER TABLE `t_user`
  ADD PRIMARY KEY (`userID`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `t_buku`
--
ALTER TABLE `t_buku`
  MODIFY `bukuID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT untuk tabel `t_kategoribuku`
--
ALTER TABLE `t_kategoribuku`
  MODIFY `kategoriID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `t_peminjaman`
--
ALTER TABLE `t_peminjaman`
  MODIFY `peminjamanID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT untuk tabel `t_ulasanbuku`
--
ALTER TABLE `t_ulasanbuku`
  MODIFY `ulasanID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `t_user`
--
ALTER TABLE `t_user`
  MODIFY `userID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `t_buku`
--
ALTER TABLE `t_buku`
  ADD CONSTRAINT `t_buku_ibfk_1` FOREIGN KEY (`kategoriID`) REFERENCES `t_kategoribuku` (`kategoriID`);

--
-- Ketidakleluasaan untuk tabel `t_peminjaman`
--
ALTER TABLE `t_peminjaman`
  ADD CONSTRAINT `t_peminjaman_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `t_user` (`userID`),
  ADD CONSTRAINT `t_peminjaman_ibfk_2` FOREIGN KEY (`bukuID`) REFERENCES `t_buku` (`bukuID`);

--
-- Ketidakleluasaan untuk tabel `t_ulasanbuku`
--
ALTER TABLE `t_ulasanbuku`
  ADD CONSTRAINT `t_ulasanbuku_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `t_user` (`userID`),
  ADD CONSTRAINT `t_ulasanbuku_ibfk_2` FOREIGN KEY (`bukuID`) REFERENCES `t_buku` (`bukuID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
