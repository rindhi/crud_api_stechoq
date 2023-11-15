-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 29, 2023 at 02:19 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ta_stechoq`
--

-- --------------------------------------------------------

--
-- Table structure for table `data_employee`
--

CREATE TABLE `data_employee` (
  `id_employee` int(25) NOT NULL,
  `id_mesin` int(25) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `tempat_lahir` varchar(100) NOT NULL,
  `jenis_kelamin` char(5) NOT NULL,
  `email` varchar(50) NOT NULL,
  `no_hp` char(20) NOT NULL,
  `status` char(2) NOT NULL,
  `alamat` text NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `data_employee`
--

INSERT INTO `data_employee` (`id_employee`, `id_mesin`, `nama`, `tgl_lahir`, `tempat_lahir`, `jenis_kelamin`, `email`, `no_hp`, `status`, `alamat`, `keterangan`) VALUES
(123, 456, 'rindhi', '2002-04-02', 'jbg', 'P', 'rindhi@gmail.com', '08111111', 'A', 'plandaan', 'test2'),
(345, 568, 'reva', '2002-04-08', 'sby', 'P', 'reva@gmail.com', '08575433333', 'A', 'Ploso', 'test1'),
(987, 765, 'aldo', '1999-05-06', 'malang', 'L', 'aldo@gmail.com', '08155555555988', 'A', 'Malang', 'test3');

-- --------------------------------------------------------

--
-- Table structure for table `data_mesin`
--

CREATE TABLE `data_mesin` (
  `id_mesin` int(25) NOT NULL,
  `id_scw` int(25) NOT NULL,
  `nama_mesin` varchar(50) NOT NULL,
  `tipe_mesin` varchar(50) NOT NULL,
  `status_mesin` char(2) NOT NULL,
  `deskripsi_mesin` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `data_mesin`
--

INSERT INTO `data_mesin` (`id_mesin`, `id_scw`, `nama_mesin`, `tipe_mesin`, `status_mesin`, `deskripsi_mesin`) VALUES
(123, 234, 'mesin giling', 'tipe a', 'Y', 'tidak ada deskripsi bos');

-- --------------------------------------------------------

--
-- Table structure for table `data_user`
--

CREATE TABLE `data_user` (
  `id_user` int(25) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `username` varchar(25) NOT NULL,
  `password` text NOT NULL,
  `status` char(2) NOT NULL,
  `tgl_buat` datetime NOT NULL,
  `tgl_update` datetime NOT NULL,
  `id_buat` char(25) NOT NULL,
  `id_update` char(25) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `data_user`
--

INSERT INTO `data_user` (`id_user`, `nama`, `username`, `password`, `status`, `tgl_buat`, `tgl_update`, `id_buat`, `id_update`) VALUES
(123, 'rindhi', 'rindhi', 'rindhi123', 'Y', '2023-05-22 18:22:48', '2023-05-22 18:22:48', '098', '098');

-- --------------------------------------------------------

--
-- Table structure for table `departmen`
--

CREATE TABLE `departmen` (
  `id_department` int(25) NOT NULL,
  `id_employee` int(25) NOT NULL,
  `nama_department` varchar(25) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `departmen`
--

INSERT INTO `departmen` (`id_department`, `id_employee`, `nama_department`) VALUES
(345, 123, 'software engineer');

-- --------------------------------------------------------

--
-- Table structure for table `history_kerusakan`
--

CREATE TABLE `history_kerusakan` (
  `id_kerusakan` int(25) NOT NULL,
  `id_mesin` int(25) NOT NULL,
  `id_scw` int(25) NOT NULL,
  `id_employee` int(25) NOT NULL,
  `abnormality` text NOT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `history_kerusakan`
--

INSERT INTO `history_kerusakan` (`id_kerusakan`, `id_mesin`, `id_scw`, `id_employee`, `abnormality`, `start_time`, `end_time`) VALUES
(123, 234, 345, 456, 'tidak tau', '2023-05-22 18:23:53', '2023-05-22 18:23:53');

-- --------------------------------------------------------

--
-- Table structure for table `jabatan`
--

CREATE TABLE `jabatan` (
  `id_jabatan` int(25) NOT NULL,
  `id_employee` int(25) NOT NULL,
  `nama_jabatan` varchar(25) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `jabatan`
--

INSERT INTO `jabatan` (`id_jabatan`, `id_employee`, `nama_jabatan`) VALUES
(123, 234, 'divisi a');

-- --------------------------------------------------------

--
-- Table structure for table `lokasi`
--

CREATE TABLE `lokasi` (
  `id_mesin` int(25) NOT NULL,
  `id_kerusakan` int(25) NOT NULL,
  `lokasi` varchar(25) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `lokasi`
--

INSERT INTO `lokasi` (`id_mesin`, `id_kerusakan`, `lokasi`) VALUES
(123, 234, 'gedung luar');

-- --------------------------------------------------------

--
-- Table structure for table `problem_scw`
--

CREATE TABLE `problem_scw` (
  `id_scw` int(25) NOT NULL,
  `kode_scw` int(25) NOT NULL,
  `jenis_scw` char(5) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `problem_scw`
--

INSERT INTO `problem_scw` (`id_scw`, `kode_scw`, `jenis_scw`) VALUES
(123, 234, 'jenis');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `data_employee`
--
ALTER TABLE `data_employee`
  ADD PRIMARY KEY (`id_employee`);

--
-- Indexes for table `data_mesin`
--
ALTER TABLE `data_mesin`
  ADD PRIMARY KEY (`id_mesin`);

--
-- Indexes for table `data_user`
--
ALTER TABLE `data_user`
  ADD PRIMARY KEY (`id_user`);

--
-- Indexes for table `departmen`
--
ALTER TABLE `departmen`
  ADD PRIMARY KEY (`id_department`);

--
-- Indexes for table `history_kerusakan`
--
ALTER TABLE `history_kerusakan`
  ADD PRIMARY KEY (`id_kerusakan`);

--
-- Indexes for table `jabatan`
--
ALTER TABLE `jabatan`
  ADD PRIMARY KEY (`id_jabatan`);

--
-- Indexes for table `problem_scw`
--
ALTER TABLE `problem_scw`
  ADD PRIMARY KEY (`id_scw`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
