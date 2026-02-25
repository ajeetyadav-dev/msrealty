-- MySQL dump 10.13  Distrib 8.4.4, for macos15 (arm64)
--
-- Host: 127.0.0.1    Database: flex_home
-- ------------------------------------------------------
-- Server version	8.4.4

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
-- Table structure for table `activations`
--

DROP TABLE IF EXISTS `activations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `code` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `completed` tinyint(1) NOT NULL DEFAULT '0',
  `completed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `activations_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activations`
--

LOCK TABLES `activations` WRITE;
/*!40000 ALTER TABLE `activations` DISABLE KEYS */;
INSERT INTO `activations` VALUES (1,1,'lpBHE1f92tIFDtMbsh1L6xv1DG3Ve5Ko',1,'2025-12-20 05:59:31','2025-12-20 05:59:31','2025-12-20 05:59:31');
/*!40000 ALTER TABLE `activations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_notifications`
--

DROP TABLE IF EXISTS `admin_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_notifications` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `action_label` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `action_url` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `permission` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_notifications`
--

LOCK TABLES `admin_notifications` WRITE;
/*!40000 ALTER TABLE `admin_notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ads`
--

DROP TABLE IF EXISTS `ads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ads` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expired_at` datetime DEFAULT NULL,
  `location` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `key` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `clicked` bigint NOT NULL DEFAULT '0',
  `order` int DEFAULT '0',
  `status` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `open_in_new_tab` tinyint(1) NOT NULL DEFAULT '1',
  `tablet_image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile_image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ads_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `google_adsense_slot_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ads_key_unique` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ads`
--

LOCK TABLES `ads` WRITE;
/*!40000 ALTER TABLE `ads` DISABLE KEYS */;
/*!40000 ALTER TABLE `ads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ads_translations`
--

DROP TABLE IF EXISTS `ads_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ads_translations` (
  `lang_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ads_id` bigint unsigned NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tablet_image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile_image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`ads_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ads_translations`
--

LOCK TABLES `ads_translations` WRITE;
/*!40000 ALTER TABLE `ads_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ads_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `announcements`
--

DROP TABLE IF EXISTS `announcements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `announcements` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `has_action` tinyint(1) NOT NULL DEFAULT '0',
  `action_label` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `action_url` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `action_open_new_tab` tinyint(1) NOT NULL DEFAULT '0',
  `dismissible` tinyint(1) NOT NULL DEFAULT '0',
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `announcements`
--

LOCK TABLES `announcements` WRITE;
/*!40000 ALTER TABLE `announcements` DISABLE KEYS */;
INSERT INTO `announcements` VALUES (1,'Announcement 1','Explore Our Exciting New Property Listings Now Available in Prime Locations!',0,NULL,NULL,0,1,'2025-12-20 12:59:44',NULL,1,'2025-12-20 05:59:44','2025-12-20 05:59:44'),(2,'Announcement 2','Join Us for Exclusive Open House Events This Weekend and Find Your Perfect Home!',0,NULL,NULL,0,1,'2025-12-20 12:59:44',NULL,1,'2025-12-20 05:59:44','2025-12-20 05:59:44'),(3,'Announcement 3','Take Advantage of Limited-Time Offers on Luxury Homes with Stunning Features!',0,NULL,NULL,0,1,'2025-12-20 12:59:44',NULL,1,'2025-12-20 05:59:44','2025-12-20 05:59:44'),(4,'Announcement 4','Discover Your Dream Home with Our Latest Listings and Personalized Services!',0,NULL,NULL,0,1,'2025-12-20 12:59:44',NULL,1,'2025-12-20 05:59:44','2025-12-20 05:59:44');
/*!40000 ALTER TABLE `announcements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `announcements_translations`
--

DROP TABLE IF EXISTS `announcements_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `announcements_translations` (
  `lang_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `announcements_id` bigint unsigned NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `action_label` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`announcements_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `announcements_translations`
--

LOCK TABLES `announcements_translations` WRITE;
/*!40000 ALTER TABLE `announcements_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `announcements_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audit_histories`
--

DROP TABLE IF EXISTS `audit_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `audit_histories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `user_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'Botble\\ACL\\Models\\User',
  `module` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `request` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `action` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_agent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `ip_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `actor_id` bigint unsigned NOT NULL,
  `actor_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'Botble\\ACL\\Models\\User',
  `reference_id` bigint unsigned NOT NULL,
  `reference_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `audit_histories_user_id_index` (`user_id`),
  KEY `audit_histories_module_index` (`module`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit_histories`
--

LOCK TABLES `audit_histories` WRITE;
/*!40000 ALTER TABLE `audit_histories` DISABLE KEYS */;
/*!40000 ALTER TABLE `audit_histories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache` (
  `key` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache`
--

LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache_locks` (
  `key` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_locks`
--

LOCK TABLES `cache_locks` WRITE;
/*!40000 ALTER TABLE `cache_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `careers`
--

DROP TABLE IF EXISTS `careers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `careers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `salary` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `careers`
--

LOCK TABLES `careers` WRITE;
/*!40000 ALTER TABLE `careers` DISABLE KEYS */;
INSERT INTO `careers` VALUES (1,'Senior Full Stack Engineer, Creator Success Full Time','Mableport, Sudan','$1,517','Constantly changing work patterns and norms, and the need for organizational resiliency','<h4 class=\"color-brand-1\">Responsibilities</h4>\n<p>Product knowledge: Deeply understand the technology and features of the product area to which you are assigned.</p>\n<p>Research: Provide human and business impact and insights for products.</p>\n<p>Deliverables: Create deliverables for your product area (for example competitive analyses, user flows, low fidelity wireframes, high fidelity mockups, prototypes, etc.) that solve real user problems through the user experience.</p>\n<p>Communication: Communicate the results of UX activities within your product area to the design team department, cross-functional partners within your product area, and other interested Superformula team members using clear language that simplifies complexity.</p>\n<h4 class=\"color-brand-1\">Requirements</h4>\n<ul>\n    <li>A portfolio demonstrating well thought through and polished end to end customer journeys</li>\n    <li>5+ years of industry experience in interactive design and / or visual design</li>\n    <li>Excellent interpersonal skills </li>\n    <li>Aware of trends in mobile, communications, and collaboration</li>\n    <li>Ability to create highly polished design prototypes, mockups, and other communication artifacts</li>\n    <li>The ability to scope and estimate efforts accurately and prioritize tasks and goals independently</li>\n    <li>History of impacting shipping products with your work</li>\n    <li>A Bachelor’s Degree in Design (or related field) or equivalent professional experience</li>\n    <li>Proficiency in a variety of design tools such as Figma, Photoshop, Illustrator, and Sketch</li>\n</ul>\n<h4 class=\"color-brand-1\">What\'s on Offer </h4>\n<ul>\n    <li>Annual bonus and holidays, social welfare, and health checks.</li>\n    <li>Training and attachment in Taiwan and other Greater China branches.</li>\n</ul>\n','published','2025-10-20 17:21:26','2025-10-20 17:21:26'),(2,'Data Science Specialist, Analytics Division','New Isidrobury, Denmark','$6,381','Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit laborum — semper quis lectus nulla','<h4 class=\"color-brand-1\">Responsibilities</h4>\n<p>Product knowledge: Deeply understand the technology and features of the product area to which you are assigned.</p>\n<p>Research: Provide human and business impact and insights for products.</p>\n<p>Deliverables: Create deliverables for your product area (for example competitive analyses, user flows, low fidelity wireframes, high fidelity mockups, prototypes, etc.) that solve real user problems through the user experience.</p>\n<p>Communication: Communicate the results of UX activities within your product area to the design team department, cross-functional partners within your product area, and other interested Superformula team members using clear language that simplifies complexity.</p>\n<h4 class=\"color-brand-1\">Requirements</h4>\n<ul>\n    <li>A portfolio demonstrating well thought through and polished end to end customer journeys</li>\n    <li>5+ years of industry experience in interactive design and / or visual design</li>\n    <li>Excellent interpersonal skills </li>\n    <li>Aware of trends in mobile, communications, and collaboration</li>\n    <li>Ability to create highly polished design prototypes, mockups, and other communication artifacts</li>\n    <li>The ability to scope and estimate efforts accurately and prioritize tasks and goals independently</li>\n    <li>History of impacting shipping products with your work</li>\n    <li>A Bachelor’s Degree in Design (or related field) or equivalent professional experience</li>\n    <li>Proficiency in a variety of design tools such as Figma, Photoshop, Illustrator, and Sketch</li>\n</ul>\n<h4 class=\"color-brand-1\">What\'s on Offer </h4>\n<ul>\n    <li>Annual bonus and holidays, social welfare, and health checks.</li>\n    <li>Training and attachment in Taiwan and other Greater China branches.</li>\n</ul>\n','published','2025-10-20 17:21:26','2025-10-20 17:21:26'),(3,'Product Marketing Manager, Growth Team','Jeanetteside, Mali','$925','Crafting compelling marketing strategies to drive user acquisition and retention','<h4 class=\"color-brand-1\">Responsibilities</h4>\n<p>Product knowledge: Deeply understand the technology and features of the product area to which you are assigned.</p>\n<p>Research: Provide human and business impact and insights for products.</p>\n<p>Deliverables: Create deliverables for your product area (for example competitive analyses, user flows, low fidelity wireframes, high fidelity mockups, prototypes, etc.) that solve real user problems through the user experience.</p>\n<p>Communication: Communicate the results of UX activities within your product area to the design team department, cross-functional partners within your product area, and other interested Superformula team members using clear language that simplifies complexity.</p>\n<h4 class=\"color-brand-1\">Requirements</h4>\n<ul>\n    <li>A portfolio demonstrating well thought through and polished end to end customer journeys</li>\n    <li>5+ years of industry experience in interactive design and / or visual design</li>\n    <li>Excellent interpersonal skills </li>\n    <li>Aware of trends in mobile, communications, and collaboration</li>\n    <li>Ability to create highly polished design prototypes, mockups, and other communication artifacts</li>\n    <li>The ability to scope and estimate efforts accurately and prioritize tasks and goals independently</li>\n    <li>History of impacting shipping products with your work</li>\n    <li>A Bachelor’s Degree in Design (or related field) or equivalent professional experience</li>\n    <li>Proficiency in a variety of design tools such as Figma, Photoshop, Illustrator, and Sketch</li>\n</ul>\n<h4 class=\"color-brand-1\">What\'s on Offer </h4>\n<ul>\n    <li>Annual bonus and holidays, social welfare, and health checks.</li>\n    <li>Training and attachment in Taiwan and other Greater China branches.</li>\n</ul>\n','published','2025-10-20 17:21:26','2025-10-20 17:21:26'),(4,'UX/UI Designer, User Experience Team','Roweport, Pakistan','$4,214','Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.','<h4 class=\"color-brand-1\">Responsibilities</h4>\n<p>Product knowledge: Deeply understand the technology and features of the product area to which you are assigned.</p>\n<p>Research: Provide human and business impact and insights for products.</p>\n<p>Deliverables: Create deliverables for your product area (for example competitive analyses, user flows, low fidelity wireframes, high fidelity mockups, prototypes, etc.) that solve real user problems through the user experience.</p>\n<p>Communication: Communicate the results of UX activities within your product area to the design team department, cross-functional partners within your product area, and other interested Superformula team members using clear language that simplifies complexity.</p>\n<h4 class=\"color-brand-1\">Requirements</h4>\n<ul>\n    <li>A portfolio demonstrating well thought through and polished end to end customer journeys</li>\n    <li>5+ years of industry experience in interactive design and / or visual design</li>\n    <li>Excellent interpersonal skills </li>\n    <li>Aware of trends in mobile, communications, and collaboration</li>\n    <li>Ability to create highly polished design prototypes, mockups, and other communication artifacts</li>\n    <li>The ability to scope and estimate efforts accurately and prioritize tasks and goals independently</li>\n    <li>History of impacting shipping products with your work</li>\n    <li>A Bachelor’s Degree in Design (or related field) or equivalent professional experience</li>\n    <li>Proficiency in a variety of design tools such as Figma, Photoshop, Illustrator, and Sketch</li>\n</ul>\n<h4 class=\"color-brand-1\">What\'s on Offer </h4>\n<ul>\n    <li>Annual bonus and holidays, social welfare, and health checks.</li>\n    <li>Training and attachment in Taiwan and other Greater China branches.</li>\n</ul>\n','published','2025-10-20 17:21:26','2025-10-20 17:21:26'),(5,'Operations Manager, Supply Chain Division','West Ardith, Nepal','$8,335','Ensuring smooth and efficient supply chain operations for timely product delivery','<h4 class=\"color-brand-1\">Responsibilities</h4>\n<p>Product knowledge: Deeply understand the technology and features of the product area to which you are assigned.</p>\n<p>Research: Provide human and business impact and insights for products.</p>\n<p>Deliverables: Create deliverables for your product area (for example competitive analyses, user flows, low fidelity wireframes, high fidelity mockups, prototypes, etc.) that solve real user problems through the user experience.</p>\n<p>Communication: Communicate the results of UX activities within your product area to the design team department, cross-functional partners within your product area, and other interested Superformula team members using clear language that simplifies complexity.</p>\n<h4 class=\"color-brand-1\">Requirements</h4>\n<ul>\n    <li>A portfolio demonstrating well thought through and polished end to end customer journeys</li>\n    <li>5+ years of industry experience in interactive design and / or visual design</li>\n    <li>Excellent interpersonal skills </li>\n    <li>Aware of trends in mobile, communications, and collaboration</li>\n    <li>Ability to create highly polished design prototypes, mockups, and other communication artifacts</li>\n    <li>The ability to scope and estimate efforts accurately and prioritize tasks and goals independently</li>\n    <li>History of impacting shipping products with your work</li>\n    <li>A Bachelor’s Degree in Design (or related field) or equivalent professional experience</li>\n    <li>Proficiency in a variety of design tools such as Figma, Photoshop, Illustrator, and Sketch</li>\n</ul>\n<h4 class=\"color-brand-1\">What\'s on Offer </h4>\n<ul>\n    <li>Annual bonus and holidays, social welfare, and health checks.</li>\n    <li>Training and attachment in Taiwan and other Greater China branches.</li>\n</ul>\n','published','2025-10-20 17:21:26','2025-10-20 17:21:26'),(6,'Financial Analyst, Investment Group','Port Jerod, Libyan Arab Jamahiriya','$2,963','Analyzing market trends and investment opportunities for optimal financial outcomes','<h4 class=\"color-brand-1\">Responsibilities</h4>\n<p>Product knowledge: Deeply understand the technology and features of the product area to which you are assigned.</p>\n<p>Research: Provide human and business impact and insights for products.</p>\n<p>Deliverables: Create deliverables for your product area (for example competitive analyses, user flows, low fidelity wireframes, high fidelity mockups, prototypes, etc.) that solve real user problems through the user experience.</p>\n<p>Communication: Communicate the results of UX activities within your product area to the design team department, cross-functional partners within your product area, and other interested Superformula team members using clear language that simplifies complexity.</p>\n<h4 class=\"color-brand-1\">Requirements</h4>\n<ul>\n    <li>A portfolio demonstrating well thought through and polished end to end customer journeys</li>\n    <li>5+ years of industry experience in interactive design and / or visual design</li>\n    <li>Excellent interpersonal skills </li>\n    <li>Aware of trends in mobile, communications, and collaboration</li>\n    <li>Ability to create highly polished design prototypes, mockups, and other communication artifacts</li>\n    <li>The ability to scope and estimate efforts accurately and prioritize tasks and goals independently</li>\n    <li>History of impacting shipping products with your work</li>\n    <li>A Bachelor’s Degree in Design (or related field) or equivalent professional experience</li>\n    <li>Proficiency in a variety of design tools such as Figma, Photoshop, Illustrator, and Sketch</li>\n</ul>\n<h4 class=\"color-brand-1\">What\'s on Offer </h4>\n<ul>\n    <li>Annual bonus and holidays, social welfare, and health checks.</li>\n    <li>Training and attachment in Taiwan and other Greater China branches.</li>\n</ul>\n','published','2025-10-20 17:21:26','2025-10-20 17:21:26');
/*!40000 ALTER TABLE `careers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `careers_translations`
--

DROP TABLE IF EXISTS `careers_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `careers_translations` (
  `lang_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `careers_id` bigint unsigned NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `salary` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`careers_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `careers_translations`
--

LOCK TABLES `careers_translations` WRITE;
/*!40000 ALTER TABLE `careers_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `careers_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` bigint unsigned NOT NULL DEFAULT '0',
  `description` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `author_id` bigint unsigned DEFAULT NULL,
  `author_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Botble\\ACL\\Models\\User',
  `icon` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int unsigned NOT NULL DEFAULT '0',
  `is_featured` tinyint NOT NULL DEFAULT '0',
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `categories_parent_id_index` (`parent_id`),
  KEY `categories_status_index` (`status`),
  KEY `categories_created_at_index` (`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'News',0,'Stay updated with the latest real estate news, market trends, and industry developments.','published',1,'Botble\\ACL\\Models\\User',NULL,0,1,0,'2025-12-20 05:59:35','2025-12-20 05:59:35'),(2,'House architecture',0,'Explore innovative architectural designs and modern building concepts for your dream home.','published',1,'Botble\\ACL\\Models\\User',NULL,0,1,0,'2025-12-20 05:59:35','2025-12-20 05:59:35'),(3,'House design',0,'Discover creative interior and exterior design ideas to transform your living spaces.','published',1,'Botble\\ACL\\Models\\User',NULL,0,1,0,'2025-12-20 05:59:35','2025-12-20 05:59:35'),(4,'Building materials',0,'Learn about sustainable and quality building materials for construction projects.','published',1,'Botble\\ACL\\Models\\User',NULL,0,1,0,'2025-12-20 05:59:35','2025-12-20 05:59:35');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories_translations`
--

DROP TABLE IF EXISTS `categories_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories_translations` (
  `lang_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `categories_id` bigint unsigned NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`categories_id`),
  KEY `idx_categories_trans_categories_id` (`categories_id`),
  KEY `idx_categories_trans_category_lang` (`categories_id`,`lang_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories_translations`
--

LOCK TABLES `categories_translations` WRITE;
/*!40000 ALTER TABLE `categories_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `categories_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cities` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state_id` bigint unsigned DEFAULT NULL,
  `country_id` bigint unsigned DEFAULT NULL,
  `record_id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `status` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `zip_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cities_slug_unique` (`slug`),
  KEY `idx_cities_name` (`name`),
  KEY `idx_cities_state_status` (`state_id`,`status`),
  KEY `idx_cities_status` (`status`),
  KEY `idx_cities_state_id` (`state_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities`
--

LOCK TABLES `cities` WRITE;
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
INSERT INTO `cities` VALUES (1,'Paris','paris',1,1,NULL,0,'locations/4.jpg',0,'published','2025-10-20 17:21:11','2025-10-20 17:21:11',NULL),(2,'London','london',2,2,NULL,0,'locations/1.jpg',0,'published','2025-10-20 17:21:11','2025-10-20 17:21:11',NULL),(3,'New York City','new-york-city',3,3,NULL,0,'locations/4.jpg',0,'published','2025-10-20 17:21:11','2025-10-20 17:21:11',NULL),(4,'Amsterdam','amsterdam',4,4,NULL,0,'locations/3.jpg',0,'published','2025-10-20 17:21:11','2025-10-20 17:21:11',NULL),(5,'Copenhagen','copenhagen',5,5,NULL,0,'locations/3.jpg',0,'published','2025-10-20 17:21:11','2025-10-20 17:21:11',NULL),(6,'Munich','munich',6,6,NULL,0,'locations/2.jpg',0,'published','2025-10-20 17:21:11','2025-10-20 17:21:11',NULL),(7,'Tokyo','tokyo',7,7,NULL,0,'locations/4.jpg',0,'published','2025-10-20 17:21:11','2025-10-20 17:21:11',NULL),(8,'Toronto','toronto',8,8,NULL,0,'locations/2.jpg',0,'published','2025-10-20 17:21:11','2025-10-20 17:21:11',NULL),(9,'Sydney','sydney',9,9,NULL,0,'locations/3.jpg',0,'published','2025-10-20 17:21:11','2025-10-20 17:21:11',NULL),(10,'Milan','milan',10,10,NULL,0,'locations/1.jpg',0,'published','2025-10-20 17:21:11','2025-10-20 17:21:11',NULL),(11,'Los Angeles','los-angeles',11,3,NULL,0,'locations/3.jpg',0,'published','2025-10-20 17:21:11','2025-10-20 17:21:11',NULL),(12,'Berlin','berlin',12,6,NULL,0,'locations/4.jpg',0,'published','2025-10-20 17:21:11','2025-10-20 17:21:11',NULL),(13,'Osaka','osaka',13,7,NULL,0,'locations/1.jpg',0,'published','2025-10-20 17:21:11','2025-10-20 17:21:11',NULL),(14,'Vancouver','vancouver',14,8,NULL,0,'locations/2.jpg',0,'published','2025-10-20 17:21:11','2025-10-20 17:21:11',NULL),(15,'Melbourne','melbourne',15,9,NULL,0,'locations/2.jpg',0,'published','2025-10-20 17:21:11','2025-10-20 17:21:11',NULL),(16,'Rome','rome',16,10,NULL,0,'locations/2.jpg',0,'published','2025-10-20 17:21:11','2025-10-20 17:21:11',NULL),(17,'Marseille','marseille',17,1,NULL,0,'locations/3.jpg',0,'published','2025-10-20 17:21:11','2025-10-20 17:21:11',NULL),(18,'Liverpool','liverpool',18,2,NULL,0,'locations/5.jpg',0,'published','2025-10-20 17:21:11','2025-10-20 17:21:11',NULL),(19,'Chicago','chicago',19,3,NULL,0,'locations/1.jpg',0,'published','2025-10-20 17:21:11','2025-10-20 17:21:11',NULL),(20,'Rotterdam','rotterdam',20,4,NULL,0,'locations/5.jpg',0,'published','2025-10-20 17:21:11','2025-10-20 17:21:11',NULL),(21,'Aarhus','aarhus',21,5,NULL,0,'locations/1.jpg',0,'published','2025-10-20 17:21:11','2025-10-20 17:21:11',NULL),(22,'Frankfurt','frankfurt',22,6,NULL,0,'locations/3.jpg',0,'published','2025-10-20 17:21:11','2025-10-20 17:21:11',NULL),(23,'Kyoto','kyoto',23,7,NULL,0,'locations/3.jpg',0,'published','2025-10-20 17:21:11','2025-10-20 17:21:11',NULL),(24,'Montreal','montreal',24,8,NULL,0,'locations/5.jpg',0,'published','2025-10-20 17:21:11','2025-10-20 17:21:11',NULL),(25,'Brisbane','brisbane',25,9,NULL,0,'locations/2.jpg',0,'published','2025-10-20 17:21:11','2025-10-20 17:21:11',NULL),(26,'Naples','naples',26,10,NULL,0,'locations/1.jpg',0,'published','2025-10-20 17:21:11','2025-10-20 17:21:11',NULL);
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cities_translations`
--

DROP TABLE IF EXISTS `cities_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cities_translations` (
  `lang_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `cities_id` bigint unsigned NOT NULL,
  `name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`cities_id`),
  KEY `idx_cities_trans_city_lang` (`cities_id`,`lang_code`),
  KEY `idx_cities_trans_name` (`name`),
  KEY `idx_cities_trans_cities_id` (`cities_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities_translations`
--

LOCK TABLES `cities_translations` WRITE;
/*!40000 ALTER TABLE `cities_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `cities_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_custom_field_options`
--

DROP TABLE IF EXISTS `contact_custom_field_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_custom_field_options` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `custom_field_id` bigint unsigned NOT NULL,
  `label` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int NOT NULL DEFAULT '999',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_custom_field_options`
--

LOCK TABLES `contact_custom_field_options` WRITE;
/*!40000 ALTER TABLE `contact_custom_field_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact_custom_field_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_custom_field_options_translations`
--

DROP TABLE IF EXISTS `contact_custom_field_options_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_custom_field_options_translations` (
  `contact_custom_field_options_id` bigint unsigned NOT NULL,
  `lang_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`contact_custom_field_options_id`),
  KEY `idx_contact_cfo_trans_cfo_id` (`contact_custom_field_options_id`),
  KEY `idx_contact_cfo_trans_cfo_lang` (`contact_custom_field_options_id`,`lang_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_custom_field_options_translations`
--

LOCK TABLES `contact_custom_field_options_translations` WRITE;
/*!40000 ALTER TABLE `contact_custom_field_options_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact_custom_field_options_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_custom_fields`
--

DROP TABLE IF EXISTS `contact_custom_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_custom_fields` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `placeholder` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int NOT NULL DEFAULT '999',
  `status` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_custom_fields`
--

LOCK TABLES `contact_custom_fields` WRITE;
/*!40000 ALTER TABLE `contact_custom_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact_custom_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_custom_fields_translations`
--

DROP TABLE IF EXISTS `contact_custom_fields_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_custom_fields_translations` (
  `contact_custom_fields_id` bigint unsigned NOT NULL,
  `lang_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `placeholder` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`contact_custom_fields_id`),
  KEY `idx_contact_cf_trans_cf_id` (`contact_custom_fields_id`),
  KEY `idx_contact_cf_trans_cf_lang` (`contact_custom_fields_id`,`lang_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_custom_fields_translations`
--

LOCK TABLES `contact_custom_fields_translations` WRITE;
/*!40000 ALTER TABLE `contact_custom_fields_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact_custom_fields_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_replies`
--

DROP TABLE IF EXISTS `contact_replies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_replies` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `message` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_replies`
--

LOCK TABLES `contact_replies` WRITE;
/*!40000 ALTER TABLE `contact_replies` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact_replies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacts`
--

DROP TABLE IF EXISTS `contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contacts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `custom_fields` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unread',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts`
--

LOCK TABLES `contacts` WRITE;
/*!40000 ALTER TABLE `contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `countries` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nationality` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `status` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_countries_name` (`name`),
  KEY `idx_countries_status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` VALUES (1,'France','French',0,NULL,0,'published',NULL,NULL,'FRA'),(2,'England','English',0,NULL,0,'published',NULL,NULL,'UK'),(3,'USA','Americans',0,NULL,0,'published',NULL,NULL,'US'),(4,'Holland','Dutch',0,NULL,0,'published',NULL,NULL,'HL'),(5,'Denmark','Danish',0,NULL,0,'published',NULL,NULL,'DN'),(6,'Germany','German',0,NULL,0,'published',NULL,NULL,'DE'),(7,'Japan','Japanese',0,NULL,0,'published',NULL,NULL,'JP'),(8,'Canada','Canadian',0,NULL,0,'published',NULL,NULL,'CA'),(9,'Australia','Australian',0,NULL,0,'published',NULL,NULL,'AU'),(10,'Italy','Italian',0,NULL,0,'published',NULL,NULL,'IT');
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries_translations`
--

DROP TABLE IF EXISTS `countries_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `countries_translations` (
  `lang_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `countries_id` bigint unsigned NOT NULL,
  `name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nationality` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`countries_id`),
  KEY `idx_countries_trans_country_lang` (`countries_id`,`lang_code`),
  KEY `idx_countries_trans_name` (`name`),
  KEY `idx_countries_trans_countries_id` (`countries_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries_translations`
--

LOCK TABLES `countries_translations` WRITE;
/*!40000 ALTER TABLE `countries_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `countries_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboard_widget_settings`
--

DROP TABLE IF EXISTS `dashboard_widget_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dashboard_widget_settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `settings` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `user_id` bigint unsigned NOT NULL,
  `widget_id` bigint unsigned NOT NULL,
  `order` tinyint unsigned NOT NULL DEFAULT '0',
  `status` tinyint unsigned NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dashboard_widget_settings_user_id_index` (`user_id`),
  KEY `dashboard_widget_settings_widget_id_index` (`widget_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard_widget_settings`
--

LOCK TABLES `dashboard_widget_settings` WRITE;
/*!40000 ALTER TABLE `dashboard_widget_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `dashboard_widget_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboard_widgets`
--

DROP TABLE IF EXISTS `dashboard_widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dashboard_widgets` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard_widgets`
--

LOCK TABLES `dashboard_widgets` WRITE;
/*!40000 ALTER TABLE `dashboard_widgets` DISABLE KEYS */;
/*!40000 ALTER TABLE `dashboard_widgets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `device_tokens`
--

DROP TABLE IF EXISTS `device_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `device_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `platform` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `app_version` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `device_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `device_tokens_token_unique` (`token`),
  KEY `device_tokens_user_type_user_id_index` (`user_type`,`user_id`),
  KEY `device_tokens_platform_is_active_index` (`platform`,`is_active`),
  KEY `device_tokens_is_active_index` (`is_active`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `device_tokens`
--

LOCK TABLES `device_tokens` WRITE;
/*!40000 ALTER TABLE `device_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `device_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faq_categories`
--

DROP TABLE IF EXISTS `faq_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faq_categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `status` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `description` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faq_categories`
--

LOCK TABLES `faq_categories` WRITE;
/*!40000 ALTER TABLE `faq_categories` DISABLE KEYS */;
INSERT INTO `faq_categories` VALUES (1,'Buying',0,'published','2025-12-20 05:59:44','2025-12-20 05:59:44',NULL),(2,'Selling',1,'published','2025-12-20 05:59:44','2025-12-20 05:59:44',NULL),(3,'Renting',2,'published','2025-12-20 05:59:44','2025-12-20 05:59:44',NULL),(4,'Financing',3,'published','2025-12-20 05:59:44','2025-12-20 05:59:44',NULL);
/*!40000 ALTER TABLE `faq_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faq_categories_translations`
--

DROP TABLE IF EXISTS `faq_categories_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faq_categories_translations` (
  `lang_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `faq_categories_id` bigint unsigned NOT NULL,
  `name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`faq_categories_id`),
  KEY `idx_faq_cat_trans_faq_cat_id` (`faq_categories_id`),
  KEY `idx_faq_cat_trans_faq_cat_lang` (`faq_categories_id`,`lang_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faq_categories_translations`
--

LOCK TABLES `faq_categories_translations` WRITE;
/*!40000 ALTER TABLE `faq_categories_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `faq_categories_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faqs`
--

DROP TABLE IF EXISTS `faqs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faqs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `question` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` bigint unsigned NOT NULL,
  `status` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faqs`
--

LOCK TABLES `faqs` WRITE;
/*!40000 ALTER TABLE `faqs` DISABLE KEYS */;
INSERT INTO `faqs` VALUES (1,'What steps are involved in buying a home?','The home buying process involves several steps including getting pre-approved for a mortgage, finding a real estate agent, searching for homes, making an offer, getting a home inspection, and closing the deal.',1,'published','2025-12-20 05:59:44','2025-12-20 05:59:44'),(2,'How do I determine my budget for buying a home?','To determine your budget, consider your income, debts, and savings. It is also important to get pre-approved for a mortgage to understand how much you can borrow.',1,'published','2025-12-20 05:59:44','2025-12-20 05:59:44'),(3,'What is the process of selling a home?','Selling a home involves preparing your home for sale, setting a competitive price, marketing the property, showing the home to potential buyers, negotiating offers, and closing the sale.',1,'published','2025-12-20 05:59:44','2025-12-20 05:59:44'),(4,'How can I increase the value of my home before selling?','You can increase your home\'s value by making necessary repairs, updating outdated features, improving curb appeal, and ensuring the home is clean and well-maintained.',1,'published','2025-12-20 05:59:44','2025-12-20 05:59:44'),(5,'What should I look for in a rental property?','When looking for a rental property, consider factors such as location, rent price, amenities, lease terms, and the condition of the property. It\'s also important to understand your rights as a tenant.',1,'published','2025-12-20 05:59:44','2025-12-20 05:59:44'),(6,'What are the benefits of renting versus buying?','Renting offers flexibility and fewer maintenance responsibilities, while buying can provide long-term financial benefits and the freedom to customize your home. The decision depends on your financial situation, lifestyle, and future plans.',1,'published','2025-12-20 05:59:44','2025-12-20 05:59:44'),(7,'How do I improve my credit score for a mortgage?','To improve your credit score, pay your bills on time, reduce your debt, avoid opening new credit accounts, and check your credit report for errors.',1,'published','2025-12-20 05:59:44','2025-12-20 05:59:44'),(8,'How do I determine my budget for buying a home?','To determine your budget, consider your income, debts, and savings. It is also important to get pre-approved for a mortgage to understand how much you can borrow.',2,'published','2025-12-20 05:59:44','2025-12-20 05:59:44'),(9,'How can I increase the value of my home before selling?','You can increase your home\'s value by making necessary repairs, updating outdated features, improving curb appeal, and ensuring the home is clean and well-maintained.',2,'published','2025-12-20 05:59:44','2025-12-20 05:59:44'),(10,'What are the benefits of renting versus buying?','Renting offers flexibility and fewer maintenance responsibilities, while buying can provide long-term financial benefits and the freedom to customize your home. The decision depends on your financial situation, lifestyle, and future plans.',2,'published','2025-12-20 05:59:44','2025-12-20 05:59:44'),(11,'What types of financing options are available for homebuyers?','Common financing options include fixed-rate mortgages, adjustable-rate mortgages, FHA loans, VA loans, and USDA loans. Each has its own requirements and benefits.',2,'published','2025-12-20 05:59:44','2025-12-20 05:59:44'),(12,'How do I improve my credit score for a mortgage?','To improve your credit score, pay your bills on time, reduce your debt, avoid opening new credit accounts, and check your credit report for errors.',2,'published','2025-12-20 05:59:44','2025-12-20 05:59:44'),(13,'How do I determine my budget for buying a home?','To determine your budget, consider your income, debts, and savings. It is also important to get pre-approved for a mortgage to understand how much you can borrow.',3,'published','2025-12-20 05:59:44','2025-12-20 05:59:44'),(14,'What is the process of selling a home?','Selling a home involves preparing your home for sale, setting a competitive price, marketing the property, showing the home to potential buyers, negotiating offers, and closing the sale.',3,'published','2025-12-20 05:59:44','2025-12-20 05:59:44'),(15,'How can I increase the value of my home before selling?','You can increase your home\'s value by making necessary repairs, updating outdated features, improving curb appeal, and ensuring the home is clean and well-maintained.',3,'published','2025-12-20 05:59:44','2025-12-20 05:59:44'),(16,'What should I look for in a rental property?','When looking for a rental property, consider factors such as location, rent price, amenities, lease terms, and the condition of the property. It\'s also important to understand your rights as a tenant.',3,'published','2025-12-20 05:59:44','2025-12-20 05:59:44'),(17,'What are the benefits of renting versus buying?','Renting offers flexibility and fewer maintenance responsibilities, while buying can provide long-term financial benefits and the freedom to customize your home. The decision depends on your financial situation, lifestyle, and future plans.',3,'published','2025-12-20 05:59:44','2025-12-20 05:59:44'),(18,'What types of financing options are available for homebuyers?','Common financing options include fixed-rate mortgages, adjustable-rate mortgages, FHA loans, VA loans, and USDA loans. Each has its own requirements and benefits.',3,'published','2025-12-20 05:59:44','2025-12-20 05:59:44'),(19,'What steps are involved in buying a home?','The home buying process involves several steps including getting pre-approved for a mortgage, finding a real estate agent, searching for homes, making an offer, getting a home inspection, and closing the deal.',4,'published','2025-12-20 05:59:44','2025-12-20 05:59:44'),(20,'How do I determine my budget for buying a home?','To determine your budget, consider your income, debts, and savings. It is also important to get pre-approved for a mortgage to understand how much you can borrow.',4,'published','2025-12-20 05:59:44','2025-12-20 05:59:44'),(21,'How can I increase the value of my home before selling?','You can increase your home\'s value by making necessary repairs, updating outdated features, improving curb appeal, and ensuring the home is clean and well-maintained.',4,'published','2025-12-20 05:59:44','2025-12-20 05:59:44'),(22,'What are the benefits of renting versus buying?','Renting offers flexibility and fewer maintenance responsibilities, while buying can provide long-term financial benefits and the freedom to customize your home. The decision depends on your financial situation, lifestyle, and future plans.',4,'published','2025-12-20 05:59:44','2025-12-20 05:59:44'),(23,'How do I improve my credit score for a mortgage?','To improve your credit score, pay your bills on time, reduce your debt, avoid opening new credit accounts, and check your credit report for errors.',4,'published','2025-12-20 05:59:44','2025-12-20 05:59:44');
/*!40000 ALTER TABLE `faqs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faqs_translations`
--

DROP TABLE IF EXISTS `faqs_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faqs_translations` (
  `lang_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `faqs_id` bigint unsigned NOT NULL,
  `question` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `answer` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`faqs_id`),
  KEY `idx_faqs_trans_faqs_id` (`faqs_id`),
  KEY `idx_faqs_trans_faq_lang` (`faqs_id`,`lang_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faqs_translations`
--

LOCK TABLES `faqs_translations` WRITE;
/*!40000 ALTER TABLE `faqs_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `faqs_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `language_meta`
--

DROP TABLE IF EXISTS `language_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `language_meta` (
  `lang_meta_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `lang_meta_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lang_meta_origin` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_id` bigint unsigned NOT NULL,
  `reference_type` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`lang_meta_id`),
  KEY `language_meta_reference_id_index` (`reference_id`),
  KEY `meta_code_index` (`lang_meta_code`),
  KEY `meta_origin_index` (`lang_meta_origin`),
  KEY `meta_reference_type_index` (`reference_type`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `language_meta`
--

LOCK TABLES `language_meta` WRITE;
/*!40000 ALTER TABLE `language_meta` DISABLE KEYS */;
INSERT INTO `language_meta` VALUES (1,'en_US','5645b716600a8c2216503aaa04ab64c8',1,'Botble\\Menu\\Models\\MenuLocation'),(2,'en_US','1c4d517d0792ba58f2532ddf92a31d47',1,'Botble\\Menu\\Models\\Menu'),(3,'en_US','6a90e551bab742e883bf09aba624efea',2,'Botble\\Menu\\Models\\Menu'),(4,'en_US','8b73705ea5b93c64fa1ce5d730b1c7f6',3,'Botble\\Menu\\Models\\Menu'),(5,'en_US','a91d8a1af37cf8210f8ea307176898d3',4,'Botble\\Menu\\Models\\Menu');
/*!40000 ALTER TABLE `language_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `languages`
--

DROP TABLE IF EXISTS `languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `languages` (
  `lang_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `lang_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang_locale` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang_flag` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lang_is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `lang_order` int NOT NULL DEFAULT '0',
  `lang_is_rtl` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`lang_id`),
  KEY `lang_locale_index` (`lang_locale`),
  KEY `lang_code_index` (`lang_code`),
  KEY `lang_is_default_index` (`lang_is_default`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `languages`
--

LOCK TABLES `languages` WRITE;
/*!40000 ALTER TABLE `languages` DISABLE KEYS */;
INSERT INTO `languages` VALUES (1,'English','en','en_US','us',1,0,0);
/*!40000 ALTER TABLE `languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_files`
--

DROP TABLE IF EXISTS `media_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media_files` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `alt` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `folder_id` bigint unsigned NOT NULL DEFAULT '0',
  `mime_type` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` int NOT NULL,
  `url` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `visibility` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'public',
  PRIMARY KEY (`id`),
  KEY `media_files_user_id_index` (`user_id`),
  KEY `media_files_index` (`folder_id`,`user_id`,`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=3729 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_files`
--

LOCK TABLES `media_files` WRITE;
/*!40000 ALTER TABLE `media_files` DISABLE KEYS */;
INSERT INTO `media_files` VALUES (12,0,'1','1',2,'image/jpeg',3916,'avatars/1.jpg','[]','2025-10-20 17:21:11','2025-10-20 17:21:11',NULL,'public'),(13,0,'10','10',2,'image/jpeg',3916,'avatars/10.jpg','[]','2025-10-20 17:21:11','2025-10-20 17:21:11',NULL,'public'),(14,0,'11','11',2,'image/jpeg',3916,'avatars/11.jpg','[]','2025-10-20 17:21:11','2025-10-20 17:21:11',NULL,'public'),(15,0,'2','2',2,'image/jpeg',3916,'avatars/2.jpg','[]','2025-10-20 17:21:12','2025-10-20 17:21:12',NULL,'public'),(16,0,'3','3',2,'image/jpeg',3916,'avatars/3.jpg','[]','2025-10-20 17:21:12','2025-10-20 17:21:12',NULL,'public'),(17,0,'4','4',2,'image/jpeg',3916,'avatars/4.jpg','[]','2025-10-20 17:21:12','2025-10-20 17:21:12',NULL,'public'),(18,0,'5','5',2,'image/jpeg',3916,'avatars/5.jpg','[]','2025-10-20 17:21:12','2025-10-20 17:21:12',NULL,'public'),(19,0,'6','6',2,'image/jpeg',3916,'avatars/6.jpg','[]','2025-10-20 17:21:12','2025-10-20 17:21:12',NULL,'public'),(20,0,'7','7',2,'image/jpeg',3916,'avatars/7.jpg','[]','2025-10-20 17:21:12','2025-10-20 17:21:12',NULL,'public'),(21,0,'8','8',2,'image/jpeg',3916,'avatars/8.jpg','[]','2025-10-20 17:21:12','2025-10-20 17:21:12',NULL,'public'),(22,0,'9','9',2,'image/jpeg',3916,'avatars/9.jpg','[]','2025-10-20 17:21:12','2025-10-20 17:21:12',NULL,'public'),(49,0,'about-us-contact','about-us-contact',5,'image/jpeg',19409,'pages/about-us-contact.jpg','[]','2025-10-20 17:21:21','2025-10-20 17:21:21',NULL,'public'),(50,0,'about-us-video','about-us-video',5,'image/jpeg',16191,'pages/about-us-video.jpg','[]','2025-10-20 17:21:21','2025-10-20 17:21:21',NULL,'public'),(51,0,'call-to-action','call-to-action',5,'image/png',9051,'pages/call-to-action.png','[]','2025-10-20 17:21:21','2025-10-20 17:21:21',NULL,'public'),(52,0,'house-service','house-service',5,'image/png',10923,'pages/house-service.png','[]','2025-10-20 17:21:21','2025-10-20 17:21:21',NULL,'public'),(53,0,'properties','properties',5,'image/png',16974,'pages/properties.png','[]','2025-10-20 17:21:21','2025-10-20 17:21:21',NULL,'public'),(54,0,'service-1','service-1',5,'image/png',21898,'pages/service-1.png','[]','2025-10-20 17:21:21','2025-10-20 17:21:21',NULL,'public'),(55,0,'service-2','service-2',5,'image/png',21279,'pages/service-2.png','[]','2025-10-20 17:21:21','2025-10-20 17:21:21',NULL,'public'),(56,0,'service-3','service-3',5,'image/png',23965,'pages/service-3.png','[]','2025-10-20 17:21:21','2025-10-20 17:21:21',NULL,'public'),(57,0,'service-4','service-4',5,'image/png',32050,'pages/service-4.png','[]','2025-10-20 17:21:22','2025-10-20 17:21:22',NULL,'public'),(58,0,'service-5','service-5',5,'image/png',25146,'pages/service-5.png','[]','2025-10-20 17:21:22','2025-10-20 17:21:22',NULL,'public'),(59,0,'service-6','service-6',5,'image/png',31763,'pages/service-6.png','[]','2025-10-20 17:21:22','2025-10-20 17:21:22',NULL,'public'),(60,0,'slider-1','slider-1',5,'image/jpeg',27445,'pages/slider-1.jpg','[]','2025-10-20 17:21:22','2025-10-20 17:21:22',NULL,'public'),(61,0,'slider-2','slider-2',5,'image/jpeg',23889,'pages/slider-2.jpg','[]','2025-10-20 17:21:22','2025-10-20 17:21:22',NULL,'public'),(62,0,'slider-3','slider-3',5,'image/jpeg',23889,'pages/slider-3.jpg','[]','2025-10-20 17:21:23','2025-10-20 17:21:23',NULL,'public'),(63,0,'slider-4','slider-4',5,'image/jpeg',23889,'pages/slider-4.jpg','[]','2025-10-20 17:21:23','2025-10-20 17:21:23',NULL,'public'),(64,0,'slider-5','slider-5',5,'image/jpeg',23889,'pages/slider-5.jpg','[]','2025-10-20 17:21:23','2025-10-20 17:21:23',NULL,'public'),(65,0,'slider-6','slider-6',5,'image/png',33637,'pages/slider-6.png','[]','2025-10-20 17:21:23','2025-10-20 17:21:23',NULL,'public'),(66,0,'slider-left','slider-left',5,'image/jpeg',11483,'pages/slider-left.jpg','[]','2025-10-20 17:21:24','2025-10-20 17:21:24',NULL,'public'),(67,0,'testimonial-banner','testimonial-banner',5,'image/png',13232,'pages/testimonial-banner.png','[]','2025-10-20 17:21:24','2025-10-20 17:21:24',NULL,'public'),(68,0,'asana','asana',6,'image/png',3510,'partners/asana.png','[]','2025-10-20 17:21:24','2025-10-20 17:21:24',NULL,'public'),(69,0,'github','github',6,'image/png',3510,'partners/github.png','[]','2025-10-20 17:21:24','2025-10-20 17:21:24',NULL,'public'),(70,0,'lhtech','lhtech',6,'image/png',3510,'partners/lhtech.png','[]','2025-10-20 17:21:24','2025-10-20 17:21:24',NULL,'public'),(71,0,'panadoxn','panadoxn',6,'image/png',3510,'partners/panadoxn.png','[]','2025-10-20 17:21:24','2025-10-20 17:21:24',NULL,'public'),(72,0,'shangxi','shangxi',6,'image/png',3510,'partners/shangxi.png','[]','2025-10-20 17:21:24','2025-10-20 17:21:24',NULL,'public'),(73,0,'tyaalpha','tyaalpha',6,'image/png',3510,'partners/tyaalpha.png','[]','2025-10-20 17:21:24','2025-10-20 17:21:24',NULL,'public'),(74,0,'vanfaba','vanfaba',6,'image/png',3510,'partners/vanfaba.png','[]','2025-10-20 17:21:24','2025-10-20 17:21:24',NULL,'public'),(3537,0,'banner','banner',188,'image/jpeg',17700,'banner/banner.jpg','[]','2025-12-20 05:59:25','2025-12-20 05:59:25',NULL,'public'),(3538,0,'location-1','location-1',189,'image/jpeg',9803,'cities/location-1.jpg','[]','2025-12-20 05:59:25','2025-12-20 05:59:25',NULL,'public'),(3539,0,'location-2','location-2',189,'image/jpeg',9803,'cities/location-2.jpg','[]','2025-12-20 05:59:25','2025-12-20 05:59:25',NULL,'public'),(3540,0,'location-3','location-3',189,'image/jpeg',9803,'cities/location-3.jpg','[]','2025-12-20 05:59:26','2025-12-20 05:59:26',NULL,'public'),(3541,0,'location-4','location-4',189,'image/jpeg',9803,'cities/location-4.jpg','[]','2025-12-20 05:59:26','2025-12-20 05:59:26',NULL,'public'),(3542,0,'location-5','location-5',189,'image/jpeg',9803,'cities/location-5.jpg','[]','2025-12-20 05:59:26','2025-12-20 05:59:26',NULL,'public'),(3543,0,'1','1',190,'image/jpeg',9803,'locations/1.jpg','[]','2025-12-20 05:59:26','2025-12-20 05:59:26',NULL,'public'),(3544,0,'2','2',190,'image/jpeg',9803,'locations/2.jpg','[]','2025-12-20 05:59:26','2025-12-20 05:59:26',NULL,'public'),(3545,0,'3','3',190,'image/jpeg',9803,'locations/3.jpg','[]','2025-12-20 05:59:26','2025-12-20 05:59:26',NULL,'public'),(3546,0,'4','4',190,'image/jpeg',9803,'locations/4.jpg','[]','2025-12-20 05:59:26','2025-12-20 05:59:26',NULL,'public'),(3547,0,'5','5',190,'image/jpeg',9803,'locations/5.jpg','[]','2025-12-20 05:59:26','2025-12-20 05:59:26',NULL,'public'),(3548,0,'favicon','favicon',191,'image/png',2392,'logo/favicon.png','[]','2025-12-20 05:59:26','2025-12-20 05:59:26',NULL,'public'),(3549,0,'logo-white','logo-white',191,'image/png',20236,'logo/logo-white.png','[]','2025-12-20 05:59:26','2025-12-20 05:59:26',NULL,'public'),(3550,0,'logo','logo',191,'image/png',25650,'logo/logo.png','[]','2025-12-20 05:59:26','2025-12-20 05:59:26',NULL,'public'),(3551,0,'1','1',192,'image/jpeg',9803,'accounts/1.jpg','[]','2025-12-20 05:59:27','2025-12-20 05:59:27',NULL,'public'),(3552,0,'10','10',192,'image/jpeg',9803,'accounts/10.jpg','[]','2025-12-20 05:59:27','2025-12-20 05:59:27',NULL,'public'),(3553,0,'2','2',192,'image/jpeg',9803,'accounts/2.jpg','[]','2025-12-20 05:59:27','2025-12-20 05:59:27',NULL,'public'),(3554,0,'3','3',192,'image/jpeg',9803,'accounts/3.jpg','[]','2025-12-20 05:59:27','2025-12-20 05:59:27',NULL,'public'),(3555,0,'4','4',192,'image/jpeg',9803,'accounts/4.jpg','[]','2025-12-20 05:59:27','2025-12-20 05:59:27',NULL,'public'),(3556,0,'5','5',192,'image/jpeg',9803,'accounts/5.jpg','[]','2025-12-20 05:59:27','2025-12-20 05:59:27',NULL,'public'),(3557,0,'6','6',192,'image/jpeg',9803,'accounts/6.jpg','[]','2025-12-20 05:59:27','2025-12-20 05:59:27',NULL,'public'),(3558,0,'7','7',192,'image/jpeg',9803,'accounts/7.jpg','[]','2025-12-20 05:59:27','2025-12-20 05:59:27',NULL,'public'),(3559,0,'8','8',192,'image/jpeg',9803,'accounts/8.jpg','[]','2025-12-20 05:59:27','2025-12-20 05:59:27',NULL,'public'),(3560,0,'9','9',192,'image/jpeg',9803,'accounts/9.jpg','[]','2025-12-20 05:59:27','2025-12-20 05:59:27',NULL,'public'),(3561,0,'asset-3-at-3x','asset-3-at-3x',193,'image/png',76803,'general/asset-3-at-3x.png','[]','2025-12-20 05:59:32','2025-12-20 05:59:32',NULL,'public'),(3562,0,'asset-4-at-3x','asset-4-at-3x',193,'image/png',85535,'general/asset-4-at-3x.png','[]','2025-12-20 05:59:32','2025-12-20 05:59:32',NULL,'public'),(3563,0,'breadcrumb-background','breadcrumb-background',193,'image/jpeg',505901,'general/breadcrumb-background.jpg','[]','2025-12-20 05:59:32','2025-12-20 05:59:32',NULL,'public'),(3564,0,'copyright','copyright',193,'image/jpeg',48845,'general/copyright.jpg','[]','2025-12-20 05:59:32','2025-12-20 05:59:32',NULL,'public'),(3565,0,'home-banner','home-banner',193,'image/jpeg',631290,'general/home-banner.jpg','[]','2025-12-20 05:59:33','2025-12-20 05:59:33',NULL,'public'),(3566,0,'newsletter-image','newsletter-image',193,'image/jpeg',101293,'general/newsletter-image.jpg','[]','2025-12-20 05:59:33','2025-12-20 05:59:33',NULL,'public'),(3567,0,'termsconditions-pagedesktop','termsconditions-pagedesktop',193,'image/jpeg',78173,'general/termsconditions-pagedesktop.jpg','[]','2025-12-20 05:59:33','2025-12-20 05:59:33',NULL,'public'),(3568,0,'video-vi-pham-ban-quyen-bi-youtube-thang-tay-trung-tri','video-vi-pham-ban-quyen-bi-youtube-thang-tay-trung-tri',193,'image/jpeg',18757,'general/video-vi-pham-ban-quyen-bi-youtube-thang-tay-trung-tri.jpg','[]','2025-12-20 05:59:33','2025-12-20 05:59:33',NULL,'public'),(3569,0,'vietnam-office-4','vietnam-office-4',193,'image/jpeg',79608,'general/vietnam-office-4.jpg','[]','2025-12-20 05:59:33','2025-12-20 05:59:33',NULL,'public'),(3570,0,'1','1',194,'image/jpeg',66981,'news/1.jpg','[]','2025-12-20 05:59:33','2025-12-20 05:59:33',NULL,'public'),(3571,0,'10','10',194,'image/jpeg',38901,'news/10.jpg','[]','2025-12-20 05:59:33','2025-12-20 05:59:33',NULL,'public'),(3572,0,'11','11',194,'image/jpeg',51899,'news/11.jpg','[]','2025-12-20 05:59:33','2025-12-20 05:59:33',NULL,'public'),(3573,0,'12','12',194,'image/jpeg',55570,'news/12.jpg','[]','2025-12-20 05:59:33','2025-12-20 05:59:33',NULL,'public'),(3574,0,'13','13',194,'image/jpeg',82997,'news/13.jpg','[]','2025-12-20 05:59:33','2025-12-20 05:59:33',NULL,'public'),(3575,0,'14','14',194,'image/jpeg',66981,'news/14.jpg','[]','2025-12-20 05:59:33','2025-12-20 05:59:33',NULL,'public'),(3576,0,'15','15',194,'image/jpeg',111464,'news/15.jpg','[]','2025-12-20 05:59:34','2025-12-20 05:59:34',NULL,'public'),(3577,0,'16','16',194,'image/jpeg',379750,'news/16.jpg','[]','2025-12-20 05:59:34','2025-12-20 05:59:34',NULL,'public'),(3578,0,'2','2',194,'image/jpeg',51879,'news/2.jpg','[]','2025-12-20 05:59:34','2025-12-20 05:59:34',NULL,'public'),(3579,0,'3','3',194,'image/jpeg',127122,'news/3.jpg','[]','2025-12-20 05:59:34','2025-12-20 05:59:34',NULL,'public'),(3580,0,'4','4',194,'image/jpeg',173868,'news/4.jpg','[]','2025-12-20 05:59:34','2025-12-20 05:59:34',NULL,'public'),(3581,0,'5','5',194,'image/jpeg',38901,'news/5.jpg','[]','2025-12-20 05:59:34','2025-12-20 05:59:34',NULL,'public'),(3582,0,'6','6',194,'image/jpeg',224569,'news/6.jpg','[]','2025-12-20 05:59:34','2025-12-20 05:59:34',NULL,'public'),(3583,0,'7','7',194,'image/jpeg',177684,'news/7.jpg','[]','2025-12-20 05:59:34','2025-12-20 05:59:34',NULL,'public'),(3584,0,'8','8',194,'image/jpeg',111710,'news/8.jpg','[]','2025-12-20 05:59:34','2025-12-20 05:59:34',NULL,'public'),(3585,0,'9','9',194,'image/jpeg',143678,'news/9.jpg','[]','2025-12-20 05:59:34','2025-12-20 05:59:34',NULL,'public'),(3586,0,'1','1',195,'image/jpeg',66981,'posts/1.jpg','[]','2025-12-20 05:59:34','2025-12-20 05:59:34',NULL,'public'),(3587,0,'10','10',195,'image/jpeg',38901,'posts/10.jpg','[]','2025-12-20 05:59:34','2025-12-20 05:59:34',NULL,'public'),(3588,0,'11','11',195,'image/jpeg',51899,'posts/11.jpg','[]','2025-12-20 05:59:34','2025-12-20 05:59:34',NULL,'public'),(3589,0,'12','12',195,'image/jpeg',55570,'posts/12.jpg','[]','2025-12-20 05:59:34','2025-12-20 05:59:34',NULL,'public'),(3590,0,'13','13',195,'image/jpeg',82997,'posts/13.jpg','[]','2025-12-20 05:59:35','2025-12-20 05:59:35',NULL,'public'),(3591,0,'14','14',195,'image/jpeg',66981,'posts/14.jpg','[]','2025-12-20 05:59:35','2025-12-20 05:59:35',NULL,'public'),(3592,0,'15','15',195,'image/jpeg',111464,'posts/15.jpg','[]','2025-12-20 05:59:35','2025-12-20 05:59:35',NULL,'public'),(3593,0,'16','16',195,'image/jpeg',379750,'posts/16.jpg','[]','2025-12-20 05:59:35','2025-12-20 05:59:35',NULL,'public'),(3594,0,'2','2',195,'image/jpeg',51879,'posts/2.jpg','[]','2025-12-20 05:59:35','2025-12-20 05:59:35',NULL,'public'),(3595,0,'3','3',195,'image/jpeg',127122,'posts/3.jpg','[]','2025-12-20 05:59:35','2025-12-20 05:59:35',NULL,'public'),(3596,0,'4','4',195,'image/jpeg',173868,'posts/4.jpg','[]','2025-12-20 05:59:35','2025-12-20 05:59:35',NULL,'public'),(3597,0,'6','6',195,'image/jpeg',224569,'posts/6.jpg','[]','2025-12-20 05:59:35','2025-12-20 05:59:35',NULL,'public'),(3598,0,'7','7',195,'image/jpeg',177684,'posts/7.jpg','[]','2025-12-20 05:59:35','2025-12-20 05:59:35',NULL,'public'),(3599,0,'8','8',195,'image/jpeg',111710,'posts/8.jpg','[]','2025-12-20 05:59:35','2025-12-20 05:59:35',NULL,'public'),(3600,0,'9','9',195,'image/jpeg',143678,'posts/9.jpg','[]','2025-12-20 05:59:35','2025-12-20 05:59:35',NULL,'public'),(3601,0,'1','1',196,'image/jpeg',9803,'projects/1.jpg','[]','2025-12-20 05:59:36','2025-12-20 05:59:36',NULL,'public'),(3602,0,'11','11',196,'image/jpeg',9803,'projects/11.jpg','[]','2025-12-20 05:59:36','2025-12-20 05:59:36',NULL,'public'),(3603,0,'12','12',196,'image/jpeg',9803,'projects/12.jpg','[]','2025-12-20 05:59:36','2025-12-20 05:59:36',NULL,'public'),(3604,0,'13','13',196,'image/jpeg',9803,'projects/13.jpg','[]','2025-12-20 05:59:36','2025-12-20 05:59:36',NULL,'public'),(3605,0,'14','14',196,'image/jpeg',9803,'projects/14.jpg','[]','2025-12-20 05:59:36','2025-12-20 05:59:36',NULL,'public'),(3606,0,'2','2',196,'image/jpeg',9803,'projects/2.jpg','[]','2025-12-20 05:59:36','2025-12-20 05:59:36',NULL,'public'),(3607,0,'21','21',196,'image/jpeg',9803,'projects/21.jpg','[]','2025-12-20 05:59:36','2025-12-20 05:59:36',NULL,'public'),(3608,0,'22','22',196,'image/jpeg',9803,'projects/22.jpg','[]','2025-12-20 05:59:36','2025-12-20 05:59:36',NULL,'public'),(3609,0,'23','23',196,'image/jpeg',9803,'projects/23.jpg','[]','2025-12-20 05:59:36','2025-12-20 05:59:36',NULL,'public'),(3610,0,'24','24',196,'image/jpeg',9803,'projects/24.jpg','[]','2025-12-20 05:59:36','2025-12-20 05:59:36',NULL,'public'),(3611,0,'25','25',196,'image/jpeg',9803,'projects/25.jpg','[]','2025-12-20 05:59:36','2025-12-20 05:59:36',NULL,'public'),(3612,0,'26','26',196,'image/jpeg',9803,'projects/26.jpg','[]','2025-12-20 05:59:36','2025-12-20 05:59:36',NULL,'public'),(3613,0,'3','3',196,'image/jpeg',9803,'projects/3.jpg','[]','2025-12-20 05:59:36','2025-12-20 05:59:36',NULL,'public'),(3614,0,'5','5',196,'image/jpeg',9803,'projects/5.jpg','[]','2025-12-20 05:59:36','2025-12-20 05:59:36',NULL,'public'),(3615,0,'1-1','1-1',197,'image/jpeg',9803,'properties/1-1.jpg','[]','2025-12-20 05:59:36','2025-12-20 05:59:36',NULL,'public'),(3616,0,'1-2','1-2',197,'image/jpeg',9803,'properties/1-2.jpg','[]','2025-12-20 05:59:36','2025-12-20 05:59:36',NULL,'public'),(3617,0,'1-3','1-3',197,'image/jpeg',9803,'properties/1-3.jpg','[]','2025-12-20 05:59:37','2025-12-20 05:59:37',NULL,'public'),(3618,0,'1','1',197,'image/jpeg',9803,'properties/1.jpg','[]','2025-12-20 05:59:37','2025-12-20 05:59:37',NULL,'public'),(3619,0,'10-1','10-1',197,'image/jpeg',9803,'properties/10-1.jpg','[]','2025-12-20 05:59:37','2025-12-20 05:59:37',NULL,'public'),(3620,0,'10','10',197,'image/jpeg',9803,'properties/10.jpg','[]','2025-12-20 05:59:37','2025-12-20 05:59:37',NULL,'public'),(3621,0,'11-1','11-1',197,'image/jpeg',9803,'properties/11-1.jpg','[]','2025-12-20 05:59:37','2025-12-20 05:59:37',NULL,'public'),(3622,0,'11','11',197,'image/jpeg',9803,'properties/11.jpg','[]','2025-12-20 05:59:37','2025-12-20 05:59:37',NULL,'public'),(3623,0,'12','12',197,'image/jpeg',9803,'properties/12.jpg','[]','2025-12-20 05:59:37','2025-12-20 05:59:37',NULL,'public'),(3624,0,'13','13',197,'image/jpeg',9803,'properties/13.jpg','[]','2025-12-20 05:59:37','2025-12-20 05:59:37',NULL,'public'),(3625,0,'14','14',197,'image/jpeg',9803,'properties/14.jpg','[]','2025-12-20 05:59:37','2025-12-20 05:59:37',NULL,'public'),(3626,0,'15','15',197,'image/jpeg',9803,'properties/15.jpg','[]','2025-12-20 05:59:37','2025-12-20 05:59:37',NULL,'public'),(3627,0,'2-1','2-1',197,'image/jpeg',9803,'properties/2-1.jpg','[]','2025-12-20 05:59:37','2025-12-20 05:59:37',NULL,'public'),(3628,0,'2-2','2-2',197,'image/jpeg',9803,'properties/2-2.jpg','[]','2025-12-20 05:59:37','2025-12-20 05:59:37',NULL,'public'),(3629,0,'2-3','2-3',197,'image/jpeg',9803,'properties/2-3.jpg','[]','2025-12-20 05:59:37','2025-12-20 05:59:37',NULL,'public'),(3630,0,'2','2',197,'image/jpeg',9803,'properties/2.jpg','[]','2025-12-20 05:59:37','2025-12-20 05:59:37',NULL,'public'),(3631,0,'21','21',197,'image/jpeg',9803,'properties/21.jpg','[]','2025-12-20 05:59:37','2025-12-20 05:59:37',NULL,'public'),(3632,0,'22-1','22-1',197,'image/jpeg',9803,'properties/22-1.jpg','[]','2025-12-20 05:59:37','2025-12-20 05:59:37',NULL,'public'),(3633,0,'22','22',197,'image/jpeg',9803,'properties/22.jpg','[]','2025-12-20 05:59:37','2025-12-20 05:59:37',NULL,'public'),(3634,0,'23','23',197,'image/jpeg',9803,'properties/23.jpg','[]','2025-12-20 05:59:38','2025-12-20 05:59:38',NULL,'public'),(3635,0,'24-1','24-1',197,'image/jpeg',9803,'properties/24-1.jpg','[]','2025-12-20 05:59:38','2025-12-20 05:59:38',NULL,'public'),(3636,0,'24','24',197,'image/jpeg',9803,'properties/24.jpg','[]','2025-12-20 05:59:38','2025-12-20 05:59:38',NULL,'public'),(3637,0,'3-1','3-1',197,'image/jpeg',9803,'properties/3-1.jpg','[]','2025-12-20 05:59:38','2025-12-20 05:59:38',NULL,'public'),(3638,0,'3-2','3-2',197,'image/jpeg',9803,'properties/3-2.jpg','[]','2025-12-20 05:59:38','2025-12-20 05:59:38',NULL,'public'),(3639,0,'3-3','3-3',197,'image/jpeg',9803,'properties/3-3.jpg','[]','2025-12-20 05:59:38','2025-12-20 05:59:38',NULL,'public'),(3640,0,'3','3',197,'image/jpeg',9803,'properties/3.jpg','[]','2025-12-20 05:59:38','2025-12-20 05:59:38',NULL,'public'),(3641,0,'31','31',197,'image/jpeg',9803,'properties/31.jpg','[]','2025-12-20 05:59:38','2025-12-20 05:59:38',NULL,'public'),(3642,0,'311','311',197,'image/jpeg',9803,'properties/311.jpg','[]','2025-12-20 05:59:38','2025-12-20 05:59:38',NULL,'public'),(3643,0,'32','32',197,'image/jpeg',9803,'properties/32.jpg','[]','2025-12-20 05:59:38','2025-12-20 05:59:38',NULL,'public'),(3644,0,'32223-43914-378','32223-43914-378',197,'image/jpeg',9803,'properties/32223-43914-378.jpg','[]','2025-12-20 05:59:38','2025-12-20 05:59:38',NULL,'public'),(3645,0,'33','33',197,'image/jpeg',9803,'properties/33.jpg','[]','2025-12-20 05:59:38','2025-12-20 05:59:38',NULL,'public'),(3646,0,'34','34',197,'image/jpeg',9803,'properties/34.jpg','[]','2025-12-20 05:59:38','2025-12-20 05:59:38',NULL,'public'),(3647,0,'35','35',197,'image/jpeg',9803,'properties/35.jpg','[]','2025-12-20 05:59:38','2025-12-20 05:59:38',NULL,'public'),(3648,0,'4-1','4-1',197,'image/jpeg',9803,'properties/4-1.jpg','[]','2025-12-20 05:59:38','2025-12-20 05:59:38',NULL,'public'),(3649,0,'4-2','4-2',197,'image/jpeg',9803,'properties/4-2.jpg','[]','2025-12-20 05:59:38','2025-12-20 05:59:38',NULL,'public'),(3650,0,'4','4',197,'image/jpeg',9803,'properties/4.jpg','[]','2025-12-20 05:59:38','2025-12-20 05:59:38',NULL,'public'),(3651,0,'411','411',197,'image/jpeg',9803,'properties/411.jpg','[]','2025-12-20 05:59:38','2025-12-20 05:59:38',NULL,'public'),(3652,0,'42','42',197,'image/jpeg',9803,'properties/42.jpg','[]','2025-12-20 05:59:39','2025-12-20 05:59:39',NULL,'public'),(3653,0,'421834935dbc9ef3aaa42','421834935dbc9ef3aaa42',197,'image/jpeg',9803,'properties/421834935dbc9ef3aaa42.jpg','[]','2025-12-20 05:59:39','2025-12-20 05:59:39',NULL,'public'),(3654,0,'43','43',197,'image/jpeg',9803,'properties/43.jpg','[]','2025-12-20 05:59:39','2025-12-20 05:59:39',NULL,'public'),(3655,0,'44','44',197,'image/jpeg',9803,'properties/44.jpg','[]','2025-12-20 05:59:39','2025-12-20 05:59:39',NULL,'public'),(3656,0,'5-1','5-1',197,'image/jpeg',9803,'properties/5-1.jpg','[]','2025-12-20 05:59:39','2025-12-20 05:59:39',NULL,'public'),(3657,0,'5-2','5-2',197,'image/jpeg',9803,'properties/5-2.jpg','[]','2025-12-20 05:59:39','2025-12-20 05:59:39',NULL,'public'),(3658,0,'5','5',197,'image/jpeg',9803,'properties/5.jpg','[]','2025-12-20 05:59:39','2025-12-20 05:59:39',NULL,'public'),(3659,0,'6-1','6-1',197,'image/jpeg',9803,'properties/6-1.jpg','[]','2025-12-20 05:59:39','2025-12-20 05:59:39',NULL,'public'),(3660,0,'6-2','6-2',197,'image/jpeg',9803,'properties/6-2.jpg','[]','2025-12-20 05:59:39','2025-12-20 05:59:39',NULL,'public'),(3661,0,'6','6',197,'image/jpeg',9803,'properties/6.jpg','[]','2025-12-20 05:59:39','2025-12-20 05:59:39',NULL,'public'),(3662,0,'7-1','7-1',197,'image/jpeg',9803,'properties/7-1.jpg','[]','2025-12-20 05:59:39','2025-12-20 05:59:39',NULL,'public'),(3663,0,'7-2','7-2',197,'image/jpeg',9803,'properties/7-2.jpg','[]','2025-12-20 05:59:39','2025-12-20 05:59:39',NULL,'public'),(3664,0,'7','7',197,'image/jpeg',9803,'properties/7.jpg','[]','2025-12-20 05:59:39','2025-12-20 05:59:39',NULL,'public'),(3665,0,'71','71',197,'image/jpeg',9803,'properties/71.jpg','[]','2025-12-20 05:59:39','2025-12-20 05:59:39',NULL,'public'),(3666,0,'72','72',197,'image/jpeg',9803,'properties/72.jpg','[]','2025-12-20 05:59:39','2025-12-20 05:59:39',NULL,'public'),(3667,0,'73','73',197,'image/jpeg',9803,'properties/73.jpg','[]','2025-12-20 05:59:39','2025-12-20 05:59:39',NULL,'public'),(3668,0,'74','74',197,'image/jpeg',9803,'properties/74.jpg','[]','2025-12-20 05:59:40','2025-12-20 05:59:40',NULL,'public'),(3669,0,'75','75',197,'image/jpeg',9803,'properties/75.jpg','[]','2025-12-20 05:59:40','2025-12-20 05:59:40',NULL,'public'),(3670,0,'78','78',197,'image/jpeg',9803,'properties/78.jpg','[]','2025-12-20 05:59:40','2025-12-20 05:59:40',NULL,'public'),(3671,0,'79','79',197,'image/jpeg',9803,'properties/79.jpg','[]','2025-12-20 05:59:40','2025-12-20 05:59:40',NULL,'public'),(3672,0,'8-1','8-1',197,'image/jpeg',9803,'properties/8-1.jpg','[]','2025-12-20 05:59:40','2025-12-20 05:59:40',NULL,'public'),(3673,0,'8-2','8-2',197,'image/jpeg',9803,'properties/8-2.jpg','[]','2025-12-20 05:59:40','2025-12-20 05:59:40',NULL,'public'),(3674,0,'8','8',197,'image/jpeg',9803,'properties/8.jpg','[]','2025-12-20 05:59:40','2025-12-20 05:59:40',NULL,'public'),(3675,0,'9-1','9-1',197,'image/jpeg',9803,'properties/9-1.jpg','[]','2025-12-20 05:59:40','2025-12-20 05:59:40',NULL,'public'),(3676,0,'9','9',197,'image/jpeg',9803,'properties/9.jpg','[]','2025-12-20 05:59:40','2025-12-20 05:59:40',NULL,'public'),(3677,0,'a1-1','a1-1',197,'image/jpeg',9803,'properties/a1-1.jpg','[]','2025-12-20 05:59:40','2025-12-20 05:59:40',NULL,'public'),(3678,0,'a1-2','a1-2',197,'image/jpeg',9803,'properties/a1-2.jpg','[]','2025-12-20 05:59:40','2025-12-20 05:59:40',NULL,'public'),(3679,0,'a1','a1',197,'image/jpeg',9803,'properties/a1.jpg','[]','2025-12-20 05:59:40','2025-12-20 05:59:40',NULL,'public'),(3680,0,'a10','a10',197,'image/jpeg',9803,'properties/a10.jpg','[]','2025-12-20 05:59:40','2025-12-20 05:59:40',NULL,'public'),(3681,0,'a2-1','a2-1',197,'image/jpeg',9803,'properties/a2-1.jpg','[]','2025-12-20 05:59:40','2025-12-20 05:59:40',NULL,'public'),(3682,0,'a2-2','a2-2',197,'image/jpeg',9803,'properties/a2-2.jpg','[]','2025-12-20 05:59:41','2025-12-20 05:59:41',NULL,'public'),(3683,0,'a2','a2',197,'image/jpeg',9803,'properties/a2.jpg','[]','2025-12-20 05:59:41','2025-12-20 05:59:41',NULL,'public'),(3684,0,'a3-1','a3-1',197,'image/jpeg',9803,'properties/a3-1.jpg','[]','2025-12-20 05:59:41','2025-12-20 05:59:41',NULL,'public'),(3685,0,'a3-2','a3-2',197,'image/jpeg',9803,'properties/a3-2.jpg','[]','2025-12-20 05:59:41','2025-12-20 05:59:41',NULL,'public'),(3686,0,'a3','a3',197,'image/jpeg',9803,'properties/a3.jpg','[]','2025-12-20 05:59:41','2025-12-20 05:59:41',NULL,'public'),(3687,0,'a4-1','a4-1',197,'image/jpeg',9803,'properties/a4-1.jpg','[]','2025-12-20 05:59:41','2025-12-20 05:59:41',NULL,'public'),(3688,0,'a4-2','a4-2',197,'image/jpeg',9803,'properties/a4-2.jpg','[]','2025-12-20 05:59:41','2025-12-20 05:59:41',NULL,'public'),(3689,0,'a4','a4',197,'image/jpeg',9803,'properties/a4.jpg','[]','2025-12-20 05:59:41','2025-12-20 05:59:41',NULL,'public'),(3690,0,'a5-1','a5-1',197,'image/jpeg',9803,'properties/a5-1.jpg','[]','2025-12-20 05:59:41','2025-12-20 05:59:41',NULL,'public'),(3691,0,'a5','a5',197,'image/jpeg',9803,'properties/a5.jpg','[]','2025-12-20 05:59:41','2025-12-20 05:59:41',NULL,'public'),(3692,0,'a6-1','a6-1',197,'image/jpeg',9803,'properties/a6-1.jpg','[]','2025-12-20 05:59:41','2025-12-20 05:59:41',NULL,'public'),(3693,0,'a6','a6',197,'image/jpeg',9803,'properties/a6.jpg','[]','2025-12-20 05:59:41','2025-12-20 05:59:41',NULL,'public'),(3694,0,'a7','a7',197,'image/jpeg',9803,'properties/a7.jpg','[]','2025-12-20 05:59:41','2025-12-20 05:59:41',NULL,'public'),(3695,0,'a8','a8',197,'image/jpeg',9803,'properties/a8.jpg','[]','2025-12-20 05:59:41','2025-12-20 05:59:41',NULL,'public'),(3696,0,'a9','a9',197,'image/jpeg',9803,'properties/a9.jpg','[]','2025-12-20 05:59:41','2025-12-20 05:59:41',NULL,'public'),(3697,0,'b1','b1',197,'image/jpeg',9803,'properties/b1.jpg','[]','2025-12-20 05:59:41','2025-12-20 05:59:41',NULL,'public'),(3698,0,'b2','b2',197,'image/jpeg',9803,'properties/b2.jpg','[]','2025-12-20 05:59:42','2025-12-20 05:59:42',NULL,'public'),(3699,0,'b3','b3',197,'image/jpeg',9803,'properties/b3.jpg','[]','2025-12-20 05:59:42','2025-12-20 05:59:42',NULL,'public'),(3700,0,'b4-1','b4-1',197,'image/jpeg',9803,'properties/b4-1.jpg','[]','2025-12-20 05:59:42','2025-12-20 05:59:42',NULL,'public'),(3701,0,'b4','b4',197,'image/jpeg',9803,'properties/b4.jpg','[]','2025-12-20 05:59:42','2025-12-20 05:59:42',NULL,'public'),(3702,0,'b5-1','b5-1',197,'image/jpeg',9803,'properties/b5-1.jpg','[]','2025-12-20 05:59:42','2025-12-20 05:59:42',NULL,'public'),(3703,0,'b5','b5',197,'image/jpeg',9803,'properties/b5.jpg','[]','2025-12-20 05:59:42','2025-12-20 05:59:42',NULL,'public'),(3704,0,'b6','b6',197,'image/jpeg',9803,'properties/b6.jpg','[]','2025-12-20 05:59:42','2025-12-20 05:59:42',NULL,'public'),(3705,0,'download','download',197,'image/jpeg',9803,'properties/download.jpg','[]','2025-12-20 05:59:42','2025-12-20 05:59:42',NULL,'public'),(3706,0,'e1','e1',197,'image/jpeg',9803,'properties/e1.jpg','[]','2025-12-20 05:59:42','2025-12-20 05:59:42',NULL,'public'),(3707,0,'e2','e2',197,'image/jpeg',9803,'properties/e2.jpg','[]','2025-12-20 05:59:42','2025-12-20 05:59:42',NULL,'public'),(3708,0,'e3','e3',197,'image/jpeg',9803,'properties/e3.jpg','[]','2025-12-20 05:59:42','2025-12-20 05:59:42',NULL,'public'),(3709,0,'e4','e4',197,'image/jpeg',9803,'properties/e4.jpg','[]','2025-12-20 05:59:42','2025-12-20 05:59:42',NULL,'public'),(3710,0,'e5','e5',197,'image/jpeg',9803,'properties/e5.jpg','[]','2025-12-20 05:59:42','2025-12-20 05:59:42',NULL,'public'),(3711,0,'e7','e7',197,'image/jpeg',9803,'properties/e7.jpg','[]','2025-12-20 05:59:42','2025-12-20 05:59:42',NULL,'public'),(3712,0,'e8','e8',197,'image/jpeg',9803,'properties/e8.jpg','[]','2025-12-20 05:59:43','2025-12-20 05:59:43',NULL,'public'),(3713,0,'floor','floor',197,'image/png',9803,'properties/floor.png','[]','2025-12-20 05:59:43','2025-12-20 05:59:43',NULL,'public'),(3714,0,'p1','p1',197,'image/jpeg',9803,'properties/p1.jpg','[]','2025-12-20 05:59:43','2025-12-20 05:59:43',NULL,'public'),(3715,0,'p2','p2',197,'image/jpeg',9803,'properties/p2.jpg','[]','2025-12-20 05:59:43','2025-12-20 05:59:43',NULL,'public'),(3716,0,'property-video-thumb','property-video-thumb',197,'image/jpeg',9803,'properties/property-video-thumb.jpg','[]','2025-12-20 05:59:43','2025-12-20 05:59:43',NULL,'public'),(3717,0,'q1','q1',197,'image/jpeg',9803,'properties/q1.jpg','[]','2025-12-20 05:59:43','2025-12-20 05:59:43',NULL,'public'),(3718,0,'q2','q2',197,'image/jpeg',9803,'properties/q2.jpg','[]','2025-12-20 05:59:43','2025-12-20 05:59:43',NULL,'public'),(3719,0,'q3','q3',197,'image/jpeg',9803,'properties/q3.jpg','[]','2025-12-20 05:59:43','2025-12-20 05:59:43',NULL,'public'),(3720,0,'q6','q6',197,'image/jpeg',9803,'properties/q6.jpg','[]','2025-12-20 05:59:43','2025-12-20 05:59:43',NULL,'public'),(3721,0,'q7','q7',197,'image/jpeg',9803,'properties/q7.jpg','[]','2025-12-20 05:59:43','2025-12-20 05:59:43',NULL,'public'),(3722,0,'q8','q8',197,'image/jpeg',9803,'properties/q8.jpg','[]','2025-12-20 05:59:43','2025-12-20 05:59:43',NULL,'public'),(3723,0,'t1','t1',197,'image/jpeg',9803,'properties/t1.jpg','[]','2025-12-20 05:59:43','2025-12-20 05:59:43',NULL,'public'),(3724,0,'t2','t2',197,'image/jpeg',9803,'properties/t2.jpg','[]','2025-12-20 05:59:43','2025-12-20 05:59:43',NULL,'public'),(3725,0,'t3','t3',197,'image/jpeg',9803,'properties/t3.jpg','[]','2025-12-20 05:59:43','2025-12-20 05:59:43',NULL,'public'),(3726,0,'t4','t4',197,'image/jpeg',9803,'properties/t4.jpg','[]','2025-12-20 05:59:43','2025-12-20 05:59:43',NULL,'public'),(3727,0,'t5','t5',197,'image/jpeg',9803,'properties/t5.jpg','[]','2025-12-20 05:59:43','2025-12-20 05:59:43',NULL,'public'),(3728,0,'wp1a','wp1a',197,'image/jpeg',9803,'properties/wp1a.jpg','[]','2025-12-20 05:59:43','2025-12-20 05:59:43',NULL,'public');
/*!40000 ALTER TABLE `media_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_folders`
--

DROP TABLE IF EXISTS `media_folders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media_folders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` bigint unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `media_folders_user_id_index` (`user_id`),
  KEY `media_folders_index` (`parent_id`,`user_id`,`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=198 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_folders`
--

LOCK TABLES `media_folders` WRITE;
/*!40000 ALTER TABLE `media_folders` DISABLE KEYS */;
INSERT INTO `media_folders` VALUES (2,0,'avatars',NULL,'avatars',0,'2025-10-20 17:21:11','2025-10-20 17:21:11',NULL),(5,0,'pages',NULL,'pages',0,'2025-10-20 17:21:20','2025-10-20 17:21:20',NULL),(6,0,'partners',NULL,'partners',0,'2025-10-20 17:21:24','2025-10-20 17:21:24',NULL),(188,0,'banner',NULL,'banner',0,'2025-12-20 05:59:25','2025-12-20 05:59:25',NULL),(189,0,'cities',NULL,'cities',0,'2025-12-20 05:59:25','2025-12-20 05:59:25',NULL),(190,0,'locations',NULL,'locations',0,'2025-12-20 05:59:26','2025-12-20 05:59:26',NULL),(191,0,'logo',NULL,'logo',0,'2025-12-20 05:59:26','2025-12-20 05:59:26',NULL),(192,0,'accounts',NULL,'accounts',0,'2025-12-20 05:59:27','2025-12-20 05:59:27',NULL),(193,0,'general',NULL,'general',0,'2025-12-20 05:59:32','2025-12-20 05:59:32',NULL),(194,0,'news',NULL,'news',0,'2025-12-20 05:59:33','2025-12-20 05:59:33',NULL),(195,0,'posts',NULL,'posts',0,'2025-12-20 05:59:34','2025-12-20 05:59:34',NULL),(196,0,'projects',NULL,'projects',0,'2025-12-20 05:59:36','2025-12-20 05:59:36',NULL),(197,0,'properties',NULL,'properties',0,'2025-12-20 05:59:36','2025-12-20 05:59:36',NULL);
/*!40000 ALTER TABLE `media_folders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_settings`
--

DROP TABLE IF EXISTS `media_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media_settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `media_id` bigint unsigned DEFAULT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_settings`
--

LOCK TABLES `media_settings` WRITE;
/*!40000 ALTER TABLE `media_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `media_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_locations`
--

DROP TABLE IF EXISTS `menu_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_locations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` bigint unsigned NOT NULL,
  `location` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `menu_locations_menu_id_created_at_index` (`menu_id`,`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_locations`
--

LOCK TABLES `menu_locations` WRITE;
/*!40000 ALTER TABLE `menu_locations` DISABLE KEYS */;
INSERT INTO `menu_locations` VALUES (1,1,'main-menu','2025-12-20 05:59:32','2025-12-20 05:59:32');
/*!40000 ALTER TABLE `menu_locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_nodes`
--

DROP TABLE IF EXISTS `menu_nodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_nodes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` bigint unsigned NOT NULL,
  `parent_id` bigint unsigned NOT NULL DEFAULT '0',
  `reference_id` bigint unsigned DEFAULT NULL,
  `reference_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon_font` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` tinyint unsigned NOT NULL DEFAULT '0',
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `css_class` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `target` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `has_child` tinyint unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `menu_nodes_menu_id_index` (`menu_id`),
  KEY `menu_nodes_parent_id_index` (`parent_id`),
  KEY `reference_id` (`reference_id`),
  KEY `reference_type` (`reference_type`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_nodes`
--

LOCK TABLES `menu_nodes` WRITE;
/*!40000 ALTER TABLE `menu_nodes` DISABLE KEYS */;
INSERT INTO `menu_nodes` VALUES (1,1,0,NULL,NULL,'/projects',NULL,0,'Projects',NULL,'_self',0,'2025-12-20 05:59:32','2025-12-20 05:59:32'),(2,1,0,NULL,NULL,'/properties',NULL,1,'Properties',NULL,'_self',0,'2025-12-20 05:59:32','2025-12-20 05:59:32'),(3,1,0,NULL,NULL,'/agents',NULL,2,'Agents',NULL,'_self',0,'2025-12-20 05:59:32','2025-12-20 05:59:32'),(4,1,0,2,'Botble\\Page\\Models\\Page','/news',NULL,3,'News',NULL,'_self',0,'2025-12-20 05:59:32','2025-12-20 05:59:32'),(5,1,0,NULL,NULL,'/careers',NULL,4,'Careers',NULL,'_self',0,'2025-12-20 05:59:32','2025-12-20 05:59:32'),(6,1,0,4,'Botble\\Page\\Models\\Page','/contact',NULL,5,'Contact',NULL,'_self',0,'2025-12-20 05:59:32','2025-12-20 05:59:32'),(7,2,0,3,'Botble\\Page\\Models\\Page','/about-us',NULL,0,'About us',NULL,'_self',0,'2025-12-20 05:59:32','2025-12-20 05:59:32'),(8,2,0,4,'Botble\\Page\\Models\\Page','/contact',NULL,1,'Contact us',NULL,'_self',0,'2025-12-20 05:59:32','2025-12-20 05:59:32'),(9,2,0,NULL,NULL,'/careers',NULL,2,'Careers',NULL,'_self',0,'2025-12-20 05:59:32','2025-12-20 05:59:32'),(10,2,0,5,'Botble\\Page\\Models\\Page','/terms-conditions',NULL,3,'Terms & Conditions',NULL,'_self',0,'2025-12-20 05:59:32','2025-12-20 05:59:32'),(11,3,0,NULL,NULL,'/projects',NULL,0,'All projects',NULL,'_self',0,'2025-12-20 05:59:32','2025-12-20 05:59:32'),(12,3,0,NULL,NULL,'/properties',NULL,1,'All properties',NULL,'_self',0,'2025-12-20 05:59:32','2025-12-20 05:59:32'),(13,3,0,NULL,NULL,'/properties?type=sale',NULL,2,'Houses for sale',NULL,'_self',0,'2025-12-20 05:59:32','2025-12-20 05:59:32'),(14,3,0,NULL,NULL,'/properties?type=rent',NULL,3,'Houses for rent',NULL,'_self',0,'2025-12-20 05:59:32','2025-12-20 05:59:32'),(15,4,0,2,'Botble\\Page\\Models\\Page','/news',NULL,0,'Latest news',NULL,'_self',0,'2025-12-20 05:59:32','2025-12-20 05:59:32'),(16,4,0,2,'Botble\\Blog\\Models\\Category',NULL,NULL,1,'House architecture',NULL,'_self',0,'2025-12-20 05:59:32','2025-12-20 05:59:32'),(17,4,0,4,'Botble\\Blog\\Models\\Category',NULL,NULL,2,'House design',NULL,'_self',0,'2025-12-20 05:59:32','2025-12-20 05:59:32'),(18,4,0,6,'Botble\\Blog\\Models\\Category',NULL,NULL,3,'Building materials',NULL,'_self',0,'2025-12-20 05:59:32','2025-12-20 05:59:32');
/*!40000 ALTER TABLE `menu_nodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS `menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menus` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menus_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menus`
--

LOCK TABLES `menus` WRITE;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
INSERT INTO `menus` VALUES (1,'Main menu','main-menu','published','2025-12-20 05:59:32','2025-12-20 05:59:32'),(2,'About','about','published','2025-12-20 05:59:32','2025-12-20 05:59:32'),(3,'More information','more-information','published','2025-12-20 05:59:32','2025-12-20 05:59:32'),(4,'News','news','published','2025-12-20 05:59:32','2025-12-20 05:59:32');
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meta_boxes`
--

DROP TABLE IF EXISTS `meta_boxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `meta_boxes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `meta_key` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `reference_id` bigint unsigned NOT NULL,
  `reference_type` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `meta_boxes_reference_id_index` (`reference_id`)
) ENGINE=InnoDB AUTO_INCREMENT=150 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meta_boxes`
--

LOCK TABLES `meta_boxes` WRITE;
/*!40000 ALTER TABLE `meta_boxes` DISABLE KEYS */;
INSERT INTO `meta_boxes` VALUES (7,'social_links','[[[{\"key\":\"name\",\"value\":\"Facebook\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-facebook\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.facebook.com\\/\"}],[{\"key\":\"name\",\"value\":\"Instagram\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-instagram\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.instagram.com\\/\"}],[{\"key\":\"name\",\"value\":\"Twitter\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-x\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.twitter.com\\/\"}],[{\"key\":\"name\",\"value\":\"YouTube\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-youtube\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.youtube.com\\/\"}]]]',1,'Botble\\RealEstate\\Models\\Account','2025-10-20 17:21:12','2025-10-20 17:21:12'),(8,'social_links','[[[{\"key\":\"name\",\"value\":\"Facebook\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-facebook\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.facebook.com\\/\"}],[{\"key\":\"name\",\"value\":\"Instagram\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-instagram\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.instagram.com\\/\"}],[{\"key\":\"name\",\"value\":\"Twitter\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-x\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.twitter.com\\/\"}],[{\"key\":\"name\",\"value\":\"YouTube\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-youtube\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.youtube.com\\/\"}]]]',2,'Botble\\RealEstate\\Models\\Account','2025-10-20 17:21:13','2025-10-20 17:21:13'),(9,'social_links','[[[{\"key\":\"name\",\"value\":\"Facebook\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-facebook\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.facebook.com\\/\"}],[{\"key\":\"name\",\"value\":\"Instagram\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-instagram\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.instagram.com\\/\"}],[{\"key\":\"name\",\"value\":\"Twitter\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-x\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.twitter.com\\/\"}],[{\"key\":\"name\",\"value\":\"YouTube\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-youtube\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.youtube.com\\/\"}]]]',3,'Botble\\RealEstate\\Models\\Account','2025-10-20 17:21:13','2025-10-20 17:21:13'),(10,'social_links','[[[{\"key\":\"name\",\"value\":\"Facebook\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-facebook\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.facebook.com\\/\"}],[{\"key\":\"name\",\"value\":\"Instagram\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-instagram\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.instagram.com\\/\"}],[{\"key\":\"name\",\"value\":\"Twitter\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-x\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.twitter.com\\/\"}],[{\"key\":\"name\",\"value\":\"YouTube\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-youtube\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.youtube.com\\/\"}]]]',4,'Botble\\RealEstate\\Models\\Account','2025-10-20 17:21:13','2025-10-20 17:21:13'),(11,'social_links','[[[{\"key\":\"name\",\"value\":\"Facebook\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-facebook\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.facebook.com\\/\"}],[{\"key\":\"name\",\"value\":\"Instagram\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-instagram\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.instagram.com\\/\"}],[{\"key\":\"name\",\"value\":\"Twitter\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-x\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.twitter.com\\/\"}],[{\"key\":\"name\",\"value\":\"YouTube\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-youtube\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.youtube.com\\/\"}]]]',5,'Botble\\RealEstate\\Models\\Account','2025-10-20 17:21:14','2025-10-20 17:21:14'),(12,'social_links','[[[{\"key\":\"name\",\"value\":\"Facebook\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-facebook\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.facebook.com\\/\"}],[{\"key\":\"name\",\"value\":\"Instagram\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-instagram\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.instagram.com\\/\"}],[{\"key\":\"name\",\"value\":\"Twitter\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-x\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.twitter.com\\/\"}],[{\"key\":\"name\",\"value\":\"YouTube\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-youtube\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.youtube.com\\/\"}]]]',6,'Botble\\RealEstate\\Models\\Account','2025-10-20 17:21:14','2025-10-20 17:21:14'),(13,'social_links','[[[{\"key\":\"name\",\"value\":\"Facebook\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-facebook\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.facebook.com\\/\"}],[{\"key\":\"name\",\"value\":\"Instagram\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-instagram\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.instagram.com\\/\"}],[{\"key\":\"name\",\"value\":\"Twitter\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-x\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.twitter.com\\/\"}],[{\"key\":\"name\",\"value\":\"YouTube\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-youtube\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.youtube.com\\/\"}]]]',7,'Botble\\RealEstate\\Models\\Account','2025-10-20 17:21:14','2025-10-20 17:21:14'),(14,'social_links','[[[{\"key\":\"name\",\"value\":\"Facebook\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-facebook\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.facebook.com\\/\"}],[{\"key\":\"name\",\"value\":\"Instagram\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-instagram\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.instagram.com\\/\"}],[{\"key\":\"name\",\"value\":\"Twitter\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-x\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.twitter.com\\/\"}],[{\"key\":\"name\",\"value\":\"YouTube\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-youtube\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.youtube.com\\/\"}]]]',8,'Botble\\RealEstate\\Models\\Account','2025-10-20 17:21:15','2025-10-20 17:21:15'),(15,'social_links','[[[{\"key\":\"name\",\"value\":\"Facebook\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-facebook\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.facebook.com\\/\"}],[{\"key\":\"name\",\"value\":\"Instagram\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-instagram\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.instagram.com\\/\"}],[{\"key\":\"name\",\"value\":\"Twitter\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-x\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.twitter.com\\/\"}],[{\"key\":\"name\",\"value\":\"YouTube\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-youtube\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.youtube.com\\/\"}]]]',9,'Botble\\RealEstate\\Models\\Account','2025-10-20 17:21:15','2025-10-20 17:21:15'),(16,'social_links','[[[{\"key\":\"name\",\"value\":\"Facebook\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-facebook\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.facebook.com\\/\"}],[{\"key\":\"name\",\"value\":\"Instagram\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-instagram\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.instagram.com\\/\"}],[{\"key\":\"name\",\"value\":\"Twitter\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-x\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.twitter.com\\/\"}],[{\"key\":\"name\",\"value\":\"YouTube\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-youtube\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.youtube.com\\/\"}]]]',10,'Botble\\RealEstate\\Models\\Account','2025-10-20 17:21:15','2025-10-20 17:21:15'),(17,'social_links','[[[{\"key\":\"name\",\"value\":\"Facebook\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-facebook\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.facebook.com\\/\"}],[{\"key\":\"name\",\"value\":\"Instagram\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-instagram\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.instagram.com\\/\"}],[{\"key\":\"name\",\"value\":\"Twitter\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-x\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.twitter.com\\/\"}],[{\"key\":\"name\",\"value\":\"YouTube\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-youtube\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.youtube.com\\/\"}]]]',11,'Botble\\RealEstate\\Models\\Account','2025-10-20 17:21:16','2025-10-20 17:21:16'),(18,'social_links','[[[{\"key\":\"name\",\"value\":\"Facebook\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-facebook\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.facebook.com\\/\"}],[{\"key\":\"name\",\"value\":\"Instagram\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-instagram\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.instagram.com\\/\"}],[{\"key\":\"name\",\"value\":\"Twitter\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-x\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.twitter.com\\/\"}],[{\"key\":\"name\",\"value\":\"YouTube\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-youtube\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.youtube.com\\/\"}]]]',12,'Botble\\RealEstate\\Models\\Account','2025-10-20 17:21:16','2025-10-20 17:21:16'),(19,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',1,'Botble\\RealEstate\\Models\\Property','2025-10-20 17:21:18','2025-10-20 17:21:18'),(20,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',2,'Botble\\RealEstate\\Models\\Property','2025-10-20 17:21:18','2025-10-20 17:21:18'),(21,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',3,'Botble\\RealEstate\\Models\\Property','2025-10-20 17:21:18','2025-10-20 17:21:18'),(22,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',4,'Botble\\RealEstate\\Models\\Property','2025-10-20 17:21:18','2025-10-20 17:21:18'),(23,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',5,'Botble\\RealEstate\\Models\\Property','2025-10-20 17:21:18','2025-10-20 17:21:18'),(24,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',6,'Botble\\RealEstate\\Models\\Property','2025-10-20 17:21:18','2025-10-20 17:21:18'),(25,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',7,'Botble\\RealEstate\\Models\\Property','2025-10-20 17:21:18','2025-10-20 17:21:18'),(26,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',8,'Botble\\RealEstate\\Models\\Property','2025-10-20 17:21:18','2025-10-20 17:21:18'),(27,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',9,'Botble\\RealEstate\\Models\\Property','2025-10-20 17:21:18','2025-10-20 17:21:18'),(28,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',10,'Botble\\RealEstate\\Models\\Property','2025-10-20 17:21:18','2025-10-20 17:21:18'),(29,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',11,'Botble\\RealEstate\\Models\\Property','2025-10-20 17:21:18','2025-10-20 17:21:18'),(30,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',12,'Botble\\RealEstate\\Models\\Property','2025-10-20 17:21:18','2025-10-20 17:21:18'),(31,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',13,'Botble\\RealEstate\\Models\\Property','2025-10-20 17:21:18','2025-10-20 17:21:18'),(32,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',14,'Botble\\RealEstate\\Models\\Property','2025-10-20 17:21:18','2025-10-20 17:21:18'),(33,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',15,'Botble\\RealEstate\\Models\\Property','2025-10-20 17:21:18','2025-10-20 17:21:18'),(34,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',16,'Botble\\RealEstate\\Models\\Property','2025-10-20 17:21:18','2025-10-20 17:21:18'),(35,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',17,'Botble\\RealEstate\\Models\\Property','2025-10-20 17:21:18','2025-10-20 17:21:18'),(36,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',18,'Botble\\RealEstate\\Models\\Property','2025-10-20 17:21:18','2025-10-20 17:21:18'),(37,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',19,'Botble\\RealEstate\\Models\\Property','2025-10-20 17:21:18','2025-10-20 17:21:18'),(38,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',20,'Botble\\RealEstate\\Models\\Property','2025-10-20 17:21:18','2025-10-20 17:21:18'),(39,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',21,'Botble\\RealEstate\\Models\\Property','2025-10-20 17:21:18','2025-10-20 17:21:18'),(40,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',22,'Botble\\RealEstate\\Models\\Property','2025-10-20 17:21:18','2025-10-20 17:21:18'),(41,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',23,'Botble\\RealEstate\\Models\\Property','2025-10-20 17:21:18','2025-10-20 17:21:18'),(42,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',24,'Botble\\RealEstate\\Models\\Property','2025-10-20 17:21:18','2025-10-20 17:21:18'),(43,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',25,'Botble\\RealEstate\\Models\\Property','2025-10-20 17:21:18','2025-10-20 17:21:18'),(44,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',26,'Botble\\RealEstate\\Models\\Property','2025-10-20 17:21:18','2025-10-20 17:21:18'),(45,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',27,'Botble\\RealEstate\\Models\\Property','2025-10-20 17:21:18','2025-10-20 17:21:18'),(46,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',28,'Botble\\RealEstate\\Models\\Property','2025-10-20 17:21:18','2025-10-20 17:21:18'),(47,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',29,'Botble\\RealEstate\\Models\\Property','2025-10-20 17:21:18','2025-10-20 17:21:18'),(48,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',30,'Botble\\RealEstate\\Models\\Property','2025-10-20 17:21:18','2025-10-20 17:21:18'),(49,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',31,'Botble\\RealEstate\\Models\\Property','2025-10-20 17:21:18','2025-10-20 17:21:18'),(50,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',32,'Botble\\RealEstate\\Models\\Property','2025-10-20 17:21:18','2025-10-20 17:21:18'),(51,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',33,'Botble\\RealEstate\\Models\\Property','2025-10-20 17:21:18','2025-10-20 17:21:18'),(52,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',34,'Botble\\RealEstate\\Models\\Property','2025-10-20 17:21:18','2025-10-20 17:21:18'),(53,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',35,'Botble\\RealEstate\\Models\\Property','2025-10-20 17:21:18','2025-10-20 17:21:18'),(54,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',36,'Botble\\RealEstate\\Models\\Property','2025-10-20 17:21:19','2025-10-20 17:21:19'),(55,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',37,'Botble\\RealEstate\\Models\\Property','2025-10-20 17:21:19','2025-10-20 17:21:19'),(56,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',38,'Botble\\RealEstate\\Models\\Property','2025-10-20 17:21:19','2025-10-20 17:21:19'),(57,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',39,'Botble\\RealEstate\\Models\\Property','2025-10-20 17:21:19','2025-10-20 17:21:19'),(58,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',40,'Botble\\RealEstate\\Models\\Property','2025-10-20 17:21:19','2025-10-20 17:21:19'),(59,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',41,'Botble\\RealEstate\\Models\\Property','2025-10-20 17:21:19','2025-10-20 17:21:19'),(60,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',42,'Botble\\RealEstate\\Models\\Property','2025-10-20 17:21:19','2025-10-20 17:21:19'),(61,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',43,'Botble\\RealEstate\\Models\\Property','2025-10-20 17:21:19','2025-10-20 17:21:19'),(62,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',44,'Botble\\RealEstate\\Models\\Property','2025-10-20 17:21:19','2025-10-20 17:21:19'),(63,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',45,'Botble\\RealEstate\\Models\\Property','2025-10-20 17:21:19','2025-10-20 17:21:19'),(64,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',46,'Botble\\RealEstate\\Models\\Property','2025-10-20 17:21:19','2025-10-20 17:21:19'),(65,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',47,'Botble\\RealEstate\\Models\\Property','2025-10-20 17:21:19','2025-10-20 17:21:19'),(66,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',48,'Botble\\RealEstate\\Models\\Property','2025-10-20 17:21:19','2025-10-20 17:21:19'),(67,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',49,'Botble\\RealEstate\\Models\\Property','2025-10-20 17:21:19','2025-10-20 17:21:19'),(68,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',50,'Botble\\RealEstate\\Models\\Property','2025-10-20 17:21:19','2025-10-20 17:21:19'),(69,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',51,'Botble\\RealEstate\\Models\\Property','2025-10-20 17:21:19','2025-10-20 17:21:19'),(70,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',52,'Botble\\RealEstate\\Models\\Property','2025-10-20 17:21:19','2025-10-20 17:21:19'),(71,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',53,'Botble\\RealEstate\\Models\\Property','2025-10-20 17:21:19','2025-10-20 17:21:19'),(72,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',54,'Botble\\RealEstate\\Models\\Property','2025-10-20 17:21:19','2025-10-20 17:21:19'),(73,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',55,'Botble\\RealEstate\\Models\\Property','2025-10-20 17:21:19','2025-10-20 17:21:19'),(74,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',56,'Botble\\RealEstate\\Models\\Property','2025-10-20 17:21:19','2025-10-20 17:21:19'),(75,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',57,'Botble\\RealEstate\\Models\\Property','2025-10-20 17:21:19','2025-10-20 17:21:19'),(76,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',58,'Botble\\RealEstate\\Models\\Property','2025-10-20 17:21:19','2025-10-20 17:21:19'),(77,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',59,'Botble\\RealEstate\\Models\\Property','2025-10-20 17:21:19','2025-10-20 17:21:19'),(78,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',60,'Botble\\RealEstate\\Models\\Property','2025-10-20 17:21:19','2025-10-20 17:21:19'),(79,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',61,'Botble\\RealEstate\\Models\\Property','2025-10-20 17:21:19','2025-10-20 17:21:19'),(93,'image','[\"general\\/job-details-thumb.png\"]',1,'ArchiElite\\Career\\Models\\Career','2025-10-20 17:21:26','2025-10-20 17:21:26'),(94,'icon','[\"icons\\/icon1.png\"]',1,'ArchiElite\\Career\\Models\\Career','2025-10-20 17:21:26','2025-10-20 17:21:26'),(95,'apply_url','[\"\\/contact\"]',1,'ArchiElite\\Career\\Models\\Career','2025-10-20 17:21:26','2025-10-20 17:21:26'),(96,'image','[\"general\\/job-details-thumb.png\"]',2,'ArchiElite\\Career\\Models\\Career','2025-10-20 17:21:26','2025-10-20 17:21:26'),(97,'icon','[\"icons\\/icon2.png\"]',2,'ArchiElite\\Career\\Models\\Career','2025-10-20 17:21:26','2025-10-20 17:21:26'),(98,'apply_url','[\"\\/contact\"]',2,'ArchiElite\\Career\\Models\\Career','2025-10-20 17:21:26','2025-10-20 17:21:26'),(99,'image','[\"general\\/job-details-thumb.png\"]',3,'ArchiElite\\Career\\Models\\Career','2025-10-20 17:21:26','2025-10-20 17:21:26'),(100,'icon','[\"icons\\/icon3.png\"]',3,'ArchiElite\\Career\\Models\\Career','2025-10-20 17:21:26','2025-10-20 17:21:26'),(101,'apply_url','[\"\\/contact\"]',3,'ArchiElite\\Career\\Models\\Career','2025-10-20 17:21:26','2025-10-20 17:21:26'),(102,'image','[\"general\\/job-details-thumb.png\"]',4,'ArchiElite\\Career\\Models\\Career','2025-10-20 17:21:26','2025-10-20 17:21:26'),(103,'icon','[\"icons\\/icon4.png\"]',4,'ArchiElite\\Career\\Models\\Career','2025-10-20 17:21:26','2025-10-20 17:21:26'),(104,'apply_url','[\"\\/contact\"]',4,'ArchiElite\\Career\\Models\\Career','2025-10-20 17:21:26','2025-10-20 17:21:26'),(105,'image','[\"general\\/job-details-thumb.png\"]',5,'ArchiElite\\Career\\Models\\Career','2025-10-20 17:21:26','2025-10-20 17:21:26'),(106,'icon','[\"icons\\/icon5.png\"]',5,'ArchiElite\\Career\\Models\\Career','2025-10-20 17:21:26','2025-10-20 17:21:26'),(107,'apply_url','[\"\\/contact\"]',5,'ArchiElite\\Career\\Models\\Career','2025-10-20 17:21:26','2025-10-20 17:21:26'),(108,'image','[\"general\\/job-details-thumb.png\"]',6,'ArchiElite\\Career\\Models\\Career','2025-10-20 17:21:26','2025-10-20 17:21:26'),(109,'icon','[\"icons\\/icon6.png\"]',6,'ArchiElite\\Career\\Models\\Career','2025-10-20 17:21:26','2025-10-20 17:21:26'),(110,'apply_url','[\"\\/contact\"]',6,'ArchiElite\\Career\\Models\\Career','2025-10-20 17:21:26','2025-10-20 17:21:26'),(111,'video','[{\"thumbnail\":\"\",\"url\":\"https:\\/\\/www.youtube.com\\/watch?v=UfEiKK-iX70\"}]',2,'Botble\\RealEstate\\Models\\Property','2025-10-21 01:05:13','2025-10-21 01:05:13'),(112,'video','[{\"thumbnail\":\"properties\\/property-video-thumb.jpg\",\"url\":\"https:\\/\\/www.youtube.com\\/watch?v=UfEiKK-iX70\"}]',4,'Botble\\RealEstate\\Models\\Property','2025-10-21 01:05:13','2025-10-21 01:05:13'),(113,'video','[{\"thumbnail\":\"\",\"url\":\"https:\\/\\/www.youtube.com\\/watch?v=UfEiKK-iX70\"}]',6,'Botble\\RealEstate\\Models\\Property','2025-10-21 01:05:13','2025-10-21 01:05:13'),(114,'video','[{\"thumbnail\":\"properties\\/property-video-thumb.jpg\",\"url\":\"https:\\/\\/www.youtube.com\\/watch?v=UfEiKK-iX70\"}]',8,'Botble\\RealEstate\\Models\\Property','2025-10-21 01:05:13','2025-10-21 01:05:13'),(115,'video','[{\"thumbnail\":\"\",\"url\":\"https:\\/\\/www.youtube.com\\/watch?v=UfEiKK-iX70\"}]',10,'Botble\\RealEstate\\Models\\Property','2025-10-21 01:05:13','2025-10-21 01:05:13'),(116,'video','[{\"thumbnail\":\"properties\\/property-video-thumb.jpg\",\"url\":\"https:\\/\\/www.youtube.com\\/watch?v=UfEiKK-iX70\"}]',12,'Botble\\RealEstate\\Models\\Property','2025-10-21 01:05:13','2025-10-21 01:05:13'),(117,'video','[{\"thumbnail\":\"\",\"url\":\"https:\\/\\/www.youtube.com\\/watch?v=UfEiKK-iX70\"}]',14,'Botble\\RealEstate\\Models\\Property','2025-10-21 01:05:13','2025-10-21 01:05:13'),(118,'video','[{\"thumbnail\":\"properties\\/property-video-thumb.jpg\",\"url\":\"https:\\/\\/www.youtube.com\\/watch?v=UfEiKK-iX70\"}]',16,'Botble\\RealEstate\\Models\\Property','2025-10-21 01:05:13','2025-10-21 01:05:13'),(119,'video','[{\"thumbnail\":\"\",\"url\":\"https:\\/\\/www.youtube.com\\/watch?v=UfEiKK-iX70\"}]',18,'Botble\\RealEstate\\Models\\Property','2025-10-21 01:05:13','2025-10-21 01:05:13'),(120,'video','[{\"thumbnail\":\"properties\\/property-video-thumb.jpg\",\"url\":\"https:\\/\\/www.youtube.com\\/watch?v=UfEiKK-iX70\"}]',20,'Botble\\RealEstate\\Models\\Property','2025-10-21 01:05:13','2025-10-21 01:05:13'),(121,'video','[{\"thumbnail\":\"\",\"url\":\"https:\\/\\/www.youtube.com\\/watch?v=UfEiKK-iX70\"}]',22,'Botble\\RealEstate\\Models\\Property','2025-10-21 01:05:13','2025-10-21 01:05:13'),(122,'video','[{\"thumbnail\":\"properties\\/property-video-thumb.jpg\",\"url\":\"https:\\/\\/www.youtube.com\\/watch?v=UfEiKK-iX70\"}]',24,'Botble\\RealEstate\\Models\\Property','2025-10-21 01:05:13','2025-10-21 01:05:13'),(123,'video','[{\"thumbnail\":\"\",\"url\":\"https:\\/\\/www.youtube.com\\/watch?v=UfEiKK-iX70\"}]',26,'Botble\\RealEstate\\Models\\Property','2025-10-21 01:05:13','2025-10-21 01:05:13'),(124,'video','[{\"thumbnail\":\"properties\\/property-video-thumb.jpg\",\"url\":\"https:\\/\\/www.youtube.com\\/watch?v=UfEiKK-iX70\"}]',28,'Botble\\RealEstate\\Models\\Property','2025-10-21 01:05:13','2025-10-21 01:05:13'),(125,'video','[{\"thumbnail\":\"\",\"url\":\"https:\\/\\/www.youtube.com\\/watch?v=UfEiKK-iX70\"}]',30,'Botble\\RealEstate\\Models\\Property','2025-10-21 01:05:13','2025-10-21 01:05:13'),(126,'video','[{\"thumbnail\":\"properties\\/property-video-thumb.jpg\",\"url\":\"https:\\/\\/www.youtube.com\\/watch?v=UfEiKK-iX70\"}]',32,'Botble\\RealEstate\\Models\\Property','2025-10-21 01:05:13','2025-10-21 01:05:13'),(127,'video','[{\"thumbnail\":\"\",\"url\":\"https:\\/\\/www.youtube.com\\/watch?v=UfEiKK-iX70\"}]',34,'Botble\\RealEstate\\Models\\Property','2025-10-21 01:05:13','2025-10-21 01:05:13'),(128,'video','[{\"thumbnail\":\"properties\\/property-video-thumb.jpg\",\"url\":\"https:\\/\\/www.youtube.com\\/watch?v=UfEiKK-iX70\"}]',36,'Botble\\RealEstate\\Models\\Property','2025-10-21 01:05:13','2025-10-21 01:05:13'),(129,'video','[{\"thumbnail\":\"\",\"url\":\"https:\\/\\/www.youtube.com\\/watch?v=UfEiKK-iX70\"}]',38,'Botble\\RealEstate\\Models\\Property','2025-10-21 01:05:13','2025-10-21 01:05:13'),(130,'video','[{\"thumbnail\":\"properties\\/property-video-thumb.jpg\",\"url\":\"https:\\/\\/www.youtube.com\\/watch?v=UfEiKK-iX70\"}]',40,'Botble\\RealEstate\\Models\\Property','2025-10-21 01:05:13','2025-10-21 01:05:13'),(131,'video','[{\"thumbnail\":\"\",\"url\":\"https:\\/\\/www.youtube.com\\/watch?v=UfEiKK-iX70\"}]',42,'Botble\\RealEstate\\Models\\Property','2025-10-21 01:05:13','2025-10-21 01:05:13'),(132,'video','[{\"thumbnail\":\"properties\\/property-video-thumb.jpg\",\"url\":\"https:\\/\\/www.youtube.com\\/watch?v=UfEiKK-iX70\"}]',44,'Botble\\RealEstate\\Models\\Property','2025-10-21 01:05:13','2025-10-21 01:05:13'),(133,'video','[{\"thumbnail\":\"\",\"url\":\"https:\\/\\/www.youtube.com\\/watch?v=UfEiKK-iX70\"}]',46,'Botble\\RealEstate\\Models\\Property','2025-10-21 01:05:13','2025-10-21 01:05:13'),(134,'video','[{\"thumbnail\":\"properties\\/property-video-thumb.jpg\",\"url\":\"https:\\/\\/www.youtube.com\\/watch?v=UfEiKK-iX70\"}]',48,'Botble\\RealEstate\\Models\\Property','2025-10-21 01:05:13','2025-10-21 01:05:13'),(135,'video','[{\"thumbnail\":\"\",\"url\":\"https:\\/\\/www.youtube.com\\/watch?v=UfEiKK-iX70\"}]',50,'Botble\\RealEstate\\Models\\Property','2025-10-21 01:05:13','2025-10-21 01:05:13'),(136,'video','[{\"thumbnail\":\"properties\\/property-video-thumb.jpg\",\"url\":\"https:\\/\\/www.youtube.com\\/watch?v=UfEiKK-iX70\"}]',52,'Botble\\RealEstate\\Models\\Property','2025-10-21 01:05:13','2025-10-21 01:05:13'),(137,'video','[{\"thumbnail\":\"\",\"url\":\"https:\\/\\/www.youtube.com\\/watch?v=UfEiKK-iX70\"}]',54,'Botble\\RealEstate\\Models\\Property','2025-10-21 01:05:13','2025-10-21 01:05:13'),(138,'video','[{\"thumbnail\":\"properties\\/property-video-thumb.jpg\",\"url\":\"https:\\/\\/www.youtube.com\\/watch?v=UfEiKK-iX70\"}]',56,'Botble\\RealEstate\\Models\\Property','2025-10-21 01:05:13','2025-10-21 01:05:13'),(139,'video','[{\"thumbnail\":\"\",\"url\":\"https:\\/\\/www.youtube.com\\/watch?v=UfEiKK-iX70\"}]',58,'Botble\\RealEstate\\Models\\Property','2025-10-21 01:05:13','2025-10-21 01:05:13'),(140,'video','[{\"thumbnail\":\"properties\\/property-video-thumb.jpg\",\"url\":\"https:\\/\\/www.youtube.com\\/watch?v=UfEiKK-iX70\"}]',60,'Botble\\RealEstate\\Models\\Property','2025-10-21 01:05:13','2025-10-21 01:05:13'),(141,'video','[{\"thumbnail\":\"\",\"url\":\"https:\\/\\/www.youtube.com\\/watch?v=UfEiKK-iX70\"}]',2,'Botble\\RealEstate\\Models\\Project','2025-10-21 01:05:13','2025-10-21 01:05:13'),(142,'video','[{\"thumbnail\":\"properties\\/property-video-thumb.jpg\",\"url\":\"https:\\/\\/www.youtube.com\\/watch?v=UfEiKK-iX70\"}]',4,'Botble\\RealEstate\\Models\\Project','2025-10-21 01:05:13','2025-10-21 01:05:13'),(143,'video','[{\"thumbnail\":\"\",\"url\":\"https:\\/\\/www.youtube.com\\/watch?v=UfEiKK-iX70\"}]',6,'Botble\\RealEstate\\Models\\Project','2025-10-21 01:05:13','2025-10-21 01:05:13'),(144,'video','[{\"thumbnail\":\"properties\\/property-video-thumb.jpg\",\"url\":\"https:\\/\\/www.youtube.com\\/watch?v=UfEiKK-iX70\"}]',8,'Botble\\RealEstate\\Models\\Project','2025-10-21 01:05:13','2025-10-21 01:05:13'),(145,'video','[{\"thumbnail\":\"\",\"url\":\"https:\\/\\/www.youtube.com\\/watch?v=UfEiKK-iX70\"}]',10,'Botble\\RealEstate\\Models\\Project','2025-10-21 01:05:13','2025-10-21 01:05:13'),(146,'video','[{\"thumbnail\":\"properties\\/property-video-thumb.jpg\",\"url\":\"https:\\/\\/www.youtube.com\\/watch?v=UfEiKK-iX70\"}]',12,'Botble\\RealEstate\\Models\\Project','2025-10-21 01:05:13','2025-10-21 01:05:13'),(147,'video','[{\"thumbnail\":\"\",\"url\":\"https:\\/\\/www.youtube.com\\/watch?v=UfEiKK-iX70\"}]',14,'Botble\\RealEstate\\Models\\Project','2025-10-21 01:05:13','2025-10-21 01:05:13'),(148,'video','[{\"thumbnail\":\"properties\\/property-video-thumb.jpg\",\"url\":\"https:\\/\\/www.youtube.com\\/watch?v=UfEiKK-iX70\"}]',16,'Botble\\RealEstate\\Models\\Project','2025-10-21 01:05:13','2025-10-21 01:05:13'),(149,'video','[{\"thumbnail\":\"\",\"url\":\"https:\\/\\/www.youtube.com\\/watch?v=UfEiKK-iX70\"}]',18,'Botble\\RealEstate\\Models\\Project','2025-10-21 01:05:13','2025-10-21 01:05:13');
/*!40000 ALTER TABLE `meta_boxes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=192 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'0001_01_01_000001_create_cache_table',1),(2,'2013_04_09_032329_create_base_tables',1),(3,'2013_04_09_062329_create_revisions_table',1),(4,'2014_10_12_000000_create_users_table',1),(5,'2014_10_12_100000_create_password_reset_tokens_table',1),(6,'2016_06_10_230148_create_acl_tables',1),(7,'2016_06_14_230857_create_menus_table',1),(8,'2016_06_28_221418_create_pages_table',1),(9,'2016_10_05_074239_create_setting_table',1),(10,'2016_11_28_032840_create_dashboard_widget_tables',1),(11,'2016_12_16_084601_create_widgets_table',1),(12,'2017_05_09_070343_create_media_tables',1),(13,'2017_11_03_070450_create_slug_table',1),(14,'2019_01_05_053554_create_jobs_table',1),(15,'2019_08_19_000000_create_failed_jobs_table',1),(16,'2019_12_14_000001_create_personal_access_tokens_table',1),(17,'2022_04_20_100851_add_index_to_media_table',1),(18,'2022_04_20_101046_add_index_to_menu_table',1),(19,'2022_07_10_034813_move_lang_folder_to_root',1),(20,'2022_08_04_051940_add_missing_column_expires_at',1),(21,'2022_09_01_000001_create_admin_notifications_tables',1),(22,'2022_10_14_024629_drop_column_is_featured',1),(23,'2022_11_18_063357_add_missing_timestamp_in_table_settings',1),(24,'2022_12_02_093615_update_slug_index_columns',1),(25,'2023_01_30_024431_add_alt_to_media_table',1),(26,'2023_02_16_042611_drop_table_password_resets',1),(27,'2023_04_23_005903_add_column_permissions_to_admin_notifications',1),(28,'2023_05_10_075124_drop_column_id_in_role_users_table',1),(29,'2023_08_21_090810_make_page_content_nullable',1),(30,'2023_09_14_021936_update_index_for_slugs_table',1),(31,'2023_12_07_095130_add_color_column_to_media_folders_table',1),(32,'2023_12_17_162208_make_sure_column_color_in_media_folders_nullable',1),(33,'2024_04_04_110758_update_value_column_in_user_meta_table',1),(34,'2024_05_12_091229_add_column_visibility_to_table_media_files',1),(35,'2024_07_03_162029_remove_plugin_team',1),(36,'2024_07_07_091316_fix_column_url_in_menu_nodes_table',1),(37,'2024_07_12_100000_change_random_hash_for_media',1),(38,'2024_09_30_024515_create_sessions_table',1),(39,'2024_12_19_000001_create_device_tokens_table',1),(40,'2024_12_19_000002_create_push_notifications_table',1),(41,'2024_12_19_000003_create_push_notification_recipients_table',1),(42,'2024_12_30_000001_create_user_settings_table',1),(43,'2025_07_06_030754_add_phone_to_users_table',1),(44,'2025_07_31_add_performance_indexes_to_slugs_table',1),(45,'2020_11_18_150916_ads_create_ads_table',2),(46,'2021_12_02_035301_add_ads_translations_table',2),(47,'2023_04_17_062645_add_open_in_new_tab',2),(48,'2023_11_07_023805_add_tablet_mobile_image',2),(49,'2024_04_01_043317_add_google_adsense_slot_id_to_ads_table',2),(50,'2025_04_21_000000_add_tablet_mobile_image_to_ads_translations_table',2),(51,'2024_04_27_100730_improve_analytics_setting',3),(52,'2023_08_11_060908_create_announcements_table',4),(53,'2025_02_11_153025_add_action_label_to_announcement_translations',4),(54,'2015_06_29_025744_create_audit_history',5),(55,'2023_11_14_033417_change_request_column_in_table_audit_histories',5),(56,'2025_05_05_000001_add_user_type_to_audit_histories_table',5),(57,'2015_06_18_033822_create_blog_table',6),(58,'2021_02_16_092633_remove_default_value_for_author_type',6),(59,'2021_12_03_030600_create_blog_translations',6),(60,'2022_04_19_113923_add_index_to_table_posts',6),(61,'2023_08_29_074620_make_column_author_id_nullable',6),(62,'2024_07_30_091615_fix_order_column_in_categories_table',6),(63,'2025_01_06_033807_add_default_value_for_categories_author_type',6),(64,'2019_06_24_211801_create_career_table',7),(65,'2021_12_04_095357_create_careers_translations_table',7),(66,'2023_09_20_050420_add_missing_translation_column',7),(67,'2016_06_17_091537_create_contacts_table',8),(68,'2023_11_10_080225_migrate_contact_blacklist_email_domains_to_core',8),(69,'2024_03_20_080001_migrate_change_attribute_email_to_nullable_form_contacts_table',8),(70,'2024_03_25_000001_update_captcha_settings_for_contact',8),(71,'2024_04_19_063914_create_custom_fields_table',8),(72,'2018_07_09_221238_create_faq_table',9),(73,'2021_12_03_082134_create_faq_translations',9),(74,'2023_11_17_063408_add_description_column_to_faq_categories_table',9),(75,'2016_10_03_032336_create_languages_table',10),(76,'2023_09_14_022423_add_index_for_language_table',10),(77,'2021_10_25_021023_fix-priority-load-for-language-advanced',11),(78,'2021_12_03_075608_create_page_translations',11),(79,'2023_07_06_011444_create_slug_translations_table',11),(80,'2019_11_18_061011_create_country_table',12),(81,'2021_12_03_084118_create_location_translations',12),(82,'2021_12_03_094518_migrate_old_location_data',12),(83,'2021_12_10_034440_switch_plugin_location_to_use_language_advanced',12),(84,'2022_01_16_085908_improve_plugin_location',12),(85,'2022_08_04_052122_delete_location_backup_tables',12),(86,'2023_04_23_061847_increase_state_translations_abbreviation_column',12),(87,'2023_07_26_041451_add_more_columns_to_location_table',12),(88,'2023_07_27_041451_add_more_columns_to_location_translation_table',12),(89,'2023_08_15_073307_drop_unique_in_states_cities_translations',12),(90,'2023_10_21_065016_make_state_id_in_table_cities_nullable',12),(91,'2024_08_17_094600_add_image_into_countries',12),(92,'2025_01_08_093652_add_zip_code_to_cities',12),(93,'2025_07_31_083459_add_indexes_for_location_search_performance',12),(94,'2017_10_24_154832_create_newsletter_table',13),(95,'2024_03_25_000001_update_captcha_settings_for_newsletter',13),(96,'2017_05_18_080441_create_payment_tables',14),(97,'2021_03_27_144913_add_customer_type_into_table_payments',14),(98,'2021_05_24_034720_make_column_currency_nullable',14),(99,'2021_08_09_161302_add_metadata_column_to_payments_table',14),(100,'2021_10_19_020859_update_metadata_field',14),(101,'2022_06_28_151901_activate_paypal_stripe_plugin',14),(102,'2022_07_07_153354_update_charge_id_in_table_payments',14),(103,'2024_07_04_083133_create_payment_logs_table',14),(104,'2025_04_12_000003_add_payment_fee_to_payments_table',14),(105,'2025_05_22_000001_add_payment_fee_type_to_settings_table',14),(106,'2018_06_22_032304_create_real_estate_table',15),(107,'2021_02_11_031126_update_price_column_in_projects_and_properties',15),(108,'2021_03_08_024049_add_lat_long_into_real_estate_tables',15),(109,'2021_06_10_091950_add_column_is_featured_to_table_re_accounts',15),(110,'2021_07_07_021757_update_table_account_activity_logs',15),(111,'2021_09_29_042758_create_re_categories_multilevel_table',15),(112,'2021_10_31_031254_add_company_to_accounts_table',15),(113,'2021_12_10_034807_create_real_estate_translation_tables',15),(114,'2021_12_18_081636_add_property_project_views_count',15),(115,'2022_05_04_033044_update_column_images_in_real_estate_tables',15),(116,'2022_07_02_081723_fix_expired_date_column',15),(117,'2022_08_01_090213_update_table_properties_and_projects',15),(118,'2023_01_31_023233_create_re_custom_fields_table',15),(119,'2023_02_06_000000_add_location_to_re_accounts_table',15),(120,'2023_02_06_024257_add_package_translations',15),(121,'2023_02_08_062457_add_custom_fields_translation_table',15),(122,'2023_02_15_024644_create_re_reviews_table',15),(123,'2023_02_20_072604_create_re_invoices_table',15),(124,'2023_02_20_081251_create_re_account_packages_table',15),(125,'2023_04_04_030709_add_unique_id_to_properties_and_projects_table',15),(126,'2023_04_14_164811_make_phone_and_email_in_table_re_consults_nullable',15),(127,'2023_05_09_062031_unique_reviews_table',15),(128,'2023_05_26_034353_fix_properties_projects_image',15),(129,'2023_05_27_004215_add_column_ip_into_table_re_consults',15),(130,'2023_07_25_034513_create_re_coupons_table',15),(131,'2023_07_25_034672_add_coupon_code_column_to_jb_invoices_table',15),(132,'2023_08_02_074208_change_square_column_to_float',15),(133,'2023_08_07_000001_add_is_public_profile_column_to_re_accounts_table',15),(134,'2023_08_09_004607_make_column_project_id_nullable',15),(135,'2023_09_11_084630_update_mandatory_fields_in_consult_form_table',15),(136,'2023_11_21_071820_add_missing_slug_for_agents',15),(137,'2024_01_11_084816_add_investor_translations_table',15),(138,'2024_01_31_022842_add_description_to_re_packages_table',15),(139,'2024_03_13_000001_drop_type_column_from_custom_field_translations_table',15),(140,'2024_04_23_124505_add_features_column_to_re_packages',15),(141,'2024_04_23_135106_add_columns_to_re_investors',15),(142,'2024_05_25_000001_update_captcha_settings_for_real_estate',15),(143,'2024_06_16_163428_make_investor_id_nullable',15),(144,'2024_06_20_103539_create_consult_custom_fields_table',15),(145,'2024_07_08_235824_fix_facilities_primary_key',15),(146,'2024_07_26_090340_add_private_notes_column_to_re_properties_projects_table',15),(147,'2024_08_09_075542_add_accounts_translations',15),(148,'2024_08_12_124528_add_approved_at_column_to_re_accounts_table',15),(149,'2024_08_31_074158_add_floor_plans_columns_to_re_properties_table',15),(150,'2024_09_04_130921_add_reject_reason_column_to_re_properties_table',15),(151,'2024_09_19_021436_make_email_in_accounts_table_nullable',15),(152,'2024_11_18_023706_add_floor_plan_to_table_re_properties_translations',15),(153,'2024_12_01_000000_add_floor_plans_column_to_re_projects_table',15),(154,'2024_12_18_000000_add_blocked_at_column_to_re_accounts_table',15),(155,'2024_12_18_000001_add_blocked_reason_column_to_re_accounts_table',15),(156,'2025_04_12_161730_add_featured_priority_to_re_properties_table',15),(157,'2025_04_12_165120_add_featured_priority_to_re_projects_table',15),(158,'2025_04_23_034738_make_featured_priority_nullable',15),(159,'2025_05_19_000001_add_zip_code_to_properties_and_projects_tables',15),(160,'2025_07_31_083138_add_indexes_for_real_estate_location_search',15),(161,'2025_08_12_085710_add_verification_fields_to_re_accounts_table',15),(162,'2025_08_14_025316_change_column_description_in_re_accounts_translations_to_text',15),(163,'2025_09_30_103625_add_performance_indexes_to_re_properties_table',15),(164,'2025_09_30_103746_add_status_index_to_re_reviews_table',15),(165,'2025_09_30_103813_add_composite_query_index_to_re_properties_table',15),(166,'2025_09_30_104436_add_performance_indexes_to_re_categories_table',15),(167,'2025_10_10_093314_add_number_format_style_and_space_to_re_currencies_table',15),(168,'2025_04_08_040931_create_social_logins_table',16),(169,'2018_07_09_214610_create_testimonial_table',17),(170,'2021_12_03_083642_create_testimonials_translations',17),(171,'2016_10_07_193005_create_translations_table',18),(172,'2023_12_12_105220_drop_translations_table',18),(173,'2021_08_05_134214_fix_social_link_theme_options',19),(174,'2022_06_04_033634_improve_homepage_content',19),(175,'2022_11_06_070405_improve_homepage_search_box',19),(176,'2023_05_08_114004_improve_properties_and_projects_page',19),(177,'2023_07_18_040500_convert_cities_is_featured_to_selecting_locations_from_shortcode',19),(178,'2024_12_31_081648_correct_career_slugs',19),(179,'2025_10_22_000001_add_whatsapp_to_re_accounts_table',20),(180,'2025_10_29_100000_add_sessions_invalidated_at_to_users_table',21),(181,'2025_11_07_000001_add_actor_type_to_audit_histories_table',21),(182,'2025_11_10_000000_cleanup_duplicate_widgets',21),(183,'2025_11_24_142748_add_privacy_settings_to_re_accounts_table',22),(184,'2024_12_01_000000_add_indexes_to_slugs_translations_table',23),(185,'2024_12_01_000000_add_key_prefix_index_to_slugs_table',23),(186,'2025_11_30_100000_add_sessions_invalidated_at_to_users_table',23),(187,'2024_12_01_000000_add_indexes_to_blog_translations_tables',24),(188,'2024_12_01_000000_add_indexes_to_contact_translations_tables',24),(189,'2024_12_01_000000_add_indexes_to_faq_translations_tables',24),(190,'2024_12_01_000000_add_indexes_to_pages_translations_table',24),(191,'2024_12_01_000000_add_indexes_to_real_estate_translations_tables',24);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `newsletters`
--

DROP TABLE IF EXISTS `newsletters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `newsletters` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'subscribed',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `newsletters`
--

LOCK TABLES `newsletters` WRITE;
/*!40000 ALTER TABLE `newsletters` DISABLE KEYS */;
/*!40000 ALTER TABLE `newsletters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `user_id` bigint unsigned DEFAULT NULL,
  `image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `template` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pages_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages`
--

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` VALUES (1,'Home','<div>[search-box title=\"Find your favorite homes at Flex Home\" background_image=\"general/home-banner.jpg\" enable_search_projects_on_homepage_search=\"yes\" default_home_search_type=\"project\"][/search-box]</div><div>[featured-projects title=\"Featured projects\" subtitle=\"We make the best choices with the hottest and most prestigious projects, please visit the details below to find out more.\" limit=\"4\" enable_lazy_loading=\"yes\"][/featured-projects]</div><div>[properties-by-locations title=\"Properties by locations\" subtitle=\"Each place is a good choice, it will help you make the right decision, do not miss the opportunity to discover our wonderful properties.\" city=\"1,2,3,4,5\" enable_lazy_loading=\"yes\"][/properties-by-locations]</div><div>[properties-for-sale title=\"Properties For Sale\" subtitle=\"Below is a list of properties that are currently up for sale\" limit=\"8\" enable_lazy_loading=\"yes\"][/properties-for-sale]</div><div>[properties-for-rent title=\"Properties For Rent\" subtitle=\"Below is a detailed price list of each property for rent\" limit=\"8\" enable_lazy_loading=\"yes\"][/properties-for-rent]</div><div>[featured-agents title=\"Featured Agents\" enable_lazy_loading=\"yes\"][/featured-agents]</div><div>[mortgage-calculator style=\"default\" layout=\"horizontal\" form_style=\"modern\" form_size=\"xl\" form_alignment=\"center\" form_margin=\"50px 0\" form_title=\"Mortgage Calculator\" form_description=\"Calculate your monthly mortgage payments\" primary_color=\"#1d5f6f\" background_color=\"#f7f7f7\" enable_lazy_loading=\"yes\"][/mortgage-calculator]</div><div>[recently-viewed-properties title=\"Recently Viewed Properties\" subtitle=\"Your currently viewed properties.\" limit=\"8\" enable_lazy_loading=\"yes\"][/recently-viewed-properties]</div><div>[latest-news title=\"News\" subtitle=\"Below is the latest real estate news we get regularly updated from reliable sources.\" limit=\"4\" enable_lazy_loading=\"yes\"][/latest-news]</div>',1,NULL,'homepage',NULL,'published','2025-12-20 05:59:31','2025-12-20 05:59:31'),(2,'News','---',1,NULL,'default',NULL,'published','2025-12-20 05:59:31','2025-12-20 05:59:31'),(3,'About us','<h4><span style=\"font-size:18px;\"><b>1. COMPANY</b><span style=\"font-family:Arial,Helvetica,sans-serif;\"><strong> PROFILE</strong></span></span></h4>\n\n<p><span style=\"font-size:16px;\"><span style=\"font-family:Arial,Helvetica,sans-serif;\">Founded on August 28, 1993 (formerly known as Truong Thinh Phat Construction Co., Ltd.), Flex Home operates in the field of real estate business, building villas for rent.<br />\nWith the slogan &quot;Breaking time, through space&quot; with a sustainable development strategy, taking Real Estate as a focus area, Flex Home is constantly connecting between buyers and sellers in the field. Real estate, bringing people closer together, over the distance of time and space, is a reliable place for real estate investment - an area that is constantly evolving over time.</span></span></p>\n\n<blockquote>\n<h2 style=\"font-style: italic; text-align: center;\"><span style=\"font-size:24px;\"><strong><span style=\"font-family:Arial,Helvetica,sans-serif;\"><span style=\"color:#16a085;\">&quot;Breaking time, through space&quot;</span></span></strong></span></h2>\n</blockquote>\n\n<h4 style=\"text-align: center;\"><img alt=\"\" src=\"https://flex-home.test/storage/general/asset-3-at-3x.png\" style=\"width: 90%;\" /></h4>\n\n<h4><span style=\"font-size:18px;\"><b><font face=\"Arial, Helvetica, sans-serif\">2. VISION&nbsp;</font></b></span></h4>\n\n<p><span style=\"font-size:16px;\"><span style=\"font-family:Arial,Helvetica,sans-serif;\">- Acquiring domestic areas.<br />\n- Reaching far across continents.</span></span></p>\n\n<h4><span style=\"font-size:18px;\"><b>3. MISSION</b></span></h4>\n\n<p><span style=\"font-size:16px;\"><span style=\"font-family:Arial,Helvetica,sans-serif;\">- Creating the community<br />\n- Building destinations<br />\n- Nurture happiness</span></span></p>\n\n<p><img alt=\"\" src=\"https://flex-home.test/storage/general/vietnam-office-4.jpg\" /></p>\n',1,NULL,'default','Founded on August 28, 1993 (formerly known as Truong Thinh Phat Construction Co., Ltd.), Flex Home operates in the field of real estate business, building villas for rent.\nWith the slogan \"Breaking time, through space\" with a sustainable development strategy, taking Real Estate as a focus area, Flex Home is constantly connecting between buyers and sellers in the field.','published','2025-12-20 05:59:31','2025-12-20 05:59:31'),(4,'Contact','<p>[contact-form][/contact-form]<br />\n&nbsp;</p>\n\n<h3>Directions</h3>\n\n<p>[google-map]North Link Building, 10 Admiralty Street, 757695 Singapore[/google-map]</p>\n\n<p>&nbsp;</p>',1,NULL,'default',NULL,'published','2025-12-20 05:59:31','2025-12-20 05:59:31'),(5,'Terms &amp; Conditions','<p style=\"text-align: justify;\"><span style=\"font-size:16px;\"><span style=\"font-family:Arial,Helvetica,sans-serif;\">Access to and use of the Flex Home website is subject to the following terms, conditions, and relevant laws of Vietnam.</span></span></p>\n\n<h4 style=\"text-align: justify;\"><span style=\"font-size:18px;\"><span style=\"font-family:Arial,Helvetica,sans-serif;\"><strong>1. Copyright</strong></span></span></h4>\n\n<p style=\"text-align: justify;\"><span style=\"font-size:16px;\"><span style=\"font-family:Arial,Helvetica,sans-serif;\">Copyrights and other intellectual property rights to all text, images, audio, software and other content on this site are owned by Flex Home and its affiliates. Users are allowed to view the contents of the website, cite the contents by printing, downloading the hard disk and distributing it to others for non-commercial purposes, providing information or personal purposes. </span></span><span style=\"font-size:16px;\"><span style=\"font-family:Arial,Helvetica,sans-serif;\">Any content from this site may not be used for sale or distribution for profit, nor may it be edited or included in any other publication or website.</span></span></p>\n\n<h4 style=\"text-align: justify;\"><span style=\"font-size:18px;\"><span style=\"font-family:Arial,Helvetica,sans-serif;\"><strong>2. Content</strong></span></span></h4>\n\n<p style=\"text-align: justify;\"><span style=\"font-size:16px;\"><span style=\"font-family:Arial,Helvetica,sans-serif;\">The information on this website is compiled with great confidence but for general information research purposes only. While we endeavor to maintain updated and accurate information, we make no representations or warranties in any manner regarding completeness, accuracy, reliability, appropriateness or availability in relation to web site, or related information, product, service, or image within the website for any purpose. </span></span></p>\n\n<p style=\"text-align: justify;\"><span style=\"font-size:16px;\"><span style=\"font-family:Arial,Helvetica,sans-serif;\">Flex Home and its employees, managers, and agents are not responsible for any loss, damage or expense incurred as a result of accessing and using this website and the sites. </span></span><span style=\"font-size:16px;\"><span style=\"font-family:Arial,Helvetica,sans-serif;\">The web is connected to it, including but not limited to, loss of profits, direct or indirect losses. We are also not responsible, or jointly responsible, if the site is temporarily inaccessible due to technical issues beyond our control. Any comments, suggestions, images, ideas and other information or materials that users submit to us through this site will become our exclusive property, including the right to may arise in the future associated with us.</span></span></p>\n\n<p style=\"text-align: center;\"><span style=\"font-size:16px;\"><span style=\"font-family:Arial,Helvetica,sans-serif;\"><img alt=\"\" src=\"https://flex-home.test/storage/general/copyright.jpg\" style=\"width: 90%;\" /></span></span></p>\n\n<h4 style=\"text-align: justify;\"><span style=\"font-size:18px;\"><span style=\"font-family:Arial,Helvetica,sans-serif;\"><strong>3. Note on&nbsp;connected sites</strong></span></span></h4>\n\n<p style=\"text-align: justify;\"><span style=\"font-size:16px;\"><span style=\"font-family:Arial,Helvetica,sans-serif;\">At many points in the website, users can get links to other websites related to a specific aspect. This does not mean that we are related to the websites or companies that own these websites. Although we intend to connect users to sites of interest, we are not responsible or jointly responsible for our employees, managers, or representatives. with other websites and information contained therein.</span></span></p>\n',1,NULL,'default','Copyrights and other intellectual property rights to all text, images, audio, software and other content on this site are owned by Flex Home and its affiliates. Users are allowed to view the contents of the website, cite the contents by printing, downloading the hard disk and distributing it to others for non-commercial purposes.','published','2025-12-20 05:59:31','2025-12-20 05:59:31'),(6,'Cookie Policy','<h3>EU Cookie Consent</h3><p>To use this website we are using Cookies and collecting some Data. To be compliant with the EU GDPR we give you to choose if you allow us to use certain Cookies and to collect some Data.</p><h4>Essential Data</h4><p>The Essential Data is needed to run the Site you are visiting technically. You can not deactivate them.</p><p>- Session Cookie: PHP uses a Cookie to identify user sessions. Without this Cookie the Website is not working.</p><p>- XSRF-Token Cookie: Laravel automatically generates a CSRF \"token\" for each active user session managed by the application. This token is used to verify that the authenticated user is the one actually making the requests to the application.</p>',1,NULL,'default',NULL,'published','2025-12-20 05:59:31','2025-12-20 05:59:31'),(7,'Properties','<div>[properties-list title=\"Discover our properties\" description=\"Discover our properties\" description=\"Each place is a good choice, it will help you make the right decision, do not miss the opportunity to discover our wonderful properties.\" number_of_properties_per_page=\"12\"][/properties-list]</div>',1,NULL,'homepage',NULL,'published','2025-12-20 05:59:31','2025-12-20 05:59:31'),(8,'Projects','<div>[projects-list  title=\"Discover our projects\" description=\"We make the best choices with the hottest and most prestigious projects, please visit the details below to find out more\" number_of_projects_per_page=\"12\"][/projects-list]</div>',1,NULL,'homepage',NULL,'published','2025-12-20 05:59:31','2025-12-20 05:59:31'),(9,'FAQs','[faqs category_ids=&quot;1,2,3&quot; display_type=&quot;group&quot; expand_first_time=&quot;1&quot; enable_lazy_loading=&quot;yes&quot;][/faqs]',1,NULL,'default',NULL,'published','2025-12-20 05:59:31','2025-12-20 05:59:31'),(10,'Pricing Plans','<div>[pricing-plan title=\"Choose Your Perfect Plan\" subtitle=\"Select from our range of pricing packages designed to meet your property listing needs. Whether you\'re just starting or need unlimited listings, we have the right plan for you.\" package_ids=\"1,2,3,4,5\"][/pricing-plan]</div>',1,NULL,'default','Choose the perfect plan for your property listing needs. We offer flexible pricing options to suit every budget.','published','2025-12-20 05:59:31','2025-12-20 05:59:31');
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages_translations`
--

DROP TABLE IF EXISTS `pages_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pages_translations` (
  `lang_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `pages_id` bigint unsigned NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`pages_id`),
  KEY `idx_pages_trans_pages_id` (`pages_id`),
  KEY `idx_pages_trans_page_lang` (`pages_id`,`lang_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages_translations`
--

LOCK TABLES `pages_translations` WRITE;
/*!40000 ALTER TABLE `pages_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `pages_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_logs`
--

DROP TABLE IF EXISTS `payment_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_logs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `payment_method` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `request` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `response` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `ip_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_logs`
--

LOCK TABLES `payment_logs` WRITE;
/*!40000 ALTER TABLE `payment_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `currency` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint unsigned NOT NULL DEFAULT '0',
  `charge_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_channel` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(15,2) unsigned NOT NULL,
  `payment_fee` decimal(15,2) DEFAULT '0.00',
  `order_id` bigint unsigned DEFAULT NULL,
  `status` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'pending',
  `payment_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'confirm',
  `customer_id` bigint unsigned DEFAULT NULL,
  `refunded_amount` decimal(15,2) unsigned DEFAULT NULL,
  `refund_note` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `customer_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `metadata` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_categories`
--

DROP TABLE IF EXISTS `post_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_categories` (
  `category_id` bigint unsigned NOT NULL,
  `post_id` bigint unsigned NOT NULL,
  KEY `post_categories_category_id_index` (`category_id`),
  KEY `post_categories_post_id_index` (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_categories`
--

LOCK TABLES `post_categories` WRITE;
/*!40000 ALTER TABLE `post_categories` DISABLE KEYS */;
INSERT INTO `post_categories` VALUES (1,307),(2,307),(1,308),(2,308),(2,309),(4,309),(1,310),(4,310),(1,311),(2,311),(1,312),(3,312),(3,313),(4,313),(3,314),(4,314),(2,315),(3,315),(1,316),(2,316),(2,317),(4,317),(2,318),(3,318),(2,319),(4,319),(3,320),(4,320),(1,321),(4,321),(3,322),(4,322);
/*!40000 ALTER TABLE `post_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_tags`
--

DROP TABLE IF EXISTS `post_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_tags` (
  `tag_id` bigint unsigned NOT NULL,
  `post_id` bigint unsigned NOT NULL,
  KEY `post_tags_tag_id_index` (`tag_id`),
  KEY `post_tags_post_id_index` (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_tags`
--

LOCK TABLES `post_tags` WRITE;
/*!40000 ALTER TABLE `post_tags` DISABLE KEYS */;
INSERT INTO `post_tags` VALUES (1,307),(2,307),(3,307),(1,308),(2,308),(3,308),(1,309),(2,309),(3,309),(1,310),(2,310),(3,310),(1,311),(2,311),(3,311),(1,312),(2,312),(3,312),(1,313),(2,313),(3,313),(1,314),(2,314),(3,314),(1,315),(2,315),(3,315),(1,316),(2,316),(3,316),(1,317),(2,317),(3,317),(1,318),(2,318),(3,318),(1,319),(2,319),(3,319),(1,320),(2,320),(3,320),(1,321),(2,321),(3,321),(1,322),(2,322),(3,322);
/*!40000 ALTER TABLE `post_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `author_id` bigint unsigned DEFAULT NULL,
  `author_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_featured` tinyint unsigned NOT NULL DEFAULT '0',
  `image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `views` int unsigned NOT NULL DEFAULT '0',
  `format_type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `posts_status_index` (`status`),
  KEY `posts_author_id_index` (`author_id`),
  KEY `posts_author_type_index` (`author_type`),
  KEY `posts_created_at_index` (`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=323 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,'Top 10 Tips for First-time Home Buyers','Mercia and Northumbria, declared for him: and even Stigand, the patriotic archbishop of Canterbury, found it so yet,\' said the sage, as he fumbled over the jury-box with the game,\' the Queen left.','<h5>Understanding Housing Stocks</h5>\n<p>\n    Housing stocks encompass companies involved in\n    various aspects of the real estate industry, including home builders, developers, and\n    related service providers. Factors influencing these stocks range from interest\n    rates and economic indicators to trends in home ownership rates.\n</p>\n<p>\n    Pay close attention to economic indicators such as\n    employment rates, GDP growth, and consumer confidence. A strong economy often\n    correlates with increased demand for housing, benefiting related stocks.\n</p>\n[content-quote message=\"Lower rates can boost home buying activity, benefiting housing stocks, while higher rates may have the opposite effect.\" author=\"Nelson Mandela\"][/content-quote]\n\n[content-image number_of_columns=\"col-2\" quantity=\"2\" image_1=\"posts/md-1.jpg\" image_2=\"posts/md-2.jpg\"][/content-image]\n\n<h5>Identify Emerging Trends</h5>\n<p>\n    Stay informed about emerging trends in the housing\n    market, such as the demand for sustainable homes, technological advancements, and\n    demographic shifts. Companies aligning with these trends may present attractive\n    investment opportunities.\n</p>\n<p>\n    Take a long-term investment approach if you believe in\n    the stability and growth potential of the housing sector. Look for companies with\n    solid fundamentals and a track record of success. For short-term traders, capitalize\n    on market fluctuations driven by economic reports, interest rate changes, or\n    industry-specific news. Keep a close eye on earnings reports and government housing\n    data releases.\n</p>\n\n<ul>\n    <li><strong>Affordability:</strong> Compared to larger apartments, 1BHK units are more budget-friendly, making them\n        ideal for individuals and young professionals.\n    </li>\n    <li><strong>Convenience:</strong> These apartments are easier to maintain and are perfect for those who prefer a minimalist\n        lifestyle.\n    </li>\n    <li><strong>Modern Amenities:</strong> Many 1BHK apartments in Dubai come with state-of-the-art facilities such as\n        gyms, swimming pools, and 24/7 security.\n    </li>\n</ul>\n','published',1,'Botble\\ACL\\Models\\User',1,'posts/8.jpg',2380,NULL,'2025-12-20 05:59:36','2025-12-20 05:59:36'),(2,'How to Stage Your Home for a Quick Sale','Cat remarked. \'Don\'t be impertinent,\' said the Duchess, \'chop off her knowledge, as there was generally a frog or a serpent?\' \'It matters a good deal: this fireplace is narrow, to be otherwise.\"\' \'I.','<h5>Understanding Housing Stocks</h5>\n<p>\n    Housing stocks encompass companies involved in\n    various aspects of the real estate industry, including home builders, developers, and\n    related service providers. Factors influencing these stocks range from interest\n    rates and economic indicators to trends in home ownership rates.\n</p>\n<p>\n    Pay close attention to economic indicators such as\n    employment rates, GDP growth, and consumer confidence. A strong economy often\n    correlates with increased demand for housing, benefiting related stocks.\n</p>\n[content-quote message=\"Lower rates can boost home buying activity, benefiting housing stocks, while higher rates may have the opposite effect.\" author=\"Nelson Mandela\"][/content-quote]\n\n[content-image number_of_columns=\"col-2\" quantity=\"2\" image_1=\"posts/md-1.jpg\" image_2=\"posts/md-2.jpg\"][/content-image]\n\n<h5>Identify Emerging Trends</h5>\n<p>\n    Stay informed about emerging trends in the housing\n    market, such as the demand for sustainable homes, technological advancements, and\n    demographic shifts. Companies aligning with these trends may present attractive\n    investment opportunities.\n</p>\n<p>\n    Take a long-term investment approach if you believe in\n    the stability and growth potential of the housing sector. Look for companies with\n    solid fundamentals and a track record of success. For short-term traders, capitalize\n    on market fluctuations driven by economic reports, interest rate changes, or\n    industry-specific news. Keep a close eye on earnings reports and government housing\n    data releases.\n</p>\n\n<ul>\n    <li><strong>Affordability:</strong> Compared to larger apartments, 1BHK units are more budget-friendly, making them\n        ideal for individuals and young professionals.\n    </li>\n    <li><strong>Convenience:</strong> These apartments are easier to maintain and are perfect for those who prefer a minimalist\n        lifestyle.\n    </li>\n    <li><strong>Modern Amenities:</strong> Many 1BHK apartments in Dubai come with state-of-the-art facilities such as\n        gyms, swimming pools, and 24/7 security.\n    </li>\n</ul>\n','published',1,'Botble\\ACL\\Models\\User',0,'posts/1.jpg',963,NULL,'2025-12-20 05:59:36','2025-12-20 05:59:36'),(3,'Understanding the Current Real Estate Market Trends','ARE a simpleton.\' Alice did not like to hear his history. I must go by the Hatter, it woke up again with a sigh. \'I only took the watch and looked anxiously at the window, I only wish people knew.','<h5>Understanding Housing Stocks</h5>\n<p>\n    Housing stocks encompass companies involved in\n    various aspects of the real estate industry, including home builders, developers, and\n    related service providers. Factors influencing these stocks range from interest\n    rates and economic indicators to trends in home ownership rates.\n</p>\n<p>\n    Pay close attention to economic indicators such as\n    employment rates, GDP growth, and consumer confidence. A strong economy often\n    correlates with increased demand for housing, benefiting related stocks.\n</p>\n[content-quote message=\"Lower rates can boost home buying activity, benefiting housing stocks, while higher rates may have the opposite effect.\" author=\"Nelson Mandela\"][/content-quote]\n\n[content-image number_of_columns=\"col-2\" quantity=\"2\" image_1=\"posts/md-1.jpg\" image_2=\"posts/md-2.jpg\"][/content-image]\n\n<h5>Identify Emerging Trends</h5>\n<p>\n    Stay informed about emerging trends in the housing\n    market, such as the demand for sustainable homes, technological advancements, and\n    demographic shifts. Companies aligning with these trends may present attractive\n    investment opportunities.\n</p>\n<p>\n    Take a long-term investment approach if you believe in\n    the stability and growth potential of the housing sector. Look for companies with\n    solid fundamentals and a track record of success. For short-term traders, capitalize\n    on market fluctuations driven by economic reports, interest rate changes, or\n    industry-specific news. Keep a close eye on earnings reports and government housing\n    data releases.\n</p>\n\n<ul>\n    <li><strong>Affordability:</strong> Compared to larger apartments, 1BHK units are more budget-friendly, making them\n        ideal for individuals and young professionals.\n    </li>\n    <li><strong>Convenience:</strong> These apartments are easier to maintain and are perfect for those who prefer a minimalist\n        lifestyle.\n    </li>\n    <li><strong>Modern Amenities:</strong> Many 1BHK apartments in Dubai come with state-of-the-art facilities such as\n        gyms, swimming pools, and 24/7 security.\n    </li>\n</ul>\n','published',1,'Botble\\ACL\\Models\\User',1,'posts/4.jpg',1699,NULL,'2025-12-20 05:59:36','2025-12-20 05:59:36'),(4,'DIY Home Improvement Projects That Add Value','As she said to herself. \'I dare say you never to lose YOUR temper!\' \'Hold your tongue!\' added the Dormouse, after thinking a minute or two, it was a good character, But said I didn\'t!\' interrupted.','<h5>Understanding Housing Stocks</h5>\n<p>\n    Housing stocks encompass companies involved in\n    various aspects of the real estate industry, including home builders, developers, and\n    related service providers. Factors influencing these stocks range from interest\n    rates and economic indicators to trends in home ownership rates.\n</p>\n<p>\n    Pay close attention to economic indicators such as\n    employment rates, GDP growth, and consumer confidence. A strong economy often\n    correlates with increased demand for housing, benefiting related stocks.\n</p>\n[content-quote message=\"Lower rates can boost home buying activity, benefiting housing stocks, while higher rates may have the opposite effect.\" author=\"Nelson Mandela\"][/content-quote]\n\n[content-image number_of_columns=\"col-2\" quantity=\"2\" image_1=\"posts/md-1.jpg\" image_2=\"posts/md-2.jpg\"][/content-image]\n\n<h5>Identify Emerging Trends</h5>\n<p>\n    Stay informed about emerging trends in the housing\n    market, such as the demand for sustainable homes, technological advancements, and\n    demographic shifts. Companies aligning with these trends may present attractive\n    investment opportunities.\n</p>\n<p>\n    Take a long-term investment approach if you believe in\n    the stability and growth potential of the housing sector. Look for companies with\n    solid fundamentals and a track record of success. For short-term traders, capitalize\n    on market fluctuations driven by economic reports, interest rate changes, or\n    industry-specific news. Keep a close eye on earnings reports and government housing\n    data releases.\n</p>\n\n<ul>\n    <li><strong>Affordability:</strong> Compared to larger apartments, 1BHK units are more budget-friendly, making them\n        ideal for individuals and young professionals.\n    </li>\n    <li><strong>Convenience:</strong> These apartments are easier to maintain and are perfect for those who prefer a minimalist\n        lifestyle.\n    </li>\n    <li><strong>Modern Amenities:</strong> Many 1BHK apartments in Dubai come with state-of-the-art facilities such as\n        gyms, swimming pools, and 24/7 security.\n    </li>\n</ul>\n','published',1,'Botble\\ACL\\Models\\User',1,'posts/4.jpg',947,NULL,'2025-12-20 05:59:36','2025-12-20 05:59:36'),(307,'The Top 2020 Handbag Trends to Know','Discover essential tips and strategies for navigating the real estate market successfully.','<p>[youtube-video]https://www.youtube.com/watch?v=SlPhMPnQ58k[/youtube-video]</p><p>The real estate market continues to evolve with changing buyer preferences and economic conditions. Experts suggest that understanding local market dynamics is crucial for making informed decisions. Whether you are buying your first home or investing in property, staying informed about market trends can help you navigate the complexities of real estate transactions.</p><p class=\"text-center\"><img src=\"/storage/news/1.jpg\"></p><p>Modern home design emphasizes open floor plans, natural lighting, and sustainable materials. Architects are increasingly incorporating smart home technology and energy-efficient features into their designs. The focus has shifted toward creating spaces that are both functional and aesthetically pleasing.</p><p class=\"text-center\"><img src=\"/storage/news/6.jpg\"></p><p>When choosing building materials, consider factors such as durability, maintenance requirements, and environmental impact. Quality materials may have higher upfront costs but often provide better long-term value. Sustainable options are becoming increasingly popular among environmentally conscious homeowners.</p><p class=\"text-center\"><img src=\"/storage/news/11.jpg\"></p><p>Interior design trends are moving toward minimalist aesthetics with warm, natural tones. Functionality is paramount, with storage solutions integrated seamlessly into living spaces. The goal is to create homes that feel both spacious and inviting.</p>','published',1,'Botble\\ACL\\Models\\User',1,'news/1.jpg',1509,NULL,'2025-12-20 05:59:36','2025-12-20 05:59:36'),(308,'Top Search Engine Optimization Strategies!','Learn about the latest trends in home design and architecture from industry experts.','<p>Modern home design emphasizes open floor plans, natural lighting, and sustainable materials. Architects are increasingly incorporating smart home technology and energy-efficient features into their designs. The focus has shifted toward creating spaces that are both functional and aesthetically pleasing.</p><p class=\"text-center\"><img src=\"/storage/news/2.jpg\"></p><p>When choosing building materials, consider factors such as durability, maintenance requirements, and environmental impact. Quality materials may have higher upfront costs but often provide better long-term value. Sustainable options are becoming increasingly popular among environmentally conscious homeowners.</p><p class=\"text-center\"><img src=\"/storage/news/7.jpg\"></p><p>Interior design trends are moving toward minimalist aesthetics with warm, natural tones. Functionality is paramount, with storage solutions integrated seamlessly into living spaces. The goal is to create homes that feel both spacious and inviting.</p><p class=\"text-center\"><img src=\"/storage/news/12.jpg\"></p><p>The real estate market continues to evolve with changing buyer preferences and economic conditions. Experts suggest that understanding local market dynamics is crucial for making informed decisions. Whether you are buying your first home or investing in property, staying informed about market trends can help you navigate the complexities of real estate transactions.</p>','published',1,'Botble\\ACL\\Models\\User',1,'news/2.jpg',1026,NULL,'2025-12-20 05:59:36','2025-12-20 05:59:36'),(309,'Which Company Would You Choose?','Explore practical advice for homeowners looking to improve their property value.','<p>When choosing building materials, consider factors such as durability, maintenance requirements, and environmental impact. Quality materials may have higher upfront costs but often provide better long-term value. Sustainable options are becoming increasingly popular among environmentally conscious homeowners.</p><p class=\"text-center\"><img src=\"/storage/news/3.jpg\"></p><p>Interior design trends are moving toward minimalist aesthetics with warm, natural tones. Functionality is paramount, with storage solutions integrated seamlessly into living spaces. The goal is to create homes that feel both spacious and inviting.</p><p class=\"text-center\"><img src=\"/storage/news/8.jpg\"></p><p>The real estate market continues to evolve with changing buyer preferences and economic conditions. Experts suggest that understanding local market dynamics is crucial for making informed decisions. Whether you are buying your first home or investing in property, staying informed about market trends can help you navigate the complexities of real estate transactions.</p><p class=\"text-center\"><img src=\"/storage/news/13.jpg\"></p><p>Modern home design emphasizes open floor plans, natural lighting, and sustainable materials. Architects are increasingly incorporating smart home technology and energy-efficient features into their designs. The focus has shifted toward creating spaces that are both functional and aesthetically pleasing.</p>','published',1,'Botble\\ACL\\Models\\User',1,'news/3.jpg',2429,NULL,'2025-12-20 05:59:36','2025-12-20 05:59:36'),(310,'Used Car Dealer Sales Tricks Exposed','Get insights into making smart real estate investments in today competitive market.','<p>[youtube-video]https://www.youtube.com/watch?v=SlPhMPnQ58k[/youtube-video]</p><p>Interior design trends are moving toward minimalist aesthetics with warm, natural tones. Functionality is paramount, with storage solutions integrated seamlessly into living spaces. The goal is to create homes that feel both spacious and inviting.</p><p class=\"text-center\"><img src=\"/storage/news/4.jpg\"></p><p>The real estate market continues to evolve with changing buyer preferences and economic conditions. Experts suggest that understanding local market dynamics is crucial for making informed decisions. Whether you are buying your first home or investing in property, staying informed about market trends can help you navigate the complexities of real estate transactions.</p><p class=\"text-center\"><img src=\"/storage/news/9.jpg\"></p><p>Modern home design emphasizes open floor plans, natural lighting, and sustainable materials. Architects are increasingly incorporating smart home technology and energy-efficient features into their designs. The focus has shifted toward creating spaces that are both functional and aesthetically pleasing.</p><p class=\"text-center\"><img src=\"/storage/news/14.jpg\"></p><p>When choosing building materials, consider factors such as durability, maintenance requirements, and environmental impact. Quality materials may have higher upfront costs but often provide better long-term value. Sustainable options are becoming increasingly popular among environmentally conscious homeowners.</p>','published',1,'Botble\\ACL\\Models\\User',1,'news/4.jpg',2268,NULL,'2025-12-20 05:59:36','2025-12-20 05:59:36'),(311,'20 Ways To Sell Your Product Faster','Discover essential tips and strategies for navigating the real estate market successfully.','<p>The real estate market continues to evolve with changing buyer preferences and economic conditions. Experts suggest that understanding local market dynamics is crucial for making informed decisions. Whether you are buying your first home or investing in property, staying informed about market trends can help you navigate the complexities of real estate transactions.</p><p class=\"text-center\"><img src=\"/storage/news/5.jpg\"></p><p>Modern home design emphasizes open floor plans, natural lighting, and sustainable materials. Architects are increasingly incorporating smart home technology and energy-efficient features into their designs. The focus has shifted toward creating spaces that are both functional and aesthetically pleasing.</p><p class=\"text-center\"><img src=\"/storage/news/10.jpg\"></p><p>When choosing building materials, consider factors such as durability, maintenance requirements, and environmental impact. Quality materials may have higher upfront costs but often provide better long-term value. Sustainable options are becoming increasingly popular among environmentally conscious homeowners.</p><p class=\"text-center\"><img src=\"/storage/news/11.jpg\"></p><p>Interior design trends are moving toward minimalist aesthetics with warm, natural tones. Functionality is paramount, with storage solutions integrated seamlessly into living spaces. The goal is to create homes that feel both spacious and inviting.</p>','published',1,'Botble\\ACL\\Models\\User',1,'news/5.jpg',1576,NULL,'2025-12-20 05:59:36','2025-12-20 05:59:36'),(312,'The Secrets Of Rich And Famous Writers','Learn about the latest trends in home design and architecture from industry experts.','<p>Modern home design emphasizes open floor plans, natural lighting, and sustainable materials. Architects are increasingly incorporating smart home technology and energy-efficient features into their designs. The focus has shifted toward creating spaces that are both functional and aesthetically pleasing.</p><p class=\"text-center\"><img src=\"/storage/news/1.jpg\"></p><p>When choosing building materials, consider factors such as durability, maintenance requirements, and environmental impact. Quality materials may have higher upfront costs but often provide better long-term value. Sustainable options are becoming increasingly popular among environmentally conscious homeowners.</p><p class=\"text-center\"><img src=\"/storage/news/6.jpg\"></p><p>Interior design trends are moving toward minimalist aesthetics with warm, natural tones. Functionality is paramount, with storage solutions integrated seamlessly into living spaces. The goal is to create homes that feel both spacious and inviting.</p><p class=\"text-center\"><img src=\"/storage/news/12.jpg\"></p><p>The real estate market continues to evolve with changing buyer preferences and economic conditions. Experts suggest that understanding local market dynamics is crucial for making informed decisions. Whether you are buying your first home or investing in property, staying informed about market trends can help you navigate the complexities of real estate transactions.</p>','published',1,'Botble\\ACL\\Models\\User',1,'news/6.jpg',1245,NULL,'2025-12-20 05:59:36','2025-12-20 05:59:36'),(313,'Imagine Losing 20 Pounds In 14 Days!','Explore practical advice for homeowners looking to improve their property value.','<p>[youtube-video]https://www.youtube.com/watch?v=SlPhMPnQ58k[/youtube-video]</p><p>When choosing building materials, consider factors such as durability, maintenance requirements, and environmental impact. Quality materials may have higher upfront costs but often provide better long-term value. Sustainable options are becoming increasingly popular among environmentally conscious homeowners.</p><p class=\"text-center\"><img src=\"/storage/news/2.jpg\"></p><p>Interior design trends are moving toward minimalist aesthetics with warm, natural tones. Functionality is paramount, with storage solutions integrated seamlessly into living spaces. The goal is to create homes that feel both spacious and inviting.</p><p class=\"text-center\"><img src=\"/storage/news/7.jpg\"></p><p>The real estate market continues to evolve with changing buyer preferences and economic conditions. Experts suggest that understanding local market dynamics is crucial for making informed decisions. Whether you are buying your first home or investing in property, staying informed about market trends can help you navigate the complexities of real estate transactions.</p><p class=\"text-center\"><img src=\"/storage/news/13.jpg\"></p><p>Modern home design emphasizes open floor plans, natural lighting, and sustainable materials. Architects are increasingly incorporating smart home technology and energy-efficient features into their designs. The focus has shifted toward creating spaces that are both functional and aesthetically pleasing.</p>','published',1,'Botble\\ACL\\Models\\User',1,'news/7.jpg',200,NULL,'2025-12-20 05:59:36','2025-12-20 05:59:36'),(314,'Are You Still Using That Slow, Old Typewriter?','Get insights into making smart real estate investments in today competitive market.','<p>Interior design trends are moving toward minimalist aesthetics with warm, natural tones. Functionality is paramount, with storage solutions integrated seamlessly into living spaces. The goal is to create homes that feel both spacious and inviting.</p><p class=\"text-center\"><img src=\"/storage/news/3.jpg\"></p><p>The real estate market continues to evolve with changing buyer preferences and economic conditions. Experts suggest that understanding local market dynamics is crucial for making informed decisions. Whether you are buying your first home or investing in property, staying informed about market trends can help you navigate the complexities of real estate transactions.</p><p class=\"text-center\"><img src=\"/storage/news/8.jpg\"></p><p>Modern home design emphasizes open floor plans, natural lighting, and sustainable materials. Architects are increasingly incorporating smart home technology and energy-efficient features into their designs. The focus has shifted toward creating spaces that are both functional and aesthetically pleasing.</p><p class=\"text-center\"><img src=\"/storage/news/14.jpg\"></p><p>When choosing building materials, consider factors such as durability, maintenance requirements, and environmental impact. Quality materials may have higher upfront costs but often provide better long-term value. Sustainable options are becoming increasingly popular among environmentally conscious homeowners.</p>','published',1,'Botble\\ACL\\Models\\User',1,'news/8.jpg',637,NULL,'2025-12-20 05:59:36','2025-12-20 05:59:36'),(315,'A Skin Cream That’s Proven To Work','Discover essential tips and strategies for navigating the real estate market successfully.','<p>The real estate market continues to evolve with changing buyer preferences and economic conditions. Experts suggest that understanding local market dynamics is crucial for making informed decisions. Whether you are buying your first home or investing in property, staying informed about market trends can help you navigate the complexities of real estate transactions.</p><p class=\"text-center\"><img src=\"/storage/news/4.jpg\"></p><p>Modern home design emphasizes open floor plans, natural lighting, and sustainable materials. Architects are increasingly incorporating smart home technology and energy-efficient features into their designs. The focus has shifted toward creating spaces that are both functional and aesthetically pleasing.</p><p class=\"text-center\"><img src=\"/storage/news/9.jpg\"></p><p>When choosing building materials, consider factors such as durability, maintenance requirements, and environmental impact. Quality materials may have higher upfront costs but often provide better long-term value. Sustainable options are becoming increasingly popular among environmentally conscious homeowners.</p><p class=\"text-center\"><img src=\"/storage/news/11.jpg\"></p><p>Interior design trends are moving toward minimalist aesthetics with warm, natural tones. Functionality is paramount, with storage solutions integrated seamlessly into living spaces. The goal is to create homes that feel both spacious and inviting.</p>','published',1,'Botble\\ACL\\Models\\User',1,'news/9.jpg',1240,NULL,'2025-12-20 05:59:36','2025-12-20 05:59:36'),(316,'10 Reasons To Start Your Own, Profitable Website!','Learn about the latest trends in home design and architecture from industry experts.','<p>[youtube-video]https://www.youtube.com/watch?v=SlPhMPnQ58k[/youtube-video]</p><p>Modern home design emphasizes open floor plans, natural lighting, and sustainable materials. Architects are increasingly incorporating smart home technology and energy-efficient features into their designs. The focus has shifted toward creating spaces that are both functional and aesthetically pleasing.</p><p class=\"text-center\"><img src=\"/storage/news/5.jpg\"></p><p>When choosing building materials, consider factors such as durability, maintenance requirements, and environmental impact. Quality materials may have higher upfront costs but often provide better long-term value. Sustainable options are becoming increasingly popular among environmentally conscious homeowners.</p><p class=\"text-center\"><img src=\"/storage/news/10.jpg\"></p><p>Interior design trends are moving toward minimalist aesthetics with warm, natural tones. Functionality is paramount, with storage solutions integrated seamlessly into living spaces. The goal is to create homes that feel both spacious and inviting.</p><p class=\"text-center\"><img src=\"/storage/news/12.jpg\"></p><p>The real estate market continues to evolve with changing buyer preferences and economic conditions. Experts suggest that understanding local market dynamics is crucial for making informed decisions. Whether you are buying your first home or investing in property, staying informed about market trends can help you navigate the complexities of real estate transactions.</p>','published',1,'Botble\\ACL\\Models\\User',0,'news/10.jpg',841,NULL,'2025-12-20 05:59:36','2025-12-20 05:59:36'),(317,'Simple Ways To Reduce Your Unwanted Wrinkles!','Explore practical advice for homeowners looking to improve their property value.','<p>When choosing building materials, consider factors such as durability, maintenance requirements, and environmental impact. Quality materials may have higher upfront costs but often provide better long-term value. Sustainable options are becoming increasingly popular among environmentally conscious homeowners.</p><p class=\"text-center\"><img src=\"/storage/news/1.jpg\"></p><p>Interior design trends are moving toward minimalist aesthetics with warm, natural tones. Functionality is paramount, with storage solutions integrated seamlessly into living spaces. The goal is to create homes that feel both spacious and inviting.</p><p class=\"text-center\"><img src=\"/storage/news/6.jpg\"></p><p>The real estate market continues to evolve with changing buyer preferences and economic conditions. Experts suggest that understanding local market dynamics is crucial for making informed decisions. Whether you are buying your first home or investing in property, staying informed about market trends can help you navigate the complexities of real estate transactions.</p><p class=\"text-center\"><img src=\"/storage/news/13.jpg\"></p><p>Modern home design emphasizes open floor plans, natural lighting, and sustainable materials. Architects are increasingly incorporating smart home technology and energy-efficient features into their designs. The focus has shifted toward creating spaces that are both functional and aesthetically pleasing.</p>','published',1,'Botble\\ACL\\Models\\User',0,'news/11.jpg',719,NULL,'2025-12-20 05:59:36','2025-12-20 05:59:36'),(318,'Apple iMac with Retina 5K display review','Get insights into making smart real estate investments in today competitive market.','<p>Interior design trends are moving toward minimalist aesthetics with warm, natural tones. Functionality is paramount, with storage solutions integrated seamlessly into living spaces. The goal is to create homes that feel both spacious and inviting.</p><p class=\"text-center\"><img src=\"/storage/news/2.jpg\"></p><p>The real estate market continues to evolve with changing buyer preferences and economic conditions. Experts suggest that understanding local market dynamics is crucial for making informed decisions. Whether you are buying your first home or investing in property, staying informed about market trends can help you navigate the complexities of real estate transactions.</p><p class=\"text-center\"><img src=\"/storage/news/7.jpg\"></p><p>Modern home design emphasizes open floor plans, natural lighting, and sustainable materials. Architects are increasingly incorporating smart home technology and energy-efficient features into their designs. The focus has shifted toward creating spaces that are both functional and aesthetically pleasing.</p><p class=\"text-center\"><img src=\"/storage/news/14.jpg\"></p><p>When choosing building materials, consider factors such as durability, maintenance requirements, and environmental impact. Quality materials may have higher upfront costs but often provide better long-term value. Sustainable options are becoming increasingly popular among environmentally conscious homeowners.</p>','published',1,'Botble\\ACL\\Models\\User',0,'news/12.jpg',1581,NULL,'2025-12-20 05:59:36','2025-12-20 05:59:36'),(319,'10,000 Web Site Visitors In One Month:Guaranteed','Discover essential tips and strategies for navigating the real estate market successfully.','<p>[youtube-video]https://www.youtube.com/watch?v=SlPhMPnQ58k[/youtube-video]</p><p>The real estate market continues to evolve with changing buyer preferences and economic conditions. Experts suggest that understanding local market dynamics is crucial for making informed decisions. Whether you are buying your first home or investing in property, staying informed about market trends can help you navigate the complexities of real estate transactions.</p><p class=\"text-center\"><img src=\"/storage/news/3.jpg\"></p><p>Modern home design emphasizes open floor plans, natural lighting, and sustainable materials. Architects are increasingly incorporating smart home technology and energy-efficient features into their designs. The focus has shifted toward creating spaces that are both functional and aesthetically pleasing.</p><p class=\"text-center\"><img src=\"/storage/news/8.jpg\"></p><p>When choosing building materials, consider factors such as durability, maintenance requirements, and environmental impact. Quality materials may have higher upfront costs but often provide better long-term value. Sustainable options are becoming increasingly popular among environmentally conscious homeowners.</p><p class=\"text-center\"><img src=\"/storage/news/11.jpg\"></p><p>Interior design trends are moving toward minimalist aesthetics with warm, natural tones. Functionality is paramount, with storage solutions integrated seamlessly into living spaces. The goal is to create homes that feel both spacious and inviting.</p>','published',1,'Botble\\ACL\\Models\\User',0,'news/13.jpg',780,NULL,'2025-12-20 05:59:36','2025-12-20 05:59:36'),(320,'Unlock The Secrets Of Selling High Ticket Items','Learn about the latest trends in home design and architecture from industry experts.','<p>Modern home design emphasizes open floor plans, natural lighting, and sustainable materials. Architects are increasingly incorporating smart home technology and energy-efficient features into their designs. The focus has shifted toward creating spaces that are both functional and aesthetically pleasing.</p><p class=\"text-center\"><img src=\"/storage/news/4.jpg\"></p><p>When choosing building materials, consider factors such as durability, maintenance requirements, and environmental impact. Quality materials may have higher upfront costs but often provide better long-term value. Sustainable options are becoming increasingly popular among environmentally conscious homeowners.</p><p class=\"text-center\"><img src=\"/storage/news/9.jpg\"></p><p>Interior design trends are moving toward minimalist aesthetics with warm, natural tones. Functionality is paramount, with storage solutions integrated seamlessly into living spaces. The goal is to create homes that feel both spacious and inviting.</p><p class=\"text-center\"><img src=\"/storage/news/12.jpg\"></p><p>The real estate market continues to evolve with changing buyer preferences and economic conditions. Experts suggest that understanding local market dynamics is crucial for making informed decisions. Whether you are buying your first home or investing in property, staying informed about market trends can help you navigate the complexities of real estate transactions.</p>','published',1,'Botble\\ACL\\Models\\User',0,'news/14.jpg',757,NULL,'2025-12-20 05:59:36','2025-12-20 05:59:36'),(321,'4 Expert Tips On How To Choose The Right Men’s Wallet','Explore practical advice for homeowners looking to improve their property value.','<p>When choosing building materials, consider factors such as durability, maintenance requirements, and environmental impact. Quality materials may have higher upfront costs but often provide better long-term value. Sustainable options are becoming increasingly popular among environmentally conscious homeowners.</p><p class=\"text-center\"><img src=\"/storage/news/5.jpg\"></p><p>Interior design trends are moving toward minimalist aesthetics with warm, natural tones. Functionality is paramount, with storage solutions integrated seamlessly into living spaces. The goal is to create homes that feel both spacious and inviting.</p><p class=\"text-center\"><img src=\"/storage/news/10.jpg\"></p><p>The real estate market continues to evolve with changing buyer preferences and economic conditions. Experts suggest that understanding local market dynamics is crucial for making informed decisions. Whether you are buying your first home or investing in property, staying informed about market trends can help you navigate the complexities of real estate transactions.</p><p class=\"text-center\"><img src=\"/storage/news/13.jpg\"></p><p>Modern home design emphasizes open floor plans, natural lighting, and sustainable materials. Architects are increasingly incorporating smart home technology and energy-efficient features into their designs. The focus has shifted toward creating spaces that are both functional and aesthetically pleasing.</p>','published',1,'Botble\\ACL\\Models\\User',0,'news/15.jpg',2301,NULL,'2025-12-20 05:59:36','2025-12-20 05:59:36'),(322,'Sexy Clutches: How to Buy &amp; Wear a Designer Clutch Bag','Get insights into making smart real estate investments in today competitive market.','<p>[youtube-video]https://www.youtube.com/watch?v=SlPhMPnQ58k[/youtube-video]</p><p>Interior design trends are moving toward minimalist aesthetics with warm, natural tones. Functionality is paramount, with storage solutions integrated seamlessly into living spaces. The goal is to create homes that feel both spacious and inviting.</p><p class=\"text-center\"><img src=\"/storage/news/1.jpg\"></p><p>The real estate market continues to evolve with changing buyer preferences and economic conditions. Experts suggest that understanding local market dynamics is crucial for making informed decisions. Whether you are buying your first home or investing in property, staying informed about market trends can help you navigate the complexities of real estate transactions.</p><p class=\"text-center\"><img src=\"/storage/news/6.jpg\"></p><p>Modern home design emphasizes open floor plans, natural lighting, and sustainable materials. Architects are increasingly incorporating smart home technology and energy-efficient features into their designs. The focus has shifted toward creating spaces that are both functional and aesthetically pleasing.</p><p class=\"text-center\"><img src=\"/storage/news/14.jpg\"></p><p>When choosing building materials, consider factors such as durability, maintenance requirements, and environmental impact. Quality materials may have higher upfront costs but often provide better long-term value. Sustainable options are becoming increasingly popular among environmentally conscious homeowners.</p>','published',1,'Botble\\ACL\\Models\\User',0,'news/16.jpg',1307,NULL,'2025-12-20 05:59:36','2025-12-20 05:59:36');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts_translations`
--

DROP TABLE IF EXISTS `posts_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts_translations` (
  `lang_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `posts_id` bigint unsigned NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`posts_id`),
  KEY `idx_posts_trans_posts_id` (`posts_id`),
  KEY `idx_posts_trans_post_lang` (`posts_id`,`lang_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts_translations`
--

LOCK TABLES `posts_translations` WRITE;
/*!40000 ALTER TABLE `posts_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `posts_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `push_notification_recipients`
--

DROP TABLE IF EXISTS `push_notification_recipients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `push_notification_recipients` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `push_notification_id` bigint unsigned NOT NULL,
  `user_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `device_token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `platform` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'sent',
  `sent_at` timestamp NULL DEFAULT NULL,
  `delivered_at` timestamp NULL DEFAULT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `clicked_at` timestamp NULL DEFAULT NULL,
  `fcm_response` json DEFAULT NULL,
  `error_message` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pnr_notification_user_index` (`push_notification_id`,`user_type`,`user_id`),
  KEY `pnr_user_status_index` (`user_type`,`user_id`,`status`),
  KEY `pnr_user_read_index` (`user_type`,`user_id`,`read_at`),
  KEY `pnr_status_index` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `push_notification_recipients`
--

LOCK TABLES `push_notification_recipients` WRITE;
/*!40000 ALTER TABLE `push_notification_recipients` DISABLE KEYS */;
/*!40000 ALTER TABLE `push_notification_recipients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `push_notifications`
--

DROP TABLE IF EXISTS `push_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `push_notifications` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'general',
  `target_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `target_value` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `action_url` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_url` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data` json DEFAULT NULL,
  `status` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'sent',
  `sent_count` int NOT NULL DEFAULT '0',
  `failed_count` int NOT NULL DEFAULT '0',
  `delivered_count` int NOT NULL DEFAULT '0',
  `read_count` int NOT NULL DEFAULT '0',
  `scheduled_at` timestamp NULL DEFAULT NULL,
  `sent_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `push_notifications_type_created_at_index` (`type`,`created_at`),
  KEY `push_notifications_status_scheduled_at_index` (`status`,`scheduled_at`),
  KEY `push_notifications_created_by_index` (`created_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `push_notifications`
--

LOCK TABLES `push_notifications` WRITE;
/*!40000 ALTER TABLE `push_notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `push_notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_account_activity_logs`
--

DROP TABLE IF EXISTS `re_account_activity_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_account_activity_logs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `action` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_agent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `reference_url` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ip_address` varchar(39) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `re_account_activity_logs_account_id_index` (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_account_activity_logs`
--

LOCK TABLES `re_account_activity_logs` WRITE;
/*!40000 ALTER TABLE `re_account_activity_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `re_account_activity_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_account_packages`
--

DROP TABLE IF EXISTS `re_account_packages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_account_packages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `account_id` bigint unsigned NOT NULL,
  `package_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_account_packages`
--

LOCK TABLES `re_account_packages` WRITE;
/*!40000 ALTER TABLE `re_account_packages` DISABLE KEYS */;
/*!40000 ALTER TABLE `re_account_packages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_account_password_resets`
--

DROP TABLE IF EXISTS `re_account_password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_account_password_resets` (
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `re_account_password_resets_email_index` (`email`),
  KEY `re_account_password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_account_password_resets`
--

LOCK TABLES `re_account_password_resets` WRITE;
/*!40000 ALTER TABLE `re_account_password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `re_account_password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_accounts`
--

DROP TABLE IF EXISTS `re_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_accounts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `gender` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar_id` bigint unsigned DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `phone` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `whatsapp` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `credits` int unsigned DEFAULT NULL,
  `confirmed_at` datetime DEFAULT NULL,
  `email_verify_token` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_featured` tinyint(1) NOT NULL DEFAULT '0',
  `is_verified` tinyint(1) NOT NULL DEFAULT '0',
  `verified_at` timestamp NULL DEFAULT NULL,
  `verified_by` bigint unsigned DEFAULT NULL,
  `verification_note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `is_public_profile` tinyint(1) NOT NULL DEFAULT '0',
  `hide_phone` tinyint(1) NOT NULL DEFAULT '0',
  `hide_email` tinyint(1) NOT NULL DEFAULT '0',
  `company` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_id` bigint unsigned DEFAULT NULL,
  `state_id` bigint unsigned DEFAULT NULL,
  `city_id` bigint unsigned DEFAULT NULL,
  `approved_at` datetime DEFAULT NULL,
  `blocked_at` datetime DEFAULT NULL,
  `blocked_reason` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `re_accounts_email_unique` (`email`),
  UNIQUE KEY `re_accounts_username_unique` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_accounts`
--

LOCK TABLES `re_accounts` WRITE;
/*!40000 ALTER TABLE `re_accounts` DISABLE KEYS */;
INSERT INTO `re_accounts` VALUES (1,'John','Smith','Full-service real estate professional for buyers and sellers.',NULL,'john.smith@botble.com','john-smith-677','$2y$12$KFdHz8xcgY4RwpDlHkhhyePVBFhtVOVkomS.Wc3XDy3dNkm9iJJtG',3554,'1978-12-09','+14155551234','+14155551234',10,'2025-12-20 12:59:27',NULL,NULL,'2025-12-20 05:59:28','2025-12-20 05:59:28',0,1,'2025-12-20 05:59:27',NULL,'Verified premium agent',1,0,0,NULL,NULL,NULL,NULL,'2025-12-20 12:59:27',NULL,NULL),(2,'Sarah','Johnson','Skilled negotiator with a proven track record of success.',NULL,'agent@botble.com','sarah-johnson-703','$2y$12$7UrwgaWYUtpT5W6g2w9.Lu1NwGHovcA.iGYtrD1hdHCcq6BKZZgK2',3555,'1996-05-24','+12125559876','+12125559876',10,'2025-12-20 12:59:27',NULL,NULL,'2025-12-20 05:59:28','2025-12-20 05:59:31',1,1,'2025-12-20 05:59:27',NULL,'Verified agent',1,0,0,NULL,NULL,NULL,NULL,'2025-12-20 12:59:27',NULL,NULL),(3,'Michael','Garcia','Experienced agent specializing in luxury homes and investment properties.',NULL,'michael.garcia0@example.com','michael-garcia-574','$2y$12$vjKckW.oSiU8.vwKievWKeBh41LsMKYmWRNm4qWPyCmG5so0ySX.m',3558,'1989-07-01','+14155551234','+14155551234',2,'2025-12-20 12:59:27',NULL,NULL,'2025-12-20 05:59:28','2025-12-20 05:59:28',0,0,NULL,NULL,'',1,0,0,NULL,NULL,NULL,NULL,'2025-12-20 12:59:27',NULL,NULL),(4,'Emily','Miller','Seasoned professional with extensive market knowledge.',NULL,'emily.miller1@example.com','emily-miller-912','$2y$12$Q2vLdaBYe5rbeJfYXCZCP.XJYF1nWTc9F/j1lW8fLB1z245SRBvIC',3553,'1973-01-18','+12125559876','+12125559876',8,'2025-12-20 12:59:27',NULL,NULL,'2025-12-20 05:59:28','2025-12-20 05:59:31',1,1,'2025-09-04 05:59:28',NULL,'Trusted partner',1,0,0,NULL,NULL,NULL,NULL,'2025-12-20 12:59:27',NULL,NULL),(5,'David','Davis','Skilled negotiator with a proven track record of success.',NULL,'david.davis2@example.com','david-davis-769','$2y$12$tTvy1Ed7.cjC9pRQge0nCOzfpEJZVKEK43tPhM250pbLQK4DPKG0S',3555,'1993-12-23','+13105557890','+13105557890',5,'2025-12-20 12:59:27',NULL,NULL,'2025-12-20 05:59:29','2025-12-20 05:59:29',0,0,NULL,NULL,'',1,0,0,NULL,NULL,NULL,NULL,'2025-12-20 12:59:27',NULL,NULL),(6,'Jennifer','Rodriguez','Seasoned professional with extensive market knowledge.',NULL,'jennifer.rodriguez3@example.com','jennifer-rodriguez-944','$2y$12$t/Mvqvpdy/Y.LEgLoHWSqupyBeRHR.2YZqf68MTGrydsG3Y0SpcLi',3552,'1993-02-18','+17185554321','+17185554321',6,'2025-12-20 12:59:27',NULL,NULL,'2025-12-20 05:59:29','2025-12-20 05:59:31',1,0,NULL,NULL,'',1,0,0,NULL,NULL,NULL,NULL,'2025-12-20 12:59:27',NULL,NULL),(7,'Robert','Martinez','Seasoned professional with extensive market knowledge.',NULL,'robert.martinez4@example.com','robert-martinez-920','$2y$12$TK4pA3hVaReN2wqNC/YOzemrU/08sQO8GSGx5C5kc/62nJx5OHqj6',3554,'1977-01-11','+16505558765','+16505558765',2,'2025-12-20 12:59:27',NULL,NULL,'2025-12-20 05:59:29','2025-12-20 05:59:29',0,1,'2025-09-09 05:59:29',NULL,'Verified agent',1,0,0,NULL,NULL,NULL,NULL,'2025-12-20 12:59:27',NULL,NULL),(8,'Lisa','Wilson','Experienced agent specializing in luxury homes and investment properties.',NULL,'lisa.wilson5@example.com','lisa-wilson-634','$2y$12$6ZBiDp99tdFJJ44UqD9/BedF9TCPEb0C9mFaq8ItePWJ7mqIdQ0q2',3557,'1978-04-21','+16465553456','+16465553456',1,'2025-12-20 12:59:27',NULL,NULL,'2025-12-20 05:59:29','2025-12-20 05:59:31',1,1,'2025-08-07 05:59:29',NULL,'Verified agent',1,0,0,NULL,NULL,NULL,NULL,'2025-12-20 12:59:27',NULL,NULL),(9,'James','Anderson','Top-performing agent with strong negotiation skills.',NULL,'james.anderson6@example.com','james-anderson-325','$2y$12$v6DKYT5eZigHZjV2X25PXu1eKystVrARuhYdlxOJ.8UkQRtgPynT6',3555,'1982-03-22','+14085552468','+14085552468',3,'2025-12-20 12:59:27',NULL,NULL,'2025-12-20 05:59:30','2025-12-20 05:59:30',0,1,'2025-07-08 05:59:30',NULL,'Premium member',1,0,0,NULL,NULL,NULL,NULL,'2025-12-20 12:59:27',NULL,NULL),(10,'Amanda','Smith','Top-performing agent with strong negotiation skills.',NULL,'amanda.smith7@example.com','amanda-smith-761','$2y$12$/BlUyrhXnPT0QHf2cGPOBeYQBg8fdvvRXw58i4QmOyXZ498Qu17VC',3554,'1973-11-07','+15105551357','+15105551357',8,'2025-12-20 12:59:27',NULL,NULL,'2025-12-20 05:59:30','2025-12-20 05:59:31',1,0,NULL,NULL,'',1,0,0,NULL,NULL,NULL,NULL,'2025-12-20 12:59:27',NULL,NULL),(11,'William','Johnson','Passionate about helping clients find their perfect home.',NULL,'william.johnson8@example.com','william-johnson-812','$2y$12$BJgs9hOsce/7myAzqf7jBuNOhGgyvdZHulZDnaUaeiW31RttyQjDq',3558,'1998-04-22','+16195559630','+16195559630',2,'2025-12-20 12:59:27',NULL,NULL,'2025-12-20 05:59:30','2025-12-20 05:59:30',0,1,'2025-07-27 05:59:30',NULL,'Premium member',1,0,0,NULL,NULL,NULL,NULL,'2025-12-20 12:59:27',NULL,NULL),(12,'Jessica','Williams','Skilled negotiator with a proven track record of success.',NULL,'jessica.williams9@example.com','jessica-williams-734','$2y$12$n41fRxKPieuGqKfUcQF/7uE2T.Q1v/RR8ocirxJcv4P3TtUWQ67aS',3552,'1974-08-11','+19495558520','+19495558520',9,'2025-12-20 12:59:27',NULL,NULL,'2025-12-20 05:59:31','2025-12-20 05:59:31',1,0,NULL,NULL,'',1,0,0,NULL,NULL,NULL,NULL,'2025-12-20 12:59:27',NULL,NULL);
/*!40000 ALTER TABLE `re_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_accounts_translations`
--

DROP TABLE IF EXISTS `re_accounts_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_accounts_translations` (
  `lang_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `re_accounts_id` bigint unsigned NOT NULL,
  `first_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`re_accounts_id`),
  KEY `idx_re_accounts_trans_fk` (`re_accounts_id`),
  KEY `idx_re_accounts_trans_fk_lang` (`re_accounts_id`,`lang_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_accounts_translations`
--

LOCK TABLES `re_accounts_translations` WRITE;
/*!40000 ALTER TABLE `re_accounts_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `re_accounts_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_categories`
--

DROP TABLE IF EXISTS `re_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `order` int unsigned NOT NULL DEFAULT '0',
  `is_default` tinyint NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `parent_id` bigint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_re_categories_status` (`status`),
  KEY `idx_re_categories_parent_id` (`parent_id`),
  KEY `idx_re_categories_status_parent_order` (`status`,`parent_id`,`order`),
  KEY `idx_re_categories_is_default` (`is_default`),
  KEY `idx_re_categories_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_categories`
--

LOCK TABLES `re_categories` WRITE;
/*!40000 ALTER TABLE `re_categories` DISABLE KEYS */;
INSERT INTO `re_categories` VALUES (1,'Apartment',NULL,'published',0,1,'2025-12-20 05:59:26','2025-12-20 05:59:26',0),(2,'Villa',NULL,'published',1,0,'2025-12-20 05:59:26','2025-12-20 05:59:26',0),(3,'Condo',NULL,'published',2,0,'2025-12-20 05:59:26','2025-12-20 05:59:26',0),(4,'House',NULL,'published',3,0,'2025-12-20 05:59:26','2025-12-20 05:59:26',0),(5,'Land',NULL,'published',4,0,'2025-12-20 05:59:26','2025-12-20 05:59:26',0),(6,'Commercial property',NULL,'published',5,0,'2025-12-20 05:59:26','2025-12-20 05:59:26',0);
/*!40000 ALTER TABLE `re_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_categories_translations`
--

DROP TABLE IF EXISTS `re_categories_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_categories_translations` (
  `lang_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `re_categories_id` bigint unsigned NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`re_categories_id`),
  KEY `idx_re_categories_trans_fk` (`re_categories_id`),
  KEY `idx_re_categories_trans_fk_lang` (`re_categories_id`,`lang_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_categories_translations`
--

LOCK TABLES `re_categories_translations` WRITE;
/*!40000 ALTER TABLE `re_categories_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `re_categories_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_consult_custom_field_options`
--

DROP TABLE IF EXISTS `re_consult_custom_field_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_consult_custom_field_options` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `custom_field_id` bigint unsigned NOT NULL,
  `label` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int NOT NULL DEFAULT '999',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_consult_custom_field_options`
--

LOCK TABLES `re_consult_custom_field_options` WRITE;
/*!40000 ALTER TABLE `re_consult_custom_field_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `re_consult_custom_field_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_consult_custom_field_options_translations`
--

DROP TABLE IF EXISTS `re_consult_custom_field_options_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_consult_custom_field_options_translations` (
  `re_consult_custom_field_options_id` bigint unsigned NOT NULL,
  `lang_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`re_consult_custom_field_options_id`),
  KEY `idx_re_ccfo_trans_fk` (`re_consult_custom_field_options_id`),
  KEY `idx_re_ccfo_trans_fk_lang` (`re_consult_custom_field_options_id`,`lang_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_consult_custom_field_options_translations`
--

LOCK TABLES `re_consult_custom_field_options_translations` WRITE;
/*!40000 ALTER TABLE `re_consult_custom_field_options_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `re_consult_custom_field_options_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_consult_custom_fields`
--

DROP TABLE IF EXISTS `re_consult_custom_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_consult_custom_fields` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `placeholder` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int NOT NULL DEFAULT '999',
  `status` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_consult_custom_fields`
--

LOCK TABLES `re_consult_custom_fields` WRITE;
/*!40000 ALTER TABLE `re_consult_custom_fields` DISABLE KEYS */;
INSERT INTO `re_consult_custom_fields` VALUES (1,'date',0,'Schedule a Tour (optional)',NULL,999,'published','2025-10-20 17:21:26','2025-10-20 17:21:26');
/*!40000 ALTER TABLE `re_consult_custom_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_consult_custom_fields_translations`
--

DROP TABLE IF EXISTS `re_consult_custom_fields_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_consult_custom_fields_translations` (
  `re_consult_custom_fields_id` bigint unsigned NOT NULL,
  `lang_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `placeholder` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`re_consult_custom_fields_id`),
  KEY `idx_re_ccf_trans_fk` (`re_consult_custom_fields_id`),
  KEY `idx_re_ccf_trans_fk_lang` (`re_consult_custom_fields_id`,`lang_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_consult_custom_fields_translations`
--

LOCK TABLES `re_consult_custom_fields_translations` WRITE;
/*!40000 ALTER TABLE `re_consult_custom_fields_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `re_consult_custom_fields_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_consults`
--

DROP TABLE IF EXISTS `re_consults`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_consults` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `project_id` bigint unsigned DEFAULT NULL,
  `property_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(39) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `custom_fields` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unread',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_consults`
--

LOCK TABLES `re_consults` WRITE;
/*!40000 ALTER TABLE `re_consults` DISABLE KEYS */;
/*!40000 ALTER TABLE `re_consults` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_coupons`
--

DROP TABLE IF EXISTS `re_coupons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_coupons` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` decimal(8,2) NOT NULL,
  `quantity` int DEFAULT NULL,
  `total_used` int unsigned NOT NULL DEFAULT '0',
  `expires_date` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `re_coupons_code_unique` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_coupons`
--

LOCK TABLES `re_coupons` WRITE;
/*!40000 ALTER TABLE `re_coupons` DISABLE KEYS */;
/*!40000 ALTER TABLE `re_coupons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_currencies`
--

DROP TABLE IF EXISTS `re_currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_currencies` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `symbol` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_prefix_symbol` tinyint unsigned NOT NULL DEFAULT '0',
  `decimals` tinyint unsigned NOT NULL DEFAULT '0',
  `number_format_style` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'western',
  `space_between_price_and_currency` tinyint(1) NOT NULL DEFAULT '0',
  `order` int unsigned NOT NULL DEFAULT '0',
  `is_default` tinyint NOT NULL DEFAULT '0',
  `exchange_rate` double NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_currencies`
--

LOCK TABLES `re_currencies` WRITE;
/*!40000 ALTER TABLE `re_currencies` DISABLE KEYS */;
INSERT INTO `re_currencies` VALUES (1,'USD','$',1,0,'western',0,0,1,1,'2025-12-20 05:59:26','2025-12-20 05:59:26'),(2,'EUR','€',0,0,'western',0,1,0,0.91,'2025-12-20 05:59:26','2025-12-20 05:59:26'),(3,'VND','₫',0,0,'western',0,2,0,23717.5,'2025-12-20 05:59:26','2025-12-20 05:59:26');
/*!40000 ALTER TABLE `re_currencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_custom_field_options`
--

DROP TABLE IF EXISTS `re_custom_field_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_custom_field_options` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `custom_field_id` bigint unsigned NOT NULL,
  `label` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int NOT NULL DEFAULT '999',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_custom_field_options`
--

LOCK TABLES `re_custom_field_options` WRITE;
/*!40000 ALTER TABLE `re_custom_field_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `re_custom_field_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_custom_field_options_translations`
--

DROP TABLE IF EXISTS `re_custom_field_options_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_custom_field_options_translations` (
  `lang_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `re_custom_field_options_id` bigint unsigned NOT NULL,
  `label` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`re_custom_field_options_id`),
  KEY `idx_re_cfo_trans_fk` (`re_custom_field_options_id`),
  KEY `idx_re_cfo_trans_fk_lang` (`re_custom_field_options_id`,`lang_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_custom_field_options_translations`
--

LOCK TABLES `re_custom_field_options_translations` WRITE;
/*!40000 ALTER TABLE `re_custom_field_options_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `re_custom_field_options_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_custom_field_values`
--

DROP TABLE IF EXISTS `re_custom_field_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_custom_field_values` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_id` bigint unsigned NOT NULL,
  `custom_field_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `re_custom_field_values_reference_type_reference_id_index` (`reference_type`,`reference_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_custom_field_values`
--

LOCK TABLES `re_custom_field_values` WRITE;
/*!40000 ALTER TABLE `re_custom_field_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `re_custom_field_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_custom_field_values_translations`
--

DROP TABLE IF EXISTS `re_custom_field_values_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_custom_field_values_translations` (
  `lang_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `re_custom_field_values_id` bigint unsigned NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`re_custom_field_values_id`),
  KEY `idx_re_cfv_trans_fk` (`re_custom_field_values_id`),
  KEY `idx_re_cfv_trans_fk_lang` (`re_custom_field_values_id`,`lang_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_custom_field_values_translations`
--

LOCK TABLES `re_custom_field_values_translations` WRITE;
/*!40000 ALTER TABLE `re_custom_field_values_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `re_custom_field_values_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_custom_fields`
--

DROP TABLE IF EXISTS `re_custom_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_custom_fields` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int NOT NULL DEFAULT '999',
  `is_global` tinyint(1) NOT NULL DEFAULT '0',
  `authorable_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `authorable_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `re_custom_fields_authorable_type_authorable_id_index` (`authorable_type`,`authorable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_custom_fields`
--

LOCK TABLES `re_custom_fields` WRITE;
/*!40000 ALTER TABLE `re_custom_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `re_custom_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_custom_fields_translations`
--

DROP TABLE IF EXISTS `re_custom_fields_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_custom_fields_translations` (
  `lang_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `re_custom_fields_id` bigint unsigned NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`re_custom_fields_id`),
  KEY `idx_re_cf_trans_fk` (`re_custom_fields_id`),
  KEY `idx_re_cf_trans_fk_lang` (`re_custom_fields_id`,`lang_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_custom_fields_translations`
--

LOCK TABLES `re_custom_fields_translations` WRITE;
/*!40000 ALTER TABLE `re_custom_fields_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `re_custom_fields_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_facilities`
--

DROP TABLE IF EXISTS `re_facilities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_facilities` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_facilities`
--

LOCK TABLES `re_facilities` WRITE;
/*!40000 ALTER TABLE `re_facilities` DISABLE KEYS */;
INSERT INTO `re_facilities` VALUES (1,'Hospital','far fa-hospital','published','2025-12-20 05:59:27','2025-12-20 05:59:27'),(2,'Super Market','fas fa-cart-plus','published','2025-12-20 05:59:27','2025-12-20 05:59:27'),(3,'School','fas fa-school','published','2025-12-20 05:59:27','2025-12-20 05:59:27'),(4,'Entertainment','fas fa-hotel','published','2025-12-20 05:59:27','2025-12-20 05:59:27'),(5,'Pharmacy','fas fa-prescription-bottle-alt','published','2025-12-20 05:59:27','2025-12-20 05:59:27'),(6,'Airport','fas fa-plane-departure','published','2025-12-20 05:59:27','2025-12-20 05:59:27'),(7,'Railways','fas fa-subway','published','2025-12-20 05:59:27','2025-12-20 05:59:27'),(8,'Bus Stop','fas fa-bus','published','2025-12-20 05:59:27','2025-12-20 05:59:27'),(9,'Beach','fas fa-umbrella-beach','published','2025-12-20 05:59:27','2025-12-20 05:59:27'),(10,'Mall','fas fa-cart-plus','published','2025-12-20 05:59:27','2025-12-20 05:59:27'),(11,'Bank','fas fa-university','published','2025-12-20 05:59:27','2025-12-20 05:59:27');
/*!40000 ALTER TABLE `re_facilities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_facilities_distances`
--

DROP TABLE IF EXISTS `re_facilities_distances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_facilities_distances` (
  `facility_id` bigint unsigned NOT NULL,
  `reference_id` bigint unsigned NOT NULL,
  `reference_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `distance` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`facility_id`,`reference_id`,`reference_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_facilities_distances`
--

LOCK TABLES `re_facilities_distances` WRITE;
/*!40000 ALTER TABLE `re_facilities_distances` DISABLE KEYS */;
INSERT INTO `re_facilities_distances` VALUES (1,1,'Botble\\RealEstate\\Models\\Property','8km'),(1,2,'Botble\\RealEstate\\Models\\Property','2km'),(1,3,'Botble\\RealEstate\\Models\\Property','12km'),(1,4,'Botble\\RealEstate\\Models\\Property','5km'),(1,5,'Botble\\RealEstate\\Models\\Property','12km'),(1,6,'Botble\\RealEstate\\Models\\Property','5km'),(1,7,'Botble\\RealEstate\\Models\\Property','14km'),(1,8,'Botble\\RealEstate\\Models\\Property','18km'),(1,9,'Botble\\RealEstate\\Models\\Property','7km'),(1,10,'Botble\\RealEstate\\Models\\Property','13km'),(1,11,'Botble\\RealEstate\\Models\\Property','7km'),(1,12,'Botble\\RealEstate\\Models\\Property','9km'),(1,13,'Botble\\RealEstate\\Models\\Property','17km'),(1,14,'Botble\\RealEstate\\Models\\Property','3km'),(1,15,'Botble\\RealEstate\\Models\\Property','20km'),(1,16,'Botble\\RealEstate\\Models\\Property','19km'),(1,17,'Botble\\RealEstate\\Models\\Property','11km'),(1,18,'Botble\\RealEstate\\Models\\Property','9km'),(1,19,'Botble\\RealEstate\\Models\\Property','8km'),(1,20,'Botble\\RealEstate\\Models\\Property','3km'),(1,21,'Botble\\RealEstate\\Models\\Property','1km'),(1,22,'Botble\\RealEstate\\Models\\Property','6km'),(1,23,'Botble\\RealEstate\\Models\\Property','6km'),(1,24,'Botble\\RealEstate\\Models\\Property','11km'),(1,25,'Botble\\RealEstate\\Models\\Property','9km'),(1,26,'Botble\\RealEstate\\Models\\Property','13km'),(1,27,'Botble\\RealEstate\\Models\\Property','15km'),(1,28,'Botble\\RealEstate\\Models\\Property','13km'),(1,29,'Botble\\RealEstate\\Models\\Property','9km'),(1,30,'Botble\\RealEstate\\Models\\Property','18km'),(1,31,'Botble\\RealEstate\\Models\\Property','3km'),(1,32,'Botble\\RealEstate\\Models\\Property','6km'),(1,33,'Botble\\RealEstate\\Models\\Property','8km'),(1,34,'Botble\\RealEstate\\Models\\Property','6km'),(1,35,'Botble\\RealEstate\\Models\\Property','10km'),(1,36,'Botble\\RealEstate\\Models\\Property','1km'),(1,37,'Botble\\RealEstate\\Models\\Property','11km'),(1,38,'Botble\\RealEstate\\Models\\Property','20km'),(1,39,'Botble\\RealEstate\\Models\\Property','8km'),(1,40,'Botble\\RealEstate\\Models\\Property','16km'),(1,41,'Botble\\RealEstate\\Models\\Property','10km'),(1,42,'Botble\\RealEstate\\Models\\Property','20km'),(1,43,'Botble\\RealEstate\\Models\\Property','7km'),(1,44,'Botble\\RealEstate\\Models\\Property','8km'),(1,45,'Botble\\RealEstate\\Models\\Property','14km'),(1,46,'Botble\\RealEstate\\Models\\Property','7km'),(1,47,'Botble\\RealEstate\\Models\\Property','5km'),(1,48,'Botble\\RealEstate\\Models\\Property','4km'),(1,49,'Botble\\RealEstate\\Models\\Property','10km'),(1,50,'Botble\\RealEstate\\Models\\Property','1km'),(1,51,'Botble\\RealEstate\\Models\\Property','17km'),(1,52,'Botble\\RealEstate\\Models\\Property','5km'),(1,53,'Botble\\RealEstate\\Models\\Property','18km'),(1,54,'Botble\\RealEstate\\Models\\Property','8km'),(1,55,'Botble\\RealEstate\\Models\\Property','10km'),(1,56,'Botble\\RealEstate\\Models\\Property','13km'),(1,57,'Botble\\RealEstate\\Models\\Property','19km'),(1,58,'Botble\\RealEstate\\Models\\Property','3km'),(1,59,'Botble\\RealEstate\\Models\\Property','10km'),(1,60,'Botble\\RealEstate\\Models\\Property','2km'),(1,61,'Botble\\RealEstate\\Models\\Property','4km'),(2,1,'Botble\\RealEstate\\Models\\Property','4km'),(2,2,'Botble\\RealEstate\\Models\\Property','3km'),(2,3,'Botble\\RealEstate\\Models\\Property','11km'),(2,4,'Botble\\RealEstate\\Models\\Property','12km'),(2,5,'Botble\\RealEstate\\Models\\Property','5km'),(2,6,'Botble\\RealEstate\\Models\\Property','15km'),(2,7,'Botble\\RealEstate\\Models\\Property','13km'),(2,8,'Botble\\RealEstate\\Models\\Property','4km'),(2,9,'Botble\\RealEstate\\Models\\Property','7km'),(2,10,'Botble\\RealEstate\\Models\\Property','16km'),(2,11,'Botble\\RealEstate\\Models\\Property','4km'),(2,12,'Botble\\RealEstate\\Models\\Property','8km'),(2,13,'Botble\\RealEstate\\Models\\Property','11km'),(2,14,'Botble\\RealEstate\\Models\\Property','2km'),(2,15,'Botble\\RealEstate\\Models\\Property','17km'),(2,16,'Botble\\RealEstate\\Models\\Property','16km'),(2,17,'Botble\\RealEstate\\Models\\Property','2km'),(2,18,'Botble\\RealEstate\\Models\\Property','16km'),(2,19,'Botble\\RealEstate\\Models\\Property','7km'),(2,20,'Botble\\RealEstate\\Models\\Property','4km'),(2,21,'Botble\\RealEstate\\Models\\Property','10km'),(2,22,'Botble\\RealEstate\\Models\\Property','10km'),(2,23,'Botble\\RealEstate\\Models\\Property','14km'),(2,24,'Botble\\RealEstate\\Models\\Property','17km'),(2,25,'Botble\\RealEstate\\Models\\Property','5km'),(2,26,'Botble\\RealEstate\\Models\\Property','10km'),(2,27,'Botble\\RealEstate\\Models\\Property','10km'),(2,28,'Botble\\RealEstate\\Models\\Property','13km'),(2,29,'Botble\\RealEstate\\Models\\Property','4km'),(2,30,'Botble\\RealEstate\\Models\\Property','8km'),(2,31,'Botble\\RealEstate\\Models\\Property','7km'),(2,32,'Botble\\RealEstate\\Models\\Property','9km'),(2,33,'Botble\\RealEstate\\Models\\Property','18km'),(2,34,'Botble\\RealEstate\\Models\\Property','10km'),(2,35,'Botble\\RealEstate\\Models\\Property','14km'),(2,36,'Botble\\RealEstate\\Models\\Property','3km'),(2,37,'Botble\\RealEstate\\Models\\Property','19km'),(2,38,'Botble\\RealEstate\\Models\\Property','20km'),(2,39,'Botble\\RealEstate\\Models\\Property','17km'),(2,40,'Botble\\RealEstate\\Models\\Property','17km'),(2,41,'Botble\\RealEstate\\Models\\Property','9km'),(2,42,'Botble\\RealEstate\\Models\\Property','2km'),(2,43,'Botble\\RealEstate\\Models\\Property','17km'),(2,44,'Botble\\RealEstate\\Models\\Property','20km'),(2,45,'Botble\\RealEstate\\Models\\Property','19km'),(2,46,'Botble\\RealEstate\\Models\\Property','12km'),(2,47,'Botble\\RealEstate\\Models\\Property','11km'),(2,48,'Botble\\RealEstate\\Models\\Property','13km'),(2,49,'Botble\\RealEstate\\Models\\Property','16km'),(2,50,'Botble\\RealEstate\\Models\\Property','19km'),(2,51,'Botble\\RealEstate\\Models\\Property','2km'),(2,52,'Botble\\RealEstate\\Models\\Property','3km'),(2,53,'Botble\\RealEstate\\Models\\Property','16km'),(2,54,'Botble\\RealEstate\\Models\\Property','8km'),(2,55,'Botble\\RealEstate\\Models\\Property','14km'),(2,56,'Botble\\RealEstate\\Models\\Property','16km'),(2,57,'Botble\\RealEstate\\Models\\Property','12km'),(2,58,'Botble\\RealEstate\\Models\\Property','17km'),(2,59,'Botble\\RealEstate\\Models\\Property','9km'),(2,60,'Botble\\RealEstate\\Models\\Property','8km'),(2,61,'Botble\\RealEstate\\Models\\Property','8km'),(3,1,'Botble\\RealEstate\\Models\\Property','8km'),(3,2,'Botble\\RealEstate\\Models\\Property','3km'),(3,3,'Botble\\RealEstate\\Models\\Property','4km'),(3,4,'Botble\\RealEstate\\Models\\Property','6km'),(3,5,'Botble\\RealEstate\\Models\\Property','6km'),(3,6,'Botble\\RealEstate\\Models\\Property','10km'),(3,7,'Botble\\RealEstate\\Models\\Property','11km'),(3,8,'Botble\\RealEstate\\Models\\Property','13km'),(3,9,'Botble\\RealEstate\\Models\\Property','1km'),(3,10,'Botble\\RealEstate\\Models\\Property','11km'),(3,11,'Botble\\RealEstate\\Models\\Property','14km'),(3,12,'Botble\\RealEstate\\Models\\Property','19km'),(3,13,'Botble\\RealEstate\\Models\\Property','11km'),(3,14,'Botble\\RealEstate\\Models\\Property','19km'),(3,15,'Botble\\RealEstate\\Models\\Property','14km'),(3,16,'Botble\\RealEstate\\Models\\Property','1km'),(3,17,'Botble\\RealEstate\\Models\\Property','12km'),(3,18,'Botble\\RealEstate\\Models\\Property','6km'),(3,19,'Botble\\RealEstate\\Models\\Property','6km'),(3,20,'Botble\\RealEstate\\Models\\Property','8km'),(3,21,'Botble\\RealEstate\\Models\\Property','3km'),(3,22,'Botble\\RealEstate\\Models\\Property','9km'),(3,23,'Botble\\RealEstate\\Models\\Property','3km'),(3,24,'Botble\\RealEstate\\Models\\Property','10km'),(3,25,'Botble\\RealEstate\\Models\\Property','2km'),(3,26,'Botble\\RealEstate\\Models\\Property','9km'),(3,27,'Botble\\RealEstate\\Models\\Property','18km'),(3,28,'Botble\\RealEstate\\Models\\Property','19km'),(3,29,'Botble\\RealEstate\\Models\\Property','18km'),(3,30,'Botble\\RealEstate\\Models\\Property','6km'),(3,31,'Botble\\RealEstate\\Models\\Property','2km'),(3,32,'Botble\\RealEstate\\Models\\Property','5km'),(3,33,'Botble\\RealEstate\\Models\\Property','17km'),(3,34,'Botble\\RealEstate\\Models\\Property','20km'),(3,35,'Botble\\RealEstate\\Models\\Property','17km'),(3,36,'Botble\\RealEstate\\Models\\Property','14km'),(3,37,'Botble\\RealEstate\\Models\\Property','11km'),(3,38,'Botble\\RealEstate\\Models\\Property','18km'),(3,39,'Botble\\RealEstate\\Models\\Property','4km'),(3,40,'Botble\\RealEstate\\Models\\Property','5km'),(3,41,'Botble\\RealEstate\\Models\\Property','11km'),(3,42,'Botble\\RealEstate\\Models\\Property','6km'),(3,43,'Botble\\RealEstate\\Models\\Property','2km'),(3,44,'Botble\\RealEstate\\Models\\Property','11km'),(3,45,'Botble\\RealEstate\\Models\\Property','9km'),(3,46,'Botble\\RealEstate\\Models\\Property','9km'),(3,47,'Botble\\RealEstate\\Models\\Property','17km'),(3,48,'Botble\\RealEstate\\Models\\Property','3km'),(3,49,'Botble\\RealEstate\\Models\\Property','12km'),(3,50,'Botble\\RealEstate\\Models\\Property','9km'),(3,51,'Botble\\RealEstate\\Models\\Property','14km'),(3,52,'Botble\\RealEstate\\Models\\Property','8km'),(3,53,'Botble\\RealEstate\\Models\\Property','13km'),(3,54,'Botble\\RealEstate\\Models\\Property','10km'),(3,55,'Botble\\RealEstate\\Models\\Property','17km'),(3,56,'Botble\\RealEstate\\Models\\Property','19km'),(3,57,'Botble\\RealEstate\\Models\\Property','4km'),(3,58,'Botble\\RealEstate\\Models\\Property','11km'),(3,59,'Botble\\RealEstate\\Models\\Property','5km'),(3,60,'Botble\\RealEstate\\Models\\Property','13km'),(3,61,'Botble\\RealEstate\\Models\\Property','19km'),(4,1,'Botble\\RealEstate\\Models\\Property','19km'),(4,2,'Botble\\RealEstate\\Models\\Property','16km'),(4,3,'Botble\\RealEstate\\Models\\Property','7km'),(4,4,'Botble\\RealEstate\\Models\\Property','18km'),(4,5,'Botble\\RealEstate\\Models\\Property','18km'),(4,6,'Botble\\RealEstate\\Models\\Property','2km'),(4,7,'Botble\\RealEstate\\Models\\Property','1km'),(4,8,'Botble\\RealEstate\\Models\\Property','16km'),(4,9,'Botble\\RealEstate\\Models\\Property','6km'),(4,10,'Botble\\RealEstate\\Models\\Property','11km'),(4,11,'Botble\\RealEstate\\Models\\Property','16km'),(4,12,'Botble\\RealEstate\\Models\\Property','17km'),(4,13,'Botble\\RealEstate\\Models\\Property','17km'),(4,14,'Botble\\RealEstate\\Models\\Property','13km'),(4,15,'Botble\\RealEstate\\Models\\Property','14km'),(4,16,'Botble\\RealEstate\\Models\\Property','16km'),(4,17,'Botble\\RealEstate\\Models\\Property','9km'),(4,18,'Botble\\RealEstate\\Models\\Property','2km'),(4,19,'Botble\\RealEstate\\Models\\Property','15km'),(4,20,'Botble\\RealEstate\\Models\\Property','11km'),(4,21,'Botble\\RealEstate\\Models\\Property','16km'),(4,22,'Botble\\RealEstate\\Models\\Property','6km'),(4,23,'Botble\\RealEstate\\Models\\Property','4km'),(4,24,'Botble\\RealEstate\\Models\\Property','6km'),(4,25,'Botble\\RealEstate\\Models\\Property','17km'),(4,26,'Botble\\RealEstate\\Models\\Property','10km'),(4,27,'Botble\\RealEstate\\Models\\Property','14km'),(4,28,'Botble\\RealEstate\\Models\\Property','3km'),(4,29,'Botble\\RealEstate\\Models\\Property','17km'),(4,30,'Botble\\RealEstate\\Models\\Property','1km'),(4,31,'Botble\\RealEstate\\Models\\Property','9km'),(4,32,'Botble\\RealEstate\\Models\\Property','14km'),(4,33,'Botble\\RealEstate\\Models\\Property','10km'),(4,34,'Botble\\RealEstate\\Models\\Property','14km'),(4,35,'Botble\\RealEstate\\Models\\Property','19km'),(4,36,'Botble\\RealEstate\\Models\\Property','7km'),(4,37,'Botble\\RealEstate\\Models\\Property','16km'),(4,38,'Botble\\RealEstate\\Models\\Property','17km'),(4,39,'Botble\\RealEstate\\Models\\Property','9km'),(4,40,'Botble\\RealEstate\\Models\\Property','16km'),(4,41,'Botble\\RealEstate\\Models\\Property','11km'),(4,42,'Botble\\RealEstate\\Models\\Property','6km'),(4,43,'Botble\\RealEstate\\Models\\Property','4km'),(4,44,'Botble\\RealEstate\\Models\\Property','20km'),(4,45,'Botble\\RealEstate\\Models\\Property','8km'),(4,46,'Botble\\RealEstate\\Models\\Property','8km'),(4,47,'Botble\\RealEstate\\Models\\Property','5km'),(4,48,'Botble\\RealEstate\\Models\\Property','13km'),(4,49,'Botble\\RealEstate\\Models\\Property','14km'),(4,50,'Botble\\RealEstate\\Models\\Property','1km'),(4,51,'Botble\\RealEstate\\Models\\Property','16km'),(4,52,'Botble\\RealEstate\\Models\\Property','15km'),(4,53,'Botble\\RealEstate\\Models\\Property','11km'),(4,54,'Botble\\RealEstate\\Models\\Property','13km'),(4,55,'Botble\\RealEstate\\Models\\Property','4km'),(4,56,'Botble\\RealEstate\\Models\\Property','7km'),(4,57,'Botble\\RealEstate\\Models\\Property','8km'),(4,58,'Botble\\RealEstate\\Models\\Property','15km'),(4,59,'Botble\\RealEstate\\Models\\Property','17km'),(4,60,'Botble\\RealEstate\\Models\\Property','4km'),(4,61,'Botble\\RealEstate\\Models\\Property','19km'),(5,1,'Botble\\RealEstate\\Models\\Property','12km'),(5,2,'Botble\\RealEstate\\Models\\Property','13km'),(5,3,'Botble\\RealEstate\\Models\\Property','20km'),(5,4,'Botble\\RealEstate\\Models\\Property','12km'),(5,5,'Botble\\RealEstate\\Models\\Property','4km'),(5,6,'Botble\\RealEstate\\Models\\Property','16km'),(5,7,'Botble\\RealEstate\\Models\\Property','9km'),(5,8,'Botble\\RealEstate\\Models\\Property','12km'),(5,9,'Botble\\RealEstate\\Models\\Property','7km'),(5,10,'Botble\\RealEstate\\Models\\Property','20km'),(5,11,'Botble\\RealEstate\\Models\\Property','15km'),(5,12,'Botble\\RealEstate\\Models\\Property','16km'),(5,13,'Botble\\RealEstate\\Models\\Property','15km'),(5,14,'Botble\\RealEstate\\Models\\Property','14km'),(5,15,'Botble\\RealEstate\\Models\\Property','3km'),(5,16,'Botble\\RealEstate\\Models\\Property','13km'),(5,17,'Botble\\RealEstate\\Models\\Property','4km'),(5,18,'Botble\\RealEstate\\Models\\Property','2km'),(5,19,'Botble\\RealEstate\\Models\\Property','2km'),(5,20,'Botble\\RealEstate\\Models\\Property','20km'),(5,21,'Botble\\RealEstate\\Models\\Property','18km'),(5,22,'Botble\\RealEstate\\Models\\Property','13km'),(5,23,'Botble\\RealEstate\\Models\\Property','11km'),(5,24,'Botble\\RealEstate\\Models\\Property','13km'),(5,25,'Botble\\RealEstate\\Models\\Property','19km'),(5,26,'Botble\\RealEstate\\Models\\Property','13km'),(5,27,'Botble\\RealEstate\\Models\\Property','7km'),(5,28,'Botble\\RealEstate\\Models\\Property','19km'),(5,29,'Botble\\RealEstate\\Models\\Property','10km'),(5,30,'Botble\\RealEstate\\Models\\Property','16km'),(5,31,'Botble\\RealEstate\\Models\\Property','11km'),(5,32,'Botble\\RealEstate\\Models\\Property','9km'),(5,33,'Botble\\RealEstate\\Models\\Property','1km'),(5,34,'Botble\\RealEstate\\Models\\Property','19km'),(5,35,'Botble\\RealEstate\\Models\\Property','12km'),(5,36,'Botble\\RealEstate\\Models\\Property','15km'),(5,37,'Botble\\RealEstate\\Models\\Property','7km'),(5,38,'Botble\\RealEstate\\Models\\Property','13km'),(5,39,'Botble\\RealEstate\\Models\\Property','1km'),(5,40,'Botble\\RealEstate\\Models\\Property','3km'),(5,41,'Botble\\RealEstate\\Models\\Property','14km'),(5,42,'Botble\\RealEstate\\Models\\Property','18km'),(5,43,'Botble\\RealEstate\\Models\\Property','11km'),(5,44,'Botble\\RealEstate\\Models\\Property','18km'),(5,45,'Botble\\RealEstate\\Models\\Property','9km'),(5,46,'Botble\\RealEstate\\Models\\Property','9km'),(5,47,'Botble\\RealEstate\\Models\\Property','6km'),(5,48,'Botble\\RealEstate\\Models\\Property','17km'),(5,49,'Botble\\RealEstate\\Models\\Property','9km'),(5,50,'Botble\\RealEstate\\Models\\Property','15km'),(5,51,'Botble\\RealEstate\\Models\\Property','5km'),(5,52,'Botble\\RealEstate\\Models\\Property','2km'),(5,53,'Botble\\RealEstate\\Models\\Property','7km'),(5,54,'Botble\\RealEstate\\Models\\Property','8km'),(5,55,'Botble\\RealEstate\\Models\\Property','5km'),(5,56,'Botble\\RealEstate\\Models\\Property','8km'),(5,57,'Botble\\RealEstate\\Models\\Property','1km'),(5,58,'Botble\\RealEstate\\Models\\Property','17km'),(5,59,'Botble\\RealEstate\\Models\\Property','17km'),(5,60,'Botble\\RealEstate\\Models\\Property','16km'),(5,61,'Botble\\RealEstate\\Models\\Property','17km'),(6,1,'Botble\\RealEstate\\Models\\Property','14km'),(6,2,'Botble\\RealEstate\\Models\\Property','4km'),(6,3,'Botble\\RealEstate\\Models\\Property','4km'),(6,4,'Botble\\RealEstate\\Models\\Property','1km'),(6,5,'Botble\\RealEstate\\Models\\Property','6km'),(6,6,'Botble\\RealEstate\\Models\\Property','11km'),(6,7,'Botble\\RealEstate\\Models\\Property','2km'),(6,8,'Botble\\RealEstate\\Models\\Property','16km'),(6,9,'Botble\\RealEstate\\Models\\Property','13km'),(6,10,'Botble\\RealEstate\\Models\\Property','11km'),(6,11,'Botble\\RealEstate\\Models\\Property','1km'),(6,12,'Botble\\RealEstate\\Models\\Property','13km'),(6,13,'Botble\\RealEstate\\Models\\Property','20km'),(6,14,'Botble\\RealEstate\\Models\\Property','1km'),(6,15,'Botble\\RealEstate\\Models\\Property','12km'),(6,16,'Botble\\RealEstate\\Models\\Property','5km'),(6,17,'Botble\\RealEstate\\Models\\Property','15km'),(6,18,'Botble\\RealEstate\\Models\\Property','20km'),(6,19,'Botble\\RealEstate\\Models\\Property','18km'),(6,20,'Botble\\RealEstate\\Models\\Property','17km'),(6,21,'Botble\\RealEstate\\Models\\Property','9km'),(6,22,'Botble\\RealEstate\\Models\\Property','2km'),(6,23,'Botble\\RealEstate\\Models\\Property','15km'),(6,24,'Botble\\RealEstate\\Models\\Property','2km'),(6,25,'Botble\\RealEstate\\Models\\Property','9km'),(6,26,'Botble\\RealEstate\\Models\\Property','16km'),(6,27,'Botble\\RealEstate\\Models\\Property','19km'),(6,28,'Botble\\RealEstate\\Models\\Property','7km'),(6,29,'Botble\\RealEstate\\Models\\Property','17km'),(6,30,'Botble\\RealEstate\\Models\\Property','17km'),(6,31,'Botble\\RealEstate\\Models\\Property','10km'),(6,32,'Botble\\RealEstate\\Models\\Property','12km'),(6,33,'Botble\\RealEstate\\Models\\Property','9km'),(6,34,'Botble\\RealEstate\\Models\\Property','8km'),(6,35,'Botble\\RealEstate\\Models\\Property','2km'),(6,36,'Botble\\RealEstate\\Models\\Property','11km'),(6,37,'Botble\\RealEstate\\Models\\Property','3km'),(6,38,'Botble\\RealEstate\\Models\\Property','14km'),(6,39,'Botble\\RealEstate\\Models\\Property','13km'),(6,40,'Botble\\RealEstate\\Models\\Property','3km'),(6,41,'Botble\\RealEstate\\Models\\Property','18km'),(6,42,'Botble\\RealEstate\\Models\\Property','20km'),(6,43,'Botble\\RealEstate\\Models\\Property','14km'),(6,44,'Botble\\RealEstate\\Models\\Property','3km'),(6,45,'Botble\\RealEstate\\Models\\Property','5km'),(6,46,'Botble\\RealEstate\\Models\\Property','4km'),(6,47,'Botble\\RealEstate\\Models\\Property','15km'),(6,48,'Botble\\RealEstate\\Models\\Property','12km'),(6,49,'Botble\\RealEstate\\Models\\Property','20km'),(6,50,'Botble\\RealEstate\\Models\\Property','4km'),(6,51,'Botble\\RealEstate\\Models\\Property','5km'),(6,52,'Botble\\RealEstate\\Models\\Property','8km'),(6,53,'Botble\\RealEstate\\Models\\Property','14km'),(6,54,'Botble\\RealEstate\\Models\\Property','18km'),(6,55,'Botble\\RealEstate\\Models\\Property','20km'),(6,56,'Botble\\RealEstate\\Models\\Property','8km'),(6,57,'Botble\\RealEstate\\Models\\Property','18km'),(6,58,'Botble\\RealEstate\\Models\\Property','17km'),(6,59,'Botble\\RealEstate\\Models\\Property','15km'),(6,60,'Botble\\RealEstate\\Models\\Property','13km'),(6,61,'Botble\\RealEstate\\Models\\Property','19km'),(7,1,'Botble\\RealEstate\\Models\\Property','19km'),(7,2,'Botble\\RealEstate\\Models\\Property','1km'),(7,3,'Botble\\RealEstate\\Models\\Property','20km'),(7,4,'Botble\\RealEstate\\Models\\Property','13km'),(7,5,'Botble\\RealEstate\\Models\\Property','4km'),(7,6,'Botble\\RealEstate\\Models\\Property','10km'),(7,7,'Botble\\RealEstate\\Models\\Property','12km'),(7,8,'Botble\\RealEstate\\Models\\Property','18km'),(7,9,'Botble\\RealEstate\\Models\\Property','4km'),(7,10,'Botble\\RealEstate\\Models\\Property','11km'),(7,11,'Botble\\RealEstate\\Models\\Property','17km'),(7,12,'Botble\\RealEstate\\Models\\Property','6km'),(7,13,'Botble\\RealEstate\\Models\\Property','11km'),(7,14,'Botble\\RealEstate\\Models\\Property','20km'),(7,15,'Botble\\RealEstate\\Models\\Property','14km'),(7,16,'Botble\\RealEstate\\Models\\Property','12km'),(7,17,'Botble\\RealEstate\\Models\\Property','12km'),(7,18,'Botble\\RealEstate\\Models\\Property','3km'),(7,19,'Botble\\RealEstate\\Models\\Property','6km'),(7,20,'Botble\\RealEstate\\Models\\Property','20km'),(7,21,'Botble\\RealEstate\\Models\\Property','1km'),(7,22,'Botble\\RealEstate\\Models\\Property','13km'),(7,23,'Botble\\RealEstate\\Models\\Property','2km'),(7,24,'Botble\\RealEstate\\Models\\Property','13km'),(7,25,'Botble\\RealEstate\\Models\\Property','20km'),(7,26,'Botble\\RealEstate\\Models\\Property','20km'),(7,27,'Botble\\RealEstate\\Models\\Property','2km'),(7,28,'Botble\\RealEstate\\Models\\Property','3km'),(7,29,'Botble\\RealEstate\\Models\\Property','11km'),(7,30,'Botble\\RealEstate\\Models\\Property','2km'),(7,31,'Botble\\RealEstate\\Models\\Property','5km'),(7,32,'Botble\\RealEstate\\Models\\Property','4km'),(7,33,'Botble\\RealEstate\\Models\\Property','16km'),(7,34,'Botble\\RealEstate\\Models\\Property','10km'),(7,35,'Botble\\RealEstate\\Models\\Property','6km'),(7,36,'Botble\\RealEstate\\Models\\Property','2km'),(7,37,'Botble\\RealEstate\\Models\\Property','13km'),(7,38,'Botble\\RealEstate\\Models\\Property','17km'),(7,39,'Botble\\RealEstate\\Models\\Property','2km'),(7,40,'Botble\\RealEstate\\Models\\Property','2km'),(7,41,'Botble\\RealEstate\\Models\\Property','3km'),(7,42,'Botble\\RealEstate\\Models\\Property','2km'),(7,43,'Botble\\RealEstate\\Models\\Property','1km'),(7,44,'Botble\\RealEstate\\Models\\Property','20km'),(7,45,'Botble\\RealEstate\\Models\\Property','14km'),(7,46,'Botble\\RealEstate\\Models\\Property','11km'),(7,47,'Botble\\RealEstate\\Models\\Property','4km'),(7,48,'Botble\\RealEstate\\Models\\Property','1km'),(7,49,'Botble\\RealEstate\\Models\\Property','4km'),(7,50,'Botble\\RealEstate\\Models\\Property','1km'),(7,51,'Botble\\RealEstate\\Models\\Property','9km'),(7,52,'Botble\\RealEstate\\Models\\Property','13km'),(7,53,'Botble\\RealEstate\\Models\\Property','13km'),(7,54,'Botble\\RealEstate\\Models\\Property','5km'),(7,55,'Botble\\RealEstate\\Models\\Property','4km'),(7,56,'Botble\\RealEstate\\Models\\Property','12km'),(7,57,'Botble\\RealEstate\\Models\\Property','19km'),(7,58,'Botble\\RealEstate\\Models\\Property','3km'),(7,59,'Botble\\RealEstate\\Models\\Property','11km'),(7,60,'Botble\\RealEstate\\Models\\Property','6km'),(7,61,'Botble\\RealEstate\\Models\\Property','20km'),(8,1,'Botble\\RealEstate\\Models\\Property','19km'),(8,2,'Botble\\RealEstate\\Models\\Property','10km'),(8,3,'Botble\\RealEstate\\Models\\Property','17km'),(8,4,'Botble\\RealEstate\\Models\\Property','15km'),(8,5,'Botble\\RealEstate\\Models\\Property','16km'),(8,6,'Botble\\RealEstate\\Models\\Property','1km'),(8,7,'Botble\\RealEstate\\Models\\Property','16km'),(8,8,'Botble\\RealEstate\\Models\\Property','17km'),(8,9,'Botble\\RealEstate\\Models\\Property','20km'),(8,10,'Botble\\RealEstate\\Models\\Property','6km'),(8,11,'Botble\\RealEstate\\Models\\Property','5km'),(8,12,'Botble\\RealEstate\\Models\\Property','9km'),(8,13,'Botble\\RealEstate\\Models\\Property','8km'),(8,14,'Botble\\RealEstate\\Models\\Property','20km'),(8,15,'Botble\\RealEstate\\Models\\Property','12km'),(8,16,'Botble\\RealEstate\\Models\\Property','8km'),(8,17,'Botble\\RealEstate\\Models\\Property','5km'),(8,18,'Botble\\RealEstate\\Models\\Property','2km'),(8,19,'Botble\\RealEstate\\Models\\Property','20km'),(8,20,'Botble\\RealEstate\\Models\\Property','10km'),(8,21,'Botble\\RealEstate\\Models\\Property','12km'),(8,22,'Botble\\RealEstate\\Models\\Property','4km'),(8,23,'Botble\\RealEstate\\Models\\Property','15km'),(8,24,'Botble\\RealEstate\\Models\\Property','1km'),(8,25,'Botble\\RealEstate\\Models\\Property','17km'),(8,26,'Botble\\RealEstate\\Models\\Property','9km'),(8,27,'Botble\\RealEstate\\Models\\Property','1km'),(8,28,'Botble\\RealEstate\\Models\\Property','15km'),(8,29,'Botble\\RealEstate\\Models\\Property','4km'),(8,30,'Botble\\RealEstate\\Models\\Property','11km'),(8,31,'Botble\\RealEstate\\Models\\Property','2km'),(8,32,'Botble\\RealEstate\\Models\\Property','7km'),(8,33,'Botble\\RealEstate\\Models\\Property','10km'),(8,34,'Botble\\RealEstate\\Models\\Property','4km'),(8,35,'Botble\\RealEstate\\Models\\Property','4km'),(8,36,'Botble\\RealEstate\\Models\\Property','18km'),(8,37,'Botble\\RealEstate\\Models\\Property','15km'),(8,38,'Botble\\RealEstate\\Models\\Property','10km'),(8,39,'Botble\\RealEstate\\Models\\Property','11km'),(8,40,'Botble\\RealEstate\\Models\\Property','15km'),(8,41,'Botble\\RealEstate\\Models\\Property','8km'),(8,42,'Botble\\RealEstate\\Models\\Property','19km'),(8,43,'Botble\\RealEstate\\Models\\Property','8km'),(8,44,'Botble\\RealEstate\\Models\\Property','2km'),(8,45,'Botble\\RealEstate\\Models\\Property','17km'),(8,46,'Botble\\RealEstate\\Models\\Property','16km'),(8,47,'Botble\\RealEstate\\Models\\Property','17km'),(8,48,'Botble\\RealEstate\\Models\\Property','7km'),(8,49,'Botble\\RealEstate\\Models\\Property','12km'),(8,50,'Botble\\RealEstate\\Models\\Property','10km'),(8,51,'Botble\\RealEstate\\Models\\Property','7km'),(8,52,'Botble\\RealEstate\\Models\\Property','17km'),(8,53,'Botble\\RealEstate\\Models\\Property','1km'),(8,54,'Botble\\RealEstate\\Models\\Property','7km'),(8,55,'Botble\\RealEstate\\Models\\Property','15km'),(8,56,'Botble\\RealEstate\\Models\\Property','2km'),(8,57,'Botble\\RealEstate\\Models\\Property','8km'),(8,58,'Botble\\RealEstate\\Models\\Property','17km'),(8,59,'Botble\\RealEstate\\Models\\Property','17km'),(8,60,'Botble\\RealEstate\\Models\\Property','4km'),(8,61,'Botble\\RealEstate\\Models\\Property','2km'),(9,1,'Botble\\RealEstate\\Models\\Property','2km'),(9,2,'Botble\\RealEstate\\Models\\Property','13km'),(9,3,'Botble\\RealEstate\\Models\\Property','10km'),(9,4,'Botble\\RealEstate\\Models\\Property','5km'),(9,5,'Botble\\RealEstate\\Models\\Property','9km'),(9,6,'Botble\\RealEstate\\Models\\Property','19km'),(9,7,'Botble\\RealEstate\\Models\\Property','13km'),(9,8,'Botble\\RealEstate\\Models\\Property','13km'),(9,9,'Botble\\RealEstate\\Models\\Property','12km'),(9,10,'Botble\\RealEstate\\Models\\Property','12km'),(9,11,'Botble\\RealEstate\\Models\\Property','3km'),(9,12,'Botble\\RealEstate\\Models\\Property','15km'),(9,13,'Botble\\RealEstate\\Models\\Property','10km'),(9,14,'Botble\\RealEstate\\Models\\Property','9km'),(9,15,'Botble\\RealEstate\\Models\\Property','13km'),(9,16,'Botble\\RealEstate\\Models\\Property','8km'),(9,17,'Botble\\RealEstate\\Models\\Property','11km'),(9,18,'Botble\\RealEstate\\Models\\Property','18km'),(9,19,'Botble\\RealEstate\\Models\\Property','19km'),(9,20,'Botble\\RealEstate\\Models\\Property','9km'),(9,21,'Botble\\RealEstate\\Models\\Property','5km'),(9,22,'Botble\\RealEstate\\Models\\Property','1km'),(9,23,'Botble\\RealEstate\\Models\\Property','1km'),(9,24,'Botble\\RealEstate\\Models\\Property','4km'),(9,25,'Botble\\RealEstate\\Models\\Property','10km'),(9,26,'Botble\\RealEstate\\Models\\Property','20km'),(9,27,'Botble\\RealEstate\\Models\\Property','20km'),(9,28,'Botble\\RealEstate\\Models\\Property','19km'),(9,29,'Botble\\RealEstate\\Models\\Property','6km'),(9,30,'Botble\\RealEstate\\Models\\Property','16km'),(9,31,'Botble\\RealEstate\\Models\\Property','19km'),(9,32,'Botble\\RealEstate\\Models\\Property','13km'),(9,33,'Botble\\RealEstate\\Models\\Property','13km'),(9,34,'Botble\\RealEstate\\Models\\Property','1km'),(9,35,'Botble\\RealEstate\\Models\\Property','7km'),(9,36,'Botble\\RealEstate\\Models\\Property','20km'),(9,37,'Botble\\RealEstate\\Models\\Property','18km'),(9,38,'Botble\\RealEstate\\Models\\Property','7km'),(9,39,'Botble\\RealEstate\\Models\\Property','16km'),(9,40,'Botble\\RealEstate\\Models\\Property','10km'),(9,41,'Botble\\RealEstate\\Models\\Property','14km'),(9,42,'Botble\\RealEstate\\Models\\Property','18km'),(9,43,'Botble\\RealEstate\\Models\\Property','17km'),(9,44,'Botble\\RealEstate\\Models\\Property','11km'),(9,45,'Botble\\RealEstate\\Models\\Property','12km'),(9,46,'Botble\\RealEstate\\Models\\Property','19km'),(9,47,'Botble\\RealEstate\\Models\\Property','19km'),(9,48,'Botble\\RealEstate\\Models\\Property','2km'),(9,49,'Botble\\RealEstate\\Models\\Property','4km'),(9,50,'Botble\\RealEstate\\Models\\Property','5km'),(9,51,'Botble\\RealEstate\\Models\\Property','20km'),(9,52,'Botble\\RealEstate\\Models\\Property','10km'),(9,53,'Botble\\RealEstate\\Models\\Property','7km'),(9,54,'Botble\\RealEstate\\Models\\Property','12km'),(9,55,'Botble\\RealEstate\\Models\\Property','12km'),(9,56,'Botble\\RealEstate\\Models\\Property','20km'),(9,57,'Botble\\RealEstate\\Models\\Property','19km'),(9,58,'Botble\\RealEstate\\Models\\Property','12km'),(9,59,'Botble\\RealEstate\\Models\\Property','3km'),(9,60,'Botble\\RealEstate\\Models\\Property','2km'),(9,61,'Botble\\RealEstate\\Models\\Property','18km'),(10,1,'Botble\\RealEstate\\Models\\Property','19km'),(10,2,'Botble\\RealEstate\\Models\\Property','16km'),(10,3,'Botble\\RealEstate\\Models\\Property','9km'),(10,4,'Botble\\RealEstate\\Models\\Property','8km'),(10,5,'Botble\\RealEstate\\Models\\Property','1km'),(10,6,'Botble\\RealEstate\\Models\\Property','5km'),(10,7,'Botble\\RealEstate\\Models\\Property','16km'),(10,8,'Botble\\RealEstate\\Models\\Property','9km'),(10,9,'Botble\\RealEstate\\Models\\Property','8km'),(10,10,'Botble\\RealEstate\\Models\\Property','18km'),(10,11,'Botble\\RealEstate\\Models\\Property','15km'),(10,12,'Botble\\RealEstate\\Models\\Property','20km'),(10,13,'Botble\\RealEstate\\Models\\Property','1km'),(10,14,'Botble\\RealEstate\\Models\\Property','10km'),(10,15,'Botble\\RealEstate\\Models\\Property','4km'),(10,16,'Botble\\RealEstate\\Models\\Property','11km'),(10,17,'Botble\\RealEstate\\Models\\Property','11km'),(10,18,'Botble\\RealEstate\\Models\\Property','13km'),(10,19,'Botble\\RealEstate\\Models\\Property','20km'),(10,20,'Botble\\RealEstate\\Models\\Property','14km'),(10,21,'Botble\\RealEstate\\Models\\Property','19km'),(10,22,'Botble\\RealEstate\\Models\\Property','18km'),(10,23,'Botble\\RealEstate\\Models\\Property','5km'),(10,24,'Botble\\RealEstate\\Models\\Property','16km'),(10,25,'Botble\\RealEstate\\Models\\Property','6km'),(10,26,'Botble\\RealEstate\\Models\\Property','19km'),(10,27,'Botble\\RealEstate\\Models\\Property','18km'),(10,28,'Botble\\RealEstate\\Models\\Property','12km'),(10,29,'Botble\\RealEstate\\Models\\Property','11km'),(10,30,'Botble\\RealEstate\\Models\\Property','18km'),(10,31,'Botble\\RealEstate\\Models\\Property','14km'),(10,32,'Botble\\RealEstate\\Models\\Property','17km'),(10,33,'Botble\\RealEstate\\Models\\Property','1km'),(10,34,'Botble\\RealEstate\\Models\\Property','9km'),(10,35,'Botble\\RealEstate\\Models\\Property','18km'),(10,36,'Botble\\RealEstate\\Models\\Property','19km'),(10,37,'Botble\\RealEstate\\Models\\Property','4km'),(10,38,'Botble\\RealEstate\\Models\\Property','15km'),(10,39,'Botble\\RealEstate\\Models\\Property','11km'),(10,40,'Botble\\RealEstate\\Models\\Property','18km'),(10,41,'Botble\\RealEstate\\Models\\Property','1km'),(10,42,'Botble\\RealEstate\\Models\\Property','7km'),(10,43,'Botble\\RealEstate\\Models\\Property','9km'),(10,44,'Botble\\RealEstate\\Models\\Property','15km'),(10,45,'Botble\\RealEstate\\Models\\Property','3km'),(10,46,'Botble\\RealEstate\\Models\\Property','17km'),(10,47,'Botble\\RealEstate\\Models\\Property','8km'),(10,48,'Botble\\RealEstate\\Models\\Property','13km'),(10,49,'Botble\\RealEstate\\Models\\Property','2km'),(10,50,'Botble\\RealEstate\\Models\\Property','18km'),(10,51,'Botble\\RealEstate\\Models\\Property','1km'),(10,52,'Botble\\RealEstate\\Models\\Property','18km'),(10,53,'Botble\\RealEstate\\Models\\Property','12km'),(10,54,'Botble\\RealEstate\\Models\\Property','19km'),(10,55,'Botble\\RealEstate\\Models\\Property','9km'),(10,56,'Botble\\RealEstate\\Models\\Property','17km'),(10,57,'Botble\\RealEstate\\Models\\Property','8km'),(10,58,'Botble\\RealEstate\\Models\\Property','18km'),(10,59,'Botble\\RealEstate\\Models\\Property','19km'),(10,60,'Botble\\RealEstate\\Models\\Property','18km'),(10,61,'Botble\\RealEstate\\Models\\Property','7km'),(11,1,'Botble\\RealEstate\\Models\\Property','1km'),(11,2,'Botble\\RealEstate\\Models\\Property','17km'),(11,3,'Botble\\RealEstate\\Models\\Property','6km'),(11,4,'Botble\\RealEstate\\Models\\Property','7km'),(11,5,'Botble\\RealEstate\\Models\\Property','1km'),(11,6,'Botble\\RealEstate\\Models\\Property','17km'),(11,7,'Botble\\RealEstate\\Models\\Property','20km'),(11,8,'Botble\\RealEstate\\Models\\Property','6km'),(11,9,'Botble\\RealEstate\\Models\\Property','2km'),(11,10,'Botble\\RealEstate\\Models\\Property','6km'),(11,11,'Botble\\RealEstate\\Models\\Property','7km'),(11,12,'Botble\\RealEstate\\Models\\Property','15km'),(11,13,'Botble\\RealEstate\\Models\\Property','17km'),(11,14,'Botble\\RealEstate\\Models\\Property','5km'),(11,15,'Botble\\RealEstate\\Models\\Property','5km'),(11,16,'Botble\\RealEstate\\Models\\Property','15km'),(11,17,'Botble\\RealEstate\\Models\\Property','2km'),(11,18,'Botble\\RealEstate\\Models\\Property','2km'),(11,19,'Botble\\RealEstate\\Models\\Property','18km'),(11,20,'Botble\\RealEstate\\Models\\Property','7km'),(11,21,'Botble\\RealEstate\\Models\\Property','10km'),(11,22,'Botble\\RealEstate\\Models\\Property','7km'),(11,23,'Botble\\RealEstate\\Models\\Property','13km'),(11,24,'Botble\\RealEstate\\Models\\Property','12km'),(11,25,'Botble\\RealEstate\\Models\\Property','9km'),(11,26,'Botble\\RealEstate\\Models\\Property','8km'),(11,27,'Botble\\RealEstate\\Models\\Property','11km'),(11,28,'Botble\\RealEstate\\Models\\Property','10km'),(11,29,'Botble\\RealEstate\\Models\\Property','5km'),(11,30,'Botble\\RealEstate\\Models\\Property','17km'),(11,31,'Botble\\RealEstate\\Models\\Property','10km'),(11,32,'Botble\\RealEstate\\Models\\Property','5km'),(11,33,'Botble\\RealEstate\\Models\\Property','5km'),(11,34,'Botble\\RealEstate\\Models\\Property','10km'),(11,35,'Botble\\RealEstate\\Models\\Property','11km'),(11,36,'Botble\\RealEstate\\Models\\Property','18km'),(11,37,'Botble\\RealEstate\\Models\\Property','19km'),(11,38,'Botble\\RealEstate\\Models\\Property','11km'),(11,39,'Botble\\RealEstate\\Models\\Property','4km'),(11,40,'Botble\\RealEstate\\Models\\Property','4km'),(11,41,'Botble\\RealEstate\\Models\\Property','7km'),(11,42,'Botble\\RealEstate\\Models\\Property','16km'),(11,43,'Botble\\RealEstate\\Models\\Property','17km'),(11,44,'Botble\\RealEstate\\Models\\Property','17km'),(11,45,'Botble\\RealEstate\\Models\\Property','19km'),(11,46,'Botble\\RealEstate\\Models\\Property','20km'),(11,47,'Botble\\RealEstate\\Models\\Property','17km'),(11,48,'Botble\\RealEstate\\Models\\Property','6km'),(11,49,'Botble\\RealEstate\\Models\\Property','20km'),(11,50,'Botble\\RealEstate\\Models\\Property','18km'),(11,51,'Botble\\RealEstate\\Models\\Property','2km'),(11,52,'Botble\\RealEstate\\Models\\Property','6km'),(11,53,'Botble\\RealEstate\\Models\\Property','5km'),(11,54,'Botble\\RealEstate\\Models\\Property','3km'),(11,55,'Botble\\RealEstate\\Models\\Property','13km'),(11,56,'Botble\\RealEstate\\Models\\Property','1km'),(11,57,'Botble\\RealEstate\\Models\\Property','16km'),(11,58,'Botble\\RealEstate\\Models\\Property','4km'),(11,59,'Botble\\RealEstate\\Models\\Property','6km'),(11,60,'Botble\\RealEstate\\Models\\Property','3km'),(11,61,'Botble\\RealEstate\\Models\\Property','12km');
/*!40000 ALTER TABLE `re_facilities_distances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_facilities_translations`
--

DROP TABLE IF EXISTS `re_facilities_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_facilities_translations` (
  `lang_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `re_facilities_id` bigint unsigned NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`re_facilities_id`),
  KEY `idx_re_facilities_trans_fk` (`re_facilities_id`),
  KEY `idx_re_facilities_trans_fk_lang` (`re_facilities_id`,`lang_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_facilities_translations`
--

LOCK TABLES `re_facilities_translations` WRITE;
/*!40000 ALTER TABLE `re_facilities_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `re_facilities_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_features`
--

DROP TABLE IF EXISTS `re_features`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_features` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_features`
--

LOCK TABLES `re_features` WRITE;
/*!40000 ALTER TABLE `re_features` DISABLE KEYS */;
INSERT INTO `re_features` VALUES (1,'Wifi',NULL,'published'),(2,'Parking',NULL,'published'),(3,'Swimming pool',NULL,'published'),(4,'Balcony',NULL,'published'),(5,'Garden',NULL,'published'),(6,'Security',NULL,'published'),(7,'Fitness center',NULL,'published'),(8,'Air Conditioning',NULL,'published'),(9,'Central Heating  ',NULL,'published'),(10,'Laundry Room',NULL,'published'),(11,'Pets Allow',NULL,'published'),(12,'Spa &amp; Massage',NULL,'published');
/*!40000 ALTER TABLE `re_features` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_features_translations`
--

DROP TABLE IF EXISTS `re_features_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_features_translations` (
  `lang_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `re_features_id` bigint unsigned NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`re_features_id`),
  KEY `idx_re_features_trans_fk` (`re_features_id`),
  KEY `idx_re_features_trans_fk_lang` (`re_features_id`,`lang_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_features_translations`
--

LOCK TABLES `re_features_translations` WRITE;
/*!40000 ALTER TABLE `re_features_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `re_features_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_investors`
--

DROP TABLE IF EXISTS `re_investors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_investors` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `description` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_investors`
--

LOCK TABLES `re_investors` WRITE;
/*!40000 ALTER TABLE `re_investors` DISABLE KEYS */;
INSERT INTO `re_investors` VALUES (1,'National Pension Service','published','2025-10-20 17:21:11','2025-10-20 17:21:11',NULL,NULL),(2,'Generali','published','2025-10-20 17:21:11','2025-10-20 17:21:11',NULL,NULL),(3,'Temasek','published','2025-10-20 17:21:11','2025-10-20 17:21:11',NULL,NULL),(4,'China Investment Corporation','published','2025-10-20 17:21:11','2025-10-20 17:21:11',NULL,NULL),(5,'Government Pension Fund Global','published','2025-10-20 17:21:11','2025-10-20 17:21:11',NULL,NULL),(6,'PSP Investments','published','2025-10-20 17:21:11','2025-10-20 17:21:11',NULL,NULL),(7,'MEAG Munich ERGO','published','2025-10-20 17:21:11','2025-10-20 17:21:11',NULL,NULL),(8,'HOOPP','published','2025-10-20 17:21:11','2025-10-20 17:21:11',NULL,NULL),(9,'BT Group','published','2025-10-20 17:21:11','2025-10-20 17:21:11',NULL,NULL),(10,'New York City ERS','published','2025-10-20 17:21:11','2025-10-20 17:21:11',NULL,NULL),(11,'New Jersey Division of Investment','published','2025-10-20 17:21:11','2025-10-20 17:21:11',NULL,NULL),(12,'State Super','published','2025-10-20 17:21:11','2025-10-20 17:21:11',NULL,NULL),(13,'Shinkong','published','2025-10-20 17:21:11','2025-10-20 17:21:11',NULL,NULL),(14,'Rest Super','published','2025-10-20 17:21:11','2025-10-20 17:21:11',NULL,NULL);
/*!40000 ALTER TABLE `re_investors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_investors_translations`
--

DROP TABLE IF EXISTS `re_investors_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_investors_translations` (
  `lang_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `re_investors_id` bigint unsigned NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`re_investors_id`),
  KEY `idx_re_investors_trans_fk` (`re_investors_id`),
  KEY `idx_re_investors_trans_fk_lang` (`re_investors_id`,`lang_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_investors_translations`
--

LOCK TABLES `re_investors_translations` WRITE;
/*!40000 ALTER TABLE `re_investors_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `re_investors_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_invoice_items`
--

DROP TABLE IF EXISTS `re_invoice_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_invoice_items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `invoice_id` bigint unsigned NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` int unsigned NOT NULL,
  `sub_total` decimal(15,2) unsigned NOT NULL,
  `tax_amount` decimal(15,2) unsigned NOT NULL DEFAULT '0.00',
  `discount_amount` decimal(15,2) unsigned NOT NULL DEFAULT '0.00',
  `amount` decimal(15,2) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_invoice_items`
--

LOCK TABLES `re_invoice_items` WRITE;
/*!40000 ALTER TABLE `re_invoice_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `re_invoice_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_invoices`
--

DROP TABLE IF EXISTS `re_invoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_invoices` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `account_id` bigint unsigned NOT NULL,
  `payment_id` bigint unsigned DEFAULT NULL,
  `reference_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_id` bigint unsigned NOT NULL,
  `code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sub_total` decimal(15,2) unsigned NOT NULL,
  `tax_amount` decimal(15,2) unsigned NOT NULL DEFAULT '0.00',
  `discount_amount` decimal(15,2) unsigned NOT NULL DEFAULT '0.00',
  `coupon_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(15,2) unsigned NOT NULL,
  `status` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `paid_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `re_invoices_code_unique` (`code`),
  KEY `re_invoices_reference_type_reference_id_index` (`reference_type`,`reference_id`),
  KEY `re_invoices_payment_id_index` (`payment_id`),
  KEY `re_invoices_status_index` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_invoices`
--

LOCK TABLES `re_invoices` WRITE;
/*!40000 ALTER TABLE `re_invoices` DISABLE KEYS */;
/*!40000 ALTER TABLE `re_invoices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_packages`
--

DROP TABLE IF EXISTS `re_packages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_packages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double unsigned NOT NULL,
  `currency_id` bigint unsigned NOT NULL,
  `percent_save` int unsigned NOT NULL DEFAULT '0',
  `number_of_listings` int unsigned NOT NULL,
  `account_limit` int unsigned DEFAULT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `status` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `description` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `features` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_packages`
--

LOCK TABLES `re_packages` WRITE;
/*!40000 ALTER TABLE `re_packages` DISABLE KEYS */;
INSERT INTO `re_packages` VALUES (1,'Free Trial',0,1,0,1,1,1,0,'published','2025-12-20 05:59:27','2025-12-20 05:59:27',NULL,'[[{\"key\":\"text\",\"value\":\"Limited time trial period\"}],[{\"key\":\"text\",\"value\":\"1 listing allowed\"}],[{\"key\":\"text\",\"value\":\"Basic support\"}]]'),(2,'Basic Listing',250,1,0,1,5,2,1,'published','2025-12-20 05:59:27','2025-12-20 05:59:27',NULL,'[[{\"key\":\"text\",\"value\":\"1 listing allowed\"}],[{\"key\":\"text\",\"value\":\"5 photos per listing\"}],[{\"key\":\"text\",\"value\":\"Basic support\"}]]'),(3,'Standard Package',1000,1,20,5,10,3,0,'published','2025-12-20 05:59:27','2025-12-20 05:59:27',NULL,'[[{\"key\":\"text\",\"value\":\"5 listings allowed\"}],[{\"key\":\"text\",\"value\":\"10 photos per listing\"}],[{\"key\":\"text\",\"value\":\"Priority support\"}]]'),(4,'Professional Package',1800,1,28,10,15,4,0,'published','2025-12-20 05:59:27','2025-12-20 05:59:27',NULL,'[[{\"key\":\"text\",\"value\":\"10 listings allowed\"}],[{\"key\":\"text\",\"value\":\"15 photos per listing\"}],[{\"key\":\"text\",\"value\":\"Premium support\"}],[{\"key\":\"text\",\"value\":\"Featured listings\"}]]'),(5,'Premium Package',2500,1,33,15,20,5,0,'published','2025-12-20 05:59:27','2025-12-20 05:59:27',NULL,'[[{\"key\":\"text\",\"value\":\"15 listings allowed\"}],[{\"key\":\"text\",\"value\":\"20 photos per listing\"}],[{\"key\":\"text\",\"value\":\"Premium support\"}],[{\"key\":\"text\",\"value\":\"Featured listings\"}],[{\"key\":\"text\",\"value\":\"Priority listing placement\"}]]');
/*!40000 ALTER TABLE `re_packages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_packages_translations`
--

DROP TABLE IF EXISTS `re_packages_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_packages_translations` (
  `lang_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `re_packages_id` bigint unsigned NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `features` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`re_packages_id`),
  KEY `idx_re_packages_trans_fk` (`re_packages_id`),
  KEY `idx_re_packages_trans_fk_lang` (`re_packages_id`,`lang_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_packages_translations`
--

LOCK TABLES `re_packages_translations` WRITE;
/*!40000 ALTER TABLE `re_packages_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `re_packages_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_project_categories`
--

DROP TABLE IF EXISTS `re_project_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_project_categories` (
  `project_id` bigint unsigned NOT NULL,
  `category_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`project_id`,`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_project_categories`
--

LOCK TABLES `re_project_categories` WRITE;
/*!40000 ALTER TABLE `re_project_categories` DISABLE KEYS */;
INSERT INTO `re_project_categories` VALUES (1,2),(2,2),(3,5),(4,1),(5,5),(6,2),(7,3),(8,3),(9,5),(10,2),(11,1),(12,5),(13,5),(14,5),(15,6),(16,2),(17,1),(18,1);
/*!40000 ALTER TABLE `re_project_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_project_features`
--

DROP TABLE IF EXISTS `re_project_features`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_project_features` (
  `project_id` bigint unsigned NOT NULL,
  `feature_id` bigint unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_project_features`
--

LOCK TABLES `re_project_features` WRITE;
/*!40000 ALTER TABLE `re_project_features` DISABLE KEYS */;
/*!40000 ALTER TABLE `re_project_features` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_projects`
--

DROP TABLE IF EXISTS `re_projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_projects` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `images` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `floor_plans` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `location` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `investor_id` bigint unsigned DEFAULT NULL,
  `number_block` int DEFAULT NULL,
  `number_floor` smallint DEFAULT NULL,
  `number_flat` smallint DEFAULT NULL,
  `is_featured` tinyint(1) NOT NULL DEFAULT '0',
  `featured_priority` int DEFAULT '0',
  `date_finish` date DEFAULT NULL,
  `date_sell` date DEFAULT NULL,
  `price_from` decimal(15,0) DEFAULT NULL,
  `price_to` decimal(15,0) DEFAULT NULL,
  `currency_id` bigint unsigned DEFAULT NULL,
  `city_id` bigint unsigned DEFAULT NULL,
  `status` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'selling',
  `author_id` bigint unsigned DEFAULT NULL,
  `author_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Botble\\ACL\\Models\\User',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `latitude` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `views` int unsigned NOT NULL DEFAULT '0',
  `country_id` bigint unsigned DEFAULT '1',
  `state_id` bigint unsigned DEFAULT NULL,
  `unique_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `private_notes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `re_projects_unique_id_unique` (`unique_id`),
  KEY `idx_re_projects_status` (`status`),
  KEY `idx_re_projects_location` (`location`),
  KEY `idx_re_projects_city_status` (`city_id`,`status`),
  KEY `idx_re_projects_state_status` (`state_id`,`status`),
  KEY `idx_re_projects_featured_sort` (`is_featured`,`featured_priority`,`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_projects`
--

LOCK TABLES `re_projects` WRITE;
/*!40000 ALTER TABLE `re_projects` DISABLE KEYS */;
INSERT INTO `re_projects` VALUES (1,'Walnut Park Apartments','Non modi et reiciendis id itaque mollitia. Recusandae optio animi rerum harum dolores asperiores numquam. Similique tempore earum recusandae. Ullam et voluptatem autem aspernatur eos aut.','Similique alias eveniet totam deleniti ullam sequi et. Nisi molestiae quos modi mollitia beatae vero cumque. Et praesentium tenetur et dolore eligendi enim. Explicabo porro velit quidem possimus deserunt maxime. Accusamus nam sit tenetur autem excepturi accusantium. Magni ad cum cupiditate voluptatem. Hic dignissimos fuga officia molestiae et accusamus.<h5 class=\"headifhouse\">FAQs</h5> [faqs category_ids=\"1\" display_type=\"list\" expand_first_time=\"yes\" enable_lazy_loading=\"no\"][/faqs]','[\"properties\\/1.jpg\",\"properties\\/12.jpg\",\"properties\\/6.jpg\",\"properties\\/5.jpg\",\"properties\\/4.jpg\",\"properties\\/8.jpg\",\"properties\\/10.jpg\",\"properties\\/9.jpg\"]',NULL,'48655 Tony Views Suite 440\nPort Coleman, AR 08274',4,2,5,3089,1,0,'2002-03-27','1974-08-22',5070,10636,1,4,'selling',1,'Botble\\ACL\\Models\\User','2025-10-20 17:21:18','2025-10-21 01:05:20','43.815331','-75.314943',NULL,5129,4,4,'GULIX4',NULL),(2,'Sunshine Wonder Villas','Vero et ut accusamus numquam. Qui earum porro inventore asperiores. Tenetur aut autem et officia maiores. Minus et explicabo ut quaerat dolorem quia.','Fuga sint esse molestias iure omnis voluptatem. Consequatur omnis quis quibusdam mollitia repudiandae quis. Est officia inventore ut occaecati velit. Beatae vitae non vel consectetur odio modi. At quis et consequuntur suscipit eius qui iure. Fuga maiores ipsa beatae nihil doloremque. Molestiae esse itaque a et culpa quia vitae. Occaecati qui voluptas mollitia in quaerat odio. Tempora sed quia eos. Ut neque laborum et doloribus voluptas.<h5 class=\"headifhouse\">FAQs</h5> [faqs category_ids=\"1\" display_type=\"list\" expand_first_time=\"yes\" enable_lazy_loading=\"no\"][/faqs]','[\"properties\\/11.jpg\",\"properties\\/8.jpg\",\"properties\\/3.jpg\",\"properties\\/7.jpg\",\"properties\\/2.jpg\",\"properties\\/1.jpg\",\"properties\\/10.jpg\",\"properties\\/4.jpg\",\"properties\\/5.jpg\"]',NULL,'3810 Murphy Garden\nKayceemouth, MT 24288',3,4,21,4152,0,0,'1984-04-22','2006-08-02',5545,10768,1,5,'selling',1,'Botble\\ACL\\Models\\User','2025-10-20 17:21:18','2025-10-21 01:05:20','43.293494','-76.312587',NULL,31,5,5,'8ITRSP',NULL),(3,'Diamond Island','Voluptatum harum est in voluptates eum quisquam. Nemo voluptatem voluptatem voluptatem voluptatem. Sunt sit ut ut numquam sunt iste totam.','Et sunt maxime non praesentium. Magnam commodi ut qui. Distinctio quibusdam iste quia voluptas. Qui laboriosam accusantium aliquam ut unde. Vel delectus et dolores perferendis ullam. Nemo nobis est ipsam maxime. Dolores placeat amet accusamus. Numquam culpa enim dolor beatae. Animi fugiat alias porro atque earum. Culpa rerum qui est nobis tempora. Modi fugiat consequatur alias. Est alias necessitatibus maxime provident necessitatibus rerum. Vero perferendis non nam.<h5 class=\"headifhouse\">FAQs</h5> [faqs category_ids=\"1\" display_type=\"list\" expand_first_time=\"yes\" enable_lazy_loading=\"no\"][/faqs]','[\"properties\\/12.jpg\",\"properties\\/5.jpg\",\"properties\\/2.jpg\",\"properties\\/7.jpg\",\"properties\\/6.jpg\",\"properties\\/3.jpg\",\"properties\\/1.jpg\",\"properties\\/10.jpg\",\"properties\\/8.jpg\",\"properties\\/4.jpg\",\"properties\\/11.jpg\"]',NULL,'839 Haley Centers\nRodriguezton, NM 07950',6,6,42,631,1,0,'1981-06-25','1986-10-26',7557,9426,1,1,'selling',1,'Botble\\ACL\\Models\\User','2025-10-20 17:21:18','2025-10-21 01:05:20','43.873945','-76.29666',NULL,4767,1,1,'7HXPBD',NULL),(4,'The Nassim','Sapiente rerum sed cupiditate vel. Sapiente harum optio rerum eos accusamus labore non. Sed minima cumque perferendis aliquam molestiae in. Quidem magni ex reprehenderit cum hic odit ipsa.','Ullam doloribus non expedita sit. Sit suscipit rerum dolores et doloremque. Eius eligendi sed consequatur vel est. Quaerat et totam voluptatem error omnis. Dolore officiis dolores quae et veniam. Accusamus occaecati cumque autem corrupti. Deserunt dolores eveniet molestiae consequuntur illo facilis recusandae. Eum quia aperiam sint quasi veritatis magni quia. Vitae cum quam quas est sed quia iure. Ipsa omnis totam reiciendis sit magnam voluptatem.<h5 class=\"headifhouse\">FAQs</h5> [faqs category_ids=\"1\" display_type=\"list\" expand_first_time=\"yes\" enable_lazy_loading=\"no\"][/faqs]','[\"properties\\/3.jpg\",\"properties\\/8.jpg\",\"properties\\/10.jpg\",\"properties\\/9.jpg\",\"properties\\/12.jpg\",\"properties\\/11.jpg\",\"properties\\/4.jpg\",\"properties\\/1.jpg\",\"properties\\/6.jpg\"]',NULL,'922 Gorczany Ports\nKundefurt, NM 58833',4,8,30,3519,0,0,'2013-03-21','1974-12-15',7621,8671,1,5,'selling',1,'Botble\\ACL\\Models\\User','2025-10-20 17:21:18','2025-10-21 01:05:20','42.776946','-75.830028',NULL,3743,5,5,'AHN5VQ',NULL),(5,'Vinhomes Grand Park','Quia est non aut. Quos expedita omnis laudantium quod rerum non sint. Nesciunt ex fugiat natus quia fugit. Rem voluptatem aut ad esse et quasi labore.','Mollitia quia autem totam sit. Ipsam et reiciendis nam quia facere aut eaque quae. Optio iusto quaerat odit dolor aperiam consequatur doloremque. In laboriosam vitae dolorum sit quibusdam voluptates. Praesentium qui aliquid mollitia enim illum qui optio. Non iusto nostrum impedit aut autem quos sed. Sit aut qui neque voluptas. Id et magnam et reiciendis libero neque voluptates. Incidunt voluptatem et eius quia.<h5 class=\"headifhouse\">FAQs</h5> [faqs category_ids=\"1\" display_type=\"list\" expand_first_time=\"yes\" enable_lazy_loading=\"no\"][/faqs]','[\"properties\\/10.jpg\",\"properties\\/9.jpg\",\"properties\\/3.jpg\",\"properties\\/11.jpg\",\"properties\\/7.jpg\",\"properties\\/12.jpg\",\"properties\\/1.jpg\",\"properties\\/8.jpg\"]',NULL,'6713 Beer Creek Apt. 107\nFunkbury, OK 91132-7291',10,10,40,225,1,0,'1997-05-12','1983-07-07',5303,8235,1,4,'selling',1,'Botble\\ACL\\Models\\User','2025-10-20 17:21:18','2025-10-21 01:05:20','43.31167','-76.662533',NULL,4414,4,4,'U4AROG',NULL),(6,'The Metropole Thu Thiem','Ullam impedit minima odio aut sit voluptas. Et dolor est similique rerum dolores ut. Eum ad qui corporis illo doloribus aperiam ab. Ut iste suscipit officiis aperiam itaque neque unde iste.','Fugiat voluptatem mollitia rem sunt. Quam quas velit omnis iusto soluta placeat. Praesentium vitae optio adipisci in dolorem dolorum reprehenderit. Nihil ipsa voluptatem dolorem quibusdam. Est quia dolor natus consequatur. Veniam autem id eaque voluptatem. Labore enim eius quod inventore sunt iste deleniti tempora. Sapiente ut et voluptatem impedit voluptatibus id. Est animi omnis doloremque officia ullam occaecati. Repellat voluptatem laudantium voluptatem. Qui a pariatur velit odio. Eum quod eaque quis.<h5 class=\"headifhouse\">FAQs</h5> [faqs category_ids=\"1\" display_type=\"list\" expand_first_time=\"yes\" enable_lazy_loading=\"no\"][/faqs]','[\"properties\\/1.jpg\",\"properties\\/12.jpg\",\"properties\\/8.jpg\",\"properties\\/9.jpg\",\"properties\\/5.jpg\",\"properties\\/2.jpg\",\"properties\\/6.jpg\",\"properties\\/11.jpg\",\"properties\\/7.jpg\",\"properties\\/4.jpg\",\"properties\\/10.jpg\"]',NULL,'4072 Conner Squares Apt. 151\nWest Felicita, WV 90385',2,4,27,1818,1,0,'2015-04-26','1982-05-07',4941,10858,1,4,'selling',1,'Botble\\ACL\\Models\\User','2025-10-20 17:21:18','2025-10-21 01:05:20','42.504422','-75.703027',NULL,838,4,4,'JQOWWC',NULL),(7,'Villa on Grand Avenue','Molestiae quia recusandae sapiente sequi harum omnis eligendi. Temporibus labore beatae exercitationem qui. Ipsam pariatur voluptate enim alias consequatur et similique non. Error alias natus consequatur repellat.','Ut ipsum possimus rem qui accusamus ut. Magnam repellat et quibusdam quod officia. Eos ut saepe voluptatem qui itaque ut est. Labore vero quis aut ut. Aut qui et inventore fuga. Dolor nostrum at cumque officia id. Voluptas voluptas velit aut et dolor necessitatibus odio qui. Aut consequatur qui molestiae nobis ducimus. Sunt ut provident rem. Aut dolorum molestias a ea eaque magni. Voluptate qui suscipit corrupti fugiat. Sint velit pariatur veniam dicta voluptatem architecto numquam voluptas. Eveniet est dolorum laborum officia ad. Ut alias omnis sit id blanditiis facere.<h5 class=\"headifhouse\">FAQs</h5> [faqs category_ids=\"1\" display_type=\"list\" expand_first_time=\"yes\" enable_lazy_loading=\"no\"][/faqs]','[\"properties\\/10.jpg\",\"properties\\/3.jpg\",\"properties\\/4.jpg\",\"properties\\/1.jpg\",\"properties\\/8.jpg\",\"properties\\/2.jpg\",\"properties\\/7.jpg\",\"properties\\/6.jpg\"]',NULL,'99538 Elliot Roads Suite 478\nSouth Winfieldhaven, VA 04395',10,6,45,613,0,0,'1994-11-23','2014-10-09',8831,15068,1,1,'selling',1,'Botble\\ACL\\Models\\User','2025-10-20 17:21:18','2025-10-21 01:05:20','42.878394','-74.990286',NULL,950,1,1,'WVOT3S',NULL),(8,'Traditional Food Restaurant','Sapiente repellat omnis quas mollitia illum deleniti ducimus. Omnis ut praesentium enim nobis. Accusantium minus sequi necessitatibus rem magni. Officiis enim autem reiciendis doloribus aspernatur.','Error consequatur quo commodi. Beatae sit pariatur ut rem dolor. Qui neque possimus aut praesentium nihil et. Exercitationem dolorum neque distinctio a amet dicta iste. Fuga quia nesciunt ut ut modi autem numquam. Voluptatibus voluptate impedit et qui doloribus dolore tempore officiis. Molestiae impedit sed atque ut atque. Consequuntur ad in expedita. Rerum quia aut fugiat aliquid consequatur vitae iusto. Accusamus dolorem natus molestiae quas mollitia accusamus nemo. Rem ipsa doloremque et. Beatae atque eaque dignissimos est voluptates ex. Voluptate et placeat dolorem doloremque.<h5 class=\"headifhouse\">FAQs</h5> [faqs category_ids=\"1\" display_type=\"list\" expand_first_time=\"yes\" enable_lazy_loading=\"no\"][/faqs]','[\"properties\\/3.jpg\",\"properties\\/9.jpg\",\"properties\\/7.jpg\",\"properties\\/12.jpg\",\"properties\\/10.jpg\",\"properties\\/4.jpg\",\"properties\\/5.jpg\"]',NULL,'531 Langworth Pines Apt. 254\nNew Krystel, IN 07913',9,8,44,1545,1,0,'1977-04-29','1992-03-23',6679,12947,1,1,'selling',1,'Botble\\ACL\\Models\\User','2025-10-20 17:21:18','2025-10-21 01:05:20','43.645941','-75.950026',NULL,2234,1,1,'BXQ7W5',NULL),(9,'Villa on Hollywood Boulevard','Ad illo et natus consequatur aut autem. Illo quis animi eum fugiat aperiam deleniti. Sint non voluptatem eum consequatur sapiente.','Quos ut placeat ex nihil. Ad sint consequatur vero. Quis harum aperiam iusto quos omnis rerum non. Sed iusto molestias consectetur. Est aut doloremque quos nihil non distinctio. Culpa quibusdam voluptatum est incidunt hic. Modi voluptas praesentium nihil consectetur. Esse perspiciatis quia ut autem quis ipsa aut. Est quas accusamus praesentium sed numquam. Adipisci voluptates ut quibusdam eligendi.<h5 class=\"headifhouse\">FAQs</h5> [faqs category_ids=\"1\" display_type=\"list\" expand_first_time=\"yes\" enable_lazy_loading=\"no\"][/faqs]','[\"properties\\/2.jpg\",\"properties\\/1.jpg\",\"properties\\/5.jpg\",\"properties\\/10.jpg\",\"properties\\/8.jpg\",\"properties\\/9.jpg\",\"properties\\/6.jpg\",\"properties\\/3.jpg\",\"properties\\/11.jpg\",\"properties\\/7.jpg\",\"properties\\/12.jpg\",\"properties\\/4.jpg\"]',NULL,'8251 Stark Lights\nHackettview, FL 53991-3942',9,10,38,36,0,0,'1996-05-08','2011-08-08',6514,15603,1,1,'selling',1,'Botble\\ACL\\Models\\User','2025-10-20 17:21:18','2025-10-21 01:05:20','42.875044','-75.075372',NULL,8322,1,1,'XKUWXR',NULL),(10,'Office Space at Northwest 107th','Dicta corporis est doloribus hic accusantium nihil dolores. A autem ut quod quo. Eaque vero temporibus maiores perferendis excepturi asperiores harum. Tempore dolorem officiis consectetur.','Culpa rerum excepturi repellendus. Iure praesentium dolorem hic similique nihil labore velit odio. Iste qui dolorum dolores dicta. Et quia dolor fugit similique excepturi repudiandae est quas. Soluta magnam nihil voluptatem ut fugit dolore. Ab ducimus quas fugiat sit ea eveniet laboriosam. A perspiciatis amet distinctio perspiciatis. Et voluptas quis suscipit suscipit voluptas. Maiores laborum recusandae in quo qui quod. Provident est aliquid dolore placeat impedit velit et.<h5 class=\"headifhouse\">FAQs</h5> [faqs category_ids=\"1\" display_type=\"list\" expand_first_time=\"yes\" enable_lazy_loading=\"no\"][/faqs]','[\"properties\\/3.jpg\",\"properties\\/1.jpg\",\"properties\\/12.jpg\",\"properties\\/6.jpg\",\"properties\\/8.jpg\",\"properties\\/5.jpg\",\"properties\\/4.jpg\",\"properties\\/7.jpg\",\"properties\\/10.jpg\",\"properties\\/9.jpg\",\"properties\\/2.jpg\",\"properties\\/11.jpg\"]',NULL,'67266 Cecilia Brook\nLake Cathryn, CT 17886',4,4,29,3868,0,0,'1986-04-10','2004-12-03',6635,10310,1,4,'selling',1,'Botble\\ACL\\Models\\User','2025-10-20 17:21:18','2025-10-21 01:05:20','43.923742','-75.885591',NULL,4904,4,4,'VBTPKZ',NULL),(11,'Home in Merrick Way','Odio nobis ut vel dicta hic. Est et quo alias ea non quos. Nisi sed et eligendi nesciunt quo enim.','Et vel dolores quaerat consequatur qui perspiciatis. Et atque voluptate quae et. Quidem vel aut qui dolorem quidem quisquam et. Rem recusandae perspiciatis qui ipsam eum non quae. Corporis ratione in omnis sunt molestiae quia numquam. Voluptate alias eos repudiandae debitis ut praesentium inventore. Sed omnis quae vero cupiditate cumque dicta sit. Mollitia velit mollitia laudantium molestias perspiciatis quas sed. Enim qui qui tempore esse qui architecto facere. Perferendis quis tempora illum officiis. Animi veniam consectetur sit soluta aut amet inventore.<h5 class=\"headifhouse\">FAQs</h5> [faqs category_ids=\"1\" display_type=\"list\" expand_first_time=\"yes\" enable_lazy_loading=\"no\"][/faqs]','[\"properties\\/10.jpg\",\"properties\\/5.jpg\",\"properties\\/12.jpg\",\"properties\\/4.jpg\",\"properties\\/9.jpg\",\"properties\\/8.jpg\",\"properties\\/3.jpg\"]',NULL,'47736 Syble Mall\nNorth Maidaside, CO 45417-2070',13,8,44,3994,0,0,'1984-12-26','1975-06-22',4844,12563,1,6,'selling',1,'Botble\\ACL\\Models\\User','2025-10-20 17:21:18','2025-10-21 01:05:20','43.653417','-75.226853',NULL,9556,6,6,'ONZDUT',NULL),(12,'Adarsh Greens','Porro aut non in. Nisi sit vel rerum neque sequi libero est odio. Aut sed eos cumque occaecati rerum quasi repellat.','Praesentium quasi dignissimos consequatur molestiae necessitatibus dolorem. Earum aut inventore aut et. Libero voluptas corrupti nobis dolores. Enim sunt corporis voluptatem doloremque soluta magni quae. Qui molestiae laudantium omnis molestias nostrum mollitia incidunt voluptas. Incidunt ipsum commodi saepe aliquam architecto enim. Voluptatibus culpa quam voluptatum qui et illum earum in. Dolorem officiis quia non hic.<h5 class=\"headifhouse\">FAQs</h5> [faqs category_ids=\"1\" display_type=\"list\" expand_first_time=\"yes\" enable_lazy_loading=\"no\"][/faqs]','[\"properties\\/1.jpg\",\"properties\\/12.jpg\",\"properties\\/6.jpg\",\"properties\\/2.jpg\",\"properties\\/10.jpg\",\"properties\\/3.jpg\",\"properties\\/7.jpg\"]',NULL,'5213 Albertha Course Apt. 081\nSouth Aliyahburgh, NH 88379-9366',7,9,35,4349,0,0,'1972-12-10','2008-12-23',9038,11173,1,2,'selling',1,'Botble\\ACL\\Models\\User','2025-10-20 17:21:18','2025-10-21 01:05:20','42.925842','-74.920882',NULL,3065,2,2,'OKCNV9',NULL),(13,'Rustomjee Evershine Global City','Eos porro reprehenderit placeat distinctio id sed. Amet magni officiis est nemo. Quos voluptatem quo qui eum quisquam voluptas eaque temporibus.','Asperiores quo qui et. Nostrum accusantium facilis sed esse dolore cum quae. Tempora sequi saepe provident. Sint molestias fuga nostrum eos non. Vel asperiores temporibus sit ut enim aut ab. Voluptas magnam rerum aliquid est minus ut aliquid. Nisi nostrum quae voluptas velit enim exercitationem. Expedita aspernatur dolorum eum rerum. Facilis esse nobis consequatur non suscipit.<h5 class=\"headifhouse\">FAQs</h5> [faqs category_ids=\"1\" display_type=\"list\" expand_first_time=\"yes\" enable_lazy_loading=\"no\"][/faqs]','[\"properties\\/11.jpg\",\"properties\\/12.jpg\",\"properties\\/1.jpg\",\"properties\\/6.jpg\",\"properties\\/7.jpg\",\"properties\\/2.jpg\",\"properties\\/4.jpg\",\"properties\\/8.jpg\",\"properties\\/10.jpg\",\"properties\\/9.jpg\",\"properties\\/3.jpg\"]',NULL,'6305 Bechtelar Lodge\nLake Amiebury, PA 48216',1,8,45,150,0,0,'2016-12-08','1977-01-16',5422,14893,1,1,'selling',1,'Botble\\ACL\\Models\\User','2025-10-20 17:21:18','2025-10-21 01:05:20','43.085874','-75.177604',NULL,6657,1,1,'F3TOYI',NULL),(14,'Godrej Exquisite','Libero iure aut neque aut labore eius quasi temporibus. Consequatur modi recusandae eius hic quod impedit expedita.','Qui suscipit dignissimos sit impedit sequi. Sint nam aut et temporibus aliquid omnis. Culpa tenetur quae blanditiis. Iste rem molestiae ut quia et ratione earum. Ad corporis nobis sequi tempore possimus et. Autem sit omnis dolorem. Odit illum porro est praesentium omnis exercitationem omnis. Sit sit quam et officiis harum voluptates et. Est in vel similique omnis ad doloremque laboriosam.<h5 class=\"headifhouse\">FAQs</h5> [faqs category_ids=\"1\" display_type=\"list\" expand_first_time=\"yes\" enable_lazy_loading=\"no\"][/faqs]','[\"properties\\/7.jpg\",\"properties\\/3.jpg\",\"properties\\/1.jpg\",\"properties\\/4.jpg\",\"properties\\/11.jpg\",\"properties\\/5.jpg\",\"properties\\/10.jpg\",\"properties\\/9.jpg\",\"properties\\/12.jpg\",\"properties\\/2.jpg\",\"properties\\/6.jpg\",\"properties\\/8.jpg\"]',NULL,'442 Goodwin Summit\nNorth Monte, IA 57401',12,2,1,2540,1,0,'1992-03-26','1982-08-27',5424,8411,1,2,'selling',1,'Botble\\ACL\\Models\\User','2025-10-20 17:21:18','2025-10-21 01:05:20','42.748825','-75.991333',NULL,4091,2,2,'HOMKF2',NULL),(15,'Godrej Prime','Id possimus odio et magni qui eum officiis. Delectus optio qui consequatur ducimus voluptas est.','Sit aut consequatur et velit est ex accusamus. Quam culpa totam est dolore. Dolore dolore aut beatae adipisci et. At et ut ea veniam quia. Quia eum earum accusantium doloribus sunt pariatur cupiditate. Voluptas ducimus non mollitia magni. Reiciendis aliquam molestiae nulla suscipit sed a molestiae itaque. Nobis reprehenderit et qui culpa saepe est. Nesciunt illo illum et repudiandae.<h5 class=\"headifhouse\">FAQs</h5> [faqs category_ids=\"1\" display_type=\"list\" expand_first_time=\"yes\" enable_lazy_loading=\"no\"][/faqs]','[\"properties\\/8.jpg\",\"properties\\/11.jpg\",\"properties\\/2.jpg\",\"properties\\/4.jpg\",\"properties\\/1.jpg\"]',NULL,'42736 Zemlak Springs\nRohanbury, AR 48226',2,10,10,691,1,0,'1991-07-07','2007-04-26',2787,6680,1,4,'selling',1,'Botble\\ACL\\Models\\User','2025-10-20 17:21:18','2025-10-21 01:05:20','43.893538','-76.571552',NULL,484,4,4,'1BUDXT',NULL),(16,'PS Panache','Voluptate animi doloribus dolores. Eos aut vel hic commodi. Sequi laborum qui ut quisquam voluptates consequuntur. Mollitia aliquam eaque laudantium quia.','Laborum distinctio maxime sunt molestiae repellendus hic dolorum velit. Illum tempora ratione magnam voluptates nostrum reprehenderit. Deserunt consequatur laboriosam id doloremque dolor autem et blanditiis. Voluptatem asperiores rerum porro pariatur. Delectus ex quibusdam iusto. Quos qui quia libero autem debitis vitae. Error velit praesentium odit eaque. Rerum libero et cupiditate eligendi. Consequatur quis non odit sed. Omnis hic cumque veniam sint. Consectetur vel perspiciatis quibusdam magnam enim hic. Possimus dignissimos laboriosam doloremque qui nobis non ipsam exercitationem.<h5 class=\"headifhouse\">FAQs</h5> [faqs category_ids=\"1\" display_type=\"list\" expand_first_time=\"yes\" enable_lazy_loading=\"no\"][/faqs]','[\"properties\\/2.jpg\",\"properties\\/6.jpg\",\"properties\\/8.jpg\",\"properties\\/9.jpg\",\"properties\\/3.jpg\"]',NULL,'752 Borer Skyway Apt. 832\nEast Jazmyne, PA 24368-0044',12,4,17,4376,1,0,'2023-02-22','2005-01-13',6302,13714,1,1,'selling',1,'Botble\\ACL\\Models\\User','2025-10-20 17:21:18','2025-10-21 01:05:20','43.402182','-76.257742',NULL,144,1,1,'NLFX4Y',NULL),(17,'Upturn Atmiya Centria','Quis saepe accusamus reiciendis quidem itaque in similique asperiores. Quidem ullam ipsum ea consequatur magnam fugiat. Asperiores illum nobis quod rerum rerum aliquam. Qui nihil ut vitae illum dolor.','Repellendus ea voluptate illo nihil qui ducimus. Atque architecto eum voluptatem delectus dolores. Est cupiditate odio odit asperiores aut est et. Omnis natus quaerat id. Velit veritatis commodi vel quis. In dolores quia sequi accusantium blanditiis fuga et odio. Delectus omnis dignissimos eveniet aspernatur sit distinctio aliquid. Occaecati cum aut ratione. Libero praesentium vel error et qui. Voluptatem eum minima dolores recusandae. Illum sunt deserunt voluptate sint quo. Qui porro delectus perspiciatis quam. Et dolor enim esse optio consequatur. Odit excepturi pariatur dolorem facilis quae.<h5 class=\"headifhouse\">FAQs</h5> [faqs category_ids=\"1\" display_type=\"list\" expand_first_time=\"yes\" enable_lazy_loading=\"no\"][/faqs]','[\"properties\\/4.jpg\",\"properties\\/3.jpg\",\"properties\\/12.jpg\",\"properties\\/7.jpg\",\"properties\\/10.jpg\",\"properties\\/6.jpg\"]',NULL,'16208 Valentina Fall\nJudgeview, WI 17343-9454',2,5,9,2861,0,0,'1976-03-29','1978-09-28',5355,6730,1,6,'selling',1,'Botble\\ACL\\Models\\User','2025-10-20 17:21:18','2025-10-21 01:05:20','43.826176','-76.654194',NULL,9269,6,6,'8RXNIX',NULL),(18,'Brigade Oasis','Non libero eos culpa repellat. Odio dolores vitae nostrum beatae saepe quisquam non. Libero ipsa consectetur laborum eius labore et fuga.','Iste nesciunt cumque animi sapiente consequuntur ea aliquam commodi. Nihil impedit nulla odio dolorem sunt eum dolor. Deleniti aperiam a voluptas voluptates temporibus et. Corrupti quo quae placeat amet laborum. Quis sit voluptatem et inventore harum. Voluptatem beatae sint odit aut vitae quos delectus aperiam. Et sequi accusamus quibusdam. Minus exercitationem et quibusdam repellat quia fugiat aut. Voluptatibus molestias natus ex provident amet distinctio corrupti. Doloribus voluptatem consequatur quae esse quidem.<h5 class=\"headifhouse\">FAQs</h5> [faqs category_ids=\"1\" display_type=\"list\" expand_first_time=\"yes\" enable_lazy_loading=\"no\"][/faqs]','[\"properties\\/12.jpg\",\"properties\\/11.jpg\",\"properties\\/4.jpg\",\"properties\\/7.jpg\",\"properties\\/5.jpg\",\"properties\\/6.jpg\"]',NULL,'53561 Gillian Pike\nKoelpinville, WA 56902-4255',4,4,1,4609,0,0,'1984-10-20','2016-02-14',2335,3802,1,4,'selling',1,'Botble\\ACL\\Models\\User','2025-10-20 17:21:18','2025-10-21 01:05:20','42.57206','-75.408828',NULL,5911,4,4,'BE3XT9',NULL);
/*!40000 ALTER TABLE `re_projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_projects_translations`
--

DROP TABLE IF EXISTS `re_projects_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_projects_translations` (
  `lang_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `re_projects_id` bigint unsigned NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `location` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `floor_plans` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`re_projects_id`),
  KEY `idx_re_projects_trans_proj_lang` (`re_projects_id`,`lang_code`),
  KEY `idx_re_projects_trans_location` (`location`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_projects_translations`
--

LOCK TABLES `re_projects_translations` WRITE;
/*!40000 ALTER TABLE `re_projects_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `re_projects_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_properties`
--

DROP TABLE IF EXISTS `re_properties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_properties` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'sale',
  `description` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `location` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `images` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `floor_plans` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `project_id` bigint unsigned DEFAULT '0',
  `number_bedroom` int DEFAULT NULL,
  `number_bathroom` int DEFAULT NULL,
  `number_floor` int DEFAULT NULL,
  `square` double DEFAULT NULL,
  `price` decimal(15,2) DEFAULT NULL,
  `currency_id` bigint unsigned DEFAULT NULL,
  `is_featured` tinyint(1) NOT NULL DEFAULT '0',
  `featured_priority` int DEFAULT '0',
  `city_id` bigint unsigned DEFAULT NULL,
  `period` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'month',
  `status` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'selling',
  `author_id` bigint unsigned DEFAULT NULL,
  `author_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Botble\\ACL\\Models\\User',
  `moderation_status` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `reject_reason` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expire_date` date DEFAULT NULL,
  `auto_renew` tinyint(1) NOT NULL DEFAULT '0',
  `never_expired` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `latitude` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `views` int unsigned NOT NULL DEFAULT '0',
  `country_id` bigint unsigned DEFAULT '1',
  `state_id` bigint unsigned DEFAULT NULL,
  `unique_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `private_notes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `re_properties_unique_id_unique` (`unique_id`),
  KEY `idx_re_properties_status` (`status`),
  KEY `idx_re_properties_location` (`location`),
  KEY `idx_re_properties_city_status` (`city_id`,`status`),
  KEY `idx_re_properties_state_status` (`state_id`,`status`),
  KEY `idx_re_properties_featured_sort` (`is_featured`,`featured_priority`,`created_at`),
  KEY `idx_re_properties_moderation_status` (`moderation_status`),
  KEY `idx_re_properties_expire_date` (`expire_date`),
  KEY `idx_re_properties_type` (`type`),
  KEY `idx_re_properties_never_expired` (`never_expired`),
  KEY `idx_re_properties_mod_status` (`moderation_status`,`status`),
  KEY `idx_re_properties_price` (`price`),
  KEY `idx_re_properties_square` (`square`),
  KEY `idx_re_properties_bedroom` (`number_bedroom`),
  KEY `idx_re_properties_bathroom` (`number_bathroom`),
  KEY `idx_re_properties_floor` (`number_floor`),
  KEY `idx_re_properties_project_id` (`project_id`),
  KEY `idx_re_properties_author` (`author_id`,`author_type`),
  KEY `idx_re_properties_country_id` (`country_id`),
  KEY `idx_re_properties_currency_id` (`currency_id`),
  KEY `idx_re_properties_active_featured_sort` (`moderation_status`,`status`,`expire_date`,`never_expired`,`is_featured`,`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_properties`
--

LOCK TABLES `re_properties` WRITE;
/*!40000 ALTER TABLE `re_properties` DISABLE KEYS */;
INSERT INTO `re_properties` VALUES (1,'3 Beds Villa Calpe, Alicante','sale','Quae eius reprehenderit sed et est quam eius. Labore aut voluptas est. Cumque magni reprehenderit voluptates vitae expedita doloremque. Hic quo aperiam officia aut eaque dolore perferendis.','Et sit blanditiis dolorum suscipit. Autem quo aut earum quasi est vitae. Voluptas adipisci magni animi et et mollitia suscipit. Quisquam adipisci sunt ex aperiam deleniti recusandae eos provident. Dolore itaque architecto culpa distinctio et. Sapiente nemo est sunt error optio. Optio modi saepe repellendus minus. Voluptas omnis sunt incidunt blanditiis quis. Quae nihil dicta iusto. Atque aut corrupti eligendi at est quia.<h5 class=\"headifhouse\">FAQs</h5> [faqs category_ids=\"1\" display_type=\"list\" expand_first_time=\"yes\" enable_lazy_loading=\"no\"][/faqs]','7730 Rogelio Manors Apt. 650\nAlverafort, SD 66065','[\"properties\\/5.jpg\",\"properties\\/12.jpg\",\"properties\\/9.jpg\",\"properties\\/11.jpg\",\"properties\\/3.jpg\",\"properties\\/2.jpg\",\"properties\\/4.jpg\",\"properties\\/10.jpg\"]','[{\"name\":{\"key\":\"name\",\"value\":\"First Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"3\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"2\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}},{\"name\":{\"key\":\"name\",\"value\":\"Second Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"2\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"1\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}}]',18,7,2,25,320,41600.00,NULL,0,0,2,'month','selling',12,'Botble\\RealEstate\\Models\\Account','approved',NULL,'2026-02-03',0,1,'2025-10-20 17:21:18','2025-12-20 05:59:44','43.019086','-75.57938',NULL,1749,2,2,'2Y7M7V',NULL),(2,'Lavida Plus Office-tel 1 Bedroom','sale','Eos enim qui quaerat animi voluptatum. Qui quos dolores incidunt debitis qui ipsa. Molestias assumenda qui quod modi. Quod enim repellendus voluptas.','Ut minus harum et est ut vel. Fugit recusandae et a eius sed. Rerum officia perspiciatis placeat dolore voluptates. Non ipsa atque tempore blanditiis distinctio quidem. Ullam doloremque est aut vel harum vel. Qui exercitationem id dolorem praesentium. Vitae cupiditate qui labore. Laborum iste consectetur numquam maxime consequatur excepturi dolores. Dolore nemo dolores consequatur placeat.<h5 class=\"headifhouse\">FAQs</h5> [faqs category_ids=\"1\" display_type=\"list\" expand_first_time=\"yes\" enable_lazy_loading=\"no\"][/faqs]','5869 Rae Road\nPort Mableborough, AZ 53889-2939','[\"properties\\/11.jpg\",\"properties\\/10.jpg\",\"properties\\/5.jpg\",\"properties\\/4.jpg\",\"properties\\/12.jpg\",\"properties\\/6.jpg\",\"properties\\/1.jpg\",\"properties\\/8.jpg\",\"properties\\/9.jpg\",\"properties\\/7.jpg\",\"properties\\/2.jpg\"]','[{\"name\":{\"key\":\"name\",\"value\":\"First Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"3\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"2\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}},{\"name\":{\"key\":\"name\",\"value\":\"Second Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"2\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"1\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}}]',7,9,5,80,410,313300.00,NULL,1,0,3,'month','selling',1,'Botble\\RealEstate\\Models\\Account','approved',NULL,'2026-02-03',0,1,'2025-10-20 17:21:18','2025-12-20 05:59:44','43.170011','-76.090315',NULL,1013,3,3,'CRYRAP',NULL),(3,'Vinhomes Grand Park Studio 1 Bedroom','sale','Omnis dolorem voluptatem id doloribus vel aut. Porro ea repellendus magni dolor perspiciatis.','Numquam quo porro dolores. Sed et velit esse est. Necessitatibus natus aut vel facere eligendi voluptatem. Ducimus quia sit dolorem et et. Vero rerum quia atque ipsa quam voluptates et. At et animi voluptatem velit. Ut cupiditate nemo dolores minus aliquam iusto. Quia nihil doloribus quis et sequi et.<h5 class=\"headifhouse\">FAQs</h5> [faqs category_ids=\"1\" display_type=\"list\" expand_first_time=\"yes\" enable_lazy_loading=\"no\"][/faqs]','61218 Hand Tunnel\nSouth Franco, NH 62110','[\"properties\\/8.jpg\",\"properties\\/10.jpg\",\"properties\\/1.jpg\",\"properties\\/4.jpg\",\"properties\\/6.jpg\",\"properties\\/7.jpg\",\"properties\\/9.jpg\"]','[{\"name\":{\"key\":\"name\",\"value\":\"First Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"3\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"2\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}},{\"name\":{\"key\":\"name\",\"value\":\"Second Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"2\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"1\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}}]',13,3,6,49,690,971100.00,NULL,1,0,6,'month','selling',4,'Botble\\RealEstate\\Models\\Account','approved',NULL,'2026-02-03',0,1,'2025-10-20 17:21:18','2025-12-20 05:59:44','42.797676','-76.342163',NULL,9816,6,6,'RZS0D4',NULL),(4,'The Sun Avenue Office-tel 1 Bedroom','sale','Odio unde veniam nisi suscipit et et expedita consequatur. Eos magni aut quis. Cupiditate placeat dolor eaque possimus aliquam.','Dolorem dolorem quia quae et iste. Officia quis quas expedita qui. Numquam sint aliquid numquam natus. Amet pariatur quae aut ab. Voluptatem laboriosam possimus quisquam aliquid quis deleniti aliquam exercitationem. Hic ducimus sunt accusamus architecto. Mollitia ipsum et ullam doloribus et tenetur pariatur. Ut corrupti ducimus perspiciatis veniam ut dolor. Voluptatem dolorem sequi aperiam sequi nesciunt odio cumque cumque. Animi enim provident qui velit. Nulla porro explicabo ipsa delectus est deserunt. Ipsam unde facere corporis dolorum explicabo maxime et. Soluta ratione ut distinctio delectus enim. Nulla esse nobis quasi quos perspiciatis.<h5 class=\"headifhouse\">FAQs</h5> [faqs category_ids=\"1\" display_type=\"list\" expand_first_time=\"yes\" enable_lazy_loading=\"no\"][/faqs]','234 Magdalena Mission\nLake Kacibury, MS 42459','[\"properties\\/4.jpg\",\"properties\\/2.jpg\",\"properties\\/8.jpg\",\"properties\\/5.jpg\",\"properties\\/11.jpg\"]','[{\"name\":{\"key\":\"name\",\"value\":\"First Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"3\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"2\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}},{\"name\":{\"key\":\"name\",\"value\":\"Second Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"2\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"1\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}}]',3,10,5,39,80,902900.00,NULL,0,0,1,'month','selling',4,'Botble\\RealEstate\\Models\\Account','approved',NULL,'2026-02-03',0,1,'2025-10-20 17:21:18','2025-12-20 05:59:44','42.714789','-76.309937',NULL,6040,1,1,'ODA9P0',NULL),(5,'Property For sale, Johannesburg, South Africa','rent','Eveniet assumenda nesciunt reprehenderit nobis veritatis. Quam doloribus reprehenderit in omnis mollitia tenetur. Molestias vel provident sit deleniti sunt sint necessitatibus qui.','Nemo est molestiae sint assumenda impedit eius. Esse consequuntur sunt non et. In officiis aliquam consequatur laboriosam neque adipisci aut vero. Necessitatibus quo odio quisquam non et. Corrupti consequatur ut et ut. Explicabo vel in deleniti fuga consequuntur voluptatem. Et amet eligendi recusandae praesentium culpa in illo fugit. Consequatur omnis qui vero. Quidem et est quia eaque dolores numquam dolor. Quia et optio sed quasi occaecati. Ea accusantium vel voluptas autem. Eos voluptatem aperiam non.<h5 class=\"headifhouse\">FAQs</h5> [faqs category_ids=\"1\" display_type=\"list\" expand_first_time=\"yes\" enable_lazy_loading=\"no\"][/faqs]','166 Mann Trail Suite 542\nWest Jermeyshire, CT 47094','[\"properties\\/4.jpg\",\"properties\\/1.jpg\",\"properties\\/12.jpg\",\"properties\\/5.jpg\",\"properties\\/10.jpg\"]','[{\"name\":{\"key\":\"name\",\"value\":\"First Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"3\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"2\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}},{\"name\":{\"key\":\"name\",\"value\":\"Second Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"2\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"1\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}}]',6,3,7,36,560,923300.00,NULL,1,0,6,'month','renting',12,'Botble\\RealEstate\\Models\\Account','approved',NULL,'2026-02-03',0,1,'2025-10-20 17:21:18','2025-12-20 05:59:44','42.757803','-76.370472',NULL,752,6,6,'JODQKE',NULL),(6,'Stunning French Inspired Manor','rent','Dolorem ratione et quia ut ipsum quos. Ipsa dolores iste provident doloremque consequatur voluptatem iusto enim. Optio non minus dolore ut. Iste delectus blanditiis et ut et molestiae.','Commodi saepe et dolorum est quia. Voluptatem et et quae facere aliquam. Quia quidem dolorem harum. Quisquam nam deleniti qui. Officia dolorum amet rem dolorem voluptates rerum. Sed quia itaque ipsam. At dignissimos quibusdam quod ipsam non. Quia aut vel quo alias incidunt repellat.<h5 class=\"headifhouse\">FAQs</h5> [faqs category_ids=\"1\" display_type=\"list\" expand_first_time=\"yes\" enable_lazy_loading=\"no\"][/faqs]','7341 Zulauf Spur Apt. 765\nLexiside, AL 80343','[\"properties\\/10.jpg\",\"properties\\/7.jpg\",\"properties\\/3.jpg\",\"properties\\/8.jpg\",\"properties\\/5.jpg\"]','[{\"name\":{\"key\":\"name\",\"value\":\"First Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"3\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"2\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}},{\"name\":{\"key\":\"name\",\"value\":\"Second Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"2\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"1\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}}]',3,5,3,11,970,115900.00,NULL,1,0,6,'month','renting',9,'Botble\\RealEstate\\Models\\Account','approved',NULL,'2026-02-03',0,1,'2025-10-20 17:21:18','2025-12-20 05:59:44','43.085077','-75.693007',NULL,5638,6,6,'SPZVE5',NULL),(7,'Villa for sale at Bermuda Dunes','sale','Soluta vel beatae veniam facilis. Magni voluptates non voluptas eligendi aut non. Saepe quia eum et debitis. Deleniti error at molestiae sunt possimus explicabo modi.','Optio nostrum fugit tenetur voluptatem sint asperiores. Tenetur consectetur repellendus exercitationem nam sit. Ipsum omnis tempore architecto nam placeat consequuntur qui. Aut nulla quod aliquid magnam quo ab. Cupiditate aperiam est maxime quasi quisquam qui sapiente. Iure mollitia id ab quibusdam quam. Temporibus repudiandae quasi unde vero et.<h5 class=\"headifhouse\">FAQs</h5> [faqs category_ids=\"1\" display_type=\"list\" expand_first_time=\"yes\" enable_lazy_loading=\"no\"][/faqs]','768 Dedrick Haven Suite 385\nEllamouth, AZ 07245-3191','[\"properties\\/2.jpg\",\"properties\\/8.jpg\",\"properties\\/10.jpg\",\"properties\\/7.jpg\",\"properties\\/9.jpg\"]','[{\"name\":{\"key\":\"name\",\"value\":\"First Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"3\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"2\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}},{\"name\":{\"key\":\"name\",\"value\":\"Second Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"2\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"1\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}}]',5,8,7,2,30,330100.00,NULL,1,0,5,'month','selling',8,'Botble\\RealEstate\\Models\\Account','approved',NULL,'2026-02-03',0,1,'2025-10-20 17:21:18','2025-12-20 05:59:44','43.432305','-75.373339',NULL,5935,5,5,'RRITDA',NULL),(8,'Walnut Park Apartment','sale','Beatae occaecati et autem at quidem. Ex odio qui aut enim. Odit ut dolor iusto. Repellendus nihil maiores dignissimos dolorum excepturi non nisi ut.','Cum totam ut rerum ex velit beatae recusandae. Totam quaerat et placeat ab fugiat. Velit quia autem aperiam aperiam dicta. Quod quo explicabo praesentium assumenda laudantium et. Molestiae repellendus laborum recusandae corrupti rem expedita quibusdam. Ad incidunt iure fugit recusandae beatae voluptates nobis qui. Rerum facere provident doloremque pariatur et. Similique deserunt in assumenda totam incidunt ducimus alias. Ad tempora cumque enim consectetur tempora quo ad velit. Tempora facere non a amet magni.<h5 class=\"headifhouse\">FAQs</h5> [faqs category_ids=\"1\" display_type=\"list\" expand_first_time=\"yes\" enable_lazy_loading=\"no\"][/faqs]','501 Jacobi Brook Suite 724\nLake Moriahberg, DE 84648-0697','[\"properties\\/2.jpg\",\"properties\\/8.jpg\",\"properties\\/7.jpg\",\"properties\\/6.jpg\",\"properties\\/9.jpg\",\"properties\\/11.jpg\",\"properties\\/1.jpg\"]','[{\"name\":{\"key\":\"name\",\"value\":\"First Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"3\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"2\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}},{\"name\":{\"key\":\"name\",\"value\":\"Second Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"2\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"1\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}}]',1,9,6,12,20,61500.00,NULL,0,0,4,'month','selling',1,'Botble\\RealEstate\\Models\\Account','approved',NULL,'2026-02-03',0,1,'2025-10-20 17:21:18','2025-12-20 05:59:44','43.192559','-76.084975',NULL,2760,4,4,'ENXCEI',NULL),(9,'5 beds luxury house','rent','Reprehenderit quam facilis culpa. Libero suscipit in nihil animi tenetur consequatur. Ut voluptatem sint dolores animi voluptatem veniam et tempore.','Impedit velit perspiciatis rerum a voluptate voluptatem fugiat occaecati. Veritatis est ut pariatur ratione repellendus. Et sit ipsa asperiores vel dignissimos velit atque. Corrupti aut ullam minus ut aut. Repudiandae modi possimus autem qui voluptas repellat molestiae. Aperiam autem odit architecto possimus accusantium in provident unde. Accusamus suscipit odio velit odio est repudiandae. Autem ut rerum amet. Odio fuga placeat modi inventore sit minus accusamus impedit.<h5 class=\"headifhouse\">FAQs</h5> [faqs category_ids=\"1\" display_type=\"list\" expand_first_time=\"yes\" enable_lazy_loading=\"no\"][/faqs]','399 Beier Ridge\nNew Amanda, AR 79830','[\"properties\\/11.jpg\",\"properties\\/9.jpg\",\"properties\\/12.jpg\",\"properties\\/5.jpg\",\"properties\\/7.jpg\",\"properties\\/6.jpg\",\"properties\\/8.jpg\",\"properties\\/2.jpg\",\"properties\\/1.jpg\",\"properties\\/4.jpg\",\"properties\\/10.jpg\",\"properties\\/3.jpg\"]','[{\"name\":{\"key\":\"name\",\"value\":\"First Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"3\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"2\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}},{\"name\":{\"key\":\"name\",\"value\":\"Second Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"2\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"1\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}}]',1,2,2,15,360,567000.00,NULL,1,0,5,'month','renting',7,'Botble\\RealEstate\\Models\\Account','approved',NULL,'2026-02-03',0,1,'2025-10-20 17:21:18','2025-12-20 05:59:44','42.877971','-76.119809',NULL,5995,5,5,'21BQC6',NULL),(10,'Family Victorian \"View\" Home','sale','Inventore voluptate ea ipsa voluptatum. Tempore fuga itaque esse cum architecto. Unde autem ut ipsum officiis dolorem.','Porro voluptatem dolore sed iure est atque. Asperiores omnis itaque ea doloribus. Earum natus maiores rerum occaecati aspernatur. Repudiandae voluptatibus ipsam et cum consequuntur neque ducimus id. Ut repellendus consequatur sit fugiat. Ut laudantium quae libero natus sunt. Quo omnis aspernatur ad veniam quia accusantium. Quod non eum odit similique. Perspiciatis animi suscipit et quaerat amet cum consequuntur. Occaecati aut aut officia molestias minus. Ut voluptate dolores voluptatem debitis. Neque soluta animi non. Praesentium neque dolore nesciunt. Necessitatibus ea a sed et.<h5 class=\"headifhouse\">FAQs</h5> [faqs category_ids=\"1\" display_type=\"list\" expand_first_time=\"yes\" enable_lazy_loading=\"no\"][/faqs]','90393 Daniel Isle Suite 583\nLake Giovanny, IA 70266-6176','[\"properties\\/7.jpg\",\"properties\\/9.jpg\",\"properties\\/1.jpg\",\"properties\\/2.jpg\",\"properties\\/11.jpg\",\"properties\\/3.jpg\",\"properties\\/6.jpg\"]','[{\"name\":{\"key\":\"name\",\"value\":\"First Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"3\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"2\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}},{\"name\":{\"key\":\"name\",\"value\":\"Second Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"2\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"1\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}}]',14,3,2,52,850,492000.00,NULL,0,0,2,'month','selling',5,'Botble\\RealEstate\\Models\\Account','approved',NULL,'2026-02-03',0,1,'2025-10-20 17:21:18','2025-12-20 05:59:44','43.085361','-74.860672',NULL,1693,2,2,'3W5J38',NULL),(11,'Osaka Heights Apartment','rent','Itaque sit ab placeat sint dolore iste enim. Sed occaecati ea amet alias unde fugit aliquid dolorem. Pariatur assumenda consequatur atque dolore natus assumenda animi.','Eaque blanditiis voluptatem sit illum rerum et non. Voluptatem provident ea quia nobis. Possimus sint ad reiciendis. Quos hic modi ullam quaerat. Placeat sint necessitatibus sed itaque qui. Fugit ipsum est repellendus et natus dignissimos eaque molestiae. Consectetur ipsum occaecati maxime nulla similique facere doloremque. Sint voluptatem molestias id porro aliquam rerum repellat. Voluptas tenetur praesentium tenetur veritatis assumenda. Quibusdam natus fugiat ipsam eos quis.<h5 class=\"headifhouse\">FAQs</h5> [faqs category_ids=\"1\" display_type=\"list\" expand_first_time=\"yes\" enable_lazy_loading=\"no\"][/faqs]','87939 Jo Field\nEast Giovanny, SD 29567-3303','[\"properties\\/1.jpg\",\"properties\\/8.jpg\",\"properties\\/11.jpg\",\"properties\\/5.jpg\",\"properties\\/6.jpg\",\"properties\\/2.jpg\",\"properties\\/3.jpg\",\"properties\\/12.jpg\",\"properties\\/9.jpg\"]','[{\"name\":{\"key\":\"name\",\"value\":\"First Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"3\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"2\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}},{\"name\":{\"key\":\"name\",\"value\":\"Second Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"2\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"1\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}}]',13,1,5,58,370,70100.00,NULL,0,0,6,'month','renting',2,'Botble\\RealEstate\\Models\\Account','approved',NULL,'2026-02-03',0,1,'2025-10-20 17:21:18','2025-12-20 05:59:44','43.769919','-74.781106',NULL,482,6,6,'HKAJJB',NULL),(12,'Private Estate Magnificent Views','rent','Et similique cumque et unde suscipit odio. Inventore sit molestias omnis dolores rem magni. Reiciendis rerum dolores modi autem.','Culpa aut ut harum nulla maiores est necessitatibus incidunt. Voluptatem repellendus ipsa voluptas rem. Aut ipsa totam voluptatum illo fugit. Temporibus maxime quidem porro commodi. Id laborum modi dolore quia sit. Repellendus harum quaerat perferendis. Ut vel autem est mollitia eaque iusto. Cupiditate dignissimos sit expedita ea quis. Ad laborum praesentium dignissimos consequatur consequatur aut perferendis.<h5 class=\"headifhouse\">FAQs</h5> [faqs category_ids=\"1\" display_type=\"list\" expand_first_time=\"yes\" enable_lazy_loading=\"no\"][/faqs]','24726 Kertzmann Lakes Apt. 223\nSouth Ivy, IA 39231','[\"properties\\/4.jpg\",\"properties\\/8.jpg\",\"properties\\/9.jpg\",\"properties\\/11.jpg\",\"properties\\/3.jpg\",\"properties\\/6.jpg\",\"properties\\/7.jpg\"]','[{\"name\":{\"key\":\"name\",\"value\":\"First Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"3\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"2\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}},{\"name\":{\"key\":\"name\",\"value\":\"Second Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"2\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"1\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}}]',12,7,5,12,940,859100.00,NULL,1,0,4,'month','renting',10,'Botble\\RealEstate\\Models\\Account','approved',NULL,'2026-02-03',0,1,'2025-10-20 17:21:18','2025-12-20 05:59:44','43.809688','-75.831488',NULL,7329,4,4,'DRQ03U',NULL),(13,'Thompson Road House for rent','sale','Dolor natus voluptatem suscipit qui maiores nobis sunt voluptates. Vel rerum facere odio voluptatibus aut minus optio. Reiciendis dolorum quae ad sed. Ut sequi qui et placeat labore dolorem.','Fuga vel consequatur soluta ex. Ut veritatis et impedit ratione fugit aliquid. Dolorem non sed soluta voluptates non. Doloribus in porro harum sed placeat est numquam. In voluptatem inventore quia sint. Architecto et voluptate sunt qui sed. Est sunt corrupti at molestiae quia. Aut aut quia culpa minima deserunt quis ducimus. Minima culpa autem cupiditate sed saepe.<h5 class=\"headifhouse\">FAQs</h5> [faqs category_ids=\"1\" display_type=\"list\" expand_first_time=\"yes\" enable_lazy_loading=\"no\"][/faqs]','97076 Leuschke Fall Apt. 900\nHellerland, NY 00808-9280','[\"properties\\/2.jpg\",\"properties\\/10.jpg\",\"properties\\/9.jpg\",\"properties\\/4.jpg\",\"properties\\/3.jpg\",\"properties\\/11.jpg\",\"properties\\/8.jpg\",\"properties\\/5.jpg\",\"properties\\/7.jpg\"]','[{\"name\":{\"key\":\"name\",\"value\":\"First Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"3\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"2\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}},{\"name\":{\"key\":\"name\",\"value\":\"Second Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"2\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"1\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}}]',4,1,3,60,420,705500.00,NULL,0,0,5,'month','selling',3,'Botble\\RealEstate\\Models\\Account','approved',NULL,'2026-02-03',0,1,'2025-10-20 17:21:18','2025-12-20 05:59:44','43.460909','-76.169742',NULL,5197,5,5,'01IIFZ',NULL),(14,'Brand New 1 Bedroom Apartment In First Class Location','sale','Voluptatem provident ut veritatis. Molestiae incidunt voluptates ut accusamus. Cum magnam enim corrupti aut et vero consequuntur modi. Blanditiis quos totam expedita tempora quia.','Dolorem delectus quia modi voluptatem. Qui facilis deleniti nisi repudiandae doloremque non. Nemo eveniet consectetur et. Aperiam nostrum et omnis nulla ut. Vel commodi eligendi et aut deserunt occaecati quae. Error veniam repellendus maxime rerum sunt dolore. Consequuntur sed et nemo consectetur illum. Dolorum veniam maiores quas molestiae eveniet dolores. Doloribus error officia amet odit consequatur. Sapiente minus aut ad. Accusantium quidem inventore et assumenda. Doloribus exercitationem incidunt aut et. Odio sed sint quia qui et ratione aperiam.<h5 class=\"headifhouse\">FAQs</h5> [faqs category_ids=\"1\" display_type=\"list\" expand_first_time=\"yes\" enable_lazy_loading=\"no\"][/faqs]','9142 Hahn Village\nGutkowskibury, IA 84779-9168','[\"properties\\/4.jpg\",\"properties\\/7.jpg\",\"properties\\/9.jpg\",\"properties\\/5.jpg\",\"properties\\/2.jpg\",\"properties\\/11.jpg\",\"properties\\/3.jpg\",\"properties\\/6.jpg\"]','[{\"name\":{\"key\":\"name\",\"value\":\"First Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"3\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"2\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}},{\"name\":{\"key\":\"name\",\"value\":\"Second Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"2\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"1\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}}]',13,4,3,10,660,736100.00,NULL,0,0,3,'month','selling',2,'Botble\\RealEstate\\Models\\Account','approved',NULL,'2026-02-03',0,1,'2025-10-20 17:21:18','2025-12-20 05:59:44','43.789345','-75.177499',NULL,3997,3,3,'YY1HLM',NULL),(15,'Elegant family home presents premium modern living','rent','Veniam voluptatibus porro ut cumque. Magnam tempora non ut impedit aut porro. Inventore non et quis in.','Est quasi cum repudiandae natus. Dolorem dignissimos dolor quam voluptate impedit cupiditate dolor. Iure nihil dolorum quia. Quaerat sunt culpa eaque. Ratione officiis voluptas et. Quia similique at est ab consequuntur illo et repudiandae. Voluptates iure quo dicta laborum tenetur vel ea. Laudantium accusamus impedit a minima iste in ut. Quia cum in molestias autem nobis aut porro. Corrupti libero corporis minima corporis autem. Et omnis tempore pariatur id laboriosam vel aut dolor. Earum illum sed aut quibusdam ullam. Odio excepturi eos fuga nostrum praesentium. Ex quis et corporis corrupti.<h5 class=\"headifhouse\">FAQs</h5> [faqs category_ids=\"1\" display_type=\"list\" expand_first_time=\"yes\" enable_lazy_loading=\"no\"][/faqs]','59016 Rutherford Branch\nWest Jerrodhaven, CA 81584-4736','[\"properties\\/1.jpg\",\"properties\\/3.jpg\",\"properties\\/5.jpg\",\"properties\\/9.jpg\",\"properties\\/8.jpg\",\"properties\\/12.jpg\",\"properties\\/6.jpg\",\"properties\\/11.jpg\"]','[{\"name\":{\"key\":\"name\",\"value\":\"First Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"3\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"2\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}},{\"name\":{\"key\":\"name\",\"value\":\"Second Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"2\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"1\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}}]',8,9,7,76,150,800000.00,NULL,1,0,1,'month','renting',11,'Botble\\RealEstate\\Models\\Account','approved',NULL,'2026-02-03',0,1,'2025-10-20 17:21:18','2025-12-20 05:59:44','43.308245','-76.178839',NULL,4395,1,1,'DOQ04H',NULL),(16,'Luxury Apartments in Singapore for Sale','sale','Repellendus similique ut odio placeat consequuntur voluptatem nihil. Qui nihil consequatur sunt est. Error ipsum officiis nam non et eum corrupti. Minima quia explicabo eveniet aut dolorum ea corrupti aut. Aut vitae aut asperiores reiciendis.','Harum assumenda dolorem quisquam optio harum laboriosam. Sapiente quasi et maxime ipsum neque voluptatibus aut illum. Ratione in tempora est et. Et ex ut ratione quae qui aut sint nesciunt. Nisi expedita vel repudiandae rerum architecto. Est fuga voluptatem sequi placeat placeat qui qui. Doloribus modi dolore alias temporibus cupiditate quidem sed.<h5 class=\"headifhouse\">FAQs</h5> [faqs category_ids=\"1\" display_type=\"list\" expand_first_time=\"yes\" enable_lazy_loading=\"no\"][/faqs]','74926 Balistreri Via Suite 593\nQuigleyfurt, CT 10440','[\"properties\\/9.jpg\",\"properties\\/6.jpg\",\"properties\\/8.jpg\",\"properties\\/5.jpg\",\"properties\\/11.jpg\"]','[{\"name\":{\"key\":\"name\",\"value\":\"First Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"3\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"2\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}},{\"name\":{\"key\":\"name\",\"value\":\"Second Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"2\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"1\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}}]',1,7,8,54,110,60400.00,NULL,1,0,1,'month','selling',4,'Botble\\RealEstate\\Models\\Account','approved',NULL,'2026-02-03',0,1,'2025-10-20 17:21:18','2025-12-20 05:59:44','42.737332','-75.735373',NULL,9982,1,1,'BMNZXO',NULL),(17,'5 room luxury penthouse for sale in Kuala Lumpur','rent','Error nam fugiat voluptas dolore et. Occaecati deleniti sunt qui occaecati. Tenetur magnam reiciendis nihil in laudantium quis unde.','Ut sit qui laborum magni ut laborum rerum rerum. In natus magni occaecati. Animi ipsam et eum aliquam. Maiores ipsam et iste ipsam rem quibusdam. Consequuntur sapiente ipsa est iste cumque veniam totam. Consequuntur totam tempore deleniti qui laboriosam deserunt amet nihil. Et aut necessitatibus sunt. Aspernatur aliquid doloribus molestiae. Sequi nemo qui quo et. Perferendis quam aut rerum similique. Illum numquam qui harum perspiciatis eaque.<h5 class=\"headifhouse\">FAQs</h5> [faqs category_ids=\"1\" display_type=\"list\" expand_first_time=\"yes\" enable_lazy_loading=\"no\"][/faqs]','677 Bins Locks\nDenesikside, TX 85454','[\"properties\\/3.jpg\",\"properties\\/12.jpg\",\"properties\\/10.jpg\",\"properties\\/11.jpg\",\"properties\\/7.jpg\"]','[{\"name\":{\"key\":\"name\",\"value\":\"First Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"3\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"2\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}},{\"name\":{\"key\":\"name\",\"value\":\"Second Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"2\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"1\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}}]',9,1,2,54,240,341800.00,NULL,1,0,1,'month','renting',10,'Botble\\RealEstate\\Models\\Account','approved',NULL,'2026-02-03',0,1,'2025-10-20 17:21:18','2025-12-20 05:59:44','43.26596','-75.918794',NULL,6725,1,1,'QJXXUK',NULL),(18,'2 Floor house in Compound Pejaten Barat Kemang','rent','Sit enim mollitia sunt optio. Ea id totam sit commodi. Modi nulla ut fuga enim dignissimos at consequuntur nihil. Ea nemo sed minima at ut ipsa doloribus. Quo culpa aliquam neque accusamus natus aperiam ratione.','Aspernatur officiis soluta nihil consequuntur ipsam modi quos. Minus voluptatum ipsum accusantium in quo quia ullam recusandae. Temporibus sunt iusto deleniti voluptatem. Totam libero magni ea voluptas. Expedita inventore dolore animi architecto est consequatur qui. Aliquam deleniti veniam non non. Alias id et illo. Quia qui dolore minima sit ex sed est. Velit quo culpa quia. Praesentium eos est amet enim non libero quae. Exercitationem libero impedit officiis voluptatem accusantium sunt. Rem fugit natus non perspiciatis et autem autem. Labore ducimus architecto iure temporibus possimus consequatur eaque. Eum aut facilis ipsum aliquid assumenda perferendis.<h5 class=\"headifhouse\">FAQs</h5> [faqs category_ids=\"1\" display_type=\"list\" expand_first_time=\"yes\" enable_lazy_loading=\"no\"][/faqs]','92093 Juston Walks Suite 617\nLebsackmouth, CT 34653-9921','[\"properties\\/4.jpg\",\"properties\\/2.jpg\",\"properties\\/8.jpg\",\"properties\\/9.jpg\",\"properties\\/7.jpg\",\"properties\\/5.jpg\"]','[{\"name\":{\"key\":\"name\",\"value\":\"First Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"3\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"2\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}},{\"name\":{\"key\":\"name\",\"value\":\"Second Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"2\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"1\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}}]',14,6,10,8,800,998000.00,NULL,1,0,2,'month','renting',10,'Botble\\RealEstate\\Models\\Account','approved',NULL,'2026-02-03',0,1,'2025-10-20 17:21:18','2025-12-20 05:59:44','43.95273','-75.708378',NULL,3678,2,2,'SJWZGL',NULL),(19,'Apartment Muiderstraatweg in Diemen','sale','Quod voluptatem consequuntur quod quis corrupti. Velit magni qui excepturi. Dolores molestiae velit quidem facere eum impedit dolores. Sit qui neque iste sed eligendi.','Atque qui qui aut doloremque dolorum. Sint et illo et quia enim. Sit qui id possimus ad. Dolores facere ut magni recusandae nam velit. Doloremque eaque quis enim dolores beatae quaerat dolor. Atque eaque natus reiciendis eum. Architecto pariatur provident quam dolores at.<h5 class=\"headifhouse\">FAQs</h5> [faqs category_ids=\"1\" display_type=\"list\" expand_first_time=\"yes\" enable_lazy_loading=\"no\"][/faqs]','91239 Destiney Greens\nKesslerville, MN 87458-8403','[\"properties\\/6.jpg\",\"properties\\/1.jpg\",\"properties\\/11.jpg\",\"properties\\/10.jpg\",\"properties\\/7.jpg\"]','[{\"name\":{\"key\":\"name\",\"value\":\"First Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"3\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"2\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}},{\"name\":{\"key\":\"name\",\"value\":\"Second Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"2\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"1\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}}]',1,5,7,60,980,965100.00,NULL,1,0,3,'month','selling',12,'Botble\\RealEstate\\Models\\Account','approved',NULL,'2026-02-03',0,1,'2025-10-20 17:21:18','2025-12-20 05:59:44','43.089527','-75.22984',NULL,8215,3,3,'CHR6WV',NULL),(20,'Nice Apartment for rent in Berlin','sale','Nulla totam vitae qui totam aut accusamus. Et corrupti et non culpa.','Expedita et consequatur dicta distinctio quo dolore eligendi. Perspiciatis sunt amet ut ratione nihil minus maxime. Vitae minima dolor nihil ea. Aspernatur dolor magni harum cupiditate qui omnis sint voluptatibus. Soluta itaque eveniet voluptas culpa at in excepturi. Nobis incidunt eum a eligendi nisi est beatae soluta. Asperiores tempore et consequuntur itaque. A repellendus quod sit quae et placeat nulla. Quia dolorum est accusamus placeat. Impedit minus cum earum. Quas ullam occaecati officia. Maxime dolores sed sunt error sapiente. Qui esse itaque qui vero ullam aut qui. Modi vel unde quo quia explicabo.<h5 class=\"headifhouse\">FAQs</h5> [faqs category_ids=\"1\" display_type=\"list\" expand_first_time=\"yes\" enable_lazy_loading=\"no\"][/faqs]','37337 Swift Stravenue\nIsmaelchester, OR 33338','[\"properties\\/8.jpg\",\"properties\\/10.jpg\",\"properties\\/6.jpg\",\"properties\\/4.jpg\",\"properties\\/7.jpg\",\"properties\\/11.jpg\",\"properties\\/5.jpg\",\"properties\\/3.jpg\",\"properties\\/9.jpg\"]','[{\"name\":{\"key\":\"name\",\"value\":\"First Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"3\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"2\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}},{\"name\":{\"key\":\"name\",\"value\":\"Second Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"2\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"1\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}}]',11,1,5,27,70,900300.00,NULL,1,0,2,'month','selling',4,'Botble\\RealEstate\\Models\\Account','approved',NULL,'2026-02-03',0,1,'2025-10-20 17:21:18','2025-12-20 05:59:44','43.708336','-75.464886',NULL,40,2,2,'YMSWNM',NULL),(21,'Pumpkin Key - Private Island','rent','In et incidunt minus ad beatae. Laborum dolorum impedit aut. Soluta et ipsum expedita animi rem molestiae exercitationem. Id blanditiis saepe et.','Ullam ut expedita doloribus id. Qui vero totam id quam ipsa enim dolorem explicabo. Earum hic voluptatem voluptatem sed iure. Illo sed qui aliquam placeat voluptate. Distinctio voluptas quis consequatur rerum. Maxime voluptates modi tenetur quo maxime illum. Voluptatem dolorem iure debitis. Asperiores aut eaque in beatae delectus. Velit perferendis quia qui. Autem possimus qui quae et. Assumenda qui ipsam tempore qui. Vero velit voluptas ut vel qui. Et sunt molestias et laborum reiciendis omnis ducimus et. Rerum numquam accusantium voluptatum debitis ipsa at et hic.<h5 class=\"headifhouse\">FAQs</h5> [faqs category_ids=\"1\" display_type=\"list\" expand_first_time=\"yes\" enable_lazy_loading=\"no\"][/faqs]','40256 Smith Highway\nWest Deion, MT 66397','[\"properties\\/11.jpg\",\"properties\\/4.jpg\",\"properties\\/8.jpg\",\"properties\\/12.jpg\",\"properties\\/9.jpg\",\"properties\\/5.jpg\",\"properties\\/3.jpg\"]','[{\"name\":{\"key\":\"name\",\"value\":\"First Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"3\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"2\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}},{\"name\":{\"key\":\"name\",\"value\":\"Second Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"2\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"1\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}}]',1,5,7,83,510,226700.00,NULL,1,0,2,'month','renting',3,'Botble\\RealEstate\\Models\\Account','approved',NULL,'2026-02-03',0,1,'2025-10-20 17:21:18','2025-12-20 05:59:44','43.038877','-76.095852',NULL,5554,2,2,'HJJVY7',NULL),(22,'Maplewood Estates','rent','Ipsam ipsum eum voluptatem nemo sapiente aut at. Quasi sed odit quos voluptate nihil est. Doloribus sit sunt cum qui porro laudantium consequatur. Labore aut consequatur dicta autem optio sit.','Consequatur impedit qui est incidunt odit. Autem minus sint quis repudiandae. Et minus fugiat excepturi odio ipsam. Ut placeat quia suscipit consequuntur praesentium nesciunt id asperiores. Perferendis doloribus tempore dolorem eos. Accusamus est sed quasi cumque maiores esse consectetur velit. Qui minima nihil reprehenderit provident dolores architecto. Tempore aperiam mollitia dolorum. Nisi voluptatem non amet corporis neque molestias ea.<h5 class=\"headifhouse\">FAQs</h5> [faqs category_ids=\"1\" display_type=\"list\" expand_first_time=\"yes\" enable_lazy_loading=\"no\"][/faqs]','29194 Lueilwitz Grove\nStacystad, UT 05318','[\"properties\\/5.jpg\",\"properties\\/7.jpg\",\"properties\\/10.jpg\",\"properties\\/9.jpg\",\"properties\\/12.jpg\",\"properties\\/1.jpg\",\"properties\\/3.jpg\",\"properties\\/4.jpg\",\"properties\\/11.jpg\"]','[{\"name\":{\"key\":\"name\",\"value\":\"First Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"3\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"2\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}},{\"name\":{\"key\":\"name\",\"value\":\"Second Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"2\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"1\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}}]',17,9,6,85,20,250600.00,NULL,1,0,1,'month','renting',11,'Botble\\RealEstate\\Models\\Account','approved',NULL,'2026-02-03',0,1,'2025-10-20 17:21:18','2025-12-20 05:59:44','43.904744','-75.063539',NULL,7651,1,1,'MO0CVR',NULL),(23,'Pine Ridge Manor','sale','Voluptatem nostrum cumque maiores ducimus quos. Ut voluptates voluptate consectetur impedit totam. Id saepe a beatae nam sed blanditiis deleniti. Fugiat iste sunt quaerat non et enim ex doloremque.','Pariatur nihil veniam voluptas deleniti ullam. A eum corrupti recusandae omnis suscipit minima culpa. Qui ad qui accusamus veniam nisi. Atque adipisci vel omnis et dolor nemo aut. Asperiores ipsam quasi eaque expedita ipsa. Debitis tenetur accusantium aut at. Aliquid dolorem qui eum et doloribus impedit. Ut facere ut esse recusandae eveniet ad excepturi. Qui delectus deserunt quaerat alias porro itaque modi. Et ullam pariatur sed qui occaecati quia ipsam.<h5 class=\"headifhouse\">FAQs</h5> [faqs category_ids=\"1\" display_type=\"list\" expand_first_time=\"yes\" enable_lazy_loading=\"no\"][/faqs]','814 Sid Springs\nPaulchester, PA 33325-6904','[\"properties\\/1.jpg\",\"properties\\/5.jpg\",\"properties\\/9.jpg\",\"properties\\/2.jpg\",\"properties\\/3.jpg\",\"properties\\/11.jpg\",\"properties\\/7.jpg\",\"properties\\/6.jpg\",\"properties\\/12.jpg\",\"properties\\/8.jpg\",\"properties\\/4.jpg\",\"properties\\/10.jpg\"]','[{\"name\":{\"key\":\"name\",\"value\":\"First Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"3\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"2\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}},{\"name\":{\"key\":\"name\",\"value\":\"Second Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"2\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"1\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}}]',3,6,2,14,770,260700.00,NULL,1,0,3,'month','selling',9,'Botble\\RealEstate\\Models\\Account','approved',NULL,'2026-02-03',0,1,'2025-10-20 17:21:18','2025-12-20 05:59:44','43.760917','-75.681335',NULL,1593,3,3,'P5WBVV',NULL),(24,'Oak Hill Residences','sale','Quis voluptate nobis soluta dicta dolorum optio. Maiores ut quia ab odio sint quas hic. Officiis ratione tempore et est fugit. Magni reiciendis natus veritatis ut dolorem.','Qui dolores ex nulla aut. Qui est nisi similique dolores cum sed. Repellat perspiciatis quia aut molestiae maiores. Et omnis officiis fuga necessitatibus soluta. Sequi sunt dolorum qui et ullam libero. Occaecati quam et et quo ut reprehenderit non. Neque voluptas debitis et adipisci. Autem et ipsa laborum dolore modi. Hic architecto ea repellendus quod officiis. Quibusdam saepe officiis esse accusantium. Ex vel aut modi aspernatur. Omnis doloremque occaecati eum nihil. Temporibus ut velit dolorum est rerum.<h5 class=\"headifhouse\">FAQs</h5> [faqs category_ids=\"1\" display_type=\"list\" expand_first_time=\"yes\" enable_lazy_loading=\"no\"][/faqs]','648 Rippin Burgs Suite 197\nSouth Ramonfurt, IA 46870','[\"properties\\/1.jpg\",\"properties\\/5.jpg\",\"properties\\/11.jpg\",\"properties\\/10.jpg\",\"properties\\/12.jpg\",\"properties\\/8.jpg\"]','[{\"name\":{\"key\":\"name\",\"value\":\"First Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"3\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"2\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}},{\"name\":{\"key\":\"name\",\"value\":\"Second Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"2\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"1\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}}]',3,7,2,95,640,439900.00,NULL,1,0,6,'month','selling',4,'Botble\\RealEstate\\Models\\Account','approved',NULL,'2026-02-03',0,1,'2025-10-20 17:21:18','2025-12-20 05:59:44','42.504267','-75.394437',NULL,5009,6,6,'MZYY9H',NULL),(25,'Sunnybrook Villas','rent','Quasi dolore est magni possimus molestiae quia. Cupiditate temporibus perferendis illum recusandae doloremque. Perspiciatis sunt optio dolor modi eum optio. Dolorem eius mollitia provident ab qui nostrum. Ipsam ipsa reiciendis et voluptatibus.','Et atque sint voluptatem laboriosam nam libero. Consequatur autem consequatur ipsum recusandae dolor illo architecto. Eum sequi aspernatur voluptatem. Consequatur doloremque ea aspernatur. Tempore recusandae placeat labore quasi vitae quas rerum. Nobis velit quia enim eaque ipsum ea. Voluptatem eos molestias accusamus aut assumenda illum. Adipisci ut aperiam autem quia nemo. Quisquam voluptas voluptas voluptas inventore.<h5 class=\"headifhouse\">FAQs</h5> [faqs category_ids=\"1\" display_type=\"list\" expand_first_time=\"yes\" enable_lazy_loading=\"no\"][/faqs]','642 Leonie Ville Apt. 842\nBogisichfurt, IN 01140-5516','[\"properties\\/9.jpg\",\"properties\\/2.jpg\",\"properties\\/3.jpg\",\"properties\\/7.jpg\",\"properties\\/10.jpg\",\"properties\\/4.jpg\"]','[{\"name\":{\"key\":\"name\",\"value\":\"First Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"3\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"2\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}},{\"name\":{\"key\":\"name\",\"value\":\"Second Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"2\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"1\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}}]',3,4,2,23,500,953600.00,NULL,0,0,6,'month','renting',3,'Botble\\RealEstate\\Models\\Account','approved',NULL,'2026-02-03',0,1,'2025-10-20 17:21:18','2025-12-20 05:59:44','43.654218','-76.179975',NULL,266,6,6,'6RLT0M',NULL),(26,'Riverstone Condominiums','sale','Necessitatibus vel occaecati deserunt et laudantium architecto quia. Non aut nulla accusamus blanditiis corrupti ipsa aut. Delectus neque voluptatum aut aut. Vel ut doloribus consectetur vel corrupti voluptas.','Vel accusamus expedita occaecati aut. Est est rerum consectetur beatae alias est. Id iusto ab dolor explicabo explicabo adipisci magni. Molestias tenetur veritatis animi eum. Dolor voluptatibus odio sapiente sed eos enim quia. Beatae minus quia voluptatem ut voluptas modi sunt alias. Nostrum et provident et voluptatum. Asperiores est ipsam aut voluptas quas. Eos asperiores sed consequatur ducimus ex aut mollitia. Alias ipsa reprehenderit illo nihil. Vero est ducimus exercitationem nemo.<h5 class=\"headifhouse\">FAQs</h5> [faqs category_ids=\"1\" display_type=\"list\" expand_first_time=\"yes\" enable_lazy_loading=\"no\"][/faqs]','820 Aufderhar Summit\nNorth Rene, CT 35494-8695','[\"properties\\/5.jpg\",\"properties\\/6.jpg\",\"properties\\/4.jpg\",\"properties\\/8.jpg\",\"properties\\/11.jpg\",\"properties\\/3.jpg\",\"properties\\/1.jpg\",\"properties\\/10.jpg\",\"properties\\/12.jpg\",\"properties\\/7.jpg\",\"properties\\/9.jpg\",\"properties\\/2.jpg\"]','[{\"name\":{\"key\":\"name\",\"value\":\"First Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"3\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"2\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}},{\"name\":{\"key\":\"name\",\"value\":\"Second Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"2\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"1\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}}]',2,1,8,34,580,209300.00,NULL,1,0,2,'month','selling',1,'Botble\\RealEstate\\Models\\Account','approved',NULL,'2026-02-03',0,1,'2025-10-20 17:21:18','2025-12-20 05:59:44','42.870536','-74.889725',NULL,6302,2,2,'MLEPT7',NULL),(27,'Cedar Park Apartments','rent','Et unde eaque voluptatem qui ut maxime aliquid. Amet et fugiat fuga voluptas. Necessitatibus recusandae qui cupiditate error aut deserunt.','Iusto voluptas id est et animi et ipsum. Sequi velit minima optio. Quaerat est provident tenetur. Voluptatem reiciendis debitis minima. Magni debitis alias accusamus dolores saepe eum error. Ut nihil porro repellat voluptate aut ullam quia. Assumenda et ea accusantium sed harum. At ut eos repudiandae et sit deserunt. Animi aut harum quas quaerat. Facilis non ipsum quam.<h5 class=\"headifhouse\">FAQs</h5> [faqs category_ids=\"1\" display_type=\"list\" expand_first_time=\"yes\" enable_lazy_loading=\"no\"][/faqs]','33774 Conn Estate Apt. 635\nChristiansenmouth, OR 62066','[\"properties\\/6.jpg\",\"properties\\/8.jpg\",\"properties\\/9.jpg\",\"properties\\/2.jpg\",\"properties\\/12.jpg\",\"properties\\/10.jpg\",\"properties\\/3.jpg\",\"properties\\/1.jpg\"]','[{\"name\":{\"key\":\"name\",\"value\":\"First Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"3\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"2\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}},{\"name\":{\"key\":\"name\",\"value\":\"Second Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"2\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"1\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}}]',17,10,8,83,790,856900.00,NULL,1,0,3,'month','renting',7,'Botble\\RealEstate\\Models\\Account','approved',NULL,'2026-02-03',0,1,'2025-10-20 17:21:18','2025-12-20 05:59:44','43.662502','-75.398624',NULL,712,3,3,'VGY8ZF',NULL),(28,'Lakeside Retreat','sale','Consequuntur odio saepe molestias et voluptas officiis. Sit asperiores similique nesciunt ut deserunt sunt ipsum. Provident et voluptatem recusandae iure. Iusto quis facilis sapiente.','Nobis enim architecto in earum harum quia omnis ut. A ut quo ipsa perferendis ipsam perferendis quae vero. Voluptatem deleniti dicta molestiae sint. Repellat ea dolorem a recusandae quia consequatur earum. Consequatur at nihil rem sit in enim in. Officiis iusto porro vitae animi. Sunt ea non odio suscipit rerum. Ut illo et inventore natus aliquam. Est minima earum minima fugit et aliquam. Suscipit vel facilis dicta doloremque alias voluptas. Iure earum minima facere pariatur placeat. Porro esse ab occaecati in. Quia iusto hic eos quia. Illum id laudantium animi.<h5 class=\"headifhouse\">FAQs</h5> [faqs category_ids=\"1\" display_type=\"list\" expand_first_time=\"yes\" enable_lazy_loading=\"no\"][/faqs]','32306 Walker Extension Suite 452\nLake Ransomport, SD 72015','[\"properties\\/10.jpg\",\"properties\\/3.jpg\",\"properties\\/1.jpg\",\"properties\\/9.jpg\",\"properties\\/11.jpg\",\"properties\\/7.jpg\",\"properties\\/5.jpg\",\"properties\\/6.jpg\",\"properties\\/2.jpg\"]','[{\"name\":{\"key\":\"name\",\"value\":\"First Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"3\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"2\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}},{\"name\":{\"key\":\"name\",\"value\":\"Second Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"2\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"1\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}}]',4,7,2,50,340,876200.00,NULL,0,0,2,'month','selling',2,'Botble\\RealEstate\\Models\\Account','approved',NULL,'2026-02-03',0,1,'2025-10-20 17:21:18','2025-12-20 05:59:44','43.816024','-76.063168',NULL,4655,2,2,'ICJQS0',NULL),(29,'Willow Creek Homes','sale','Ipsum voluptas nihil placeat esse dolores aut. Voluptatum vitae quia eos ut vero ad vel. Corrupti aliquam neque vitae fugit modi.','At qui temporibus consequatur sed vero voluptatem. Fugit est tenetur nostrum natus et sed. Distinctio voluptas sed eveniet quia. Ratione harum rerum magnam. Numquam omnis reiciendis ipsum occaecati eum magni ab. Qui ipsam velit ipsum quas. Aut possimus laboriosam nihil magni delectus neque. Sit est quia cumque sit. Veritatis esse et soluta provident magni.<h5 class=\"headifhouse\">FAQs</h5> [faqs category_ids=\"1\" display_type=\"list\" expand_first_time=\"yes\" enable_lazy_loading=\"no\"][/faqs]','861 Kemmer Brook\nPort Vaughn, MT 34936','[\"properties\\/12.jpg\",\"properties\\/9.jpg\",\"properties\\/1.jpg\",\"properties\\/7.jpg\",\"properties\\/6.jpg\",\"properties\\/8.jpg\",\"properties\\/5.jpg\",\"properties\\/4.jpg\",\"properties\\/11.jpg\",\"properties\\/2.jpg\",\"properties\\/3.jpg\",\"properties\\/10.jpg\"]','[{\"name\":{\"key\":\"name\",\"value\":\"First Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"3\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"2\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}},{\"name\":{\"key\":\"name\",\"value\":\"Second Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"2\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"1\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}}]',8,4,9,37,990,390400.00,NULL,1,0,2,'month','selling',7,'Botble\\RealEstate\\Models\\Account','approved',NULL,'2026-02-03',0,1,'2025-10-20 17:21:18','2025-12-20 05:59:44','44.008937','-75.591727',NULL,1136,2,2,'DFVXB5',NULL),(30,'Grandview Heights','rent','Esse voluptatem tempore rerum quas dolorem nemo enim. Quidem aut ratione unde accusantium. Aut eligendi itaque omnis aut similique alias.','Dolorem ullam harum sit possimus aut. Consequatur tenetur atque eaque amet nostrum voluptas ut iusto. Doloribus voluptatem eaque dolore neque sequi sapiente odit. Voluptas voluptatem quidem placeat laborum maiores. Odio consequatur suscipit maiores quasi quis. Eveniet temporibus facere quidem id saepe asperiores. Sapiente ut rerum laboriosam et incidunt quas. Molestiae aut qui rerum error exercitationem et impedit possimus. Et voluptatem eum laboriosam doloremque sit quis tenetur. Voluptas eius et animi sequi tempore. Iusto voluptatem et provident et veniam et consequatur. Aut consequuntur doloribus iusto. Odit excepturi qui quia nisi quia iusto. Voluptate dolore delectus corporis eius cupiditate et.<h5 class=\"headifhouse\">FAQs</h5> [faqs category_ids=\"1\" display_type=\"list\" expand_first_time=\"yes\" enable_lazy_loading=\"no\"][/faqs]','9709 Wyman Pass\nSouth Hillary, SD 62703','[\"properties\\/9.jpg\",\"properties\\/3.jpg\",\"properties\\/11.jpg\",\"properties\\/8.jpg\",\"properties\\/1.jpg\",\"properties\\/12.jpg\"]','[{\"name\":{\"key\":\"name\",\"value\":\"First Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"3\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"2\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}},{\"name\":{\"key\":\"name\",\"value\":\"Second Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"2\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"1\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}}]',8,2,2,45,560,209000.00,NULL,0,0,2,'month','renting',7,'Botble\\RealEstate\\Models\\Account','approved',NULL,'2026-02-03',0,1,'2025-10-20 17:21:18','2025-12-20 05:59:44','43.819294','-75.192083',NULL,1716,2,2,'E6FKEJ',NULL),(31,'Forest Glen Cottages','rent','Vero dolores esse et accusamus neque iusto sed. Corrupti rerum quos ipsa. At non quas laborum accusamus eum maxime commodi.','Sequi nobis cupiditate modi at accusamus. Vero sunt nihil quas cumque. Cum similique tenetur rerum enim et. A eum vitae dolores molestiae tempore corporis non. Ab nostrum quaerat pariatur ipsa et aut architecto voluptatem. Consequuntur dolore possimus eaque itaque recusandae natus. Nulla repellat veritatis blanditiis qui rerum. Voluptatem esse at recusandae. Occaecati architecto suscipit alias ut nihil atque. Blanditiis eaque perferendis qui quae molestiae ut. Dicta ut dolores fugit beatae. Placeat error nobis accusamus quia.<h5 class=\"headifhouse\">FAQs</h5> [faqs category_ids=\"1\" display_type=\"list\" expand_first_time=\"yes\" enable_lazy_loading=\"no\"][/faqs]','92778 Swift Locks Apt. 605\nPort Josiah, TX 21343-2002','[\"properties\\/5.jpg\",\"properties\\/7.jpg\",\"properties\\/4.jpg\",\"properties\\/9.jpg\",\"properties\\/8.jpg\",\"properties\\/10.jpg\",\"properties\\/12.jpg\",\"properties\\/6.jpg\",\"properties\\/11.jpg\",\"properties\\/1.jpg\",\"properties\\/2.jpg\",\"properties\\/3.jpg\"]','[{\"name\":{\"key\":\"name\",\"value\":\"First Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"3\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"2\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}},{\"name\":{\"key\":\"name\",\"value\":\"Second Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"2\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"1\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}}]',2,4,2,89,390,953200.00,NULL,0,0,4,'month','renting',11,'Botble\\RealEstate\\Models\\Account','approved',NULL,'2026-02-03',0,1,'2025-10-20 17:21:18','2025-12-20 05:59:44','43.715972','-75.227281',NULL,5173,4,4,'PVYFKE',NULL),(32,'Harborview Towers','rent','Non dolorum quo aut. Ut id provident molestias eaque ratione pariatur. Nulla ad voluptatem aut consectetur atque iure et. Voluptatem est consequatur ut unde.','Temporibus dicta inventore amet at commodi provident. Nostrum error nulla deserunt. Et optio consectetur eum vitae. Ut velit non laborum voluptates quas ea ex. Hic aperiam nihil quam eum. Reprehenderit voluptatem dolor et consectetur ducimus. Minima ipsam distinctio voluptatem nostrum. Qui animi pariatur adipisci magnam expedita aut. Ut repellendus aut numquam distinctio enim fugiat. Ipsa accusamus non unde.<h5 class=\"headifhouse\">FAQs</h5> [faqs category_ids=\"1\" display_type=\"list\" expand_first_time=\"yes\" enable_lazy_loading=\"no\"][/faqs]','342 Kuhlman Ridge\nWest Kimberly, NH 15338-8315','[\"properties\\/4.jpg\",\"properties\\/11.jpg\",\"properties\\/9.jpg\",\"properties\\/5.jpg\",\"properties\\/6.jpg\",\"properties\\/2.jpg\",\"properties\\/8.jpg\",\"properties\\/1.jpg\",\"properties\\/7.jpg\",\"properties\\/10.jpg\",\"properties\\/3.jpg\",\"properties\\/12.jpg\"]','[{\"name\":{\"key\":\"name\",\"value\":\"First Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"3\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"2\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}},{\"name\":{\"key\":\"name\",\"value\":\"Second Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"2\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"1\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}}]',9,7,8,48,190,714200.00,NULL,0,0,3,'month','renting',3,'Botble\\RealEstate\\Models\\Account','approved',NULL,'2026-02-03',0,1,'2025-10-20 17:21:18','2025-12-20 05:59:44','43.994899','-76.643762',NULL,715,3,3,'IYSNBS',NULL),(33,'Meadowlands Estates','rent','Culpa eos assumenda voluptatem id. Tempore ut voluptatem reiciendis voluptas blanditiis. Voluptatibus repudiandae ut omnis.','Quisquam deserunt ut aut quis voluptatem velit. Laborum non ullam et placeat. Beatae et sed consequatur molestiae quia neque. Expedita repellendus ex qui quia. Et itaque assumenda et quaerat ea enim possimus. Perspiciatis natus autem optio rem est consequatur beatae vero. Quisquam pariatur voluptatum aperiam id officia provident. Sed aut ex magnam vitae qui cupiditate eum. Dolorum voluptas tenetur nemo voluptas.<h5 class=\"headifhouse\">FAQs</h5> [faqs category_ids=\"1\" display_type=\"list\" expand_first_time=\"yes\" enable_lazy_loading=\"no\"][/faqs]','406 Boyer Parks\nNikolaushaven, NM 22803','[\"properties\\/8.jpg\",\"properties\\/3.jpg\",\"properties\\/4.jpg\",\"properties\\/11.jpg\",\"properties\\/10.jpg\",\"properties\\/7.jpg\",\"properties\\/6.jpg\",\"properties\\/1.jpg\",\"properties\\/5.jpg\",\"properties\\/12.jpg\",\"properties\\/9.jpg\",\"properties\\/2.jpg\"]','[{\"name\":{\"key\":\"name\",\"value\":\"First Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"3\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"2\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}},{\"name\":{\"key\":\"name\",\"value\":\"Second Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"2\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"1\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}}]',9,9,7,82,100,596600.00,NULL,1,0,2,'month','renting',2,'Botble\\RealEstate\\Models\\Account','approved',NULL,'2026-02-03',0,1,'2025-10-20 17:21:18','2025-12-20 05:59:44','42.765432','-76.262125',NULL,8058,2,2,'MOZ1PO',NULL),(34,'Highland Meadows','sale','Inventore optio consectetur provident temporibus rerum id distinctio. Illo repudiandae sapiente porro beatae repellat omnis nisi. Non perspiciatis itaque et omnis. Neque assumenda enim et omnis ipsum quidem mollitia. Id ipsam ea beatae suscipit quia omnis nobis.','Sed vero repellendus delectus ratione. Temporibus nesciunt harum qui facere aut modi et. Nisi illo quasi excepturi sit eaque consequatur et recusandae. Voluptas excepturi et est eaque voluptas rerum esse. Velit et autem perspiciatis impedit. Omnis laudantium est vero libero. Provident sed voluptate aut tempora qui adipisci at. Explicabo saepe expedita est voluptatem quibusdam aut. Dignissimos mollitia sint atque incidunt.<h5 class=\"headifhouse\">FAQs</h5> [faqs category_ids=\"1\" display_type=\"list\" expand_first_time=\"yes\" enable_lazy_loading=\"no\"][/faqs]','877 Julius Drive\nSouth Elsashire, TN 23870-5286','[\"properties\\/4.jpg\",\"properties\\/8.jpg\",\"properties\\/3.jpg\",\"properties\\/11.jpg\",\"properties\\/12.jpg\"]','[{\"name\":{\"key\":\"name\",\"value\":\"First Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"3\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"2\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}},{\"name\":{\"key\":\"name\",\"value\":\"Second Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"2\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"1\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}}]',13,10,7,27,40,697100.00,NULL,1,0,2,'month','selling',9,'Botble\\RealEstate\\Models\\Account','approved',NULL,'2026-02-03',0,1,'2025-10-20 17:21:18','2025-12-20 05:59:44','42.627016','-76.23747',NULL,8141,2,2,'1YWTRP',NULL),(35,'Brookfield Gardens','rent','Quae dolor modi pariatur optio nihil qui dolore. Animi porro voluptatibus voluptatem ex omnis occaecati dolor. Non exercitationem aspernatur illum dolor optio id. Qui inventore est libero sit fugit.','Aspernatur nesciunt rerum adipisci. Et minus voluptas iusto dolores esse accusamus voluptatem corporis. Similique at eum id numquam eum. Placeat doloremque consequatur eum dignissimos esse modi. Molestias ut fugiat qui quia in ea. Rerum dolorem dolores et eum porro repellendus. Aspernatur molestias veniam eum nulla nulla quis. Ut a vero et ducimus qui quia ea quisquam. Qui corrupti voluptatem est omnis. Vero deserunt possimus aut animi aut aut. Atque beatae qui est vel. Iusto rerum fugiat aliquam dolores corporis accusantium. Consequatur exercitationem quos beatae et aut repudiandae nihil.<h5 class=\"headifhouse\">FAQs</h5> [faqs category_ids=\"1\" display_type=\"list\" expand_first_time=\"yes\" enable_lazy_loading=\"no\"][/faqs]','985 Gregg Mills\nWatersborough, NJ 44498-7230','[\"properties\\/12.jpg\",\"properties\\/5.jpg\",\"properties\\/10.jpg\",\"properties\\/2.jpg\",\"properties\\/6.jpg\"]','[{\"name\":{\"key\":\"name\",\"value\":\"First Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"3\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"2\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}},{\"name\":{\"key\":\"name\",\"value\":\"Second Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"2\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"1\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}}]',17,7,3,26,180,866500.00,NULL,0,0,2,'month','renting',1,'Botble\\RealEstate\\Models\\Account','approved',NULL,'2026-02-03',0,1,'2025-10-20 17:21:18','2025-12-20 05:59:44','43.898997','-75.716742',NULL,6532,2,2,'EZR3JP',NULL),(36,'Silverwood Villas','sale','Voluptatem esse qui similique non et nemo quisquam. A modi nihil sed laborum sed ipsam dicta dolore. Eos officiis ut in alias.','Odio voluptatem aut sed nobis vitae. Dolorum quasi sit eaque nihil repudiandae quia. Voluptatem quo totam quas voluptates dolor voluptatem aut. Quia consequuntur et eum dolores ea est debitis. Accusantium facere voluptate voluptatibus fugit laboriosam. Eum veniam inventore alias dolorem ratione ea aliquid. Omnis praesentium repellat perspiciatis nihil nulla. Quis voluptatum eos beatae asperiores molestias culpa. Recusandae neque deserunt necessitatibus qui quis veniam.<h5 class=\"headifhouse\">FAQs</h5> [faqs category_ids=\"1\" display_type=\"list\" expand_first_time=\"yes\" enable_lazy_loading=\"no\"][/faqs]','415 Lia Overpass\nBeaufort, IL 84781','[\"properties\\/9.jpg\",\"properties\\/4.jpg\",\"properties\\/1.jpg\",\"properties\\/6.jpg\",\"properties\\/10.jpg\",\"properties\\/7.jpg\",\"properties\\/11.jpg\",\"properties\\/8.jpg\",\"properties\\/3.jpg\",\"properties\\/5.jpg\"]','[{\"name\":{\"key\":\"name\",\"value\":\"First Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"3\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"2\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}},{\"name\":{\"key\":\"name\",\"value\":\"Second Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"2\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"1\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}}]',3,8,8,16,420,934200.00,NULL,1,0,3,'month','selling',9,'Botble\\RealEstate\\Models\\Account','approved',NULL,'2026-02-03',0,1,'2025-10-20 17:21:19','2025-12-20 05:59:44','42.640376','-76.551988',NULL,8237,3,3,'BK5DKB',NULL),(37,'Evergreen Terrace','sale','Earum est quis vitae voluptatem. Esse reprehenderit quibusdam eaque aut numquam laborum perferendis. Nulla unde enim necessitatibus et tenetur quo.','Debitis voluptas iusto quod qui quis harum dignissimos laboriosam. Nostrum aut numquam ut alias iure voluptas et ut. Quia ea non minus exercitationem mollitia dolores. Odio dolorem assumenda et occaecati doloribus. Sit quae ducimus atque. Adipisci ullam soluta asperiores fuga quaerat quaerat. Aut commodi incidunt ad fugit velit dolorum. Rerum dicta deserunt doloremque. Quidem minus velit totam cupiditate sit distinctio quidem facere. Incidunt nihil neque et rerum aspernatur autem quasi. Molestiae possimus quaerat sed autem delectus et.<h5 class=\"headifhouse\">FAQs</h5> [faqs category_ids=\"1\" display_type=\"list\" expand_first_time=\"yes\" enable_lazy_loading=\"no\"][/faqs]','1632 Edward Parkways\nPort Destiney, AZ 35223-9528','[\"properties\\/11.jpg\",\"properties\\/8.jpg\",\"properties\\/4.jpg\",\"properties\\/5.jpg\",\"properties\\/9.jpg\",\"properties\\/1.jpg\",\"properties\\/3.jpg\",\"properties\\/6.jpg\",\"properties\\/2.jpg\",\"properties\\/10.jpg\"]','[{\"name\":{\"key\":\"name\",\"value\":\"First Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"3\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"2\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}},{\"name\":{\"key\":\"name\",\"value\":\"Second Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"2\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"1\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}}]',4,1,4,63,930,62000.00,NULL,1,0,5,'month','selling',2,'Botble\\RealEstate\\Models\\Account','approved',NULL,'2026-02-03',0,1,'2025-10-20 17:21:19','2025-12-20 05:59:44','43.242489','-74.947157',NULL,1587,5,5,'BJWLOA',NULL),(38,'Golden Gate Residences','sale','Non natus reprehenderit possimus. Aut ea dolore facere voluptas ipsa doloribus saepe. Occaecati consequatur id sit id amet eveniet.','Laudantium quam sed possimus cupiditate reprehenderit modi sunt. Voluptates nostrum ad possimus sequi. Sunt accusantium exercitationem incidunt quos et. Enim et ut molestiae enim quae molestiae id. Qui soluta sunt ea vel ratione voluptatem at. Quasi totam culpa eos eos. Quas non aut ut ut ut. Vitae quam expedita et omnis. Rerum ex quidem sequi sunt. Eum aspernatur dicta atque esse qui. Eum et provident eum tempora et. Tenetur provident recusandae officiis laboriosam ab aut. Quas cumque iure cum quasi fugit voluptatum accusantium. Labore possimus provident esse similique.<h5 class=\"headifhouse\">FAQs</h5> [faqs category_ids=\"1\" display_type=\"list\" expand_first_time=\"yes\" enable_lazy_loading=\"no\"][/faqs]','47654 Kamryn Via Apt. 154\nMaudefurt, KS 66925-3386','[\"properties\\/3.jpg\",\"properties\\/10.jpg\",\"properties\\/5.jpg\",\"properties\\/9.jpg\",\"properties\\/7.jpg\",\"properties\\/11.jpg\",\"properties\\/4.jpg\",\"properties\\/2.jpg\",\"properties\\/1.jpg\",\"properties\\/8.jpg\",\"properties\\/12.jpg\"]','[{\"name\":{\"key\":\"name\",\"value\":\"First Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"3\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"2\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}},{\"name\":{\"key\":\"name\",\"value\":\"Second Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"2\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"1\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}}]',13,9,3,85,470,977200.00,NULL,1,0,6,'month','selling',3,'Botble\\RealEstate\\Models\\Account','approved',NULL,'2026-02-03',0,1,'2025-10-20 17:21:19','2025-12-20 05:59:44','43.789299','-76.186796',NULL,3222,6,6,'NKTBQT',NULL),(39,'Spring Blossom Park','sale','Dolor in iste at. Inventore voluptatem quisquam sint quidem. Nemo ab et inventore odio voluptates quisquam. Qui minima neque deserunt doloribus.','Voluptatem nihil repudiandae sit consequatur illum omnis velit. Nam vel corrupti in in rerum veritatis quo. Perspiciatis perspiciatis molestias nulla et autem. Suscipit neque laboriosam voluptatem harum molestiae aliquam amet. Ea unde consequatur sapiente voluptate ex est occaecati. Et rerum illum totam dolorem neque quod. Ipsa quae quis at. Sed rerum et molestias laborum nostrum a sequi. Asperiores facere sed voluptatum. Quasi ut consequatur vel distinctio. Recusandae est sint harum sit eos officiis et.<h5 class=\"headifhouse\">FAQs</h5> [faqs category_ids=\"1\" display_type=\"list\" expand_first_time=\"yes\" enable_lazy_loading=\"no\"][/faqs]','871 Strosin River Suite 119\nSchmelertown, CT 86832','[\"properties\\/8.jpg\",\"properties\\/3.jpg\",\"properties\\/6.jpg\",\"properties\\/11.jpg\",\"properties\\/4.jpg\",\"properties\\/9.jpg\",\"properties\\/2.jpg\",\"properties\\/10.jpg\",\"properties\\/5.jpg\",\"properties\\/7.jpg\",\"properties\\/1.jpg\"]','[{\"name\":{\"key\":\"name\",\"value\":\"First Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"3\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"2\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}},{\"name\":{\"key\":\"name\",\"value\":\"Second Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"2\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"1\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}}]',17,1,2,83,960,547600.00,NULL,0,0,6,'month','selling',5,'Botble\\RealEstate\\Models\\Account','approved',NULL,'2026-02-03',0,1,'2025-10-20 17:21:19','2025-12-20 05:59:44','43.146283','-75.867897',NULL,1351,6,6,'BGZ8SV',NULL),(40,'Horizon Pointe','sale','Eos aspernatur beatae excepturi at iure quasi et molestias. Dolorem placeat eaque repellendus a consequatur nihil. Veritatis illo nostrum sapiente iste maxime.','Iure tempora odit voluptatem vitae. In excepturi molestiae omnis voluptatum. Veniam accusantium illum consequatur maiores ea aut beatae earum. Quae dolor id voluptatem adipisci non aspernatur dolor. In quis autem qui similique reiciendis non et. A modi aut sunt est. Voluptas et sit quisquam sint velit autem tempore. Odio et impedit ut voluptas quod sint aut. Ratione aspernatur architecto quas sit molestiae et facere excepturi. Vel vel blanditiis placeat ut optio sint fuga. Molestiae cumque esse in possimus laudantium voluptatem labore. Doloremque eos consequatur est iure pariatur. Omnis ut officia commodi quia enim labore.<h5 class=\"headifhouse\">FAQs</h5> [faqs category_ids=\"1\" display_type=\"list\" expand_first_time=\"yes\" enable_lazy_loading=\"no\"][/faqs]','955 Kaela Fields Apt. 834\nIvatown, MA 39846','[\"properties\\/8.jpg\",\"properties\\/11.jpg\",\"properties\\/4.jpg\",\"properties\\/1.jpg\",\"properties\\/6.jpg\",\"properties\\/2.jpg\",\"properties\\/3.jpg\",\"properties\\/12.jpg\",\"properties\\/7.jpg\"]','[{\"name\":{\"key\":\"name\",\"value\":\"First Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"3\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"2\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}},{\"name\":{\"key\":\"name\",\"value\":\"Second Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"2\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"1\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}}]',15,4,3,65,150,816400.00,NULL,1,0,5,'month','selling',9,'Botble\\RealEstate\\Models\\Account','approved',NULL,'2026-02-03',0,1,'2025-10-20 17:21:19','2025-12-20 05:59:44','43.759152','-76.430037',NULL,7088,5,5,'AM9CST',NULL),(41,'Whispering Pines Lodge','sale','Consequatur eum veniam sed error aut culpa. Et recusandae eius eius et soluta quidem reprehenderit. Minus facere molestiae qui natus.','Dolor alias iusto inventore in doloribus perferendis nihil. Libero culpa doloribus rerum rerum veniam deserunt sed. Id eaque exercitationem in nulla distinctio placeat. Suscipit vel et iure. Deleniti vitae voluptatem non consequatur odio quos tenetur sit. Magni quidem quia nisi impedit. Eum est dolor nesciunt enim eligendi consequuntur error. Quia ab nobis quam excepturi sit excepturi qui. Ipsa dicta et delectus ducimus nostrum sed. Ipsum eum numquam explicabo ipsam.<h5 class=\"headifhouse\">FAQs</h5> [faqs category_ids=\"1\" display_type=\"list\" expand_first_time=\"yes\" enable_lazy_loading=\"no\"][/faqs]','8825 Etha Plain Suite 549\nTiannamouth, MI 96612-1915','[\"properties\\/3.jpg\",\"properties\\/12.jpg\",\"properties\\/11.jpg\",\"properties\\/6.jpg\",\"properties\\/8.jpg\",\"properties\\/9.jpg\",\"properties\\/10.jpg\",\"properties\\/2.jpg\",\"properties\\/7.jpg\",\"properties\\/1.jpg\",\"properties\\/4.jpg\"]','[{\"name\":{\"key\":\"name\",\"value\":\"First Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"3\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"2\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}},{\"name\":{\"key\":\"name\",\"value\":\"Second Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"2\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"1\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}}]',15,4,3,26,80,838800.00,NULL,0,0,1,'month','selling',5,'Botble\\RealEstate\\Models\\Account','approved',NULL,'2026-02-03',0,1,'2025-10-20 17:21:19','2025-12-20 05:59:44','43.602504','-75.709428',NULL,1384,1,1,'JGXZ73',NULL),(42,'Sunset Ridge','rent','Ullam quos qui ipsa sint. Qui ea voluptatem omnis a. Esse porro iste repellat. Officiis voluptas consequatur iusto sed voluptatem.','Voluptates harum illo dolorem mollitia ut voluptatem voluptatem. Ipsum in officia dolorum adipisci est. Molestias aut enim maxime. Eveniet voluptate nobis ipsa distinctio. Maxime eum animi corrupti consequatur deserunt excepturi. Molestias et expedita voluptatibus veritatis aut. Et at eum maxime rem enim. Aliquam tempora saepe eos officia. Sit est placeat et consequatur. Esse ut eveniet ipsa aspernatur deserunt non autem. Aut nostrum fugit veritatis. Nulla doloremque sed tempore explicabo enim. Aliquam blanditiis qui eveniet rerum sit architecto dolorem. Et earum quia error et ipsam aperiam officiis.<h5 class=\"headifhouse\">FAQs</h5> [faqs category_ids=\"1\" display_type=\"list\" expand_first_time=\"yes\" enable_lazy_loading=\"no\"][/faqs]','50446 Dach Bypass\nWest Esperanza, HI 25833','[\"properties\\/5.jpg\",\"properties\\/9.jpg\",\"properties\\/12.jpg\",\"properties\\/1.jpg\",\"properties\\/10.jpg\",\"properties\\/8.jpg\",\"properties\\/6.jpg\",\"properties\\/11.jpg\",\"properties\\/2.jpg\",\"properties\\/3.jpg\",\"properties\\/7.jpg\",\"properties\\/4.jpg\"]','[{\"name\":{\"key\":\"name\",\"value\":\"First Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"3\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"2\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}},{\"name\":{\"key\":\"name\",\"value\":\"Second Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"2\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"1\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}}]',1,6,2,40,160,143000.00,NULL,1,0,5,'month','renting',4,'Botble\\RealEstate\\Models\\Account','approved',NULL,'2026-02-03',0,1,'2025-10-20 17:21:19','2025-12-20 05:59:44','43.591205','-76.339065',NULL,5659,5,5,'JVDQRC',NULL),(43,'Timberline Estates','sale','Sunt voluptatem doloremque modi maiores ut. Aperiam quaerat deserunt sed et et amet voluptatem. Velit in dicta incidunt iure. Et omnis nisi non nostrum quo.','Saepe aut minima maxime aut. Quisquam est iure omnis et saepe. Quo ut facilis aut dolor exercitationem ad nam et. Aperiam labore est possimus maiores quas magni. Dolorum illum vel provident. Excepturi adipisci repellat itaque aliquam aperiam aut. Iste nisi repellendus ad nobis ea omnis porro. Totam ea soluta aut sint et soluta. Beatae mollitia et ratione et nihil numquam. Nemo sit quaerat commodi accusantium deserunt totam. Voluptatibus quibusdam earum corporis ut.<h5 class=\"headifhouse\">FAQs</h5> [faqs category_ids=\"1\" display_type=\"list\" expand_first_time=\"yes\" enable_lazy_loading=\"no\"][/faqs]','72682 Ima Grove\nLinneatown, NV 28752-8846','[\"properties\\/7.jpg\",\"properties\\/6.jpg\",\"properties\\/5.jpg\",\"properties\\/4.jpg\",\"properties\\/9.jpg\",\"properties\\/1.jpg\",\"properties\\/11.jpg\"]','[{\"name\":{\"key\":\"name\",\"value\":\"First Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"3\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"2\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}},{\"name\":{\"key\":\"name\",\"value\":\"Second Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"2\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"1\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}}]',10,6,2,15,960,438900.00,NULL,1,0,5,'month','selling',1,'Botble\\RealEstate\\Models\\Account','approved',NULL,'2026-02-03',0,1,'2025-10-20 17:21:19','2025-12-20 05:59:44','43.836762','-75.220034',NULL,4139,5,5,'V4UI8S',NULL),(44,'Crystal Lake Condos','rent','Et aspernatur rem et rerum voluptas rerum. Et explicabo ullam architecto repellat. Optio eos quo voluptatum ut.','Qui veritatis commodi labore. Earum voluptatem quam aut aut officiis ducimus accusamus. Et aut aspernatur in distinctio iste qui voluptatum. Quia nihil consequuntur et accusamus. Sed id vel illum voluptas. Provident adipisci nihil odio blanditiis nihil natus ratione. In ullam veritatis vel omnis beatae et nam alias.<h5 class=\"headifhouse\">FAQs</h5> [faqs category_ids=\"1\" display_type=\"list\" expand_first_time=\"yes\" enable_lazy_loading=\"no\"][/faqs]','675 Carol Square Apt. 979\nNathanaelshire, CO 01220','[\"properties\\/5.jpg\",\"properties\\/11.jpg\",\"properties\\/1.jpg\",\"properties\\/12.jpg\",\"properties\\/6.jpg\",\"properties\\/8.jpg\",\"properties\\/10.jpg\",\"properties\\/7.jpg\",\"properties\\/3.jpg\",\"properties\\/4.jpg\",\"properties\\/9.jpg\",\"properties\\/2.jpg\"]','[{\"name\":{\"key\":\"name\",\"value\":\"First Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"3\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"2\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}},{\"name\":{\"key\":\"name\",\"value\":\"Second Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"2\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"1\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}}]',16,2,9,35,970,103800.00,NULL,1,0,3,'month','renting',3,'Botble\\RealEstate\\Models\\Account','approved',NULL,'2026-02-03',0,1,'2025-10-20 17:21:19','2025-12-20 05:59:44','43.758938','-75.439672',NULL,3720,3,3,'RJBINH',NULL),(45,'Briarwood Apartments','rent','Sed placeat architecto deserunt voluptatibus. Nihil harum debitis cumque et tempora delectus similique. Similique cupiditate quis placeat.','Laborum ut nesciunt libero. Perspiciatis quidem sed sequi est. Aut culpa quisquam sunt et animi enim ratione. Laudantium non accusamus nostrum. Rerum culpa voluptatem possimus voluptas consectetur minus. Dicta voluptate nobis eaque optio. Explicabo voluptates eos et voluptate incidunt recusandae. Excepturi dignissimos voluptas id eum quia et ratione. Quasi voluptatem commodi sint. Sapiente qui facilis recusandae vero vero et. Nam similique facere modi tenetur sint delectus ex assumenda. Error expedita veritatis magnam rem aut fugiat ut. Beatae dolores impedit officiis perspiciatis recusandae.<h5 class=\"headifhouse\">FAQs</h5> [faqs category_ids=\"1\" display_type=\"list\" expand_first_time=\"yes\" enable_lazy_loading=\"no\"][/faqs]','8747 Parker Center Suite 456\nNew Ignatius, MS 55945-8239','[\"properties\\/4.jpg\",\"properties\\/6.jpg\",\"properties\\/8.jpg\",\"properties\\/2.jpg\",\"properties\\/7.jpg\",\"properties\\/9.jpg\",\"properties\\/3.jpg\",\"properties\\/5.jpg\"]','[{\"name\":{\"key\":\"name\",\"value\":\"First Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"3\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"2\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}},{\"name\":{\"key\":\"name\",\"value\":\"Second Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"2\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"1\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}}]',5,8,5,94,430,428600.00,NULL,0,0,6,'month','renting',12,'Botble\\RealEstate\\Models\\Account','approved',NULL,'2026-02-03',0,1,'2025-10-20 17:21:19','2025-12-20 05:59:44','43.887991','-75.538624',NULL,6181,6,6,'JXAR4C',NULL),(46,'Summit View','rent','Ipsum inventore vel porro. Earum quis voluptatem soluta qui.','Earum dicta ex qui aut quae quos et. Et non aspernatur repellendus fugit in molestiae commodi. Et error ut velit eos minus saepe fuga est. Doloribus ut qui a quia repudiandae et maiores. Ullam porro sed inventore labore sed qui asperiores. Velit incidunt illum numquam amet ipsa praesentium ea quisquam. Ipsa facilis asperiores odit ratione aut magnam. Quia possimus molestias sapiente voluptatem consequuntur dolor est. Est id minima minima voluptatibus impedit expedita harum. Inventore autem est aperiam soluta. Ratione odit quia fugiat nihil occaecati aut. Veritatis itaque reprehenderit harum tenetur voluptatem ratione. Et expedita quia vel incidunt quaerat quibusdam doloremque dignissimos. Voluptate omnis dolorum velit laudantium.<h5 class=\"headifhouse\">FAQs</h5> [faqs category_ids=\"1\" display_type=\"list\" expand_first_time=\"yes\" enable_lazy_loading=\"no\"][/faqs]','84684 Hagenes Loop\nAmosmouth, DE 75807-6533','[\"properties\\/4.jpg\",\"properties\\/1.jpg\",\"properties\\/5.jpg\",\"properties\\/10.jpg\",\"properties\\/3.jpg\",\"properties\\/7.jpg\",\"properties\\/6.jpg\"]','[{\"name\":{\"key\":\"name\",\"value\":\"First Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"3\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"2\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}},{\"name\":{\"key\":\"name\",\"value\":\"Second Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"2\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"1\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}}]',3,2,5,30,440,147400.00,NULL,0,0,2,'month','renting',2,'Botble\\RealEstate\\Models\\Account','approved',NULL,'2026-02-03',0,1,'2025-10-20 17:21:19','2025-12-20 05:59:44','42.531202','-75.332867',NULL,9746,2,2,'ATUXCM',NULL),(47,'Elmwood Park','sale','Quod ex quo quo quos cum qui et. Saepe corrupti asperiores deleniti molestiae et suscipit. Ullam et maiores facilis eligendi sequi doloribus natus.','Asperiores omnis sit id asperiores sapiente. Nihil suscipit eum ut magni soluta numquam ut. Illum consequatur ea omnis dolore accusantium. Rerum et quisquam eius dolore assumenda quis quibusdam. Ut dolores repudiandae cum ullam quibusdam aut quo. Voluptate est possimus sapiente quia. Voluptate saepe nihil labore.<h5 class=\"headifhouse\">FAQs</h5> [faqs category_ids=\"1\" display_type=\"list\" expand_first_time=\"yes\" enable_lazy_loading=\"no\"][/faqs]','13607 Stoltenberg Summit Apt. 901\nFlavieview, ND 81029','[\"properties\\/9.jpg\",\"properties\\/12.jpg\",\"properties\\/11.jpg\",\"properties\\/8.jpg\",\"properties\\/1.jpg\",\"properties\\/7.jpg\"]','[{\"name\":{\"key\":\"name\",\"value\":\"First Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"3\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"2\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}},{\"name\":{\"key\":\"name\",\"value\":\"Second Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"2\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"1\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}}]',9,8,3,91,400,211300.00,NULL,1,0,6,'month','selling',10,'Botble\\RealEstate\\Models\\Account','approved',NULL,'2026-02-03',0,1,'2025-10-20 17:21:19','2025-12-20 05:59:44','42.55438','-74.886855',NULL,187,6,6,'Z6SLAG',NULL),(48,'Stonegate Homes','rent','Necessitatibus beatae rerum est asperiores occaecati eum. Facilis praesentium maxime quam asperiores alias. Quas recusandae reiciendis aliquam magnam id consequuntur nulla.','Impedit autem est placeat sint quia debitis ab ut. Esse cupiditate repellendus ut ad laudantium dolores distinctio. Occaecati exercitationem ipsa expedita exercitationem ut autem. Totam ipsum quas voluptatem suscipit qui. Sed accusamus et sed non. Nihil quia ipsum voluptatem suscipit facere ad quia. Ut non quia ducimus quo adipisci deleniti. Et enim dolorum natus et voluptates. Qui voluptatibus saepe dolore non. Temporibus architecto rerum nesciunt eos iusto et.<h5 class=\"headifhouse\">FAQs</h5> [faqs category_ids=\"1\" display_type=\"list\" expand_first_time=\"yes\" enable_lazy_loading=\"no\"][/faqs]','714 Legros Flats Suite 121\nTillmanbury, PA 28122','[\"properties\\/11.jpg\",\"properties\\/12.jpg\",\"properties\\/4.jpg\",\"properties\\/3.jpg\",\"properties\\/6.jpg\",\"properties\\/1.jpg\",\"properties\\/2.jpg\",\"properties\\/9.jpg\",\"properties\\/5.jpg\",\"properties\\/10.jpg\",\"properties\\/7.jpg\"]','[{\"name\":{\"key\":\"name\",\"value\":\"First Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"3\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"2\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}},{\"name\":{\"key\":\"name\",\"value\":\"Second Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"2\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"1\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}}]',12,3,9,84,730,278600.00,NULL,1,0,3,'month','renting',8,'Botble\\RealEstate\\Models\\Account','approved',NULL,'2026-02-03',0,1,'2025-10-20 17:21:19','2025-12-20 05:59:44','42.679751','-75.137845',NULL,1698,3,3,'LHSSVN',NULL),(49,'Rosewood Villas','sale','Reiciendis ut odio a temporibus et numquam corporis. Laboriosam qui sunt ut natus est eos. Dolorem omnis est veniam veritatis. Enim quo laudantium voluptatem assumenda.','Ullam non autem earum. Enim qui excepturi consectetur ea. Eum incidunt officiis quam ea. Autem quam veritatis expedita voluptas libero ut hic voluptatum. Qui eius ipsam magnam voluptas nulla laudantium nulla. Perferendis debitis placeat dolore qui nesciunt culpa architecto. Minima corrupti et vel id minima. Qui sequi qui nostrum tempore.<h5 class=\"headifhouse\">FAQs</h5> [faqs category_ids=\"1\" display_type=\"list\" expand_first_time=\"yes\" enable_lazy_loading=\"no\"][/faqs]','78246 Gulgowski Plains\nHahnview, MO 37658','[\"properties\\/11.jpg\",\"properties\\/10.jpg\",\"properties\\/9.jpg\",\"properties\\/3.jpg\",\"properties\\/6.jpg\",\"properties\\/4.jpg\",\"properties\\/1.jpg\",\"properties\\/8.jpg\"]','[{\"name\":{\"key\":\"name\",\"value\":\"First Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"3\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"2\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}},{\"name\":{\"key\":\"name\",\"value\":\"Second Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"2\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"1\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}}]',13,5,5,92,790,377700.00,NULL,0,0,2,'month','selling',12,'Botble\\RealEstate\\Models\\Account','approved',NULL,'2026-02-03',0,1,'2025-10-20 17:21:19','2025-12-20 05:59:44','43.525524','-74.856834',NULL,7926,2,2,'Y0CIAF',NULL),(50,'Prairie Meadows','rent','Animi et qui magnam odio possimus ut. Aut perspiciatis omnis aut et odit. Voluptatem soluta a omnis dolor perferendis quis dolore.','Veniam corrupti quam ut minima. Quidem dignissimos velit odit eos. Incidunt et error et nobis alias. Ullam qui sit itaque. Dolores quod est iste qui illo ipsum. Voluptatum rem quasi saepe aliquid iusto aut. Reiciendis corrupti corrupti earum qui ut dolor dolor. Magni odit animi quidem facilis voluptatem ratione autem. Optio et facere facere. Iste voluptatum facilis consequatur ipsa ipsam dolorem. Tempora ex quis voluptatem sunt quia velit. Nihil ducimus laboriosam eius perferendis id et pariatur. Est eum sint esse aspernatur neque. Et delectus velit et est pariatur distinctio.<h5 class=\"headifhouse\">FAQs</h5> [faqs category_ids=\"1\" display_type=\"list\" expand_first_time=\"yes\" enable_lazy_loading=\"no\"][/faqs]','7116 Kilback Rest\nGunnershire, MN 30863-2295','[\"properties\\/10.jpg\",\"properties\\/11.jpg\",\"properties\\/9.jpg\",\"properties\\/7.jpg\",\"properties\\/4.jpg\",\"properties\\/2.jpg\",\"properties\\/3.jpg\",\"properties\\/6.jpg\"]','[{\"name\":{\"key\":\"name\",\"value\":\"First Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"3\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"2\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}},{\"name\":{\"key\":\"name\",\"value\":\"Second Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"2\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"1\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}}]',18,4,6,16,1000,183100.00,NULL,0,0,6,'month','renting',6,'Botble\\RealEstate\\Models\\Account','approved',NULL,'2026-02-03',0,1,'2025-10-20 17:21:19','2025-12-20 05:59:44','43.820974','-75.721153',NULL,4534,6,6,'RKQZZ0',NULL),(51,'Hawthorne Heights','sale','Nemo deserunt labore qui aut esse laborum. Expedita temporibus voluptates incidunt placeat. Modi suscipit consequuntur accusantium voluptates aut doloribus. Distinctio est nulla cum ut laboriosam eligendi cupiditate vero.','Blanditiis iusto maiores praesentium esse eos deserunt. Rem delectus aut architecto ipsum rerum. Ea perspiciatis et velit qui. Repudiandae voluptatem sapiente blanditiis voluptate neque minima vel et. Adipisci quod doloribus et. Aut non fugiat ut et eius quis. Sequi enim exercitationem porro sint deserunt quia.<h5 class=\"headifhouse\">FAQs</h5> [faqs category_ids=\"1\" display_type=\"list\" expand_first_time=\"yes\" enable_lazy_loading=\"no\"][/faqs]','9014 Bayer Lodge Apt. 211\nMillerville, NH 58986-2794','[\"properties\\/6.jpg\",\"properties\\/11.jpg\",\"properties\\/4.jpg\",\"properties\\/3.jpg\",\"properties\\/9.jpg\"]','[{\"name\":{\"key\":\"name\",\"value\":\"First Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"3\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"2\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}},{\"name\":{\"key\":\"name\",\"value\":\"Second Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"2\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"1\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}}]',15,4,7,66,650,981000.00,NULL,0,0,2,'month','selling',6,'Botble\\RealEstate\\Models\\Account','approved',NULL,'2026-02-03',0,1,'2025-10-20 17:21:19','2025-12-20 05:59:44','43.367446','-76.166662',NULL,8895,2,2,'PPDBCJ',NULL),(52,'Sierra Vista','sale','Et ab doloribus ad fugiat tenetur fugiat deserunt. Quam iste animi dignissimos sit sint nostrum. Molestiae eos et qui molestiae blanditiis nesciunt. Reprehenderit iusto molestias culpa totam fugiat ratione facere. Est distinctio aut cupiditate aut ea enim.','Est ducimus aperiam debitis aliquam explicabo enim. Sint voluptatem eum et molestiae molestiae ipsum quia. Harum odit quo dicta laborum enim. Veniam quas repellendus at ducimus. Quo quibusdam doloribus quis sint cumque perspiciatis pariatur. Qui porro quibusdam consequatur ut. Rerum libero nihil qui facere. Vitae placeat ut natus consectetur aut ea. Repudiandae qui temporibus aut officiis ut. Et voluptate nihil et omnis enim. Ex quae exercitationem qui excepturi est aut. Voluptatem ducimus id voluptas eligendi eos aspernatur at iusto. Alias iste voluptatem deserunt molestias possimus.<h5 class=\"headifhouse\">FAQs</h5> [faqs category_ids=\"1\" display_type=\"list\" expand_first_time=\"yes\" enable_lazy_loading=\"no\"][/faqs]','7912 Schimmel Shores\nArnohaven, KY 16172','[\"properties\\/6.jpg\",\"properties\\/5.jpg\",\"properties\\/8.jpg\",\"properties\\/11.jpg\",\"properties\\/2.jpg\",\"properties\\/10.jpg\",\"properties\\/12.jpg\",\"properties\\/9.jpg\",\"properties\\/4.jpg\",\"properties\\/1.jpg\",\"properties\\/3.jpg\",\"properties\\/7.jpg\"]','[{\"name\":{\"key\":\"name\",\"value\":\"First Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"3\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"2\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}},{\"name\":{\"key\":\"name\",\"value\":\"Second Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"2\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"1\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}}]',18,9,8,61,520,984600.00,NULL,0,0,2,'month','selling',9,'Botble\\RealEstate\\Models\\Account','approved',NULL,'2026-02-03',0,1,'2025-10-20 17:21:19','2025-12-20 05:59:44','43.173979','-75.186885',NULL,871,2,2,'EUZYBT',NULL),(53,'Autumn Leaves','sale','Nihil itaque eius cumque autem maxime. Ut deleniti minus unde vitae tempore vel velit. Qui numquam sequi illo sed.','Exercitationem corrupti quisquam eum repellat dolores perspiciatis. Cupiditate nesciunt dolores accusantium qui asperiores voluptatem rerum. Error dolorum eligendi incidunt aut. Officia facere porro modi quia non vel. Perferendis assumenda ipsam quaerat id sapiente odit autem. Et et excepturi libero ea non illum blanditiis. Sapiente est ea quo blanditiis voluptatem quia. Ea harum est iste eos.<h5 class=\"headifhouse\">FAQs</h5> [faqs category_ids=\"1\" display_type=\"list\" expand_first_time=\"yes\" enable_lazy_loading=\"no\"][/faqs]','5368 Skiles Fork\nWest Gillian, FL 54006','[\"properties\\/2.jpg\",\"properties\\/5.jpg\",\"properties\\/4.jpg\",\"properties\\/9.jpg\",\"properties\\/8.jpg\",\"properties\\/10.jpg\",\"properties\\/1.jpg\",\"properties\\/11.jpg\",\"properties\\/7.jpg\"]','[{\"name\":{\"key\":\"name\",\"value\":\"First Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"3\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"2\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}},{\"name\":{\"key\":\"name\",\"value\":\"Second Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"2\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"1\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}}]',9,9,6,6,870,519000.00,NULL,1,0,4,'month','selling',1,'Botble\\RealEstate\\Models\\Account','approved',NULL,'2026-02-03',0,1,'2025-10-20 17:21:19','2025-12-20 05:59:44','43.013015','-75.782383',NULL,7668,4,4,'ISS9PY',NULL),(54,'Blue Sky Residences','rent','Est doloremque qui repellendus enim quo nostrum recusandae sunt. Corrupti nam eos id. Modi laborum sed est est aut ut. Aut suscipit ut optio aut quis repellat.','Aut officiis nulla dicta quidem quo. Dicta possimus beatae veniam ab. Ipsam asperiores delectus non molestiae harum. Vitae exercitationem quaerat autem fuga praesentium. Minima expedita occaecati repudiandae maiores. Tenetur consequatur sint aut autem esse. Ex nesciunt officiis ex et a molestias. Qui sequi non non dolorem aut eos quasi. Voluptates aspernatur quis esse tenetur aperiam sint dolores. Explicabo veritatis optio suscipit. Libero beatae atque aperiam sit quam minima est. Tempora sunt assumenda dicta provident qui quis.<h5 class=\"headifhouse\">FAQs</h5> [faqs category_ids=\"1\" display_type=\"list\" expand_first_time=\"yes\" enable_lazy_loading=\"no\"][/faqs]','31696 Maria Place Suite 227\nDaphnemouth, OH 63600','[\"properties\\/2.jpg\",\"properties\\/11.jpg\",\"properties\\/1.jpg\",\"properties\\/12.jpg\",\"properties\\/10.jpg\",\"properties\\/6.jpg\",\"properties\\/3.jpg\",\"properties\\/7.jpg\",\"properties\\/5.jpg\",\"properties\\/8.jpg\",\"properties\\/9.jpg\"]','[{\"name\":{\"key\":\"name\",\"value\":\"First Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"3\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"2\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}},{\"name\":{\"key\":\"name\",\"value\":\"Second Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"2\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"1\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}}]',9,2,5,32,920,90100.00,NULL,1,0,2,'month','renting',2,'Botble\\RealEstate\\Models\\Account','approved',NULL,'2026-02-03',0,1,'2025-10-20 17:21:19','2025-12-20 05:59:44','43.994642','-75.301558',NULL,5728,2,2,'J22XV1',NULL),(55,'Pebble Creek','sale','Velit excepturi atque nisi. Dolor atque voluptatum quia. Nulla architecto ratione cumque commodi recusandae perferendis. Soluta sed quos asperiores vitae voluptatibus. Qui aut et vel autem nam et.','Aliquam repudiandae quibusdam consequatur sit qui. Aut beatae tempora quis pariatur. Nihil excepturi nobis rerum commodi ab minima. Quia repellendus modi autem corporis laborum quaerat eos. Laborum accusantium assumenda error facilis enim. Quidem enim quam qui error reiciendis rerum omnis. Natus sunt velit qui pariatur minus sint. At numquam eveniet officiis fugit neque et delectus omnis. Magnam sunt consequatur autem aut. Unde placeat fuga unde facere praesentium est assumenda. Reprehenderit dolor consequatur rerum et sunt recusandae provident. Corporis consequatur iusto aut deleniti perspiciatis magnam.<h5 class=\"headifhouse\">FAQs</h5> [faqs category_ids=\"1\" display_type=\"list\" expand_first_time=\"yes\" enable_lazy_loading=\"no\"][/faqs]','471 Rippin Shoal\nSouth Curtisbury, OH 82120-9251','[\"properties\\/2.jpg\",\"properties\\/8.jpg\",\"properties\\/6.jpg\",\"properties\\/7.jpg\",\"properties\\/12.jpg\"]','[{\"name\":{\"key\":\"name\",\"value\":\"First Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"3\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"2\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}},{\"name\":{\"key\":\"name\",\"value\":\"Second Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"2\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"1\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}}]',15,3,7,56,50,598700.00,NULL,1,0,1,'month','selling',11,'Botble\\RealEstate\\Models\\Account','approved',NULL,'2026-02-03',0,1,'2025-10-20 17:21:19','2025-12-20 05:59:44','43.222591','-76.114514',NULL,5635,1,1,'DTKEX7',NULL),(56,'Magnolia Manor','rent','Et amet non quod commodi. Qui cum voluptas sit amet blanditiis.','Alias sit voluptates nam. In dolor nihil aperiam qui. Accusamus qui nemo ipsa labore odio. Soluta itaque non id dolores vel molestiae. Et soluta pariatur molestias et perferendis. Non minus maxime commodi itaque incidunt. Reprehenderit veritatis numquam debitis dolore nemo et quia.<h5 class=\"headifhouse\">FAQs</h5> [faqs category_ids=\"1\" display_type=\"list\" expand_first_time=\"yes\" enable_lazy_loading=\"no\"][/faqs]','595 Hintz Islands\nBauchburgh, KY 12111','[\"properties\\/1.jpg\",\"properties\\/8.jpg\",\"properties\\/11.jpg\",\"properties\\/6.jpg\",\"properties\\/9.jpg\",\"properties\\/4.jpg\",\"properties\\/3.jpg\",\"properties\\/2.jpg\",\"properties\\/12.jpg\",\"properties\\/10.jpg\"]','[{\"name\":{\"key\":\"name\",\"value\":\"First Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"3\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"2\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}},{\"name\":{\"key\":\"name\",\"value\":\"Second Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"2\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"1\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}}]',1,6,9,66,830,939100.00,NULL,1,0,5,'month','renting',7,'Botble\\RealEstate\\Models\\Account','approved',NULL,'2026-02-03',0,1,'2025-10-20 17:21:19','2025-12-20 05:59:44','42.604537','-76.297089',NULL,989,5,5,'JMWBTJ',NULL),(57,'Cherry Blossom Estates','sale','Cumque sequi repellat ex itaque. Soluta ab laudantium provident culpa qui optio eius. Ut ut modi necessitatibus quo.','Sit velit voluptatem quo rerum alias ullam blanditiis. Natus cumque ducimus occaecati occaecati optio saepe. Optio totam dolorum ad veniam. Et cumque id sunt hic. Aperiam reprehenderit molestiae eos sed at non et. Corrupti id et qui repudiandae qui hic. Omnis enim dicta iste omnis eligendi doloremque voluptas. Non magnam dignissimos dolorem repellat aliquam consectetur nostrum.<h5 class=\"headifhouse\">FAQs</h5> [faqs category_ids=\"1\" display_type=\"list\" expand_first_time=\"yes\" enable_lazy_loading=\"no\"][/faqs]','9390 Shaylee Plaza\nKesslerton, MD 09931','[\"properties\\/3.jpg\",\"properties\\/12.jpg\",\"properties\\/8.jpg\",\"properties\\/9.jpg\",\"properties\\/10.jpg\",\"properties\\/2.jpg\",\"properties\\/4.jpg\",\"properties\\/11.jpg\",\"properties\\/7.jpg\"]','[{\"name\":{\"key\":\"name\",\"value\":\"First Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"3\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"2\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}},{\"name\":{\"key\":\"name\",\"value\":\"Second Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"2\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"1\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}}]',1,8,6,64,90,774600.00,NULL,0,0,4,'month','selling',6,'Botble\\RealEstate\\Models\\Account','approved',NULL,'2026-02-03',0,1,'2025-10-20 17:21:19','2025-12-20 05:59:44','43.98321','-76.137978',NULL,8041,4,4,'VDLGKA',NULL),(58,'Windsor Park','sale','Cupiditate aut aliquam cupiditate accusantium occaecati. Commodi incidunt quidem fuga aut ea. Omnis doloremque earum adipisci aperiam fugit. Consequatur et non eius quia quas est qui. Tempora nemo aut excepturi reiciendis necessitatibus sunt.','Rerum est in consequatur cumque eligendi quasi. Voluptatem qui enim ut exercitationem sequi ut. Iusto illo reprehenderit ut laboriosam. Dolorem et architecto perspiciatis optio autem ea. Dolore magnam laudantium saepe quae repudiandae. Voluptatem omnis impedit illo pariatur officiis sequi esse et. Totam minus id nisi iusto ipsum voluptas. Fugiat iusto doloremque aut ex non et rerum. Mollitia vero necessitatibus perferendis sed sunt amet quas et. Aut quia esse praesentium et quibusdam et debitis delectus. Maxime voluptas atque molestias asperiores. Quam qui voluptatibus dolor id error. Ullam iure nobis voluptatem animi maxime praesentium omnis. Harum debitis quo occaecati ut rerum.<h5 class=\"headifhouse\">FAQs</h5> [faqs category_ids=\"1\" display_type=\"list\" expand_first_time=\"yes\" enable_lazy_loading=\"no\"][/faqs]','203 Kautzer Port Suite 098\nPort Lucianoborough, SD 50640-4742','[\"properties\\/11.jpg\",\"properties\\/8.jpg\",\"properties\\/12.jpg\",\"properties\\/3.jpg\",\"properties\\/6.jpg\",\"properties\\/1.jpg\",\"properties\\/5.jpg\"]','[{\"name\":{\"key\":\"name\",\"value\":\"First Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"3\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"2\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}},{\"name\":{\"key\":\"name\",\"value\":\"Second Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"2\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"1\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}}]',11,7,7,5,630,958100.00,NULL,0,0,1,'month','selling',1,'Botble\\RealEstate\\Models\\Account','approved',NULL,'2026-02-03',0,1,'2025-10-20 17:21:19','2025-12-20 05:59:44','43.07775','-74.791671',NULL,7239,1,1,'ISXCKU',NULL),(59,'Seaside Villas','rent','Nesciunt ipsum voluptates quidem laudantium ipsum iste illo. Non qui est soluta cum voluptatem quisquam quia. Mollitia qui earum qui recusandae reiciendis inventore. Impedit corporis aperiam qui perferendis similique.','Eos dolor ut voluptatum. Omnis non error libero deserunt placeat consequatur qui. Et excepturi ex omnis et accusamus mollitia laudantium. Pariatur doloribus fugit neque quis aut velit culpa voluptatibus. Ut est voluptatem quidem est sed ipsum impedit. Vel sed ab officia ea voluptate dolore. Omnis voluptatem provident ut. Fugiat est odio voluptatem id perferendis est atque. Voluptatibus dolore atque praesentium est nulla deserunt. Quos et tempore totam et.<h5 class=\"headifhouse\">FAQs</h5> [faqs category_ids=\"1\" display_type=\"list\" expand_first_time=\"yes\" enable_lazy_loading=\"no\"][/faqs]','912 Oren Pine Apt. 443\nNyasiaville, ME 50951-4796','[\"properties\\/3.jpg\",\"properties\\/5.jpg\",\"properties\\/12.jpg\",\"properties\\/7.jpg\",\"properties\\/11.jpg\",\"properties\\/9.jpg\",\"properties\\/2.jpg\",\"properties\\/1.jpg\",\"properties\\/4.jpg\",\"properties\\/8.jpg\",\"properties\\/6.jpg\",\"properties\\/10.jpg\"]','[{\"name\":{\"key\":\"name\",\"value\":\"First Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"3\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"2\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}},{\"name\":{\"key\":\"name\",\"value\":\"Second Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"2\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"1\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}}]',5,6,5,15,750,600600.00,NULL,1,0,6,'month','renting',11,'Botble\\RealEstate\\Models\\Account','approved',NULL,'2026-02-03',0,1,'2025-10-20 17:21:19','2025-12-20 05:59:44','42.889109','-76.0654',NULL,2068,6,6,'R4VROA',NULL),(60,'Mountain View Retreat','rent','Nobis nulla dolorem illum optio exercitationem velit sit saepe. Qui nobis doloribus quam modi labore hic. Nostrum perspiciatis alias commodi placeat perspiciatis aut non occaecati. Veniam dolore fugit mollitia voluptatem est quia.','Est quo voluptatem a dolores et. Suscipit quasi qui autem veniam quidem nobis. Mollitia est sint odit impedit voluptatem dolores quia. At deserunt deserunt est aut. Doloribus exercitationem iure repellat delectus. Dolor tenetur aspernatur corrupti provident et. Velit consectetur autem nihil est fugiat laboriosam. Ut consequatur saepe rerum numquam non. Aut aut numquam perferendis non provident. Non earum et nihil architecto repudiandae nesciunt est. Consequatur eligendi mollitia consectetur quas aut. Molestias repudiandae nostrum illo ad vel. Minus illum placeat sed culpa placeat ipsum. Id quae iusto labore sequi sed neque quas qui.<h5 class=\"headifhouse\">FAQs</h5> [faqs category_ids=\"1\" display_type=\"list\" expand_first_time=\"yes\" enable_lazy_loading=\"no\"][/faqs]','10759 Zulauf Manors\nMelynatown, OH 61146-3618','[\"properties\\/10.jpg\",\"properties\\/1.jpg\",\"properties\\/9.jpg\",\"properties\\/7.jpg\",\"properties\\/11.jpg\",\"properties\\/6.jpg\",\"properties\\/4.jpg\"]','[{\"name\":{\"key\":\"name\",\"value\":\"First Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"3\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"2\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}},{\"name\":{\"key\":\"name\",\"value\":\"Second Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"2\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"1\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}}]',17,4,9,76,110,462200.00,NULL,1,0,6,'month','renting',12,'Botble\\RealEstate\\Models\\Account','approved',NULL,'2026-02-03',0,1,'2025-10-20 17:21:19','2025-12-20 05:59:44','43.072192','-76.238892',NULL,8625,6,6,'GBPKKX',NULL),(61,'Amberwood Apartments','rent','Vitae illum libero reiciendis id et. Neque quasi nemo id iusto magnam. Ratione asperiores odit dolorem aut laborum tempora. Velit similique blanditiis sed vero.','Nesciunt mollitia sed sint natus exercitationem. Voluptates ipsam molestiae ex ratione est. Tempore tempora sed ea ut eaque qui id. Est libero fugiat quidem odit est asperiores esse quia. Molestias facere ea eum natus ipsam aut. Qui eaque dolore sit a. Sed nemo repellat debitis voluptatem. Necessitatibus et repudiandae est debitis. Iste architecto quas enim excepturi accusamus. Voluptatem velit quaerat esse in eum. Illo ut totam vitae in eaque libero inventore. Nobis corporis eos eum porro maiores eligendi id et. Qui voluptatum repellat aperiam voluptas voluptas atque nulla.<h5 class=\"headifhouse\">FAQs</h5> [faqs category_ids=\"1\" display_type=\"list\" expand_first_time=\"yes\" enable_lazy_loading=\"no\"][/faqs]','932 German Point Suite 959\nLorenton, PA 83448-8744','[\"properties\\/11.jpg\",\"properties\\/7.jpg\",\"properties\\/2.jpg\",\"properties\\/12.jpg\",\"properties\\/1.jpg\"]','[{\"name\":{\"key\":\"name\",\"value\":\"First Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"3\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"2\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}},{\"name\":{\"key\":\"name\",\"value\":\"Second Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"2\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"1\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}}]',12,6,2,15,940,262100.00,NULL,0,0,6,'month','renting',2,'Botble\\RealEstate\\Models\\Account','approved',NULL,'2026-02-03',0,1,'2025-10-20 17:21:19','2025-12-20 05:59:44','42.67757','-75.12208',NULL,6919,6,6,'QGY1FI',NULL);
/*!40000 ALTER TABLE `re_properties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_properties_translations`
--

DROP TABLE IF EXISTS `re_properties_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_properties_translations` (
  `lang_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `re_properties_id` bigint unsigned NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `location` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `floor_plans` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`re_properties_id`),
  KEY `idx_re_properties_trans_prop_lang` (`re_properties_id`,`lang_code`),
  KEY `idx_re_properties_trans_location` (`location`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_properties_translations`
--

LOCK TABLES `re_properties_translations` WRITE;
/*!40000 ALTER TABLE `re_properties_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `re_properties_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_property_categories`
--

DROP TABLE IF EXISTS `re_property_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_property_categories` (
  `property_id` bigint unsigned NOT NULL,
  `category_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`property_id`,`category_id`),
  KEY `idx_property_categories_property_id` (`property_id`),
  KEY `idx_property_categories_category_id` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_property_categories`
--

LOCK TABLES `re_property_categories` WRITE;
/*!40000 ALTER TABLE `re_property_categories` DISABLE KEYS */;
INSERT INTO `re_property_categories` VALUES (1,5),(2,3),(3,3),(4,2),(5,6),(6,1),(7,2),(8,6),(9,5),(10,4),(11,1),(12,1),(13,2),(14,1),(15,1),(16,6),(17,2),(18,3),(19,3),(20,6),(21,1),(22,3),(23,1),(24,3),(25,1),(26,6),(27,5),(28,1),(29,5),(30,6),(31,2),(32,5),(33,4),(34,1),(35,1),(36,3),(37,1),(38,3),(39,4),(40,2),(41,3),(42,6),(43,4),(44,4),(45,1),(46,5),(47,1),(48,2),(49,2),(50,1),(51,4),(52,6),(53,4),(54,1),(55,2),(56,1),(57,1),(58,6),(59,5),(60,2),(61,4);
/*!40000 ALTER TABLE `re_property_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_property_features`
--

DROP TABLE IF EXISTS `re_property_features`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_property_features` (
  `property_id` bigint unsigned NOT NULL,
  `feature_id` bigint unsigned NOT NULL,
  KEY `idx_property_features_property_id` (`property_id`),
  KEY `idx_property_features_feature_id` (`feature_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_property_features`
--

LOCK TABLES `re_property_features` WRITE;
/*!40000 ALTER TABLE `re_property_features` DISABLE KEYS */;
INSERT INTO `re_property_features` VALUES (1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(1,7),(1,8),(1,9),(1,10),(1,11),(1,12),(2,1),(2,2),(2,3),(2,4),(2,5),(2,6),(2,7),(2,8),(2,9),(2,10),(2,11),(2,12),(3,1),(3,2),(3,3),(3,4),(3,5),(3,6),(3,7),(3,8),(3,9),(3,10),(3,11),(3,12),(4,1),(4,2),(4,3),(4,4),(4,5),(4,6),(4,7),(4,8),(4,9),(4,10),(4,11),(4,12),(5,1),(5,2),(5,3),(5,4),(5,5),(5,6),(5,7),(5,8),(5,9),(5,10),(5,11),(5,12),(6,1),(6,2),(6,3),(6,4),(6,5),(6,6),(6,7),(6,8),(6,9),(6,10),(6,11),(6,12),(7,1),(7,2),(7,3),(7,4),(7,5),(7,6),(7,7),(7,8),(7,9),(7,10),(7,11),(7,12),(8,1),(8,2),(8,3),(8,4),(8,5),(8,6),(8,7),(8,8),(8,9),(8,10),(8,11),(8,12),(9,1),(9,2),(9,3),(9,4),(9,5),(9,6),(9,7),(9,8),(9,9),(9,10),(9,11),(9,12),(10,1),(10,2),(10,3),(10,4),(10,5),(10,6),(10,7),(10,8),(10,9),(10,10),(10,11),(10,12),(11,1),(11,2),(11,3),(11,4),(11,5),(11,6),(11,7),(11,8),(11,9),(11,10),(11,11),(11,12),(12,1),(12,2),(12,3),(12,4),(12,5),(12,6),(12,7),(12,8),(12,9),(12,10),(12,11),(12,12),(13,1),(13,2),(13,3),(13,4),(13,5),(13,6),(13,7),(13,8),(13,9),(13,10),(13,11),(13,12),(14,1),(14,2),(14,3),(14,4),(14,5),(14,6),(14,7),(14,8),(14,9),(14,10),(14,11),(14,12),(15,1),(15,2),(15,3),(15,4),(15,5),(15,6),(15,7),(15,8),(15,9),(15,10),(15,11),(15,12),(16,1),(16,2),(16,3),(16,4),(16,5),(16,6),(16,7),(16,8),(16,9),(16,10),(16,11),(16,12),(17,1),(17,2),(17,3),(17,4),(17,5),(17,6),(17,7),(17,8),(17,9),(17,10),(17,11),(17,12),(18,1),(18,2),(18,3),(18,4),(18,5),(18,6),(18,7),(18,8),(18,9),(18,10),(18,11),(18,12),(19,1),(19,2),(19,3),(19,4),(19,5),(19,6),(19,7),(19,8),(19,9),(19,10),(19,11),(19,12),(20,1),(20,2),(20,3),(20,4),(20,5),(20,6),(20,7),(20,8),(20,9),(20,10),(20,11),(20,12),(21,1),(21,2),(21,3),(21,4),(21,5),(21,6),(21,7),(21,8),(21,9),(21,10),(21,11),(21,12),(22,1),(22,2),(22,3),(22,4),(22,5),(22,6),(22,7),(22,8),(22,9),(22,10),(22,11),(22,12),(23,1),(23,2),(23,3),(23,4),(23,5),(23,6),(23,7),(23,8),(23,9),(23,10),(23,11),(23,12),(24,1),(24,2),(24,3),(24,4),(24,5),(24,6),(24,7),(24,8),(24,9),(24,10),(24,11),(24,12),(25,1),(25,2),(25,3),(25,4),(25,5),(25,6),(25,7),(25,8),(25,9),(25,10),(25,11),(25,12),(26,1),(26,2),(26,3),(26,4),(26,5),(26,6),(26,7),(26,8),(26,9),(26,10),(26,11),(26,12),(27,1),(27,2),(27,3),(27,4),(27,5),(27,6),(27,7),(27,8),(27,9),(27,10),(27,11),(27,12),(28,1),(28,2),(28,3),(28,4),(28,5),(28,6),(28,7),(28,8),(28,9),(28,10),(28,11),(28,12),(29,1),(29,2),(29,3),(29,4),(29,5),(29,6),(29,7),(29,8),(29,9),(29,10),(29,11),(29,12),(30,1),(30,2),(30,3),(30,4),(30,5),(30,6),(30,7),(30,8),(30,9),(30,10),(30,11),(30,12),(31,1),(31,2),(31,3),(31,4),(31,5),(31,6),(31,7),(31,8),(31,9),(31,10),(31,11),(31,12),(32,1),(32,2),(32,3),(32,4),(32,5),(32,6),(32,7),(32,8),(32,9),(32,10),(32,11),(32,12),(33,1),(33,2),(33,3),(33,4),(33,5),(33,6),(33,7),(33,8),(33,9),(33,10),(33,11),(33,12),(34,1),(34,2),(34,3),(34,4),(34,5),(34,6),(34,7),(34,8),(34,9),(34,10),(34,11),(34,12),(35,1),(35,2),(35,3),(35,4),(35,5),(35,6),(35,7),(35,8),(35,9),(35,10),(35,11),(35,12),(36,1),(36,2),(36,3),(36,4),(36,5),(36,6),(36,7),(36,8),(36,9),(36,10),(36,11),(36,12),(37,1),(37,2),(37,3),(37,4),(37,5),(37,6),(37,7),(37,8),(37,9),(37,10),(37,11),(37,12),(38,1),(38,2),(38,3),(38,4),(38,5),(38,6),(38,7),(38,8),(38,9),(38,10),(38,11),(38,12),(39,1),(39,2),(39,3),(39,4),(39,5),(39,6),(39,7),(39,8),(39,9),(39,10),(39,11),(39,12),(40,1),(40,2),(40,3),(40,4),(40,5),(40,6),(40,7),(40,8),(40,9),(40,10),(40,11),(40,12),(41,1),(41,2),(41,3),(41,4),(41,5),(41,6),(41,7),(41,8),(41,9),(41,10),(41,11),(41,12),(42,1),(42,2),(42,3),(42,4),(42,5),(42,6),(42,7),(42,8),(42,9),(42,10),(42,11),(42,12),(43,1),(43,2),(43,3),(43,4),(43,5),(43,6),(43,7),(43,8),(43,9),(43,10),(43,11),(43,12),(44,1),(44,2),(44,3),(44,4),(44,5),(44,6),(44,7),(44,8),(44,9),(44,10),(44,11),(44,12),(45,1),(45,2),(45,3),(45,4),(45,5),(45,6),(45,7),(45,8),(45,9),(45,10),(45,11),(45,12),(46,1),(46,2),(46,3),(46,4),(46,5),(46,6),(46,7),(46,8),(46,9),(46,10),(46,11),(46,12),(47,1),(47,2),(47,3),(47,4),(47,5),(47,6),(47,7),(47,8),(47,9),(47,10),(47,11),(47,12),(48,1),(48,2),(48,3),(48,4),(48,5),(48,6),(48,7),(48,8),(48,9),(48,10),(48,11),(48,12),(49,1),(49,2),(49,3),(49,4),(49,5),(49,6),(49,7),(49,8),(49,9),(49,10),(49,11),(49,12),(50,1),(50,2),(50,3),(50,4),(50,5),(50,6),(50,7),(50,8),(50,9),(50,10),(50,11),(50,12),(51,1),(51,2),(51,3),(51,4),(51,5),(51,6),(51,7),(51,8),(51,9),(51,10),(51,11),(51,12),(52,1),(52,2),(52,3),(52,4),(52,5),(52,6),(52,7),(52,8),(52,9),(52,10),(52,11),(52,12),(53,1),(53,2),(53,3),(53,4),(53,5),(53,6),(53,7),(53,8),(53,9),(53,10),(53,11),(53,12),(54,1),(54,2),(54,3),(54,4),(54,5),(54,6),(54,7),(54,8),(54,9),(54,10),(54,11),(54,12),(55,1),(55,2),(55,3),(55,4),(55,5),(55,6),(55,7),(55,8),(55,9),(55,10),(55,11),(55,12),(56,1),(56,2),(56,3),(56,4),(56,5),(56,6),(56,7),(56,8),(56,9),(56,10),(56,11),(56,12),(57,1),(57,2),(57,3),(57,4),(57,5),(57,6),(57,7),(57,8),(57,9),(57,10),(57,11),(57,12),(58,1),(58,2),(58,3),(58,4),(58,5),(58,6),(58,7),(58,8),(58,9),(58,10),(58,11),(58,12),(59,1),(59,2),(59,3),(59,4),(59,5),(59,6),(59,7),(59,8),(59,9),(59,10),(59,11),(59,12),(60,1),(60,2),(60,3),(60,4),(60,5),(60,6),(60,7),(60,8),(60,9),(60,10),(60,11),(60,12),(61,1),(61,2),(61,3),(61,4),(61,5),(61,6),(61,7),(61,8),(61,9),(61,10),(61,11),(61,12);
/*!40000 ALTER TABLE `re_property_features` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_reviews`
--

DROP TABLE IF EXISTS `re_reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_reviews` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `account_id` bigint unsigned NOT NULL,
  `reviewable_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `reviewable_id` bigint unsigned NOT NULL,
  `star` tinyint NOT NULL,
  `content` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'approved',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `reviews_unique` (`account_id`,`reviewable_id`,`reviewable_type`),
  KEY `re_reviews_reviewable_type_reviewable_id_index` (`reviewable_type`,`reviewable_id`),
  KEY `idx_reviews_reviewable_status` (`reviewable_type`,`reviewable_id`,`status`)
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_reviews`
--

LOCK TABLES `re_reviews` WRITE;
/*!40000 ALTER TABLE `re_reviews` DISABLE KEYS */;
INSERT INTO `re_reviews` VALUES (1,5,'Botble\\RealEstate\\Models\\Property',20,4,'The property photos were accurate and the space is even better in person.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(2,5,'Botble\\RealEstate\\Models\\Property',8,1,'The community amenities are fantastic - pool, gym, and clubhouse.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(3,7,'Botble\\RealEstate\\Models\\Project',14,2,'Generous closet space and built-in storage solutions.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(4,3,'Botble\\RealEstate\\Models\\Property',8,4,'The attention to detail in this property is impressive. Quality finishes throughout.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(5,2,'Botble\\RealEstate\\Models\\Project',6,1,'The attention to detail in this property is impressive. Quality finishes throughout.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(6,3,'Botble\\RealEstate\\Models\\Project',7,3,'The property has great resale potential. Smart investment.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(7,10,'Botble\\RealEstate\\Models\\Project',15,1,'Loved the open floor plan and high ceilings. Natural ventilation is excellent.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(8,3,'Botble\\RealEstate\\Models\\Project',12,5,'Exceptional customer service from the real estate team.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(9,2,'Botble\\RealEstate\\Models\\Project',9,4,'Quiet neighbors and a peaceful atmosphere. Perfect for working from home.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(10,3,'Botble\\RealEstate\\Models\\Property',59,4,'Perfect starter home for young couples. Affordable yet comfortable.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(12,12,'Botble\\RealEstate\\Models\\Property',54,2,'Great property with modern amenities. The kitchen is spacious and well-equipped.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(13,5,'Botble\\RealEstate\\Models\\Project',13,3,'Exceptional customer service from the real estate team.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(14,12,'Botble\\RealEstate\\Models\\Project',15,3,'Generous closet space and built-in storage solutions.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(15,10,'Botble\\RealEstate\\Models\\Property',43,3,'The property has character and charm while still offering modern conveniences.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(16,12,'Botble\\RealEstate\\Models\\Project',17,5,'The property photos were accurate and the space is even better in person.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(17,4,'Botble\\RealEstate\\Models\\Project',15,1,'The property photos were accurate and the space is even better in person.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(18,11,'Botble\\RealEstate\\Models\\Property',48,3,'The layout is practical and space-efficient.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(19,9,'Botble\\RealEstate\\Models\\Property',48,2,'Beautiful home with amazing natural light. The garden is well-maintained.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(20,10,'Botble\\RealEstate\\Models\\Project',9,2,'Central location means everything is just minutes away.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(21,2,'Botble\\RealEstate\\Models\\Property',25,5,'Quiet neighbors and a peaceful atmosphere. Perfect for working from home.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(22,7,'Botble\\RealEstate\\Models\\Property',32,3,'Prime location near downtown but surprisingly quiet. Best of both worlds.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(23,5,'Botble\\RealEstate\\Models\\Property',31,2,'Beautiful home with amazing natural light. The garden is well-maintained.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(24,9,'Botble\\RealEstate\\Models\\Property',52,5,'The attention to detail in this property is impressive. Quality finishes throughout.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(25,2,'Botble\\RealEstate\\Models\\Property',49,2,'The neighborhood is vibrant with lots of cafes and restaurants nearby.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(26,11,'Botble\\RealEstate\\Models\\Property',35,2,'Wonderful experience from viewing to move-in. The agent was professional.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(27,9,'Botble\\RealEstate\\Models\\Property',49,4,'Generous closet space and built-in storage solutions.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(28,1,'Botble\\RealEstate\\Models\\Project',12,4,'The neighborhood is vibrant with lots of cafes and restaurants nearby.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(29,8,'Botble\\RealEstate\\Models\\Project',10,2,'The community amenities are fantastic - pool, gym, and clubhouse.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(30,3,'Botble\\RealEstate\\Models\\Property',13,5,'Loved the open floor plan and high ceilings. Natural ventilation is excellent.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(31,4,'Botble\\RealEstate\\Models\\Project',16,4,'Family-friendly community with excellent schools nearby.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(32,3,'Botble\\RealEstate\\Models\\Property',18,5,'Central location means everything is just minutes away.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(33,10,'Botble\\RealEstate\\Models\\Property',52,4,'High-quality construction materials visible throughout.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(35,5,'Botble\\RealEstate\\Models\\Property',4,4,'Perfect starter home for young couples. Affordable yet comfortable.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(36,8,'Botble\\RealEstate\\Models\\Project',17,3,'Outstanding property management. Any issues were addressed promptly.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(37,8,'Botble\\RealEstate\\Models\\Property',30,2,'Well-insulated property keeps energy costs low.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(38,1,'Botble\\RealEstate\\Models\\Property',45,1,'Prime location near downtown but surprisingly quiet. Best of both worlds.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(39,1,'Botble\\RealEstate\\Models\\Property',36,3,'The neighborhood is vibrant with lots of cafes and restaurants nearby.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(40,3,'Botble\\RealEstate\\Models\\Property',40,4,'The neighborhood is vibrant with lots of cafes and restaurants nearby.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(41,8,'Botble\\RealEstate\\Models\\Property',25,2,'Well-insulated property keeps energy costs low.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(42,12,'Botble\\RealEstate\\Models\\Property',39,4,'The property is well-maintained and in a prime location. Close to schools and shopping.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(43,1,'Botble\\RealEstate\\Models\\Property',23,3,'Wonderful experience from viewing to move-in. The agent was professional.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(44,1,'Botble\\RealEstate\\Models\\Property',9,5,'The layout is practical and space-efficient.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(45,9,'Botble\\RealEstate\\Models\\Project',6,2,'Beautiful home with amazing natural light. The garden is well-maintained.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(46,6,'Botble\\RealEstate\\Models\\Property',36,5,'Wonderful experience from viewing to move-in. The agent was professional.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(47,12,'Botble\\RealEstate\\Models\\Property',43,3,'Great natural lighting throughout the day.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(48,6,'Botble\\RealEstate\\Models\\Property',5,1,'The attention to detail in this property is impressive. Quality finishes throughout.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(49,7,'Botble\\RealEstate\\Models\\Property',54,5,'Outstanding property management. Any issues were addressed promptly.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(50,10,'Botble\\RealEstate\\Models\\Project',4,4,'Excellent value for money. The property exceeded my expectations in terms of quality.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(51,7,'Botble\\RealEstate\\Models\\Property',59,1,'The layout is practical and space-efficient.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(53,12,'Botble\\RealEstate\\Models\\Project',9,4,'The property is well-maintained and in a prime location. Close to schools and shopping.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(54,5,'Botble\\RealEstate\\Models\\Property',27,5,'The property has great resale potential. Smart investment.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(55,5,'Botble\\RealEstate\\Models\\Property',54,1,'The property is well-maintained and in a prime location. Close to schools and shopping.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(56,1,'Botble\\RealEstate\\Models\\Property',61,4,'Outstanding property management. Any issues were addressed promptly.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(57,6,'Botble\\RealEstate\\Models\\Project',10,5,'Great natural lighting throughout the day.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(58,11,'Botble\\RealEstate\\Models\\Property',25,4,'Central location means everything is just minutes away.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(59,3,'Botble\\RealEstate\\Models\\Project',3,1,'Loved the open floor plan and high ceilings. Natural ventilation is excellent.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(60,7,'Botble\\RealEstate\\Models\\Project',8,3,'The layout is practical and space-efficient.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(61,3,'Botble\\RealEstate\\Models\\Property',6,3,'Spacious rooms and excellent storage space. Recently renovated and looks brand new.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(62,7,'Botble\\RealEstate\\Models\\Property',49,4,'Absolutely loved this property! The location is perfect and the neighborhood is very safe.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(63,1,'Botble\\RealEstate\\Models\\Property',3,4,'The neighborhood is vibrant with lots of cafes and restaurants nearby.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(64,4,'Botble\\RealEstate\\Models\\Project',7,5,'Love the outdoor space - perfect for gardening and entertaining.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(65,7,'Botble\\RealEstate\\Models\\Property',6,5,'Loved the open floor plan and high ceilings. Natural ventilation is excellent.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(66,7,'Botble\\RealEstate\\Models\\Property',17,3,'The property photos were accurate and the space is even better in person.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(67,2,'Botble\\RealEstate\\Models\\Project',14,1,'Generous closet space and built-in storage solutions.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(68,12,'Botble\\RealEstate\\Models\\Property',34,3,'Quiet neighbors and a peaceful atmosphere. Perfect for working from home.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(69,3,'Botble\\RealEstate\\Models\\Project',9,3,'The property has great resale potential. Smart investment.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(70,2,'Botble\\RealEstate\\Models\\Project',12,1,'The property photos were accurate and the space is even better in person.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(71,1,'Botble\\RealEstate\\Models\\Property',2,5,'The property is well-maintained and in a prime location. Close to schools and shopping.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(72,7,'Botble\\RealEstate\\Models\\Property',61,5,'Wonderful experience from viewing to move-in. The agent was professional.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(73,11,'Botble\\RealEstate\\Models\\Property',46,5,'Modern smart home features throughout. Energy-efficient appliances.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(74,4,'Botble\\RealEstate\\Models\\Project',17,2,'Family-friendly community with excellent schools nearby.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(75,12,'Botble\\RealEstate\\Models\\Project',14,5,'Spacious rooms and excellent storage space. Recently renovated and looks brand new.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(76,8,'Botble\\RealEstate\\Models\\Property',34,1,'Generous closet space and built-in storage solutions.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(77,2,'Botble\\RealEstate\\Models\\Property',39,3,'The community amenities are fantastic - pool, gym, and clubhouse.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(78,9,'Botble\\RealEstate\\Models\\Project',14,5,'Love the outdoor space - perfect for gardening and entertaining.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(79,2,'Botble\\RealEstate\\Models\\Property',22,5,'The attention to detail in this property is impressive. Quality finishes throughout.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(80,1,'Botble\\RealEstate\\Models\\Project',15,4,'The attention to detail in this property is impressive. Quality finishes throughout.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(81,11,'Botble\\RealEstate\\Models\\Project',16,4,'The community amenities are fantastic - pool, gym, and clubhouse.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(83,3,'Botble\\RealEstate\\Models\\Project',14,1,'Family-friendly community with excellent schools nearby.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(84,4,'Botble\\RealEstate\\Models\\Project',9,3,'Modern smart home features throughout. Energy-efficient appliances.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(86,10,'Botble\\RealEstate\\Models\\Property',25,2,'Stunning views from the balcony. The interior design is modern and tasteful.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(87,9,'Botble\\RealEstate\\Models\\Project',7,1,'High-quality construction materials visible throughout.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(88,8,'Botble\\RealEstate\\Models\\Property',43,5,'Loved the open floor plan and high ceilings. Natural ventilation is excellent.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(89,8,'Botble\\RealEstate\\Models\\Property',44,1,'The property is well-maintained and in a prime location. Close to schools and shopping.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(90,12,'Botble\\RealEstate\\Models\\Property',10,4,'Well-insulated property keeps energy costs low.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(91,2,'Botble\\RealEstate\\Models\\Property',56,3,'Family-friendly community with excellent schools nearby.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(92,9,'Botble\\RealEstate\\Models\\Property',14,4,'Stunning views from the balcony. The interior design is modern and tasteful.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(93,9,'Botble\\RealEstate\\Models\\Property',54,5,'Great investment property. Already seeing good returns on investment.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(95,12,'Botble\\RealEstate\\Models\\Property',3,5,'The community amenities are fantastic - pool, gym, and clubhouse.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(97,12,'Botble\\RealEstate\\Models\\Project',3,3,'The attention to detail in this property is impressive. Quality finishes throughout.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(98,8,'Botble\\RealEstate\\Models\\Project',3,2,'The property has great resale potential. Smart investment.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(99,1,'Botble\\RealEstate\\Models\\Project',4,2,'Spacious rooms and excellent storage space. Recently renovated and looks brand new.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(100,8,'Botble\\RealEstate\\Models\\Property',11,2,'Great property with modern amenities. The kitchen is spacious and well-equipped.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(101,6,'Botble\\RealEstate\\Models\\Project',15,1,'High-quality construction materials visible throughout.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(102,4,'Botble\\RealEstate\\Models\\Property',39,5,'The property photos were accurate and the space is even better in person.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(104,5,'Botble\\RealEstate\\Models\\Property',13,5,'Perfect starter home for young couples. Affordable yet comfortable.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(105,4,'Botble\\RealEstate\\Models\\Project',18,5,'The neighborhood is vibrant with lots of cafes and restaurants nearby.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(106,4,'Botble\\RealEstate\\Models\\Property',47,5,'Beautiful home with amazing natural light. The garden is well-maintained.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(107,2,'Botble\\RealEstate\\Models\\Project',18,4,'Wonderful experience from viewing to move-in. The agent was professional.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(108,3,'Botble\\RealEstate\\Models\\Project',6,4,'Great natural lighting throughout the day.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(110,5,'Botble\\RealEstate\\Models\\Project',4,2,'The property is well-maintained and in a prime location. Close to schools and shopping.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(111,7,'Botble\\RealEstate\\Models\\Project',7,5,'Great property with modern amenities. The kitchen is spacious and well-equipped.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(112,10,'Botble\\RealEstate\\Models\\Project',12,5,'Great property with modern amenities. The kitchen is spacious and well-equipped.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(113,10,'Botble\\RealEstate\\Models\\Project',10,3,'Exceptional customer service from the real estate team.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(114,9,'Botble\\RealEstate\\Models\\Property',17,5,'Excellent value for money. The property exceeded my expectations in terms of quality.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(115,5,'Botble\\RealEstate\\Models\\Property',2,5,'Wonderful experience from viewing to move-in. The agent was professional.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(116,6,'Botble\\RealEstate\\Models\\Project',8,2,'Central location means everything is just minutes away.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(117,9,'Botble\\RealEstate\\Models\\Property',23,4,'Love the outdoor space - perfect for gardening and entertaining.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(119,2,'Botble\\RealEstate\\Models\\Project',7,2,'The property is well-maintained and in a prime location. Close to schools and shopping.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(121,11,'Botble\\RealEstate\\Models\\Project',11,4,'The community amenities are fantastic - pool, gym, and clubhouse.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(122,6,'Botble\\RealEstate\\Models\\Property',38,3,'Family-friendly community with excellent schools nearby.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(123,12,'Botble\\RealEstate\\Models\\Property',14,4,'Absolutely loved this property! The location is perfect and the neighborhood is very safe.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(124,7,'Botble\\RealEstate\\Models\\Property',8,1,'The property has character and charm while still offering modern conveniences.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(125,9,'Botble\\RealEstate\\Models\\Property',22,3,'The property photos were accurate and the space is even better in person.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(126,7,'Botble\\RealEstate\\Models\\Project',15,3,'Spacious rooms and excellent storage space. Recently renovated and looks brand new.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(127,8,'Botble\\RealEstate\\Models\\Project',13,2,'Great investment property. Already seeing good returns on investment.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(128,7,'Botble\\RealEstate\\Models\\Property',50,1,'The community amenities are fantastic - pool, gym, and clubhouse.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(129,2,'Botble\\RealEstate\\Models\\Project',1,4,'Stunning views from the balcony. The interior design is modern and tasteful.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(130,4,'Botble\\RealEstate\\Models\\Project',10,3,'Wonderful experience from viewing to move-in. The agent was professional.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(131,5,'Botble\\RealEstate\\Models\\Project',18,3,'High-quality construction materials visible throughout.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(132,9,'Botble\\RealEstate\\Models\\Project',9,1,'Quiet neighbors and a peaceful atmosphere. Perfect for working from home.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(133,3,'Botble\\RealEstate\\Models\\Property',45,1,'Perfect starter home for young couples. Affordable yet comfortable.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(134,1,'Botble\\RealEstate\\Models\\Property',42,4,'The property has character and charm while still offering modern conveniences.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(135,10,'Botble\\RealEstate\\Models\\Property',57,5,'Spacious rooms and excellent storage space. Recently renovated and looks brand new.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(136,9,'Botble\\RealEstate\\Models\\Project',13,3,'The neighborhood is vibrant with lots of cafes and restaurants nearby.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(137,7,'Botble\\RealEstate\\Models\\Project',4,3,'Generous closet space and built-in storage solutions.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(138,6,'Botble\\RealEstate\\Models\\Project',4,3,'The property is well-maintained and in a prime location. Close to schools and shopping.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(139,3,'Botble\\RealEstate\\Models\\Property',44,4,'The property is well-maintained and in a prime location. Close to schools and shopping.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(140,7,'Botble\\RealEstate\\Models\\Property',25,4,'High-quality construction materials visible throughout.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(141,4,'Botble\\RealEstate\\Models\\Property',40,4,'Modern smart home features throughout. Energy-efficient appliances.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(142,8,'Botble\\RealEstate\\Models\\Property',5,4,'The attention to detail in this property is impressive. Quality finishes throughout.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(143,5,'Botble\\RealEstate\\Models\\Property',30,1,'Quiet neighbors and a peaceful atmosphere. Perfect for working from home.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(144,5,'Botble\\RealEstate\\Models\\Property',6,1,'Central location means everything is just minutes away.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(146,11,'Botble\\RealEstate\\Models\\Project',14,4,'The property has great resale potential. Smart investment.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(147,11,'Botble\\RealEstate\\Models\\Project',5,3,'The layout is practical and space-efficient.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(148,9,'Botble\\RealEstate\\Models\\Property',50,1,'The property photos were accurate and the space is even better in person.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(150,4,'Botble\\RealEstate\\Models\\Project',11,5,'Perfect starter home for young couples. Affordable yet comfortable.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(152,4,'Botble\\RealEstate\\Models\\Property',46,5,'Great property with modern amenities. The kitchen is spacious and well-equipped.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(153,3,'Botble\\RealEstate\\Models\\Property',7,4,'Prime location near downtown but surprisingly quiet. Best of both worlds.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(154,12,'Botble\\RealEstate\\Models\\Property',13,5,'Great property with modern amenities. The kitchen is spacious and well-equipped.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(155,9,'Botble\\RealEstate\\Models\\Property',8,5,'Outstanding property management. Any issues were addressed promptly.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(156,2,'Botble\\RealEstate\\Models\\Project',11,4,'Quiet neighbors and a peaceful atmosphere. Perfect for working from home.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(157,8,'Botble\\RealEstate\\Models\\Project',7,2,'Outstanding property management. Any issues were addressed promptly.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(158,7,'Botble\\RealEstate\\Models\\Property',43,4,'Modern smart home features throughout. Energy-efficient appliances.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(159,11,'Botble\\RealEstate\\Models\\Project',4,4,'The property is well-maintained and in a prime location. Close to schools and shopping.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(161,11,'Botble\\RealEstate\\Models\\Project',12,5,'Perfect starter home for young couples. Affordable yet comfortable.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(162,9,'Botble\\RealEstate\\Models\\Property',33,5,'Prime location near downtown but surprisingly quiet. Best of both worlds.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(165,11,'Botble\\RealEstate\\Models\\Property',52,4,'Generous closet space and built-in storage solutions.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(167,6,'Botble\\RealEstate\\Models\\Project',16,1,'Great natural lighting throughout the day.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(168,5,'Botble\\RealEstate\\Models\\Property',9,1,'The attention to detail in this property is impressive. Quality finishes throughout.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(171,7,'Botble\\RealEstate\\Models\\Project',3,5,'Wonderful experience from viewing to move-in. The agent was professional.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(173,2,'Botble\\RealEstate\\Models\\Property',3,5,'Excellent value for money. The property exceeded my expectations in terms of quality.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(174,3,'Botble\\RealEstate\\Models\\Project',4,1,'High-quality construction materials visible throughout.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(175,7,'Botble\\RealEstate\\Models\\Property',39,1,'The community amenities are fantastic - pool, gym, and clubhouse.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(176,1,'Botble\\RealEstate\\Models\\Project',16,5,'The property photos were accurate and the space is even better in person.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(177,12,'Botble\\RealEstate\\Models\\Project',6,5,'Great natural lighting throughout the day.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(178,1,'Botble\\RealEstate\\Models\\Property',20,4,'Central location means everything is just minutes away.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(179,10,'Botble\\RealEstate\\Models\\Property',58,4,'Family-friendly community with excellent schools nearby.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(181,4,'Botble\\RealEstate\\Models\\Property',10,3,'Stunning views from the balcony. The interior design is modern and tasteful.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(182,8,'Botble\\RealEstate\\Models\\Property',22,2,'The property has great resale potential. Smart investment.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(184,11,'Botble\\RealEstate\\Models\\Property',2,3,'Central location means everything is just minutes away.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(187,6,'Botble\\RealEstate\\Models\\Project',11,5,'Wonderful experience from viewing to move-in. The agent was professional.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(188,3,'Botble\\RealEstate\\Models\\Property',20,5,'Modern smart home features throughout. Energy-efficient appliances.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(189,9,'Botble\\RealEstate\\Models\\Property',57,1,'Wonderful experience from viewing to move-in. The agent was professional.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(191,8,'Botble\\RealEstate\\Models\\Project',1,3,'Great natural lighting throughout the day.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(192,4,'Botble\\RealEstate\\Models\\Project',12,1,'Great property with modern amenities. The kitchen is spacious and well-equipped.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(193,9,'Botble\\RealEstate\\Models\\Project',1,5,'The community amenities are fantastic - pool, gym, and clubhouse.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(194,9,'Botble\\RealEstate\\Models\\Project',18,4,'Wonderful experience from viewing to move-in. The agent was professional.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(195,12,'Botble\\RealEstate\\Models\\Project',12,3,'Central location means everything is just minutes away.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(197,5,'Botble\\RealEstate\\Models\\Property',21,5,'Spacious rooms and excellent storage space. Recently renovated and looks brand new.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(198,4,'Botble\\RealEstate\\Models\\Property',45,4,'The property has great resale potential. Smart investment.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44'),(200,10,'Botble\\RealEstate\\Models\\Project',17,2,'Great property with modern amenities. The kitchen is spacious and well-equipped.','approved','2025-12-20 05:59:44','2025-12-20 05:59:44');
/*!40000 ALTER TABLE `re_reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `revisions`
--

DROP TABLE IF EXISTS `revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `revisions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `revisionable_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `revisionable_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `key` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `old_value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `new_value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `revisions_revisionable_id_revisionable_type_index` (`revisionable_id`,`revisionable_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `revisions`
--

LOCK TABLES `revisions` WRITE;
/*!40000 ALTER TABLE `revisions` DISABLE KEYS */;
/*!40000 ALTER TABLE `revisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_users`
--

DROP TABLE IF EXISTS `role_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_users` (
  `user_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `role_users_user_id_index` (`user_id`),
  KEY `role_users_role_id_index` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_users`
--

LOCK TABLES `role_users` WRITE;
/*!40000 ALTER TABLE `role_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `role_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `permissions` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `description` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `created_by` bigint unsigned NOT NULL,
  `updated_by` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_slug_unique` (`slug`),
  KEY `roles_created_by_index` (`created_by`),
  KEY `roles_updated_by_index` (`updated_by`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'admin','Admin','{\"users.index\":true,\"users.create\":true,\"users.edit\":true,\"users.destroy\":true,\"roles.index\":true,\"roles.create\":true,\"roles.edit\":true,\"roles.destroy\":true,\"core.system\":true,\"core.cms\":true,\"core.manage.license\":true,\"systems.cronjob\":true,\"core.tools\":true,\"tools.data-synchronize\":true,\"media.index\":true,\"files.index\":true,\"files.create\":true,\"files.edit\":true,\"files.trash\":true,\"files.destroy\":true,\"folders.index\":true,\"folders.create\":true,\"folders.edit\":true,\"folders.trash\":true,\"folders.destroy\":true,\"settings.index\":true,\"settings.common\":true,\"settings.options\":true,\"settings.email\":true,\"settings.media\":true,\"settings.admin-appearance\":true,\"settings.cache\":true,\"settings.datatables\":true,\"settings.email.rules\":true,\"settings.phone-number\":true,\"settings.others\":true,\"menus.index\":true,\"menus.create\":true,\"menus.edit\":true,\"menus.destroy\":true,\"optimize.settings\":true,\"pages.index\":true,\"pages.create\":true,\"pages.edit\":true,\"pages.destroy\":true,\"plugins.index\":true,\"plugins.edit\":true,\"plugins.remove\":true,\"plugins.marketplace\":true,\"sitemap.settings\":true,\"core.appearance\":true,\"theme.index\":true,\"theme.activate\":true,\"theme.remove\":true,\"theme.options\":true,\"theme.custom-css\":true,\"theme.custom-js\":true,\"theme.custom-html\":true,\"theme.robots-txt\":true,\"settings.website-tracking\":true,\"widgets.index\":true,\"ads.index\":true,\"ads.create\":true,\"ads.edit\":true,\"ads.destroy\":true,\"ads.settings\":true,\"analytics.general\":true,\"analytics.page\":true,\"analytics.browser\":true,\"analytics.referrer\":true,\"analytics.settings\":true,\"announcements.index\":true,\"announcements.create\":true,\"announcements.edit\":true,\"announcements.destroy\":true,\"announcements.settings\":true,\"audit-log.index\":true,\"audit-log.destroy\":true,\"backups.index\":true,\"backups.create\":true,\"backups.restore\":true,\"backups.destroy\":true,\"plugins.blog\":true,\"posts.index\":true,\"posts.create\":true,\"posts.edit\":true,\"posts.destroy\":true,\"categories.index\":true,\"categories.create\":true,\"categories.edit\":true,\"categories.destroy\":true,\"tags.index\":true,\"blog.reports\":true,\"tags.create\":true,\"tags.edit\":true,\"tags.destroy\":true,\"blog.settings\":true,\"posts.export\":true,\"posts.import\":true,\"captcha.settings\":true,\"career.index\":true,\"career.create\":true,\"career.edit\":true,\"career.destroy\":true,\"contacts.index\":true,\"contacts.edit\":true,\"contacts.destroy\":true,\"contact.custom-fields\":true,\"contact.settings\":true,\"plugin.faq\":true,\"faq.index\":true,\"faq.create\":true,\"faq.edit\":true,\"faq.destroy\":true,\"faq_category.index\":true,\"faq_category.create\":true,\"faq_category.edit\":true,\"faq_category.destroy\":true,\"faqs.settings\":true,\"languages.index\":true,\"languages.create\":true,\"languages.edit\":true,\"languages.destroy\":true,\"translations.import\":true,\"translations.export\":true,\"property-translations.import\":true,\"property-translations.export\":true,\"plugin.location\":true,\"country.index\":true,\"country.create\":true,\"country.edit\":true,\"country.destroy\":true,\"state.index\":true,\"state.create\":true,\"state.edit\":true,\"state.destroy\":true,\"city.index\":true,\"city.create\":true,\"city.edit\":true,\"city.destroy\":true,\"newsletter.index\":true,\"newsletter.destroy\":true,\"newsletter.settings\":true,\"payment.index\":true,\"payments.settings\":true,\"payment.destroy\":true,\"payments.logs\":true,\"payments.logs.show\":true,\"payments.logs.destroy\":true,\"plugins.real-estate\":true,\"real-estate.settings\":true,\"property.index\":true,\"property.create\":true,\"property.edit\":true,\"property.destroy\":true,\"project.index\":true,\"project.create\":true,\"project.edit\":true,\"project.destroy\":true,\"property_feature.index\":true,\"property_feature.create\":true,\"property_feature.edit\":true,\"property_feature.destroy\":true,\"investor.index\":true,\"investor.create\":true,\"investor.edit\":true,\"investor.destroy\":true,\"review.index\":true,\"review.create\":true,\"review.edit\":true,\"review.destroy\":true,\"consult.index\":true,\"consult.edit\":true,\"consult.destroy\":true,\"property_category.index\":true,\"property_category.create\":true,\"property_category.edit\":true,\"property_category.destroy\":true,\"facility.index\":true,\"facility.create\":true,\"facility.edit\":true,\"facility.destroy\":true,\"account.index\":true,\"account.create\":true,\"account.edit\":true,\"account.destroy\":true,\"unverified-accounts.index\":true,\"package.index\":true,\"package.create\":true,\"package.edit\":true,\"package.destroy\":true,\"consults.index\":true,\"consults.edit\":true,\"consults.destroy\":true,\"real-estate.custom-fields.index\":true,\"real-estate.custom-fields.create\":true,\"real-estate.custom-fields.edit\":true,\"real-estate.custom-fields.destroy\":true,\"invoice.index\":true,\"invoice.edit\":true,\"invoice.destroy\":true,\"invoice.template\":true,\"import-properties.index\":true,\"coupons.index\":true,\"coupons.destroy\":true,\"real-estate.settings.general\":true,\"real-estate.settings.currencies\":true,\"real-estate.settings.accounts\":true,\"real-estate.settings.invoices\":true,\"real-estate.settings.invoice-template\":true,\"reports.index\":true,\"property.export\":true,\"property.import\":true,\"project.export\":true,\"project.import\":true,\"social-login.settings\":true,\"plugins.translation\":true,\"translations.locales\":true,\"translations.theme-translations\":true,\"translations.index\":true,\"theme-translations.export\":true,\"other-translations.export\":true,\"theme-translations.import\":true,\"other-translations.import\":true,\"api.settings\":true,\"api.sanctum-token.index\":true,\"api.sanctum-token.create\":true,\"api.sanctum-token.destroy\":true}','Admin users role',1,1,1,'2025-12-20 05:59:31','2025-12-20 05:59:31');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=899 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (1,'media_random_hash','32f33dc985115ae868de2c7959d3d37d',NULL,'2025-12-20 05:59:44'),(2,'api_enabled','0',NULL,'2025-10-20 17:21:26'),(3,'activated_plugins','[\"language\",\"language-advanced\",\"ads\",\"analytics\",\"announcement\",\"audit-log\",\"backup\",\"blog\",\"captcha\",\"career\",\"contact\",\"cookie-consent\",\"faq\",\"fob-mortgage-calculator\",\"location\",\"newsletter\",\"payment\",\"paypal\",\"paystack\",\"razorpay\",\"real-estate\",\"rss-feed\",\"social-login\",\"sslcommerz\",\"stripe\",\"translation\"]',NULL,'2025-12-20 05:59:44'),(4,'analytics_dashboard_widgets','0','2025-10-20 17:21:07','2025-10-20 17:21:07'),(5,'enable_recaptcha_botble_contact_forms_fronts_contact_form','1','2025-10-20 17:21:08','2025-10-20 17:21:08'),(6,'enable_recaptcha_botble_newsletter_forms_fronts_newsletter_form','1','2025-10-20 17:21:08','2025-10-20 17:21:08'),(7,'payment_cod_fee_type','fixed',NULL,'2025-12-20 05:59:44'),(8,'payment_bank_transfer_fee_type','fixed',NULL,'2025-12-20 05:59:44'),(9,'real_estate_mandatory_fields_at_consult_form','[\"email\"]',NULL,'2025-12-20 05:59:44'),(10,'theme','flex-home',NULL,'2025-12-20 05:59:44'),(11,'show_admin_bar','1',NULL,'2025-12-20 05:59:44'),(12,'language_hide_default','1',NULL,'2025-12-20 05:59:44'),(13,'language_switcher_display','dropdown',NULL,'2025-12-20 05:59:44'),(14,'language_display','all',NULL,'2025-12-20 05:59:44'),(15,'language_hide_languages','[]',NULL,'2025-12-20 05:59:44'),(23,'real_estate_display_views_count_in_detail_page','1',NULL,'2025-10-20 17:21:26'),(24,'theme-homzen-site_title','Homzen',NULL,'2025-10-20 17:21:26'),(25,'theme-homzen-seo_description','Find your favorite homes at Homzen',NULL,'2025-10-20 17:21:26'),(26,'theme-homzen-copyright','©%Y Homzen is Proudly Powered by Botble Team.',NULL,'2025-10-20 17:21:26'),(27,'theme-homzen-favicon','general/favicon.png',NULL,'2025-10-20 17:21:26'),(28,'theme-homzen-logo','general/logo.png',NULL,'2025-10-20 17:21:26'),(29,'theme-homzen-logo_light','general/logo-light.png',NULL,'2025-10-20 17:21:26'),(30,'theme-homzen-preloader_enabled','yes',NULL,'2025-10-20 17:21:26'),(31,'theme-homzen-preloader_version','v2',NULL,'2025-10-20 17:21:26'),(32,'theme-homzen-social_links','[[{\"key\":\"name\",\"value\":\"Facebook\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-facebook\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.facebook.com\"}],[{\"key\":\"name\",\"value\":\"X (Twitter)\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-x\"},{\"key\":\"url\",\"value\":\"https:\\/\\/x.com\"}],[{\"key\":\"name\",\"value\":\"YouTube\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-youtube\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.youtube.com\"}],[{\"key\":\"name\",\"value\":\"Instagram\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-linkedin\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.linkedin.com\"}]]',NULL,'2025-10-20 17:21:26'),(33,'theme-homzen-social_sharing','[[{\"key\":\"social\",\"value\":\"facebook\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-facebook\"}],[{\"key\":\"social\",\"value\":\"x\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-x\"}],[{\"key\":\"social\",\"value\":\"pinterest\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-pinterest\"}],[{\"key\":\"social\",\"value\":\"linkedin\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-linkedin\"}],[{\"key\":\"social\",\"value\":\"whatsapp\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-whatsapp\"}],[{\"key\":\"social\",\"value\":\"email\"},{\"key\":\"icon\",\"value\":\"ti ti-mail\"}]]',NULL,'2025-10-20 17:21:26'),(34,'theme-homzen-primary_color','#db1d23',NULL,'2025-10-20 17:21:26'),(35,'theme-homzen-hover_color','#cd380f',NULL,'2025-10-20 17:21:26'),(36,'theme-homzen-footer_background_color','#161e2d',NULL,'2025-10-20 17:21:26'),(37,'theme-homzen-footer_background_image','general/banner-footer.png',NULL,'2025-10-20 17:21:26'),(38,'theme-homzen-use_modal_for_authentication','1',NULL,'2025-10-20 17:21:26'),(39,'theme-homzen-homepage_id','1',NULL,'2025-10-20 17:21:26'),(40,'theme-homzen-blog_page_id','6',NULL,'2025-10-20 17:21:26'),(41,'theme-homzen-hotline','0123 456 789',NULL,'2025-10-20 17:21:26'),(42,'theme-homzen-email','contact@botble.com',NULL,'2025-10-20 17:21:26'),(43,'theme-homzen-breadcrumb_background_color','#f7f7f7',NULL,'2025-10-20 17:21:26'),(44,'theme-homzen-breadcrumb_text_color','#161e2d',NULL,'2025-10-20 17:21:26'),(45,'theme-homzen-lazy_load_images','1',NULL,'2025-10-20 17:21:26'),(46,'theme-homzen-lazy_load_placeholder_image','general/placeholder.png',NULL,'2025-10-20 17:21:26'),(47,'theme-homzen-newsletter_popup_enable','1',NULL,'2025-10-20 17:21:26'),(48,'theme-homzen-newsletter_popup_image','general/newsletter-image.jpg',NULL,'2025-10-20 17:21:26'),(49,'theme-homzen-newsletter_popup_title','Let’s join our newsletter!',NULL,'2025-10-20 17:21:26'),(50,'theme-homzen-newsletter_popup_subtitle','Weekly Updates',NULL,'2025-10-20 17:21:26'),(51,'theme-homzen-newsletter_popup_description','Do not worry we don’t spam!',NULL,'2025-10-20 17:21:26'),(52,'theme-homzen-properties_list_page_id','14',NULL,'2025-10-20 17:21:26'),(53,'theme-homzen-projects_list_page_id','15',NULL,'2025-10-20 17:21:26'),(855,'admin_favicon','logo/favicon.png',NULL,'2025-12-20 05:59:44'),(856,'admin_logo','logo/logo-white.png',NULL,'2025-12-20 05:59:44'),(857,'permalink-botble-blog-models-post','news',NULL,'2025-12-20 05:59:44'),(858,'permalink-botble-blog-models-category','news',NULL,'2025-12-20 05:59:44'),(859,'payment_cod_status','1',NULL,'2025-12-20 05:59:44'),(860,'payment_cod_description','Please pay money directly to the postman, if you choose cash on delivery method (COD).',NULL,'2025-12-20 05:59:44'),(861,'payment_bank_transfer_status','1',NULL,'2025-12-20 05:59:44'),(862,'payment_bank_transfer_description','Please send money to our bank account: ACB - 69270 213 19.',NULL,'2025-12-20 05:59:44'),(863,'payment_stripe_payment_type','stripe_checkout',NULL,'2025-12-20 05:59:44'),(864,'theme-flex-home-social_links','[[{\"key\":\"social-name\",\"value\":\"Facebook\"},{\"key\":\"social-icon\",\"value\":\"fab fa-facebook\"},{\"key\":\"social-url\",\"value\":\"https:\\/\\/facebook.com\"}],[{\"key\":\"social-name\",\"value\":\"Twitter\"},{\"key\":\"social-icon\",\"value\":\"fab fa-twitter\"},{\"key\":\"social-url\",\"value\":\"https:\\/\\/twitter.com\"}],[{\"key\":\"social-name\",\"value\":\"Youtube\"},{\"key\":\"social-icon\",\"value\":\"fab fa-youtube\"},{\"key\":\"social-url\",\"value\":\"https:\\/\\/youtube.com\"}]]',NULL,'2025-12-20 05:59:44'),(865,'theme-flex-home-site_title','Flex Home',NULL,'2025-12-20 05:59:44'),(866,'theme-flex-home-seo_description','Find your favorite homes at Flex Home',NULL,'2025-12-20 05:59:44'),(867,'theme-flex-home-copyright','©%Y Flex Home is Proudly Powered by Botble Team.',NULL,'2025-12-20 05:59:44'),(868,'theme-flex-home-favicon','logo/favicon.png',NULL,'2025-12-20 05:59:44'),(869,'theme-flex-home-logo','logo/logo.png',NULL,'2025-12-20 05:59:44'),(870,'theme-flex-home-cookie_consent_message','Your experience on this site will be improved by allowing cookies ',NULL,'2025-12-20 05:59:44'),(871,'theme-flex-home-cookie_consent_learn_more_url','/cookie-policy',NULL,'2025-12-20 05:59:44'),(872,'theme-flex-home-cookie_consent_learn_more_text','Cookie Policy',NULL,'2025-12-20 05:59:44'),(873,'theme-flex-home-homepage_id','1',NULL,'2025-12-20 05:59:44'),(874,'theme-flex-home-blog_page_id','2',NULL,'2025-12-20 05:59:44'),(875,'theme-flex-home-properties_list_page_id','7',NULL,'2025-12-20 05:59:44'),(876,'theme-flex-home-projects_list_page_id','8',NULL,'2025-12-20 05:59:44'),(877,'theme-flex-home-home_banner','general/home-banner.jpg',NULL,'2025-12-20 05:59:44'),(878,'theme-flex-home-breadcrumb_background','general/breadcrumb-background.jpg',NULL,'2025-12-20 05:59:44'),(879,'theme-flex-home-address','North Link Building, 10 Admiralty Street, 757695 Singapore',NULL,'2025-12-20 05:59:44'),(880,'theme-flex-home-hotline','18006268',NULL,'2025-12-20 05:59:44'),(881,'theme-flex-home-email','sale@botble.com',NULL,'2025-12-20 05:59:44'),(882,'theme-flex-home-primary_font','Nunito Sans',NULL,'2025-12-20 05:59:44'),(883,'theme-flex-home-about-us','<p>Founded on August 28, 1993 (formerly known as Truong Thinh Phat Construction Co., Ltd.), Flex Home operates in the field of real estate business, building villas for rent.</p><br />\n<p>With the slogan &quot;Breaking time, through space&quot; with a sustainable development strategy, taking Real Estate as a focus area, Flex Home is constantly connecting between buyers and sellers in the field.</p><p>Real estate, bringing people closer together, over the distance of time and space, is a reliable place for real estate investment - an area that is constantly evolving over time.</p>',NULL,'2025-12-20 05:59:44'),(884,'theme-flex-home-newsletter_popup_enable','1',NULL,'2025-12-20 05:59:44'),(885,'theme-flex-home-newsletter_popup_image','general/newsletter-image.jpg',NULL,'2025-12-20 05:59:44'),(886,'theme-flex-home-newsletter_popup_title','Let’s join our newsletter!',NULL,'2025-12-20 05:59:44'),(887,'theme-flex-home-newsletter_popup_subtitle','Weekly Updates',NULL,'2025-12-20 05:59:44'),(888,'theme-flex-home-newsletter_popup_description','Do not worry we don’t spam!',NULL,'2025-12-20 05:59:44'),(889,'theme-flex-home-social_sharing','[[{\"key\":\"social\",\"value\":\"facebook\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-facebook\"}],[{\"key\":\"social\",\"value\":\"x\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-x\"}],[{\"key\":\"social\",\"value\":\"pinterest\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-pinterest\"}],[{\"key\":\"social\",\"value\":\"linkedin\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-linkedin\"}],[{\"key\":\"social\",\"value\":\"whatsapp\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-whatsapp\"}],[{\"key\":\"social\",\"value\":\"email\"},{\"key\":\"icon\",\"value\":\"ti ti-mail\"}]]',NULL,'2025-12-20 05:59:44'),(890,'announcement_max_width','80',NULL,NULL),(891,'announcement_max_width_unit','%',NULL,NULL),(892,'announcement_text_color','#fff',NULL,NULL),(893,'announcement_background_color','transparent',NULL,NULL),(894,'announcement_text_alignment','start',NULL,NULL),(895,'announcement_dismissible','0',NULL,NULL),(896,'announcement_placement','theme',NULL,NULL),(897,'announcement_autoplay','1',NULL,NULL),(898,'announcement_autoplay_delay','5000',NULL,NULL);
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slugs`
--

DROP TABLE IF EXISTS `slugs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `slugs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_id` bigint unsigned NOT NULL,
  `reference_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `prefix` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `slugs_reference_id_index` (`reference_id`),
  KEY `slugs_key_index` (`key`),
  KEY `slugs_prefix_index` (`prefix`),
  KEY `slugs_reference_index` (`reference_id`,`reference_type`),
  KEY `idx_slugs_reference` (`reference_type`,`reference_id`),
  KEY `idx_key_prefix` (`key`,`prefix`)
) ENGINE=InnoDB AUTO_INCREMENT=141 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slugs`
--

LOCK TABLES `slugs` WRITE;
/*!40000 ALTER TABLE `slugs` DISABLE KEYS */;
INSERT INTO `slugs` VALUES (1,'news',1,'Botble\\Blog\\Models\\Category','news','2025-12-20 05:59:35','2025-12-20 05:59:35'),(2,'house-architecture',2,'Botble\\Blog\\Models\\Category','news','2025-12-20 05:59:35','2025-12-20 05:59:35'),(3,'house-design',3,'Botble\\Blog\\Models\\Category','news','2025-12-20 05:59:35','2025-12-20 05:59:35'),(4,'building-materials',4,'Botble\\Blog\\Models\\Category','news','2025-12-20 05:59:35','2025-12-20 05:59:35'),(5,'the-top-2020-handbag-trends-to-know',307,'Botble\\Blog\\Models\\Post','news','2025-12-20 05:59:35','2025-12-20 05:59:35'),(6,'top-search-engine-optimization-strategies',308,'Botble\\Blog\\Models\\Post','news','2025-12-20 05:59:35','2025-12-20 05:59:35'),(7,'which-company-would-you-choose',309,'Botble\\Blog\\Models\\Post','news','2025-12-20 05:59:35','2025-12-20 05:59:35'),(8,'used-car-dealer-sales-tricks-exposed',310,'Botble\\Blog\\Models\\Post','news','2025-12-20 05:59:35','2025-12-20 05:59:35'),(9,'20-ways-to-sell-your-product-faster',311,'Botble\\Blog\\Models\\Post','news','2025-12-20 05:59:35','2025-12-20 05:59:35'),(10,'the-secrets-of-rich-and-famous-writers',312,'Botble\\Blog\\Models\\Post','news','2025-12-20 05:59:36','2025-12-20 05:59:36'),(11,'imagine-losing-20-pounds-in-14-days',313,'Botble\\Blog\\Models\\Post','news','2025-12-20 05:59:36','2025-12-20 05:59:36'),(12,'are-you-still-using-that-slow-old-typewriter',314,'Botble\\Blog\\Models\\Post','news','2025-12-20 05:59:36','2025-12-20 05:59:36'),(13,'a-skin-cream-thats-proven-to-work',315,'Botble\\Blog\\Models\\Post','news','2025-12-20 05:59:36','2025-12-20 05:59:36'),(14,'10-reasons-to-start-your-own-profitable-website',316,'Botble\\Blog\\Models\\Post','news','2025-12-20 05:59:36','2025-12-20 05:59:36'),(15,'simple-ways-to-reduce-your-unwanted-wrinkles',317,'Botble\\Blog\\Models\\Post','news','2025-12-20 05:59:36','2025-12-20 05:59:36'),(16,'apple-imac-with-retina-5k-display-review',318,'Botble\\Blog\\Models\\Post','news','2025-12-20 05:59:36','2025-12-20 05:59:36'),(17,'10000-web-site-visitors-in-one-monthguaranteed',319,'Botble\\Blog\\Models\\Post','news','2025-12-20 05:59:36','2025-12-20 05:59:36'),(18,'unlock-the-secrets-of-selling-high-ticket-items',320,'Botble\\Blog\\Models\\Post','news','2025-12-20 05:59:36','2025-12-20 05:59:36'),(19,'4-expert-tips-on-how-to-choose-the-right-mens-wallet',321,'Botble\\Blog\\Models\\Post','news','2025-12-20 05:59:36','2025-12-20 05:59:36'),(20,'sexy-clutches-how-to-buy-wear-a-designer-clutch-bag',322,'Botble\\Blog\\Models\\Post','news','2025-12-20 05:59:36','2025-12-20 05:59:36'),(21,'home',1,'Botble\\Page\\Models\\Page','','2025-12-20 05:59:44','2025-12-20 05:59:44'),(22,'news',2,'Botble\\Page\\Models\\Page','','2025-12-20 05:59:44','2025-12-20 05:59:44'),(23,'about-us',3,'Botble\\Page\\Models\\Page','','2025-12-20 05:59:44','2025-12-20 05:59:44'),(24,'contact',4,'Botble\\Page\\Models\\Page','','2025-12-20 05:59:44','2025-12-20 05:59:44'),(25,'terms-conditions',5,'Botble\\Page\\Models\\Page','','2025-12-20 05:59:44','2025-12-20 05:59:44'),(26,'cookie-policy',6,'Botble\\Page\\Models\\Page','','2025-12-20 05:59:44','2025-12-20 05:59:44'),(27,'properties',7,'Botble\\Page\\Models\\Page','','2025-12-20 05:59:44','2025-12-20 05:59:44'),(28,'projects',8,'Botble\\Page\\Models\\Page','','2025-12-20 05:59:44','2025-12-20 05:59:44'),(29,'faqs',9,'Botble\\Page\\Models\\Page','','2025-12-20 05:59:44','2025-12-20 05:59:44'),(30,'pricing-plans',10,'Botble\\Page\\Models\\Page','','2025-12-20 05:59:44','2025-12-20 05:59:44'),(31,'top-10-tips-for-first-time-home-buyers',1,'Botble\\Blog\\Models\\Post','news','2025-12-20 05:59:44','2025-12-20 05:59:44'),(32,'how-to-stage-your-home-for-a-quick-sale',2,'Botble\\Blog\\Models\\Post','news','2025-12-20 05:59:44','2025-12-20 05:59:44'),(33,'understanding-the-current-real-estate-market-trends',3,'Botble\\Blog\\Models\\Post','news','2025-12-20 05:59:44','2025-12-20 05:59:44'),(34,'diy-home-improvement-projects-that-add-value',4,'Botble\\Blog\\Models\\Post','news','2025-12-20 05:59:44','2025-12-20 05:59:44'),(35,'tips',1,'Botble\\Blog\\Models\\Tag','tag','2025-12-20 05:59:44','2025-12-20 05:59:44'),(36,'investing',2,'Botble\\Blog\\Models\\Tag','tag','2025-12-20 05:59:44','2025-12-20 05:59:44'),(37,'market-analysis',3,'Botble\\Blog\\Models\\Tag','tag','2025-12-20 05:59:44','2025-12-20 05:59:44'),(38,'senior-full-stack-engineer-creator-success-full-time',1,'Botble\\Career\\Models\\Career','careers','2025-12-20 05:59:44','2025-12-20 05:59:44'),(39,'data-science-specialist-analytics-division',2,'Botble\\Career\\Models\\Career','careers','2025-12-20 05:59:44','2025-12-20 05:59:44'),(40,'product-marketing-manager-growth-team',3,'Botble\\Career\\Models\\Career','careers','2025-12-20 05:59:44','2025-12-20 05:59:44'),(41,'uxui-designer-user-experience-team',4,'Botble\\Career\\Models\\Career','careers','2025-12-20 05:59:44','2025-12-20 05:59:44'),(42,'operations-manager-supply-chain-division',5,'Botble\\Career\\Models\\Career','careers','2025-12-20 05:59:44','2025-12-20 05:59:44'),(43,'financial-analyst-investment-group',6,'Botble\\Career\\Models\\Career','careers','2025-12-20 05:59:44','2025-12-20 05:59:44'),(44,'3-beds-villa-calpe-alicante',1,'Botble\\RealEstate\\Models\\Property','properties','2025-12-20 05:59:44','2025-12-20 05:59:44'),(45,'lavida-plus-office-tel-1-bedroom',2,'Botble\\RealEstate\\Models\\Property','properties','2025-12-20 05:59:44','2025-12-20 05:59:44'),(46,'vinhomes-grand-park-studio-1-bedroom',3,'Botble\\RealEstate\\Models\\Property','properties','2025-12-20 05:59:44','2025-12-20 05:59:44'),(47,'the-sun-avenue-office-tel-1-bedroom',4,'Botble\\RealEstate\\Models\\Property','properties','2025-12-20 05:59:44','2025-12-20 05:59:44'),(48,'property-for-sale-johannesburg-south-africa',5,'Botble\\RealEstate\\Models\\Property','properties','2025-12-20 05:59:44','2025-12-20 05:59:44'),(49,'stunning-french-inspired-manor',6,'Botble\\RealEstate\\Models\\Property','properties','2025-12-20 05:59:44','2025-12-20 05:59:44'),(50,'villa-for-sale-at-bermuda-dunes',7,'Botble\\RealEstate\\Models\\Property','properties','2025-12-20 05:59:44','2025-12-20 05:59:44'),(51,'walnut-park-apartment',8,'Botble\\RealEstate\\Models\\Property','properties','2025-12-20 05:59:44','2025-12-20 05:59:44'),(52,'5-beds-luxury-house',9,'Botble\\RealEstate\\Models\\Property','properties','2025-12-20 05:59:44','2025-12-20 05:59:44'),(53,'family-victorian-view-home',10,'Botble\\RealEstate\\Models\\Property','properties','2025-12-20 05:59:44','2025-12-20 05:59:44'),(54,'osaka-heights-apartment',11,'Botble\\RealEstate\\Models\\Property','properties','2025-12-20 05:59:44','2025-12-20 05:59:44'),(55,'private-estate-magnificent-views',12,'Botble\\RealEstate\\Models\\Property','properties','2025-12-20 05:59:44','2025-12-20 05:59:44'),(56,'thompson-road-house-for-rent',13,'Botble\\RealEstate\\Models\\Property','properties','2025-12-20 05:59:44','2025-12-20 05:59:44'),(57,'brand-new-1-bedroom-apartment-in-first-class-location',14,'Botble\\RealEstate\\Models\\Property','properties','2025-12-20 05:59:44','2025-12-20 05:59:44'),(58,'elegant-family-home-presents-premium-modern-living',15,'Botble\\RealEstate\\Models\\Property','properties','2025-12-20 05:59:44','2025-12-20 05:59:44'),(59,'luxury-apartments-in-singapore-for-sale',16,'Botble\\RealEstate\\Models\\Property','properties','2025-12-20 05:59:44','2025-12-20 05:59:44'),(60,'5-room-luxury-penthouse-for-sale-in-kuala-lumpur',17,'Botble\\RealEstate\\Models\\Property','properties','2025-12-20 05:59:44','2025-12-20 05:59:44'),(61,'2-floor-house-in-compound-pejaten-barat-kemang',18,'Botble\\RealEstate\\Models\\Property','properties','2025-12-20 05:59:44','2025-12-20 05:59:44'),(62,'apartment-muiderstraatweg-in-diemen',19,'Botble\\RealEstate\\Models\\Property','properties','2025-12-20 05:59:44','2025-12-20 05:59:44'),(63,'nice-apartment-for-rent-in-berlin',20,'Botble\\RealEstate\\Models\\Property','properties','2025-12-20 05:59:44','2025-12-20 05:59:44'),(64,'pumpkin-key-private-island',21,'Botble\\RealEstate\\Models\\Property','properties','2025-12-20 05:59:44','2025-12-20 05:59:44'),(65,'maplewood-estates',22,'Botble\\RealEstate\\Models\\Property','properties','2025-12-20 05:59:44','2025-12-20 05:59:44'),(66,'pine-ridge-manor',23,'Botble\\RealEstate\\Models\\Property','properties','2025-12-20 05:59:44','2025-12-20 05:59:44'),(67,'oak-hill-residences',24,'Botble\\RealEstate\\Models\\Property','properties','2025-12-20 05:59:44','2025-12-20 05:59:44'),(68,'sunnybrook-villas',25,'Botble\\RealEstate\\Models\\Property','properties','2025-12-20 05:59:44','2025-12-20 05:59:44'),(69,'riverstone-condominiums',26,'Botble\\RealEstate\\Models\\Property','properties','2025-12-20 05:59:44','2025-12-20 05:59:44'),(70,'cedar-park-apartments',27,'Botble\\RealEstate\\Models\\Property','properties','2025-12-20 05:59:44','2025-12-20 05:59:44'),(71,'lakeside-retreat',28,'Botble\\RealEstate\\Models\\Property','properties','2025-12-20 05:59:44','2025-12-20 05:59:44'),(72,'willow-creek-homes',29,'Botble\\RealEstate\\Models\\Property','properties','2025-12-20 05:59:44','2025-12-20 05:59:44'),(73,'grandview-heights',30,'Botble\\RealEstate\\Models\\Property','properties','2025-12-20 05:59:44','2025-12-20 05:59:44'),(74,'forest-glen-cottages',31,'Botble\\RealEstate\\Models\\Property','properties','2025-12-20 05:59:44','2025-12-20 05:59:44'),(75,'harborview-towers',32,'Botble\\RealEstate\\Models\\Property','properties','2025-12-20 05:59:44','2025-12-20 05:59:44'),(76,'meadowlands-estates',33,'Botble\\RealEstate\\Models\\Property','properties','2025-12-20 05:59:44','2025-12-20 05:59:44'),(77,'highland-meadows',34,'Botble\\RealEstate\\Models\\Property','properties','2025-12-20 05:59:44','2025-12-20 05:59:44'),(78,'brookfield-gardens',35,'Botble\\RealEstate\\Models\\Property','properties','2025-12-20 05:59:44','2025-12-20 05:59:44'),(79,'silverwood-villas',36,'Botble\\RealEstate\\Models\\Property','properties','2025-12-20 05:59:44','2025-12-20 05:59:44'),(80,'evergreen-terrace',37,'Botble\\RealEstate\\Models\\Property','properties','2025-12-20 05:59:44','2025-12-20 05:59:44'),(81,'golden-gate-residences',38,'Botble\\RealEstate\\Models\\Property','properties','2025-12-20 05:59:44','2025-12-20 05:59:44'),(82,'spring-blossom-park',39,'Botble\\RealEstate\\Models\\Property','properties','2025-12-20 05:59:44','2025-12-20 05:59:44'),(83,'horizon-pointe',40,'Botble\\RealEstate\\Models\\Property','properties','2025-12-20 05:59:44','2025-12-20 05:59:44'),(84,'whispering-pines-lodge',41,'Botble\\RealEstate\\Models\\Property','properties','2025-12-20 05:59:44','2025-12-20 05:59:44'),(85,'sunset-ridge',42,'Botble\\RealEstate\\Models\\Property','properties','2025-12-20 05:59:44','2025-12-20 05:59:44'),(86,'timberline-estates',43,'Botble\\RealEstate\\Models\\Property','properties','2025-12-20 05:59:44','2025-12-20 05:59:44'),(87,'crystal-lake-condos',44,'Botble\\RealEstate\\Models\\Property','properties','2025-12-20 05:59:44','2025-12-20 05:59:44'),(88,'briarwood-apartments',45,'Botble\\RealEstate\\Models\\Property','properties','2025-12-20 05:59:44','2025-12-20 05:59:44'),(89,'summit-view',46,'Botble\\RealEstate\\Models\\Property','properties','2025-12-20 05:59:44','2025-12-20 05:59:44'),(90,'elmwood-park',47,'Botble\\RealEstate\\Models\\Property','properties','2025-12-20 05:59:44','2025-12-20 05:59:44'),(91,'stonegate-homes',48,'Botble\\RealEstate\\Models\\Property','properties','2025-12-20 05:59:44','2025-12-20 05:59:44'),(92,'rosewood-villas',49,'Botble\\RealEstate\\Models\\Property','properties','2025-12-20 05:59:44','2025-12-20 05:59:44'),(93,'prairie-meadows',50,'Botble\\RealEstate\\Models\\Property','properties','2025-12-20 05:59:44','2025-12-20 05:59:44'),(94,'hawthorne-heights',51,'Botble\\RealEstate\\Models\\Property','properties','2025-12-20 05:59:44','2025-12-20 05:59:44'),(95,'sierra-vista',52,'Botble\\RealEstate\\Models\\Property','properties','2025-12-20 05:59:44','2025-12-20 05:59:44'),(96,'autumn-leaves',53,'Botble\\RealEstate\\Models\\Property','properties','2025-12-20 05:59:44','2025-12-20 05:59:44'),(97,'blue-sky-residences',54,'Botble\\RealEstate\\Models\\Property','properties','2025-12-20 05:59:44','2025-12-20 05:59:44'),(98,'pebble-creek',55,'Botble\\RealEstate\\Models\\Property','properties','2025-12-20 05:59:44','2025-12-20 05:59:44'),(99,'magnolia-manor',56,'Botble\\RealEstate\\Models\\Property','properties','2025-12-20 05:59:44','2025-12-20 05:59:44'),(100,'cherry-blossom-estates',57,'Botble\\RealEstate\\Models\\Property','properties','2025-12-20 05:59:44','2025-12-20 05:59:44'),(101,'windsor-park',58,'Botble\\RealEstate\\Models\\Property','properties','2025-12-20 05:59:44','2025-12-20 05:59:44'),(102,'seaside-villas',59,'Botble\\RealEstate\\Models\\Property','properties','2025-12-20 05:59:44','2025-12-20 05:59:44'),(103,'mountain-view-retreat',60,'Botble\\RealEstate\\Models\\Property','properties','2025-12-20 05:59:44','2025-12-20 05:59:44'),(104,'amberwood-apartments',61,'Botble\\RealEstate\\Models\\Property','properties','2025-12-20 05:59:44','2025-12-20 05:59:44'),(105,'apartment',1,'Botble\\RealEstate\\Models\\Category','property-category','2025-12-20 05:59:44','2025-12-20 05:59:44'),(106,'villa',2,'Botble\\RealEstate\\Models\\Category','property-category','2025-12-20 05:59:44','2025-12-20 05:59:44'),(107,'condo',3,'Botble\\RealEstate\\Models\\Category','property-category','2025-12-20 05:59:44','2025-12-20 05:59:44'),(108,'house',4,'Botble\\RealEstate\\Models\\Category','property-category','2025-12-20 05:59:44','2025-12-20 05:59:44'),(109,'land',5,'Botble\\RealEstate\\Models\\Category','property-category','2025-12-20 05:59:44','2025-12-20 05:59:44'),(110,'commercial-property',6,'Botble\\RealEstate\\Models\\Category','property-category','2025-12-20 05:59:44','2025-12-20 05:59:44'),(111,'walnut-park-apartments',1,'Botble\\RealEstate\\Models\\Project','projects','2025-12-20 05:59:44','2025-12-20 05:59:44'),(112,'sunshine-wonder-villas',2,'Botble\\RealEstate\\Models\\Project','projects','2025-12-20 05:59:44','2025-12-20 05:59:44'),(113,'diamond-island',3,'Botble\\RealEstate\\Models\\Project','projects','2025-12-20 05:59:44','2025-12-20 05:59:44'),(114,'the-nassim',4,'Botble\\RealEstate\\Models\\Project','projects','2025-12-20 05:59:44','2025-12-20 05:59:44'),(115,'vinhomes-grand-park',5,'Botble\\RealEstate\\Models\\Project','projects','2025-12-20 05:59:44','2025-12-20 05:59:44'),(116,'the-metropole-thu-thiem',6,'Botble\\RealEstate\\Models\\Project','projects','2025-12-20 05:59:44','2025-12-20 05:59:44'),(117,'villa-on-grand-avenue',7,'Botble\\RealEstate\\Models\\Project','projects','2025-12-20 05:59:44','2025-12-20 05:59:44'),(118,'traditional-food-restaurant',8,'Botble\\RealEstate\\Models\\Project','projects','2025-12-20 05:59:44','2025-12-20 05:59:44'),(119,'villa-on-hollywood-boulevard',9,'Botble\\RealEstate\\Models\\Project','projects','2025-12-20 05:59:44','2025-12-20 05:59:44'),(120,'office-space-at-northwest-107th',10,'Botble\\RealEstate\\Models\\Project','projects','2025-12-20 05:59:44','2025-12-20 05:59:44'),(121,'home-in-merrick-way',11,'Botble\\RealEstate\\Models\\Project','projects','2025-12-20 05:59:44','2025-12-20 05:59:44'),(122,'adarsh-greens',12,'Botble\\RealEstate\\Models\\Project','projects','2025-12-20 05:59:44','2025-12-20 05:59:44'),(123,'rustomjee-evershine-global-city',13,'Botble\\RealEstate\\Models\\Project','projects','2025-12-20 05:59:44','2025-12-20 05:59:44'),(124,'godrej-exquisite',14,'Botble\\RealEstate\\Models\\Project','projects','2025-12-20 05:59:44','2025-12-20 05:59:44'),(125,'godrej-prime',15,'Botble\\RealEstate\\Models\\Project','projects','2025-12-20 05:59:44','2025-12-20 05:59:44'),(126,'ps-panache',16,'Botble\\RealEstate\\Models\\Project','projects','2025-12-20 05:59:44','2025-12-20 05:59:44'),(127,'upturn-atmiya-centria',17,'Botble\\RealEstate\\Models\\Project','projects','2025-12-20 05:59:44','2025-12-20 05:59:44'),(128,'brigade-oasis',18,'Botble\\RealEstate\\Models\\Project','projects','2025-12-20 05:59:44','2025-12-20 05:59:44'),(129,'john',1,'Botble\\RealEstate\\Models\\Account','agents','2025-12-20 05:59:44','2025-12-20 05:59:44'),(130,'sarah',2,'Botble\\RealEstate\\Models\\Account','agents','2025-12-20 05:59:44','2025-12-20 05:59:44'),(131,'michael',3,'Botble\\RealEstate\\Models\\Account','agents','2025-12-20 05:59:44','2025-12-20 05:59:44'),(132,'emily',4,'Botble\\RealEstate\\Models\\Account','agents','2025-12-20 05:59:44','2025-12-20 05:59:44'),(133,'david',5,'Botble\\RealEstate\\Models\\Account','agents','2025-12-20 05:59:44','2025-12-20 05:59:44'),(134,'jennifer',6,'Botble\\RealEstate\\Models\\Account','agents','2025-12-20 05:59:44','2025-12-20 05:59:44'),(135,'robert',7,'Botble\\RealEstate\\Models\\Account','agents','2025-12-20 05:59:44','2025-12-20 05:59:44'),(136,'lisa',8,'Botble\\RealEstate\\Models\\Account','agents','2025-12-20 05:59:44','2025-12-20 05:59:44'),(137,'james',9,'Botble\\RealEstate\\Models\\Account','agents','2025-12-20 05:59:44','2025-12-20 05:59:44'),(138,'amanda',10,'Botble\\RealEstate\\Models\\Account','agents','2025-12-20 05:59:44','2025-12-20 05:59:44'),(139,'william',11,'Botble\\RealEstate\\Models\\Account','agents','2025-12-20 05:59:44','2025-12-20 05:59:44'),(140,'jessica',12,'Botble\\RealEstate\\Models\\Account','agents','2025-12-20 05:59:44','2025-12-20 05:59:44');
/*!40000 ALTER TABLE `slugs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slugs_translations`
--

DROP TABLE IF EXISTS `slugs_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `slugs_translations` (
  `lang_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slugs_id` bigint unsigned NOT NULL,
  `key` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prefix` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '',
  PRIMARY KEY (`lang_code`,`slugs_id`),
  KEY `idx_slugid_key_prefix` (`slugs_id`,`key`,`prefix`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slugs_translations`
--

LOCK TABLES `slugs_translations` WRITE;
/*!40000 ALTER TABLE `slugs_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `slugs_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_logins`
--

DROP TABLE IF EXISTS `social_logins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `social_logins` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `provider` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `provider_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `refresh_token` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `token_expires_at` timestamp NULL DEFAULT NULL,
  `provider_data` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `social_logins_provider_provider_id_unique` (`provider`,`provider_id`),
  KEY `social_logins_user_type_user_id_index` (`user_type`,`user_id`),
  KEY `social_logins_user_id_user_type_index` (`user_id`,`user_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_logins`
--

LOCK TABLES `social_logins` WRITE;
/*!40000 ALTER TABLE `social_logins` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_logins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `states`
--

DROP TABLE IF EXISTS `states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `states` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `abbreviation` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_id` bigint unsigned DEFAULT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `status` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `states_slug_unique` (`slug`),
  KEY `idx_states_name` (`name`),
  KEY `idx_states_status` (`status`),
  KEY `idx_states_country_id` (`country_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `states`
--

LOCK TABLES `states` WRITE;
/*!40000 ALTER TABLE `states` DISABLE KEYS */;
INSERT INTO `states` VALUES (1,'France','france','FR',1,0,'locations/1.jpg',0,'published',NULL,NULL),(2,'England','england','EN',2,0,'locations/2.jpg',0,'published',NULL,NULL),(3,'New York','new-york','NY',3,0,'locations/4.jpg',0,'published',NULL,NULL),(4,'Holland','holland','HL',4,0,'locations/1.jpg',0,'published',NULL,NULL),(5,'Denmark','denmark','DN',5,0,'locations/1.jpg',0,'published',NULL,NULL),(6,'Bavaria','bavaria','BY',6,0,'locations/5.jpg',0,'published',NULL,NULL),(7,'Tokyo','tokyo','TK',7,0,'locations/4.jpg',0,'published',NULL,NULL),(8,'Ontario','ontario','ON',8,0,'locations/1.jpg',0,'published',NULL,NULL),(9,'New South Wales','new-south-wales','NSW',9,0,'locations/1.jpg',0,'published',NULL,NULL),(10,'Lombardy','lombardy','LO',10,0,'locations/3.jpg',0,'published',NULL,NULL);
/*!40000 ALTER TABLE `states` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `states_translations`
--

DROP TABLE IF EXISTS `states_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `states_translations` (
  `lang_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `states_id` bigint unsigned NOT NULL,
  `name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `abbreviation` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`states_id`),
  KEY `idx_states_trans_state_lang` (`states_id`,`lang_code`),
  KEY `idx_states_trans_name` (`name`),
  KEY `idx_states_trans_states_id` (`states_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `states_translations`
--

LOCK TABLES `states_translations` WRITE;
/*!40000 ALTER TABLE `states_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `states_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `author_id` bigint unsigned DEFAULT NULL,
  `author_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (1,'Tips',1,'Botble\\ACL\\Models\\User',NULL,'published','2025-10-20 17:21:20','2025-10-20 17:21:20'),(2,'Investing',1,'Botble\\ACL\\Models\\User',NULL,'published','2025-10-20 17:21:20','2025-10-20 17:21:20'),(3,'Market Analysis',1,'Botble\\ACL\\Models\\User',NULL,'published','2025-10-20 17:21:20','2025-10-20 17:21:20');
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags_translations`
--

DROP TABLE IF EXISTS `tags_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags_translations` (
  `lang_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tags_id` bigint unsigned NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`tags_id`),
  KEY `idx_tags_trans_tags_id` (`tags_id`),
  KEY `idx_tags_trans_tag_lang` (`tags_id`,`lang_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags_translations`
--

LOCK TABLES `tags_translations` WRITE;
/*!40000 ALTER TABLE `tags_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `tags_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testimonials`
--

DROP TABLE IF EXISTS `testimonials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `testimonials` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testimonials`
--

LOCK TABLES `testimonials` WRITE;
/*!40000 ALTER TABLE `testimonials` DISABLE KEYS */;
INSERT INTO `testimonials` VALUES (1,'Jennifer Lee','From the initial consultation to closing day, the real estate team went above and beyond to ensure I found the perfect home. Their dedication and professionalism made the entire process seamless. Thank you!','avatars/8.jpg','Happy Home Seeker','published','2025-10-20 17:21:19','2025-10-20 17:21:19'),(2,'Robert Evans','I am impressed by the level of expertise and commitment demonstrated by this real estate team. Their insights into the market helped me make informed investment decisions, and I couldn\'t be happier with the results.','avatars/1.jpg','Property Investor','published','2025-10-20 17:21:19','2025-10-20 17:21:19'),(3,'Jessica White','Selling my home with the help of this real estate team was a breeze. They provided valuable advice, staged my property beautifully, and negotiated a great deal. I highly recommend their services to anyone looking to sell their home!','avatars/6.jpg','Delighted Home Seller','published','2025-10-20 17:21:19','2025-10-20 17:21:19'),(4,'Daniel Miller','Thanks to the expertise and guidance of this real estate team, I am now the proud owner of my dream home. They listened to my preferences, answered all my questions, and made the entire home buying process a positive experience.','avatars/8.jpg','Happy New Homeowner','published','2025-10-20 17:21:19','2025-10-20 17:21:19');
/*!40000 ALTER TABLE `testimonials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testimonials_translations`
--

DROP TABLE IF EXISTS `testimonials_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `testimonials_translations` (
  `lang_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `testimonials_id` bigint unsigned NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `company` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`testimonials_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testimonials_translations`
--

LOCK TABLES `testimonials_translations` WRITE;
/*!40000 ALTER TABLE `testimonials_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `testimonials_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transactions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `credits` int unsigned NOT NULL,
  `description` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `account_id` bigint unsigned DEFAULT NULL,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'add',
  `payment_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_meta`
--

DROP TABLE IF EXISTS `user_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_meta` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `user_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_meta_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_meta`
--

LOCK TABLES `user_meta` WRITE;
/*!40000 ALTER TABLE `user_meta` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_settings`
--

DROP TABLE IF EXISTS `user_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `key` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` json NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_settings_user_type_user_id_key_unique` (`user_type`,`user_id`,`key`),
  KEY `user_settings_user_type_user_id_index` (`user_type`,`user_id`),
  KEY `user_settings_key_index` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_settings`
--

LOCK TABLES `user_settings` WRITE;
/*!40000 ALTER TABLE `user_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `first_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar_id` bigint unsigned DEFAULT NULL,
  `super_user` tinyint(1) NOT NULL DEFAULT '0',
  `manage_supers` tinyint(1) NOT NULL DEFAULT '0',
  `permissions` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_login` timestamp NULL DEFAULT NULL,
  `sessions_invalidated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_username_unique` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin@company.com',NULL,NULL,'$2y$12$LumWA6zvETLZ6bGOtq9P8.iSZvAox.wzKX.62C5KS1NvKAT8p46i6',NULL,'2025-12-20 05:59:31','2025-12-20 05:59:31','System','Admin','admin',NULL,1,1,NULL,NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `widgets`
--

DROP TABLE IF EXISTS `widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `widgets` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `widget_id` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sidebar_id` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `theme` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` tinyint unsigned NOT NULL DEFAULT '0',
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `widgets_unique_index` (`theme`,`sidebar_id`,`widget_id`,`position`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `widgets`
--

LOCK TABLES `widgets` WRITE;
/*!40000 ALTER TABLE `widgets` DISABLE KEYS */;
INSERT INTO `widgets` VALUES (1,'CustomMenuWidget','footer_sidebar','flex-home',1,'{\"id\":\"CustomMenuWidget\",\"name\":\"About\",\"menu_id\":\"about\"}','2025-12-20 05:59:44','2025-12-20 05:59:44'),(2,'CustomMenuWidget','footer_sidebar','flex-home',2,'{\"id\":\"CustomMenuWidget\",\"name\":\"More Information\",\"menu_id\":\"more-information\"}','2025-12-20 05:59:44','2025-12-20 05:59:44'),(3,'CustomMenuWidget','footer_sidebar','flex-home',3,'{\"id\":\"CustomMenuWidget\",\"name\":\"News\",\"menu_id\":\"news\"}','2025-12-20 05:59:44','2025-12-20 05:59:44'),(4,'CategoriesWidget','primary_sidebar','flex-home',1,'{\"id\":\"CategoriesWidget\"}','2025-12-20 05:59:44','2025-12-20 05:59:44'),(5,'RecentPostsWidget','primary_sidebar','flex-home',2,'{\"id\":\"RecentPostsWidget\",\"name\":\"Recent Posts\",\"number_display\":5}','2025-12-20 05:59:44','2025-12-20 05:59:44'),(6,'FriendsOfBotble\\MortgageCalculator\\Widgets\\MortgageCalculatorWidget','property_detail_sidebar','flex-home',1,'{\"id\":\"FriendsOfBotble\\\\MortgageCalculator\\\\Widgets\\\\MortgageCalculatorWidget\",\"name\":\"Mortgage Calculator\",\"style\":\"default\",\"layout\":\"vertical\",\"form_style\":\"default\",\"form_margin\":\"20px 0\",\"form_padding\":\"\",\"primary_color\":\"#1d5f6f\",\"default_price\":\"\",\"default_term\":\"\",\"default_rate\":\"\",\"default_down_payment_type\":\"\",\"default_down_payment_value\":\"\",\"show_extra_costs\":\"0\"}','2025-12-20 05:59:44','2025-12-20 05:59:44'),(7,'FriendsOfBotble\\MortgageCalculator\\Widgets\\MortgageCalculatorWidget','project_detail_sidebar','flex-home',1,'{\"id\":\"FriendsOfBotble\\\\MortgageCalculator\\\\Widgets\\\\MortgageCalculatorWidget\",\"name\":\"Mortgage Calculator\",\"style\":\"default\",\"layout\":\"vertical\",\"form_style\":\"default\",\"form_margin\":\"20px 0\",\"form_padding\":\"\",\"primary_color\":\"#1d5f6f\",\"default_price\":\"\",\"default_term\":\"\",\"default_rate\":\"\",\"default_down_payment_type\":\"\",\"default_down_payment_value\":\"\",\"show_extra_costs\":\"0\"}','2025-12-20 05:59:44','2025-12-20 05:59:44');
/*!40000 ALTER TABLE `widgets` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-12-20 19:59:45
