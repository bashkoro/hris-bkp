-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Sep 30, 2025 at 05:15 AM
-- Server version: 10.11.13-MariaDB-0ubuntu0.24.04.1
-- PHP Version: 8.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dukungan`
--

-- --------------------------------------------------------

--
-- Table structure for table `aaa`
--

CREATE TABLE `aaa` (
  `id` int(11) NOT NULL,
  `content` text DEFAULT NULL,
  `create_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `app`
--

CREATE TABLE `app` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `status` int(1) NOT NULL DEFAULT 1,
  `path` varchar(250) NOT NULL,
  `icon` varchar(250) NOT NULL DEFAULT 'app.png',
  `description` text DEFAULT NULL,
  `last_change` datetime NOT NULL DEFAULT current_timestamp(),
  `user_id` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `app_2fa`
--

CREATE TABLE `app_2fa` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `service_name` varchar(150) NOT NULL,
  `secret` varchar(150) NOT NULL,
  `path_url` varchar(350) DEFAULT NULL,
  `path_qr` varchar(350) DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT 0,
  `kanggo` int(1) NOT NULL DEFAULT 0,
  `create_at` datetime DEFAULT NULL,
  `update_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `app_access`
--

CREATE TABLE `app_access` (
  `id` int(11) NOT NULL,
  `key` varchar(350) NOT NULL,
  `token` varchar(350) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `created_time` datetime DEFAULT NULL,
  `expired_time` datetime DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT 1,
  `device` varchar(100) DEFAULT NULL,
  `ip_address` varchar(16) DEFAULT NULL,
  `headers` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `app_files`
--

CREATE TABLE `app_files` (
  `id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `client_name` varchar(350) NOT NULL,
  `temp_name` varchar(250) NOT NULL,
  `mime_type` varchar(250) NOT NULL,
  `extention` varchar(50) NOT NULL,
  `size` float NOT NULL DEFAULT 0,
  `path` varchar(350) NOT NULL,
  `status` int(1) NOT NULL DEFAULT 1,
  `last_change` datetime NOT NULL DEFAULT current_timestamp(),
  `user_id` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `app_keys`
--

