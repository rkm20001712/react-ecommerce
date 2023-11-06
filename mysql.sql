-- MySQL dump 10.13  Distrib 8.0.26, for macos11 (arm64)
--
-- Host: localhost    Database: ecommerce
-- ------------------------------------------------------
-- Server version	8.0.26

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
-- Table structure for table `Addresses`
--

DROP TABLE IF EXISTS `Addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Addresses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fullname` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `orderId` int DEFAULT NULL,
  `discrict` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `states` varchar(255) DEFAULT NULL,
  `area` varchar(255) DEFAULT NULL,
  `shipping` text,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `custId` int DEFAULT NULL,
  `StreetAddress` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Addresses`
--

LOCK TABLES `Addresses` WRITE;
/*!40000 ALTER TABLE `Addresses` DISABLE KEYS */;
/*!40000 ALTER TABLE `Addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `areas`
--

DROP TABLE IF EXISTS `areas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `areas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `locationId` int DEFAULT NULL,
  `status` enum('active','inactive') DEFAULT 'active',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `zipcode` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `areas`
--

LOCK TABLES `areas` WRITE;
/*!40000 ALTER TABLE `areas` DISABLE KEYS */;
/*!40000 ALTER TABLE `areas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BannerDetails`
--

DROP TABLE IF EXISTS `BannerDetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `BannerDetails` (
  `id` int NOT NULL AUTO_INCREMENT,
  `banner` text,
  `slug` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `type` enum('0','1') DEFAULT NULL COMMENT '0 (laptop), 1 (mobile)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BannerDetails`
--

LOCK TABLES `BannerDetails` WRITE;
/*!40000 ALTER TABLE `BannerDetails` DISABLE KEYS */;
/*!40000 ALTER TABLE `BannerDetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cart_Details`
--

DROP TABLE IF EXISTS `Cart_Details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Cart_Details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `orderId` varchar(255) DEFAULT NULL,
  `addressId` int DEFAULT NULL,
  `productId` int DEFAULT NULL,
  `varientId` int DEFAULT NULL,
  `qty` int DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `status` enum('processing','shipping','delivered','cancelRequest','cancel') DEFAULT 'processing',
  `deliveryDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cart_Details`
--

LOCK TABLES `Cart_Details` WRITE;
/*!40000 ALTER TABLE `Cart_Details` DISABLE KEYS */;
/*!40000 ALTER TABLE `Cart_Details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `keyword` varchar(255) DEFAULT NULL,
  `desc` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Grocerry ','2022-04-02 03:26:45','2022-04-02 03:26:50',NULL,1,NULL,'grocery','grocery','grocery');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ch_brand_details`
--

DROP TABLE IF EXISTS `ch_brand_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ch_brand_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `DiscountPer` int DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `keyword` text,
  `desc` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ch_brand_details`
--

LOCK TABLES `ch_brand_details` WRITE;
/*!40000 ALTER TABLE `ch_brand_details` DISABLE KEYS */;
INSERT INTO `ch_brand_details` VALUES (1,'TATA','BR4xdx','tata',1,NULL,'2022-04-02 03:32:09','2022-04-02 03:32:09',NULL,NULL,NULL);
/*!40000 ALTER TABLE `ch_brand_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ch_cities`
--

DROP TABLE IF EXISTS `ch_cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ch_cities` (
  `id` int NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(255) DEFAULT NULL,
  `DISTRICTID` int DEFAULT NULL,
  `ZONEID` int DEFAULT NULL,
  `STATEID` int DEFAULT NULL,
  `STATUS` tinyint(1) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ch_cities`
--

LOCK TABLES `ch_cities` WRITE;
/*!40000 ALTER TABLE `ch_cities` DISABLE KEYS */;
/*!40000 ALTER TABLE `ch_cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ch_color_details`
--

DROP TABLE IF EXISTS `ch_color_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ch_color_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(255) DEFAULT NULL,
  `CODE` text,
  `STATUS` tinyint(1) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ch_color_details`
--

LOCK TABLES `ch_color_details` WRITE;
/*!40000 ALTER TABLE `ch_color_details` DISABLE KEYS */;
INSERT INTO `ch_color_details` VALUES (1,'Green','#ffsds',1,'2022-04-02 03:32:23','2022-04-02 03:32:23');
/*!40000 ALTER TABLE `ch_color_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ch_coupon_details`
--

DROP TABLE IF EXISTS `ch_coupon_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ch_coupon_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Code` varchar(255) DEFAULT NULL,
  `VarientId` int DEFAULT NULL,
  `StartDate` datetime DEFAULT NULL,
  `EndDate` datetime DEFAULT NULL,
  `Type` int DEFAULT NULL,
  `Value` double DEFAULT NULL,
  `Status` tinyint(1) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ch_coupon_details`
--

LOCK TABLES `ch_coupon_details` WRITE;
/*!40000 ALTER TABLE `ch_coupon_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `ch_coupon_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ch_flash_sale_items`
--

DROP TABLE IF EXISTS `ch_flash_sale_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ch_flash_sale_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `flashSaleId` int DEFAULT NULL,
  `status` int DEFAULT NULL,
  `productId` int DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `productId` (`productId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ch_flash_sale_items`
--

LOCK TABLES `ch_flash_sale_items` WRITE;
/*!40000 ALTER TABLE `ch_flash_sale_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `ch_flash_sale_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ch_flash_sales`
--

DROP TABLE IF EXISTS `ch_flash_sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ch_flash_sales` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `status` int NOT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `startDate` datetime DEFAULT NULL,
  `endDate` datetime DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ch_flash_sales`
--

LOCK TABLES `ch_flash_sales` WRITE;
/*!40000 ALTER TABLE `ch_flash_sales` DISABLE KEYS */;
/*!40000 ALTER TABLE `ch_flash_sales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ch_parlour_cat_details`
--

DROP TABLE IF EXISTS `ch_parlour_cat_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ch_parlour_cat_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `SALONID` int DEFAULT NULL,
  `OWNERID` int DEFAULT NULL,
  `CAT_ID` int DEFAULT NULL,
  `SERVICEID` int DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ch_parlour_cat_details`
--

LOCK TABLES `ch_parlour_cat_details` WRITE;
/*!40000 ALTER TABLE `ch_parlour_cat_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `ch_parlour_cat_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ch_salon_categories`
--

DROP TABLE IF EXISTS `ch_salon_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ch_salon_categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `salonCategoryName` varchar(255) DEFAULT NULL,
  `salonSlug` varchar(255) DEFAULT NULL,
  `sortDesc` text,
  `Gender` varchar(255) DEFAULT NULL,
  `Thumbnail` varchar(255) DEFAULT NULL,
  `Status` tinyint(1) DEFAULT '1',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ch_salon_categories`
--

LOCK TABLES `ch_salon_categories` WRITE;
/*!40000 ALTER TABLE `ch_salon_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `ch_salon_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ch_salon_details`
--

DROP TABLE IF EXISTS `ch_salon_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ch_salon_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `OWNERID` int DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `SLUG` varchar(255) DEFAULT NULL,
  `THUMBNAIL` varchar(255) DEFAULT NULL,
  `PHONENO` varchar(255) DEFAULT NULL,
  `CITY` int DEFAULT NULL,
  `ADDRESS` text,
  `LAT` float DEFAULT NULL,
  `LONG` float DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `STATUS` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ch_salon_details`
--

LOCK TABLES `ch_salon_details` WRITE;
/*!40000 ALTER TABLE `ch_salon_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `ch_salon_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ch_salon_order_lists`
--

DROP TABLE IF EXISTS `ch_salon_order_lists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ch_salon_order_lists` (
  `id` int NOT NULL AUTO_INCREMENT,
  `CUSTID` int DEFAULT NULL,
  `USERID` int DEFAULT NULL,
  `ORDERNO` varchar(255) DEFAULT NULL,
  `FIRSTNAME` varchar(255) DEFAULT NULL,
  `LASTNAME` varchar(255) DEFAULT NULL,
  `PHONENO` varchar(255) DEFAULT NULL,
  `EMAIL` varchar(255) DEFAULT NULL,
  `GRANDTOTAL` double DEFAULT NULL,
  `APPOINTMENTDATE` datetime DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ch_salon_order_lists`
--

LOCK TABLES `ch_salon_order_lists` WRITE;
/*!40000 ALTER TABLE `ch_salon_order_lists` DISABLE KEYS */;
/*!40000 ALTER TABLE `ch_salon_order_lists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ch_salon_order_service_lists`
--

DROP TABLE IF EXISTS `ch_salon_order_service_lists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ch_salon_order_service_lists` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ORDERID` int DEFAULT NULL,
  `CUSTID` int DEFAULT NULL,
  `PARLOURID` int DEFAULT NULL,
  `CATID` int DEFAULT NULL,
  `PARLOURNAME` varchar(255) DEFAULT NULL,
  `SERVICENAME` varchar(255) DEFAULT NULL,
  `DISCOUNTPER` double DEFAULT NULL,
  `DISCOUNTPRICE` double DEFAULT NULL,
  `PRICE` double DEFAULT NULL,
  `GRANDTOTAL` double DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ch_salon_order_service_lists`
--

LOCK TABLES `ch_salon_order_service_lists` WRITE;
/*!40000 ALTER TABLE `ch_salon_order_service_lists` DISABLE KEYS */;
/*!40000 ALTER TABLE `ch_salon_order_service_lists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ch_salon_owners`
--

DROP TABLE IF EXISTS `ch_salon_owners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ch_salon_owners` (
  `id` int NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) DEFAULT NULL,
  `EMAIL` varchar(255) DEFAULT NULL,
  `PHONENO` varchar(255) DEFAULT NULL,
  `GENDER` varchar(255) DEFAULT NULL,
  `ADDRESS` varchar(255) DEFAULT NULL,
  `CITY` int DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `STATUS` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ch_salon_owners`
--

LOCK TABLES `ch_salon_owners` WRITE;
/*!40000 ALTER TABLE `ch_salon_owners` DISABLE KEYS */;
/*!40000 ALTER TABLE `ch_salon_owners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ch_salon_price_details`
--

DROP TABLE IF EXISTS `ch_salon_price_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ch_salon_price_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `SALONID` int DEFAULT NULL,
  `OWNERID` int DEFAULT NULL,
  `SERVICEID` int DEFAULT NULL,
  `GENDER` varchar(255) DEFAULT NULL,
  `PRICE` int DEFAULT NULL,
  `DISCOUNTPER` int DEFAULT NULL,
  `DISCOUNTPRICE` float DEFAULT NULL,
  `TOTAL` float DEFAULT NULL,
  `GRANDTOTAL` float DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `CAT_ID` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ch_salon_price_details`
--

LOCK TABLES `ch_salon_price_details` WRITE;
/*!40000 ALTER TABLE `ch_salon_price_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `ch_salon_price_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ch_salon_services`
--

DROP TABLE IF EXISTS `ch_salon_services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ch_salon_services` (
  `id` int NOT NULL AUTO_INCREMENT,
  `SERVICENAME` varchar(255) DEFAULT NULL,
  `SORTDESC` text,
  `STATUS` tinyint(1) DEFAULT NULL,
  `CAT_ID` int DEFAULT NULL,
  `OWNERID` int DEFAULT NULL,
  `SLUG` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ch_salon_services`
--

LOCK TABLES `ch_salon_services` WRITE;
/*!40000 ALTER TABLE `ch_salon_services` DISABLE KEYS */;
/*!40000 ALTER TABLE `ch_salon_services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ch_seller_shopdetails`
--

DROP TABLE IF EXISTS `ch_seller_shopdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ch_seller_shopdetails` (
  `id` int NOT NULL AUTO_INCREMENT,
  `SELLERID` int DEFAULT NULL,
  `SHOPNAME` varchar(255) DEFAULT NULL,
  `THUMBNAIL` varchar(255) DEFAULT NULL,
  `PHONE` varchar(255) DEFAULT NULL,
  `ADDRESS` text,
  `CITY` varchar(255) DEFAULT NULL,
  `DISTRICT` varchar(255) DEFAULT NULL,
  `ZONE` varchar(255) DEFAULT NULL,
  `PICKUPADDRESS` text,
  `DESCRIPTION` text,
  `BANKNAME` text,
  `BANKACCOUNTNO` double DEFAULT NULL,
  `BANKACCOUNTHOLDERNAME` varchar(255) DEFAULT NULL,
  `BANKBRANCH` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ch_seller_shopdetails`
--

LOCK TABLES `ch_seller_shopdetails` WRITE;
/*!40000 ALTER TABLE `ch_seller_shopdetails` DISABLE KEYS */;
/*!40000 ALTER TABLE `ch_seller_shopdetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ch_specifications`
--

DROP TABLE IF EXISTS `ch_specifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ch_specifications` (
  `id` int NOT NULL AUTO_INCREMENT,
  `productId` int DEFAULT NULL,
  `type` text,
  `value` text,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ch_specifications`
--

LOCK TABLES `ch_specifications` WRITE;
/*!40000 ALTER TABLE `ch_specifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `ch_specifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Ch_Super_Categories`
--

DROP TABLE IF EXISTS `Ch_Super_Categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Ch_Super_Categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) DEFAULT NULL,
  `CategoryId` int DEFAULT NULL,
  `Slug` text,
  `Sequence` int DEFAULT NULL,
  `Status` tinyint(1) DEFAULT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `keyword` text,
  `description` text,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Ch_Super_Categories`
--

LOCK TABLES `Ch_Super_Categories` WRITE;
/*!40000 ALTER TABLE `Ch_Super_Categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `Ch_Super_Categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chit_seller_contacts`
--

DROP TABLE IF EXISTS `chit_seller_contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chit_seller_contacts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `FULLNAME` varchar(255) DEFAULT NULL,
  `EMAIL` varchar(255) DEFAULT NULL,
  `PHONENO` int DEFAULT NULL,
  `MESSAGE` text,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chit_seller_contacts`
--

LOCK TABLES `chit_seller_contacts` WRITE;
/*!40000 ALTER TABLE `chit_seller_contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `chit_seller_contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collections`
--

DROP TABLE IF EXISTS `collections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `collections` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `sequence` int DEFAULT NULL,
  `banner` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `keyword` text,
  `desc` text,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collections`
--

LOCK TABLES `collections` WRITE;
/*!40000 ALTER TABLE `collections` DISABLE KEYS */;
/*!40000 ALTER TABLE `collections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `role` enum('0','1') DEFAULT '0' COMMENT '0 (ecomm), 1 (salon)',
  `password` varchar(255) DEFAULT NULL,
  `userid` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `verify` tinyint(1) DEFAULT NULL,
  `verf_key` varchar(255) DEFAULT NULL,
  `attempt` int DEFAULT NULL,
  `loggedOutAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `collectionId` int DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `keyword` text,
  `desc` text,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locations`
--

DROP TABLE IF EXISTS `locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `locations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `status` enum('active','inactive') DEFAULT 'active',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `zipcode` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locations`
--

LOCK TABLES `locations` WRITE;
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
/*!40000 ALTER TABLE `locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Order_Details_Statuses`
--

DROP TABLE IF EXISTS `Order_Details_Statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Order_Details_Statuses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `status` tinyint(1) DEFAULT NULL,
  `custId` int DEFAULT NULL,
  `orderId` int DEFAULT NULL,
  `productId` int DEFAULT NULL,
  `issue` varchar(255) DEFAULT NULL,
  `comment` text,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Order_Details_Statuses`
--

LOCK TABLES `Order_Details_Statuses` WRITE;
/*!40000 ALTER TABLE `Order_Details_Statuses` DISABLE KEYS */;
/*!40000 ALTER TABLE `Order_Details_Statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OrderNotifications`
--

DROP TABLE IF EXISTS `OrderNotifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `OrderNotifications` (
  `id` int NOT NULL AUTO_INCREMENT,
  `orderId` int DEFAULT NULL,
  `userId` int DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OrderNotifications`
--

LOCK TABLES `OrderNotifications` WRITE;
/*!40000 ALTER TABLE `OrderNotifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `OrderNotifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Orders`
--

DROP TABLE IF EXISTS `Orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `custId` int DEFAULT NULL,
  `number` varchar(255) DEFAULT NULL,
  `paymentmethod` varchar(255) DEFAULT NULL,
  `grandtotal` int DEFAULT NULL,
  `status` enum('processing','shipping','delieverd','cancel') DEFAULT 'processing',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `deliverydate` datetime DEFAULT NULL,
  `addressId` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Orders`
--

LOCK TABLES `Orders` WRITE;
/*!40000 ALTER TABLE `Orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `Orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ProductOffers`
--

DROP TABLE IF EXISTS `ProductOffers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ProductOffers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `productId` int DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `discount_per` varchar(255) DEFAULT NULL,
  `discount_price` float DEFAULT NULL,
  `qty` int DEFAULT NULL,
  `total` float DEFAULT NULL,
  `net_price` float DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ProductOffers`
--

LOCK TABLES `ProductOffers` WRITE;
/*!40000 ALTER TABLE `ProductOffers` DISABLE KEYS */;
/*!40000 ALTER TABLE `ProductOffers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productphotos`
--

DROP TABLE IF EXISTS `productphotos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productphotos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `productId` int DEFAULT NULL,
  `imgUrl` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `varientId` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productphotos`
--

LOCK TABLES `productphotos` WRITE;
/*!40000 ALTER TABLE `productphotos` DISABLE KEYS */;
/*!40000 ALTER TABLE `productphotos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `categoryId` int DEFAULT NULL,
  `subCategoryId` int DEFAULT NULL,
  `childCategoryId` int DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `brand` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `desc` text,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `brandId` int DEFAULT NULL,
  `SellerId` int DEFAULT NULL,
  `LocalDeiveryCharge` double DEFAULT NULL,
  `ZonalDeiveryCharge` double DEFAULT NULL,
  `NationalDeiveryCharge` double DEFAULT NULL,
  `WarrantyType` enum('Local','No','International','100% orginal','Brand','Seller') DEFAULT '100% orginal',
  `WarrantyPeriod` varchar(255) DEFAULT NULL,
  `PubilshStatus` enum('Pending','Processing','Unpublished','Published') DEFAULT 'Pending',
  `ShippingDays` varchar(255) DEFAULT NULL,
  `HighLightDetail` json DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ProductVariants`
--

DROP TABLE IF EXISTS `ProductVariants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ProductVariants` (
  `id` int NOT NULL AUTO_INCREMENT,
  `productId` int DEFAULT NULL,
  `productCode` varchar(10) NOT NULL,
  `distributorPrice` double NOT NULL,
  `marginPer` int DEFAULT NULL,
  `marginPrice` double DEFAULT NULL,
  `buyerPrice` double NOT NULL,
  `sellerPrice` double NOT NULL,
  `unitSize` varchar(255) DEFAULT NULL,
  `qty` int NOT NULL,
  `discountPer` int DEFAULT NULL,
  `discount` double DEFAULT NULL,
  `total` double DEFAULT NULL,
  `netPrice` int DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `productName` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `Available` tinyint(1) DEFAULT NULL,
  `actualPrice` double DEFAULT NULL,
  `colorId` int DEFAULT NULL,
  `brandId` int DEFAULT NULL,
  `longDesc` text,
  `shortDesc` text,
  `thumbnail` text,
  `youTubeUrl` text,
  `stockType` tinyint(1) DEFAULT '0',
  `refundable` tinyint(1) DEFAULT '1',
  `qtyWarning` int DEFAULT NULL,
  `COD` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `productCode` (`productCode`),
  KEY `productId` (`productId`),
  CONSTRAINT `productvariants_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ProductVariants`
--

LOCK TABLES `ProductVariants` WRITE;
/*!40000 ALTER TABLE `ProductVariants` DISABLE KEYS */;
/*!40000 ALTER TABLE `ProductVariants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Seo_Details`
--

DROP TABLE IF EXISTS `Seo_Details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Seo_Details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `productId` int DEFAULT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_keyword` text,
  `meta_desc` text,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Seo_Details`
--

LOCK TABLES `Seo_Details` WRITE;
/*!40000 ALTER TABLE `Seo_Details` DISABLE KEYS */;
/*!40000 ALTER TABLE `Seo_Details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SequelizeMeta`
--

DROP TABLE IF EXISTS `SequelizeMeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SequelizeMeta` (
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`name`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SequelizeMeta`
--

LOCK TABLES `SequelizeMeta` WRITE;
/*!40000 ALTER TABLE `SequelizeMeta` DISABLE KEYS */;
INSERT INTO `SequelizeMeta` VALUES ('20200613173828-create-user.js'),('20200621141549-create-category.js'),('20200622174557-add-column-user.js'),('20200708120626-create-product-offer.js'),('20200713195253-create-sub-category.js'),('20200717174011-create-sub-child-category.js'),('20200730084936-add-column-category.js'),('20200730184103-create-productphoto.js'),('20200804102505-create-location.js'),('20200804102730-create-area.js'),('20200809045756-create-product.js'),('20200811181939-add-column-product.js'),('20200903150938-create-address.js'),('20200904052351-create-order.js'),('20200906050310-add-column-address.js'),('20200906064257-create-customer.js'),('20200908052854-add-column-order.js'),('20201110045138-add-column-product.js'),('20201215203744-column-add-subcategory.js'),('20210109223021-create-vendor.js'),('20210109223242-create-vendor-product.js'),('20210111184629-add-column-location.js'),('20210111184635-add-column-area.js'),('20210111200003-create-vendor-area.js'),('20210209202536-add-column-customer.js'),('20210209202809-add-column-customer.js'),('20210213065805-add-column-Address.js'),('20210213195533-create-chit-seller-contact.js'),('20210307144901-add-column-category.js'),('20210314113609-create-product-variant.js'),('20210314120547-modify_fields_product.js'),('20210320073800-add-column-productvarient.js'),('20210323082237-create-cart-detail.js'),('20210329160910-create-order-notification.js'),('20210330182044-create-banner-detail.js'),('20210412201046-add-column-orders.js'),('20210413185147-create-order-details-status.js'),('20210430054259-add-column-ProductVarient.js'),('20210430084127-create-seo-details.js'),('20210523034202-add-column-productphoto.js'),('20210531025218-add-column-BannerDetails.js'),('20210602063133-create-ch-brand-detail.js'),('20210603024445-add-column-product.js'),('20210613082745-create-ch-salon-category.js'),('20210613202308-create-ch-salon-service.js'),('20210623054058-create-ch-salon-owner.js'),('20210623061737-create-ch-salon-detail.js'),('20210623062907-create-ch-salon-price-detail.js'),('20210627090107-create-ch-parlour-cat-detail.js'),('20210627093644-add-column-price-detail.js'),('20210707122859-add-column-category.js'),('20210801170616-add-column-salondetail.js'),('20210812163925-create-ch-salon-order-service-list.js'),('20210812164206-create-ch-salon-order-list.js'),('20210816175818-add-column-brand.js'),('20210817041305-add-column-productvarient.js'),('20210829163901-add-column-user.js'),('20210904194210-create-ch-seller-shopdetail.js'),('20210912092102-create-ch-color-detail.js'),('20210918021643-create-ch-city.js'),('20210921190702-alter-column-prductvarient.js'),('20210922024256-create-ch-specification.js'),('20210925072851-create-ch-coupon-detail.js'),('20210925174546-create-ch-super-category.js'),('20211002151600-add-column-productvarient.js'),('20211028175147-add-column-brand-detail.js'),('20211128053928-add-column-supercategory.js'),('20211212101810-add-column-subchildcategory.js'),('20220113200510-add-column-salon-price-detail.js'),('20220208150115-add-colulmn-salon-order.js'),('20220211124022-add-column-customer.js'),('20220301034942-add-column-banner.js'),('20220306163710-create-collection.js'),('20220306180424-create-item.js'),('20220331064915-create-ch-flash-sale.js'),('20220331103949-create-ch-flash-sale-item.js');
/*!40000 ALTER TABLE `SequelizeMeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SubCategories`
--

DROP TABLE IF EXISTS `SubCategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SubCategories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `categoryId` int DEFAULT NULL,
  `sub_name` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `keyword` varchar(255) DEFAULT NULL,
  `desc` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SubCategories`
--

LOCK TABLES `SubCategories` WRITE;
/*!40000 ALTER TABLE `SubCategories` DISABLE KEYS */;
INSERT INTO `SubCategories` VALUES (1,1,'pulse','2022-04-02 03:27:18','2022-04-02 03:27:18',NULL,NULL,'grocery','<p>asdf</p>');
/*!40000 ALTER TABLE `SubCategories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SubChildCategories`
--

DROP TABLE IF EXISTS `SubChildCategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SubChildCategories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `categoryId` int DEFAULT NULL,
  `subcategoryId` int DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `keyword` text,
  `desc` text,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SubChildCategories`
--

LOCK TABLES `SubChildCategories` WRITE;
/*!40000 ALTER TABLE `SubChildCategories` DISABLE KEYS */;
INSERT INTO `SubChildCategories` VALUES (1,'rahar daal',1,1,NULL,NULL,NULL,'2022-04-02 03:31:54','2022-04-02 03:31:54');
/*!40000 ALTER TABLE `SubChildCategories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `verify` tinyint(1) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `role` varchar(255) DEFAULT NULL,
  `attempt` int DEFAULT NULL,
  `loggedOutAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'abhinash','kumar','beta-1,a-95','pandit.bechu@gmail.com',NULL,1,'$2a$10$05/HP9pi1lZ6Azz3aikyPOn5a.MbyyHBomI1/W50mA9gsdjUeK3nm','2022-04-02 03:12:19','2022-04-02 03:12:33','admin',0,NULL),(2,'abhinash','kumar','beta-1,a-95','pandit.bechu@gmail.com',NULL,1,'$2a$10$ik9Ixbdr3A48cy96CVgkDu3F7Z8qljeJD52Ya8GxdqR1oo0x2sWRm','2022-04-02 03:33:42','2022-04-02 03:33:53','seller',0,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendor_areas`
--

DROP TABLE IF EXISTS `vendor_areas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendor_areas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `vendorId` int DEFAULT NULL,
  `areaId` int DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendor_areas`
--

LOCK TABLES `vendor_areas` WRITE;
/*!40000 ALTER TABLE `vendor_areas` DISABLE KEYS */;
/*!40000 ALTER TABLE `vendor_areas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendor_products`
--

DROP TABLE IF EXISTS `vendor_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendor_products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `supplierId` int DEFAULT NULL,
  `productId` int DEFAULT NULL,
  `price` int DEFAULT NULL,
  `unitSize` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendor_products`
--

LOCK TABLES `vendor_products` WRITE;
/*!40000 ALTER TABLE `vendor_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `vendor_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendors`
--

DROP TABLE IF EXISTS `vendors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendors` (
  `id` int NOT NULL AUTO_INCREMENT,
  `storename` varchar(255) DEFAULT NULL,
  `status` enum('active','inactive') DEFAULT 'active',
  `shopaddress` text,
  `shopdesc` text,
  `ownername` varchar(255) DEFAULT NULL,
  `owneraddress` text,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phone` text,
  `areaId` int DEFAULT NULL,
  `accountNo` varchar(255) DEFAULT NULL,
  `accountHolderName` varchar(255) DEFAULT NULL,
  `IFSC` varchar(255) DEFAULT NULL,
  `bankName` varchar(255) DEFAULT NULL,
  `branch` varchar(255) DEFAULT NULL,
  `adharCardNo` varchar(255) DEFAULT NULL,
  `panCardNo` varchar(255) DEFAULT NULL,
  `GSTNo` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendors`
--

LOCK TABLES `vendors` WRITE;
/*!40000 ALTER TABLE `vendors` DISABLE KEYS */;
/*!40000 ALTER TABLE `vendors` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-15 11:12:33
