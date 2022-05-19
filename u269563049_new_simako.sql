-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: May 19, 2022 at 12:17 AM
-- Server version: 10.5.12-MariaDB-cll-lve
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `u269563049_new_simako`
--

-- --------------------------------------------------------

--
-- Table structure for table `idev`
--

CREATE TABLE `idev` (
  `id_idev` int(11) NOT NULL,
  `id_user` int(11) DEFAULT NULL,
  `id_atasan` int(11) DEFAULT NULL,
  `id_tk` int(11) DEFAULT NULL,
  `id_refrr` int(255) DEFAULT NULL,
  `skor_kemungkinan` int(11) DEFAULT NULL,
  `skor_dampak` int(11) DEFAULT NULL,
  `skor_resiko` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tb_daftar_pemkot`
--

CREATE TABLE `tb_daftar_pemkot` (
  `id` int(11) NOT NULL,
  `nama_pemkot` varchar(100) NOT NULL,
  `date_created` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_daftar_pemkot`
--

INSERT INTO `tb_daftar_pemkot` (`id`, `nama_pemkot`, `date_created`) VALUES
(1, 'Admin', '123456'),
(2, 'Pemerintah Kota Manado', '123456'),
(3, 'Pemerintah Kota Bitung', '123456');

-- --------------------------------------------------------

--
-- Table structure for table `tb_idev`
--

CREATE TABLE `tb_idev` (
  `id_idev` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_atasan` int(11) NOT NULL,
  `id_pemkot` int(11) NOT NULL,
  `id_tk` int(11) NOT NULL,
  `resiko` text NOT NULL,
  `sebab` text NOT NULL,
  `dampak` text NOT NULL,
  `n_kemungkinan` int(11) NOT NULL,
  `n_dampak` int(11) NOT NULL,
  `n_resiko` int(11) NOT NULL,
  `realisasi_resiko` text DEFAULT NULL,
  `realisasi_sebab` text DEFAULT NULL,
  `realisasi_dampak` text DEFAULT NULL,
  `realisasi_idev` int(1) DEFAULT NULL,
  `tahun_anggaran` year(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_idev`
--

INSERT INTO `tb_idev` (`id_idev`, `id_user`, `id_atasan`, `id_pemkot`, `id_tk`, `resiko`, `sebab`, `dampak`, `n_kemungkinan`, `n_dampak`, `n_resiko`, `realisasi_resiko`, `realisasi_sebab`, `realisasi_dampak`, `realisasi_idev`, `tahun_anggaran`) VALUES
(52, 16, 15, 2, 20, 'Terjadinya pembayaran yang tidak sesuai volume/spesifikasi pekerjaan\n', 'Kelalaian Pihak Penyedia\n', 'Kerugian keuangan daerah\n', 3, 3, 9, 'Tidak terjadi', 'Tidak terjadi', 'Tidak terjadi', 1, 2021),
(54, 16, 15, 2, 20, 'Terjadinya pekerjaan fiktif\n', 'Kelalaian PA/KPA/PPK \n', 'Kerugian keuangan daerah\n', 1, 3, 3, 'Terjadinya pekerjaan fiktif\r\n', 'Kelalaian PA/KPA/PPK \r\n', 'Kerugian keuangan daerah\r\n', 1, 2021);

-- --------------------------------------------------------

--
-- Table structure for table `tb_program`
--

CREATE TABLE `tb_program` (
  `id` int(11) NOT NULL,
  `id_pemkot` int(11) NOT NULL,
  `nama_program` text NOT NULL,
  `outcome_program` text NOT NULL,
  `realisasi_outcome_program` text DEFAULT NULL,
  `id_user` int(11) NOT NULL,
  `realisasi` int(1) DEFAULT NULL,
  `tahun_anggaran` year(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_program`
--

INSERT INTO `tb_program` (`id`, `id_pemkot`, `nama_program`, `outcome_program`, `realisasi_outcome_program`, `id_user`, `realisasi`, `tahun_anggaran`) VALUES
(1, 2, 'Program peningkatan pelayanan kesehatan dasar', 'terlaksananya vaksin', 'abcd', 15, 1, 2021);

-- --------------------------------------------------------

--
-- Table structure for table `tb_realisasi`
--

CREATE TABLE `tb_realisasi` (
  `id_realisasi` int(11) NOT NULL,
  `id_idev` int(11) NOT NULL,
  `kejadian` varchar(100) NOT NULL,
  `uraian` text NOT NULL,
  `waktu` text NOT NULL,
  `pj` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tb_realisasi_kegiatan`
--

CREATE TABLE `tb_realisasi_kegiatan` (
  `id` int(11) NOT NULL,
  `id_tk` int(11) NOT NULL,
  `real_output` text NOT NULL,
  `real_tujuan_kegiatan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tb_realisasi_program`
--

CREATE TABLE `tb_realisasi_program` (
  `id` int(11) NOT NULL,
  `id_program` int(11) NOT NULL,
  `real_outcome` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tb_realisasi_resiko`
--

CREATE TABLE `tb_realisasi_resiko` (
  `id` int(11) NOT NULL,
  `id_idev` int(11) NOT NULL,
  `real_resiko` text NOT NULL,
  `real_sebab` text NOT NULL,
  `real_dampak` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tb_realisasi_rtp`
--

CREATE TABLE `tb_realisasi_rtp` (
  `id` int(11) NOT NULL,
  `id_rtp` int(11) NOT NULL,
  `real_uraian` text NOT NULL,
  `real_target_waktu` text NOT NULL,
  `real_pj` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tb_ref_dampak`
--

CREATE TABLE `tb_ref_dampak` (
  `id_refd` int(11) NOT NULL,
  `id_sk` int(11) NOT NULL,
  `ref_dampak` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tb_ref_resiko`
--

CREATE TABLE `tb_ref_resiko` (
  `id_refrr` int(11) NOT NULL,
  `id_sk` int(100) NOT NULL,
  `resiko` text NOT NULL,
  `sebab` text NOT NULL,
  `dampak` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_ref_resiko`
--

INSERT INTO `tb_ref_resiko` (`id_refrr`, `id_sk`, `resiko`, `sebab`, `dampak`) VALUES
(40, 18, 'Penyusunan Anggaran Kebutuhan PBJ tidak wajar', 'Kelalaian PA dan Tim/personil Penyusun Rencana Kegiatan\n', 'Kerugian keuangan daerah\n'),
(41, 18, 'Rencana Pengadaan barang/jasa bukan berdasarkan kebutuhan/usulan pihak pengguna (user)\n', '', 'Barang/jasa yang diadakan tidak termanfaatkan secara optimal \n'),
(42, 18, 'Spesifikasi barang/jasa tidak sesuai kebutuhan user\n', 'Kelalaian PPK dan Tim Kerja PPK\n', ''),
(43, 18, 'HPS tidak didukung oleh dokumentasi penyusunan HPS yang memadai\n', '', 'Kegiatan terlambat dilaksanakan\n'),
(44, 18, 'HPS disusun terlalu tinggi/mark up\n', '', 'Terjadimya pemborosan keuangan daerah\n'),
(45, 18, 'HPS disusun terlalu rendah\n', '', 'Kegiatan tidak/terlambat terlaksana\n'),
(46, 18, 'Substansi dalam dokumen tender diarahkan untuk memenangkan calon penyedia tertentu\n', '', 'Terjadinya tuntutan kepada PPK/PA/Pemerintah Daerah\n'),
(47, 18, 'Adanya kelemahan/kesalahan dalam substansi kontrak yang merugikan pemerintah\n', '', '\n'),
(48, 18, 'Proses pemilihan penyedia tidak sesuai dengan ketentuan\n', 'Kelalaian Pokja Pemilihan atau Pejabat Pengadaan\n', 'Kerjadinya tuntutan kpd Perangkat/Pemerintah Daerah\n'),
(49, 18, 'Terjadinya persekongkolan dalam pemilihan penyedia\n', '\n', 'Kerugian keuangan daerah dan rusaknya nama baik Pemerintah Daerah\n'),
(50, 18, 'Terjadinya kegagalan proses pemilihan penyedia\n', 'Kelalaian Pokja Pemilihan atau Pejabat Pengadaan\n', 'Kegiatan tidak/terlambat terlaksana\n'),
(51, 18, 'Terjadinya pekerjaan fiktif\n', 'Kelalaian PA/KPA/PPK \n', 'Kerugian keuangan daerah dan rusaknya nama baik Pemerintah Daerah\n'),
(52, 18, 'Adanya kelemahan/kesalahan dalam substansi kontrak yang merugikan pemerintah\n', 'Kelalaian PPK dan Tim Kerja PPK\n', '\n'),
(53, 18, 'Pelaksanaan pekerjaan mendahului kontrak/penandatangan SPPBJ\n', 'Kelalaian PPK dan Pihak Penyedia\n', 'Kerugian keuangan daerah dan rusaknya nama baik Pemerintah Daerah\n'),
(54, 18, 'Pekerjaan bukan dilaksanakan oleh rekanan pemenang\n', '', 'Kualitas pekerjaan tidak sesuai spesifikasi dan terjadinya kerugian keuangan daerah\n'),
(55, 18, 'Keterlambatan penyelesaiaan pekerjaan\n', 'Kelalaian Pihak Penyedia\n', 'Pekerjaan terlambat diterima dan dimanfaatkan\n'),
(56, 18, 'Rekanan tidak mengerjakan sesuai spesifikasi yang ditetapkan dalam kontrak\n', '', 'Kualitas pekerjaan tidak sesuai spesifikasi dan terjadinya kerugian keuangan daerah\n'),
(57, 18, 'Terjadinya adendum pekerjaan yang tidak sesuai ketentuan\n', '', ''),
(58, 18, 'Terjadinya forcemajor\n', 'Bencana alam/sosial\n', ''),
(59, 18, 'Pihak penyedia melakukan wanprestasi\n', '', 'Pekerjaan tidak selesai dan kerugian keuangan daerah\n'),
(60, 18, 'Terjadinya pembayaran yang tidak sesuai volume/spesifikasi pekerjaan\n', '', ''),
(61, 18, 'Terjadinya denda keterlambatan yang tidak dipungut dan disetor ke kas negara/daerah\n', '', 'Terjadinya utang daerah kepada pemerintah pusat\n'),
(62, 18, 'Terjadinya kesalahan/penyimpangan dalam pengenaan pajak\n', 'Kelalaian Bendahara\n', ''),
(63, 18, 'Terjadinya pajak yang sudah dipungut/dipotong tapi tidak/belum disetor\n', '', ''),
(64, 18, 'Terdapat BMD hasil pengadaan yang belum diserahterimakan oleh PPK kepada PA \n', '', 'Nilai aset dalam pembukuan menjadi tidak akurat dan berpotensi menjadi temuan BPK\n'),
(65, 18, 'Terjadinya hak2 penyedia yang tidak dipenuhi oleh PPK/PA/Perangkat Daerah\n', 'Kelalaian PA/KPA/PPK\n', 'Terjadinya tuntutan kepada PPK/PA/Pemerintah Daerah\n'),
(66, 0, '', 'Kelalaian PPK dan Tim Kerja PPK\n', 'Kerugian keuangan daerah\n');

-- --------------------------------------------------------

--
-- Table structure for table `tb_ref_risk`
--

CREATE TABLE `tb_ref_risk` (
  `id_refr` int(11) NOT NULL,
  `id_sk` int(11) NOT NULL,
  `ref_resiko` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tb_ref_sebab`
--

CREATE TABLE `tb_ref_sebab` (
  `id_refs` int(11) NOT NULL,
  `id_sk` int(11) NOT NULL,
  `ref_sebab` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tb_ref_sifat_kegiatan`
--

CREATE TABLE `tb_ref_sifat_kegiatan` (
  `id_sk` int(11) NOT NULL,
  `sifat_kegiatan` varchar(254) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_ref_sifat_kegiatan`
--

INSERT INTO `tb_ref_sifat_kegiatan` (`id_sk`, `sifat_kegiatan`) VALUES
(17, 'PELAYANAN'),
(18, 'PENGADAAN BARANG/ JASA');

-- --------------------------------------------------------

--
-- Table structure for table `tb_riwayat_resiko`
--

CREATE TABLE `tb_riwayat_resiko` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_pemkot` int(11) NOT NULL,
  `kondisi` text NOT NULL,
  `kriteria` text NOT NULL,
  `sebab_uraian` text NOT NULL,
  `akibat` text NOT NULL,
  `saran` text NOT NULL,
  `sumber_data` text NOT NULL,
  `pernyataan_resiko` text NOT NULL,
  `sebab` text NOT NULL,
  `dampak` text NOT NULL,
  `tindak_lanjut` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_riwayat_resiko`
--

INSERT INTO `tb_riwayat_resiko` (`id`, `id_user`, `id_pemkot`, `kondisi`, `kriteria`, `sebab_uraian`, `akibat`, `saran`, `sumber_data`, `pernyataan_resiko`, `sebab`, `dampak`, `tindak_lanjut`) VALUES
(6, 6, 0, 'kondisi riwayat bpkad', 'kondisi riwayat bpkad', 'kondisi riwayat bpkad', 'kondisi riwayat bpkad', 'kondisi riwayat bpkad', 'kondisi riwayat bpkad', 'kondisi riwayat bpkad', 'kondisi riwayat bpkad', 'kondisi riwayat bpkad', 1),
(7, 16, 0, 'Terdapat pembangunan Gedung SD yang rangka atapnya terbuat dari kayu kelapa', 'Menurut kontrak nomor 123, rangka atap yang harus digunakan adalah rangka atap yg terbuat dari baja ringan', 'Kondisi tersebut disebabkan adanya kelalaian rekanan pelaksana pekerjaan dan lemahnya pengawasan oleh PPK/PPTK', 'Terjadinya kerugian keuangan negara/daerah atas pembayaran yang melebihi mutu barang yang diterima dan prediksi usia teknis atap yang lebih singkat', 'Kepada PPK disarankan agar bersama rekanan pelaksana mengganti rangka atap yang terpasang dengan rangka atap baja ringan sebagaimana yang ditetapkan dalam kontrak', 'Laporan hasil pemerikasaan Inspektorat Kota Manado Nomor 123 tanggal 123', 'Spesifikasi pekerjaan tidak sesuai kontrak', 'Kelelaian rekanan pelaksana dan lemahnya pengawasan oleh PPK/PPTK', 'Terjadinya kerugian keuangan negara/daerah dan usia teknis barang/jasa yang lebih singkat', 1),
(8, 16, 0, 'Terdapat kegagalan proses tender pembangunan Gedung Kantor Dinas Pendidikan', 'Pembangunan gedung kantor Dinas Pendidikan direncanakan dilaksanakan dan selesai pada tahun 2020.', 'Nilai HPS Pekerjaan Pembangunan Gedung Kantor terlalu rendah sehingga tidak ada calon rekanan yang mengajukan penawaran', 'Pekerjaan tidak terealisir di tahun 2020 sehingga kinerja Dinas Pendidikan terganggu', 'Agar segera membentuk tim untuk menyusun ulang HPS sesuai dengan harga wajar pasar', 'Laporan Hasil Audit Kinerja Bidang Pendidikan oleh Inspektorat Kota No Lap 123 tanggal 12 Desember 2020 ', 'HPS terlalu rendah', 'Tim Penyusun HPS tidak melakukan survei harga pasar atas  item pembentukan pekerjaan', 'Terjadinya keterlambatan penyelesaian pekerjaan', 2),
(9, 5, 3, 'Terdapat kegagalan proses tender pembangunan Gedung Kantor Dinas Pendidikan', 'Terdapat kegagalan proses tender pembangunan Gedung Kantor Dinas Pendidikan', 'Tim Penyusun HPS tidak melakukan survei harga pasar atas  item pembentukan pekerjaan', 'Terdapat kegagalan proses tender pembangunan Gedung Kantor Dinas Pendidikan', 'Terdapat kegagalan proses tender pembangunan Gedung Kantor Dinas Pendidikan', 'Terdapat kegagalan proses tender pembangunan Gedung Kantor Dinas Pendidikan', 'HPS terlalu rendah', 'Tim Penyusun HPS tidak melakukan survei harga pasar atas  item pembentukan pekerjaan', 'Terjadinya keterlambatan penyelesaian pekerjaan1', 1),
(11, 13, 2, 'Terdapat kekurangan volume pekerjaan lantai pada pembangunan RKB SDN Manado 1', 'Menurut Kontrak Nomor.....', 'Kelalaia Pihak Ketiga', 'terjadinya kerugian keuangan daerah', 'pihak ketiga menyetorkan ke kas daerah', 'laporan hasil audit BPK Nomor 321', 'pelaksanaan pekerjaan tidak sesuai dengan kontrak', 'Kelalaia Pihak Ketiga', 'terjadinya kerugian keuangan daerah', 2),
(12, 15, 2, 'Pembayaran pekerjaan pembangunan pagar puskesmas tongkaina melebihi realisasi fisik pekerjaan sebesar Rp. 2.191.575.22', 'SPK no. 18/D.03/PPK-DPPID/PL/X/2011 tanggal 31 Oktober 2011 ', 'Kelalaian pihak penyedia', 'Kerugian keuangan daerah sebesar  Rp. 2.191.575.22', 'menyetorkan ke kas daerah Rp. 2.191.575.22', 'LHP BPKRI atas LKPD Kota Manado Tahun 2011 no. 15.C/LHP/XIX.MND/IX/2012 tanggal 14 september 2012', 'realisasi fisik pekerjaan tidak sesuai dengan kontrak', 'Kelalaian pihak penyedia', 'Kerugian keuangan daerah\r\nBarang tidak bisa di pakai\r\n\r\n', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tb_rtp`
--

CREATE TABLE `tb_rtp` (
  `id_rtp` int(11) NOT NULL,
  `id_idev` int(11) NOT NULL,
  `uraian_pengendalian` text NOT NULL,
  `hasil_evaluasi` text NOT NULL,
  `uraian_rtp` text NOT NULL,
  `target_waktu` text NOT NULL,
  `pj` text NOT NULL,
  `keterangan` text NOT NULL,
  `realisasi_uraian` text DEFAULT NULL,
  `realisasi_target_waktu` text DEFAULT NULL,
  `realisasi_pj` text DEFAULT NULL,
  `is_realisasi` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_rtp`
--

INSERT INTO `tb_rtp` (`id_rtp`, `id_idev`, `uraian_pengendalian`, `hasil_evaluasi`, `uraian_rtp`, `target_waktu`, `pj`, `keterangan`, `realisasi_uraian`, `realisasi_target_waktu`, `realisasi_pj`, `is_realisasi`) VALUES
(22, 52, 'Adanya Konsultan Pengawas, Monitoring dari PPK', 'Kurang Efektif karena rekanan pengawas tidak melaksanakan tugas sesuai Tupoksinya', 'Adanya klausul tambahan dalam kontrak berupa sanksi pinalty apabila rekanan tidak menyelesaikan pekerjaan sesuai dengan kontrak', 'Oktober', 'Kepala Seksi', 'Perubahan draft kontrak diharapkan selesai pada bulan oktober dan membutuhkan anggaran.', 'Adanya klausul tambahan dalam kontrak berupa sanksi pinalty apabila rekanan tidak menyelesaikan pekerjaan sesuai dengan kontrak', 'September', 'Kepala bidang', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tb_tujuan_kegiatan`
--

CREATE TABLE `tb_tujuan_kegiatan` (
  `id_tk` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_pemkot` int(11) NOT NULL,
  `program` text NOT NULL,
  `outcome` text NOT NULL,
  `kegiatan` text NOT NULL,
  `output` text NOT NULL,
  `tujuan` text NOT NULL,
  `realisasi_output_kegiatan` text DEFAULT NULL,
  `realisasi_tujuan_kegiatan` text DEFAULT NULL,
  `id_sk` int(100) NOT NULL,
  `kode_unor` int(100) NOT NULL,
  `is_idev` int(2) NOT NULL,
  `realisasi` int(1) DEFAULT NULL,
  `tahun_anggaran` year(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_tujuan_kegiatan`
--

INSERT INTO `tb_tujuan_kegiatan` (`id_tk`, `id_user`, `id_pemkot`, `program`, `outcome`, `kegiatan`, `output`, `tujuan`, `realisasi_output_kegiatan`, `realisasi_tujuan_kegiatan`, `id_sk`, `kode_unor`, `is_idev`, `realisasi`, `tahun_anggaran`) VALUES
(20, 15, 2, 'Program peningkatan pelayanan kesehatan dasar', 'terlaksananya vaksin', 'rehabilitasi gedung puskesmas', '3 Unit Puskesmas', 'terlaksananya pekerjaan  rehabilitasi Puskesmas sebanyak 3 unit yang sesuai kebutuhan user, efisien, ekonomis, tepat waktu, tepat spesifikasi dan sesuai ketentuan.', '2 unit Puskesmas karena 1 unit ada permasalahan terkait kasus tanah', 'Terlaksananya pembangunan 2 Puskesmas dengan 1 Puskesmas terlambat diselesaikan.', 18, 16, 2, 1, 2021);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `id_pemkot` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `alias` varchar(100) NOT NULL,
  `email` varchar(128) NOT NULL,
  `id_atasan` varchar(100) DEFAULT NULL,
  `password` varchar(256) NOT NULL,
  `role_id` int(11) NOT NULL,
  `is_active` int(1) NOT NULL,
  `date_created` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `id_pemkot`, `name`, `alias`, `email`, `id_atasan`, `password`, `role_id`, `is_active`, `date_created`) VALUES
(1, 1, 'admin', 'admin', 'admin@simako.com', '00', '$2y$10$2INnYXWvFVWpCAtePHfJs.Uup4r7XY.DsZSJNv5NguAcPFkUpb36u', 5, 1, 12345),
(2, 2, 'SEKRETARIAT DAERAH KOTA MANADO', 'Sekda Manado', 'sekdamanado@simako.com', '1', '$2y$10$4e98RvIpctEfHoyMafgtpe1KDftYPR8Oh2or/09Nxovfi1UepOumy', 1, 1, 123456),
(3, 3, 'Sekretariat Daerah Pemerintah Kota Bitung', 'Sekda Bitung', 'sekdabitung@simako.com', '1', '$2y$10$/nVpZNlTD4fGXxFOYwwjQ.PpDhhp4RqsbjE5alnX3RxmurJUhcfOm', 1, 1, 123456),
(5, 3, 'BADAN KEPEGAWAIAN DAN PENGEMBANGAN SUMBERDAYA MANUSIA DAERAH KOTA BITUNG', 'BKPSDMD BITUNG', 'bkpsdmdbitung@simako.com', '3', '$2y$10$2INnYXWvFVWpCAtePHfJs.Uup4r7XY.DsZSJNv5NguAcPFkUpb36u', 2, 1, 123456),
(6, 3, 'BADAN PENANGGULANGAN BENCANA DAERAH KOTA BITUNG', 'BPBD BITUNG', 'bpbdbitung@simako.com', '3', '$2y$10$9DDBcCbUvJhFTMN5mLfb/Oav2jbkbQWYU15EaZoKnmsrI8Y6wSMM2', 2, 1, 2021),
(8, 3, 'BIDANG PENGEMBANGAN SUMBAER DAYA MANUSIA', 'BIDANG PSDM', 'psdmbkpsdmbtg@simako.com', '5', '$2y$10$UMg05ByF.dRF4KEfuN3o4OL5EBJxiRDlEROKPkIA7OKmFvMtBGzOe', 3, 1, 2021),
(9, 3, 'BIDANG PENGEMBANGAN UMUM', 'BINUM', 'binumbkpsdmbtg@simako.com', '5', '$2y$10$T7jyODAMYclUPLvSlc7Dr.T9j1Fmy2hrJhu41wMtNaolGPVGjsLnW', 3, 1, 2021),
(10, 3, 'BIDANG MUTASI DAN PENSIUN', 'BIDANG MUTASI', 'mutasibkpsdmbtg@simako.com', '5', '$2y$10$Q3GZpmfqoC/o17lP6x.M1emLei3lncQoVYS9BEH0n1AXBAFQ3/4ye', 3, 1, 2021),
(11, 3, 'INSPEKTORAT KOTA BITUNG', 'Inspektorat Kota Bitung', 'inspektoratbitung@simako.com', '1', '$2y$10$2INnYXWvFVWpCAtePHfJs.Uup4r7XY.DsZSJNv5NguAcPFkUpb36u', 4, 1, 1),
(12, 2, 'INSPEKTORAT KOTA MANADO', 'Inspektorat Kota Manado', 'inspektoratmanado@simako.com', '1', '$2y$10$OqrhhaeImayqwwHr4GdQHO6di55HelY9GGDRjowC.nKonHwXq.DkC', 4, 1, 1),
(13, 2, 'INSPEKTORAT KOTA MANADO', 'INSPEKTORAT', 'inspektoratmanado@gmail.com', '2', '$2y$10$mmuIUDWaZuWxqkTNAGE9seq5EWOk9dOlcRq/20elLHIOYwXNueG8S', 2, 1, 2021),
(14, 2, 'INSPEKTUR PEMBANTU WILAYAH II', 'IRBAN II', 'irban2simako@gmail.com', '13', '$2y$10$g7DBXIy28.4B7d1qJN0qMeqQzNK3D8aG7qJCHdouTF/8W2BVQW8ve', 3, 1, 2021),
(15, 2, 'DINAS KESEHATAN KOTA MANADO', 'DINKES', 'dinkesmanado@simako.com', '2', '$2y$10$3c.NswiHImyrfMTw6Q/i..ipTEBhIs9NBUo1gZHW7nRZ/yrb79LzS', 2, 1, 2021),
(16, 2, 'BIDANG PELAYANAN KESEHATAN', 'PELAYANAN', 'pelkesmanado@simako.com', '15', '$2y$10$wTWe0VF1WkzxWWgOST5mI.nUEfwK3j/wPVUjpmhrh.PLuAD6TfX1O', 3, 1, 2021);

-- --------------------------------------------------------

--
-- Table structure for table `user_access_menu`
--

CREATE TABLE `user_access_menu` (
  `id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_access_menu`
--

INSERT INTO `user_access_menu` (`id`, `role_id`, `menu_id`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(5, 1, 4),
(6, 2, 4),
(8, 1, 5),
(9, 2, 5),
(10, 3, 5),
(12, 4, 5),
(13, 4, 6),
(14, 5, 7),
(15, 5, 5),
(16, 1, 8),
(17, 2, 8),
(18, 3, 8),
(19, 4, 8),
(20, 1, 9),
(21, 4, 9),
(26, 1, 10),
(27, 2, 10),
(28, 3, 10),
(29, 4, 10);

-- --------------------------------------------------------

--
-- Table structure for table `user_menu`
--

CREATE TABLE `user_menu` (
  `id` int(11) NOT NULL,
  `menu` varchar(128) NOT NULL,
  `urutan` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_menu`
--

INSERT INTO `user_menu` (`id`, `menu`, `urutan`) VALUES
(1, 'ASDA', 2),
(2, 'OPD', 4),
(3, 'BIDANG', 5),
(4, 'USERS', 6),
(5, 'DASHBOARD', 1),
(6, 'INSPEKTORAT', 3),
(7, 'SUPER', 7),
(8, 'PROFILE', 8),
(9, 'MONITORING', 1),
(10, 'CETAK', 9);

-- --------------------------------------------------------

--
-- Table structure for table `user_role`
--

CREATE TABLE `user_role` (
  `id` int(11) NOT NULL,
  `role` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_role`
--

INSERT INTO `user_role` (`id`, `role`) VALUES
(1, 'Admin Asda'),
(2, 'Admin OPD'),
(3, 'Admin Bidang'),
(4, 'Admin Inspektorat'),
(5, 'Super');

-- --------------------------------------------------------

--
-- Table structure for table `user_sub_menu`
--

CREATE TABLE `user_sub_menu` (
  `id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `title` varchar(128) NOT NULL,
  `url` varchar(128) NOT NULL,
  `icon` varchar(128) NOT NULL,
  `is_active` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_sub_menu`
--

INSERT INTO `user_sub_menu` (`id`, `menu_id`, `title`, `url`, `icon`, `is_active`) VALUES
(1, 4, 'User Management', 'users/', 'bi bi-person-lines-fill', 1),
(2, 5, 'Dashboard', 'dashboard/', 'bi bi-grid-fill', 1),
(3, 6, 'Input Ref. Risiko', 'inspektorat/', 'bi bi-filter-square-fill', 1),
(4, 2, 'Input Riwayat Risiko', 'opd/riwayat', 'bi bi-pencil-fill', 1),
(5, 2, 'List Riwayat Risiko', 'opd/listriwayat', 'bi bi-collection-fill', 1),
(6, 2, 'Input Program', 'opd/inputprogram', 'bi bi-save2-fill', 1),
(7, 3, 'Input Tujuan Kegiatan', 'bidang/inputk', 'bi bi-arrow-up-right-circle-fill', 1),
(8, 3, 'Input Analisis Risiko', 'bidang/analisrisk', 'bi bi-calendar3-range-fill', 1),
(9, 3, 'Input RTP', 'bidang/inputrtp', 'fas fa-fire-extinguisher', 0),
(10, 3, 'List RTP', 'bidang/listrtp', 'fas fa-bullhorn', 0),
(11, 7, 'Control User', 'super/', 'monitor', 1),
(12, 7, 'Reset Data', 'super/reset', 'monitor', 1),
(13, 8, 'User Profile', 'profile/', 'bi bi-file-person-fill', 1),
(14, 3, 'Input Realisasi', 'bidang/realisasi', 'bi bi-lightbulb-fill', 1),
(15, 2, 'Input Realisasi Outcome', 'opd/realisasioutcome/', 'bi bi-filter-square-fill', 1),
(16, 9, 'Monitoring', 'dashboard/monitoring', 'bi bi-aspect-ratio-fill', 1),
(17, 10, 'Cetak', 'cetak/', 'bi bi-printer-fill', 1);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_highrisk`
-- (See below for the actual view)
--
CREATE TABLE `v_highrisk` (
`id_tk` int(11)
,`id_user` int(11)
,`id_pemkot` int(11)
,`program` text
,`outcome` text
,`kegiatan` text
,`output` text
,`tujuan` text
,`realisasi_output_kegiatan` text
,`realisasi_tujuan_kegiatan` text
,`id_sk` int(100)
,`kode_unor` int(100)
,`is_idev` int(2)
,`realisasi` int(1)
,`tahun_anggaran` year(4)
,`id_idev` int(11)
,`id_atasan` int(11)
,`resiko` text
,`sebab` text
,`dampak` text
,`n_kemungkinan` int(11)
,`n_dampak` int(11)
,`n_resiko` int(11)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_highrisk_back`
-- (See below for the actual view)
--
CREATE TABLE `v_highrisk_back` (
`id_tk` int(11)
,`program` text
,`outcome` text
,`kegiatan` text
,`output` text
,`tujuan` text
,`id_sk` int(100)
,`kode_unor` int(100)
,`is_idev` int(2)
,`id_idev` int(11)
,`id_user` int(11)
,`id_atasan` int(11)
,`resiko` text
,`sebab` text
,`dampak` text
,`n_kemungkinan` int(11)
,`n_dampak` int(11)
,`n_resiko` int(11)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_total`
-- (See below for the actual view)
--
CREATE TABLE `v_total` (
`id_pemkot` int(11)
,`program` text
,`outcome` text
,`kegiatan` text
,`output` text
,`tujuan` text
,`id_sk` int(100)
,`kode_unor` int(100)
,`is_idev` int(2)
,`realisasi` int(1)
,`tahun_anggaran` year(4)
,`id_idev` int(11)
,`id_user` int(11)
,`id_atasan` int(11)
,`id_tk` int(11)
,`resiko` text
,`sebab` text
,`dampak` text
,`n_kemungkinan` int(11)
,`n_dampak` int(11)
,`n_resiko` int(11)
,`realisasi_resiko` text
,`realisasi_sebab` text
,`realisasi_dampak` text
,`realisasi_idev` int(1)
,`id_user1` int(11)
,`nilai_reskeg` decimal(14,4)
,`name` varchar(128)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_totalskor`
-- (See below for the actual view)
--
CREATE TABLE `v_totalskor` (
`id_tk` int(11)
,`program` text
,`outcome` text
,`kegiatan` text
,`output` text
,`tujuan` text
,`id_sk` int(100)
,`kode_unor` int(100)
,`is_idev` int(2)
,`id_idev` int(11)
,`id_user` int(11)
,`id_atasan` int(11)
,`resiko` text
,`sebab` text
,`dampak` text
,`nilai_reskeg` decimal(14,4)
);

-- --------------------------------------------------------

--
-- Structure for view `v_highrisk`
--
DROP TABLE IF EXISTS `v_highrisk`;

CREATE ALGORITHM=UNDEFINED DEFINER=`u269563049_new_simako`@`127.0.0.1` SQL SECURITY DEFINER VIEW `v_highrisk`  AS SELECT `tb_tujuan_kegiatan`.`id_tk` AS `id_tk`, `tb_tujuan_kegiatan`.`id_user` AS `id_user`, `tb_tujuan_kegiatan`.`id_pemkot` AS `id_pemkot`, `tb_tujuan_kegiatan`.`program` AS `program`, `tb_tujuan_kegiatan`.`outcome` AS `outcome`, `tb_tujuan_kegiatan`.`kegiatan` AS `kegiatan`, `tb_tujuan_kegiatan`.`output` AS `output`, `tb_tujuan_kegiatan`.`tujuan` AS `tujuan`, `tb_tujuan_kegiatan`.`realisasi_output_kegiatan` AS `realisasi_output_kegiatan`, `tb_tujuan_kegiatan`.`realisasi_tujuan_kegiatan` AS `realisasi_tujuan_kegiatan`, `tb_tujuan_kegiatan`.`id_sk` AS `id_sk`, `tb_tujuan_kegiatan`.`kode_unor` AS `kode_unor`, `tb_tujuan_kegiatan`.`is_idev` AS `is_idev`, `tb_tujuan_kegiatan`.`realisasi` AS `realisasi`, `tb_tujuan_kegiatan`.`tahun_anggaran` AS `tahun_anggaran`, `tb_idev`.`id_idev` AS `id_idev`, `tb_idev`.`id_atasan` AS `id_atasan`, `tb_idev`.`resiko` AS `resiko`, `tb_idev`.`sebab` AS `sebab`, `tb_idev`.`dampak` AS `dampak`, `tb_idev`.`n_kemungkinan` AS `n_kemungkinan`, `tb_idev`.`n_dampak` AS `n_dampak`, `tb_idev`.`n_resiko` AS `n_resiko` FROM (`tb_tujuan_kegiatan` join `tb_idev`) WHERE `tb_idev`.`n_resiko` > 3 ;

-- --------------------------------------------------------

--
-- Structure for view `v_highrisk_back`
--
DROP TABLE IF EXISTS `v_highrisk_back`;

CREATE ALGORITHM=UNDEFINED DEFINER=`u269563049_new_simako`@`127.0.0.1` SQL SECURITY DEFINER VIEW `v_highrisk_back`  AS SELECT `tb_tujuan_kegiatan`.`id_tk` AS `id_tk`, `tb_tujuan_kegiatan`.`program` AS `program`, `tb_tujuan_kegiatan`.`outcome` AS `outcome`, `tb_tujuan_kegiatan`.`kegiatan` AS `kegiatan`, `tb_tujuan_kegiatan`.`output` AS `output`, `tb_tujuan_kegiatan`.`tujuan` AS `tujuan`, `tb_tujuan_kegiatan`.`id_sk` AS `id_sk`, `tb_tujuan_kegiatan`.`kode_unor` AS `kode_unor`, `tb_tujuan_kegiatan`.`is_idev` AS `is_idev`, `tb_idev`.`id_idev` AS `id_idev`, `tb_idev`.`id_user` AS `id_user`, `tb_idev`.`id_atasan` AS `id_atasan`, `tb_idev`.`resiko` AS `resiko`, `tb_idev`.`sebab` AS `sebab`, `tb_idev`.`dampak` AS `dampak`, `tb_idev`.`n_kemungkinan` AS `n_kemungkinan`, `tb_idev`.`n_dampak` AS `n_dampak`, `tb_idev`.`n_resiko` AS `n_resiko` FROM (`tb_tujuan_kegiatan` join `tb_idev`) WHERE `tb_tujuan_kegiatan`.`id_tk` = `tb_idev`.`id_tk` AND `tb_idev`.`n_resiko` > 3 ;

-- --------------------------------------------------------

--
-- Structure for view `v_total`
--
DROP TABLE IF EXISTS `v_total`;

CREATE ALGORITHM=UNDEFINED DEFINER=`u269563049_new_simako`@`127.0.0.1` SQL SECURITY DEFINER VIEW `v_total`  AS SELECT `tb_tujuan_kegiatan`.`id_pemkot` AS `id_pemkot`, `tb_tujuan_kegiatan`.`program` AS `program`, `tb_tujuan_kegiatan`.`outcome` AS `outcome`, `tb_tujuan_kegiatan`.`kegiatan` AS `kegiatan`, `tb_tujuan_kegiatan`.`output` AS `output`, `tb_tujuan_kegiatan`.`tujuan` AS `tujuan`, `tb_tujuan_kegiatan`.`id_sk` AS `id_sk`, `tb_tujuan_kegiatan`.`kode_unor` AS `kode_unor`, `tb_tujuan_kegiatan`.`is_idev` AS `is_idev`, `tb_tujuan_kegiatan`.`realisasi` AS `realisasi`, `tb_tujuan_kegiatan`.`tahun_anggaran` AS `tahun_anggaran`, `tb_idev`.`id_idev` AS `id_idev`, `tb_idev`.`id_user` AS `id_user`, `tb_idev`.`id_atasan` AS `id_atasan`, `tb_idev`.`id_tk` AS `id_tk`, `tb_idev`.`resiko` AS `resiko`, `tb_idev`.`sebab` AS `sebab`, `tb_idev`.`dampak` AS `dampak`, `tb_idev`.`n_kemungkinan` AS `n_kemungkinan`, `tb_idev`.`n_dampak` AS `n_dampak`, `tb_idev`.`n_resiko` AS `n_resiko`, `tb_idev`.`realisasi_resiko` AS `realisasi_resiko`, `tb_idev`.`realisasi_sebab` AS `realisasi_sebab`, `tb_idev`.`realisasi_dampak` AS `realisasi_dampak`, `tb_idev`.`realisasi_idev` AS `realisasi_idev`, `tb_idev`.`id_user` AS `id_user1`, avg(`tb_idev`.`n_resiko`) AS `nilai_reskeg`, `user`.`name` AS `name` FROM ((`tb_tujuan_kegiatan` join `tb_idev` on(`tb_tujuan_kegiatan`.`id_tk` = `tb_idev`.`id_tk`)) join `user` on(`tb_tujuan_kegiatan`.`id_user` = `user`.`id`)) GROUP BY `tb_idev`.`id_tk` ;

-- --------------------------------------------------------

--
-- Structure for view `v_totalskor`
--
DROP TABLE IF EXISTS `v_totalskor`;

CREATE ALGORITHM=UNDEFINED DEFINER=`u269563049_new_simako`@`127.0.0.1` SQL SECURITY DEFINER VIEW `v_totalskor`  AS SELECT `tb_tujuan_kegiatan`.`id_tk` AS `id_tk`, `tb_tujuan_kegiatan`.`program` AS `program`, `tb_tujuan_kegiatan`.`outcome` AS `outcome`, `tb_tujuan_kegiatan`.`kegiatan` AS `kegiatan`, `tb_tujuan_kegiatan`.`output` AS `output`, `tb_tujuan_kegiatan`.`tujuan` AS `tujuan`, `tb_tujuan_kegiatan`.`id_sk` AS `id_sk`, `tb_tujuan_kegiatan`.`kode_unor` AS `kode_unor`, `tb_tujuan_kegiatan`.`is_idev` AS `is_idev`, `tb_idev`.`id_idev` AS `id_idev`, `tb_idev`.`id_user` AS `id_user`, `tb_idev`.`id_atasan` AS `id_atasan`, `tb_idev`.`resiko` AS `resiko`, `tb_idev`.`sebab` AS `sebab`, `tb_idev`.`dampak` AS `dampak`, avg(`tb_idev`.`n_resiko`) AS `nilai_reskeg` FROM (`tb_tujuan_kegiatan` join `tb_idev`) WHERE `tb_tujuan_kegiatan`.`id_tk` = `tb_idev`.`id_tk` GROUP BY `tb_idev`.`id_tk` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `idev`
--
ALTER TABLE `idev`
  ADD PRIMARY KEY (`id_idev`);

--
-- Indexes for table `tb_daftar_pemkot`
--
ALTER TABLE `tb_daftar_pemkot`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_idev`
--
ALTER TABLE `tb_idev`
  ADD PRIMARY KEY (`id_idev`),
  ADD KEY `index_tb_idev` (`id_idev`);

--
-- Indexes for table `tb_program`
--
ALTER TABLE `tb_program`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_tb_program` (`id`);

--
-- Indexes for table `tb_realisasi`
--
ALTER TABLE `tb_realisasi`
  ADD PRIMARY KEY (`id_realisasi`);

--
-- Indexes for table `tb_realisasi_kegiatan`
--
ALTER TABLE `tb_realisasi_kegiatan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_realtk` (`id_tk`);

--
-- Indexes for table `tb_realisasi_program`
--
ALTER TABLE `tb_realisasi_program`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_realisasi_resiko`
--
ALTER TABLE `tb_realisasi_resiko`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_realrisk` (`id_idev`);

--
-- Indexes for table `tb_realisasi_rtp`
--
ALTER TABLE `tb_realisasi_rtp`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_ref_dampak`
--
ALTER TABLE `tb_ref_dampak`
  ADD PRIMARY KEY (`id_refd`);

--
-- Indexes for table `tb_ref_resiko`
--
ALTER TABLE `tb_ref_resiko`
  ADD PRIMARY KEY (`id_refrr`);

--
-- Indexes for table `tb_ref_risk`
--
ALTER TABLE `tb_ref_risk`
  ADD PRIMARY KEY (`id_refr`);

--
-- Indexes for table `tb_ref_sebab`
--
ALTER TABLE `tb_ref_sebab`
  ADD PRIMARY KEY (`id_refs`);

--
-- Indexes for table `tb_ref_sifat_kegiatan`
--
ALTER TABLE `tb_ref_sifat_kegiatan`
  ADD PRIMARY KEY (`id_sk`);

--
-- Indexes for table `tb_riwayat_resiko`
--
ALTER TABLE `tb_riwayat_resiko`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_rtp`
--
ALTER TABLE `tb_rtp`
  ADD PRIMARY KEY (`id_rtp`);

--
-- Indexes for table `tb_tujuan_kegiatan`
--
ALTER TABLE `tb_tujuan_kegiatan`
  ADD PRIMARY KEY (`id_tk`),
  ADD KEY `index_tb_tujuan_kegiatan` (`id_tk`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_access_menu`
--
ALTER TABLE `user_access_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_menu`
--
ALTER TABLE `user_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_role`
--
ALTER TABLE `user_role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_sub_menu`
--
ALTER TABLE `user_sub_menu`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `idev`
--
ALTER TABLE `idev`
  MODIFY `id_idev` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tb_daftar_pemkot`
--
ALTER TABLE `tb_daftar_pemkot`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tb_idev`
--
ALTER TABLE `tb_idev`
  MODIFY `id_idev` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `tb_program`
--
ALTER TABLE `tb_program`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tb_realisasi`
--
ALTER TABLE `tb_realisasi`
  MODIFY `id_realisasi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tb_realisasi_kegiatan`
--
ALTER TABLE `tb_realisasi_kegiatan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_realisasi_program`
--
ALTER TABLE `tb_realisasi_program`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tb_realisasi_resiko`
--
ALTER TABLE `tb_realisasi_resiko`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_realisasi_rtp`
--
ALTER TABLE `tb_realisasi_rtp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_ref_dampak`
--
ALTER TABLE `tb_ref_dampak`
  MODIFY `id_refd` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_ref_resiko`
--
ALTER TABLE `tb_ref_resiko`
  MODIFY `id_refrr` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT for table `tb_ref_risk`
--
ALTER TABLE `tb_ref_risk`
  MODIFY `id_refr` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_ref_sebab`
--
ALTER TABLE `tb_ref_sebab`
  MODIFY `id_refs` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_ref_sifat_kegiatan`
--
ALTER TABLE `tb_ref_sifat_kegiatan`
  MODIFY `id_sk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `tb_riwayat_resiko`
--
ALTER TABLE `tb_riwayat_resiko`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tb_rtp`
--
ALTER TABLE `tb_rtp`
  MODIFY `id_rtp` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `tb_tujuan_kegiatan`
--
ALTER TABLE `tb_tujuan_kegiatan`
  MODIFY `id_tk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `user_access_menu`
--
ALTER TABLE `user_access_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `user_menu`
--
ALTER TABLE `user_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `user_role`
--
ALTER TABLE `user_role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `user_sub_menu`
--
ALTER TABLE `user_sub_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tb_realisasi_kegiatan`
--
ALTER TABLE `tb_realisasi_kegiatan`
  ADD CONSTRAINT `idx_realtk` FOREIGN KEY (`id_tk`) REFERENCES `tb_tujuan_kegiatan` (`id_tk`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_realisasi_resiko`
--
ALTER TABLE `tb_realisasi_resiko`
  ADD CONSTRAINT `idx_realrisk` FOREIGN KEY (`id_idev`) REFERENCES `tb_idev` (`id_idev`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
