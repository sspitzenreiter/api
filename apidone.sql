-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 24 Jan 2020 pada 07.32
-- Versi Server: 10.1.25-MariaDB
-- PHP Version: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `apidone`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `data_client`
--

CREATE TABLE `data_client` (
  `id` int(10) NOT NULL,
  `email` varchar(60) NOT NULL,
  `company` varchar(60) NOT NULL,
  `nama` varchar(60) NOT NULL,
  `api_key` char(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `data_client`
--

INSERT INTO `data_client` (`id`, `email`, `company`, `nama`, `api_key`) VALUES
(1, 'aduhsakit753@gmail.com', 'polpos', 'hagan', '34aa43f9eea3c03de4993cf299b019bc7a0ade1f');

-- --------------------------------------------------------

--
-- Struktur dari tabel `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `npm` char(7) NOT NULL,
  `nama_mhs` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `mahasiswa`
--

INSERT INTO `mahasiswa` (`npm`, `nama_mhs`) VALUES
('1173040', 'Budi'),
('1173041', 'Rina'),
('1173064', 'Susi'),
('1174040', 'Hagan'),
('1174041', 'Afra Faris');

-- --------------------------------------------------------

--
-- Struktur dari tabel `matakuliah`
--

CREATE TABLE `matakuliah` (
  `id_matkul` int(3) NOT NULL,
  `nama_matkul` varchar(30) NOT NULL,
  `semester` int(2) NOT NULL,
  `prodi` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `matakuliah`
--

INSERT INTO `matakuliah` (`id_matkul`, `nama_matkul`, `semester`, `prodi`) VALUES
(1, 'Algoritma', 1, 13),
(2, 'Pemrograman III', 1, 14),
(3, 'Pemrograman II', 2, 14),
(4, 'RPL II', 3, 14),
(5, 'Multimedia', 2, 13),
(6, 'Arsitektur Komputer', 3, 13);

-- --------------------------------------------------------

--
-- Struktur dari tabel `nilai`
--

CREATE TABLE `nilai` (
  `id` int(11) NOT NULL,
  `npm` char(7) DEFAULT NULL,
  `id_matkul` int(3) DEFAULT NULL,
  `nilai` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `nilai`
--

INSERT INTO `nilai` (`id`, `npm`, `id_matkul`, `nilai`) VALUES
(1, '1174040', 2, 'A'),
(2, '1174040', 3, 'B'),
(3, '1174040', 4, 'A'),
(4, '1174041', 2, 'A'),
(5, '1174041', 3, 'D'),
(6, '1174041', 4, 'B'),
(7, '1173040', 1, 'A'),
(8, '1173040', 5, 'E'),
(9, '1173041', 1, 'B'),
(10, '1173041', 5, 'B'),
(11, '1173041', 6, 'B'),
(12, '1173040', 6, 'A'),
(13, '1173064', 1, 'A'),
(14, '1173064', 5, 'B'),
(15, '1173064', 6, 'B');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `data_client`
--
ALTER TABLE `data_client`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`npm`);

--
-- Indexes for table `matakuliah`
--
ALTER TABLE `matakuliah`
  ADD PRIMARY KEY (`id_matkul`);

--
-- Indexes for table `nilai`
--
ALTER TABLE `nilai`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `data_client`
--
ALTER TABLE `data_client`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `matakuliah`
--
ALTER TABLE `matakuliah`
  MODIFY `id_matkul` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `nilai`
--
ALTER TABLE `nilai`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
