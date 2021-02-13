-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 13 Feb 2021 pada 08.46
-- Versi server: 10.4.16-MariaDB
-- Versi PHP: 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_kost`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `fasilitas`
--

CREATE TABLE `fasilitas` (
  `id_fasilitas` int(11) NOT NULL,
  `id_kriteria` int(11) NOT NULL,
  `nama_fasilitas` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `fasilitas`
--

INSERT INTO `fasilitas` (`id_fasilitas`, `id_kriteria`, `nama_fasilitas`) VALUES
(1, 6, 'Kasur'),
(2, 6, 'lemari'),
(3, 6, 'Wifi'),
(4, 6, 'Parkir Sepeda'),
(5, 6, 'TV'),
(6, 6, 'Dapur'),
(7, 6, 'Kamar Mandi Dalam'),
(8, 6, 'Mesin Cuci'),
(9, 6, 'Tempat Jemuran'),
(10, 6, 'Ruang Tamu');

-- --------------------------------------------------------

--
-- Struktur dari tabel `indekos`
--

CREATE TABLE `indekos` (
  `id_indekos` int(11) NOT NULL,
  `nama_kos` varchar(100) NOT NULL,
  `alamat_kos` varchar(255) NOT NULL,
  `jenis_kos` varchar(25) NOT NULL,
  `harga_sewa` varchar(25) NOT NULL,
  `jarak_kos` varchar(25) NOT NULL,
  `id_luas` int(11) NOT NULL,
  `id_fasilitas` int(255) NOT NULL,
  `id_kondisi` int(11) NOT NULL,
  `deskripsi` text NOT NULL,
  `status` int(11) NOT NULL,
  `image` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `indekos`
--

INSERT INTO `indekos` (`id_indekos`, `nama_kos`, `alamat_kos`, `jenis_kos`, `harga_sewa`, `jarak_kos`, `id_luas`, `id_fasilitas`, `id_kondisi`, `deskripsi`, `status`, `image`) VALUES
(4, 'kost mawar', 'jl. jawa 7', 'Indekos Putri', '', '', 0, 0, 0, '', 0, ''),
(5, 'sdd', 'ddddd', 'Indekos Putri', '300000', '11', 4, 7, 4, 'as', 0, '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `indekos_favorite`
--

CREATE TABLE `indekos_favorite` (
  `id_favorite` int(11) NOT NULL,
  `id_indekos` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `kondisi`
--

CREATE TABLE `kondisi` (
  `id_kondisi` int(11) NOT NULL,
  `id_kriteria` int(11) NOT NULL,
  `nama_kondisi` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `kondisi`
--

INSERT INTO `kondisi` (`id_kondisi`, `id_kriteria`, `nama_kondisi`) VALUES
(1, 7, 'Bersih'),
(2, 7, 'baru dicat ulang'),
(3, 7, '1 lokasi dengan pemilik'),
(4, 7, 'bangunan arsitektur modern'),
(5, 7, '2 lantai atau lebih');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kriteria`
--

