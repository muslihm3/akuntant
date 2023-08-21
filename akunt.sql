-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 21, 2023 at 08:15 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `akunt`
--

-- --------------------------------------------------------

--
-- Table structure for table `akun1s`
--

CREATE TABLE `akun1s` (
  `id_akun1` int(6) UNSIGNED NOT NULL,
  `kode_akun1` varchar(6) NOT NULL,
  `nama_akun1` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `akun1s`
--

INSERT INTO `akun1s` (`id_akun1`, `kode_akun1`, `nama_akun1`) VALUES
(1, '1', 'Aktiva'),
(2, '2', 'Kewajiban'),
(3, '3', 'Modal'),
(4, '4', 'Pendapatan'),
(5, '5', 'Beban');

-- --------------------------------------------------------

--
-- Table structure for table `akun2s`
--

CREATE TABLE `akun2s` (
  `id_akun2` int(6) UNSIGNED NOT NULL,
  `kode_akun2` int(6) UNSIGNED NOT NULL,
  `nama_akun2` varchar(40) NOT NULL,
  `kode_akun1` int(6) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `akun2s`
--

INSERT INTO `akun2s` (`id_akun2`, `kode_akun2`, `nama_akun2`, `kode_akun1`) VALUES
(1, 11, 'Aktiva Lancar', 1),
(2, 12, 'Aktiva Tetap', 1),
(3, 21, 'Utang Jangka Pendek', 2),
(4, 22, 'Utang Jangka Panjang', 2),
(5, 31, 'Modal Pemilik', 3),
(6, 32, 'Prive Pemilik', 3),
(7, 41, 'Pendapatan Usaha', 4),
(8, 42, 'Pendapatan diluar Usaha', 4),
(9, 51, 'Beban Usaha', 5),
(10, 52, 'Beban diluar Usaha', 5);

-- --------------------------------------------------------

--
-- Table structure for table `akun3s`
--

CREATE TABLE `akun3s` (
  `id_akun3` int(6) UNSIGNED NOT NULL,
  `kode_akun3` int(6) UNSIGNED NOT NULL,
  `nama_akun3` varchar(70) NOT NULL,
  `kode_akun2` int(6) UNSIGNED NOT NULL,
  `kode_akun1` int(6) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `akun3s`
--

INSERT INTO `akun3s` (`id_akun3`, `kode_akun3`, `nama_akun3`, `kode_akun2`, `kode_akun1`) VALUES
(1, 1101, 'Kas', 11, 1),
(2, 1102, 'Piutang Usaha', 11, 1),
(3, 1103, 'Sewa Dibayar dimuka', 11, 1),
(4, 1104, 'Asuransi Dibayar dimuka', 11, 1),
(5, 1201, 'Peralatan Kantor', 12, 1),
(6, 1202, 'Akumulasi Penyusutan P. Kantor', 12, 1),
(7, 2101, 'Utang Usaha', 21, 2),
(8, 2102, 'Utang Gaji', 21, 2),
(9, 2103, 'Pendapatan diterima di Muka', 21, 2),
(10, 2201, 'Utang Hipotek', 22, 2),
(11, 2202, 'Utang Obligasi', 22, 2),
(12, 3101, 'Modal Pemilik', 31, 3),
(13, 3102, 'Modal Lainnya', 31, 3),
(14, 3201, 'Prive Pemilik', 32, 3),
(15, 3201, 'Prive tuan A', 32, 3),
(16, 4101, 'Pendapatan Jasa', 41, 4),
(17, 4102, 'Pendapatan diterima di Muka', 41, 4),
(18, 4201, 'Pendapatan diluar usaha', 42, 4),
(19, 4202, 'Pendapatan lainnya', 42, 4),
(20, 5101, 'Beban Gaji Karyawan', 51, 5),
(21, 5102, 'Beban Iklan', 51, 5),
(22, 5103, 'Beban Asuransi', 51, 5),
(23, 5104, 'Beban Telepon', 51, 5),
(24, 5105, 'Beban Listrik', 51, 5),
(25, 5106, 'Beban Sewa', 51, 5),
(26, 5107, 'Beban Penyusutan Peralatan Kantor', 51, 5),
(27, 5108, 'Beban Perlengkapan Kantor', 51, 5),
(28, 5201, 'Beban Bunga', 52, 5),
(29, 5202, 'Beban Lainnya', 52, 5),
(31, 1105, 'Pesediaan barang dagang', 11, 1);

-- --------------------------------------------------------

--
-- Table structure for table `auth_activation_attempts`
--

CREATE TABLE `auth_activation_attempts` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(255) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `token` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_groups`
--

CREATE TABLE `auth_groups` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `auth_groups`
--

INSERT INTO `auth_groups` (`id`, `name`, `description`) VALUES
(1, 'admin', 'Pengelola Sistem'),
(2, 'user', 'Pengguna Sistem');

-- --------------------------------------------------------

--
-- Table structure for table `auth_groups_permissions`
--

CREATE TABLE `auth_groups_permissions` (
  `group_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `permission_id` int(11) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `auth_groups_permissions`
--

INSERT INTO `auth_groups_permissions` (`group_id`, `permission_id`) VALUES
(1, 1),
(1, 2),
(2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `auth_groups_users`
--

CREATE TABLE `auth_groups_users` (
  `group_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `user_id` int(11) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `auth_groups_users`
--

INSERT INTO `auth_groups_users` (`group_id`, `user_id`) VALUES
(1, 1),
(1, 2),
(2, 3),
(2, 4);

-- --------------------------------------------------------

--
-- Table structure for table `auth_logins`
--

CREATE TABLE `auth_logins` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `user_id` int(11) UNSIGNED DEFAULT NULL,
  `date` datetime NOT NULL,
  `success` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `auth_logins`
--

INSERT INTO `auth_logins` (`id`, `ip_address`, `email`, `user_id`, `date`, `success`) VALUES
(1, '::1', 'sasa@ontycake.id', 2, '2023-06-27 01:54:16', 1),
(2, '::1', 'sasa@ontycake.id', 2, '2023-06-27 01:54:35', 1),
(3, '::1', 'ontycake.id@gmail.com', 3, '2023-06-27 04:07:06', 1),
(4, '::1', 'sasa@ontycake.id', 2, '2023-06-27 04:22:38', 1),
(5, '::1', 'ontycake.id@gmail.com', 3, '2023-06-28 01:21:33', 1),
(6, '::1', 'sasa@ontycake.id', 2, '2023-07-01 02:30:44', 1),
(7, '::1', 'ontycake.id@gmail.com', 3, '2023-07-01 02:31:19', 1),
(8, '::1', 'lana', NULL, '2023-08-09 04:14:39', 0),
(9, '::1', 'lana', NULL, '2023-08-09 04:14:53', 0),
(10, '::1', 'admin', NULL, '2023-08-09 04:15:05', 0),
(11, '::1', 'admin', NULL, '2023-08-09 04:15:12', 0),
(12, '::1', 'admin', NULL, '2023-08-09 04:15:19', 0),
(13, '::1', 'lana', NULL, '2023-08-09 04:16:00', 0),
(14, '::1', 'lana@ontycake.id', NULL, '2023-08-09 04:16:16', 0),
(15, '::1', 'sasa@ontycake.id', 2, '2023-08-09 04:17:11', 1),
(16, '::1', 'sasa@ontycake.id', 2, '2023-08-09 04:17:56', 1),
(17, '::1', 'lana', NULL, '2023-08-09 04:18:19', 0),
(18, '::1', 'sasa@ontycake.id', 2, '2023-08-09 04:18:40', 1),
(19, '::1', 'lana', NULL, '2023-08-09 04:20:02', 0),
(20, '::1', 'lana', NULL, '2023-08-09 04:20:08', 0),
(21, '::1', 'admin', NULL, '2023-08-09 04:23:26', 0),
(22, '::1', 'admin', NULL, '2023-08-09 04:23:35', 0),
(23, '::1', 'sasa@ontycake.id', 2, '2023-08-09 04:23:43', 1),
(24, '::1', 'lana', NULL, '2023-08-09 04:26:05', 0),
(25, '::1', 'lana', NULL, '2023-08-09 04:26:12', 0),
(26, '::1', 'sasa@ontycake.id', 2, '2023-08-09 04:28:22', 1),
(27, '::1', 'lana', NULL, '2023-08-09 04:34:45', 0),
(28, '::1', 'lana', NULL, '2023-08-09 04:35:55', 0),
(29, '::1', 'lanaa', NULL, '2023-08-09 04:36:39', 0),
(30, '::1', 'lana', NULL, '2023-08-09 04:36:48', 0),
(31, '::1', 'sasa@ontycake.id', 2, '2023-08-09 04:37:12', 1),
(32, '::1', 'lana', NULL, '2023-08-09 07:55:15', 0),
(33, '::1', 'lana', NULL, '2023-08-09 07:55:32', 0),
(34, '::1', 'lana', NULL, '2023-08-09 07:55:53', 0),
(35, '::1', 'lana', NULL, '2023-08-09 07:57:22', 0),
(36, '::1', 'user', NULL, '2023-08-09 07:57:49', 0),
(37, '::1', 'user', NULL, '2023-08-09 07:58:02', 0),
(38, '::1', 'admin', NULL, '2023-08-09 07:58:25', 0),
(39, '::1', 'lana', NULL, '2023-08-09 07:58:33', 0),
(40, '::1', 'admin', NULL, '2023-08-09 07:58:45', 0),
(41, '::1', 'sasa@ontycake.id', 2, '2023-08-09 07:58:54', 1),
(42, '::1', 'sasa@ontycake.id', 2, '2023-08-10 01:52:01', 1),
(43, '::1', 'admin', NULL, '2023-08-13 07:22:21', 0),
(44, '::1', 'sasa@ontycake.id', 2, '2023-08-13 07:22:29', 1),
(45, '::1', 'sasa@ontycake.id', 2, '2023-08-14 02:51:05', 1),
(46, '::1', 'user', NULL, '2023-08-14 03:42:00', 0),
(47, '::1', 'user', NULL, '2023-08-14 03:42:08', 0),
(48, '::1', 'user', NULL, '2023-08-14 03:42:15', 0),
(49, '::1', 'user', NULL, '2023-08-14 03:42:24', 0),
(50, '::1', 'user', NULL, '2023-08-14 03:42:30', 0),
(51, '::1', 'user', NULL, '2023-08-14 03:42:39', 0),
(52, '::1', 'cek@gmail.com', 4, '2023-08-14 03:43:59', 1),
(53, '::1', 'user', NULL, '2023-08-14 03:44:52', 0),
(54, '::1', 'user', NULL, '2023-08-14 04:06:06', 0),
(55, '::1', 'cek@gmail.com', 4, '2023-08-14 04:06:14', 1),
(56, '::1', 'sasa@ontycake.id', 2, '2023-08-14 04:54:25', 1),
(57, '::1', 'cek@gmail.com', 4, '2023-08-15 05:45:36', 1),
(58, '::1', 'cek@gmail.com', 4, '2023-08-17 02:08:52', 1),
(59, '::1', 'cek@gmail.com', 4, '2023-08-19 06:29:22', 1),
(60, '::1', 'cek@gmail.com', 4, '2023-08-20 01:55:48', 1),
(61, '::1', 'sasa@ontycake.id', 2, '2023-08-20 03:22:16', 1),
(62, '::1', 'cek@gmail.com', 4, '2023-08-20 04:22:46', 1);

-- --------------------------------------------------------

--
-- Table structure for table `auth_permissions`
--

CREATE TABLE `auth_permissions` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `auth_permissions`
--

INSERT INTO `auth_permissions` (`id`, `name`, `description`) VALUES
(1, 'manage-sistem', 'Pengelola Sistem'),
(2, 'manage-profile', 'Pengelola Profil Pribadi');

-- --------------------------------------------------------

--
-- Table structure for table `auth_reset_attempts`
--

CREATE TABLE `auth_reset_attempts` (
  `id` int(11) UNSIGNED NOT NULL,
  `email` varchar(255) NOT NULL,
  `ip_address` varchar(255) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `token` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_tokens`
--

CREATE TABLE `auth_tokens` (
  `id` int(11) UNSIGNED NOT NULL,
  `selector` varchar(255) NOT NULL,
  `hashedValidator` varchar(255) NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `expires` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_users_permissions`
--

CREATE TABLE `auth_users_permissions` (
  `user_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `permission_id` int(11) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `version` varchar(255) NOT NULL,
  `class` varchar(255) NOT NULL,
  `group` varchar(255) NOT NULL,
  `namespace` varchar(255) NOT NULL,
  `time` int(11) NOT NULL,
  `batch` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `version`, `class`, `group`, `namespace`, `time`, `batch`) VALUES
(1, '2023-06-11-061804', 'App\\Database\\Migrations\\CreateAkun1', 'default', 'App', 1686464726, 1),
(4, '2023-06-15-065658', 'App\\Database\\Migrations\\CreateAkun2', 'default', 'App', 1686813073, 2),
(5, '2023-06-17-022251', 'App\\Database\\Migrations\\CreateAkun3', 'default', 'App', 1686968854, 3),
(6, '2023-06-18-030012', 'App\\Database\\Migrations\\CreateTransaksi', 'default', 'App', 1687057655, 4),
(7, '2023-06-18-032815', 'App\\Database\\Migrations\\CreateNilai', 'default', 'App', 1687067313, 5),
(8, '2023-06-20-043821', 'App\\Database\\Migrations\\CreateStatus', 'default', 'App', 1687236113, 6),
(15, '2023-06-21-064004', 'App\\Database\\Migrations\\CreatePenyesuaian', 'default', 'App', 1687830271, 7),
(16, '2023-06-21-064500', 'App\\Database\\Migrations\\CreateNilaiPenyesuaian', 'default', 'App', 1687830271, 7),
(18, '2017-11-20-223112', 'Myth\\Auth\\Database\\Migrations\\CreateAuthTables', 'default', 'Myth\\Auth', 1687830726, 8);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_nilai`
--

CREATE TABLE `tbl_nilai` (
  `id_nilai` int(5) UNSIGNED NOT NULL,
  `id_transaksi` int(5) UNSIGNED NOT NULL,
  `kode_akun3` int(6) UNSIGNED NOT NULL,
  `debit` float UNSIGNED NOT NULL,
  `kredit` float UNSIGNED NOT NULL,
  `id_status` int(5) UNSIGNED NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tbl_nilai`
--

INSERT INTO `tbl_nilai` (`id_nilai`, `id_transaksi`, `kode_akun3`, `debit`, `kredit`, `id_status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(6, 10, 1101, 30000000, 0, 3, '2023-06-21 06:31:48', '2023-06-28 03:11:50', NULL),
(7, 10, 1201, 3000000, 0, 5, '2023-06-21 06:31:48', '2023-06-28 03:11:50', NULL),
(8, 10, 3101, 35000000, 0, 5, '2023-06-21 06:31:48', '2023-06-28 03:11:50', NULL),
(9, 11, 5106, 0, 1500000, 2, '2023-06-28 01:35:08', '2023-06-28 05:05:49', NULL),
(10, 12, 5108, 0, 5000000, 5, '2023-06-28 03:18:28', '2023-06-28 05:06:08', NULL),
(11, 13, 4102, 2000000, 0, 1, '2023-06-28 03:20:05', '2023-06-28 05:06:22', NULL),
(12, 14, 5103, 0, 4200000, 5, '2023-06-28 03:26:14', '2023-06-28 05:06:40', NULL),
(13, 15, 1101, 75000, 0, 1, '2023-08-09 04:57:41', '2023-08-09 04:57:41', NULL),
(14, 15, 1105, 0, 75000, 2, '2023-08-09 04:57:41', '2023-08-09 04:57:41', NULL),
(15, 16, 1101, 2000000, 0, 1, '2023-08-19 08:19:36', '2023-08-19 08:19:36', NULL),
(16, 16, 1102, 0, 2000000, 2, '2023-08-19 08:19:36', '2023-08-19 08:19:36', NULL),
(17, 17, 3101, 3000000, 0, 1, '2023-08-20 04:07:26', '2023-08-20 04:07:26', NULL),
(18, 17, 2102, 0, 30000000, 2, '2023-08-20 04:07:26', '2023-08-20 04:07:26', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_nilaipenyesuaian`
--

CREATE TABLE `tbl_nilaipenyesuaian` (
  `id` int(5) UNSIGNED NOT NULL,
  `id_penyesuaian` int(5) UNSIGNED NOT NULL,
  `kode_akun3` int(6) UNSIGNED NOT NULL,
  `debit` float UNSIGNED NOT NULL,
  `kredit` float UNSIGNED NOT NULL,
  `id_status` int(5) UNSIGNED NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tbl_nilaipenyesuaian`
--

INSERT INTO `tbl_nilaipenyesuaian` (`id`, `id_penyesuaian`, `kode_akun3`, `debit`, `kredit`, `id_status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 5106, 2500000, 0, 5, '2023-06-28 05:51:00', '2023-06-28 05:51:00', NULL),
(2, 1, 1103, 0, 2500000, 5, '2023-06-28 05:51:00', '2023-06-28 05:51:00', NULL),
(3, 2, 5103, 350000, 0, 5, '2023-06-28 05:53:04', '2023-06-28 05:53:04', NULL),
(4, 3, 5107, 0, 600000, 5, '2023-06-28 05:55:29', '2023-06-28 05:55:29', NULL),
(5, 4, 1201, 50000, 0, 1, '2023-08-20 05:23:22', '2023-08-20 05:23:22', NULL),
(6, 4, 1202, 0, 50000, 2, '2023-08-20 05:23:22', '2023-08-20 05:23:22', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_penyesuaian`
--

CREATE TABLE `tbl_penyesuaian` (
  `id_penyesuaian` int(5) UNSIGNED NOT NULL,
  `tanggal` date DEFAULT NULL,
  `deskripsi` text NOT NULL,
  `nilai` float NOT NULL,
  `waktu` int(12) NOT NULL,
  `jumlah` float NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tbl_penyesuaian`
--

INSERT INTO `tbl_penyesuaian` (`id_penyesuaian`, `tanggal`, `deskripsi`, `nilai`, `waktu`, `jumlah`, `user_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '2023-01-02', 'Sewa Gedung dibayar 2 desember', 15000000, 6, 2500000, 2, NULL, NULL, NULL),
(2, '2023-01-05', 'Asuransi untuk 1 tahun dibayar 5 desember', 4200000, 12, 350000, 2, NULL, NULL, NULL),
(3, '2023-01-07', 'Penyusustan Peralatan kantor pertahun', 7200000, 12, 600000, 4, NULL, NULL, NULL),
(4, '2023-08-19', 'cek', 10000000, 200, 50000, 4, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_status`
--

CREATE TABLE `tbl_status` (
  `id_status` int(6) UNSIGNED NOT NULL,
  `status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tbl_status`
--

INSERT INTO `tbl_status` (`id_status`, `status`) VALUES
(1, 'Penerimaan'),
(2, 'Pengeluaran'),
(3, 'Investasi Masuk'),
(4, 'Investasi Keluar'),
(5, 'Normal');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_transaksi`
--

CREATE TABLE `tbl_transaksi` (
  `id_transaksi` int(5) UNSIGNED NOT NULL,
  `kwitansi` varchar(4) NOT NULL,
  `tanggal` date DEFAULT NULL,
  `deskripsi` text NOT NULL,
  `ketjurnal` varchar(100) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tbl_transaksi`
--

INSERT INTO `tbl_transaksi` (`id_transaksi`, `kwitansi`, `tanggal`, `deskripsi`, `ketjurnal`, `user_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(10, '0001', '2023-01-01', 'Setoran modal', 'Tanggal 1 Januari : Setoran modal bagi perusahaan ini', 2, NULL, NULL, NULL),
(11, '0002', '2023-01-02', 'Bayar Sewa', 'Tanggal 2 Januari : Membayar sewa gedung untuk 6 bulan', 2, NULL, NULL, NULL),
(12, '0003', '2023-03-03', 'Kredit Alat Kantor', 'Tanggal 3 Januari: Membeli Peralatan kantor secara kredit dari toko sempurna', 2, NULL, NULL, NULL),
(13, '0004', '2023-01-03', 'Uang Muka', 'Tanggal 3 Januari: Menerima Uang muka dari klien', 4, NULL, NULL, NULL),
(14, '0005', '2023-01-05', 'Bayar Asuransi', 'Tanggal 5 Januari: Membayar premi asuransi untuk kekayaan dan kecelakaan', 4, NULL, NULL, NULL),
(15, '0006', '2023-08-01', 'Penjualan barang display', 'jurnal aktiva lancar', 4, NULL, NULL, NULL),
(16, '0007', '2023-08-16', 'cek', 'cek', 4, NULL, NULL, NULL),
(17, '0008', '2023-08-18', 'cek', 'login', 2, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `email` varchar(255) NOT NULL,
  `username` varchar(30) DEFAULT NULL,
  `fullname` varchar(100) DEFAULT NULL,
  `gbr` varchar(255) NOT NULL DEFAULT 'default.png',
  `password_hash` varchar(255) NOT NULL,
  `reset_hash` varchar(255) DEFAULT NULL,
  `reset_at` datetime DEFAULT NULL,
  `reset_expires` datetime DEFAULT NULL,
  `activate_hash` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `status_message` varchar(255) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 0,
  `force_pass_reset` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `username`, `fullname`, `gbr`, `password_hash`, `reset_hash`, `reset_at`, `reset_expires`, `activate_hash`, `status`, `status_message`, `active`, `force_pass_reset`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'lana@ontycake.id', 'lana', 'Moch Muslih Maulana', 'default.png', 'admin123', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, '2023-06-27 01:53:43', '2023-06-27 01:53:43', NULL),
(2, 'sasa@ontycake.id', 'admin', 'Sarah Safrina Putri', 'default.png', '$2y$10$CR1GYnCJ/jORfzGT5qhzrOnDyQWXEQ8sC9rYJzpkWKIOrtHDgA/CC', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, '2023-06-27 01:54:08', '2023-06-27 01:54:08', NULL),
(3, 'ontycake.id@gmail.com', 'user', NULL, 'default.png', 'akuntan123', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, '2023-06-27 04:06:57', '2023-06-27 04:06:57', NULL),
(4, 'cek@gmail.com', 'user2', 'User Kedua', 'default.png', '$2y$10$6wZjVP9Hnm3k5R0stSFkR.hl/PGnU95zu56zuEGdZaDJ8k9kQKOre', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, '2023-08-14 03:43:51', '2023-08-14 03:43:51', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `akun1s`
--
ALTER TABLE `akun1s`
  ADD PRIMARY KEY (`id_akun1`);

--
-- Indexes for table `akun2s`
--
ALTER TABLE `akun2s`
  ADD PRIMARY KEY (`id_akun2`),
  ADD KEY `akun2s_kode_akun1_foreign` (`kode_akun1`);

--
-- Indexes for table `akun3s`
--
ALTER TABLE `akun3s`
  ADD PRIMARY KEY (`id_akun3`),
  ADD KEY `akun3s_kode_akun1_foreign` (`kode_akun1`);

--
-- Indexes for table `auth_activation_attempts`
--
ALTER TABLE `auth_activation_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `auth_groups`
--
ALTER TABLE `auth_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `auth_groups_permissions`
--
ALTER TABLE `auth_groups_permissions`
  ADD KEY `auth_groups_permissions_permission_id_foreign` (`permission_id`),
  ADD KEY `group_id_permission_id` (`group_id`,`permission_id`);

--
-- Indexes for table `auth_groups_users`
--
ALTER TABLE `auth_groups_users`
  ADD KEY `auth_groups_users_user_id_foreign` (`user_id`),
  ADD KEY `group_id_user_id` (`group_id`,`user_id`);

--
-- Indexes for table `auth_logins`
--
ALTER TABLE `auth_logins`
  ADD PRIMARY KEY (`id`),
  ADD KEY `email` (`email`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `auth_permissions`
--
ALTER TABLE `auth_permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `auth_reset_attempts`
--
ALTER TABLE `auth_reset_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `auth_tokens`
--
ALTER TABLE `auth_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `auth_tokens_user_id_foreign` (`user_id`),
  ADD KEY `selector` (`selector`);

--
-- Indexes for table `auth_users_permissions`
--
ALTER TABLE `auth_users_permissions`
  ADD KEY `auth_users_permissions_permission_id_foreign` (`permission_id`),
  ADD KEY `user_id_permission_id` (`user_id`,`permission_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_nilai`
--
ALTER TABLE `tbl_nilai`
  ADD PRIMARY KEY (`id_nilai`),
  ADD KEY `tbl_nilai_id_transaksi_foreign` (`id_transaksi`);

--
-- Indexes for table `tbl_nilaipenyesuaian`
--
ALTER TABLE `tbl_nilaipenyesuaian`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tbl_nilaipenyesuaian_id_penyesuaian_foreign` (`id_penyesuaian`);

--
-- Indexes for table `tbl_penyesuaian`
--
ALTER TABLE `tbl_penyesuaian`
  ADD PRIMARY KEY (`id_penyesuaian`);

--
-- Indexes for table `tbl_status`
--
ALTER TABLE `tbl_status`
  ADD PRIMARY KEY (`id_status`);

--
-- Indexes for table `tbl_transaksi`
--
ALTER TABLE `tbl_transaksi`
  ADD PRIMARY KEY (`id_transaksi`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `akun1s`
--
ALTER TABLE `akun1s`
  MODIFY `id_akun1` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `akun2s`
--
ALTER TABLE `akun2s`
  MODIFY `id_akun2` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `akun3s`
--
ALTER TABLE `akun3s`
  MODIFY `id_akun3` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `auth_activation_attempts`
--
ALTER TABLE `auth_activation_attempts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_groups`
--
ALTER TABLE `auth_groups`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `auth_logins`
--
ALTER TABLE `auth_logins`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `auth_permissions`
--
ALTER TABLE `auth_permissions`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `auth_reset_attempts`
--
ALTER TABLE `auth_reset_attempts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_tokens`
--
ALTER TABLE `auth_tokens`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `tbl_nilai`
--
ALTER TABLE `tbl_nilai`
  MODIFY `id_nilai` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `tbl_nilaipenyesuaian`
--
ALTER TABLE `tbl_nilaipenyesuaian`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tbl_penyesuaian`
--
ALTER TABLE `tbl_penyesuaian`
  MODIFY `id_penyesuaian` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_status`
--
ALTER TABLE `tbl_status`
  MODIFY `id_status` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_transaksi`
--
ALTER TABLE `tbl_transaksi`
  MODIFY `id_transaksi` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `akun2s`
--
ALTER TABLE `akun2s`
  ADD CONSTRAINT `akun2s_kode_akun1_foreign` FOREIGN KEY (`kode_akun1`) REFERENCES `akun1s` (`id_akun1`);

--
-- Constraints for table `akun3s`
--
ALTER TABLE `akun3s`
  ADD CONSTRAINT `akun3s_kode_akun1_foreign` FOREIGN KEY (`kode_akun1`) REFERENCES `akun1s` (`id_akun1`);

--
-- Constraints for table `auth_groups_permissions`
--
ALTER TABLE `auth_groups_permissions`
  ADD CONSTRAINT `auth_groups_permissions_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `auth_groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `auth_groups_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `auth_permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `auth_groups_users`
--
ALTER TABLE `auth_groups_users`
  ADD CONSTRAINT `auth_groups_users_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `auth_groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `auth_groups_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `auth_tokens`
--
ALTER TABLE `auth_tokens`
  ADD CONSTRAINT `auth_tokens_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `auth_users_permissions`
--
ALTER TABLE `auth_users_permissions`
  ADD CONSTRAINT `auth_users_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `auth_permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `auth_users_permissions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tbl_nilai`
--
ALTER TABLE `tbl_nilai`
  ADD CONSTRAINT `tbl_nilai_id_transaksi_foreign` FOREIGN KEY (`id_transaksi`) REFERENCES `tbl_transaksi` (`id_transaksi`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_nilaipenyesuaian`
--
ALTER TABLE `tbl_nilaipenyesuaian`
  ADD CONSTRAINT `tbl_nilaipenyesuaian_id_penyesuaian_foreign` FOREIGN KEY (`id_penyesuaian`) REFERENCES `tbl_penyesuaian` (`id_penyesuaian`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
