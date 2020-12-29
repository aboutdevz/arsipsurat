-- MySQL dump 10.16  Distrib 10.1.38-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: earsip
-- ------------------------------------------------------
-- Server version	10.1.38-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `arsip_dokumen`
--

DROP TABLE IF EXISTS `arsip_dokumen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `arsip_dokumen` (
  `id_dokumen` int(11) NOT NULL AUTO_INCREMENT,
  `nama_dokumen` varchar(255) DEFAULT NULL,
  `file_path` varchar(255) DEFAULT NULL,
  `tanggal_dokumen` varchar(255) DEFAULT NULL,
  `keterangan` varchar(255) NOT NULL,
  PRIMARY KEY (`id_dokumen`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `arsip_formulir`
--

DROP TABLE IF EXISTS `arsip_formulir`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `arsip_formulir` (
  `id_formulir` int(11) NOT NULL AUTO_INCREMENT,
  `nama_formulir` varchar(255) DEFAULT NULL,
  `file_path` varchar(255) DEFAULT NULL,
  `tanggal_formulir` varchar(255) DEFAULT NULL,
  `keterangan` varchar(255) NOT NULL,
  PRIMARY KEY (`id_formulir`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `disposisi_eksternal`
--

DROP TABLE IF EXISTS `disposisi_eksternal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `disposisi_eksternal` (
  `id_disposisi_eksternal` int(11) NOT NULL AUTO_INCREMENT,
  `isi_disposisi` varchar(255) NOT NULL,
  `tanggal_disposisi` date NOT NULL,
  `tujuan_disposisi` int(11) DEFAULT NULL,
  `id_surat_eksternal` int(11) DEFAULT NULL,
  `id_perintah` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_disposisi_eksternal`),
  KEY `fk_surat_eksternal` (`id_surat_eksternal`),
  KEY `fk_user` (`tujuan_disposisi`),
  KEY `fk_perintah_eksternal` (`id_perintah`),
  CONSTRAINT `fk_perintah_eksternal` FOREIGN KEY (`id_perintah`) REFERENCES `perintah_disposisi` (`id_perintah`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `fk_surat_eksternal` FOREIGN KEY (`id_surat_eksternal`) REFERENCES `surat_eksternal` (`id_surat_eksternal`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `fk_user` FOREIGN KEY (`tujuan_disposisi`) REFERENCES `user` (`id_user`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `disposisi_internal`
--

DROP TABLE IF EXISTS `disposisi_internal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `disposisi_internal` (
  `id_disposisi_internal` int(11) NOT NULL AUTO_INCREMENT,
  `isi_disposisi` text NOT NULL,
  `tanggal_disposisi` date NOT NULL,
  `id_surat_internal` int(11) DEFAULT NULL,
  `id_perintah` int(11) DEFAULT NULL,
  `tujuan_disposisi` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_disposisi_internal`),
  KEY `fk_disposisi` (`id_surat_internal`),
  KEY `fk_perintah` (`id_perintah`),
  KEY `fk_tujuan` (`tujuan_disposisi`),
  CONSTRAINT `fk_disposisi` FOREIGN KEY (`id_surat_internal`) REFERENCES `surat_internal` (`id_surat_internal`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `fk_perintah` FOREIGN KEY (`id_perintah`) REFERENCES `perintah_disposisi` (`id_perintah`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `fk_tujuan` FOREIGN KEY (`tujuan_disposisi`) REFERENCES `pegawai` (`id_pegawai`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jabatan`
--

DROP TABLE IF EXISTS `jabatan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jabatan` (
  `id_jabatan` int(11) NOT NULL AUTO_INCREMENT,
  `nama_jabatan` varchar(255) NOT NULL,
  `keterangan` text NOT NULL,
  `id_unit` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_jabatan`),
  KEY `fk_jabatan_unit` (`id_unit`),
  CONSTRAINT `fk_jabatan_unit` FOREIGN KEY (`id_unit`) REFERENCES `unit_kerja` (`id_unit`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jenis_surat`
--

DROP TABLE IF EXISTS `jenis_surat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jenis_surat` (
  `id_jenis` int(11) NOT NULL AUTO_INCREMENT,
  `nama_jenis` varchar(255) NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_jenis`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `media_surat`
--

DROP TABLE IF EXISTS `media_surat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media_surat` (
  `id_media` int(11) NOT NULL AUTO_INCREMENT,
  `nama_media` varchar(255) NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_media`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pegawai`
--

DROP TABLE IF EXISTS `pegawai`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pegawai` (
  `id_pegawai` int(11) NOT NULL AUTO_INCREMENT,
  `nama_pegawai` varchar(50) NOT NULL,
  `kontak_email` varchar(255) NOT NULL,
  `kontak_telepon` varchar(12) NOT NULL,
  `id_unit` int(11) DEFAULT NULL,
  `id_jabatan` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_pegawai`),
  KEY `fk_pegawai_unit` (`id_unit`),
  KEY `fk_pegawai_jabatan` (`id_jabatan`),
  CONSTRAINT `fk_pegawai_jabatan` FOREIGN KEY (`id_jabatan`) REFERENCES `jabatan` (`id_jabatan`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `fk_pegawai_unit` FOREIGN KEY (`id_unit`) REFERENCES `unit_kerja` (`id_unit`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `perintah_disposisi`
--

DROP TABLE IF EXISTS `perintah_disposisi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perintah_disposisi` (
  `id_perintah` int(11) NOT NULL AUTO_INCREMENT,
  `nama_perintah` varchar(255) NOT NULL,
  `keterangan` varchar(255) NOT NULL,
  PRIMARY KEY (`id_perintah`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `prioritas_surat`
--

DROP TABLE IF EXISTS `prioritas_surat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prioritas_surat` (
  `id_prioritas` int(11) NOT NULL AUTO_INCREMENT,
  `nama_prioritas` varchar(255) NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_prioritas`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sifat_surat`
--

DROP TABLE IF EXISTS `sifat_surat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sifat_surat` (
  `id_sifat` int(11) NOT NULL AUTO_INCREMENT,
  `nama_sifat` varchar(255) NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_sifat`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `surat_eksternal`
--

DROP TABLE IF EXISTS `surat_eksternal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `surat_eksternal` (
  `id_surat_eksternal` int(11) NOT NULL AUTO_INCREMENT,
  `nomor_surat` varchar(255) NOT NULL,
  `isi_ringkas` text NOT NULL,
  `perihal` varchar(255) NOT NULL,
  `file_path` varchar(255) NOT NULL,
  `lokasi_surat` varchar(255) NOT NULL,
  `tanggal_surat` date NOT NULL,
  `tanggal_transaksi` date NOT NULL,
  `asal_surat_pengguna` int(11) DEFAULT NULL,
  `asal_surat_luar` varchar(255) DEFAULT NULL,
  `tujuan_surat_pengguna` int(11) DEFAULT NULL,
  `tujuan_surat_luar` varchar(255) DEFAULT NULL,
  `id_jenis` int(11) DEFAULT NULL,
  `id_media` int(11) DEFAULT NULL,
  `id_prioritas` int(11) DEFAULT NULL,
  `id_sifat` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_surat_eksternal`),
  KEY `fk_asal_surat_pengguna` (`asal_surat_pengguna`),
  KEY `fk_tujuan_surat_pengguna` (`tujuan_surat_pengguna`),
  KEY `fk_jenis` (`id_jenis`),
  KEY `fk_prioritas` (`id_prioritas`),
  KEY `fk_sifat` (`id_sifat`),
  KEY `fk_media` (`id_media`),
  CONSTRAINT `fk_asal_surat_pengguna` FOREIGN KEY (`asal_surat_pengguna`) REFERENCES `user` (`id_user`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `fk_jenis` FOREIGN KEY (`id_jenis`) REFERENCES `jenis_surat` (`id_jenis`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `fk_media` FOREIGN KEY (`id_media`) REFERENCES `media_surat` (`id_media`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `fk_prioritas` FOREIGN KEY (`id_prioritas`) REFERENCES `prioritas_surat` (`id_prioritas`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `fk_sifat` FOREIGN KEY (`id_sifat`) REFERENCES `sifat_surat` (`id_sifat`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `fk_tujuan_surat_pengguna` FOREIGN KEY (`tujuan_surat_pengguna`) REFERENCES `user` (`id_user`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `surat_internal`
--

DROP TABLE IF EXISTS `surat_internal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `surat_internal` (
  `id_surat_internal` int(11) NOT NULL AUTO_INCREMENT,
  `nomor_surat` varchar(255) NOT NULL,
  `destinasi_surat` int(11) DEFAULT NULL,
  `isi_ringkas` text NOT NULL,
  `tanggal_surat` date NOT NULL,
  `tanggal_transaksi` date NOT NULL,
  `perihal` varchar(255) NOT NULL,
  `file_path` varchar(255) NOT NULL,
  `lokasi_surat` varchar(255) NOT NULL,
  `id_jenis` int(11) DEFAULT NULL,
  `id_prioritas` int(11) DEFAULT NULL,
  `id_sifat` int(11) DEFAULT NULL,
  `id_media` int(11) DEFAULT NULL,
  `asal_surat` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_surat_internal`),
  KEY `fk_masuk_jenis` (`id_jenis`),
  KEY `fk_masuk_sifat` (`id_sifat`),
  KEY `fk_masuk_prioritas` (`id_prioritas`),
  KEY `fk_masuk_media` (`id_media`) USING BTREE,
  KEY `fk_masuk_user` (`asal_surat`),
  KEY `fk_destinasi_surat_user` (`destinasi_surat`),
  CONSTRAINT `fk_destinasi_surat_user` FOREIGN KEY (`destinasi_surat`) REFERENCES `user` (`id_user`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `fk_masuk_jenis` FOREIGN KEY (`id_jenis`) REFERENCES `jenis_surat` (`id_jenis`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `fk_masuk_kategori` FOREIGN KEY (`id_media`) REFERENCES `media_surat` (`id_media`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `fk_masuk_prioritas` FOREIGN KEY (`id_prioritas`) REFERENCES `prioritas_surat` (`id_prioritas`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `fk_masuk_sifat` FOREIGN KEY (`id_sifat`) REFERENCES `sifat_surat` (`id_sifat`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `fk_masuk_user` FOREIGN KEY (`asal_surat`) REFERENCES `user` (`id_user`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `unit_kerja`
--

DROP TABLE IF EXISTS `unit_kerja`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unit_kerja` (
  `id_unit` int(11) NOT NULL AUTO_INCREMENT,
  `nama_unit` varchar(255) NOT NULL,
  `kepala_unit` varchar(255) NOT NULL,
  `keterangan` text NOT NULL,
  PRIMARY KEY (`id_unit`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `level` enum('1','0') NOT NULL,
  `id_pegawai` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_user`),
  KEY `fk_user_pegawai` (`id_pegawai`),
  CONSTRAINT `fk_user_pegawai` FOREIGN KEY (`id_pegawai`) REFERENCES `pegawai` (`id_pegawai`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `view_eksternal_jenis`
--

DROP TABLE IF EXISTS `view_eksternal_jenis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `view_eksternal_jenis` (
  `jenis_surat` varchar(255) DEFAULT NULL,
  `jumlah` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `view_eksternal_media`
--

DROP TABLE IF EXISTS `view_eksternal_media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `view_eksternal_media` (
  `media_surat` varchar(255) DEFAULT NULL,
  `jumlah` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `view_eksternal_prioritas`
--

DROP TABLE IF EXISTS `view_eksternal_prioritas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `view_eksternal_prioritas` (
  `prioritas_surat` varchar(255) DEFAULT NULL,
  `jumlah` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `view_eksternal_sifat`
--

DROP TABLE IF EXISTS `view_eksternal_sifat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `view_eksternal_sifat` (
  `sifat_surat` varchar(255) DEFAULT NULL,
  `jumlah` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `view_internal_jenis`
--

DROP TABLE IF EXISTS `view_internal_jenis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `view_internal_jenis` (
  `jenis_surat` varchar(255) DEFAULT NULL,
  `jumlah` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `view_internal_media`
--

DROP TABLE IF EXISTS `view_internal_media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `view_internal_media` (
  `media_surat` varchar(255) DEFAULT NULL,
  `jumlah` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `view_internal_prioritas`
--

DROP TABLE IF EXISTS `view_internal_prioritas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `view_internal_prioritas` (
  `prioritas_surat` varchar(255) DEFAULT NULL,
  `jumlah` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `view_internal_sifat`
--

DROP TABLE IF EXISTS `view_internal_sifat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `view_internal_sifat` (
  `sifat_surat` varchar(255) DEFAULT NULL,
  `jumlah` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-29 16:15:38
