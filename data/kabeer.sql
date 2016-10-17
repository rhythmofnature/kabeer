-- MySQL dump 10.13  Distrib 5.7.15, for Linux (x86_64)
--
-- Host: localhost    Database: kabeer
-- ------------------------------------------------------
-- Server version	5.7.13-0ubuntu0.16.04.2

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
-- Table structure for table `auth_assignment`
--

DROP TABLE IF EXISTS `auth_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_assignment` (
  `item_name` varchar(64) NOT NULL,
  `user_id` varchar(64) NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`item_name`,`user_id`),
  CONSTRAINT `auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_assignment`
--

LOCK TABLES `auth_assignment` WRITE;
/*!40000 ALTER TABLE `auth_assignment` DISABLE KEYS */;
INSERT INTO `auth_assignment` VALUES ('Employee','15',1432722939),('Employee','19',1432723678),('Employee','20',1432724802),('Employee','21',1432725245),('Employee','22',1432725750),('Employee','23',1432727516),('Employee','24',1432728127),('Employee','25',1432729311),('Employee','26',1432786972),('Employee','27',1432787696),('Employee','28',1432788376),('Employee','29',1432789763),('Employee','30',1432791740),('Employee','31',1432798436),('Employee','32',1432798892),('Employee','33',1432804334),('Employee','4',1432721974),('Student','10',1432722586),('Student','11',1432722636),('Student','12',1432722790),('Student','13',1432722852),('Student','14',1432722904),('Student','16',1432722957),('Student','17',1432723047),('Student','18',1432723142),('Student','2',1432721814),('Student','3',1432721957),('Student','5',1432722136),('Student','6',1432722271),('Student','7',1432722395),('Student','8',1432722482),('Student','9',1432722535),('SuperAdmin','1',1432720135);
/*!40000 ALTER TABLE `auth_assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_item`
--

DROP TABLE IF EXISTS `auth_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_item` (
  `name` varchar(64) NOT NULL,
  `type` int(11) NOT NULL,
  `description` text,
  `rule_name` varchar(64) DEFAULT NULL,
  `data` text,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `rule_name` (`rule_name`),
  KEY `type` (`type`),
  CONSTRAINT `auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_item`
--

LOCK TABLES `auth_item` WRITE;
/*!40000 ALTER TABLE `auth_item` DISABLE KEYS */;
INSERT INTO `auth_item` VALUES ('/*',2,'/*',NULL,NULL,1432554657,1432554657),('/auth-assignment/*',2,'/auth-assignment/*',NULL,NULL,1432554652,1432554652),('/auth-assignment/create',2,'/auth-assignment/create',NULL,NULL,1432554652,1432554652),('/auth-assignment/delete',2,'/auth-assignment/delete',NULL,NULL,1432554652,1432554652),('/auth-assignment/index',2,'/auth-assignment/index',NULL,NULL,1432554652,1432554652),('/auth-assignment/update',2,'/auth-assignment/update',NULL,NULL,1432554652,1432554652),('/auth-assignment/view',2,'/auth-assignment/view',NULL,NULL,1432554652,1432554652),('/city/*',2,'/city/*',NULL,NULL,1432554652,1432554652),('/city/create',2,'/city/create',NULL,NULL,1432555253,1432555253),('/city/delete',2,'/city/delete',NULL,NULL,1432554652,1432554652),('/city/index',2,'/city/index',NULL,NULL,1432554652,1432554652),('/city/update',2,'/city/update',NULL,NULL,1432554652,1432554652),('/city/view',2,'/city/view',NULL,NULL,1432554652,1432554652),('/country/*',2,'/country/*',NULL,NULL,1432554653,1432554653),('/country/create',2,'/country/create',NULL,NULL,1432554652,1432554652),('/country/delete',2,'/country/delete',NULL,NULL,1432554653,1432554653),('/country/index',2,'/country/index',NULL,NULL,1432554652,1432554652),('/country/update',2,'/country/update',NULL,NULL,1432554652,1432554652),('/country/view',2,'/country/view',NULL,NULL,1432554652,1432554652),('/course/*',2,'/course/*',NULL,NULL,1432554639,1432554639),('/course/batches/*',2,'/course/batches/*',NULL,NULL,1432554638,1432554638),('/course/batches/create',2,'/course/batches/create',NULL,NULL,1432554638,1432554638),('/course/batches/delete',2,'/course/batches/delete',NULL,NULL,1432554638,1432554638),('/course/batches/index',2,'/course/batches/index',NULL,NULL,1432554638,1432554638),('/course/batches/toggle',2,'/course/batches/toggle',NULL,NULL,1432554638,1432554638),('/course/batches/update',2,'/course/batches/update',NULL,NULL,1432554638,1432554638),('/course/batches/view',2,'/course/batches/view',NULL,NULL,1432554638,1432554638),('/course/courses/*',2,'/course/courses/*',NULL,NULL,1432554638,1432554638),('/course/courses/create',2,'/course/courses/create',NULL,NULL,1432554638,1432554638),('/course/courses/delete',2,'/course/courses/delete',NULL,NULL,1432554638,1432554638),('/course/courses/index',2,'/course/courses/index',NULL,NULL,1432554638,1432554638),('/course/courses/toggle',2,'/course/courses/toggle',NULL,NULL,1432554638,1432554638),('/course/courses/update',2,'/course/courses/update',NULL,NULL,1432554638,1432554638),('/course/courses/view',2,'/course/courses/view',NULL,NULL,1432554638,1432554638),('/course/default/*',2,'/course/default/*',NULL,NULL,1432554639,1432554639),('/course/default/index',2,'/course/default/index',NULL,NULL,1432554638,1432554638),('/course/section/*',2,'/course/section/*',NULL,NULL,1432554639,1432554639),('/course/section/create',2,'/course/section/create',NULL,NULL,1432554639,1432554639),('/course/section/delete',2,'/course/section/delete',NULL,NULL,1432554639,1432554639),('/course/section/index',2,'/course/section/index',NULL,NULL,1432554639,1432554639),('/course/section/toggle',2,'/course/section/toggle',NULL,NULL,1432554639,1432554639),('/course/section/update',2,'/course/section/update',NULL,NULL,1432554639,1432554639),('/course/section/view',2,'/course/section/view',NULL,NULL,1432554639,1432554639),('/dashboard/*',2,'/dashboard/*',NULL,NULL,1432554649,1432554649),('/dashboard/default/*',2,'/dashboard/default/*',NULL,NULL,1432554647,1432554647),('/dashboard/default/index',2,'/dashboard/default/index',NULL,NULL,1432554647,1432554647),('/dashboard/events/*',2,'/dashboard/events/*',NULL,NULL,1432554648,1432554648),('/dashboard/events/add-event',2,'/dashboard/events/add-event',NULL,NULL,1432554647,1432554647),('/dashboard/events/event-delete',2,'/dashboard/events/event-delete',NULL,NULL,1432554648,1432554648),('/dashboard/events/index',2,'/dashboard/events/index',NULL,NULL,1432554647,1432554647),('/dashboard/events/update-event',2,'/dashboard/events/update-event',NULL,NULL,1432554648,1432554648),('/dashboard/events/view',2,'/dashboard/events/view',NULL,NULL,1432554647,1432554647),('/dashboard/events/view-events',2,'/dashboard/events/view-events',NULL,NULL,1432554647,1432554647),('/dashboard/msg-of-day/*',2,'/dashboard/msg-of-day/*',NULL,NULL,1432554648,1432554648),('/dashboard/msg-of-day/create',2,'/dashboard/msg-of-day/create',NULL,NULL,1432554648,1432554648),('/dashboard/msg-of-day/delete',2,'/dashboard/msg-of-day/delete',NULL,NULL,1432554648,1432554648),('/dashboard/msg-of-day/index',2,'/dashboard/msg-of-day/index',NULL,NULL,1432554648,1432554648),('/dashboard/msg-of-day/toggle',2,'/dashboard/msg-of-day/toggle',NULL,NULL,1432554648,1432554648),('/dashboard/msg-of-day/update',2,'/dashboard/msg-of-day/update',NULL,NULL,1432554648,1432554648),('/dashboard/msg-of-day/view',2,'/dashboard/msg-of-day/view',NULL,NULL,1432554648,1432554648),('/dashboard/notice/*',2,'/dashboard/notice/*',NULL,NULL,1432554649,1432554649),('/dashboard/notice/create',2,'/dashboard/notice/create',NULL,NULL,1432554649,1432554649),('/dashboard/notice/delete',2,'/dashboard/notice/delete',NULL,NULL,1432554649,1432554649),('/dashboard/notice/index',2,'/dashboard/notice/index',NULL,NULL,1432554649,1432554649),('/dashboard/notice/notice-file',2,'/dashboard/notice/notice-file',NULL,NULL,1432554649,1432554649),('/dashboard/notice/toggle',2,'/dashboard/notice/toggle',NULL,NULL,1432554649,1432554649),('/dashboard/notice/update',2,'/dashboard/notice/update',NULL,NULL,1432554649,1432554649),('/dashboard/notice/view',2,'/dashboard/notice/view',NULL,NULL,1432554649,1432554649),('/dashboard/notice/view-popup',2,'/dashboard/notice/view-popup',NULL,NULL,1432554649,1432554649),('/debug/*',2,'/debug/*',NULL,NULL,1432554651,1432554651),('/debug/default/*',2,'/debug/default/*',NULL,NULL,1432554651,1432554651),('/debug/default/download-mail',2,'/debug/default/download-mail',NULL,NULL,1432554651,1432554651),('/debug/default/index',2,'/debug/default/index',NULL,NULL,1432554651,1432554651),('/debug/default/toolbar',2,'/debug/default/toolbar',NULL,NULL,1432554651,1432554651),('/debug/default/view',2,'/debug/default/view',NULL,NULL,1432554651,1432554651),('/default/*',2,'/default/*',NULL,NULL,1432554653,1432554653),('/default/index',2,'/default/index',NULL,NULL,1432554653,1432554653),('/dependent/*',2,'/dependent/*',NULL,NULL,1432554653,1432554653),('/dependent/getcity',2,'/dependent/getcity',NULL,NULL,1432554653,1432554653),('/dependent/getorgcity',2,'/dependent/getorgcity',NULL,NULL,1432554653,1432554653),('/dependent/getorgstate',2,'/dependent/getorgstate',NULL,NULL,1432554653,1432554653),('/dependent/getstate',2,'/dependent/getstate',NULL,NULL,1432554653,1432554653),('/dependent/index',2,'/dependent/index',NULL,NULL,1432554653,1432554653),('/dependent/studbatch',2,'/dependent/studbatch',NULL,NULL,1432554653,1432554653),('/dependent/studsection',2,'/dependent/studsection',NULL,NULL,1432554653,1432554653),('/document-category/*',2,'/document-category/*',NULL,NULL,1432554653,1432554653),('/document-category/create',2,'/document-category/create',NULL,NULL,1432554653,1432554653),('/document-category/delete',2,'/document-category/delete',NULL,NULL,1432554653,1432554653),('/document-category/index',2,'/document-category/index',NULL,NULL,1432554653,1432554653),('/document-category/update',2,'/document-category/update',NULL,NULL,1432554653,1432554653),('/document-category/view',2,'/document-category/view',NULL,NULL,1432554653,1432554653),('/employee/*',2,'/employee/*',NULL,NULL,1432554645,1432554645),('/employee/default/*',2,'/employee/default/*',NULL,NULL,1432554642,1432554642),('/employee/default/index',2,'/employee/default/index',NULL,NULL,1432554642,1432554642),('/employee/dependent/*',2,'/employee/dependent/*',NULL,NULL,1432554642,1432554642),('/employee/dependent/emp-c-city',2,'/employee/dependent/emp-c-city',NULL,NULL,1432554642,1432554642),('/employee/dependent/emp-c-state',2,'/employee/dependent/emp-c-state',NULL,NULL,1432554642,1432554642),('/employee/dependent/emp-p-city',2,'/employee/dependent/emp-p-city',NULL,NULL,1432554642,1432554642),('/employee/dependent/emp-p-state',2,'/employee/dependent/emp-p-state',NULL,NULL,1432554642,1432554642),('/employee/emp-address/*',2,'/employee/emp-address/*',NULL,NULL,1432554642,1432554642),('/employee/emp-address/create',2,'/employee/emp-address/create',NULL,NULL,1432554642,1432554642),('/employee/emp-address/delete',2,'/employee/emp-address/delete',NULL,NULL,1432554642,1432554642),('/employee/emp-address/index',2,'/employee/emp-address/index',NULL,NULL,1432554642,1432554642),('/employee/emp-address/update',2,'/employee/emp-address/update',NULL,NULL,1432554642,1432554642),('/employee/emp-address/view',2,'/employee/emp-address/view',NULL,NULL,1432554642,1432554642),('/employee/emp-category/*',2,'/employee/emp-category/*',NULL,NULL,1432554643,1432554643),('/employee/emp-category/create',2,'/employee/emp-category/create',NULL,NULL,1432554643,1432554643),('/employee/emp-category/delete',2,'/employee/emp-category/delete',NULL,NULL,1432554643,1432554643),('/employee/emp-category/index',2,'/employee/emp-category/index',NULL,NULL,1432554642,1432554642),('/employee/emp-category/update',2,'/employee/emp-category/update',NULL,NULL,1432554643,1432554643),('/employee/emp-category/view',2,'/employee/emp-category/view',NULL,NULL,1432554643,1432554643),('/employee/emp-department/*',2,'/employee/emp-department/*',NULL,NULL,1432554643,1432554643),('/employee/emp-department/create',2,'/employee/emp-department/create',NULL,NULL,1432554643,1432554643),('/employee/emp-department/delete',2,'/employee/emp-department/delete',NULL,NULL,1432554643,1432554643),('/employee/emp-department/index',2,'/employee/emp-department/index',NULL,NULL,1432554643,1432554643),('/employee/emp-department/update',2,'/employee/emp-department/update',NULL,NULL,1432554643,1432554643),('/employee/emp-department/view',2,'/employee/emp-department/view',NULL,NULL,1432554643,1432554643),('/employee/emp-designation/*',2,'/employee/emp-designation/*',NULL,NULL,1432554643,1432554643),('/employee/emp-designation/create',2,'/employee/emp-designation/create',NULL,NULL,1432554643,1432554643),('/employee/emp-designation/delete',2,'/employee/emp-designation/delete',NULL,NULL,1432554643,1432554643),('/employee/emp-designation/index',2,'/employee/emp-designation/index',NULL,NULL,1432554643,1432554643),('/employee/emp-designation/update',2,'/employee/emp-designation/update',NULL,NULL,1432554643,1432554643),('/employee/emp-designation/view',2,'/employee/emp-designation/view',NULL,NULL,1432554643,1432554643),('/employee/emp-docs/*',2,'/employee/emp-docs/*',NULL,NULL,1432554644,1432554644),('/employee/emp-docs/create',2,'/employee/emp-docs/create',NULL,NULL,1432554643,1432554643),('/employee/emp-docs/delete',2,'/employee/emp-docs/delete',NULL,NULL,1432554643,1432554643),('/employee/emp-docs/index',2,'/employee/emp-docs/index',NULL,NULL,1432554643,1432554643),('/employee/emp-docs/update',2,'/employee/emp-docs/update',NULL,NULL,1432554643,1432554643),('/employee/emp-docs/view',2,'/employee/emp-docs/view',NULL,NULL,1432554643,1432554643),('/employee/emp-info/*',2,'/employee/emp-info/*',NULL,NULL,1432554644,1432554644),('/employee/emp-info/create',2,'/employee/emp-info/create',NULL,NULL,1432554644,1432554644),('/employee/emp-info/delete',2,'/employee/emp-info/delete',NULL,NULL,1432554644,1432554644),('/employee/emp-info/index',2,'/employee/emp-info/index',NULL,NULL,1432554644,1432554644),('/employee/emp-info/update',2,'/employee/emp-info/update',NULL,NULL,1432554644,1432554644),('/employee/emp-info/view',2,'/employee/emp-info/view',NULL,NULL,1432554644,1432554644),('/employee/emp-master/*',2,'/employee/emp-master/*',NULL,NULL,1432554644,1432554644),('/employee/emp-master/adddocs',2,'/employee/emp-master/adddocs',NULL,NULL,1432554644,1432554644),('/employee/emp-master/change-status',2,'/employee/emp-master/change-status',NULL,NULL,1432554644,1432554644),('/employee/emp-master/create',2,'/employee/emp-master/create',NULL,NULL,1432554644,1432554644),('/employee/emp-master/delete',2,'/employee/emp-master/delete',NULL,NULL,1432554644,1432554644),('/employee/emp-master/delete-doc',2,'/employee/emp-master/delete-doc',NULL,NULL,1432554644,1432554644),('/employee/emp-master/docs-download',2,'/employee/emp-master/docs-download',NULL,NULL,1432554644,1432554644),('/employee/emp-master/emp-photo',2,'/employee/emp-master/emp-photo',NULL,NULL,1432554644,1432554644),('/employee/emp-master/index',2,'/employee/emp-master/index',NULL,NULL,1432554644,1432554644),('/employee/emp-master/update',2,'/employee/emp-master/update',NULL,NULL,1432554644,1432554644),('/employee/emp-master/view',2,'/employee/emp-master/view',NULL,NULL,1432554644,1432554644),('/employee/emp-status/*',2,'/employee/emp-status/*',NULL,NULL,1432554645,1432554645),('/employee/emp-status/create',2,'/employee/emp-status/create',NULL,NULL,1432554645,1432554645),('/employee/emp-status/delete',2,'/employee/emp-status/delete',NULL,NULL,1432554645,1432554645),('/employee/emp-status/index',2,'/employee/emp-status/index',NULL,NULL,1432554644,1432554644),('/employee/emp-status/update',2,'/employee/emp-status/update',NULL,NULL,1432554645,1432554645),('/employee/emp-status/view',2,'/employee/emp-status/view',NULL,NULL,1432554644,1432554644),('/employee/export-data/*',2,'/employee/export-data/*',NULL,NULL,1432554645,1432554645),('/employee/export-data/employee-profile-pdf',2,'/employee/export-data/employee-profile-pdf',NULL,NULL,1432554645,1432554645),('/export-data/*',2,'/export-data/*',NULL,NULL,1432554653,1432554653),('/export-data/export-excel',2,'/export-data/export-excel',NULL,NULL,1432554653,1432554653),('/export-data/export-to-pdf',2,'/export-data/export-to-pdf',NULL,NULL,1432554653,1432554653),('/fees/*',2,'/fees/*',NULL,NULL,1432554646,1432554646),('/fees/bank-master/*',2,'/fees/bank-master/*',NULL,NULL,1432554645,1432554645),('/fees/bank-master/create',2,'/fees/bank-master/create',NULL,NULL,1432554645,1432554645),('/fees/bank-master/delete',2,'/fees/bank-master/delete',NULL,NULL,1432554645,1432554645),('/fees/bank-master/index',2,'/fees/bank-master/index',NULL,NULL,1432554645,1432554645),('/fees/bank-master/update',2,'/fees/bank-master/update',NULL,NULL,1432554645,1432554645),('/fees/bank-master/view',2,'/fees/bank-master/view',NULL,NULL,1432554645,1432554645),('/fees/default/*',2,'/fees/default/*',NULL,NULL,1432554645,1432554645),('/fees/default/index',2,'/fees/default/index',NULL,NULL,1432554645,1432554645),('/fees/dependent/*',2,'/fees/dependent/*',NULL,NULL,1432554645,1432554645),('/fees/dependent/get-fees-category',2,'/fees/dependent/get-fees-category',NULL,NULL,1432554645,1432554645),('/fees/fees-category-details/*',2,'/fees/fees-category-details/*',NULL,NULL,1432554646,1432554646),('/fees/fees-category-details/create',2,'/fees/fees-category-details/create',NULL,NULL,1432554645,1432554645),('/fees/fees-category-details/delete',2,'/fees/fees-category-details/delete',NULL,NULL,1432554646,1432554646),('/fees/fees-category-details/index',2,'/fees/fees-category-details/index',NULL,NULL,1432554645,1432554645),('/fees/fees-category-details/update',2,'/fees/fees-category-details/update',NULL,NULL,1432554646,1432554646),('/fees/fees-category-details/view',2,'/fees/fees-category-details/view',NULL,NULL,1432554645,1432554645),('/fees/fees-collect-category/*',2,'/fees/fees-collect-category/*',NULL,NULL,1432554646,1432554646),('/fees/fees-collect-category/create',2,'/fees/fees-collect-category/create',NULL,NULL,1432554646,1432554646),('/fees/fees-collect-category/delete',2,'/fees/fees-collect-category/delete',NULL,NULL,1432554646,1432554646),('/fees/fees-collect-category/index',2,'/fees/fees-collect-category/index',NULL,NULL,1432554646,1432554646),('/fees/fees-collect-category/toggle',2,'/fees/fees-collect-category/toggle',NULL,NULL,1432554646,1432554646),('/fees/fees-collect-category/update',2,'/fees/fees-collect-category/update',NULL,NULL,1432554646,1432554646),('/fees/fees-collect-category/view',2,'/fees/fees-collect-category/view',NULL,NULL,1432554646,1432554646),('/fees/fees-payment-transaction/*',2,'/fees/fees-payment-transaction/*',NULL,NULL,1432554646,1432554646),('/fees/fees-payment-transaction/collect',2,'/fees/fees-payment-transaction/collect',NULL,NULL,1432554646,1432554646),('/fees/fees-payment-transaction/delete',2,'/fees/fees-payment-transaction/delete',NULL,NULL,1432554646,1432554646),('/fees/fees-payment-transaction/export-fcc-wise-fees-pdf',2,'/fees/fees-payment-transaction/export-fcc-wise-fees-pdf',NULL,NULL,1432554646,1432554646),('/fees/fees-payment-transaction/pay-fees',2,'/fees/fees-payment-transaction/pay-fees',NULL,NULL,1432554646,1432554646),('/fees/fees-payment-transaction/print-common-receipt',2,'/fees/fees-payment-transaction/print-common-receipt',NULL,NULL,1432554646,1432554646),('/fees/fees-payment-transaction/stu-fees-data',2,'/fees/fees-payment-transaction/stu-fees-data',NULL,NULL,1432554646,1432554646),('/fees/fees-payment-transaction/update',2,'/fees/fees-payment-transaction/update',NULL,NULL,1432554646,1432554646),('/fees/fees-payment-transaction/view',2,'/fees/fees-payment-transaction/view',NULL,NULL,1432554646,1432554646),('/gii/*',2,'/gii/*',NULL,NULL,1432554652,1432554652),('/gii/default/*',2,'/gii/default/*',NULL,NULL,1432554652,1432554652),('/gii/default/action',2,'/gii/default/action',NULL,NULL,1432554652,1432554652),('/gii/default/diff',2,'/gii/default/diff',NULL,NULL,1432554652,1432554652),('/gii/default/index',2,'/gii/default/index',NULL,NULL,1432554651,1432554651),('/gii/default/preview',2,'/gii/default/preview',NULL,NULL,1432554651,1432554651),('/gii/default/view',2,'/gii/default/view',NULL,NULL,1432554651,1432554651),('/languages/*',2,'/languages/*',NULL,NULL,1432554654,1432554654),('/languages/create',2,'/languages/create',NULL,NULL,1432554654,1432554654),('/languages/delete',2,'/languages/delete',NULL,NULL,1432554654,1432554654),('/languages/index',2,'/languages/index',NULL,NULL,1432554653,1432554653),('/languages/update',2,'/languages/update',NULL,NULL,1432554654,1432554654),('/languages/view',2,'/languages/view',NULL,NULL,1432554654,1432554654),('/login-details/*',2,'/login-details/*',NULL,NULL,1432554654,1432554654),('/login-details/create',2,'/login-details/create',NULL,NULL,1432554654,1432554654),('/login-details/delete',2,'/login-details/delete',NULL,NULL,1432554654,1432554654),('/login-details/index',2,'/login-details/index',NULL,NULL,1432554654,1432554654),('/login-details/update',2,'/login-details/update',NULL,NULL,1432554654,1432554654),('/login-details/view',2,'/login-details/view',NULL,NULL,1432554654,1432554654),('/national-holidays/*',2,'/national-holidays/*',NULL,NULL,1432554654,1432554654),('/national-holidays/create',2,'/national-holidays/create',NULL,NULL,1432554654,1432554654),('/national-holidays/delete',2,'/national-holidays/delete',NULL,NULL,1432554654,1432554654),('/national-holidays/index',2,'/national-holidays/index',NULL,NULL,1432554654,1432554654),('/national-holidays/update',2,'/national-holidays/update',NULL,NULL,1432554654,1432554654),('/national-holidays/view',2,'/national-holidays/view',NULL,NULL,1432554654,1432554654),('/nationality/*',2,'/nationality/*',NULL,NULL,1432554655,1432554655),('/nationality/create',2,'/nationality/create',NULL,NULL,1432554654,1432554654),('/nationality/delete',2,'/nationality/delete',NULL,NULL,1432554655,1432554655),('/nationality/index',2,'/nationality/index',NULL,NULL,1432554654,1432554654),('/nationality/update',2,'/nationality/update',NULL,NULL,1432554655,1432554655),('/nationality/view',2,'/nationality/view',NULL,NULL,1432554654,1432554654),('/organization/*',2,'/organization/*',NULL,NULL,1432554655,1432554655),('/organization/create',2,'/organization/create',NULL,NULL,1432554655,1432554655),('/organization/delete',2,'/organization/delete',NULL,NULL,1432554655,1432554655),('/organization/index',2,'/organization/index',NULL,NULL,1432554655,1432554655),('/organization/update',2,'/organization/update',NULL,NULL,1432554655,1432554655),('/organization/view',2,'/organization/view',NULL,NULL,1432554655,1432554655),('/report/*',2,'/report/*',NULL,NULL,1432554647,1432554647),('/report/default/*',2,'/report/default/*',NULL,NULL,1432554647,1432554647),('/report/default/index',2,'/report/default/index',NULL,NULL,1432554646,1432554646),('/report/dependent/*',2,'/report/dependent/*',NULL,NULL,1432554647,1432554647),('/report/dependent/index',2,'/report/dependent/index',NULL,NULL,1432554647,1432554647),('/report/dependent/studbatch',2,'/report/dependent/studbatch',NULL,NULL,1432554647,1432554647),('/report/dependent/studsection',2,'/report/dependent/studsection',NULL,NULL,1432554647,1432554647),('/report/empinforeport',2,'/report/empinforeport',NULL,NULL,1432554655,1432554655),('/report/employee/*',2,'/report/employee/*',NULL,NULL,1432554647,1432554647),('/report/employee/empinforeport',2,'/report/employee/empinforeport',NULL,NULL,1432554647,1432554647),('/report/employee/index',2,'/report/employee/index',NULL,NULL,1432554647,1432554647),('/report/employee/selected-employee-list',2,'/report/employee/selected-employee-list',NULL,NULL,1432554647,1432554647),('/report/index',2,'/report/index',NULL,NULL,1432554655,1432554655),('/report/selected-employee-list',2,'/report/selected-employee-list',NULL,NULL,1432554655,1432554655),('/report/selected-student-list',2,'/report/selected-student-list',NULL,NULL,1432554655,1432554655),('/report/student/*',2,'/report/student/*',NULL,NULL,1432554647,1432554647),('/report/student/index',2,'/report/student/index',NULL,NULL,1432554647,1432554647),('/report/student/selected-student-list',2,'/report/student/selected-student-list',NULL,NULL,1432554647,1432554647),('/report/student/stuinforeport',2,'/report/student/stuinforeport',NULL,NULL,1432554647,1432554647),('/report/stuinforeport',2,'/report/stuinforeport',NULL,NULL,1432554655,1432554655),('/rights/*',2,'/rights/*',NULL,NULL,1432554651,1432554651),('/rights/assignment/*',2,'/rights/assignment/*',NULL,NULL,1432554649,1432554649),('/rights/assignment/assign',2,'/rights/assignment/assign',NULL,NULL,1432554649,1432554649),('/rights/assignment/index',2,'/rights/assignment/index',NULL,NULL,1432554649,1432554649),('/rights/assignment/role-search',2,'/rights/assignment/role-search',NULL,NULL,1432554649,1432554649),('/rights/assignment/view',2,'/rights/assignment/view',NULL,NULL,1432554649,1432554649),('/rights/default/*',2,'/rights/default/*',NULL,NULL,1432554649,1432554649),('/rights/default/index',2,'/rights/default/index',NULL,NULL,1432554649,1432554649),('/rights/menu/*',2,'/rights/menu/*',NULL,NULL,1432554650,1432554650),('/rights/menu/create',2,'/rights/menu/create',NULL,NULL,1432554650,1432554650),('/rights/menu/delete',2,'/rights/menu/delete',NULL,NULL,1432554650,1432554650),('/rights/menu/index',2,'/rights/menu/index',NULL,NULL,1432554650,1432554650),('/rights/menu/update',2,'/rights/menu/update',NULL,NULL,1432554650,1432554650),('/rights/menu/view',2,'/rights/menu/view',NULL,NULL,1432554650,1432554650),('/rights/permission/*',2,'/rights/permission/*',NULL,NULL,1432554650,1432554650),('/rights/permission/assign',2,'/rights/permission/assign',NULL,NULL,1432554650,1432554650),('/rights/permission/create',2,'/rights/permission/create',NULL,NULL,1432554650,1432554650),('/rights/permission/delete',2,'/rights/permission/delete',NULL,NULL,1432554650,1432554650),('/rights/permission/index',2,'/rights/permission/index',NULL,NULL,1432554650,1432554650),('/rights/permission/role-search',2,'/rights/permission/role-search',NULL,NULL,1432554650,1432554650),('/rights/permission/update',2,'/rights/permission/update',NULL,NULL,1432554650,1432554650),('/rights/permission/view',2,'/rights/permission/view',NULL,NULL,1432554650,1432554650),('/rights/role/*',2,'/rights/role/*',NULL,NULL,1432554651,1432554651),('/rights/role/assign',2,'/rights/role/assign',NULL,NULL,1432554650,1432554650),('/rights/role/create',2,'/rights/role/create',NULL,NULL,1432554650,1432554650),('/rights/role/delete',2,'/rights/role/delete',NULL,NULL,1432554650,1432554650),('/rights/role/index',2,'/rights/role/index',NULL,NULL,1432554650,1432554650),('/rights/role/role-search',2,'/rights/role/role-search',NULL,NULL,1432554651,1432554651),('/rights/role/update',2,'/rights/role/update',NULL,NULL,1432554650,1432554650),('/rights/role/view',2,'/rights/role/view',NULL,NULL,1432554650,1432554650),('/rights/route/*',2,'/rights/route/*',NULL,NULL,1432554651,1432554651),('/rights/route/assign',2,'/rights/route/assign',NULL,NULL,1432554651,1432554651),('/rights/route/create',2,'/rights/route/create',NULL,NULL,1432554651,1432554651),('/rights/route/index',2,'/rights/route/index',NULL,NULL,1432554651,1432554651),('/rights/route/route-search',2,'/rights/route/route-search',NULL,NULL,1432554651,1432554651),('/rights/rule/*',2,'/rights/rule/*',NULL,NULL,1432554651,1432554651),('/rights/rule/create',2,'/rights/rule/create',NULL,NULL,1432554651,1432554651),('/rights/rule/delete',2,'/rights/rule/delete',NULL,NULL,1432554651,1432554651),('/rights/rule/index',2,'/rights/rule/index',NULL,NULL,1432554651,1432554651),('/rights/rule/update',2,'/rights/rule/update',NULL,NULL,1432554651,1432554651),('/rights/rule/view',2,'/rights/rule/view',NULL,NULL,1432554651,1432554651),('/site/*',2,'/site/*',NULL,NULL,1432554656,1432554656),('/site/about',2,'/site/about',NULL,NULL,1432554656,1432554656),('/site/captcha',2,'/site/captcha',NULL,NULL,1432554655,1432554655),('/site/contact',2,'/site/contact',NULL,NULL,1432554655,1432554655),('/site/error',2,'/site/error',NULL,NULL,1432554655,1432554655),('/site/forgotpassword',2,'/site/forgotpassword',NULL,NULL,1432554655,1432554655),('/site/index',2,'/site/index',NULL,NULL,1432554655,1432554655),('/site/loadimage',2,'/site/loadimage',NULL,NULL,1432554655,1432554655),('/site/login',2,'/site/login',NULL,NULL,1432554655,1432554655),('/site/logout',2,'/site/logout',NULL,NULL,1432554655,1432554655),('/state/*',2,'/state/*',NULL,NULL,1432554656,1432554656),('/state/create',2,'/state/create',NULL,NULL,1432554656,1432554656),('/state/delete',2,'/state/delete',NULL,NULL,1432554656,1432554656),('/state/index',2,'/state/index',NULL,NULL,1432554656,1432554656),('/state/update',2,'/state/update',NULL,NULL,1432554656,1432554656),('/state/view',2,'/state/view',NULL,NULL,1432554656,1432554656),('/student/*',2,'/student/*',NULL,NULL,1432554642,1432554642),('/student/default/*',2,'/student/default/*',NULL,NULL,1432554639,1432554639),('/student/default/index',2,'/student/default/index',NULL,NULL,1432554639,1432554639),('/student/dependent/*',2,'/student/dependent/*',NULL,NULL,1432554639,1432554639),('/student/dependent/studbatch',2,'/student/dependent/studbatch',NULL,NULL,1432554639,1432554639),('/student/dependent/studsection',2,'/student/dependent/studsection',NULL,NULL,1432554639,1432554639),('/student/dependent/ustud-c-city',2,'/student/dependent/ustud-c-city',NULL,NULL,1432554639,1432554639),('/student/dependent/ustud-c-state',2,'/student/dependent/ustud-c-state',NULL,NULL,1432554639,1432554639),('/student/dependent/ustud-p-city',2,'/student/dependent/ustud-p-city',NULL,NULL,1432554639,1432554639),('/student/dependent/ustud-p-state',2,'/student/dependent/ustud-p-state',NULL,NULL,1432554639,1432554639),('/student/export-data/*',2,'/student/export-data/*',NULL,NULL,1432554639,1432554639),('/student/export-data/student-profile-pdf',2,'/student/export-data/student-profile-pdf',NULL,NULL,1432554639,1432554639),('/student/stu-address/*',2,'/student/stu-address/*',NULL,NULL,1432554640,1432554640),('/student/stu-address/create',2,'/student/stu-address/create',NULL,NULL,1432554639,1432554639),('/student/stu-address/delete',2,'/student/stu-address/delete',NULL,NULL,1432554640,1432554640),('/student/stu-address/index',2,'/student/stu-address/index',NULL,NULL,1432554639,1432554639),('/student/stu-address/update',2,'/student/stu-address/update',NULL,NULL,1432554640,1432554640),('/student/stu-address/view',2,'/student/stu-address/view',NULL,NULL,1432554639,1432554639),('/student/stu-category/*',2,'/student/stu-category/*',NULL,NULL,1432554640,1432554640),('/student/stu-category/create',2,'/student/stu-category/create',NULL,NULL,1432554640,1432554640),('/student/stu-category/delete',2,'/student/stu-category/delete',NULL,NULL,1432554640,1432554640),('/student/stu-category/index',2,'/student/stu-category/index',NULL,NULL,1432554640,1432554640),('/student/stu-category/update',2,'/student/stu-category/update',NULL,NULL,1432554640,1432554640),('/student/stu-category/view',2,'/student/stu-category/view',NULL,NULL,1432554640,1432554640),('/student/stu-docs/*',2,'/student/stu-docs/*',NULL,NULL,1432554640,1432554640),('/student/stu-docs/create',2,'/student/stu-docs/create',NULL,NULL,1432554640,1432554640),('/student/stu-docs/delete',2,'/student/stu-docs/delete',NULL,NULL,1432554640,1432554640),('/student/stu-docs/index',2,'/student/stu-docs/index',NULL,NULL,1432554640,1432554640),('/student/stu-docs/update',2,'/student/stu-docs/update',NULL,NULL,1432554640,1432554640),('/student/stu-docs/view',2,'/student/stu-docs/view',NULL,NULL,1432554640,1432554640),('/student/stu-guardians/*',2,'/student/stu-guardians/*',NULL,NULL,1432554641,1432554641),('/student/stu-guardians/create',2,'/student/stu-guardians/create',NULL,NULL,1432554640,1432554640),('/student/stu-guardians/delete',2,'/student/stu-guardians/delete',NULL,NULL,1432554640,1432554640),('/student/stu-guardians/index',2,'/student/stu-guardians/index',NULL,NULL,1432554640,1432554640),('/student/stu-guardians/update',2,'/student/stu-guardians/update',NULL,NULL,1432554640,1432554640),('/student/stu-guardians/view',2,'/student/stu-guardians/view',NULL,NULL,1432554640,1432554640),('/student/stu-info/*',2,'/student/stu-info/*',NULL,NULL,1432554641,1432554641),('/student/stu-info/create',2,'/student/stu-info/create',NULL,NULL,1432554641,1432554641),('/student/stu-info/delete',2,'/student/stu-info/delete',NULL,NULL,1432554641,1432554641),('/student/stu-info/index',2,'/student/stu-info/index',NULL,NULL,1432554641,1432554641),('/student/stu-info/update',2,'/student/stu-info/update',NULL,NULL,1432554641,1432554641),('/student/stu-info/view',2,'/student/stu-info/view',NULL,NULL,1432554641,1432554641),('/student/stu-master/*',2,'/student/stu-master/*',NULL,NULL,1432554641,1432554641),('/student/stu-master/adddocs',2,'/student/stu-master/adddocs',NULL,NULL,1432554641,1432554641),('/student/stu-master/addguardian',2,'/student/stu-master/addguardian',NULL,NULL,1432554641,1432554641),('/student/stu-master/change-status',2,'/student/stu-master/change-status',NULL,NULL,1432554641,1432554641),('/student/stu-master/create',2,'/student/stu-master/create',NULL,NULL,1432554641,1432554641),('/student/stu-master/delete',2,'/student/stu-master/delete',NULL,NULL,1432554641,1432554641),('/student/stu-master/delete-doc',2,'/student/stu-master/delete-doc',NULL,NULL,1432554641,1432554641),('/student/stu-master/docs-download',2,'/student/stu-master/docs-download',NULL,NULL,1432554641,1432554641),('/student/stu-master/emg-change-status',2,'/student/stu-master/emg-change-status',NULL,NULL,1432554641,1432554641),('/student/stu-master/index',2,'/student/stu-master/index',NULL,NULL,1432554641,1432554641),('/student/stu-master/stu-photo',2,'/student/stu-master/stu-photo',NULL,NULL,1432554641,1432554641),('/student/stu-master/update',2,'/student/stu-master/update',NULL,NULL,1432554641,1432554641),('/student/stu-master/view',2,'/student/stu-master/view',NULL,NULL,1432554641,1432554641),('/student/stu-status/*',2,'/student/stu-status/*',NULL,NULL,1432554642,1432554642),('/student/stu-status/create',2,'/student/stu-status/create',NULL,NULL,1432554642,1432554642),('/student/stu-status/delete',2,'/student/stu-status/delete',NULL,NULL,1432554642,1432554642),('/student/stu-status/index',2,'/student/stu-status/index',NULL,NULL,1432554641,1432554641),('/student/stu-status/update',2,'/student/stu-status/update',NULL,NULL,1432554642,1432554642),('/student/stu-status/view',2,'/student/stu-status/view',NULL,NULL,1432554642,1432554642),('/subject-master/*',2,'/subject-master/*',NULL,NULL,1432554656,1432554656),('/subject-master/create',2,'/subject-master/create',NULL,NULL,1432554656,1432554656),('/subject-master/delete',2,'/subject-master/delete',NULL,NULL,1432554656,1432554656),('/subject-master/index',2,'/subject-master/index',NULL,NULL,1432554656,1432554656),('/subject-master/update',2,'/subject-master/update',NULL,NULL,1432554656,1432554656),('/subject-master/view',2,'/subject-master/view',NULL,NULL,1432554656,1432554656),('/user/*',2,'/user/*',NULL,NULL,1432554657,1432554657),('/user/change',2,'/user/change',NULL,NULL,1432554656,1432554656),('/user/create',2,'/user/create',NULL,NULL,1432554656,1432554656),('/user/delete',2,'/user/delete',NULL,NULL,1432554656,1432554656),('/user/index',2,'/user/index',NULL,NULL,1432554656,1432554656),('/user/resetemploginid',2,'/user/resetemploginid',NULL,NULL,1432554657,1432554657),('/user/resetemppassword',2,'/user/resetemppassword',NULL,NULL,1432554657,1432554657),('/user/resetstudloginid',2,'/user/resetstudloginid',NULL,NULL,1432554657,1432554657),('/user/resetstudpassword',2,'/user/resetstudpassword',NULL,NULL,1432554657,1432554657),('/user/update',2,'/user/update',NULL,NULL,1432554656,1432554656),('/user/update-emp-password',2,'/user/update-emp-password',NULL,NULL,1432554657,1432554657),('/user/update-stud-password',2,'/user/update-stud-password',NULL,NULL,1432554657,1432554657),('/user/updateemploginid',2,'/user/updateemploginid',NULL,NULL,1432554657,1432554657),('/user/updatestudloginid',2,'/user/updatestudloginid',NULL,NULL,1432554657,1432554657),('/user/view',2,'/user/view',NULL,NULL,1432554656,1432554656),('Configuration',2,'Access Configuration views',NULL,NULL,1429870570,1430298672),('Employee',1,'Employee',NULL,NULL,1422967395,1430299553),('Rights',2,'Access Rights Module Link',NULL,NULL,1430227237,1431776281),('Student',1,'Student',NULL,NULL,1422958231,1422958231),('SuperAdmin',1,'SuperAdmin',NULL,NULL,1422957183,1422957183),('updateAllEmpInfo',2,'Update Employee all details',NULL,NULL,1430979242,1430979242),('updateAllStuInfo',2,'Update Student all details',NULL,NULL,1430913145,1430913145);
/*!40000 ALTER TABLE `auth_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_item_child`
--

DROP TABLE IF EXISTS `auth_item_child`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_item_child` (
  `parent` varchar(64) NOT NULL,
  `child` varchar(64) NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`),
  CONSTRAINT `auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_item_child`
--

LOCK TABLES `auth_item_child` WRITE;
/*!40000 ALTER TABLE `auth_item_child` DISABLE KEYS */;
INSERT INTO `auth_item_child` VALUES ('SuperAdmin','/*'),('SuperAdmin','/auth-assignment/*'),('SuperAdmin','/auth-assignment/create'),('SuperAdmin','/auth-assignment/delete'),('SuperAdmin','/auth-assignment/index'),('SuperAdmin','/auth-assignment/update'),('SuperAdmin','/auth-assignment/view'),('SuperAdmin','/city/*'),('SuperAdmin','/city/create'),('SuperAdmin','/city/delete'),('SuperAdmin','/city/index'),('SuperAdmin','/city/update'),('SuperAdmin','/city/view'),('SuperAdmin','/country/*'),('SuperAdmin','/country/create'),('SuperAdmin','/country/delete'),('SuperAdmin','/country/index'),('SuperAdmin','/country/update'),('SuperAdmin','/country/view'),('SuperAdmin','/course/*'),('SuperAdmin','/course/batches/*'),('SuperAdmin','/course/batches/create'),('SuperAdmin','/course/batches/delete'),('SuperAdmin','/course/batches/index'),('SuperAdmin','/course/batches/toggle'),('SuperAdmin','/course/batches/update'),('SuperAdmin','/course/batches/view'),('SuperAdmin','/course/courses/*'),('SuperAdmin','/course/courses/create'),('SuperAdmin','/course/courses/delete'),('Employee','/course/courses/index'),('Student','/course/courses/index'),('SuperAdmin','/course/courses/index'),('SuperAdmin','/course/courses/toggle'),('SuperAdmin','/course/courses/update'),('SuperAdmin','/course/courses/view'),('SuperAdmin','/course/default/*'),('Employee','/course/default/index'),('Student','/course/default/index'),('SuperAdmin','/course/default/index'),('SuperAdmin','/course/section/*'),('SuperAdmin','/course/section/create'),('SuperAdmin','/course/section/delete'),('SuperAdmin','/course/section/index'),('SuperAdmin','/course/section/toggle'),('SuperAdmin','/course/section/update'),('SuperAdmin','/course/section/view'),('SuperAdmin','/dashboard/*'),('SuperAdmin','/dashboard/default/*'),('SuperAdmin','/dashboard/default/index'),('SuperAdmin','/dashboard/events/*'),('SuperAdmin','/dashboard/events/add-event'),('SuperAdmin','/dashboard/events/event-delete'),('SuperAdmin','/dashboard/events/index'),('SuperAdmin','/dashboard/events/update-event'),('SuperAdmin','/dashboard/events/view'),('Employee','/dashboard/events/view-events'),('Student','/dashboard/events/view-events'),('SuperAdmin','/dashboard/events/view-events'),('SuperAdmin','/dashboard/msg-of-day/*'),('SuperAdmin','/dashboard/msg-of-day/create'),('SuperAdmin','/dashboard/msg-of-day/delete'),('SuperAdmin','/dashboard/msg-of-day/index'),('SuperAdmin','/dashboard/msg-of-day/toggle'),('SuperAdmin','/dashboard/msg-of-day/update'),('SuperAdmin','/dashboard/msg-of-day/view'),('SuperAdmin','/dashboard/notice/*'),('SuperAdmin','/dashboard/notice/create'),('SuperAdmin','/dashboard/notice/delete'),('SuperAdmin','/dashboard/notice/index'),('SuperAdmin','/dashboard/notice/notice-file'),('SuperAdmin','/dashboard/notice/toggle'),('SuperAdmin','/dashboard/notice/update'),('SuperAdmin','/dashboard/notice/view'),('Employee','/dashboard/notice/view-popup'),('Student','/dashboard/notice/view-popup'),('SuperAdmin','/dashboard/notice/view-popup'),('SuperAdmin','/debug/*'),('SuperAdmin','/debug/default/*'),('SuperAdmin','/debug/default/download-mail'),('SuperAdmin','/debug/default/index'),('SuperAdmin','/debug/default/toolbar'),('SuperAdmin','/debug/default/view'),('SuperAdmin','/default/*'),('SuperAdmin','/default/index'),('Employee','/dependent/*'),('SuperAdmin','/dependent/*'),('SuperAdmin','/dependent/getcity'),('SuperAdmin','/dependent/getorgcity'),('SuperAdmin','/dependent/getorgstate'),('SuperAdmin','/dependent/getstate'),('SuperAdmin','/dependent/index'),('SuperAdmin','/dependent/studbatch'),('SuperAdmin','/dependent/studsection'),('SuperAdmin','/document-category/*'),('SuperAdmin','/document-category/create'),('SuperAdmin','/document-category/delete'),('SuperAdmin','/document-category/index'),('SuperAdmin','/document-category/update'),('SuperAdmin','/document-category/view'),('SuperAdmin','/employee/*'),('SuperAdmin','/employee/default/*'),('Employee','/employee/default/index'),('Student','/employee/default/index'),('SuperAdmin','/employee/default/index'),('Employee','/employee/dependent/*'),('SuperAdmin','/employee/dependent/*'),('SuperAdmin','/employee/dependent/emp-c-city'),('SuperAdmin','/employee/dependent/emp-c-state'),('SuperAdmin','/employee/dependent/emp-p-city'),('SuperAdmin','/employee/dependent/emp-p-state'),('SuperAdmin','/employee/emp-address/*'),('SuperAdmin','/employee/emp-address/create'),('SuperAdmin','/employee/emp-address/delete'),('SuperAdmin','/employee/emp-address/index'),('SuperAdmin','/employee/emp-address/update'),('SuperAdmin','/employee/emp-address/view'),('SuperAdmin','/employee/emp-category/*'),('SuperAdmin','/employee/emp-category/create'),('SuperAdmin','/employee/emp-category/delete'),('SuperAdmin','/employee/emp-category/index'),('SuperAdmin','/employee/emp-category/update'),('SuperAdmin','/employee/emp-category/view'),('SuperAdmin','/employee/emp-department/*'),('SuperAdmin','/employee/emp-department/create'),('SuperAdmin','/employee/emp-department/delete'),('SuperAdmin','/employee/emp-department/index'),('SuperAdmin','/employee/emp-department/update'),('SuperAdmin','/employee/emp-department/view'),('SuperAdmin','/employee/emp-designation/*'),('SuperAdmin','/employee/emp-designation/create'),('SuperAdmin','/employee/emp-designation/delete'),('SuperAdmin','/employee/emp-designation/index'),('SuperAdmin','/employee/emp-designation/update'),('SuperAdmin','/employee/emp-designation/view'),('SuperAdmin','/employee/emp-docs/*'),('SuperAdmin','/employee/emp-docs/create'),('SuperAdmin','/employee/emp-docs/delete'),('SuperAdmin','/employee/emp-docs/index'),('SuperAdmin','/employee/emp-docs/update'),('SuperAdmin','/employee/emp-docs/view'),('SuperAdmin','/employee/emp-info/*'),('SuperAdmin','/employee/emp-info/create'),('SuperAdmin','/employee/emp-info/delete'),('SuperAdmin','/employee/emp-info/index'),('SuperAdmin','/employee/emp-info/update'),('SuperAdmin','/employee/emp-info/view'),('SuperAdmin','/employee/emp-master/*'),('SuperAdmin','/employee/emp-master/adddocs'),('SuperAdmin','/employee/emp-master/change-status'),('SuperAdmin','/employee/emp-master/create'),('SuperAdmin','/employee/emp-master/delete'),('SuperAdmin','/employee/emp-master/delete-doc'),('SuperAdmin','/employee/emp-master/docs-download'),('Employee','/employee/emp-master/emp-photo'),('SuperAdmin','/employee/emp-master/emp-photo'),('Employee','/employee/emp-master/index'),('Student','/employee/emp-master/index'),('SuperAdmin','/employee/emp-master/index'),('Employee','/employee/emp-master/update'),('SuperAdmin','/employee/emp-master/update'),('Employee','/employee/emp-master/view'),('SuperAdmin','/employee/emp-master/view'),('SuperAdmin','/employee/emp-status/*'),('SuperAdmin','/employee/emp-status/create'),('SuperAdmin','/employee/emp-status/delete'),('SuperAdmin','/employee/emp-status/index'),('SuperAdmin','/employee/emp-status/update'),('SuperAdmin','/employee/emp-status/view'),('SuperAdmin','/employee/export-data/*'),('Employee','/employee/export-data/employee-profile-pdf'),('SuperAdmin','/employee/export-data/employee-profile-pdf'),('SuperAdmin','/export-data/*'),('SuperAdmin','/export-data/export-excel'),('SuperAdmin','/export-data/export-to-pdf'),('SuperAdmin','/fees/*'),('SuperAdmin','/fees/bank-master/*'),('SuperAdmin','/fees/bank-master/create'),('SuperAdmin','/fees/bank-master/delete'),('SuperAdmin','/fees/bank-master/index'),('SuperAdmin','/fees/bank-master/update'),('SuperAdmin','/fees/bank-master/view'),('SuperAdmin','/fees/default/*'),('Student','/fees/default/index'),('SuperAdmin','/fees/default/index'),('SuperAdmin','/fees/dependent/*'),('SuperAdmin','/fees/dependent/get-fees-category'),('SuperAdmin','/fees/fees-category-details/*'),('SuperAdmin','/fees/fees-category-details/create'),('SuperAdmin','/fees/fees-category-details/delete'),('SuperAdmin','/fees/fees-category-details/index'),('SuperAdmin','/fees/fees-category-details/update'),('SuperAdmin','/fees/fees-category-details/view'),('SuperAdmin','/fees/fees-collect-category/*'),('SuperAdmin','/fees/fees-collect-category/create'),('SuperAdmin','/fees/fees-collect-category/delete'),('SuperAdmin','/fees/fees-collect-category/index'),('SuperAdmin','/fees/fees-collect-category/toggle'),('SuperAdmin','/fees/fees-collect-category/update'),('SuperAdmin','/fees/fees-collect-category/view'),('SuperAdmin','/fees/fees-payment-transaction/*'),('SuperAdmin','/fees/fees-payment-transaction/collect'),('SuperAdmin','/fees/fees-payment-transaction/delete'),('SuperAdmin','/fees/fees-payment-transaction/export-fcc-wise-fees-pdf'),('SuperAdmin','/fees/fees-payment-transaction/pay-fees'),('SuperAdmin','/fees/fees-payment-transaction/print-common-receipt'),('Student','/fees/fees-payment-transaction/stu-fees-data'),('SuperAdmin','/fees/fees-payment-transaction/stu-fees-data'),('SuperAdmin','/fees/fees-payment-transaction/update'),('SuperAdmin','/fees/fees-payment-transaction/view'),('SuperAdmin','/gii/*'),('SuperAdmin','/gii/default/*'),('SuperAdmin','/gii/default/action'),('SuperAdmin','/gii/default/diff'),('SuperAdmin','/gii/default/index'),('SuperAdmin','/gii/default/preview'),('SuperAdmin','/gii/default/view'),('SuperAdmin','/languages/*'),('SuperAdmin','/languages/create'),('SuperAdmin','/languages/delete'),('SuperAdmin','/languages/index'),('SuperAdmin','/languages/update'),('SuperAdmin','/languages/view'),('SuperAdmin','/login-details/*'),('SuperAdmin','/login-details/create'),('SuperAdmin','/login-details/delete'),('SuperAdmin','/login-details/index'),('SuperAdmin','/login-details/update'),('SuperAdmin','/login-details/view'),('SuperAdmin','/national-holidays/*'),('SuperAdmin','/national-holidays/create'),('SuperAdmin','/national-holidays/delete'),('SuperAdmin','/national-holidays/index'),('SuperAdmin','/national-holidays/update'),('SuperAdmin','/national-holidays/view'),('SuperAdmin','/nationality/*'),('SuperAdmin','/nationality/create'),('SuperAdmin','/nationality/delete'),('SuperAdmin','/nationality/index'),('SuperAdmin','/nationality/update'),('SuperAdmin','/nationality/view'),('SuperAdmin','/organization/*'),('SuperAdmin','/organization/create'),('SuperAdmin','/organization/delete'),('SuperAdmin','/organization/index'),('SuperAdmin','/organization/update'),('SuperAdmin','/organization/view'),('SuperAdmin','/report/*'),('SuperAdmin','/report/default/*'),('Employee','/report/default/index'),('SuperAdmin','/report/default/index'),('Employee','/report/dependent/*'),('SuperAdmin','/report/dependent/*'),('SuperAdmin','/report/dependent/index'),('SuperAdmin','/report/dependent/studbatch'),('SuperAdmin','/report/dependent/studsection'),('Employee','/report/empinforeport'),('SuperAdmin','/report/empinforeport'),('SuperAdmin','/report/employee/*'),('Employee','/report/employee/empinforeport'),('SuperAdmin','/report/employee/empinforeport'),('SuperAdmin','/report/employee/index'),('Employee','/report/employee/selected-employee-list'),('SuperAdmin','/report/employee/selected-employee-list'),('SuperAdmin','/report/index'),('Employee','/report/selected-employee-list'),('SuperAdmin','/report/selected-employee-list'),('Employee','/report/selected-student-list'),('SuperAdmin','/report/selected-student-list'),('SuperAdmin','/report/student/*'),('SuperAdmin','/report/student/index'),('Employee','/report/student/selected-student-list'),('SuperAdmin','/report/student/selected-student-list'),('Employee','/report/student/stuinforeport'),('SuperAdmin','/report/student/stuinforeport'),('Employee','/report/stuinforeport'),('SuperAdmin','/report/stuinforeport'),('SuperAdmin','/rights/*'),('SuperAdmin','/rights/assignment/*'),('SuperAdmin','/rights/assignment/assign'),('SuperAdmin','/rights/assignment/index'),('SuperAdmin','/rights/assignment/role-search'),('SuperAdmin','/rights/assignment/view'),('SuperAdmin','/rights/default/*'),('SuperAdmin','/rights/default/index'),('SuperAdmin','/rights/menu/*'),('SuperAdmin','/rights/menu/create'),('SuperAdmin','/rights/menu/delete'),('SuperAdmin','/rights/menu/index'),('SuperAdmin','/rights/menu/update'),('SuperAdmin','/rights/menu/view'),('SuperAdmin','/rights/permission/*'),('SuperAdmin','/rights/permission/assign'),('SuperAdmin','/rights/permission/create'),('SuperAdmin','/rights/permission/delete'),('SuperAdmin','/rights/permission/index'),('SuperAdmin','/rights/permission/role-search'),('SuperAdmin','/rights/permission/update'),('SuperAdmin','/rights/permission/view'),('SuperAdmin','/rights/role/*'),('SuperAdmin','/rights/role/assign'),('SuperAdmin','/rights/role/create'),('SuperAdmin','/rights/role/delete'),('SuperAdmin','/rights/role/index'),('SuperAdmin','/rights/role/role-search'),('SuperAdmin','/rights/role/update'),('SuperAdmin','/rights/role/view'),('SuperAdmin','/rights/route/*'),('SuperAdmin','/rights/route/assign'),('SuperAdmin','/rights/route/create'),('SuperAdmin','/rights/route/index'),('SuperAdmin','/rights/route/route-search'),('SuperAdmin','/rights/rule/*'),('SuperAdmin','/rights/rule/create'),('SuperAdmin','/rights/rule/delete'),('SuperAdmin','/rights/rule/index'),('SuperAdmin','/rights/rule/update'),('SuperAdmin','/rights/rule/view'),('SuperAdmin','/site/*'),('SuperAdmin','/site/about'),('SuperAdmin','/site/captcha'),('SuperAdmin','/site/contact'),('SuperAdmin','/site/error'),('SuperAdmin','/site/forgotpassword'),('SuperAdmin','/site/index'),('SuperAdmin','/site/loadimage'),('SuperAdmin','/site/login'),('SuperAdmin','/site/logout'),('SuperAdmin','/state/*'),('SuperAdmin','/state/create'),('SuperAdmin','/state/delete'),('SuperAdmin','/state/index'),('SuperAdmin','/state/update'),('SuperAdmin','/state/view'),('SuperAdmin','/student/*'),('SuperAdmin','/student/default/*'),('Employee','/student/default/index'),('SuperAdmin','/student/default/index'),('SuperAdmin','/student/dependent/*'),('SuperAdmin','/student/dependent/studbatch'),('SuperAdmin','/student/dependent/studsection'),('SuperAdmin','/student/dependent/ustud-c-city'),('SuperAdmin','/student/dependent/ustud-c-state'),('SuperAdmin','/student/dependent/ustud-p-city'),('SuperAdmin','/student/dependent/ustud-p-state'),('SuperAdmin','/student/export-data/*'),('SuperAdmin','/student/export-data/student-profile-pdf'),('SuperAdmin','/student/stu-address/*'),('SuperAdmin','/student/stu-address/create'),('SuperAdmin','/student/stu-address/delete'),('SuperAdmin','/student/stu-address/index'),('SuperAdmin','/student/stu-address/update'),('SuperAdmin','/student/stu-address/view'),('SuperAdmin','/student/stu-category/*'),('SuperAdmin','/student/stu-category/create'),('SuperAdmin','/student/stu-category/delete'),('SuperAdmin','/student/stu-category/index'),('SuperAdmin','/student/stu-category/update'),('SuperAdmin','/student/stu-category/view'),('SuperAdmin','/student/stu-docs/*'),('SuperAdmin','/student/stu-docs/create'),('SuperAdmin','/student/stu-docs/delete'),('SuperAdmin','/student/stu-docs/index'),('SuperAdmin','/student/stu-docs/update'),('SuperAdmin','/student/stu-docs/view'),('SuperAdmin','/student/stu-guardians/*'),('SuperAdmin','/student/stu-guardians/create'),('SuperAdmin','/student/stu-guardians/delete'),('SuperAdmin','/student/stu-guardians/index'),('SuperAdmin','/student/stu-guardians/update'),('SuperAdmin','/student/stu-guardians/view'),('SuperAdmin','/student/stu-info/*'),('SuperAdmin','/student/stu-info/create'),('SuperAdmin','/student/stu-info/delete'),('SuperAdmin','/student/stu-info/index'),('SuperAdmin','/student/stu-info/update'),('SuperAdmin','/student/stu-info/view'),('SuperAdmin','/student/stu-master/*'),('SuperAdmin','/student/stu-master/adddocs'),('SuperAdmin','/student/stu-master/addguardian'),('SuperAdmin','/student/stu-master/change-status'),('SuperAdmin','/student/stu-master/create'),('SuperAdmin','/student/stu-master/delete'),('SuperAdmin','/student/stu-master/delete-doc'),('SuperAdmin','/student/stu-master/docs-download'),('SuperAdmin','/student/stu-master/emg-change-status'),('Employee','/student/stu-master/index'),('SuperAdmin','/student/stu-master/index'),('SuperAdmin','/student/stu-master/stu-photo'),('SuperAdmin','/student/stu-master/update'),('Employee','/student/stu-master/view'),('Student','/student/stu-master/view'),('SuperAdmin','/student/stu-master/view'),('SuperAdmin','/student/stu-status/*'),('SuperAdmin','/student/stu-status/create'),('SuperAdmin','/student/stu-status/delete'),('SuperAdmin','/student/stu-status/index'),('SuperAdmin','/student/stu-status/update'),('SuperAdmin','/student/stu-status/view'),('SuperAdmin','/subject-master/*'),('SuperAdmin','/subject-master/create'),('SuperAdmin','/subject-master/delete'),('SuperAdmin','/subject-master/index'),('SuperAdmin','/subject-master/update'),('SuperAdmin','/subject-master/view'),('SuperAdmin','/user/*'),('Employee','/user/change'),('Student','/user/change'),('SuperAdmin','/user/change'),('SuperAdmin','/user/create'),('SuperAdmin','/user/delete'),('SuperAdmin','/user/index'),('SuperAdmin','/user/resetemploginid'),('SuperAdmin','/user/resetemppassword'),('SuperAdmin','/user/resetstudloginid'),('SuperAdmin','/user/resetstudpassword'),('SuperAdmin','/user/update'),('SuperAdmin','/user/update-emp-password'),('SuperAdmin','/user/update-stud-password'),('SuperAdmin','/user/updateemploginid'),('SuperAdmin','/user/updatestudloginid'),('SuperAdmin','/user/view'),('SuperAdmin','Configuration'),('SuperAdmin','Rights'),('SuperAdmin','updateAllEmpInfo'),('SuperAdmin','updateAllStuInfo');
/*!40000 ALTER TABLE `auth_item_child` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_rule`
--

DROP TABLE IF EXISTS `auth_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_rule` (
  `name` varchar(64) NOT NULL,
  `data` text,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_rule`
--

LOCK TABLES `auth_rule` WRITE;
/*!40000 ALTER TABLE `auth_rule` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bank_master`
--

DROP TABLE IF EXISTS `bank_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bank_master` (
  `bank_master_id` int(11) NOT NULL AUTO_INCREMENT,
  `bank_master_name` varchar(255) NOT NULL,
  `bank_alias` varchar(10) NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `is_status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`bank_master_id`),
  UNIQUE KEY `bank_master_name` (`bank_master_name`),
  UNIQUE KEY `bank_alias` (`bank_alias`),
  KEY `updated_by` (`updated_by`),
  KEY `created_by` (`created_by`),
  CONSTRAINT `bank_master_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `bank_master_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bank_master`
--

LOCK TABLES `bank_master` WRITE;
/*!40000 ALTER TABLE `bank_master` DISABLE KEYS */;
INSERT INTO `bank_master` VALUES (1,'Bank of America','BOA','2015-05-27 16:45:39',1,NULL,NULL,0),(2,'Bank of India','BOI','2015-05-27 16:45:45',1,NULL,NULL,0),(3,'Bank of Chicago','BOC','2015-05-27 16:45:52',1,NULL,NULL,0),(4,'Bank of Baroda','BOB','2015-05-27 16:46:01',1,NULL,NULL,0),(5,'Vellay Bank','VB','2015-05-27 16:46:09',1,NULL,NULL,0);
/*!40000 ALTER TABLE `bank_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `batches`
--

DROP TABLE IF EXISTS `batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `batches` (
  `batch_id` int(11) NOT NULL AUTO_INCREMENT,
  `batch_name` varchar(120) NOT NULL,
  `batch_course_id` int(11) NOT NULL,
  `batch_alias` varchar(35) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `is_status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`batch_id`),
  UNIQUE KEY `batch_name` (`batch_name`,`batch_course_id`),
  UNIQUE KEY `batch_alias` (`batch_alias`),
  KEY `batch_course_id` (`batch_course_id`),
  KEY `created_by` (`created_by`),
  KEY `updated_by` (`updated_by`),
  CONSTRAINT `batches_ibfk_3` FOREIGN KEY (`batch_course_id`) REFERENCES `courses` (`course_id`),
  CONSTRAINT `batches_ibfk_4` FOREIGN KEY (`created_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `batches_ibfk_5` FOREIGN KEY (`updated_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `batches`
--

LOCK TABLES `batches` WRITE;
/*!40000 ALTER TABLE `batches` DISABLE KEYS */;
INSERT INTO `batches` VALUES (1,'MCA-Batch-01',1,'mca-batch-01','2015-01-01','2015-07-31','2015-05-27 15:28:16',1,NULL,NULL,0),(2,'BCA-Batch-01',2,'bca-batch-01','2015-01-01','2015-07-31','2015-05-27 15:29:11',1,NULL,NULL,0),(3,'MSCIT-Batch-01',3,'mscit-batch-01','2015-01-01','2015-07-31','2015-05-27 15:30:35',1,NULL,NULL,0),(4,'BSCIT-Batch-01',4,'bscit-batch-01','2015-01-01','2015-07-31','2015-05-27 15:32:34',1,NULL,NULL,0),(5,'MBA-Batch-01',5,'mba-batch-01','2015-01-01','2015-07-31','2015-05-27 15:33:32',1,NULL,NULL,0);
/*!40000 ALTER TABLE `batches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bur_balance_sheet`
--

DROP TABLE IF EXISTS `bur_balance_sheet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bur_balance_sheet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `trip_id` int(11) NOT NULL,
  `amount` float NOT NULL,
  `status` enum('open','closed') NOT NULL,
  `to_or_from` enum('to','from') NOT NULL,
  `created_on` date NOT NULL,
  `updated_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bur_balance_sheet`
--

LOCK TABLES `bur_balance_sheet` WRITE;
/*!40000 ALTER TABLE `bur_balance_sheet` DISABLE KEYS */;
INSERT INTO `bur_balance_sheet` VALUES (2,1,2,123,'open','to','2016-10-15','2016-10-15 07:50:25'),(3,1,3,1234,'open','to','2016-10-15','2016-10-15 07:50:43');
/*!40000 ALTER TABLE `bur_balance_sheet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bur_customer_details`
--

DROP TABLE IF EXISTS `bur_customer_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bur_customer_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `place` varchar(250) NOT NULL,
  `address` text NOT NULL,
  `account_details` text NOT NULL,
  `customer_type` int(11) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `vehicle` int(11) NOT NULL,
  `earning_percentage` decimal(4,2) NOT NULL,
  `status` varchar(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bur_customer_details`
--

LOCK TABLES `bur_customer_details` WRITE;
/*!40000 ALTER TABLE `bur_customer_details` DISABLE KEYS */;
INSERT INTO `bur_customer_details` VALUES (1,'Haris','Peringala','okok','okok',1,'89898989',0,0.00,'1');
/*!40000 ALTER TABLE `bur_customer_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bur_customer_material_price`
--

DROP TABLE IF EXISTS `bur_customer_material_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bur_customer_material_price` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `material_id` int(11) NOT NULL,
  `price` float(8,2) NOT NULL,
  `status` varchar(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bur_customer_material_price`
--

LOCK TABLES `bur_customer_material_price` WRITE;
/*!40000 ALTER TABLE `bur_customer_material_price` DISABLE KEYS */;
INSERT INTO `bur_customer_material_price` VALUES (1,1,3,20.00,'1');
/*!40000 ALTER TABLE `bur_customer_material_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bur_customer_type`
--

DROP TABLE IF EXISTS `bur_customer_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bur_customer_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `description` text NOT NULL,
  `status` varchar(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bur_customer_type`
--

LOCK TABLES `bur_customer_type` WRITE;
/*!40000 ALTER TABLE `bur_customer_type` DISABLE KEYS */;
INSERT INTO `bur_customer_type` VALUES (1,'Buyer','','1'),(2,'Seller','','1');
/*!40000 ALTER TABLE `bur_customer_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bur_driver_details`
--

DROP TABLE IF EXISTS `bur_driver_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bur_driver_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `address` text NOT NULL,
  `dob` datetime NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `vehicle` varchar(15) NOT NULL,
  `earning_percentage` varchar(10) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bur_driver_details`
--

LOCK TABLES `bur_driver_details` WRITE;
/*!40000 ALTER TABLE `bur_driver_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `bur_driver_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bur_expenses`
--

DROP TABLE IF EXISTS `bur_expenses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bur_expenses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `vehicle_id` int(11) NOT NULL,
  `description` varchar(100) NOT NULL,
  `amount` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `vehicle_id` (`vehicle_id`),
  KEY `vehicle_id_2` (`vehicle_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bur_expenses`
--

LOCK TABLES `bur_expenses` WRITE;
/*!40000 ALTER TABLE `bur_expenses` DISABLE KEYS */;
/*!40000 ALTER TABLE `bur_expenses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bur_form_input_table`
--

DROP TABLE IF EXISTS `bur_form_input_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bur_form_input_table` (
  `field_input_id` int(11) NOT NULL AUTO_INCREMENT,
  `field_name` varchar(75) NOT NULL,
  `field_display_name` varchar(250) NOT NULL,
  `form_id` int(11) NOT NULL,
  `field_type` enum('text','select','radio','checkbox','textarea','file') NOT NULL,
  `field_refference_table` varchar(125) NOT NULL,
  `field_condition` text NOT NULL,
  `fields_involved` varchar(250) NOT NULL,
  `attributes` varchar(250) NOT NULL,
  `use_table_feature` int(1) NOT NULL,
  `validation` varchar(250) NOT NULL,
  `record_status` int(1) NOT NULL DEFAULT '1',
  `sort_order` int(11) NOT NULL,
  PRIMARY KEY (`field_input_id`),
  KEY `form_id` (`form_id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bur_form_input_table`
--

LOCK TABLES `bur_form_input_table` WRITE;
/*!40000 ALTER TABLE `bur_form_input_table` DISABLE KEYS */;
INSERT INTO `bur_form_input_table` VALUES (14,'name','Vehicle Name',1,'text','','','','class=\'input\'',1,'required',1,1),(15,'type','Vehicle Type',1,'select','vehicle_type','status=1','id,name','',1,'required',1,2),(16,'vehicle_number','Vehicle Registration Number',1,'text','','','','class=\'input\'',1,'required',1,3),(17,'size','Vehicle Size',1,'text','','','','',1,'required',1,4),(22,'charge_per_km','Charge Per Kilometre',1,'text','','','','',1,'required',1,5),(23,'name','Material',2,'text','','','','',0,'required',1,1),(24,'description','Material Description',2,'textarea','','','','',1,'',1,2),(25,'measurement_type','Measurement Type',2,'select','measurement','status=1','id,name','',1,'required',1,3),(26,'name','Customer Name',3,'text','','','','',1,'required',1,1),(27,'place','Place',3,'text','','','','',1,'required',1,2),(28,'address','Address',3,'textarea','','','','',1,'required',1,3),(29,'account_details','Account Details',3,'textarea','','','','',1,'required',1,4),(30,'customer_type','Customer Type',3,'select','customer_type','status=1','id,name','',1,'required',1,5),(31,'phone','Customer contact number',3,'text','','','','',1,'required|numeric',1,6),(32,'name','Name of the driver',4,'text','','','','',0,'required',1,1),(33,'address','Address',4,'textarea','','','','',1,'required',1,2),(34,'dob','Date of Birth',4,'text','','','','class=\'datepicker\'',1,'',1,3),(35,'mobile','Mobile number',4,'text','','','','',1,'required|numeric',1,4),(36,'vehicle','Vehicle',4,'select','vehicle_details','status=1','id,vehicle_number','',1,'required',1,5),(37,'earning_percentage','Earning Percentage',4,'text','','','','',0,'required',1,6),(38,'field_name','Field name as per the table',5,'text','','','','',1,'',1,1),(39,'field_display_name','Display Field Name',5,'text','','','','',1,'',1,2),(40,'form_id','Form id number',5,'text','','','','',1,'',1,3),(41,'field_type','Field Type (input,select,checkbox,radio,file,textarea)',5,'radio','','','select|textarea|checkbox|file|radio|text','',1,'',1,4),(42,'field_refference_table','Table reference incase of dropdown',5,'text','','','','',1,'',1,5),(43,'field_condition','Table Condition',5,'textarea','','','','',1,'',1,6),(44,'fields_involved','Involved Selecting Fields',5,'text','','','','',0,'',1,7),(45,'attributes','Attributes like class',5,'text','','','','',1,'',1,8),(46,'use_table_feature','Use Table feature',5,'radio','','','Yes|No','',1,'',1,9),(47,'validation','Validation',5,'text','','','','',1,'',1,10),(48,'sort_order','Sort order',5,'text','','','','',1,'',1,11),(49,'date_of_travel','Date of Travel',6,'text','','','','class=\'datepicker\'',0,'required',1,1),(50,'vehicle_id','Vehicle',6,'select','vehicle_details','status=1','id,vehicle_number','',0,'required',1,2),(51,'driver_id','Driver',6,'select','driver_details','status=1','id,name','',0,'required',1,3),(52,'material_id','Material',6,'select','material_types','status=1','id,name','',0,'required',1,4),(53,'size','Size',6,'text','','','','',0,'required',1,5),(54,'measurement_type','Measurement',6,'select','measurement','status=1','id,name','',0,'required',1,6),(55,'seller','From',6,'select','cusomer_details','customer_type=2 AND status=1','id,name','',0,'required',1,7),(56,'buyer','To',6,'select','cusomer_details','customer_type=1 AND status=1','id,name','',0,'required',1,8),(57,'site_name','Site name',6,'text','','','','',0,'',1,9),(58,'site_place','Site Place',6,'text','','','','',0,'',1,10),(59,'kilometre','Kilometre',6,'text','','','','',0,'required',1,11),(60,'amount','Amount',6,'text','','','','',0,'required',1,12),(61,'vehicle_rent','Vehicle Rent',6,'text','','','','id=\'vehicle_rent\'',0,'required',1,13),(62,'total_amount','Total Amount',6,'text','','','','',0,'',1,14),(63,'amount_buyer','Amount from Buyer',6,'text','','','','',0,'',1,15),(65,'status','Status',1,'select','parameter','parameter_group=\'STATUS\' AND parameter_status=1','parameter_val,parameter_name','',0,'required',1,6),(66,'status','Status',2,'select','parameter','parameter_group=\'STATUS\' AND parameter_status=1','parameter_val,parameter_name','',0,'required',1,4),(67,'status','Status',3,'select','parameter','parameter_group=\'STATUS\' AND parameter_status=1','parameter_val,parameter_name','id=\'vehicle_rent\'',0,'required',1,7),(68,'status','Status',4,'select','parameter','parameter_group=\'STATUS\' AND parameter_status=1','parameter_val,parameter_name','',0,'required',1,7),(69,'buyer_trip_sheet_number','Buyer trip sheet number',6,'text','','','','',0,'',1,17),(70,'seller_trip_sheet_number','Seller Trip sheet number',6,'text','','','','',0,'',1,19);
/*!40000 ALTER TABLE `bur_form_input_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bur_material_types`
--

DROP TABLE IF EXISTS `bur_material_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bur_material_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `description` text NOT NULL,
  `measurement_type` int(11) NOT NULL,
  `status` varchar(1) NOT NULL DEFAULT '1',
  `price` decimal(6,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bur_material_types`
--

LOCK TABLES `bur_material_types` WRITE;
/*!40000 ALTER TABLE `bur_material_types` DISABLE KEYS */;
INSERT INTO `bur_material_types` VALUES (3,'Appam','',1,'1',25.00);
/*!40000 ALTER TABLE `bur_material_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bur_measurement`
--

DROP TABLE IF EXISTS `bur_measurement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bur_measurement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `description` text NOT NULL,
  `status` varchar(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bur_measurement`
--

LOCK TABLES `bur_measurement` WRITE;
/*!40000 ALTER TABLE `bur_measurement` DISABLE KEYS */;
INSERT INTO `bur_measurement` VALUES (1,'Feet','','1'),(2,'Numbers','','1');
/*!40000 ALTER TABLE `bur_measurement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bur_parameter`
--

DROP TABLE IF EXISTS `bur_parameter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bur_parameter` (
  `parameter_id` int(11) NOT NULL AUTO_INCREMENT,
  `parameter_name` varchar(250) NOT NULL,
  `parameter_val` varchar(250) NOT NULL,
  `parameter_desc` text NOT NULL,
  `parameter_group` varchar(250) NOT NULL,
  `parameter_status` int(11) NOT NULL,
  PRIMARY KEY (`parameter_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bur_parameter`
--

LOCK TABLES `bur_parameter` WRITE;
/*!40000 ALTER TABLE `bur_parameter` DISABLE KEYS */;
INSERT INTO `bur_parameter` VALUES (1,'Active','1','','STATUS',1),(2,'In Active','0','','STATUS',1);
/*!40000 ALTER TABLE `bur_parameter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bur_payments`
--

DROP TABLE IF EXISTS `bur_payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bur_payments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `trans_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `amount` float(12,2) NOT NULL,
  `to_or_from` enum('to','from') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bur_payments`
--

LOCK TABLES `bur_payments` WRITE;
/*!40000 ALTER TABLE `bur_payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `bur_payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bur_transactions`
--

DROP TABLE IF EXISTS `bur_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bur_transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `ivoice_amount` float NOT NULL,
  `previous_balance` float NOT NULL,
  `paid_amount` float NOT NULL,
  `paid_date` date NOT NULL,
  `balance` float NOT NULL,
  `sheet_ids` text,
  `from_sheet_id` int(11) NOT NULL,
  `to_sheet_id` int(11) NOT NULL,
  `created_on` date NOT NULL,
  `updated_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` enum('open','closed') NOT NULL DEFAULT 'open',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bur_transactions`
--

LOCK TABLES `bur_transactions` WRITE;
/*!40000 ALTER TABLE `bur_transactions` DISABLE KEYS */;
INSERT INTO `bur_transactions` VALUES (1,2,0,0,0,'0000-00-00',345,NULL,0,0,'2016-10-17','2016-10-17 06:38:44','closed');
/*!40000 ALTER TABLE `bur_transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bur_trips`
--

DROP TABLE IF EXISTS `bur_trips`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bur_trips` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_of_travel` datetime NOT NULL,
  `vehicle_id` int(11) NOT NULL,
  `driver_id` int(11) NOT NULL,
  `material_id` int(11) NOT NULL,
  `size` varchar(100) NOT NULL,
  `measurement_type` int(11) NOT NULL,
  `merchant` int(11) NOT NULL,
  `buyer` int(11) NOT NULL,
  `site_name` longtext NOT NULL,
  `site_place` varchar(250) NOT NULL,
  `kilometre` varchar(100) NOT NULL,
  `vehicle_rent` float(8,2) NOT NULL,
  `driver_amount` decimal(12,2) NOT NULL,
  `merchant_amount` decimal(12,2) NOT NULL,
  `buyer_amount` decimal(12,2) NOT NULL,
  `buyer_amount_total` decimal(12,2) NOT NULL,
  `buyer_trip_sheet_number` varchar(20) NOT NULL,
  `seller_trip_sheet_number` longtext NOT NULL,
  `ready_merchant` enum('no','yes') NOT NULL DEFAULT 'no',
  `ready_buyer` enum('no','yes') NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bur_trips`
--

LOCK TABLES `bur_trips` WRITE;
/*!40000 ALTER TABLE `bur_trips` DISABLE KEYS */;
INSERT INTO `bur_trips` VALUES (2,'2016-10-15 00:00:00',0,0,0,'',0,1,0,'tryrtyrty','','',0.00,0.00,123.00,0.00,0.00,'','345','no','no'),(3,'2016-10-15 00:00:00',0,0,0,'',0,1,0,'dfgdfgdfg','','',0.00,0.00,1234.00,0.00,0.00,'','333','no','no');
/*!40000 ALTER TABLE `bur_trips` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bur_vehicle_details`
--

DROP TABLE IF EXISTS `bur_vehicle_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bur_vehicle_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `type` int(11) NOT NULL,
  `vehicle_number` varchar(12) NOT NULL,
  `size` varchar(250) NOT NULL,
  `charge_per_km` varchar(15) NOT NULL,
  `status` varchar(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bur_vehicle_details`
--

LOCK TABLES `bur_vehicle_details` WRITE;
/*!40000 ALTER TABLE `bur_vehicle_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `bur_vehicle_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bur_vehicle_param_dates`
--

DROP TABLE IF EXISTS `bur_vehicle_param_dates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bur_vehicle_param_dates` (
  `vehicle_id` int(11) NOT NULL,
  `param_id` int(11) NOT NULL,
  `paid_date` date NOT NULL,
  `renewal_date` date NOT NULL,
  PRIMARY KEY (`vehicle_id`,`param_id`),
  KEY `param_id` (`param_id`),
  CONSTRAINT `bur_vehicle_param_dates_ibfk_1` FOREIGN KEY (`vehicle_id`) REFERENCES `bur_vehicle_details` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `bur_vehicle_param_dates_ibfk_2` FOREIGN KEY (`param_id`) REFERENCES `bur_vehicle_params` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bur_vehicle_param_dates`
--

LOCK TABLES `bur_vehicle_param_dates` WRITE;
/*!40000 ALTER TABLE `bur_vehicle_param_dates` DISABLE KEYS */;
/*!40000 ALTER TABLE `bur_vehicle_param_dates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bur_vehicle_params`
--

DROP TABLE IF EXISTS `bur_vehicle_params`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bur_vehicle_params` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(120) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bur_vehicle_params`
--

LOCK TABLES `bur_vehicle_params` WRITE;
/*!40000 ALTER TABLE `bur_vehicle_params` DISABLE KEYS */;
INSERT INTO `bur_vehicle_params` VALUES (1,'Kshema nidi'),(2,'Tax'),(3,'Insurance'),(4,'CC');
/*!40000 ALTER TABLE `bur_vehicle_params` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bur_vehicle_sizes`
--

DROP TABLE IF EXISTS `bur_vehicle_sizes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bur_vehicle_sizes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `size` varchar(250) NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bur_vehicle_sizes`
--

LOCK TABLES `bur_vehicle_sizes` WRITE;
/*!40000 ALTER TABLE `bur_vehicle_sizes` DISABLE KEYS */;
/*!40000 ALTER TABLE `bur_vehicle_sizes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bur_vehicle_type`
--

DROP TABLE IF EXISTS `bur_vehicle_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bur_vehicle_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `status` varchar(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bur_vehicle_type`
--

LOCK TABLES `bur_vehicle_type` WRITE;
/*!40000 ALTER TABLE `bur_vehicle_type` DISABLE KEYS */;
INSERT INTO `bur_vehicle_type` VALUES (1,'Tipper','1'),(2,'Lorry','1');
/*!40000 ALTER TABLE `bur_vehicle_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `city` (
  `city_id` int(11) NOT NULL AUTO_INCREMENT,
  `city_name` varchar(35) NOT NULL,
  `city_state_id` int(11) NOT NULL,
  `city_country_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `is_status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`city_id`),
  UNIQUE KEY `city_name` (`city_name`,`city_state_id`),
  KEY `created_by` (`created_by`),
  KEY `updated_by` (`updated_by`),
  KEY `city_state_id` (`city_state_id`),
  KEY `city_country_id` (`city_country_id`),
  CONSTRAINT `city_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `city_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `city_ibfk_3` FOREIGN KEY (`city_state_id`) REFERENCES `state` (`state_id`),
  CONSTRAINT `city_ibfk_4` FOREIGN KEY (`city_country_id`) REFERENCES `country` (`country_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city`
--

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
INSERT INTO `city` VALUES (1,'Ahmedabad',1,1,'2015-05-27 15:21:02',1,NULL,NULL,0),(2,'Gandhinagar',1,1,'2015-05-27 15:21:10',1,NULL,NULL,0),(3,'Mumbai',2,1,'2015-05-27 15:21:19',1,NULL,NULL,0),(4,'MarryLand',3,2,'2015-05-27 15:21:38',1,NULL,NULL,0),(5,'Sydney',4,3,'2015-05-27 15:21:47',1,NULL,NULL,0),(6,'Jamnagar',1,1,'2015-05-27 16:20:54',1,NULL,NULL,0),(7,'Surat',1,1,'2015-05-27 16:21:01',1,NULL,NULL,0),(8,'Pune',2,1,'2015-05-27 16:21:13',1,NULL,NULL,0),(9,'Nagpur',2,1,'2015-05-27 16:21:27',1,NULL,NULL,0),(10,'Solapur',2,1,'2015-05-27 16:23:22',1,NULL,NULL,0),(11,'Elizabethtown',5,2,'2015-05-27 16:25:06',1,NULL,NULL,0),(12,'Burlington',5,2,'2015-05-27 16:25:17',1,NULL,NULL,0),(13,'James Lorimer',4,3,'2015-05-27 16:26:22',1,NULL,NULL,0),(14,'Carlton',4,3,'2015-05-27 16:26:38',1,NULL,NULL,0),(15,'Sydney',8,3,'2015-05-27 16:27:11',1,NULL,NULL,0),(16,'Junagadh',1,1,'2015-05-28 11:20:51',1,NULL,NULL,0),(17,'Rajkot',1,1,'2015-05-28 11:21:00',1,NULL,NULL,0),(18,'Vadodara',1,1,'2015-05-28 11:21:10',1,NULL,NULL,0),(19,'Sacramento',9,2,'2015-05-28 11:22:49',1,NULL,NULL,0);
/*!40000 ALTER TABLE `city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `country` (
  `country_id` int(11) NOT NULL AUTO_INCREMENT,
  `country_name` varchar(35) NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `is_status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`country_id`),
  UNIQUE KEY `country_name` (`country_name`),
  KEY `updated_by` (`updated_by`),
  KEY `created_by` (`created_by`),
  CONSTRAINT `country_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `country_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country`
--

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
INSERT INTO `country` VALUES (1,'India','2015-05-27 15:19:22',1,NULL,NULL,0),(2,'America','2015-05-27 15:19:27',1,NULL,NULL,0),(3,'Australia','2015-05-27 15:19:45',1,NULL,NULL,0),(4,'England','2015-05-27 16:17:18',1,'2015-05-27 16:19:21',1,0),(5,'France','2015-09-19 14:28:19',1,'2015-09-19 14:28:27',1,2);
/*!40000 ALTER TABLE `country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courses` (
  `course_id` int(11) NOT NULL AUTO_INCREMENT,
  `course_name` varchar(100) NOT NULL,
  `course_code` varchar(50) NOT NULL,
  `course_alias` varchar(35) NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `is_status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`course_id`),
  UNIQUE KEY `course_name` (`course_name`,`course_code`),
  KEY `updated_by` (`updated_by`),
  KEY `created_by` (`created_by`),
  CONSTRAINT `courses_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `courses_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses`
--

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
INSERT INTO `courses` VALUES (1,'MCA','MCA151','mca','2015-05-27 15:28:16',1,NULL,NULL,0),(2,'BCA','BCA-221','bca','2015-05-27 15:29:11',1,NULL,NULL,0),(3,'M.Sc.IT','MSC231','msc.it','2015-05-27 15:30:35',1,'2015-05-27 15:39:56',1,0),(4,'B.Sc.IT','BSCIT881','bscit','2015-05-27 15:32:34',1,NULL,NULL,0),(5,'MBA','MBA891','mba','2015-05-27 15:33:32',1,NULL,NULL,0);
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `document_category`
--

DROP TABLE IF EXISTS `document_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `document_category` (
  `doc_category_id` int(11) NOT NULL AUTO_INCREMENT,
  `doc_category_name` varchar(50) NOT NULL,
  `doc_category_user_type` char(2) NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `is_status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`doc_category_id`),
  UNIQUE KEY `doc_category_name` (`doc_category_name`,`doc_category_user_type`),
  KEY `created_by` (`created_by`),
  KEY `updated_by` (`updated_by`),
  CONSTRAINT `document_category_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `document_category_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `document_category`
--

LOCK TABLES `document_category` WRITE;
/*!40000 ALTER TABLE `document_category` DISABLE KEYS */;
INSERT INTO `document_category` VALUES (1,'S.S.C. Marksheet','0','2015-05-27 15:22:07',1,NULL,NULL,0),(2,'H.S.C. Marksheet','0','2015-05-27 15:22:16',1,NULL,NULL,0),(3,'Leaving Certificate','0','2015-05-27 15:22:25',1,NULL,NULL,0),(4,'Bonafied Certificate','S','2015-05-27 15:22:32',1,NULL,NULL,0),(5,'Experience Certificate','E','2015-05-27 15:22:39',1,NULL,NULL,0),(6,'Migration Certificate','S','2015-05-27 15:22:51',1,NULL,NULL,0);
/*!40000 ALTER TABLE `document_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emp_address`
--

DROP TABLE IF EXISTS `emp_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emp_address` (
  `emp_address_id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_cadd` varchar(255) DEFAULT NULL,
  `emp_cadd_city` int(11) DEFAULT NULL,
  `emp_cadd_state` int(11) DEFAULT NULL,
  `emp_cadd_country` int(11) DEFAULT NULL,
  `emp_cadd_pincode` int(11) DEFAULT NULL,
  `emp_cadd_house_no` varchar(25) DEFAULT NULL,
  `emp_cadd_phone_no` varchar(25) DEFAULT NULL,
  `emp_padd` varchar(255) DEFAULT NULL,
  `emp_padd_city` int(11) DEFAULT NULL,
  `emp_padd_state` int(11) DEFAULT NULL,
  `emp_padd_country` int(11) DEFAULT NULL,
  `emp_padd_pincode` int(11) DEFAULT NULL,
  `emp_padd_house_no` varchar(25) DEFAULT NULL,
  `emp_padd_phone_no` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`emp_address_id`),
  KEY `emp_cadd_city` (`emp_cadd_city`),
  KEY `emp_cadd_state` (`emp_cadd_state`),
  KEY `emp_cadd_country` (`emp_cadd_country`),
  KEY `emp_padd_city` (`emp_padd_city`),
  KEY `emp_padd_state` (`emp_padd_state`),
  KEY `emp_padd_country` (`emp_padd_country`),
  CONSTRAINT `emp_address_ibfk_1` FOREIGN KEY (`emp_cadd_city`) REFERENCES `city` (`city_id`),
  CONSTRAINT `emp_address_ibfk_2` FOREIGN KEY (`emp_cadd_state`) REFERENCES `state` (`state_id`),
  CONSTRAINT `emp_address_ibfk_3` FOREIGN KEY (`emp_cadd_country`) REFERENCES `country` (`country_id`),
  CONSTRAINT `emp_address_ibfk_4` FOREIGN KEY (`emp_padd_city`) REFERENCES `city` (`city_id`),
  CONSTRAINT `emp_address_ibfk_5` FOREIGN KEY (`emp_padd_state`) REFERENCES `state` (`state_id`),
  CONSTRAINT `emp_address_ibfk_6` FOREIGN KEY (`emp_padd_country`) REFERENCES `country` (`country_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emp_address`
--

LOCK TABLES `emp_address` WRITE;
/*!40000 ALTER TABLE `emp_address` DISABLE KEYS */;
INSERT INTO `emp_address` VALUES (1,'B-21 Kirtan Appartment,Nehrunagar, ahmedabad',1,1,1,698596,'21','079-85965236','795 E DRAGRAM, TUCSON AZ 85705,  USA',4,3,2,968596,'795','201-598569'),(2,'K-303, Jaldhara Appartments, Naranpura',1,1,1,385400,'303','079-36526363','\"Anand\", Friends Villa, S.P.Patel Road,',7,1,1,562356,'50/123','0268-52365214'),(3,'F-102, Surya City,Maninagar',1,1,1,385400,'F-102','079-58748596','F-102,Surya City, Maninagar',1,1,1,385400,'F-102','079-58748596'),(4,'H-801, Shivakali Flats, Near Shivranjani,',1,1,1,385400,'H-801','079-52556323','\"Shivalik\",  Vibhusha Bunglows,Vadodara',18,1,1,859696,'88','0789-52415263'),(5,'G-1005, Green Vally,Opp L.D.College, Panjarapol.',2,1,1,385400,'G-1005','079-58452111','H/998, Ashray, Mangalya Society,Jamnagar.',6,1,1,589685,'H/998','079-58421222'),(6,'madhav Society,Sector-3, Gha-3',2,1,1,859685,'85','079-58968523','Satyam Flats, BTNAgar, ThakkarNagar',1,1,1,385400,'65','079-55221142'),(7,'A-901, Ocean11, Manek Baug',1,1,1,385400,'901','079-85554455',' Kamalkunj Society,Sector-19,',8,2,1,969696,'E-504,','023-89568958'),(8,' MEGASYSTEMS INC, 799 E DRAGRAM SUITE 5A, TUCSON AZ 85705,  USA',4,3,2,889988,'856','201-859685',' MEGASYSTEMS INC,  SUITE 5A-1204,   799 E DRAGRAM, TUCSON AZ 85705,  USA',4,3,2,889988,'857','202-859685'),(9,'K-405, Vande Matram,Near Prathna Residency, Nikol,',1,1,1,385400,'405','079-85968574','24/589, Stavan Residency, Bhaikaka  Nagar Road, Pune-East',8,2,1,858585,'24','023-85632563'),(10,'B-253,Vasant Vihar, Giridhar Nagar,Opp.Bank of Baroda,Shahibaug',1,1,1,385400,'B-253','079-58585858','G-104,Shyam Vihar ,Shashtri Nagar, Opp.Sunrise Mall,',1,1,1,385400,'B-253','079-58585858'),(11,'12, Shantikunj Society,Nr.Tulip English Medium School, New Ranip',1,1,1,385400,'12','079-85858525','205,Megh-Malhar Avenue, Sector-2,opp.Waminarayan Temple,',2,1,1,385406,'205','079-52636342'),(12,'F-705, Aryan Homes, PrahladNagar Road,',1,1,1,385400,'','','7100 Athens Place,Washington, DC 20521-7100,   USA\r\n   ',4,3,2,852352,'7100','206-8589654'),(13,'A-402, Samrat Flats,Nr. Kameshvar School, Vejalpur',1,1,1,385400,'402','079-8321452','D/23, Sargam Society,Gala Gymkhana Road,Opp.Sales India,',6,1,1,856325,'23','079-85123666'),(14,'123/45,Bhavya Park Society,,Ramvadi,Raiya Road,',17,1,1,385400,'123/45','079-85963256','G-805,Indravadan Avenue, Naranpura, opp. D-Mart Mall,Nr. Vyas vadi,',17,1,1,362500,'805','0283-8563256'),(15,'A-10009,Antariksha Flats, Vijay Cross Road',1,1,1,385400,'10009','079-8532652','A-10009,Antariksha Flats, Vijay Cross Road',1,1,1,385400,'1009','079-8532652'),(16,'C-306, Iscon Flower,Bopal Circle,Bopal Approach',1,1,1,385400,'306','079-85965254','234/53, Gandhi-Park Society,Virat Nagar, Nr. ST Colony',7,1,1,856325,'234/53','0268-85963652'),(17,'21 Kirksway Place,Townsville',5,4,3,232323,'21','321-85632552','201 Walker St Townsville Queensland',5,4,3,232323,'201','321-56239685');
/*!40000 ALTER TABLE `emp_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emp_category`
--

DROP TABLE IF EXISTS `emp_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emp_category` (
  `emp_category_id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_category_name` varchar(50) NOT NULL,
  `emp_category_alias` varchar(10) NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `is_status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`emp_category_id`),
  UNIQUE KEY `emp_category_name` (`emp_category_name`),
  UNIQUE KEY `emp_category_alias` (`emp_category_alias`),
  KEY `updated_by` (`updated_by`),
  KEY `created_by` (`created_by`),
  CONSTRAINT `emp_category_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `emp_category_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emp_category`
--

LOCK TABLES `emp_category` WRITE;
/*!40000 ALTER TABLE `emp_category` DISABLE KEYS */;
INSERT INTO `emp_category` VALUES (1,'Regular','regular','2015-05-27 15:46:59',1,NULL,NULL,0),(2,'Rejoin','rejoin','2015-05-27 15:47:11',1,NULL,NULL,0),(3,'Resign','resign','2015-05-27 15:47:18',1,NULL,NULL,0),(4,'Transfer','transfer','2015-05-27 15:47:25',1,NULL,NULL,0);
/*!40000 ALTER TABLE `emp_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emp_department`
--

DROP TABLE IF EXISTS `emp_department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emp_department` (
  `emp_department_id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_department_name` varchar(65) NOT NULL,
  `emp_department_alias` varchar(10) NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `is_status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`emp_department_id`),
  UNIQUE KEY `emp_department_name` (`emp_department_name`),
  UNIQUE KEY `emp_department_alias` (`emp_department_alias`),
  KEY `updated_by` (`updated_by`),
  KEY `created_by` (`created_by`),
  CONSTRAINT `emp_department_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `emp_department_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emp_department`
--

LOCK TABLES `emp_department` WRITE;
/*!40000 ALTER TABLE `emp_department` DISABLE KEYS */;
INSERT INTO `emp_department` VALUES (1,'MCA Department','MCA Dept','2015-05-27 15:43:24',1,NULL,NULL,0),(2,'BCA Department','BCA Dept','2015-05-27 15:43:41',1,NULL,NULL,0),(3,'MBA Department','MBA Dept','2015-05-27 15:43:49',1,NULL,NULL,0),(4,'B.Sc.IT Department','B.Sc.IT ','2015-05-27 15:44:31',1,NULL,NULL,0),(5,'M.Sc.IT Department','M.Sc.IT','2015-05-27 15:44:54',1,NULL,NULL,0);
/*!40000 ALTER TABLE `emp_department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emp_designation`
--

DROP TABLE IF EXISTS `emp_designation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emp_designation` (
  `emp_designation_id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_designation_name` varchar(50) NOT NULL,
  `emp_designation_alias` varchar(10) NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `is_status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`emp_designation_id`),
  UNIQUE KEY `emp_designation_name` (`emp_designation_name`),
  UNIQUE KEY `emp_designation_alias` (`emp_designation_alias`),
  KEY `created_by` (`created_by`),
  KEY `updated_by` (`updated_by`),
  CONSTRAINT `emp_designation_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `emp_designation_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emp_designation`
--

LOCK TABLES `emp_designation` WRITE;
/*!40000 ALTER TABLE `emp_designation` DISABLE KEYS */;
INSERT INTO `emp_designation` VALUES (1,'Head of Department','HOD','2015-05-27 15:45:22',1,NULL,NULL,0),(2,'Assistant Professor','Assi.Prof.','2015-05-27 15:45:36',1,NULL,NULL,0),(3,'Associate Professor','Asso.Prof.','2015-05-27 15:45:45',1,NULL,NULL,0),(4,'Peon','peon','2015-05-27 15:45:56',1,NULL,NULL,0),(5,'Librarian','Librarian','2015-05-27 15:46:09',1,NULL,NULL,0),(6,'Admin','Admin','2015-05-27 15:46:22',1,NULL,NULL,0),(7,'Senior Clerk','Sr.Clerk','2015-05-27 15:46:34',1,NULL,NULL,0);
/*!40000 ALTER TABLE `emp_designation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emp_info`
--

DROP TABLE IF EXISTS `emp_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emp_info` (
  `emp_info_id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_unique_id` int(11) NOT NULL,
  `emp_attendance_card_id` varchar(50) DEFAULT NULL,
  `emp_title` varchar(5) DEFAULT NULL,
  `emp_first_name` varchar(35) NOT NULL,
  `emp_middle_name` varchar(35) DEFAULT NULL,
  `emp_last_name` varchar(35) NOT NULL,
  `emp_name_alias` varchar(10) DEFAULT NULL,
  `emp_mother_name` varchar(50) DEFAULT NULL,
  `emp_gender` varchar(10) DEFAULT NULL,
  `emp_dob` date DEFAULT NULL,
  `emp_religion` varchar(50) DEFAULT NULL,
  `emp_bloodgroup` varchar(10) NOT NULL DEFAULT 'Unknown',
  `emp_joining_date` date DEFAULT NULL,
  `emp_birthplace` varchar(50) DEFAULT NULL,
  `emp_email_id` varchar(65) DEFAULT NULL,
  `emp_maritalstatus` varchar(35) DEFAULT NULL,
  `emp_mobile_no` bigint(12) DEFAULT NULL,
  `emp_photo` varchar(150) DEFAULT NULL,
  `emp_languages` varchar(255) DEFAULT NULL,
  `emp_bankaccount_no` varchar(25) DEFAULT NULL,
  `emp_qualification` varchar(50) DEFAULT NULL,
  `emp_specialization` varchar(255) DEFAULT NULL,
  `emp_experience_year` tinyint(2) DEFAULT NULL,
  `emp_experience_month` tinyint(2) DEFAULT NULL,
  `emp_hobbies` varchar(100) DEFAULT NULL,
  `emp_reference` varchar(35) DEFAULT NULL,
  `emp_guardian_name` varchar(65) DEFAULT NULL,
  `emp_guardian_relation` varchar(30) DEFAULT NULL,
  `emp_guardian_qualification` varchar(50) DEFAULT NULL,
  `emp_guardian_occupation` varchar(50) DEFAULT NULL,
  `emp_guardian_income` varchar(50) DEFAULT NULL,
  `emp_guardian_homeadd` varchar(255) DEFAULT NULL,
  `emp_guardian_officeadd` varchar(255) DEFAULT NULL,
  `emp_guardian_mobile_no` bigint(12) DEFAULT NULL,
  `emp_guardian_phone_no` varchar(25) DEFAULT NULL,
  `emp_guardian_email_id` varchar(65) DEFAULT NULL,
  `emp_info_emp_master_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`emp_info_id`),
  UNIQUE KEY `emp_unique_id` (`emp_unique_id`),
  UNIQUE KEY `emp_info_emp_master_id` (`emp_info_emp_master_id`),
  UNIQUE KEY `emp_email_id` (`emp_email_id`),
  UNIQUE KEY `emp_mobile_no` (`emp_mobile_no`),
  UNIQUE KEY `emp_attendance_card_id` (`emp_attendance_card_id`),
  KEY `emp_info_emp_master_id_fgn` (`emp_info_emp_master_id`),
  CONSTRAINT `emp_info_ibfk_3` FOREIGN KEY (`emp_info_emp_master_id`) REFERENCES `emp_master` (`emp_master_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emp_info`
--

LOCK TABLES `emp_info` WRITE;
/*!40000 ALTER TABLE `emp_info` DISABLE KEYS */;
INSERT INTO `emp_info` VALUES (1,1,'8596452563','Mr.','John','Andrew','Doson','JAD','Susane','MALE','1983-06-22','Christian','B-','2014-01-01','Chicago','john_doson@gmail.com','MARRIED',9865986598,'','English,German','52416396857485',NULL,'Python, Magento,Yii ,PHP,Maths',5,2,'Reading, Teaching,Travelling','Dr.Hamid','Andrew','Father','Master of Computer Scienc','Job','560000','AB/ Park Aven Street, Arthirs Corner,East.','125/586, Elen Street, First Crian, ',8585968596,'201-2563251','andrew@yahoo.com',1),(2,2,'8574858585','Mr.','Anand','Pareshbhai','Patel','APP','Ritaben','MALE','1985-07-05','Hindu','B+','2015-01-01','Jamnagar','anand.patel@gmail.com','MARRIED',7775658565,NULL,'Gujarati,English,German,Hindi','85965656487585',NULL,'JAVA,Networking,Graphics,Android,PHP,Python,C',10,4,'Surfing,Reading,Writting','janak Bhai Patel','Pinakinbhai','Brother','M.Tech','Govt .Officer','750000','33, Nilgagan Society,M.G.Road,Rajkot','R &D Department,Jilla Panchayat Office,Vaibhav Chowk,',7458963256,'0287-23569856','pinakin@yahoo.com',2),(3,3,'7485748596','Ms.','Punita','NarotamBhai','Raval','PNR','Charulataben','FEMALE','1988-07-03','Hindu','O+','2015-01-01','Una','punita@gmail.com','MARRIED',7485967485,NULL,'English,Gujarati,Hindi','85741236547896',NULL,'Maths,Python,IOS',6,3,'Surfing,Developing','Vishal Raval','NArotambhai','Father','B.Tech','JOB','750000','45- Baleshwar Upvan, Nr.Railway Station,Ahmedabad','123, Orchid Plaza,Opp Bank of Baroda,Vadaj,Ahmedabad',7458963256,'0287-23569856','narotambhair@gmail.com',3),(4,4,'8596566556','Mr.','Abhishek','A','Shah','AAS','NishaBen','MALE','1983-06-22','Hindu','A+','2014-01-01','Anand','abhishek.shah@gmail.com','UNMARRIED',8596363633,NULL,'English,Gujarati,Hindi,French','85632548596856',NULL,'Yii,Python,PHP,Magento,JAVA',4,2,'Surfing.Travelling,','Mr.Jay Shah','Kamalbhai','Brother','B.Com','Job','280000','44, RadhaNagar, BT NAGAR,Anand\r\n','R &D Department, Jilla Panchayat Office, Vaibhav Chowk.',8585968596,'0287-23569856','kamal@gmail.com',4),(5,5,'8596745685','Prof.','Aniket','Kamalbhai','Patel','AKP','Ramaben','MALE','1988-06-16','Hindu','B-','2015-01-14','Rajkot','aniket.patel123@gmail.com','MARRIED',8596745685,NULL,'English,Hindi,German','596589565656565',NULL,'JAVA,Networking,Graphics,Android,PHP,Python,C',3,3,'Reading, Teaching,Travelling','','Ranvir','Brother','B.E. Mechanical','Job','560000','Sringar REsidency,Sector-2,Gandhinagar','12/58, Chinubhai Tower,Ashram Road,Ahmedabad',NULL,'','ranvir125@yahoo.com',5),(6,6,'8574855565','Ms.','Anjali','K','Ramani','AKR','Ashaben','FEMALE','1985-07-17','Hindu','A+','2015-01-06','Junagadh','abnju.anju@gmail.com','UNMARRIED',8855664477,NULL,'English,Gujarati,German','85965544544545',NULL,'Networking, Graphics, Animation,CSS',2,1,'Shopping,Outing,Writing,Reading','Dr.Ashish','Kishorbhai','Father','B.Com','Job','280000','D-585,Nalanda Appartment, Sumul Road,Surat','\"Anjali Investment\",Giriraj Road, Nr.ST Stand,Surat',8596748596,'0258-968574125','hishor_123@gmail.com',6),(7,7,'8565658585','Mr.','AshishShinh','J','Bhatia','AJB','Kantaben','MALE','1983-06-30','Hindu','B+','2015-02-11','Punjab','ashish@yahoo.com','MARRIED',8596857485,NULL,'English,French,Hindi,Punjabi','45857452365231',NULL,'Chemistry,Biology,PHP,Python,CSS3',11,2,'Eating,Singing,Surfing,Reading','Vinod Pillai','Gordhanbhai','Father','B.Com','Accountant','290000','5-C125, rushab Flats, Anand NAgar','Vandana Infptech Pvt.Ltd, Vadaj',7668559444,'0285-86957485','gordhan@yahoo.com',7),(8,8,'8454547858','Ms.','Paul','D','Diesel','PDD','ChampaBen','MALE','1985-06-10','Christian','A-','2015-01-13','California','pauldiesel@yahoo.com','UNMARRIED',5236524152,'Paul_8.jpeg','English,Gujarati,Hindi','45869854785698',NULL,'PHP, CSS3, HTML,JAVA,ANDROID,Wordpress,Magento',2,1,'Reading, Surfing','Dr.Hardik Patel','Vin ','Brother','B.Tech','Job','850000','75/856k, Easten Sider,Woolen Street','459-K Street, Riverside,',7458963256,'204-8596855','vin1234@yahoo.com',8),(9,9,'6585362563','Dr.','Kanan','Maheshbhai','Patel','KMP','RashmiBen','FEMALE','1985-07-27','Hindu','O-','2014-05-06','Junagadh','kanan.patel@gmail.com','MARRIED',8596748596,NULL,'Russian,English,Hindi,Gujarati,Punjabi','12365478596',NULL,'PHysics,Chemistry,Botony,Zoology,Maths',8,6,'Reading,Writing,Travelling','Mr. Rajan Varma','Maheshbhai','Father','M.Tech','Job','560000','124-Panchvati Circle, Nitara Flats\r\n','Second Floor, Aryan Arcade,Maninagar',8585252525,'079-36362563','maheshpatel@yahoo.com',9),(10,10,'1233214566','Mr.','Priyesh','M','Sanesara','PMS','Shantiben','MALE','1982-07-01','Hindu','B+','2015-01-01','Ahmedabad','priyesh@yahoo.com','MARRIED',8596363636,NULL,'English,Hindi,Gujarati,German','252563656235',NULL,'Marketing, Finance, Accounting.',10,3,'MArketing','Dr. Jhanvi Patel','Ashokbhai','Brother','M.Sc.','Bussiness','820000','604,Gunatit Appartments, Sumul Dairy Road,Surat','204,Podar Arcade, Nr.Garnala,Surat',8565859565,'079-85656565','ashoks@gmail.com',10),(11,11,'5632652341','Mr.','Akhilesh','Pareshbhai','Patel','APP','ManjulaBen','MALE','1983-07-20','Hindu','O+','2015-02-10','Rajkot','akhilesh11@gmail.com','MARRIED',7474585695,NULL,'English,Hindi,French','854555225552',NULL,'Maths,Science,English',4,NULL,'Reading,Adventure,Cooking','Prof.Arijit Shah','Markand Patel','Brother','B.Com','Job','350000','123/45, \"Ren Basera\",Amrut Nagar Society,Jodhpur Gam,Near Prernatirth Derasar Temple,, Ahmedabad','701, Sapath-iii, Prahladnagar Road',7474526341,'079-85656565','markand@gmail.com',11),(12,12,'1234567898','Ms.','Maria','Daniel','Cruse','MDC','Stella','MALE','1985-07-24','Christian','A+','2015-03-03','California','maria_cruse@gmail.com','MARRIED',8585968574,NULL,'English,French,Gujarati','125478542365',NULL,'Computer Networkin, JAVA, Android,C',4,3,'Reading, Teaching,Travelling','Jaydeep Patel','David ','Brother','Master of Computer Scienc','Job','850000',' 100 MAIN ST, PO BOX 1022, SEATTLE WA 98104, USA','300 BOYLSTON AVE E, SEATTLE WA 98102, USA',9889788767,'201-8569856','david_decoz@gmail.com',12),(13,13,'7545856535','Mr.','Kishor','Rameshbhai','Chavda','KRC','SonalBen','MALE','1981-08-28','Hindu','B-','2015-02-16','Rajkot','kishor.chavda@gmail.com','MARRIED',8596969685,NULL,'English,Gujarati,Hindi','52523662365252',NULL,'Android,Maths,Networking',3,4,'REading,Writing','Jaydeep Patel','GunjanBhai Chavda','Brother','BA','Job','280000','75,Surya City, Raiya Road,Rajkot','Stavan Arcade, Above Samsumg Show Room,Rajkot',8585858586,'0285-4658956','gunjan@gmail.com',13),(14,14,'8532658542','Ms.','Kinnari','Kishorbhai','Bhatt','KKB','MeenaBen Bhatt','FEMALE','1986-08-29','Hindu','Unknown','2015-03-10','Jamnagar','kinnari.bhatt@gmail.com','UNMARRIED',8569857485,NULL,'English,Hindi,Gujarati','158452365252',NULL,'C++, ComputerGraphics, Animation, Corel Draw, ',3,5,'Eating,Singing,Surfing,Reading','Janvi PAtel','Kunal Bhatt','Brother','M.Sc','Bussiness','850000','Kishor Kunj,  Postal Society,Nr. Best English School,junagadh','Anjali investment, Nr.M.G.Library, Janzarda Road',8523568595,'0875-56985696','kunal.bhatt@yahoo.com',14),(15,15,'1452254123','','Naresh','Rambhai','Chaudhary','NRC','HimaniBen','MALE','1989-07-11','Hindu','O-','2015-01-16','Anand','naresh@gmail.com','MARRIED',7936589658,'Naresh_15.jpeg','English,Gujarati,Hindi','12332156323652',NULL,'SRS,Documentation,Designing,PHP,CSS3',3,2,'Writing,Shopping','Dr.Sidhharth Shah','Niraj Chaudhary','Uncle','B.Com','Job','280000','K1051, Niharika Flats, Panjarapol','201,NewYork Plaza, Judges Buglow Road',7668559444,'079-85656565','niraj.c@gmail.com',15),(16,16,'1478523695','Ms.','Vaishali ','Maganbhai','Chaudhary','VMC','Sarojben','FEMALE','1982-08-18','Hindu','A+','2014-03-26','Rajkot','vaishali.chaudhary@gmail.com','MARRIED',8555564444,NULL,'English,Gujarati,Hindi,German','851245514212',NULL,'Management',7,2,'REading,Writing','Prof. Ashish Bareja','Raj Chaudhary','Brother','MCA ','Job','850000','25/11,Shyam Shikhar,Bapunagar Approach','B-201,info-tower,C.G.Road',8523568595,'079-7474745','raj.chaudhary@gmail.com',16),(17,17,'8596785858','Mr.','William','John','Smith','WJS','samantha','MALE','1983-07-21','Christian','AB+','2015-01-17','Sydney','william.smith@yahoo.com','UNMARRIED',8555656565,NULL,'English,Hindi,German,French','523252363332',NULL,'PHysics,Chemistry,Botony,Zoology,Maths',2,2,'Reading,Searching,','Mr. Bruice Willise','jason Smith','Brother','M.Tech','Bussiness','850000','158 St Georges Tce, PERTH WA','K-456/67, G street, First Avenue',88555565656,'206-6565352','jason.smith@gmail.com',17);
/*!40000 ALTER TABLE `emp_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emp_master`
--

DROP TABLE IF EXISTS `emp_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emp_master` (
  `emp_master_id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_master_emp_info_id` int(11) NOT NULL,
  `emp_master_user_id` int(11) NOT NULL,
  `emp_master_department_id` int(11) NOT NULL,
  `emp_master_designation_id` int(11) DEFAULT NULL,
  `emp_master_category_id` int(11) NOT NULL,
  `emp_master_nationality_id` int(11) DEFAULT NULL,
  `emp_master_emp_address_id` int(11) NOT NULL,
  `emp_master_status_id` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `is_status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`emp_master_id`),
  UNIQUE KEY `emp_master_user_id` (`emp_master_user_id`),
  UNIQUE KEY `emp_master_emp_info_id` (`emp_master_emp_info_id`),
  KEY `emp_master_department_id` (`emp_master_department_id`),
  KEY `emp_master_designation_id` (`emp_master_designation_id`),
  KEY `emp_master_category_id` (`emp_master_category_id`),
  KEY `emp_master_nationality_id` (`emp_master_nationality_id`),
  KEY `emp_master_emp_address_id` (`emp_master_emp_address_id`),
  KEY `created_by` (`created_by`),
  KEY `updated_by` (`updated_by`),
  KEY `emp_master_emp_info_id_frg` (`emp_master_emp_info_id`),
  KEY `emp_master_user_id_frg` (`emp_master_user_id`),
  CONSTRAINT `emp_master_ibfk_11` FOREIGN KEY (`emp_master_emp_info_id`) REFERENCES `emp_info` (`emp_info_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `emp_master_ibfk_12` FOREIGN KEY (`emp_master_user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `emp_master_ibfk_13` FOREIGN KEY (`emp_master_department_id`) REFERENCES `emp_department` (`emp_department_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `emp_master_ibfk_14` FOREIGN KEY (`emp_master_designation_id`) REFERENCES `emp_designation` (`emp_designation_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `emp_master_ibfk_15` FOREIGN KEY (`emp_master_category_id`) REFERENCES `emp_category` (`emp_category_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `emp_master_ibfk_16` FOREIGN KEY (`emp_master_nationality_id`) REFERENCES `nationality` (`nationality_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `emp_master_ibfk_17` FOREIGN KEY (`emp_master_emp_address_id`) REFERENCES `emp_address` (`emp_address_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `emp_master_ibfk_19` FOREIGN KEY (`created_by`) REFERENCES `users` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `emp_master_ibfk_20` FOREIGN KEY (`updated_by`) REFERENCES `users` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emp_master`
--

LOCK TABLES `emp_master` WRITE;
/*!40000 ALTER TABLE `emp_master` DISABLE KEYS */;
INSERT INTO `emp_master` VALUES (1,1,4,1,2,1,3,1,0,'2015-05-27 15:49:34',1,'2015-05-28 12:00:25',1,0),(2,2,15,1,1,1,1,2,0,'2015-05-27 16:05:39',1,'2015-05-28 12:04:46',1,0),(3,3,19,2,2,1,1,3,0,'2015-05-27 16:17:58',1,'2015-05-28 12:08:19',1,0),(4,4,20,5,2,1,1,4,0,'2015-05-27 16:36:41',1,'2015-05-28 12:14:07',1,0),(5,5,21,3,2,1,1,5,0,'2015-05-27 16:44:05',1,'2015-05-28 12:15:20',1,0),(6,6,22,4,2,1,1,6,0,'2015-05-27 16:52:30',1,'2015-05-28 12:23:20',1,0),(7,7,23,4,3,1,1,7,0,'2015-05-27 17:21:56',1,'2015-05-28 12:30:45',1,0),(8,8,24,2,2,1,1,8,0,'2015-05-27 17:32:07',1,'2015-05-28 12:35:44',1,0),(9,9,25,5,2,1,1,9,0,'2015-05-27 17:51:50',1,'2015-05-28 12:45:06',1,0),(10,10,26,3,1,1,1,10,0,'2015-05-28 09:52:52',1,'2015-05-28 12:48:03',1,0),(11,11,27,4,2,1,1,11,0,'2015-05-28 10:04:56',1,'2015-05-28 17:09:33',1,0),(12,12,28,5,6,1,1,12,0,'2015-05-28 10:16:16',1,'2015-05-28 12:54:39',1,0),(13,13,29,1,4,1,1,13,0,'2015-05-28 10:39:23',1,'2015-05-28 12:57:52',1,0),(14,14,30,2,2,4,1,14,0,'2015-05-28 11:12:20',1,'2015-05-28 13:02:06',1,0),(15,15,31,3,7,1,1,15,0,'2015-05-28 13:03:55',1,'2015-05-28 13:09:00',1,0),(16,16,32,1,5,1,1,16,0,'2015-05-28 13:11:32',1,'2015-05-28 14:22:48',1,0),(17,17,33,5,2,1,2,17,0,'2015-05-28 14:42:13',1,'2015-05-28 14:59:07',1,0);
/*!40000 ALTER TABLE `emp_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `events` (
  `event_id` int(11) NOT NULL AUTO_INCREMENT,
  `event_title` varchar(80) NOT NULL,
  `event_detail` varchar(255) NOT NULL,
  `event_start_date` datetime NOT NULL,
  `event_end_date` datetime NOT NULL,
  `event_type` int(11) NOT NULL,
  `event_url` varchar(255) DEFAULT NULL,
  `event_all_day` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `is_status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`event_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
INSERT INTO `events` VALUES (1,'Last Day','Last Day of Janvi','2015-05-30 00:00:00','2015-05-30 00:00:00',2,NULL,0,'2015-05-27 15:34:53',1,'2015-05-27 15:40:30',1,2),(2,'Janvi BDay','Happy Birthday Janvi ','2015-07-05 00:00:00','2015-07-05 00:00:00',4,NULL,0,'2015-05-27 15:35:38',1,'2015-05-27 15:40:48',1,2),(3,'Happy Bday','HAppy Birthday KarmrajSir','2015-07-25 00:00:00','2015-07-25 00:00:00',4,NULL,0,'2015-05-27 15:36:10',1,'2015-05-27 15:41:05',1,2),(4,'Launching New Application','Launch of Edusec Yii2','2015-06-02 09:30:00','2015-06-02 10:00:00',2,NULL,0,'2015-05-27 15:37:00',1,'2015-05-27 15:39:37',1,0),(5,'Meeting for staff ','All Staff Members-Meeting','2015-06-09 00:00:00','2015-06-09 00:00:00',3,NULL,0,'2015-05-27 15:37:42',1,NULL,NULL,0),(6,'Mango Festival','Two-day festival celebrating the ubiquitous Indian mango fruit with quizzes, competitions, mango tasting and over 400 varieties of the fruit on display.','2015-07-01 08:30:00','2015-07-01 15:00:00',2,NULL,0,'2015-05-27 15:38:08',1,'2015-05-27 15:38:44',1,0),(7,'Celebration Time','Celebration Time','2015-06-25 00:00:00','2015-06-25 00:00:00',4,NULL,0,'2015-05-27 15:39:12',1,NULL,NULL,0),(8,'Please remind me','Please remind me ddddddddddddddd','2016-05-31 00:25:00','2016-05-11 06:05:00',4,NULL,0,'2016-05-29 11:26:23',1,NULL,NULL,0);
/*!40000 ALTER TABLE `events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fees_collect_category`
--

DROP TABLE IF EXISTS `fees_collect_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fees_collect_category` (
  `fees_collect_category_id` int(11) NOT NULL AUTO_INCREMENT,
  `fees_collect_name` varchar(70) NOT NULL,
  `fees_collect_batch_id` int(11) NOT NULL,
  `fees_collect_details` varchar(255) DEFAULT NULL,
  `fees_collect_start_date` date NOT NULL,
  `fees_collect_end_date` date NOT NULL,
  `fees_collect_due_date` date NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `is_status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`fees_collect_category_id`),
  UNIQUE KEY `fees_collect_name` (`fees_collect_name`,`fees_collect_batch_id`),
  KEY `created_by` (`created_by`),
  KEY `updated_by` (`updated_by`),
  KEY `fees_collect_batch_id` (`fees_collect_batch_id`),
  CONSTRAINT `fees_collect_category_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `fees_collect_category_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `fees_collect_category_ibfk_3` FOREIGN KEY (`fees_collect_batch_id`) REFERENCES `batches` (`batch_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fees_collect_category`
--

LOCK TABLES `fees_collect_category` WRITE;
/*!40000 ALTER TABLE `fees_collect_category` DISABLE KEYS */;
INSERT INTO `fees_collect_category` VALUES (1,'Tuition Fees',1,'Tuition Fees','2015-06-01','2015-06-30','2015-07-01','2015-05-27 16:50:51',1,NULL,NULL,0),(2,'Tuition Fees',2,'Tuition Fees','2015-06-01','2015-06-30','2015-07-01','2015-05-27 16:50:52',1,NULL,NULL,0),(3,'Tuition Fees',3,'Tuition Fees','2015-06-01','2015-06-30','2015-07-01','2015-05-27 16:50:52',1,NULL,NULL,0),(4,'Tuition Fees',4,'Tuition Fees','2015-06-01','2015-06-30','2015-07-01','2015-05-27 16:50:52',1,NULL,NULL,0),(5,'Tuition Fees',5,'Tuition Fees','2015-06-01','2015-06-30','2015-07-01','2015-05-27 16:50:52',1,NULL,NULL,0);
/*!40000 ALTER TABLE `fees_collect_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `languages`
--

DROP TABLE IF EXISTS `languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `languages` (
  `language_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_name` varchar(45) NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`language_id`),
  UNIQUE KEY `language_name` (`language_name`),
  KEY `created_by` (`created_by`),
  KEY `updated_by` (`updated_by`),
  CONSTRAINT `languages_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `languages_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `languages`
--

LOCK TABLES `languages` WRITE;
/*!40000 ALTER TABLE `languages` DISABLE KEYS */;
INSERT INTO `languages` VALUES (1,'English','2015-05-27 15:23:01',1,NULL,NULL),(2,'Gujarati','2015-05-27 15:23:05',1,NULL,NULL),(3,'Hindi','2015-05-27 15:23:09',1,NULL,NULL),(4,'Punjabi','2015-05-27 15:23:13',1,NULL,NULL),(5,'German','2015-05-27 15:23:16',1,NULL,NULL),(6,'Russian','2015-05-27 15:23:26',1,NULL,NULL),(7,'French','2015-05-27 15:23:31',1,NULL,NULL),(8,'Urdu','2015-05-27 15:23:40',1,NULL,NULL),(9,'Marathi','2015-05-27 15:23:51',1,NULL,NULL);
/*!40000 ALTER TABLE `languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login_details`
--

DROP TABLE IF EXISTS `login_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login_details` (
  `login_detail_id` int(11) NOT NULL AUTO_INCREMENT,
  `login_user_id` int(11) NOT NULL,
  `login_status` tinyint(1) NOT NULL DEFAULT '0',
  `login_at` datetime NOT NULL,
  `logout_at` datetime DEFAULT NULL,
  `user_ip_address` varchar(16) NOT NULL,
  PRIMARY KEY (`login_detail_id`),
  KEY `login_user_id` (`login_user_id`),
  CONSTRAINT `login_details_ibfk_1` FOREIGN KEY (`login_user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=230 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_details`
--

LOCK TABLES `login_details` WRITE;
/*!40000 ALTER TABLE `login_details` DISABLE KEYS */;
INSERT INTO `login_details` VALUES (1,1,0,'2015-05-27 17:49:43','2015-05-28 14:53:46','192.168.1.109'),(2,1,0,'2015-05-28 09:26:49','2015-05-28 14:53:46','192.168.1.109'),(3,1,0,'2015-05-28 09:49:52','2015-05-28 14:53:46','192.168.1.101'),(4,1,0,'2015-05-28 14:03:14','2015-05-28 14:53:46','192.168.1.101'),(5,18,0,'2015-05-28 14:53:54','2015-05-28 15:01:59','192.168.1.109'),(6,1,0,'2015-05-28 14:54:21','2015-05-28 15:06:00','192.168.1.109'),(7,33,0,'2015-05-28 15:02:07','2015-05-28 15:09:35','192.168.1.109'),(8,1,0,'2015-05-28 15:07:23','2015-05-28 15:08:16','192.168.1.109'),(9,1,0,'2015-05-28 15:08:56','2015-05-28 15:10:32','192.168.1.109'),(10,18,0,'2015-05-28 15:09:44','2015-05-28 15:10:08','192.168.1.109'),(11,1,0,'2015-05-28 15:10:29','2015-05-28 15:10:32','192.168.1.109'),(12,1,0,'2015-05-28 16:43:52','2015-05-28 17:06:03','192.168.1.109'),(13,33,0,'2015-05-28 17:06:12','2015-05-28 17:07:56','192.168.1.109'),(14,1,0,'2015-05-28 17:08:13','2016-01-09 13:11:20','192.168.1.109'),(15,1,0,'2015-05-28 17:41:47','2016-01-09 13:11:20','192.168.1.101'),(16,1,0,'2015-05-28 18:17:21','2016-01-09 13:11:20','127.0.0.1'),(17,1,0,'2015-09-05 13:21:39','2016-01-09 13:11:20','127.0.0.1'),(18,1,0,'2015-09-05 17:24:48','2016-01-09 13:11:20','127.0.0.1'),(19,1,0,'2015-09-12 18:03:24','2016-01-09 13:11:20','127.0.0.1'),(20,1,0,'2015-09-19 14:28:03','2016-01-09 13:11:20','127.0.0.1'),(21,1,0,'2015-09-19 19:08:01','2016-01-09 13:11:20','127.0.0.1'),(22,1,0,'2015-09-27 14:52:16','2016-01-09 13:11:20','127.0.0.1'),(23,1,0,'2015-09-27 16:13:36','2016-01-09 13:11:20','127.0.0.1'),(24,1,0,'2015-09-27 17:03:02','2016-01-09 13:11:20','127.0.0.1'),(25,1,0,'2016-01-09 11:13:03','2016-01-09 13:11:20','127.0.0.1'),(26,1,0,'2016-01-09 11:13:08','2016-01-09 13:11:20','127.0.0.1'),(27,1,0,'2016-01-09 11:14:50','2016-01-09 13:11:20','127.0.0.1'),(28,1,1,'2016-01-09 13:11:27',NULL,'127.0.0.1'),(29,1,1,'2016-01-09 16:31:40',NULL,'127.0.0.1'),(30,1,1,'2016-01-10 09:49:41',NULL,'127.0.0.1'),(31,1,1,'2016-01-10 11:10:41',NULL,'127.0.0.1'),(32,1,1,'2016-01-17 06:53:41',NULL,'127.0.0.1'),(33,1,1,'2016-01-17 07:42:53',NULL,'127.0.0.1'),(34,1,1,'2016-01-17 17:10:18',NULL,'127.0.0.1'),(35,1,1,'2016-01-17 20:16:17',NULL,'127.0.0.1'),(36,1,1,'2016-01-21 11:45:39',NULL,'127.0.0.1'),(37,1,1,'2016-01-21 11:48:47',NULL,'127.0.0.1'),(38,1,1,'2016-01-21 13:45:12',NULL,'127.0.0.1'),(39,1,1,'2016-01-23 10:28:25',NULL,'127.0.0.1'),(40,1,1,'2016-01-23 22:18:22',NULL,'127.0.0.1'),(41,1,1,'2016-02-29 09:28:59',NULL,'127.0.0.1'),(42,1,1,'2016-02-29 09:29:08',NULL,'127.0.0.1'),(43,1,1,'2016-02-29 09:29:51',NULL,'127.0.0.1'),(44,1,1,'2016-03-01 23:30:33',NULL,'127.0.0.1'),(45,1,1,'2016-03-01 23:31:23',NULL,'127.0.0.1'),(46,1,1,'2016-03-02 20:24:36',NULL,'127.0.0.1'),(47,1,1,'2016-03-03 08:52:06',NULL,'127.0.0.1'),(48,1,1,'2016-03-08 21:54:28',NULL,'127.0.0.1'),(49,1,1,'2016-03-09 23:40:02',NULL,'127.0.0.1'),(50,1,1,'2016-03-10 10:44:26',NULL,'127.0.0.1'),(51,1,1,'2016-03-10 17:24:10',NULL,'127.0.0.1'),(52,1,1,'2012-05-14 00:20:00',NULL,'127.0.0.1'),(53,1,1,'2016-03-14 23:18:15',NULL,'127.0.0.1'),(54,1,1,'2016-03-15 09:24:55',NULL,'127.0.0.1'),(55,1,1,'2016-03-24 22:33:39',NULL,'127.0.0.1'),(56,1,1,'2016-03-26 10:16:11',NULL,'127.0.0.1'),(57,1,1,'2016-03-27 10:19:06',NULL,'127.0.0.1'),(58,1,1,'2016-03-27 18:43:40',NULL,'127.0.0.1'),(59,1,1,'2016-03-29 21:04:59',NULL,'127.0.0.1'),(60,1,1,'2016-04-01 11:22:43',NULL,'127.0.0.1'),(61,1,1,'2016-04-01 14:58:55',NULL,'127.0.0.1'),(62,1,1,'2016-04-06 09:14:02',NULL,'127.0.0.1'),(63,1,1,'2016-04-09 12:17:05',NULL,'127.0.0.1'),(64,1,1,'2016-04-10 09:46:40',NULL,'127.0.0.1'),(65,1,1,'2016-04-10 11:28:37',NULL,'127.0.0.1'),(66,1,1,'2016-04-11 21:04:52',NULL,'127.0.0.1'),(67,1,1,'2016-04-11 23:07:41',NULL,'127.0.0.1'),(68,1,1,'2016-04-12 08:58:48',NULL,'127.0.0.1'),(69,1,1,'2016-04-12 09:01:05',NULL,'127.0.0.1'),(70,1,1,'2016-04-12 09:21:50',NULL,'127.0.0.1'),(71,1,1,'2016-04-12 21:50:34',NULL,'127.0.0.1'),(72,1,1,'2016-04-12 21:51:48',NULL,'127.0.0.1'),(73,1,1,'2016-04-12 21:53:27',NULL,'127.0.0.1'),(74,1,1,'2016-04-12 22:06:45',NULL,'127.0.0.1'),(75,1,1,'2016-04-12 22:19:18',NULL,'127.0.0.1'),(76,1,1,'2016-04-12 22:23:21',NULL,'127.0.0.1'),(77,1,1,'2016-04-12 22:27:05',NULL,'127.0.0.1'),(78,1,1,'2016-04-12 22:32:20',NULL,'127.0.0.1'),(79,1,1,'2016-04-12 22:34:03',NULL,'127.0.0.1'),(80,1,1,'2016-04-13 21:11:40',NULL,'127.0.0.1'),(81,1,1,'2016-04-13 21:55:27',NULL,'127.0.0.1'),(82,1,1,'2016-04-14 20:24:02',NULL,'127.0.0.1'),(83,1,1,'2016-04-14 20:33:40',NULL,'127.0.0.1'),(84,1,1,'2016-04-14 20:35:17',NULL,'127.0.0.1'),(85,1,1,'2016-04-14 20:39:25',NULL,'127.0.0.1'),(86,1,1,'2016-04-14 20:40:13',NULL,'127.0.0.1'),(87,1,1,'2016-04-14 20:52:40',NULL,'127.0.0.1'),(88,1,1,'2016-04-17 08:54:27',NULL,'127.0.0.1'),(89,1,1,'2016-04-17 14:54:13',NULL,'127.0.0.1'),(90,1,1,'2016-04-17 17:46:18',NULL,'127.0.0.1'),(91,1,1,'2016-04-17 18:24:19',NULL,'127.0.0.1'),(92,1,1,'2016-04-18 21:31:55',NULL,'127.0.0.1'),(93,1,1,'2016-04-18 21:32:25',NULL,'127.0.0.1'),(94,1,1,'2016-04-18 21:38:44',NULL,'127.0.0.1'),(95,1,1,'2016-04-19 17:44:16',NULL,'127.0.0.1'),(96,1,1,'2016-04-21 08:47:14',NULL,'127.0.0.1'),(97,1,1,'2016-04-21 16:31:51',NULL,'127.0.0.1'),(98,1,1,'2016-04-22 10:42:58',NULL,'127.0.0.1'),(99,1,1,'2016-04-22 10:44:30',NULL,'127.0.0.1'),(100,1,1,'2016-04-22 11:06:54',NULL,'127.0.0.1'),(101,1,1,'2016-04-22 11:23:21',NULL,'127.0.0.1'),(102,1,1,'2016-04-22 11:32:58',NULL,'127.0.0.1'),(103,1,1,'2016-04-22 11:33:54',NULL,'127.0.0.1'),(104,1,1,'2016-04-22 19:52:41',NULL,'127.0.0.1'),(105,1,1,'2016-04-22 22:33:43',NULL,'127.0.0.1'),(106,1,1,'2016-04-22 22:56:07',NULL,'127.0.0.1'),(107,1,1,'2016-04-22 22:58:34',NULL,'127.0.0.1'),(108,1,1,'2016-04-22 23:32:46',NULL,'127.0.0.1'),(109,1,1,'2016-04-23 07:02:16',NULL,'127.0.0.1'),(110,1,1,'2016-04-23 07:03:03',NULL,'127.0.0.1'),(111,1,1,'2016-04-23 14:12:50',NULL,'127.0.0.1'),(112,1,1,'2016-04-23 15:08:16',NULL,'127.0.0.1'),(113,1,1,'2016-04-23 15:22:02',NULL,'127.0.0.1'),(114,1,1,'2016-04-23 15:24:58',NULL,'127.0.0.1'),(115,1,1,'2016-04-24 10:56:13',NULL,'127.0.0.1'),(116,1,1,'2016-04-24 11:21:19',NULL,'127.0.0.1'),(117,1,1,'2016-04-24 11:42:00',NULL,'127.0.0.1'),(118,1,1,'2016-04-24 11:43:59',NULL,'127.0.0.1'),(119,1,1,'2016-04-25 14:37:54',NULL,'127.0.0.1'),(120,1,1,'2016-04-25 14:45:19',NULL,'127.0.0.1'),(121,1,1,'2016-04-25 14:48:21',NULL,'127.0.0.1'),(122,1,1,'2016-04-25 15:05:28',NULL,'127.0.0.1'),(123,1,1,'2016-04-25 15:09:41',NULL,'127.0.0.1'),(124,1,1,'2016-04-25 15:10:54',NULL,'127.0.0.1'),(125,1,1,'2016-04-25 16:46:29',NULL,'127.0.0.1'),(126,1,1,'2016-04-25 17:49:08',NULL,'127.0.0.1'),(127,1,1,'2016-04-25 17:52:38',NULL,'127.0.0.1'),(128,1,1,'2016-04-25 17:56:34',NULL,'127.0.0.1'),(129,1,1,'2016-04-26 17:24:47',NULL,'127.0.0.1'),(130,1,1,'2016-04-26 18:10:53',NULL,'127.0.0.1'),(131,1,1,'2016-04-26 19:50:32',NULL,'127.0.0.1'),(132,1,1,'2016-04-26 21:24:18',NULL,'127.0.0.1'),(133,1,1,'2016-04-26 21:51:43',NULL,'127.0.0.1'),(134,1,1,'2016-04-26 21:53:46',NULL,'127.0.0.1'),(135,1,1,'2016-04-27 17:48:56',NULL,'127.0.0.1'),(136,1,1,'2016-04-27 19:31:49',NULL,'127.0.0.1'),(137,1,1,'2016-04-27 20:01:45',NULL,'127.0.0.1'),(138,1,1,'2016-04-28 17:07:00',NULL,'127.0.0.1'),(139,1,1,'2016-04-29 17:27:48',NULL,'127.0.0.1'),(140,1,1,'2016-04-30 11:53:42',NULL,'127.0.0.1'),(141,1,1,'2016-04-30 12:00:16',NULL,'127.0.0.1'),(142,1,1,'2016-04-30 12:16:09',NULL,'127.0.0.1'),(143,1,1,'2016-04-30 13:44:06',NULL,'127.0.0.1'),(144,1,1,'2016-04-30 13:50:49',NULL,'127.0.0.1'),(145,1,1,'2016-04-30 14:18:41',NULL,'127.0.0.1'),(146,1,1,'2016-05-01 11:10:15',NULL,'127.0.0.1'),(147,1,1,'2016-05-01 11:18:36',NULL,'127.0.0.1'),(148,1,1,'2016-05-01 11:36:21',NULL,'127.0.0.1'),(149,1,1,'2016-05-01 11:44:28',NULL,'127.0.0.1'),(150,1,1,'2016-05-01 11:57:38',NULL,'127.0.0.1'),(151,1,1,'2016-05-01 11:58:43',NULL,'127.0.0.1'),(152,1,1,'2016-05-02 08:12:03',NULL,'127.0.0.1'),(153,1,1,'2016-05-02 08:43:14',NULL,'127.0.0.1'),(154,1,1,'2016-05-02 20:32:03',NULL,'127.0.0.1'),(155,1,1,'2016-05-02 20:32:44',NULL,'127.0.0.1'),(156,1,1,'2016-05-02 20:43:52',NULL,'127.0.0.1'),(157,1,1,'2016-05-03 08:03:29',NULL,'127.0.0.1'),(158,1,1,'2016-05-03 08:20:23',NULL,'127.0.0.1'),(159,1,1,'2016-05-03 16:30:50',NULL,'127.0.0.1'),(160,1,1,'2016-05-04 08:17:58',NULL,'127.0.0.1'),(161,1,1,'2016-05-05 10:02:12',NULL,'127.0.0.1'),(162,1,1,'2016-05-05 10:16:32',NULL,'127.0.0.1'),(163,1,1,'2016-05-05 17:07:07',NULL,'127.0.0.1'),(164,1,1,'2016-05-05 17:20:36',NULL,'127.0.0.1'),(165,1,1,'2016-05-05 17:22:30',NULL,'127.0.0.1'),(166,1,1,'2016-05-05 17:23:05',NULL,'127.0.0.1'),(167,1,1,'2016-05-06 19:42:29',NULL,'127.0.0.1'),(168,1,1,'2016-05-07 10:09:57',NULL,'127.0.0.1'),(169,1,1,'2016-05-07 10:12:40',NULL,'127.0.0.1'),(170,1,1,'2016-05-07 10:18:32',NULL,'127.0.0.1'),(171,1,1,'2016-05-07 11:55:40',NULL,'127.0.0.1'),(172,1,1,'2016-05-07 12:17:01',NULL,'127.0.0.1'),(173,1,1,'2016-05-07 12:23:45',NULL,'127.0.0.1'),(174,1,1,'2016-05-07 12:43:52',NULL,'127.0.0.1'),(175,1,1,'2016-05-08 08:23:13',NULL,'127.0.0.1'),(176,1,1,'2016-05-08 08:46:57',NULL,'127.0.0.1'),(177,1,1,'2016-05-08 08:53:36',NULL,'127.0.0.1'),(178,1,1,'2016-05-08 09:08:05',NULL,'127.0.0.1'),(179,1,1,'2016-05-08 09:10:14',NULL,'127.0.0.1'),(180,1,1,'2016-05-08 09:11:55',NULL,'127.0.0.1'),(181,1,1,'2016-05-09 21:18:31',NULL,'127.0.0.1'),(182,1,1,'2016-05-09 21:42:37',NULL,'127.0.0.1'),(183,1,1,'2016-05-10 20:34:36',NULL,'127.0.0.1'),(184,1,1,'2016-05-11 19:11:27',NULL,'127.0.0.1'),(185,1,1,'2016-05-11 19:45:38',NULL,'127.0.0.1'),(186,1,1,'2016-05-13 08:37:16',NULL,'127.0.0.1'),(187,1,1,'2016-05-13 08:49:58',NULL,'127.0.0.1'),(188,1,1,'2016-05-13 16:57:41',NULL,'127.0.0.1'),(189,1,1,'2016-05-13 17:33:18',NULL,'127.0.0.1'),(190,1,1,'2016-05-13 17:35:34',NULL,'127.0.0.1'),(191,1,1,'2016-05-13 17:36:44',NULL,'127.0.0.1'),(192,1,1,'2016-05-14 09:58:44',NULL,'127.0.0.1'),(193,1,1,'2016-05-14 10:05:47',NULL,'127.0.0.1'),(194,1,1,'2016-05-14 10:28:26',NULL,'127.0.0.1'),(195,1,1,'2016-05-23 06:10:54',NULL,'127.0.0.1'),(196,1,1,'2016-05-23 07:20:58',NULL,'127.0.0.1'),(197,1,1,'2016-05-28 09:54:23',NULL,'127.0.0.1'),(198,1,1,'2016-05-29 06:36:14',NULL,'127.0.0.1'),(199,1,1,'2016-05-29 12:22:57',NULL,'127.0.0.1'),(200,1,1,'2016-06-02 20:47:13',NULL,'127.0.0.1'),(201,1,1,'2016-06-11 10:24:50',NULL,'127.0.0.1'),(202,1,1,'2016-06-18 06:29:37',NULL,'127.0.0.1'),(203,1,1,'2016-07-18 21:55:09',NULL,'127.0.0.1'),(204,1,1,'2016-07-28 20:34:11',NULL,'127.0.0.1'),(205,1,1,'2016-07-28 21:22:02',NULL,'127.0.0.1'),(206,1,1,'2016-08-14 18:07:53',NULL,'127.0.0.1'),(207,1,1,'2016-08-15 07:06:27',NULL,'127.0.0.1'),(208,1,1,'2016-08-15 19:20:27',NULL,'192.168.1.100'),(209,1,1,'2016-09-01 17:22:13',NULL,'127.0.0.1'),(210,1,1,'2016-09-05 14:47:08',NULL,'127.0.0.1'),(211,1,1,'2016-09-06 18:59:59',NULL,'127.0.0.1'),(212,1,1,'2016-09-15 11:30:23',NULL,'127.0.0.1'),(213,1,1,'2016-09-17 10:30:32',NULL,'127.0.0.1'),(214,1,1,'2016-09-17 10:38:54',NULL,'127.0.0.1'),(215,1,1,'2016-09-27 11:14:41',NULL,'127.0.0.1'),(216,1,1,'2016-09-27 11:14:46',NULL,'127.0.0.1'),(217,1,1,'2016-09-27 13:17:52',NULL,'127.0.0.1'),(218,1,1,'2016-09-27 16:35:42',NULL,'127.0.0.1'),(219,1,1,'2016-09-27 17:24:34',NULL,'127.0.0.1'),(220,1,1,'2016-09-27 18:09:08',NULL,'127.0.0.1'),(221,1,1,'2016-09-29 15:08:33',NULL,'127.0.0.1'),(222,1,1,'2016-09-29 17:03:24',NULL,'127.0.0.1'),(223,1,1,'2016-09-30 15:17:40',NULL,'127.0.0.1'),(224,1,1,'2016-10-13 12:12:25',NULL,'127.0.0.1'),(225,1,1,'2016-10-13 15:30:03',NULL,'127.0.0.1'),(226,1,1,'2016-10-14 16:29:12',NULL,'127.0.0.1'),(227,1,1,'2016-10-14 17:35:22',NULL,'127.0.0.1'),(228,1,1,'2016-10-15 11:38:46',NULL,'127.0.0.1'),(229,1,1,'2016-10-17 10:57:49',NULL,'127.0.0.1');
/*!40000 ALTER TABLE `login_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `national_holidays`
--

DROP TABLE IF EXISTS `national_holidays`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `national_holidays` (
  `national_holiday_id` int(11) NOT NULL AUTO_INCREMENT,
  `national_holiday_name` varchar(50) NOT NULL,
  `national_holiday_date` date NOT NULL,
  `national_holiday_remarks` varchar(100) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `is_status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`national_holiday_id`),
  UNIQUE KEY `national_holiday_name` (`national_holiday_name`,`national_holiday_date`),
  KEY `created_by` (`created_by`),
  KEY `updated_by` (`updated_by`),
  CONSTRAINT `national_holidays_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `national_holidays_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `national_holidays`
--

LOCK TABLES `national_holidays` WRITE;
/*!40000 ALTER TABLE `national_holidays` DISABLE KEYS */;
INSERT INTO `national_holidays` VALUES (1,'Independance Day','2015-08-15','','2015-05-27 15:24:10',1,NULL,NULL,0),(2,'Republic Day(India)','2015-01-26','','2015-05-27 15:24:26',1,NULL,NULL,0),(3,'Janmashtami','2015-09-05','','2015-05-27 15:24:47',1,NULL,NULL,0),(4,'Dr.Ambedkar Jayanti','2015-04-14','','2015-05-27 15:25:02',1,NULL,NULL,0),(5,'Gujarat Sthapna Divas','2015-05-01','','2015-05-27 15:25:15',1,NULL,NULL,0);
/*!40000 ALTER TABLE `national_holidays` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nationality`
--

DROP TABLE IF EXISTS `nationality`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nationality` (
  `nationality_id` int(11) NOT NULL AUTO_INCREMENT,
  `nationality_name` varchar(35) NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `is_status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`nationality_id`),
  UNIQUE KEY `nationality_name` (`nationality_name`),
  KEY `created_by` (`created_by`),
  KEY `updated_by` (`updated_by`),
  CONSTRAINT `nationality_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `nationality_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nationality`
--

LOCK TABLES `nationality` WRITE;
/*!40000 ALTER TABLE `nationality` DISABLE KEYS */;
INSERT INTO `nationality` VALUES (1,'Indian','2015-05-27 15:25:38',1,NULL,NULL,0),(2,'Australian','2015-05-27 15:25:42',1,NULL,NULL,0),(3,'American','2015-05-27 15:25:46',1,NULL,NULL,0),(4,'Other','2015-05-27 15:25:53',1,NULL,NULL,0);
/*!40000 ALTER TABLE `nationality` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organization`
--

DROP TABLE IF EXISTS `organization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `organization` (
  `org_id` int(11) NOT NULL AUTO_INCREMENT,
  `org_name` varchar(255) NOT NULL,
  `org_alias` varchar(25) NOT NULL,
  `org_address_line1` varchar(255) NOT NULL,
  `org_address_line2` varchar(255) DEFAULT NULL,
  `org_phone` varchar(25) DEFAULT NULL,
  `org_email` varchar(65) DEFAULT NULL,
  `org_website` varchar(120) DEFAULT NULL,
  `org_logo` longblob NOT NULL,
  `org_logo_type` varchar(35) NOT NULL,
  `org_stu_prefix` varchar(10) NOT NULL,
  `org_emp_prefix` varchar(10) NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`org_id`),
  UNIQUE KEY `org_name` (`org_name`),
  UNIQUE KEY `org_alias` (`org_alias`),
  UNIQUE KEY `org_id` (`org_id`),
  KEY `updated_by` (`updated_by`),
  KEY `created_by` (`created_by`),
  CONSTRAINT `organization_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `organization_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organization`
--

LOCK TABLES `organization` WRITE;
/*!40000 ALTER TABLE `organization` DISABLE KEYS */;
INSERT INTO `organization` VALUES (1,'Buraq Transports','Buraq Transports','Ambalapady,Pallikkara, Ernakulam,683565,0484-2683284, 9446383284','Ambalapady,Pallikkara, Ernakulam,683565,0484-2683284, 9446383284','9446383284','info@rudrasoftech.com','','âPNG\r\n\Z\n\0\0\0\rIHDR\0\0\0Z\0\0\0F\0\0\0LºÉ\‚\0\0\0	pHYs\0\0\ƒ\0\0\ƒï+\0\0µIDATxú\Ìõp\\\’}\≈?g≠(ä–®\Z\«u5k\≈\„\„∏\¬#K\‘#c5eä\„¶ö2êêî\“ A\‹\¬\ráaóf®\ZJ¡•)íùÅIiJCBô`à+\…Bx08≤\„Ç#\\W8≤*4éPñ=˝„Ωï\÷\œoW+€≤M™3≥\⁄}˜ù{\Ô˜˛˙\ﬁÛΩ\ÔI@HGæ…ëF˜¶Çì¡©\‰§9\Zs&\ÍÄlN\\!\—Ùtﬁ±p≤\r\Õ|N5\'s/b9äI\Ã5ª¢≥/\◊lú\Ë∫P\Œ4¶q˙ \ÍvéÖMè\„}h8E1\‰8D}Væ\nÚ˘ø\…pr\’}™8\È\'\ﬂ>s\'ª†\Â#)s2ı¶#ﬂß\'ä\\i\Ïf\‹t\œ5\⁄\Ÿ˜r-˝\„íA9\“ÚπôS¡âC:\'™:&\ÍÄ\Ë\“(T≥Å\'®å¡â∫î\\j*ñ\'\ÔÚ\'\…&ífÖH∑õº˚Ml\”4ÚaZ\ﬁ\Â\ÊL\„81aß&\"üh¶BFe*v˛\\≥\„Tqé˘6\√B6πBå8ﬁç#˜Ω\'¿≠¯”ô∞¨†;Å4\»ˆ∂iG\Ê~πÇõXNút\ÀD4π$N4*\ w™Wà\·Öv¿ëı<1∞¯!4ˆr ç˝gòü!˝xöökn`YcE\ﬁr\n©k<=NueØàúú\Ï|¢eíO\ﬁ\≈!W\Â\«\ƒ9Ù\≈EI- $Ó©Ä\Â¿gi\‡&j\Zg˜ ∫Ä.\Ãj\ƒ˙0ˇÉy è≥\'ﬂΩ|í6\'ßàâG8Qn!!k˛˚\À\Z¿\\†<;Y	˜\ﬁÛ˜ª\Á•¿A=¯\ÓBõ¡`≠ü¯˙∞˙Çô	\‹¡ˆ∂nñ5\ﬁ™\ƒ(¿æcA!eéq\n=TöJîaøJ¢å\√5òslo™\ƒ˛ipK£ùuy?Pç\rRˇ˙\Êà]@\0\€\€R@Ö\œ\‰©å1\≈í\œƒπã∏M _˛(R†\‚)Ã¶Ú\ƒGJäg–Ø¿-ßëfáﬂæµ\Á\›\\åY\ÏÑ¸îΩΩï¿Öòıt∑Em\Ã\Â\‚&ÀâKœæ\◊/cú¢<\ƒ(rπâBgB<\œ∞Ü\Ë\ﬁ¯∑≠|\Ë5A9xﬁô21ä˝;R\Ë*†1+\Ëg^¡^\r*F˛¡$l<N4Ω\‡˛ä\€1ÛE7Ö\Í\Ï|∫¸HN˜FÄ˝\»\…¿_ª\‹ˆ<`&Ú(ÄL\ bvò\Ô-`PÇ4D\Í\◊o }\—\r⁄ïßÆ\\ˆOÜá∏>;äìK¥\Áª\Œ^\—\ﬂqr1ZFg?&âùê5 	CôM\nÅ\—˚òY!wP\rÄ\Ÿ\√˝S\n,\«<˙\Âh]˘\‘\Ãd8\ƒÚ\r\ÿ◊π¥r>\ƒ˘¶∏ä\në~G\ÍCöâTä<\0 (ìBêíîô\—o\Á?˝\n#á/&\»ÉÌâ´ÛX8Q\…6)N.y7Q@R®¨\ÀWF6\ﬁóc\ @\ÿ\0eÜQ03“§\r3±ë¥ÛUd¯ \’	n\ƒzÖ¿•L©r1iˇÖ˚°©FV	\‚ÇC\È˜G?\0\“PÜï¬¢¯}\'0†‘Øf|¥QçÅ≠[b\’\"\’Fé7P9!8\‰\‡^§¨Ô∂åºû.S—®\–\’…áìâ3M¸/ü:oÙW%ïE£\√\ﬂ8˚Ø ∞Àêˆ\”˘\“2\‰Q¨ßÚ\‘uZ\»;\÷SåökHUj¢ö¿W±ì@iëú.M§\”\Ô\Õ¯Xø?Ò…ô|\Ïå>væö¿\ÏB|é\Ì9gÙ\…B\ﬁ˛Gè\nƒèLˆ\Ô|#ô]1¸‹úeç•\ÿ\œ\"-n!¡´0êÇ>,\œUÄØe˚\∆\'r\ÿm\√Òr\‚êOiçq2!x.\Âß,¢;k\‹aS\\˙\ƒSã¥<¯\ÌF∫7>Ω\‘\\≥¥≥±\‘6œòÜ≈§/\'ü€å\Ê9äw÷ë\Ô$-Zaúùºº\À@tc˜ \ÊKz\Ïù˝˚ãBã>[\Î“ówæ}Ç\‚¢˜lˇˆ-ó¸∑\Œ*\·ÆtXN\ ˆ®§êJ&ìqùr\"\‰]æ”ªXéb»ß/ø∫s9p}\’Ïäôí™lWH*{wp∏\Ï¢7îÙ\Z\Ê™’µ¸\Ì\ródgKKJ9\Áá%\r˝¿^\‡e`c2ô9˘≠\«i\◊\—\ÔºÛ\Œl†^\“B€üfJöiª¸≠ˇ(\Ÿ˝ãwãñûYÙ\—\‚¢LêF	Çöa\€ím\0vK\Í±\›3gŒúTûjß\\\‰zm7ü1S \Ôrr∆Æ˚˙˙\·°íp‘å¡6UUUI≠Ç\Í*¿\ÊIÀªh\Êi;&Ïø®2\»wp∑Y\‰\⁄Ú\∆LÜì´\ﬁS¡âC¥±ú\"\0\’6\ÕBT0˝\Ójù¥ºS]S	8\ÂŒ∂\—\Ït\0\’5™pg\ÎP§‹£$†\ÍöJ1#à`ƒù≠˘Ù˜Pmc©¸N∞\‡∞;[£õ\·…ïw™k˙,p∞\\ç¥	\ÿS\»QßR™mq¯\€‡ØÅ∂[bå(~¢∫¶∫∞\„\‚fMò\Óu†«Ä/\0Ùg7 Nøá\ﬂ∏X\Ëm@\Z\ƒ~\0xÆrrrr}\Á‰®Æ\ÈbLØT\€¯Cƒ≠\Ól{CuM≥¿ÄÆJ∞W#Å˝#wµç®Æ©\Ë\nZ\n`?Ü∏\Î\"\‡MDf∞\Õ]¡lTmS1¯5§≥Åj\Ëpè;\€zÇ\’¿jÒ«òM¿Úû\‚jP9∞Ÿù≠˚U€∏ë\¬\‘\Ì\Ój\€K™kz¸-w∂Ω^\◊çw\Z\‘¸a∏r~L†Z™¡Â†π¿èÄA\Ï\≈H\Á;¿]†j ç9π√ùmΩ™mLÄ>zÑ-\Ól\ÌS]\”\¬!Ú\"\‡Jƒ´	D/\÷7U\◊¯%†tuÿëmHï\‡$\“√™kL\0˜	\Ï\Ïª¡eH%†ô\»	WÉf˙¢ÒVè˝h\∆|;\r¥©Æ)	¨Ø µ/FÄº´|;f0äΩIuçEÅZÉTåxTuç•—éŒ™84\…Ä[Aeò\rA\Á∫\Z|\'∏Û=\Ã\‡≥¿-\ÿsë\Ó\∆\Ón-∆æXæ\‚∞IuMÛÄøD\\å\0è™∂±|=\Ê!DeXˆo\'¬å@\ÁÇó\Ÿ|\Ïw∂>\ËŒ∂„´äå§í2ç\ÿÙa\⁄C_¯ê;[A⁄Ç4/∂\Õ6à\‹\’ˆV7xp!\Ëvw∂˛b[¿\À¸\—wêv≥êí†bP\n{=\–\n\Zï\≈wtv˝J\Õ¿6\‰ıAG\Î¨y\·™Ÿèt/\Ë~PR:8ö•\n|7∞)Åπœù≠è\0O´_ö\›\Ÿ˙o\ÿ\œ\0´ÇáÕ∫œù≠ˇL∞\ZûIÄ\÷œª≥u-\Ë˜AãÅ$ht\‹Jè\‚,ˇe!äèò1R\Zk0º˙ıçt¶\„2ÉDÜóÅùb|\Z\À\'%Äª¡¿\›<}Aå\"._ ím\ƒ¡π\…,PPÜÿäHÖu\rˆ8\Œ˜ç¿a–ù¿™`¢9¨W#ò4(\‰#å áØKdµó¢`Y˙™k⁄å=ü\‡ú†(S]\”\≈Y\€vÏßëe\·åK ™¡cÖ…Ü#v\‡¨w6Çr¡óGÉ\"ÆS]\”.\ﬂ˘-2ˆA%\÷6Ç\„\”$r\÷¯{Hv]πèå\Âa\Á\Ó¿\\âòîå\€Hf\’\’ 5É\Ó~\\∂oçÍöæ|s-\ÊàØ´Æq÷•\‡Ø\0gá\Ìx¥tÜí\Á=ö\\|¥\Œ]≠ˇ£d\ÕOê/}\ÈØ\›\Ÿ:§dM¯\"§◊Ä\¬˜\‹˙\¬Y“Ö˘/ˆwøßd\Õ0\“\€\Ï\Ô>$î<§w¡;ACò\›\Ï\Ô>¨95\ÔÅ~éx8®\¬n]\≈–õ\ÿ\€üA\⁄\rﬁÇÙ\‚M†7úIáÄ^ˆøöYÅöS3Ñ\Èe˜{Äï¨D\ÏB˙%¡\Ã^Å¸40\0\⁄¸k7íëÇ^f3b\ÔF˙eX/ j0≠\Ój}Csj^\n&(\Á\"=\0\Í\r\›\Ÿ\œ\√6\ÓCúô=⁄πÑzTå\Á\një\ﬂ˘ÚMñµ\ÔîpT\◊¯x∏∆µ!ÆMc\◊\Ÿg£\ﬂDÆh\ƒ-\’\\\Á\«Àâ≥\Ô\‰r¨ª¿˝9Ú\ƒaJ™¶ë\≈\ÍQn,Z:V&Z:\Z\n-gJ\—\“\—0∂L6lCAg[:\Zä	Çïı\Õı\Ì˚Z:\ZÆ#µ5◊∑?pVûo∏V(Å˝\›PI\Ão^—æ#R\÷b`_s}˚P¥û˛◊õ\Î\€ˇÆÄ\ÂƒΩ[W.ë∏)l\ﬁ˜36ÇñéïEò&§7ÄÅ\Ê˙ˆ\◊Ãö≥ˇ`¸uÉåvå&e\nXl®æ∏7|7π\€0,ø’à|;f∏(∂∏≤ek\√\Z`ïq©\‡	Ç†\·Èñ≠\r\Ìñ/ëµÒ|s}{PØ]ó©¯ﬁéÜ\"°˘ly+ºK=@ /+A]¿^õ\ÂÇm\Õ+⁄ëtì\Õ-¿ê\‡k-\rØ`W ˆ\Z\’áë\ﬂlÃø#sçGm~,8\«f≥\‡Ω[WŒì¥\Z\Ë6\ÏúF{ëñ\œ5◊∑ø5\— ∂¥\ÏKwÅñ›ªµ°ÇÉw∫3 Òå\–˝\»\ﬂD⁄å\Ë@,DIJ .\∆\Ó∑\ÈC\‹!‘É¯Lı¯@+3∏`VΩ≤\◊\nV+ÇNf\r®∏HJ¸\—¯$Ò˜$oêºÒf.\–\0*\\	\\\Ã\"ÆﬂåTÉ\ZHúoº¥\ŒˆK\‡´Ûå\Ôı#≠1t\0D&eú\Íà=˛<-\rE#zs¯ñ\Á0\Z\√3\Ë\«\\\rz|áÒà·óòR\‡\"\‡\‹\‡∑DÜãÄUÜb\ƒ\ÿYÖ≥O¡L{N∞\ri∂É(˚\∆C¿Ç;¿≈òKÄ\'õW¥”≤µ!Å5d∏\Zkf-¢,ò/SN!ûu\œê;@/Iûè«û\‰$K$]ÇIaó\nu›òß±◊Äì±ì3Ç®d\À˛\Œ`5ˆÜ\Ê˙ˆ\ÎkÄ\œG:8S\∆eà&`â≠aÃ®\‡,¿k¿ R%bDbë\Ì\ÿ{d2o\Êg\Íû\ﬂ\“\—p]KG\√5o\Ô¯`ß\¬(PAÑônÆ1mÿä¯∏g\Ãvq©PÚR\‰†Ò{à+êÀÉ\Œ÷ï¿üuÇfÇÆ\0.\«l\ﬁ`\€i\‰\Î†Q§É∂\”\‡\ƒ\nIOg2\Óz≥?d_Ø\ÓB\Z\“B;,)ôƒæL°ÜµÅˇ¢TÚÕò!†%\‰,¡ﬁå4À∞S)i3Pãy8ê©M“µaòûz1o!*∞ªë*\√!s_KGC\¬A\ﬁgõ\Î_L4ØhO∑t¨º\›hπÇ√¶õåÖ\Ólıf§/ø(¿Ù ≠\ﬁ\0:êˆ\0\ÎeÜÉó,\’cºTÚ}ÜÉB˜7◊∑n\Ÿ⁄∞Xàt\Î\ƒ}8>5\„6¡\\»ªªûL¥lm(<¸cs˝ã±*&GæUàû\Ê˙ˆ~ÄñéÜ/bûh^\—>:A\÷B\⁄>!\Á¥–øbL\ÿÖúcD«•EÛƒù\'WΩßÇá∏3õ£8Öæ\‰òIã\ﬁOD“â\‹?Næ˜%N\'j˚DqgByì9;_æ®\Ã\ÁX9\—Y7P\'ìs“êkiM˚ˆiú~8!ßwˇpÃßwì-d\Zπ1-\ÔN \'\”Ú\Ós¢∂OÀª)\‚ú4LÀªi|x0-\Ô\n√¥º;\rê∑ˇ˛ªÙˆ¡\ƒ_|\0\0\0\0IENDÆB`Ç','image/png','STU','EMP','2015-05-27 15:15:15',1,'2016-09-29 19:36:09',1);
/*!40000 ALTER TABLE `organization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `section`
--

DROP TABLE IF EXISTS `section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `section` (
  `section_id` int(11) NOT NULL AUTO_INCREMENT,
  `section_name` varchar(50) NOT NULL,
  `section_batch_id` int(11) NOT NULL,
  `intake` int(5) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `is_status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`section_id`),
  UNIQUE KEY `section_name` (`section_name`,`section_batch_id`),
  KEY `section_batch_id` (`section_batch_id`),
  KEY `created_by` (`created_by`),
  KEY `updated_by` (`updated_by`),
  CONSTRAINT `section_ibfk_1` FOREIGN KEY (`section_batch_id`) REFERENCES `batches` (`batch_id`),
  CONSTRAINT `section_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `section_ibfk_3` FOREIGN KEY (`updated_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `section`
--

LOCK TABLES `section` WRITE;
/*!40000 ALTER TABLE `section` DISABLE KEYS */;
INSERT INTO `section` VALUES (1,'MCA-Section-01',1,60,'2015-05-27 15:28:16',1,NULL,NULL,0),(2,'BCA-Section-01',2,60,'2015-05-27 15:29:11',1,NULL,NULL,0),(3,'MSCIT-Sectio-01',3,60,'2015-05-27 15:30:36',1,NULL,NULL,0),(4,'BSCIT-Section-01',4,60,'2015-05-27 15:32:34',1,NULL,NULL,0),(5,'MBA-Section-01',5,60,'2015-05-27 15:33:32',1,NULL,NULL,0);
/*!40000 ALTER TABLE `section` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `state`
--

DROP TABLE IF EXISTS `state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `state` (
  `state_id` int(11) NOT NULL AUTO_INCREMENT,
  `state_name` varchar(35) NOT NULL,
  `state_country_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `is_status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`state_id`),
  UNIQUE KEY `state_name` (`state_name`,`state_country_id`),
  KEY `created_by` (`created_by`),
  KEY `updated_by` (`updated_by`),
  KEY `state_country_id` (`state_country_id`),
  CONSTRAINT `state_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `state_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `state_ibfk_3` FOREIGN KEY (`state_country_id`) REFERENCES `country` (`country_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `state`
--

LOCK TABLES `state` WRITE;
/*!40000 ALTER TABLE `state` DISABLE KEYS */;
INSERT INTO `state` VALUES (1,'Gujarat',1,'2015-05-27 15:20:18',1,NULL,NULL,0),(2,'Maharashtra',1,'2015-05-27 15:20:29',1,NULL,NULL,0),(3,'New York',2,'2015-05-27 15:20:38',1,NULL,NULL,0),(4,'Melborne',3,'2015-05-27 15:20:49',1,NULL,NULL,0),(5,'New Jersey',2,'2015-05-27 16:18:02',1,NULL,NULL,0),(6,'Bedfordshire',4,'2015-05-27 16:19:49',1,NULL,NULL,0),(7,'Cornwall',4,'2015-05-27 16:20:03',1,NULL,NULL,0),(8,'New South Wales',3,'2015-05-27 16:20:42',1,NULL,NULL,0),(9,'California',2,'2015-05-28 11:22:06',1,NULL,NULL,0);
/*!40000 ALTER TABLE `state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stu_address`
--

DROP TABLE IF EXISTS `stu_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stu_address` (
  `stu_address_id` int(11) NOT NULL AUTO_INCREMENT,
  `stu_cadd` varchar(255) DEFAULT NULL,
  `stu_cadd_city` int(11) DEFAULT NULL,
  `stu_cadd_state` int(11) DEFAULT NULL,
  `stu_cadd_country` int(11) DEFAULT NULL,
  `stu_cadd_pincode` int(6) DEFAULT NULL,
  `stu_cadd_house_no` varchar(25) DEFAULT NULL,
  `stu_cadd_phone_no` varchar(25) DEFAULT NULL,
  `stu_padd` varchar(255) DEFAULT NULL,
  `stu_padd_city` int(11) DEFAULT NULL,
  `stu_padd_state` int(11) DEFAULT NULL,
  `stu_padd_country` int(11) DEFAULT NULL,
  `stu_padd_pincode` int(6) DEFAULT NULL,
  `stu_padd_house_no` varchar(25) DEFAULT NULL,
  `stu_padd_phone_no` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`stu_address_id`),
  KEY `stu_cadd_city` (`stu_cadd_city`),
  KEY `stu_cadd_state` (`stu_cadd_state`),
  KEY `stu_cadd_country` (`stu_cadd_country`),
  KEY `stu_padd_city` (`stu_padd_city`),
  KEY `stu_padd_state` (`stu_padd_state`),
  KEY `stu_padd_country` (`stu_padd_country`),
  CONSTRAINT `stu_address_ibfk_13` FOREIGN KEY (`stu_cadd_city`) REFERENCES `city` (`city_id`),
  CONSTRAINT `stu_address_ibfk_14` FOREIGN KEY (`stu_cadd_state`) REFERENCES `state` (`state_id`),
  CONSTRAINT `stu_address_ibfk_15` FOREIGN KEY (`stu_cadd_country`) REFERENCES `country` (`country_id`),
  CONSTRAINT `stu_address_ibfk_16` FOREIGN KEY (`stu_padd_city`) REFERENCES `city` (`city_id`),
  CONSTRAINT `stu_address_ibfk_17` FOREIGN KEY (`stu_padd_state`) REFERENCES `state` (`state_id`),
  CONSTRAINT `stu_address_ibfk_18` FOREIGN KEY (`stu_padd_country`) REFERENCES `country` (`country_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stu_address`
--

LOCK TABLES `stu_address` WRITE;
/*!40000 ALTER TABLE `stu_address` DISABLE KEYS */;
INSERT INTO `stu_address` VALUES (1,'50 A, Hauz Khas Village (3rd Floor)',1,1,1,342376,'50','(0234)4345565','6 Hamid Road, City Station',3,2,1,456734,'6','(022)2345687'),(2,'259-A West 55th Street, New York, ML, 10019',4,3,2,10019,'259','(0234)4345565','259-A West 55th Street, New York, ML, 10019',4,3,2,10019,'259','(0234)4345565'),(3,'JU-390. It first flew in Bodo',4,3,2,10035,'390','(0234)6575565','59-A West 55th Street, New York',4,3,2,10019,'59','(0234)4345565'),(4,'Flat No. 100, Triveni Apartments, Pitam Pura',9,2,1,400876,'100','(0234)4345000','15, Red Cross Street, Agripada',3,2,1,400008,'15','(022)2345687'),(5,'Friends Au Pair Agency, 2 Fairmile Avenue',11,5,2,10098,'2','(0934)4345565','Northgate House, 21-23 Valpy Street',15,8,3,456734,'100','(0282)2345681'),(6,'300, Lane Number 9, Manekbaug Society, Ambawadi',1,1,1,380015,'300','(079)24345565','Government Quarters AMTS Bus Stop, Surendra Mangaldas Road, Nehru Nagar, H Colony',1,1,1,380006,'12','(0792)2345687'),(7,'16, Warje Malwadi Road, Bhalekar Chawl, Erandwane',8,2,1,411004,'16','(0223)4345000','5 Acacia Crescent, WIGAN, WN6 8QZ',4,3,2,10019,'5','(0792)2345687'),(8,'1, Camp Road, Haripura, Asarwa',1,1,1,380015,'1','(079)24345565','Shahibaug, Bhadreshwar Society, Kazipur Dariyapur',9,2,1,400023,'A12','(0224)2345681'),(9,'Pedestrian Overpass, Red Hills, Lakdikapul,',6,1,1,361001,'34','(0288)24345565','670, Mahatma Gandhi Road, Choithram Mandi, Imli Bazaar',10,2,1,400045,'670','(0224)2347899'),(10,'3 Moffat Road, New south wales',15,8,3,20035,'3','(0034)4345565','Opp. PO Box  Ng2 6Tw, 22 Grange Park, West Bridgford',4,3,2,10019,'12','(0934)4345585'),(11,'8, CN Complex, Sardar Road, Thakkarbapa Nagar',2,1,1,390015,'8','(0798)4345565','A 237, Okhla I, Pocket A, Okhla Phase I, Okhla Industrial Area',10,2,1,430456,'A-237','(02324)2347899'),(12,'B-1/492 Janakpuri',2,1,1,342376,'B-1','(0234)4345565','12/3 Kalkaji Extension, Opp. Nehru Place',8,2,1,456734,'12','(022)2345687'),(13,'156, Bhagat Singh Market, Near Gole Market, Ahmedabad',1,1,1,342344,'12','','174-176 Somdutt Chambers II, 9 Bhikaji Cama Place.',3,2,1,345456,'100',''),(14,'Open Guarden, JP Office, Vaibhav Street',4,3,2,342344,'134','(0234)4345564','Open Guarden, JP Office, Vaibhav Street',4,3,2,342344,'134','(022)2345681'),(15,'300 BOYLSTON AVE E, SEATTLE WA 98102, USA',4,3,2,342344,'23','(0234)4345565','100 MAIN ST, PO BOX 1022, SEATTLE WA 98104, USA',4,3,2,345456,'100','(022)2345687');
/*!40000 ALTER TABLE `stu_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stu_category`
--

DROP TABLE IF EXISTS `stu_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stu_category` (
  `stu_category_id` int(11) NOT NULL AUTO_INCREMENT,
  `stu_category_name` varchar(50) NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `is_status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`stu_category_id`),
  KEY `updated_by` (`updated_by`),
  KEY `created_by` (`created_by`),
  CONSTRAINT `stu_category_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `stu_category_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stu_category`
--

LOCK TABLES `stu_category` WRITE;
/*!40000 ALTER TABLE `stu_category` DISABLE KEYS */;
INSERT INTO `stu_category` VALUES (1,'OPEN','2015-05-27 15:45:15',1,NULL,NULL,0),(2,'ST','2015-05-27 15:45:22',1,NULL,NULL,0),(3,'NRI','2015-05-27 15:45:26',1,NULL,NULL,0),(4,'OBC','2015-05-27 15:45:32',1,NULL,NULL,0),(5,'NTSF','2015-05-27 15:45:41',1,NULL,NULL,0);
/*!40000 ALTER TABLE `stu_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stu_info`
--

DROP TABLE IF EXISTS `stu_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stu_info` (
  `stu_info_id` int(11) NOT NULL AUTO_INCREMENT,
  `stu_unique_id` int(11) NOT NULL,
  `stu_title` varchar(5) DEFAULT NULL,
  `stu_first_name` varchar(50) NOT NULL,
  `stu_middle_name` varchar(50) DEFAULT NULL,
  `stu_last_name` varchar(50) NOT NULL,
  `stu_gender` varchar(10) DEFAULT NULL,
  `stu_dob` date NOT NULL,
  `stu_email_id` varchar(65) DEFAULT NULL,
  `stu_bloodgroup` varchar(10) DEFAULT 'Unknown',
  `stu_birthplace` varchar(45) DEFAULT NULL,
  `stu_religion` varchar(50) DEFAULT NULL,
  `stu_admission_date` date NOT NULL,
  `stu_photo` varchar(150) DEFAULT NULL,
  `stu_languages` varchar(255) DEFAULT NULL,
  `stu_mobile_no` bigint(12) DEFAULT NULL,
  `stu_info_stu_master_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`stu_info_id`),
  UNIQUE KEY `stu_unique_id` (`stu_unique_id`),
  UNIQUE KEY `stu_email_id` (`stu_email_id`),
  KEY `stu_info_stu_master_id` (`stu_info_stu_master_id`),
  CONSTRAINT `stu_info_ibfk_3` FOREIGN KEY (`stu_info_stu_master_id`) REFERENCES `stu_master` (`stu_master_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stu_info`
--

LOCK TABLES `stu_info` WRITE;
/*!40000 ALTER TABLE `stu_info` DISABLE KEYS */;
INSERT INTO `stu_info` VALUES (1,1,'Mr.','Ankit','M','Narthi','Male','1992-05-16','ankit_narthi@gmail.com','AB-','Ahmedabad','Hindu','2015-06-01',NULL,'English,Gujarati',7695865796,1),(2,2,'Mr.','Kelvin','G','Kair','Male','1995-05-18','kelvin-kair@gmail.com','A+','USA','Christianity','2015-06-01',NULL,'English,German',8957345678,2),(3,3,'Ms.','Elena','G','Kaith','Female','1995-05-16','elenag@hotmail.com','O+','USA','Christianity','2015-06-02',NULL,'English,French',9068545678,3),(4,4,'Ms.','Nikita','N','Shah','Female','1994-05-19','nikita_shah@gmail.com','AB+','Ahmedabad','Hindu','2015-06-02',NULL,'Gujarati,English,Hindi,French',8957345678,4),(5,5,'Mr.','Elen','M','Watson','Male','1992-02-16','elen.wat@yahoo.com','AB+','England','Christianity','2015-06-02',NULL,'English,French',7695865796,5),(6,6,'Ms.','Anita','M','Kamriya','Female','1994-06-03','anita@gmail.com','AB-','Ahmedabad','Hindu','2015-06-03',NULL,'Gujarati,English',9755665655,6),(7,7,'Mr.','Mehul','N','Patel','Male','1995-05-10','mehul_p@gmail.com','B-','USA','Hindu','2015-06-01',NULL,'English,Gujarati',7695865796,7),(8,8,'Ms.','Kinjal','N','Ruparel','Female','1995-05-16','kinjal@yahoo.com','AB+','Ahmedabad','Hindu','2015-06-08',NULL,'English,Hindi,Gujarati',8957345678,8),(9,9,'Mr.','Nayan','G','Marty','Male','1993-08-19','nayan.mty@gmail.com','AB+','Ahmedabad','Hindu','2015-06-10',NULL,'English,Gujarati,Hindi',7695865796,9),(10,10,'Ms.','Kiran','L','Katariya','Female','1993-02-28','kiran_lk@yahoo.com','O+','New York','Hindu','2015-06-01',NULL,'English,French',8957345678,10),(11,11,'Mr.','Rahul','W','Sharma','Male','1995-10-18','rahul.sharma@gmail.com','AB+','Ahmedabad','Hindu','2015-05-30',NULL,'English,Gujarati,Hindi,French,Russian',8957345678,11),(12,12,'Ms.','Brinzal','M','Thumar','Female','1992-09-16','brinzal@yahoo.com','AB+','Ahmedabad','Hindu','2015-05-30',NULL,'English,Hindi',7695865796,12),(13,13,'Mr.','Kishan','M','Kumar','Male','1993-06-01','kishan@gml.com','B+','Ahmedabad','Hindu','2015-05-30',NULL,'English,Hindi,Gujarati',7695865797,13),(14,14,'Mr.','Zakain','G','Zuila','Male','1993-05-21','zakain@gmail.com','B-','USA','Christianity','2015-06-15',NULL,'English,German',7695865796,14),(15,15,'Ms.','Nash','H','Kabunda','Female','1994-11-30',NULL,'A+','Ahmedabad','Jainism','2015-06-03',NULL,'French,English',7695865796,15);
/*!40000 ALTER TABLE `stu_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stu_master`
--

DROP TABLE IF EXISTS `stu_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stu_master` (
  `stu_master_id` int(11) NOT NULL AUTO_INCREMENT,
  `stu_master_stu_info_id` int(11) NOT NULL,
  `stu_master_user_id` int(11) NOT NULL,
  `stu_master_nationality_id` int(11) DEFAULT NULL,
  `stu_master_category_id` int(11) DEFAULT NULL,
  `stu_master_course_id` int(11) NOT NULL,
  `stu_master_batch_id` int(11) NOT NULL,
  `stu_master_section_id` int(11) NOT NULL,
  `stu_master_stu_status_id` int(11) NOT NULL DEFAULT '0',
  `stu_master_stu_address_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `is_status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`stu_master_id`),
  UNIQUE KEY `stu_master_stu_info_id` (`stu_master_stu_info_id`),
  UNIQUE KEY `stu_master_user_id` (`stu_master_user_id`),
  KEY `stu_master_nationality_id` (`stu_master_nationality_id`),
  KEY `stu_master_category` (`stu_master_category_id`),
  KEY `stu_master_course_id` (`stu_master_course_id`),
  KEY `stu_master_batch_id` (`stu_master_batch_id`),
  KEY `stu_master_section_id` (`stu_master_section_id`),
  KEY `stu_master_stu_address_id` (`stu_master_stu_address_id`),
  KEY `created_by` (`created_by`),
  KEY `updated_by` (`updated_by`),
  KEY `stu_master_stu_info_id_fng` (`stu_master_stu_info_id`),
  CONSTRAINT `stu_master_ibfk_12` FOREIGN KEY (`stu_master_stu_info_id`) REFERENCES `stu_info` (`stu_info_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `stu_master_ibfk_13` FOREIGN KEY (`stu_master_user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `stu_master_ibfk_14` FOREIGN KEY (`stu_master_nationality_id`) REFERENCES `nationality` (`nationality_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `stu_master_ibfk_15` FOREIGN KEY (`stu_master_category_id`) REFERENCES `stu_category` (`stu_category_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `stu_master_ibfk_16` FOREIGN KEY (`stu_master_course_id`) REFERENCES `courses` (`course_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `stu_master_ibfk_17` FOREIGN KEY (`stu_master_batch_id`) REFERENCES `batches` (`batch_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `stu_master_ibfk_18` FOREIGN KEY (`stu_master_section_id`) REFERENCES `section` (`section_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `stu_master_ibfk_20` FOREIGN KEY (`stu_master_stu_address_id`) REFERENCES `stu_address` (`stu_address_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `stu_master_ibfk_21` FOREIGN KEY (`created_by`) REFERENCES `users` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `stu_master_ibfk_22` FOREIGN KEY (`updated_by`) REFERENCES `users` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stu_master`
--

LOCK TABLES `stu_master` WRITE;
/*!40000 ALTER TABLE `stu_master` DISABLE KEYS */;
INSERT INTO `stu_master` VALUES (1,1,2,1,1,1,1,1,0,1,'2015-05-27 15:46:54',1,'2015-05-28 11:48:16',1,0),(2,2,3,3,1,2,2,2,1,2,'2015-05-27 15:49:17',1,'2015-05-28 11:57:02',1,0),(3,3,5,2,1,3,3,3,0,3,'2015-05-27 15:52:16',1,'2015-05-28 12:09:32',1,0),(4,4,6,1,1,4,4,4,0,4,'2015-05-27 15:54:31',1,'2015-05-28 12:18:44',1,0),(5,5,7,3,1,5,5,5,0,5,'2015-05-27 15:56:35',1,'2015-05-28 12:29:35',1,0),(6,6,8,1,1,1,1,1,0,6,'2015-05-27 15:58:01',1,'2015-05-28 12:38:51',1,0),(7,7,9,1,1,1,1,1,0,7,'2015-05-27 15:58:55',1,'2015-05-28 12:47:58',1,0),(8,8,10,1,1,1,1,1,0,8,'2015-05-27 15:59:46',1,'2015-05-28 13:47:42',1,0),(9,9,11,1,1,1,1,1,0,9,'2015-05-27 16:00:36',1,'2015-05-28 14:03:25',1,0),(10,10,12,3,3,2,2,2,0,10,'2015-05-27 16:03:10',1,'2015-05-28 14:12:52',1,0),(11,11,13,1,1,3,3,3,0,11,'2015-05-27 16:04:12',1,'2015-05-28 14:22:41',1,0),(12,12,14,1,1,4,4,4,0,12,'2015-05-27 16:05:04',1,'2015-05-27 18:18:03',1,0),(13,13,16,1,NULL,5,5,5,0,13,'2015-05-27 16:05:57',1,'2015-05-28 11:12:01',1,0),(14,14,17,4,3,2,2,2,0,14,'2015-05-27 16:07:27',1,'2015-05-28 10:18:35',1,0),(15,15,18,NULL,3,3,3,3,0,15,'2015-05-27 16:09:01',1,'2015-05-27 18:58:02',1,0);
/*!40000 ALTER TABLE `stu_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_login_id` varchar(65) NOT NULL,
  `user_password` varchar(150) NOT NULL,
  `user_type` char(2) NOT NULL,
  `is_block` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_login_id` (`user_login_id`),
  KEY `updated_by` (`updated_by`),
  KEY `created_by` (`created_by`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `users_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','f6fdffe48c908deb0f4c3bd36c032e72','A',0,'2015-05-27 15:15:15',1,NULL,NULL),(2,'STU1','9eec8bdac758e026f61eceea1643bcf6','S',0,'2015-05-27 15:46:53',1,NULL,NULL),(3,'STU2','988336da8e17651761c198904aaa4468','S',0,'2015-05-27 15:49:16',1,NULL,NULL),(4,'EMP1','2e456720df11dd2a263db708885278dd','E',0,'2015-05-27 15:49:34',1,NULL,NULL),(5,'STU3','9d181ca9c5e0be7f0eee5fdbc49502e8','S',0,'2015-05-27 15:52:16',1,NULL,NULL),(6,'STU4','8b7f68fe1bdeeea6d83a99c4c311bf17','S',0,'2015-05-27 15:54:31',1,NULL,NULL),(7,'STU5','cd1c5053334fdb94f7c30d1501cad621','S',0,'2015-05-27 15:56:35',1,NULL,NULL),(8,'STU6','77df347c204b524bd3771095bcefa07a','S',0,'2015-05-27 15:58:01',1,NULL,NULL),(9,'STU7','f1f9b64bf9cee88c7b27e74369dfa4bb','S',0,'2015-05-27 15:58:55',1,NULL,NULL),(10,'STU8','72858da985e41515fc3ea732d7ecfeb3','S',0,'2015-05-27 15:59:46',1,NULL,NULL),(11,'STU9','eed13ada411f4541fd1dbefce171bd55','S',0,'2015-05-27 16:00:36',1,NULL,NULL),(12,'STU10','182169fe3e8ae3a3f1f887f62d45451e','S',0,'2015-05-27 16:03:09',1,NULL,NULL),(13,'STU11','db58d86d9d2a2019fe975e253ff2a7e4','S',0,'2015-05-27 16:04:12',1,NULL,NULL),(14,'STU12','23be7c1a3c95ba1f6eaa9809836d8929','S',0,'2015-05-27 16:05:03',1,NULL,NULL),(15,'EMP2','71d0547b67a46cc258a5d5e42cdf8a38','E',0,'2015-05-27 16:05:39',1,NULL,NULL),(16,'STU13','9b9e9054ae3fa03db69f5ffcb31de3bf','S',0,'2015-05-27 16:05:57',1,NULL,NULL),(17,'STU14','fc6b063ad199d819d91ea8abbad75f1d','S',0,'2015-05-27 16:07:27',1,NULL,NULL),(18,'student','50d9482e20934ce6df0bf28941f885bc','S',0,'2015-05-27 16:09:01',1,'2015-05-28 15:23:18',1),(19,'EMP3','7dba0ef26119281c5b2401d1c3e438d7','E',0,'2015-05-27 16:17:58',1,NULL,NULL),(20,'EMP4','70973454ecef4dc76f57a25fcccb5dff','E',0,'2015-05-27 16:36:41',1,NULL,NULL),(21,'EMP5','67d1667c0a02dd6111f540ed67c9ef69','E',0,'2015-05-27 16:44:05',1,NULL,NULL),(22,'EMP6','b1a2a6d3a941c9beb37d90124752aa89','E',0,'2015-05-27 16:52:30',1,NULL,NULL),(23,'EMP7','904a06c1c7b35546c1306ae8d899b5f4','E',0,'2015-05-27 17:21:56',1,NULL,NULL),(24,'EMP8','3042ad16c7d7132aa812fe493020451a','E',0,'2015-05-27 17:32:07',1,NULL,NULL),(25,'EMP9','4bfc2178e2b10cf04722fad23d96338f','E',0,'2015-05-27 17:51:50',1,NULL,NULL),(26,'EMP10','372e13abd52819c24cf69b6176384713','E',0,'2015-05-28 09:52:52',1,NULL,NULL),(27,'EMP11','64d35fe5e60a341cb5fabd8c510f9388','E',0,'2015-05-28 10:04:55',1,NULL,NULL),(28,'EMP12','0232da60f0de39e94db7fd5af15237df','E',0,'2015-05-28 10:16:16',1,NULL,NULL),(29,'EMP13','3fb9df001c51f2902ab47c5f8562b91d','E',0,'2015-05-28 10:39:23',1,NULL,NULL),(30,'EMP14','53403031692143495b454aa55b99d4e4','E',0,'2015-05-28 11:12:20',1,NULL,NULL),(31,'EMP15','e28a9d86da3523c266ccd1e8fe230a41','E',0,'2015-05-28 13:03:55',1,NULL,NULL),(32,'EMP16','49798c363d34f4c2716bc5494b2b380c','E',0,'2015-05-28 13:11:32',1,NULL,NULL),(33,'employee','9c0967753a201ecde21ef29efa514761','E',0,'2015-05-28 14:42:13',1,'2015-05-28 15:23:38',1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-10-17 12:25:54
