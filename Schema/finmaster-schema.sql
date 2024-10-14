CREATE DATABASE IF NOT EXISTS `finmaster`
/*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */
/*!80016 DEFAULT ENCRYPTION='N' */
;
USE `finmaster`;
-- MySQL dump 10.13  Distrib 8.0.12, for Win64 (x86_64)
--
-- Host: localhost    Database: finmaster
-- ------------------------------------------------------
-- Server version	9.0.1
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */
;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */
;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */
;
SET NAMES utf8;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */
;
/*!40103 SET TIME_ZONE='+00:00' */
;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */
;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */
;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */
;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */
;
--
-- Table structure for table `account`
--
DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */
;
SET character_set_client = utf8mb4;
CREATE TABLE `account` (
  `account_number` varchar(255) NOT NULL,
  `account_balance` double DEFAULT NULL,
  PRIMARY KEY (`account_number`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */
;
--
-- Dumping data for table `account`
--
LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */
;
INSERT INTO `account`
VALUES ('409000493201', 710283.58),
('409000611074', 5065700);
/*!40000 ALTER TABLE `account` ENABLE KEYS */
;
UNLOCK TABLES;
--
-- Table structure for table `goal`
--
DROP TABLE IF EXISTS `goal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */
;
SET character_set_client = utf8mb4;
CREATE TABLE `goal` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `account_number` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `duration_in_months` int DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `priority` enum('HIGH', 'LOW', 'MEDIUM') DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `value` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 6 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */
;
--
-- Dumping data for table `goal`
--
LOCK TABLES `goal` WRITE;
/*!40000 ALTER TABLE `goal` DISABLE KEYS */
;
INSERT INTO `goal`
VALUES (
    1,
    '409000611074',
    'Save for a vacation to Hawaii',
    6,
    'Save for Vacation',
    'HIGH',
    '2024-09-27',
    2000
  ),
(
    2,
    '409000611074',
    'adwqa',
    2,
    'goal 1',
    'HIGH',
    '2024-09-27',
    1000
  ),
(
    5,
    '409000493201',
    'adwa',
    3,
    'goal 1',
    'HIGH',
    '2024-09-30',
    10000
  );
/*!40000 ALTER TABLE `goal` ENABLE KEYS */
;
UNLOCK TABLES;
--
-- Table structure for table `transactions`
--
DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */
;
SET character_set_client = utf8mb4;
CREATE TABLE `transactions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `account_no` varchar(255) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `balance_amount` double DEFAULT NULL,
  `transaction_date` date DEFAULT NULL,
  `transaction_details` varchar(255) DEFAULT NULL,
  `transaction_type` enum('Deposit', 'Withdraw') DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 28 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */
;
--
-- Dumping data for table `transactions`
--
LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */
;
INSERT INTO `transactions`
VALUES (
    1,
    '409000611074',
    1000000,
    1000000,
    '2017-06-29',
    'TRF FROM Indiaforensic SERVICES',
    'Deposit'
  ),
(
    2,
    '409000611074',
    500000,
    1500000,
    '2017-07-05',
    'TRF FROM Indiaforensic SERVICES',
    'Deposit'
  ),
(
    3,
    '409000611074',
    3000000,
    4500000,
    '2017-07-18',
    'FDRL/INTERNAL FUND TRANSFE',
    'Deposit'
  ),
(
    4,
    '409000611074',
    500000,
    5000000,
    '2017-08-01',
    'TRF FRM Indiaforensic SERVICES',
    'Deposit'
  ),
(
    5,
    '409000611074',
    500000,
    5500000,
    '2017-08-16',
    'FDRL/INTERNAL FUND TRANSFE',
    'Deposit'
  ),
(
    6,
    '409000611074',
    133900,
    5366100,
    '2017-08-16',
    'INDO GIBL Indiaforensic STL01071',
    'Withdraw'
  ),
(
    7,
    '409000611074',
    18000,
    5348100,
    '2017-08-16',
    'INDO GIBL Indiaforensic STL02071',
    'Withdraw'
  ),
(
    8,
    '409000611074',
    5000,
    5343100,
    '2017-08-16',
    'INDO GIBL Indiaforensic STL03071',
    'Withdraw'
  ),
(
    9,
    '409000611074',
    195800,
    5147300,
    '2017-08-16',
    'INDO GIBL Indiaforensic STL04071',
    'Withdraw'
  ),
(
    10,
    '409000611074',
    81600,
    5065700,
    '2017-08-16',
    'INDO GIBL Indiaforensic STL05071',
    'Withdraw'
  ),
(
    11,
    '409000493201',
    500000,
    500000,
    '2016-09-05',
    'TRF FROM Indiaforensic SERVICES',
    'Deposit'
  ),
(
    12,
    '409000493201',
    802.77,
    499197.23,
    '2016-09-06',
    'BBPS SETTLEMENT DT 30/08/',
    'Withdraw'
  ),
(
    13,
    '409000493201',
    239.89,
    498957.34,
    '2016-09-06',
    'BBPS SETTLEMENT DT 31/08/',
    'Withdraw'
  ),
(
    14,
    '409000493201',
    1193.54,
    497763.8,
    '2016-09-06',
    'BBPS SETTLEMENT DT 01/09/',
    'Withdraw'
  ),
(
    15,
    '409000493201',
    32.99,
    497730.81,
    '2016-10-18',
    'BBPS SETTLEMENT DTD 17.10',
    'Withdraw'
  ),
(
    16,
    '409000493201',
    16.3,
    497714.51,
    '2016-10-19',
    'BBPS SETTLEMENT DTD 18.10',
    'Withdraw'
  ),
(
    17,
    '409000493201',
    67000,
    564714.51,
    '2017-03-15',
    'TRF FROM Indiaforensic SERVICES',
    'Deposit'
  ),
(
    18,
    '409000493201',
    89537.25,
    475177.26,
    '2017-03-16',
    'BBPS SETTLEMENT 16032017',
    'Withdraw'
  ),
(
    19,
    '409000493201',
    117000,
    592177.26,
    '2017-03-16',
    'TRF FRM Indiaforensic SERVICES',
    'Deposit'
  ),
(
    20,
    '409000493201',
    117674.17,
    474503.09,
    '2017-03-17',
    'BBPS SETTLEMENT 17032017',
    'Withdraw'
  ),
(
    21,
    '409000493201',
    150000,
    624503.09,
    '2017-03-17',
    'TRF FRM Indiaforensic SERVICES',
    'Deposit'
  ),
(
    22,
    '409000493201',
    93646,
    530857.09,
    '2017-03-18',
    'BBPS OX01 SETTLEMENT 1803',
    'Withdraw'
  ),
(
    23,
    '409000493201',
    150000,
    680857.09,
    '2017-03-20',
    'TRF FRM Indiaforensic SERVICES',
    'Deposit'
  ),
(
    24,
    '409000493201',
    87337.96,
    593519.13,
    '2017-03-20',
    'BBPS SETTLEMENT FOR DT 20',
    'Withdraw'
  ),
(
    25,
    '409000493201',
    183235.55,
    410283.58,
    '2017-03-21',
    'BBPS SETTLEMENT 21032017',
    'Withdraw'
  ),
(
    26,
    '409000493201',
    200000,
    610283.58,
    '2017-03-21',
    'T FRM Indiaforensic SERVICES IN',
    'Deposit'
  ),
(
    27,
    '409000493201',
    100000,
    710283.58,
    '2017-03-22',
    'TRF FROM Indiaforensic SERVICES',
    'Deposit'
  );
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */
;
UNLOCK TABLES;
--
-- Table structure for table `users`
--
DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */
;
SET character_set_client = utf8mb4;
CREATE TABLE `users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `account_number` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `role` tinyint DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `users_chk_1` CHECK (
    (
      `role` between 0 and 1
    )
  )
) ENGINE = InnoDB AUTO_INCREMENT = 3 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */
;
--
-- Dumping data for table `users`
--
LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */
;
INSERT INTO `users`
VALUES (
    1,
    '409000493201',
    '2024-09-26 03:10:15.175625',
    'narendranmurali2001@gmail.com',
    'Narendran',
    'M',
    '$2a$10$YsOClKveRWB1ENbhggXXZecmZQEvisXn81FWP5kCxE8pPw.Kw5Tlu',
    '7012145874',
    0,
    '2024-09-26 03:10:15.176740'
  ),
(
    2,
    '409000611074',
    '2024-09-27 08:56:33.396278',
    'john@gmail.com',
    'John',
    'Doe',
    '$2a$10$C2WctOkTy73Lsk6D..vm3O2Eir696VOV4iqZNkHFpK.QLPBiY0lh6', -- 12345678
    '1234567890',
    0,
    '2024-09-27 08:56:33.396278'
  );
/*!40000 ALTER TABLE `users` ENABLE KEYS */
;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */
;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */
;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */
;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */
;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */
;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */
;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */
;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */
;
-- Dump completed on 2024-10-01 10:12:40