-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 05, 2021 at 03:24 PM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 7.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `toko`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `id_barang` varchar(6) NOT NULL,
  `nama_barang` varchar(20) NOT NULL,
  `harga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`id_barang`, `nama_barang`, `harga`) VALUES
('BR0001', 'Masker Duckbill', 35000),
('BR0002', 'Hanscoon Latex', 75000),
('BR0003', 'Hanscoon Nitrile', 125000),
('BR0004', 'Thermo Gun Infrared', 130000),
('BR0005', 'Masker Kids', 35000),
('BR0006', 'Masker Kain', 20000),
('BR0007', 'Syringe 3 Ml', 135000),
('BR0008', 'Syringe 5 Ml', 135000),
('BR0009', 'APD Full Protect', 150000),
('BR0010', 'APD Semi Protect', 95000);

-- --------------------------------------------------------

--
-- Table structure for table `faktur`
--

CREATE TABLE `faktur` (
  `id_faktur` varchar(10) NOT NULL,
  `id_pelanggan` varchar(5) NOT NULL,
  `tanggal` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `faktur`
--

INSERT INTO `faktur` (`id_faktur`, `id_pelanggan`, `tanggal`) VALUES
('FK20210001', 'PL002', '2021-10-05'),
('FK20210002', 'PL006', '2021-10-05'),
('FK20210003', 'PL007', '2021-10-05'),
('FK20210004', 'PL001', '2021-10-05'),
('FK20210005', 'PL008', '2021-10-05'),
('FK20210006', 'PL004', '2021-10-05');

-- --------------------------------------------------------

--
-- Table structure for table `faktur_barang`
--

CREATE TABLE `faktur_barang` (
  `id_faktur` varchar(10) NOT NULL,
  `id_barang` varchar(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `faktur_barang`
--

INSERT INTO `faktur_barang` (`id_faktur`, `id_barang`) VALUES
('FK20210001', 'BR0001'),
('FK20210001', 'BR0009'),
('FK20210001', 'BR0006'),
('FK20210002', 'BR0007'),
('FK20210002', 'BR0003'),
('FK20210002', 'BR0010'),
('FK20210002', 'BR0005'),
('FK20210002', 'BR0001'),
('FK20210003', 'BR0006'),
('FK20210003', 'BR0010'),
('FK20210003', 'BR0007'),
('FK20210003', 'BR0002'),
('FK20210004', 'BR0002'),
('FK20210004', 'BR0010'),
('FK20210004', 'BR0007'),
('FK20210004', 'BR0008'),
('FK20210005', 'BR0001'),
('FK20210005', 'BR0010'),
('FK20210005', 'BR0007'),
('FK20210005', 'BR0002'),
('FK20210006', 'BR0001'),
('FK20210006', 'BR0010');

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id_pelanggan` varchar(5) NOT NULL,
  `nama_pelanggan` varchar(40) NOT NULL,
  `telepon` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pelanggan`
--

INSERT INTO `pelanggan` (`id_pelanggan`, `nama_pelanggan`, `telepon`) VALUES
('PL001', 'Yongki Ferikarno', '081234765454'),
('PL002', 'Yonana Ferikarni', '081234765445'),
('PL003', 'Eka Prianto', '081234765400'),
('PL004', 'Aris Budoyo', '081234765777'),
('PL005', 'EMIL Salim', '081234765500'),
('PL006', 'Beni Primadoni', '081234765488'),
('PL007', 'Pramudiono', '081234765410'),
('PL008', 'Jessica', '081234765000'),
('PL009', 'Hengki Hermawan', '081234765999'),
('PL010', 'Naila Kartini', '081234766600');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id_barang`);

--
-- Indexes for table `faktur`
--
ALTER TABLE `faktur`
  ADD PRIMARY KEY (`id_faktur`),
  ADD KEY `id_pelanggan` (`id_pelanggan`);

--
-- Indexes for table `faktur_barang`
--
ALTER TABLE `faktur_barang`
  ADD KEY `id_barang` (`id_barang`),
  ADD KEY `id_faktur` (`id_faktur`);

--
-- Indexes for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `faktur`
--
ALTER TABLE `faktur`
  ADD CONSTRAINT `faktur_ibfk_1` FOREIGN KEY (`id_pelanggan`) REFERENCES `pelanggan` (`id_pelanggan`);

--
-- Constraints for table `faktur_barang`
--
ALTER TABLE `faktur_barang`
  ADD CONSTRAINT `faktur_barang_ibfk_1` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id_barang`),
  ADD CONSTRAINT `faktur_barang_ibfk_2` FOREIGN KEY (`id_faktur`) REFERENCES `faktur` (`id_faktur`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
