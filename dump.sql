-- MySQL dump 10.13  Distrib 8.0.20, for Linux (x86_64)
--
-- Host: localhost    Database: wunder_db
-- ------------------------------------------------------
-- Server version	8.0.20

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `bank_accounts`
--

DROP TABLE IF EXISTS `bank_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bank_accounts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` bigint unsigned NOT NULL,
  `account_owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `iban` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bank_accounts_customer_id_foreign` (`customer_id`),
  CONSTRAINT `bank_accounts_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bank_accounts`
--

LOCK TABLES `bank_accounts` WRITE;
/*!40000 ALTER TABLE `bank_accounts` DISABLE KEYS */;
INSERT INTO `bank_accounts` VALUES (1,1,'Humphrey Ndirangu','DE75512108001245126211','2021-02-19 21:14:46','2021-02-19 21:14:46'),(2,2,'Joshua Mukua','DE75512108001245126212','2021-02-19 21:15:46','2021-02-19 21:15:46'),(3,4,'Joshua Mukua','DE75512108001245126214','2021-02-20 22:03:22','2021-02-20 22:03:22'),(4,5,'Ham tester','72555f5f5f5f','2021-02-20 22:20:22','2021-02-20 22:20:22'),(5,6,'pppppp','DE364562888889','2021-02-21 14:26:56','2021-02-21 14:26:56'),(6,8,'pppppp','DE3645628888899','2021-02-21 14:55:54','2021-02-21 14:55:54'),(7,9,'Humphrey Kiboi','DE369852222111','2021-02-21 15:01:14','2021-02-21 15:01:14'),(8,10,'Zachariah Obiek','DE369896535555222','2021-02-21 17:22:38','2021-02-21 17:22:38'),(9,11,'pop','De895622','2021-02-21 18:29:51','2021-02-21 18:29:51');
/*!40000 ALTER TABLE `bank_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telephone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `street` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `house_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zip_code` int NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `customers_telephone_unique` (`telephone`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'Humphrey','Ndirangu','015255111022','Clara Zetkin str. 1','WE07 G Links',99094,'Erfurt','2021-02-19 21:14:46','2021-02-19 21:14:46'),(2,'Humphrey','Ndirangu','015255111023','Blumenschmidt str. 1','WE07 G Links',99084,'Erfurt','2021-02-19 21:15:46','2021-02-19 21:15:46'),(4,'Humphrey','Ndirangu','015255111027','Blumenschmidt str. 1','WE07 G Links',99084,'Erfurt','2021-02-20 22:03:21','2021-02-20 22:03:21'),(5,'Humphrey','Ndirangu','0152558605858','Blumenschmidtstraße 1','we0589',99085,'Erfurt','2021-02-20 22:20:21','2021-02-20 22:20:21'),(6,'Humphrey','Ndirangu','0152558605856','Blumenschmidtstraße 1','we07',99085,'Erfurt','2021-02-21 14:26:54','2021-02-21 14:26:54'),(8,'Humphrey','Ndirangu','01525586058565','Blumenschmidtstraße 1','we07',99085,'Erfurt','2021-02-21 14:55:54','2021-02-21 14:55:54'),(9,'Humphrey','Ndirangu','01525586058578','Blumenschmidtstraße 1','we05',99085,'Erfurt','2021-02-21 15:01:14','2021-02-21 15:01:14'),(10,'Zachariah','Obiek','0711676822','Robert Koch','FE07 Links',25639,'Hamburg','2021-02-21 17:22:38','2021-02-21 17:22:38'),(11,'Humphrey','Ndirangu','01255860585','Blumenschmidtstraße 1','WE09',99085,'Erfurt','2021-02-21 18:29:50','2021-02-21 18:29:50');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2021_02_18_203356_create_customers_table',1),(2,'2021_02_18_203400_create_bank_accounts_table',1),(3,'2021_02_18_203423_create_transactions_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transactions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` bigint unsigned NOT NULL,
  `payment_data_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `transactions_customer_id_foreign` (`customer_id`),
  CONSTRAINT `transactions_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
INSERT INTO `transactions` VALUES (1,1,'2bf8fba60f713d698022be772293a35c40af86c7d20ceed202633c79c493b47d311e4cea792ad0af1b73f1757b76f870','2021-02-19 21:14:46','2021-02-19 21:14:46'),(2,2,'0a1367d6b1c0c9e41336502fa07b3f0c66c33d44bcffad0e899cb7f25469824f099cb1f2fcc1c00d91483820c8e3ba24','2021-02-19 21:15:47','2021-02-19 21:15:47'),(3,4,'925a224c1e19c80f14e78b2a312fd37d790d211bfa9a54edafc24828d2bbc892d2b05579e76d2edae9a79fb4b8456e93','2021-02-20 22:03:24','2021-02-20 22:03:24'),(4,5,'7371fac3d01d407a20a255ead1f7d25262c4f5de14f52378b39c82eab1971c2ac3dbfec8aa988c2ef533dfd623237343','2021-02-20 22:20:22','2021-02-20 22:20:22'),(5,6,'270ccbf7019cfbaa73df063dcd1000d072633537fcf94ef9a94a67c0694710bdc057abdccc7eb18d270745a69a30cb55','2021-02-21 14:26:58','2021-02-21 14:26:58'),(6,8,'24bfdbdf96cf3c35e2368d2da149d6d45d495bd18e34041eaf34d6b1ee55993d25f348f77f6a64bb1c6286f5466100a3','2021-02-21 14:55:55','2021-02-21 14:55:55'),(7,9,'6e482ba0651ecdbba8ef79301f04bb3f40ce87fdd7c6a027c0e2a182297b134fedcdf62fc46316f6b76d73890c0d630c','2021-02-21 15:01:15','2021-02-21 15:01:15'),(8,10,'86129a252655e181e7c4f66579868712b680f6cbabebec6e417b4a3605f687ce056458836c1ed34076dd70ccc90d9a7f','2021-02-21 17:22:39','2021-02-21 17:22:39'),(9,11,'6a52e21a6e712f6323a04943b856c2bcb54faeb7522b0a9f023a5a5e19020bea6c8193496fd6e13a0966ce575d65cbef','2021-02-21 18:29:52','2021-02-21 18:29:52');
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-02-21 21:19:54