CREATE TABLE `kriteria` (
  `id_kriteria` int(11) NOT NULL,
  `harga_sewa` decimal(10,0) NOT NULL,
  `jarak` varchar(100) NOT NULL,
  `luas_kamar` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `kriteria`
--

INSERT INTO `kriteria` (`id_kriteria`, `harga_sewa`, `jarak`, `luas_kamar`) VALUES
(6, '300000', '5', '3x4'),
(7, '0', '3', '4x3');

-- --------------------------------------------------------

--
-- Struktur dari tabel `level`
--

CREATE TABLE `level` (
  `id_level` int(11) NOT NULL,
  `nama_level` varchar(50) NOT NULL,
  `tanggal_buat` timestamp NOT NULL DEFAULT current_timestamp(),
  `tanggal_ubah` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `level`
--

INSERT INTO `level` (`id_level`, `nama_level`, `tanggal_buat`, `tanggal_ubah`) VALUES
(1, 'admin', '2021-02-10 15:57:29', '2021-02-10 15:57:29'),
(2, 'pemilik', '2021-02-10 15:57:55', '2021-02-10 15:57:55'),
(3, 'pencari', '2021-02-10 15:58:10', '2021-02-10 15:58:10');

-- --------------------------------------------------------

--
-- Struktur dari tabel `luas`
--

CREATE TABLE `luas` (
  `id_luas` int(11) NOT NULL,
  `luas_kamar` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `luas`
--

INSERT INTO `luas` (`id_luas`, `luas_kamar`) VALUES
(1, '4 x 5'),
(2, '4 x 4'),
(3, '4 x 3'),
(4, '3 x 3'),
(5, '3 x 2');

-- --------------------------------------------------------

--
-- Struktur dari tabel `standart_kualitatif`
--

CREATE TABLE `standart_kualitatif` (
  `id_standar` int(11) NOT NULL,
  `nama_standar` varchar(255) NOT NULL,
  `skor` int(11) NOT NULL,
  `id_kriteria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `id_level` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `alamat` varchar(1000) NOT NULL,
  `telepon` int(15) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(20) NOT NULL,
  `tanggal_buat` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `tanggal_ubah` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id_user`, `id_level`, `username`, `alamat`, `telepon`, `email`, `password`, `tanggal_buat`, `tanggal_ubah`) VALUES
(1, 1, 'admin', '', 0, 'admin@admin.com', 'admin', '2021-02-10 16:12:31', '2021-02-10 16:09:05'),
(2, 2, 'pemilik', 'jl.kalimantan no.07 sumbersari jember', 0, 'pemilik@pemilik', 'pemilik', '2021-02-10 16:17:15', '2021-02-10 16:17:15'),
(3, 3, 'pencari', 'jl.mawar melati lumajang', 0, 'pencari@gmail.com', 'pencari', '2021-02-10 16:18:28', '2021-02-10 16:18:28'),
(4, 2, 'husnul', 'jl. jawa 7 sumbersari jember', 0, 'husnul@null.com', 'husnul', '2021-02-11 05:38:31', '2021-02-11 05:38:31');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `fasilitas`
--
ALTER TABLE `fasilitas`
  ADD PRIMARY KEY (`id_fasilitas`),
  ADD UNIQUE KEY `id_fasilitas` (`id_fasilitas`),
  ADD KEY `id_kriteria` (`id_kriteria`);

--
-- Indeks untuk tabel `indekos`
--
ALTER TABLE `indekos`
  ADD PRIMARY KEY (`id_indekos`),
  ADD UNIQUE KEY `id_indekos` (`id_indekos`),
  ADD KEY `id_kondisi` (`id_kondisi`) USING BTREE,
  ADD KEY `id_fasilitas` (`id_fasilitas`) USING BTREE,
  ADD KEY `indekos_ibfk_3` (`id_luas`) USING BTREE;

--
-- Indeks untuk tabel `indekos_favorite`
--
ALTER TABLE `indekos_favorite`
  ADD PRIMARY KEY (`id_favorite`),
  ADD UNIQUE KEY `id_favorite` (`id_favorite`),
  ADD UNIQUE KEY `id_indekos` (`id_indekos`);

--
-- Indeks untuk tabel `kondisi`
--
ALTER TABLE `kondisi`
  ADD PRIMARY KEY (`id_kondisi`),
  ADD UNIQUE KEY `id_kondisi` (`id_kondisi`),
  ADD KEY `id_kriteria` (`id_kriteria`);

--
-- Indeks untuk tabel `kriteria`
--
ALTER TABLE `kriteria`
  ADD PRIMARY KEY (`id_kriteria`),
  ADD UNIQUE KEY `id_kriteria` (`id_kriteria`);

--
-- Indeks untuk tabel `level`
--
ALTER TABLE `level`
  ADD PRIMARY KEY (`id_level`) USING BTREE,
  ADD UNIQUE KEY `id_level` (`id_level`);

--
-- Indeks untuk tabel `luas`
--
ALTER TABLE `luas`
  ADD PRIMARY KEY (`id_luas`),
  ADD UNIQUE KEY `id_luas` (`id_luas`);

--
-- Indeks untuk tabel `standart_kualitatif`
--
ALTER TABLE `standart_kualitatif`
  ADD PRIMARY KEY (`id_standar`),
  ADD UNIQUE KEY `id_standar` (`id_standar`),
  ADD KEY `id_kriteria` (`id_kriteria`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `id_user` (`id_user`),
  ADD KEY `user_ibfk_1` (`id_level`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `fasilitas`
--
ALTER TABLE `fasilitas`
  MODIFY `id_fasilitas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `indekos`
--
ALTER TABLE `indekos`
  MODIFY `id_indekos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `kondisi`
--
ALTER TABLE `kondisi`
  MODIFY `id_kondisi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `kriteria`
--
ALTER TABLE `kriteria`
  MODIFY `id_kriteria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `level`
--
ALTER TABLE `level`
  MODIFY `id_level` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `luas`
--
ALTER TABLE `luas`
  MODIFY `id_luas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `fasilitas`
--
ALTER TABLE `fasilitas`
  ADD CONSTRAINT `fasilitas_ibfk_1` FOREIGN KEY (`id_kriteria`) REFERENCES `kriteria` (`id_kriteria`);

--
-- Ketidakleluasaan untuk tabel `indekos_favorite`
--
ALTER TABLE `indekos_favorite`
  ADD CONSTRAINT `indekos_favorite_ibfk_1` FOREIGN KEY (`id_indekos`) REFERENCES `indekos` (`id_indekos`);

--
-- Ketidakleluasaan untuk tabel `kondisi`
--
ALTER TABLE `kondisi`
  ADD CONSTRAINT `kondisi_ibfk_1` FOREIGN KEY (`id_kriteria`) REFERENCES `kriteria` (`id_kriteria`);

--
-- Ketidakleluasaan untuk tabel `standart_kualitatif`
--
ALTER TABLE `standart_kualitatif`
  ADD CONSTRAINT `standart_kualitatif_ibfk_1` FOREIGN KEY (`id_kriteria`) REFERENCES `kriteria` (`id_kriteria`);

--
-- Ketidakleluasaan untuk tabel `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`id_level`) REFERENCES `level` (`id_level`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