CREATE TABLE `app_keys` (
  `id` int(11) NOT NULL,
  `key` varchar(550) NOT NULL,
  `address` varchar(16) NOT NULL,
  `description` tinytext DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT 1,
  `last_change` datetime NOT NULL DEFAULT current_timestamp(),
  `user_id` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `app_logs`
--

CREATE TABLE `app_logs` (
  `id` int(11) NOT NULL,
  `user` int(11) DEFAULT NULL,
  `date_time` datetime DEFAULT NULL,
  `ipaddress` varchar(20) DEFAULT NULL,
  `url` tinytext DEFAULT NULL,
  `method` varchar(15) DEFAULT NULL,
  `headers` text DEFAULT NULL,
  `data` text DEFAULT NULL,
  `message` text DEFAULT NULL,
  `reff` varchar(100) DEFAULT NULL,
  `reff_id` int(11) DEFAULT NULL,
  `api_key` text DEFAULT NULL,
  `token` text DEFAULT NULL,
  `module` int(11) NOT NULL DEFAULT 0,
  `flag1` tinytext DEFAULT NULL,
  `flag2` tinytext DEFAULT NULL,
  `flag3` tinytext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `app_modules`
--

CREATE TABLE `app_modules` (
  `id_app` int(11) NOT NULL,
  `id_parent` int(11) NOT NULL DEFAULT 0,
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `status` int(1) NOT NULL DEFAULT 1,
  `description` varchar(200) DEFAULT NULL,
  `last_change` datetime NOT NULL DEFAULT current_timestamp(),
  `user_id` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `app_options`
--

CREATE TABLE `app_options` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `value` text NOT NULL,
  `status` int(1) NOT NULL DEFAULT 1,
  `description` varchar(200) DEFAULT NULL,
  `last_change` datetime NOT NULL DEFAULT current_timestamp(),
  `user_id` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `app_options_users`
--

CREATE TABLE `app_options_users` (
  `id_user` int(11) NOT NULL,
  `toptp` int(1) NOT NULL DEFAULT 0,
  `email` int(1) NOT NULL DEFAULT 0,
  `app` int(1) NOT NULL DEFAULT 0,
  `theme` int(1) NOT NULL DEFAULT 0,
  `theme_dark` int(1) NOT NULL DEFAULT 0,
  `create_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `app_referensi`
--

CREATE TABLE `app_referensi` (
  `id` int(11) NOT NULL,
  `ref` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ref_code` int(11) NOT NULL,
  `ref_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ref_description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ref_status` int(1) NOT NULL DEFAULT 1,
  `last_change` datetime NOT NULL DEFAULT current_timestamp(),
  `user_id` int(11) NOT NULL DEFAULT 0,
  `ref_value` varchar(11) DEFAULT NULL,
  `flag1` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `app_roles`
--

CREATE TABLE `app_roles` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `status` int(1) NOT NULL DEFAULT 1,
  `description` varchar(200) DEFAULT NULL,
  `last_change` datetime NOT NULL DEFAULT current_timestamp(),
  `user_id` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `app_roles_bac`
--

CREATE TABLE `app_roles_bac` (
  `id_role` int(11) NOT NULL,
  `id_app` int(11) NOT NULL,
  `id_module` int(11) NOT NULL,
  `last_change` datetime NOT NULL DEFAULT current_timestamp(),
  `user_id` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `app_users`
--

CREATE TABLE `app_users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `email` varchar(120) NOT NULL,
  `status` int(1) NOT NULL DEFAULT 1,
  `activation_key` varchar(250) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `logs` longtext DEFAULT NULL,
  `last_change` datetime NOT NULL DEFAULT current_timestamp(),
  `user_id` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `app_users_roles`
--

CREATE TABLE `app_users_roles` (
  `id_user` int(11) NOT NULL,
  `id_role` int(11) NOT NULL,
  `last_change` datetime NOT NULL DEFAULT current_timestamp(),
  `user_id` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bukti_potong_pajak`
--

CREATE TABLE `bukti_potong_pajak` (
  `id` int(11) NOT NULL,
  `pegawai_id` int(11) DEFAULT NULL,
  `periode` year(4) DEFAULT NULL,
  `file_id` int(11) DEFAULT NULL,
  `file_path` varchar(350) DEFAULT NULL,
  `create_at` datetime DEFAULT current_timestamp(),
  `status` int(1) DEFAULT 1,
  `user_id` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cuti`
--

CREATE TABLE `cuti` (
  `id` int(11) NOT NULL,
  `pegawai_id` int(11) NOT NULL,
  `jabatan_id` int(11) NOT NULL DEFAULT 0,
  `unit_kerja_id` int(11) NOT NULL DEFAULT 0,
  `jenis_cuti` varchar(10) DEFAULT NULL,
  `keterangan` text NOT NULL,
  `alamat` text DEFAULT NULL,
  `telpon` varchar(50) DEFAULT NULL,
  `status` int(2) NOT NULL DEFAULT 1,
  `path` text DEFAULT NULL,
  `lampiran` text DEFAULT NULL,
  `create_by` int(11) DEFAULT 0,
  `create_at` datetime DEFAULT NULL,
  `nomor_surat` varchar(100) NOT NULL,
  `nomor` int(11) DEFAULT 0,
  `nomor_mundur` varchar(5) DEFAULT NULL,
  `instansi` varchar(10) DEFAULT NULL,
  `satker` varchar(10) DEFAULT NULL,
  `type` varchar(5) DEFAULT NULL,
  `hari` varchar(2) DEFAULT NULL,
  `bulan` varchar(2) DEFAULT NULL,
  `tahun` varchar(4) DEFAULT NULL,
  `tanggal_lengkap` date DEFAULT NULL,
  `flag1` varchar(50) DEFAULT NULL,
  `flag2` varchar(50) DEFAULT NULL,
  `perubahan_terakhir` text DEFAULT NULL,
  `unix_id` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cuti_approved`
--

CREATE TABLE `cuti_approved` (
  `id` int(11) NOT NULL,
  `pegawai_id` int(11) NOT NULL,
  `jabatan_id` int(11) NOT NULL,
  `unit_kerja_id` int(11) NOT NULL,
  `status` int(1) DEFAULT 1,
  `catatan` text DEFAULT NULL,
  `sent_time` datetime DEFAULT NULL,
  `read` int(1) DEFAULT 0,
  `read_time` datetime DEFAULT NULL,
  `respon` int(1) DEFAULT 0,
  `respon_time` datetime DEFAULT NULL,
  `path` text DEFAULT NULL,
  `tte` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cuti_detail`
--

CREATE TABLE `cuti_detail` (
  `id` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `ref_code` varchar(10) NOT NULL,
  `pegawai_id` int(11) NOT NULL,
  `catatan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cuti_proccess`
--

CREATE TABLE `cuti_proccess` (
  `id` int(11) NOT NULL,
  `pegawai_id` int(11) DEFAULT 0,
  `jabatan_id` int(11) DEFAULT 0,
  `unit_kerja_id` int(11) DEFAULT 0,
  `status` int(1) DEFAULT 1,
  `catatan` text DEFAULT NULL,
  `sent_time` datetime DEFAULT NULL,
  `read` int(1) DEFAULT 0,
  `read_time` datetime DEFAULT NULL,
  `respon` int(1) DEFAULT 0,
  `respon_time` datetime DEFAULT NULL,
  `path` text DEFAULT NULL,
  `tte` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cuti_saldo`
--

CREATE TABLE `cuti_saldo` (
  `id` int(11) NOT NULL,
  `pegawai_id` int(11) NOT NULL,
  `jabatan_id` int(11) NOT NULL,
  `unit_kerja_id` int(11) NOT NULL,
  `tahun` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `jatah` int(11) NOT NULL DEFAULT 0,
  `sisa_sebelumnya` int(11) NOT NULL DEFAULT 0,
  `total` int(11) NOT NULL DEFAULT 0,
  `digunakan` int(11) NOT NULL DEFAULT 0,
  `sisa_saat_ini` int(11) NOT NULL DEFAULT 0,
  `status` int(1) NOT NULL DEFAULT 1,
  `create_at` datetime DEFAULT NULL,
  `create_by` int(11) DEFAULT NULL,
  `update_at` datetime DEFAULT NULL,
  `update_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cuti_trace`
--

CREATE TABLE `cuti_trace` (
  `id` int(11) NOT NULL,
  `status` int(1) NOT NULL,
  `status_name` varchar(100) DEFAULT NULL,
  `proccess_at` datetime NOT NULL DEFAULT current_timestamp(),
  `proccess_by` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `logs_tte`
--

CREATE TABLE `logs_tte` (
  `id` int(11) NOT NULL,
  `app_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `ip_address` varchar(15) NOT NULL,
  `log_time` datetime NOT NULL,
  `message` text NOT NULL,
  `flag1` varchar(50) DEFAULT NULL,
  `flag2` varchar(50) DEFAULT NULL,
  `flag3` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ms_alamat`
--

CREATE TABLE `ms_alamat` (
  `pegawai_id` int(11) NOT NULL,
  `alamat_id` int(11) NOT NULL,
  `alamat_name` varchar(50) DEFAULT NULL,
  `kodepos` varchar(6) DEFAULT NULL,
  `provinsi` varchar(13) DEFAULT NULL,
  `kabupaten` varchar(13) DEFAULT NULL,
  `kecamatan` varchar(13) DEFAULT NULL,
  `kelurahan` varchar(13) DEFAULT NULL,
  `rw` varchar(5) DEFAULT NULL,
  `rt` varchar(5) DEFAULT NULL,
  `alamat` varchar(250) DEFAULT NULL,
  `long` varchar(50) DEFAULT NULL,
  `lat` varchar(50) DEFAULT NULL,
  `owner` varchar(10) NOT NULL DEFAULT 'pegawai',
  `last_change` datetime NOT NULL DEFAULT current_timestamp(),
  `user_id` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ms_area`
--

CREATE TABLE `ms_area` (
  `id` int(11) NOT NULL,
  `name` varchar(250) DEFAULT NULL,
  `latlong` varchar(250) DEFAULT NULL,
  `status` int(1) DEFAULT 1,
  `status_presensi` int(1) DEFAULT 0,
  `description` text DEFAULT NULL,
  `create_at` datetime DEFAULT current_timestamp(),
  `create_by` int(11) DEFAULT 0,
  `timezone` varchar(50) DEFAULT NULL,
  `range` int(11) NOT NULL DEFAULT 100
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ms_gugus_tugas`
--

CREATE TABLE `ms_gugus_tugas` (
  `id` int(11) NOT NULL,
  `gugustugas` varchar(100) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `last_chage` datetime NOT NULL DEFAULT current_timestamp(),
  `user_id` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ms_jabatan`
--

CREATE TABLE `ms_jabatan` (
  `jabatan_id` int(11) NOT NULL,
  `jabatan_name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `jabatan_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `jabatan_setara` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `jabatan_status` int(1) NOT NULL DEFAULT 1,
  `jabatan_slot` int(11) NOT NULL DEFAULT 0,
  `jabatan_slot_terpakai` int(11) NOT NULL DEFAULT 0,
  `jabatan_slot_kosong` int(11) NOT NULL DEFAULT 0,
  `last_change` datetime NOT NULL DEFAULT current_timestamp(),
  `user_id` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ms_perguruan_tinggi`
--

CREATE TABLE `ms_perguruan_tinggi` (
  `id_pt` int(11) NOT NULL,
  `nama_pt` varchar(350) DEFAULT NULL,
  `alamat_pt` varchar(350) DEFAULT NULL,
  `telp_pt` varchar(35) DEFAULT NULL,
  `kota_pt` varchar(100) DEFAULT NULL,
  `negara_pt` varchar(50) DEFAULT NULL,
  `last_change` datetime NOT NULL DEFAULT current_timestamp(),
  `user_id` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ms_tanggal_libur`
--

CREATE TABLE `ms_tanggal_libur` (
  `tanggal` date NOT NULL,
  `keterangan` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ms_unit_kerja`
--

CREATE TABLE `ms_unit_kerja` (
  `unit_kerja_id` int(11) NOT NULL,
  `unit_kerja_name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `unit_kerja_name_alt` varchar(25) DEFAULT NULL,
  `unit_kerja_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `unit_kerja_status` int(1) NOT NULL DEFAULT 1,
  `urutan` int(11) NOT NULL DEFAULT 0,
  `menu_link` int(1) NOT NULL DEFAULT 1,
  `last_change` datetime NOT NULL DEFAULT current_timestamp(),
  `user_id` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ms_wilayah`
--

CREATE TABLE `ms_wilayah` (
  `id` varchar(13) NOT NULL,
  `parent_id` varchar(13) DEFAULT '0',
  `name` varchar(100) DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pegawai`
--

CREATE TABLE `pegawai` (
  `pegawai_id` int(11) NOT NULL,
  `nik` varchar(45) NOT NULL,
  `nip` varchar(45) DEFAULT NULL,
  `npwp` varchar(25) DEFAULT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `tempat_lahir` varchar(50) DEFAULT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `kelamin` int(1) DEFAULT 1,
  `agama` int(11) DEFAULT NULL,
  `gelar_depan` varchar(50) DEFAULT NULL,
  `gelar_belakang` varchar(50) DEFAULT NULL,
  `unit_kerja_id` int(11) DEFAULT NULL,
  `jabatan_id` int(11) DEFAULT NULL,
  `status` int(1) DEFAULT 1,
  `status_perkawinan` int(11) DEFAULT NULL,
  `status_bpjs` int(1) DEFAULT 0,
  `status_lhkpn` int(1) DEFAULT 0,
  `status_jenis_pegawai` int(11) NOT NULL DEFAULT 0,
  `status_pns` int(11) NOT NULL DEFAULT 3,
  `asal_instansi` varchar(100) DEFAULT NULL,
  `nip_lama` varchar(45) DEFAULT NULL,
  `pangkat` varchar(45) DEFAULT NULL,
  `gol` varchar(45) DEFAULT NULL,
  `eselon` varchar(50) NOT NULL,
  `tmt_pang_gol` varchar(50) DEFAULT NULL,
  `pendidikan` int(11) DEFAULT NULL,
  `universitas` int(11) DEFAULT NULL,
  `email` varchar(120) DEFAULT NULL,
  `email_pribadi` varchar(120) DEFAULT NULL,
  `hp` varchar(20) DEFAULT NULL,
  `telp` varchar(20) DEFAULT NULL,
  `foto_pegawai` varchar(100) DEFAULT NULL,
  `foto_pegawai_temp` varchar(100) DEFAULT NULL,
  `kode_absen` varchar(10) DEFAULT NULL,
  `idcard1` varchar(5) DEFAULT NULL,
  `idcard2` varchar(5) DEFAULT NULL,
  `gugustugas` varchar(64) DEFAULT NULL,
  `bank_name` varchar(25) DEFAULT NULL,
  `bank_account` varchar(25) DEFAULT NULL,
  `bank_account_name` varchar(250) DEFAULT NULL,
  `bank_region` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pegawai_fasilitas`
--

CREATE TABLE `pegawai_fasilitas` (
  `pegawai_id` int(11) NOT NULL,
  `fasilitas_id` int(11) NOT NULL,
  `ref_fasilitas_id` int(11) NOT NULL,
  `fasilitas_tgl` date NOT NULL,
  `tgl_dikembalikan` date DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT 1,
  `fasilitas_value` varchar(250) NOT NULL,
  `fasilitas_ket` varchar(250) NOT NULL,
  `last_change` datetime NOT NULL DEFAULT current_timestamp(),
  `user_id` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pegawai_files`
--

CREATE TABLE `pegawai_files` (
  `pegawai_id` int(11) NOT NULL,
  `file_jenis` int(11) NOT NULL,
  `file_path` text NOT NULL,
  `file_id` int(11) NOT NULL,
  `last_change` datetime NOT NULL DEFAULT current_timestamp(),
  `user_id` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pegawai_hash_link`
--

CREATE TABLE `pegawai_hash_link` (
  `pegawai_id` int(11) NOT NULL,
  `url` varchar(250) DEFAULT NULL,
  `id_hash` varchar(250) NOT NULL,
  `qrcode` varchar(250) DEFAULT NULL,
  `last_change` datetime NOT NULL DEFAULT current_timestamp(),
  `user_id` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pegawai_hash_link_log`
--

CREATE TABLE `pegawai_hash_link_log` (
  `id` int(11) NOT NULL,
  `pegawai_id` int(11) NOT NULL,
  `data_old` text NOT NULL,
  `deskripsi` text NOT NULL,
  `last_change` datetime NOT NULL DEFAULT current_timestamp(),
  `user_id` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pegawai_sk`
--

CREATE TABLE `pegawai_sk` (
  `pegawai_id` int(11) NOT NULL,
  `unit_kerja_id` int(11) NOT NULL,
  `jabatan_id` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `jenis` int(11) NOT NULL,
  `nomor` varchar(50) NOT NULL,
  `tanggal` date NOT NULL,
  `periode_awal` date NOT NULL,
  `periode_akhir` date NOT NULL,
  `keterangan` text DEFAULT NULL,
  `dokumen` varchar(100) DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT 1,
  `last_change` datetime NOT NULL DEFAULT current_timestamp(),
  `user_id` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pegawai_sk_tim`
--

CREATE TABLE `pegawai_sk_tim` (
  `id_sk_tim` int(11) NOT NULL,
  `nomor_sk` varchar(50) NOT NULL,
  `tgl_sk` date NOT NULL,
  `tgl_awal` date NOT NULL,
  `tgl_akhir` date NOT NULL,
  `status_sk` int(11) NOT NULL DEFAULT 1,
  `keterangan` varchar(250) NOT NULL,
  `file` varchar(100) DEFAULT NULL,
  `last_change` datetime NOT NULL DEFAULT current_timestamp(),
  `user_id` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pegawai_sk_tim_detail`
--

CREATE TABLE `pegawai_sk_tim_detail` (
  `id` int(11) NOT NULL,
  `id_sk_tim` int(11) NOT NULL,
  `pegawai_id` int(11) NOT NULL,
  `jabatan_id` int(11) NOT NULL,
  `unit_kerja_id` int(11) NOT NULL,
  `status` int(1) NOT NULL DEFAULT 1,
  `source` int(1) NOT NULL DEFAULT 1,
  `last_change` datetime NOT NULL DEFAULT current_timestamp(),
  `user_id` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `presensi`
--

CREATE TABLE `presensi` (
  `id` int(11) NOT NULL,
  `pegawai_id` int(11) DEFAULT NULL,
  `jabatan_id` int(11) DEFAULT NULL,
  `unit_kerja_id` int(11) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `start` datetime DEFAULT NULL,
  `start_ip` varchar(20) DEFAULT NULL,
  `start_latlong` text DEFAULT NULL,
  `start_user` int(11) DEFAULT NULL,
  `start_catatan` text DEFAULT NULL,
  `start_log` varchar(50) DEFAULT NULL,
  `start_cam` varchar(50) DEFAULT NULL,
  `stop` datetime DEFAULT NULL,
  `stop_ip` varchar(20) DEFAULT NULL,
  `stop_latlong` text DEFAULT NULL,
  `stop_user` int(11) DEFAULT NULL,
  `stop_catatan` text DEFAULT NULL,
  `stop_log` varchar(50) DEFAULT NULL,
  `stop_cam` varchar(50) DEFAULT NULL,
  `total_jam` varchar(8) DEFAULT NULL,
  `status` int(1) DEFAULT 1,
  `pjk_id` int(11) NOT NULL DEFAULT 1,
  `kode_hari` varchar(7) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `presensi_final`
--

CREATE TABLE `presensi_final` (
  `pegawai_id` int(11) NOT NULL,
  `jabatan_id` int(11) DEFAULT NULL,
  `unit_kerja_id` int(11) DEFAULT NULL,
  `tanggal` date NOT NULL,
  `start` datetime DEFAULT NULL,
  `start_ip` varchar(20) DEFAULT NULL,
  `start_latlong` text DEFAULT NULL,
  `start_user` int(11) DEFAULT NULL,
  `start_catatan` text DEFAULT NULL,
  `start_log` varchar(50) DEFAULT NULL,
  `start_cam` varchar(50) DEFAULT NULL,
  `stop` datetime DEFAULT NULL,
  `stop_ip` varchar(20) DEFAULT NULL,
  `stop_latlong` text DEFAULT NULL,
  `stop_user` int(11) DEFAULT NULL,
  `stop_catatan` text DEFAULT NULL,
  `stop_log` varchar(50) DEFAULT NULL,
  `stop_cam` varchar(50) DEFAULT NULL,
  `status` int(1) DEFAULT 1,
  `pjk_id` int(11) NOT NULL DEFAULT 1,
  `kode_hari` varchar(7) DEFAULT NULL,
  `total_durasi` varchar(10) DEFAULT NULL,
  `total_durasi_kerja` varchar(10) DEFAULT NULL,
  `keterangan` varchar(100) DEFAULT NULL,
  `df_jam_masuk` time DEFAULT NULL,
  `df_jam_flexi` time DEFAULT NULL,
  `df_jam_pulang` time DEFAULT NULL,
  `df_durasi_absen` time DEFAULT NULL,
  `df_durasi_istirahat` time DEFAULT NULL,
  `df_durasi_kerja` time DEFAULT NULL,
  `df_durasi_flexi` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `presensi_final_test`
--

CREATE TABLE `presensi_final_test` (
  `pegawai_id` int(11) NOT NULL,
  `jabatan_id` int(11) DEFAULT NULL,
  `unit_kerja_id` int(11) DEFAULT NULL,
  `tanggal` date NOT NULL,
  `start` datetime DEFAULT NULL,
  `start_ip` varchar(20) DEFAULT NULL,
  `start_latlong` text DEFAULT NULL,
  `start_user` int(11) DEFAULT NULL,
  `start_catatan` text DEFAULT NULL,
  `start_log` varchar(50) DEFAULT NULL,
  `start_cam` varchar(50) DEFAULT NULL,
  `stop` datetime DEFAULT NULL,
  `stop_ip` varchar(20) DEFAULT NULL,
  `stop_latlong` text DEFAULT NULL,
  `stop_user` int(11) DEFAULT NULL,
  `stop_catatan` text DEFAULT NULL,
  `stop_log` varchar(50) DEFAULT NULL,
  `stop_cam` varchar(50) DEFAULT NULL,
  `status` int(1) DEFAULT 1,
  `pjk_id` int(11) NOT NULL DEFAULT 1,
  `kode_hari` varchar(7) DEFAULT NULL,
  `total_durasi` varchar(10) DEFAULT NULL,
  `total_durasi_kerja` varchar(10) DEFAULT NULL,
  `keterangan` varchar(100) DEFAULT NULL,
  `df_jam_masuk` time DEFAULT NULL,
  `df_jam_flexi` time DEFAULT NULL,
  `df_jam_pulang` time DEFAULT NULL,
  `df_durasi_absen` time DEFAULT NULL,
  `df_durasi_istirahat` time DEFAULT NULL,
  `df_durasi_kerja` time DEFAULT NULL,
  `df_durasi_flexi` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `presensi_flexi`
--

CREATE TABLE `presensi_flexi` (
  `pegawai_id` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `durasi` time DEFAULT NULL,
  `keterangan` text DEFAULT NULL,
  `flag1` varchar(100) DEFAULT NULL,
  `flag2` varchar(100) DEFAULT NULL,
  `flag3` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `presensi_jam_kerja`
--

CREATE TABLE `presensi_jam_kerja` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `perhitungan` int(1) NOT NULL DEFAULT 1,
  `status` int(1) DEFAULT 1,
  `hari_libur` varchar(100) DEFAULT NULL,
  `total_jam` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `presensi_jam_kerja_detail`
--

CREATE TABLE `presensi_jam_kerja_detail` (
  `pjk_id` int(11) NOT NULL,
  `kode_hari` varchar(7) NOT NULL,
  `jam_masuk` time DEFAULT NULL,
  `jam_pulang` time DEFAULT NULL,
  `jam_istirahat_mulai` time DEFAULT NULL,
  `jam_istirahat_selesai` time DEFAULT NULL,
  `durasi_absen` time DEFAULT NULL,
  `durasi_istirahat` time DEFAULT NULL,
  `durasi_kerja` time DEFAULT NULL,
  `durasi_flexi` varchar(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `presensi_laporan`
--

CREATE TABLE `presensi_laporan` (
  `id` int(11) NOT NULL,
  `pegawai_id` int(11) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `laporan` text DEFAULT NULL,
  `status` int(1) DEFAULT 1,
  `camera` varchar(100) DEFAULT NULL,
  `lampiran` varchar(100) DEFAULT NULL,
  `approved` int(1) NOT NULL DEFAULT 0,
  `create_at` datetime DEFAULT NULL,
  `create_by` int(11) DEFAULT NULL,
  `update_at` datetime DEFAULT NULL,
  `update_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `presensi_lock`
--

CREATE TABLE `presensi_lock` (
  `periode` varchar(7) NOT NULL,
  `lock` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `presensi_pelanggaran`
--

CREATE TABLE `presensi_pelanggaran` (
  `pegawai_id` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `id_reff` int(11) NOT NULL,
  `kode` text DEFAULT NULL,
  `keterangan` text DEFAULT NULL,
  `flag1` varchar(100) DEFAULT NULL,
  `flag2` varchar(100) DEFAULT NULL,
  `flag3` varchar(100) DEFAULT NULL,
  `flag4` varchar(50) DEFAULT NULL,
  `flag5` varchar(50) DEFAULT NULL,
  `flag6` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `presensi_pelanggaran_final`
--

CREATE TABLE `presensi_pelanggaran_final` (
  `pegawai_id` int(11) NOT NULL,
  `tanggal` varchar(7) NOT NULL,
  `id_reff` int(11) NOT NULL,
  `kode` varchar(50) NOT NULL,
  `keterangan` text DEFAULT NULL,
  `flag1` varchar(100) DEFAULT NULL,
  `flag2` varchar(100) DEFAULT NULL,
  `flag3` varchar(100) DEFAULT NULL COMMENT 'last change',
  `flag4` varchar(100) DEFAULT '0',
  `flag5` varchar(100) DEFAULT NULL,
  `flag6` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `skp_import`
--

CREATE TABLE `skp_import` (
  `NIKPPNPN` varchar(100) NOT NULL,
  `NMPPNPN` varchar(250) DEFAULT NULL,
  `NPWP` varchar(100) DEFAULT NULL,
  `STATUS` varchar(10) DEFAULT NULL,
  `NOMORSK` varchar(100) DEFAULT NULL,
  `TGLSK` date DEFAULT NULL,
  `PENGHASILAN` int(11) DEFAULT NULL,
  `PPH` int(11) DEFAULT NULL,
  `TUNJPPH` int(11) DEFAULT NULL,
  `IURAN` int(11) DEFAULT NULL,
  `IURANKEL` int(11) DEFAULT NULL,
  `JMLKEL` int(11) DEFAULT NULL,
  `STSPAJAK` varchar(10) DEFAULT NULL,
  `CURUT` int(11) DEFAULT NULL,
  `CKALI` int(11) DEFAULT NULL,
  `KDJNS` int(11) DEFAULT NULL,
  `NOREK` varchar(50) DEFAULT NULL,
  `NILTERIMA` int(11) DEFAULT NULL,
  `KDSATKER` varchar(10) DEFAULT NULL,
  `KDANAK` varchar(10) DEFAULT NULL,
  `KDDEPT` varchar(10) DEFAULT NULL,
  `KDUNIT` varchar(10) DEFAULT NULL,
  `NMSATKER` varchar(250) DEFAULT NULL,
  `NMANAK` varchar(250) DEFAULT NULL,
  `NMDEPT` varchar(250) DEFAULT NULL,
  `NMUNIT` varchar(250) DEFAULT NULL,
  `JMLPOTONGAN` int(11) DEFAULT NULL,
  `NMSATKERLAP` varchar(250) DEFAULT NULL,
  `NMANAKSATKERLAP` varchar(250) DEFAULT NULL,
  `NMDEPTLAP` varchar(250) DEFAULT NULL,
  `NMJABATANTTD` varchar(250) DEFAULT NULL,
  `KOTATTD` varchar(250) DEFAULT NULL,
  `KOTATTD1` varchar(250) DEFAULT NULL,
  `NIPTTD` varchar(100) DEFAULT NULL,
  `NAMATTD` varchar(250) DEFAULT NULL,
  `PERIODE` varchar(7) NOT NULL,
  `file` varchar(250) DEFAULT '0',
  `file_sign` int(1) DEFAULT 0,
  `unix_id` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `surat`
--

CREATE TABLE `surat` (
  `id` int(11) NOT NULL,
  `sumber_ext` int(1) NOT NULL DEFAULT 0,
  `sumber_bentuk` int(1) NOT NULL DEFAULT 0,
  `register_number` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `register_time` datetime DEFAULT NULL,
  `draf_for` int(1) DEFAULT 0,
  `draf_ref_id` int(11) DEFAULT 0,
  `draf_type` int(1) NOT NULL DEFAULT 0,
  `jenis` int(2) NOT NULL DEFAULT 0,
  `sifat` int(1) DEFAULT 0,
  `urgensi` int(1) DEFAULT 0,
  `nomor` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `hal` varchar(350) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status` int(11) DEFAULT 1,
  `signer_opt` int(1) DEFAULT 0,
  `signer_alt` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `signer_show` int(1) DEFAULT 0,
  `pengirim` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `pengirim_id` int(11) DEFAULT NULL,
  `pengirim_satker` int(11) DEFAULT NULL,
  `pengirim_jabatan` int(11) DEFAULT NULL,
  `pengirim_show` int(1) DEFAULT 0,
  `pengirim_alamat` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `penerima_sebagai` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `penerima_show` int(1) DEFAULT 3,
  `penerima_alamat` varchar(350) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `penerima_pada_lampiran` int(1) NOT NULL DEFAULT 0,
  `penerima_keterangan_lampiran` varchar(350) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `kka` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `sub_kka` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `sub_sub_kka` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `catatan` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `respon` int(1) NOT NULL DEFAULT 0,
  `no` int(11) DEFAULT 0,
  `no_mundur` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `no_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `no_instansi` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `no_reff` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `no_date` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `no_month` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `no_year` varbinary(4) DEFAULT NULL,
  `no_tanggal` date DEFAULT NULL,
  `no_status` int(1) NOT NULL DEFAULT 1,
  `contents` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `path` varchar(350) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `path_sign` varchar(350) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `path_sign_name` varchar(350) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `lampiran` varchar(350) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `create_by` int(11) DEFAULT NULL,
  `update_by` int(11) DEFAULT NULL,
  `update_at` datetime DEFAULT NULL,
  `last_change` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `unix_id` varchar(350) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `surat_in_tu`
--

CREATE TABLE `surat_in_tu` (
  `surat_id` int(11) NOT NULL,
  `catatan` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT 1,
  `create_at` datetime DEFAULT NULL,
  `create_by` int(11) NOT NULL DEFAULT 0,
  `sent` int(1) NOT NULL DEFAULT 0,
  `sent_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `surat_pelaksana`
--

CREATE TABLE `surat_pelaksana` (
  `surat_id` int(11) NOT NULL,
  `ref_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ref_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ref_id` int(11) NOT NULL,
  `pegawai_id` int(11) NOT NULL,
  `jabatan_id` int(11) NOT NULL,
  `unit_kerja_id` int(11) NOT NULL,
  `status` int(1) NOT NULL DEFAULT 1,
  `sent_time` datetime NOT NULL,
  `read` int(1) NOT NULL DEFAULT 0,
  `read_time` datetime NOT NULL,
  `respon` int(1) NOT NULL DEFAULT 0,
  `respon_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `surat_penerima`
--

CREATE TABLE `surat_penerima` (
  `surat_id` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `pegawai_id` int(11) NOT NULL,
  `jabatan_id` int(11) NOT NULL,
  `unit_kerja_id` int(11) NOT NULL,
  `view` int(1) NOT NULL DEFAULT 0,
  `catatan` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT 1,
  `sent` int(1) NOT NULL DEFAULT 0,
  `sent_time` datetime DEFAULT NULL,
  `read` int(1) NOT NULL DEFAULT 0,
  `read_time` datetime DEFAULT NULL,
  `respon` int(1) NOT NULL DEFAULT 0,
  `respon_time` datetime DEFAULT NULL,
  `asal` int(1) NOT NULL DEFAULT 1 COMMENT '1=internal,2=eksternal'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `surat_reviewer`
--

CREATE TABLE `surat_reviewer` (
  `surat_id` int(11) NOT NULL,
  `pegawai_id` int(11) NOT NULL,
  `jabatan_id` int(11) DEFAULT NULL,
  `unit_kerja_id` int(11) DEFAULT NULL,
  `status` int(1) DEFAULT 1,
  `catatan` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `review_status` int(1) NOT NULL DEFAULT 0,
  `review_time` datetime DEFAULT NULL,
  `review_id` int(11) NOT NULL,
  `pemohon_id` int(11) DEFAULT NULL,
  `pemohon_jabatan` int(11) DEFAULT NULL,
  `pemohon_unit` int(11) DEFAULT NULL,
  `pemohon_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `surat_signer`
--

CREATE TABLE `surat_signer` (
  `surat_id` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `pegawai_id` int(11) NOT NULL,
  `jabatan_id` int(11) NOT NULL,
  `unit_kerja_id` int(11) NOT NULL,
  `view` int(1) NOT NULL DEFAULT 0,
  `sebagai` varchar(10) DEFAULT NULL,
  `signer_status` int(1) NOT NULL DEFAULT 0,
  `signer_time` datetime DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT 1,
  `log_file` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `surat_tembusan`
--

CREATE TABLE `surat_tembusan` (
  `surat_id` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `pegawai_id` int(11) NOT NULL,
  `jabatan_id` int(11) NOT NULL,
  `unit_kerja_id` int(11) NOT NULL,
  `view` int(1) NOT NULL DEFAULT 0,
  `status` int(1) DEFAULT 1,
  `sent_time` datetime DEFAULT NULL,
  `read` int(1) NOT NULL DEFAULT 0,
  `read_time` datetime DEFAULT NULL,
  `respon` int(1) NOT NULL DEFAULT 0,
  `respon_time` datetime DEFAULT NULL,
  `asal` int(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `surat_tindaklanjut`
--

CREATE TABLE `surat_tindaklanjut` (
  `surat_id` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `ref_id` int(11) NOT NULL,
  `pengirim_id` int(11) DEFAULT NULL,
  `pengirim_jabatan` int(11) DEFAULT NULL,
  `pengirim_unit` int(11) DEFAULT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `catatan` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `tanggal` datetime DEFAULT NULL,
  `tanggal_akhir` datetime DEFAULT NULL,
  `sent_time` datetime DEFAULT NULL,
  `status` int(2) NOT NULL DEFAULT 0,
  `penerima_id` int(11) DEFAULT 0,
  `penerima_jabatan` int(11) DEFAULT 0,
  `penerima_unit` int(11) DEFAULT 0,
  `lampiran` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `read` int(1) NOT NULL DEFAULT 0,
  `read_time` datetime DEFAULT NULL,
  `respon` int(1) NOT NULL DEFAULT 0,
  `respon_time` datetime DEFAULT NULL,
  `create_at` datetime NOT NULL,
  `create_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `surat_tindaklanjut_feed`
--

CREATE TABLE `surat_tindaklanjut_feed` (
  `dispo_id` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `ref_id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `pegawai_id` int(11) NOT NULL,
  `jabatan_id` int(11) NOT NULL,
  `unit_kerja_id` int(11) NOT NULL,
  `create_at` datetime NOT NULL,
  `status` int(1) NOT NULL DEFAULT 1,
  `evidence` varchar(100) DEFAULT NULL,
  `lr` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `surat_trace`
--

CREATE TABLE `surat_trace` (
  `id` int(11) NOT NULL,
  `status` int(1) NOT NULL,
  `status_name` varchar(100) DEFAULT NULL,
  `proccess_at` datetime NOT NULL DEFAULT current_timestamp(),
  `proccess_by` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `temp_peg`
--

CREATE TABLE `temp_peg` (
  `id` int(11) NOT NULL,
  `nip` varchar(100) DEFAULT NULL,
  `nik` varchar(100) DEFAULT NULL,
  `npwp` varchar(100) DEFAULT NULL,
  `nama` varchar(250) DEFAULT NULL,
  `gelar` varchar(250) DEFAULT NULL,
  `t4_lahir` varchar(250) DEFAULT NULL,
  `tgl_lahir` varchar(50) DEFAULT NULL,
  `agama` varchar(50) DEFAULT NULL,
  `kelamin` varchar(50) DEFAULT NULL,
  `pendidikan` varchar(50) DEFAULT NULL,
  `kawin` varchar(100) DEFAULT NULL,
  `hp` varchar(100) DEFAULT NULL,
  `telp` varchar(100) DEFAULT NULL,
  `email_dinas` varchar(250) DEFAULT NULL,
  `email_pribadi` varchar(250) DEFAULT NULL,
  `status_kepeg` varchar(50) DEFAULT NULL,
  `jenis_kepeg` varchar(100) DEFAULT NULL,
  `unit_kerja` varchar(250) DEFAULT NULL,
  `jabatan` varchar(250) DEFAULT NULL,
  `eselon` varchar(250) DEFAULT NULL,
  `status_asn` varchar(50) DEFAULT NULL,
  `rek_name` varchar(250) DEFAULT NULL,
  `rek_number` varchar(100) DEFAULT NULL,
  `rek_bank` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Stand-in structure for view `user_base_access_controll`
-- (See below for the actual view)
--
CREATE TABLE `user_base_access_controll` (
`id_user` int(11)
,`username` varchar(100)
,`id_role` int(11)
,`name_role` varchar(100)
,`id_parent` int(11)
,`id_module` int(11)
,`name_module` varchar(201)
,`id_app` int(11)
,`name_app` varchar(100)
);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `aaa`
--
ALTER TABLE `aaa`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `app`
--
ALTER TABLE `app`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `app_2fa`
--
ALTER TABLE `app_2fa`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `app_access`
--
ALTER TABLE `app_access`
  ADD PRIMARY KEY (`id`),
  ADD KEY `key` (`key`,`token`,`user_id`);

--
-- Indexes for table `app_files`
--
ALTER TABLE `app_files`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `app_keys`
--
ALTER TABLE `app_keys`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`);

--
-- Indexes for table `app_logs`
--
ALTER TABLE `app_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `app_modules`
--
ALTER TABLE `app_modules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_app` (`id_app`);

--
-- Indexes for table `app_options`
--
ALTER TABLE `app_options`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `app_options_users`
--
ALTER TABLE `app_options_users`
  ADD PRIMARY KEY (`id_user`);

--
-- Indexes for table `app_referensi`
--
ALTER TABLE `app_referensi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ref` (`ref`,`ref_code`);

--
-- Indexes for table `app_roles`
--
ALTER TABLE `app_roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `app_roles_bac`
--
ALTER TABLE `app_roles_bac`
  ADD PRIMARY KEY (`id_role`,`id_app`,`id_module`),
  ADD KEY `app` (`id_app`),
  ADD KEY `module` (`id_module`);

--
-- Indexes for table `app_users`
--
ALTER TABLE `app_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`,`email`);

--
-- Indexes for table `app_users_roles`
--
ALTER TABLE `app_users_roles`
  ADD PRIMARY KEY (`id_user`,`id_role`),
  ADD KEY `role` (`id_role`);

--
-- Indexes for table `bukti_potong_pajak`
--
ALTER TABLE `bukti_potong_pajak`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cuti`
--
ALTER TABLE `cuti`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cuti_approved`
--
ALTER TABLE `cuti_approved`
  ADD PRIMARY KEY (`id`,`pegawai_id`);

--
-- Indexes for table `cuti_detail`
--
ALTER TABLE `cuti_detail`
  ADD PRIMARY KEY (`id`,`tanggal`,`ref_code`);

--
-- Indexes for table `cuti_proccess`
--
ALTER TABLE `cuti_proccess`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pegawai_id` (`pegawai_id`,`jabatan_id`,`unit_kerja_id`,`status`);

--
-- Indexes for table `cuti_saldo`
--
ALTER TABLE `cuti_saldo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pegawai_id` (`pegawai_id`,`jabatan_id`,`unit_kerja_id`,`tahun`);

--
-- Indexes for table `cuti_trace`
--
ALTER TABLE `cuti_trace`
  ADD PRIMARY KEY (`id`,`status`,`proccess_at`);

--
-- Indexes for table `logs_tte`
--
ALTER TABLE `logs_tte`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ms_alamat`
--
ALTER TABLE `ms_alamat`
  ADD PRIMARY KEY (`alamat_id`),
  ADD KEY `pegawai_id` (`pegawai_id`);

--
-- Indexes for table `ms_area`
--
ALTER TABLE `ms_area`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ms_gugus_tugas`
--
ALTER TABLE `ms_gugus_tugas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ms_jabatan`
--
ALTER TABLE `ms_jabatan`
  ADD PRIMARY KEY (`jabatan_id`);

--
-- Indexes for table `ms_perguruan_tinggi`
--
ALTER TABLE `ms_perguruan_tinggi`
  ADD PRIMARY KEY (`id_pt`);

--
-- Indexes for table `ms_tanggal_libur`
--
ALTER TABLE `ms_tanggal_libur`
  ADD PRIMARY KEY (`tanggal`);

--
-- Indexes for table `ms_unit_kerja`
--
ALTER TABLE `ms_unit_kerja`
  ADD PRIMARY KEY (`unit_kerja_id`);

--
-- Indexes for table `ms_wilayah`
--
ALTER TABLE `ms_wilayah`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent_id` (`parent_id`,`name`);

--
-- Indexes for table `pegawai`
--
ALTER TABLE `pegawai`
  ADD PRIMARY KEY (`pegawai_id`),
  ADD KEY `nik` (`nik`,`nip`,`nama`,`kelamin`,`agama`,`unit_kerja_id`,`jabatan_id`);

--
-- Indexes for table `pegawai_fasilitas`
--
ALTER TABLE `pegawai_fasilitas`
  ADD PRIMARY KEY (`fasilitas_id`),
  ADD KEY `pegawai_id` (`pegawai_id`,`ref_fasilitas_id`);

--
-- Indexes for table `pegawai_files`
--
ALTER TABLE `pegawai_files`
  ADD PRIMARY KEY (`pegawai_id`,`file_jenis`);

--
-- Indexes for table `pegawai_hash_link`
--
ALTER TABLE `pegawai_hash_link`
  ADD PRIMARY KEY (`pegawai_id`);

--
-- Indexes for table `pegawai_hash_link_log`
--
ALTER TABLE `pegawai_hash_link_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pegawai_id` (`pegawai_id`);

--
-- Indexes for table `pegawai_sk`
--
ALTER TABLE `pegawai_sk`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pegawai_id` (`pegawai_id`,`unit_kerja_id`,`jabatan_id`,`jenis`);

--
-- Indexes for table `pegawai_sk_tim`
--
ALTER TABLE `pegawai_sk_tim`
  ADD PRIMARY KEY (`id_sk_tim`);

--
-- Indexes for table `pegawai_sk_tim_detail`
--
ALTER TABLE `pegawai_sk_tim_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `presensi`
--
ALTER TABLE `presensi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `presensi_final`
--
ALTER TABLE `presensi_final`
  ADD PRIMARY KEY (`pegawai_id`,`tanggal`);

--
-- Indexes for table `presensi_final_test`
--
ALTER TABLE `presensi_final_test`
  ADD PRIMARY KEY (`pegawai_id`,`tanggal`);

--
-- Indexes for table `presensi_flexi`
--
ALTER TABLE `presensi_flexi`
  ADD PRIMARY KEY (`pegawai_id`,`tanggal`);

--
-- Indexes for table `presensi_jam_kerja`
--
ALTER TABLE `presensi_jam_kerja`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `presensi_jam_kerja_detail`
--
ALTER TABLE `presensi_jam_kerja_detail`
  ADD PRIMARY KEY (`pjk_id`,`kode_hari`);

--
-- Indexes for table `presensi_laporan`
--
ALTER TABLE `presensi_laporan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pegawai_id` (`pegawai_id`,`tanggal`);

--
-- Indexes for table `presensi_lock`
--
ALTER TABLE `presensi_lock`
  ADD PRIMARY KEY (`periode`);

--
-- Indexes for table `presensi_pelanggaran`
--
ALTER TABLE `presensi_pelanggaran`
  ADD PRIMARY KEY (`pegawai_id`,`tanggal`,`id_reff`);

--
-- Indexes for table `presensi_pelanggaran_final`
--
ALTER TABLE `presensi_pelanggaran_final`
  ADD PRIMARY KEY (`pegawai_id`,`tanggal`,`id_reff`,`kode`);

--
-- Indexes for table `skp_import`
--
ALTER TABLE `skp_import`
  ADD PRIMARY KEY (`NIKPPNPN`,`PERIODE`);

--
-- Indexes for table `surat`
--
ALTER TABLE `surat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `surat_in_tu`
--
ALTER TABLE `surat_in_tu`
  ADD PRIMARY KEY (`surat_id`);

--
-- Indexes for table `surat_pelaksana`
--
ALTER TABLE `surat_pelaksana`
  ADD PRIMARY KEY (`surat_id`,`ref_type`,`ref_name`,`ref_id`,`pegawai_id`);

--
-- Indexes for table `surat_penerima`
--
ALTER TABLE `surat_penerima`
  ADD PRIMARY KEY (`id`),
  ADD KEY `surat_id` (`surat_id`,`pegawai_id`,`jabatan_id`,`unit_kerja_id`);

--
-- Indexes for table `surat_reviewer`
--
ALTER TABLE `surat_reviewer`
  ADD PRIMARY KEY (`review_id`),
  ADD KEY `surat_id` (`surat_id`,`pegawai_id`);

--
-- Indexes for table `surat_signer`
--
ALTER TABLE `surat_signer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `surat_id` (`surat_id`,`pegawai_id`,`jabatan_id`,`unit_kerja_id`);

--
-- Indexes for table `surat_tembusan`
--
ALTER TABLE `surat_tembusan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `surat_id` (`surat_id`,`pegawai_id`,`jabatan_id`,`unit_kerja_id`);

--
-- Indexes for table `surat_tindaklanjut`
--
ALTER TABLE `surat_tindaklanjut`
  ADD PRIMARY KEY (`id`),
  ADD KEY `surat_id` (`surat_id`,`ref_id`,`pengirim_id`,`pengirim_jabatan`,`pengirim_unit`,`status`,`penerima_id`,`penerima_jabatan`,`penerima_unit`,`read`,`respon`);

--
-- Indexes for table `surat_tindaklanjut_feed`
--
ALTER TABLE `surat_tindaklanjut_feed`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dispo_id` (`dispo_id`,`ref_id`,`pegawai_id`,`jabatan_id`,`unit_kerja_id`);

--
-- Indexes for table `surat_trace`
--
ALTER TABLE `surat_trace`
  ADD PRIMARY KEY (`id`,`status`,`proccess_at`);

--
-- Indexes for table `temp_peg`
--
ALTER TABLE `temp_peg`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `aaa`
--
ALTER TABLE `aaa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `app`
--
ALTER TABLE `app`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `app_2fa`
--
ALTER TABLE `app_2fa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `app_access`
--
ALTER TABLE `app_access`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `app_files`
--
ALTER TABLE `app_files`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `app_keys`
--
ALTER TABLE `app_keys`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `app_logs`
--
ALTER TABLE `app_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `app_modules`
--
ALTER TABLE `app_modules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `app_options`
--
ALTER TABLE `app_options`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `app_referensi`
--
ALTER TABLE `app_referensi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `app_roles`
--
ALTER TABLE `app_roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `app_users`
--
ALTER TABLE `app_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bukti_potong_pajak`
--
ALTER TABLE `bukti_potong_pajak`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cuti`
--
ALTER TABLE `cuti`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cuti_saldo`
--
ALTER TABLE `cuti_saldo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `logs_tte`
--
ALTER TABLE `logs_tte`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ms_alamat`
--
ALTER TABLE `ms_alamat`
  MODIFY `alamat_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ms_area`
--
ALTER TABLE `ms_area`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ms_gugus_tugas`
--
ALTER TABLE `ms_gugus_tugas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ms_jabatan`
--
ALTER TABLE `ms_jabatan`
  MODIFY `jabatan_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ms_perguruan_tinggi`
--
ALTER TABLE `ms_perguruan_tinggi`
  MODIFY `id_pt` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ms_unit_kerja`
--
ALTER TABLE `ms_unit_kerja`
  MODIFY `unit_kerja_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pegawai`
--
ALTER TABLE `pegawai`
  MODIFY `pegawai_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pegawai_fasilitas`
--
ALTER TABLE `pegawai_fasilitas`
  MODIFY `fasilitas_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pegawai_hash_link_log`
--
ALTER TABLE `pegawai_hash_link_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pegawai_sk`
--
ALTER TABLE `pegawai_sk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pegawai_sk_tim`
--
ALTER TABLE `pegawai_sk_tim`
  MODIFY `id_sk_tim` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pegawai_sk_tim_detail`
--
ALTER TABLE `pegawai_sk_tim_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `presensi`
--
ALTER TABLE `presensi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `presensi_jam_kerja`
--
ALTER TABLE `presensi_jam_kerja`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `presensi_laporan`
--
ALTER TABLE `presensi_laporan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `surat`
--
ALTER TABLE `surat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `surat_penerima`
--
ALTER TABLE `surat_penerima`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `surat_reviewer`
--
ALTER TABLE `surat_reviewer`
  MODIFY `review_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `surat_signer`
--
ALTER TABLE `surat_signer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `surat_tembusan`
--
ALTER TABLE `surat_tembusan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `surat_tindaklanjut`
--
ALTER TABLE `surat_tindaklanjut`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `surat_tindaklanjut_feed`
--
ALTER TABLE `surat_tindaklanjut_feed`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `temp_peg`
--
ALTER TABLE `temp_peg`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

-- --------------------------------------------------------

--
-- Structure for view `user_base_access_controll`
--
DROP TABLE IF EXISTS `user_base_access_controll`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `user_base_access_controll`  AS SELECT `a`.`id_user` AS `id_user`, `b`.`username` AS `username`, `a`.`id_role` AS `id_role`, `c`.`name` AS `name_role`, `e`.`id_parent` AS `id_parent`, `d`.`id_module` AS `id_module`, CASE WHEN `e`.`id_parent` = 0 THEN `e`.`name` ELSE concat(`f`.`name`,'/',`e`.`name`) END AS `name_module`, `e`.`id_app` AS `id_app`, `g`.`name` AS `name_app` FROM ((((((`app_users_roles` `a` join `app_users` `b` on(`a`.`id_user` = `b`.`id`)) join `app_roles` `c` on(`a`.`id_role` = `c`.`id`)) join `app_roles_bac` `d` on(`a`.`id_role` = `d`.`id_role`)) join `app_modules` `e` on(`e`.`status` = 1 and `d`.`id_module` = `e`.`id`)) join `app` `g` on(`g`.`status` = 1 and `e`.`id_app` = `g`.`id`)) left join `app_modules` `f` on(`f`.`status` = 1 and `e`.`id_parent` = `f`.`id`)) ORDER BY `e`.`id_parent` ASC ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
