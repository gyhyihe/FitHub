-- MySQL dump 10.16  Distrib 10.1.26-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: db
-- ------------------------------------------------------
-- Server version	10.1.26-MariaDB-0+deb9u1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) DEFAULT NULL,
  `name` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  `permission_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) DEFAULT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `codename` varchar(100) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,1,'add_question','Can add question'),(2,1,'change_question','Can change question'),(3,1,'delete_question','Can delete question'),(4,1,'view_question','Can view question'),(5,2,'add_choice','Can add choice'),(6,2,'change_choice','Can change choice'),(7,2,'delete_choice','Can delete choice'),(8,2,'view_choice','Can view choice'),(9,3,'add_test','Can add test'),(10,3,'change_test','Can change test'),(11,3,'delete_test','Can delete test'),(12,3,'view_test','Can view test'),(13,4,'add_user','Can add user'),(14,4,'change_user','Can change user'),(15,4,'delete_user','Can delete user'),(16,4,'view_user','Can view user'),(17,5,'add_class','Can add class'),(18,5,'change_class','Can change class'),(19,5,'delete_class','Can delete class'),(20,5,'view_class','Can view class'),(21,6,'add_membership','Can add membership'),(22,6,'change_membership','Can change membership'),(23,6,'delete_membership','Can delete membership'),(24,6,'view_membership','Can view membership'),(25,7,'add_member','Can add member'),(26,7,'change_member','Can change member'),(27,7,'delete_member','Can delete member'),(28,7,'view_member','Can view member'),(29,8,'add_staff','Can add staff'),(30,8,'change_staff','Can change staff'),(31,8,'delete_staff','Can delete staff'),(32,8,'view_staff','Can view staff'),(33,9,'add_logentry','Can add log entry'),(34,9,'change_logentry','Can change log entry'),(35,9,'delete_logentry','Can delete log entry'),(36,9,'view_logentry','Can view log entry'),(37,10,'add_permission','Can add permission'),(38,10,'change_permission','Can change permission'),(39,10,'delete_permission','Can delete permission'),(40,10,'view_permission','Can view permission'),(41,11,'add_group','Can add group'),(42,11,'change_group','Can change group'),(43,11,'delete_group','Can delete group'),(44,11,'view_group','Can view group'),(45,12,'add_contenttype','Can add content type'),(46,12,'change_contenttype','Can change content type'),(47,12,'delete_contenttype','Can delete content type'),(48,12,'view_contenttype','Can view content type'),(49,13,'add_session','Can add session'),(50,13,'change_session','Can change session'),(51,13,'delete_session','Can delete session'),(52,13,'view_session','Can view session'),(53,14,'add_level','Can add level'),(54,14,'change_level','Can change level'),(55,14,'delete_level','Can delete level'),(56,15,'add_memberlevel','Can add member level'),(57,15,'change_memberlevel','Can change member level'),(58,15,'delete_memberlevel','Can delete member level'),(59,16,'add_question','Can add question'),(60,16,'change_question','Can change question'),(61,16,'delete_question','Can delete question'),(62,17,'add_choice','Can add choice'),(63,17,'change_choice','Can change choice'),(64,17,'delete_choice','Can delete choice'),(65,18,'add_test','Can add test'),(66,18,'change_test','Can change test'),(67,18,'delete_test','Can delete test'),(68,15,'view_memberlevel','Can view member level');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) DEFAULT NULL,
  `action_time` datetime DEFAULT NULL,
  `object_id` text,
  `object_repr` varchar(200) DEFAULT NULL,
  `change_message` text,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `action_flag` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2019-04-28 00:00:00','3','Staff object (3)','[{\"added\": {}}]',8,1,'1'),(2,'2019-04-28 00:00:00','1','Class object (1)','[{\"added\": {}}]',5,1,'1'),(3,'2019-04-28 00:00:00','1','Member object (1)','[{\"changed\": {\"fields\": [\"user\", \"classes\", \"name\", \"email\", \"phone_number\"]}}]',7,1,'2'),(4,'2019-04-28 00:00:00','1','Member object (1)','[{\"changed\": {\"fields\": [\"name\"]}}]',7,1,'2'),(5,'2019-04-28 00:00:00','1','Member object (1)','[]',7,1,'2'),(6,'2019-04-29 00:00:00','1','Class object (1)','[{\"changed\": {\"fields\": [\"name\"]}}]',5,1,'2'),(7,'2019-04-29 00:00:00','B','MemberLevel object (B)','[{\"changed\": {\"fields\": [\"price\"]}}]',15,1,'2'),(8,'2019-04-29 00:00:00','B','MemberLevel object (B)','[{\"changed\": {\"fields\": [\"price\"]}}]',15,1,'2'),(9,'2019-04-29 00:00:00','S','MemberLevel object (S)','[{\"added\": {}}]',15,1,'1'),(10,'2019-04-29 00:00:00','G','MemberLevel object (G)','[{\"added\": {}}]',15,1,'1'),(11,'2019-04-29 00:00:00','P','MemberLevel object (P)','[{\"added\": {}}]',15,1,'1'),(12,'2019-04-29 00:00:00','D','MemberLevel object (D)','[{\"added\": {}}]',15,1,'1'),(13,'2019-04-29 00:00:00','2','','',4,1,'3'),(14,'2019-04-29 00:00:00','1','Member object (1)','[{\"changed\": {\"fields\": [\"level\"]}}]',7,1,'2'),(15,'2019-04-29 00:00:00','1','Member object (1)','[{\"changed\": {\"fields\": [\"funds\"]}}]',7,1,'2'),(16,'2019-04-29 00:00:00','2','Class object (2)','[{\"added\": {}}]',5,4,'1'),(17,'2019-04-29 00:00:00','3','Member object (3)','[{\"changed\": {\"fields\": [\"classes\", \"name\", \"email\", \"phone_number\"]}}]',7,4,'2'),(18,'2019-04-29 00:00:00','3','Member object (3)','[]',7,4,'2'),(19,'2019-04-29 00:00:00','3','Member object (3)','[{\"changed\": {\"fields\": [\"classes\"]}}]',7,4,'2'),(20,'2019-04-29 00:00:00','3','Member object (3)','[]',7,4,'2'),(21,'2019-04-29 00:00:00','3','Member object (3)','[{\"changed\": {\"fields\": [\"name\"]}}]',7,4,'2'),(22,'2019-04-29 00:00:00','1','Member object (1)','[]',7,1,'2'),(23,'2019-04-29 00:00:00','2','Class object (2)','[{\"changed\": {\"fields\": [\"time_start\", \"time_end\"]}}]',5,1,'2'),(24,'2019-04-30 00:00:00','3','Member object (3)','[{\"changed\": {\"fields\": [\"classes\"]}}]',7,1,'2'),(25,'2019-04-30 00:00:00','3','Member object (3)','[]',7,1,'2'),(26,'2019-04-30 00:00:00','5','luojh2014','[{\"added\": {}}]',4,1,'1'),(27,'2019-04-30 00:00:00','5','Member object (5)','[{\"added\": {}}]',7,1,'1'),(28,'2019-04-30 00:00:00','3','Class object (3)','[{\"added\": {}}]',5,1,'1'),(29,'2019-04-30 00:00:00','3','Member object (3)','[{\"changed\": {\"fields\": [\"classes\", \"phone_number\"]}}]',7,1,'2'),(30,'2019-04-30 00:00:00','3','Member object (3)','[{\"changed\": {\"fields\": [\"classes\"]}}]',7,1,'2'),(31,'2019-04-30 00:00:00','3','Member object (3)','[{\"changed\": {\"fields\": [\"classes\"]}}]',7,1,'2'),(32,'2019-04-30 00:00:00','3','Member object (3)','[{\"changed\": {\"fields\": [\"classes\"]}}]',7,1,'2'),(33,'2019-04-30 00:00:00','3','Member object (3)','[{\"changed\": {\"fields\": [\"classes\"]}}]',7,1,'2'),(34,'2019-04-30 00:00:00','3','Member object (3)','[{\"changed\": {\"fields\": [\"classes\"]}}]',7,1,'2'),(35,'2019-04-30 00:00:00','3','Member object (3)','[{\"changed\": {\"fields\": [\"classes\"]}}]',7,1,'2'),(36,'2019-04-30 00:00:00','3','Member object (3)','[{\"changed\": {\"fields\": [\"phone_number\"]}}]',7,1,'2'),(37,'2019-04-30 00:00:00','3','Member object (3)','[{\"changed\": {\"fields\": [\"classes\"]}}]',7,1,'2'),(38,'2019-04-30 00:00:00','3','Member object (3)','[{\"changed\": {\"fields\": [\"classes\"]}}]',7,1,'2'),(39,'2019-04-30 00:00:00','3','Member object (3)','[{\"changed\": {\"fields\": [\"classes\"]}}]',7,1,'2'),(40,'2019-04-30 00:00:00','4','Class object (4)','[{\"added\": {}}]',5,4,'1'),(41,'2019-05-01 00:00:00','9','yxl1632','[{\"added\": {}}]',4,4,'1'),(42,'2019-05-01 00:00:00','9','Member object (9)','[{\"added\": {}}]',7,4,'1'),(43,'2019-05-01 00:00:00','7','Member object (7)','[{\"added\": {}}]',7,1,'1'),(44,'2019-05-03 00:00:00','7','Member object (7)','[{\"changed\": {\"fields\": [\"level\"]}}]',7,1,'2'),(45,'2019-05-03 00:00:00','13','travis1997','[{\"added\": {}}]',4,1,'1'),(46,'2019-05-03 00:00:00','13','travis1997','[{\"changed\": {\"fields\": [\"is_staff\", \"is_superuser\"]}}]',4,1,'2'),(47,'2019-05-03 00:00:00','13','Member object (13)','[{\"added\": {}}]',7,1,'1'),(48,'2019-05-03 00:00:00','14','fukurou','[{\"changed\": {\"fields\": [\"first_name\", \"last_name\", \"email\"]}}]',4,1,'2'),(49,'2019-05-03 00:00:00','14','fukurou','[]',4,1,'2'),(50,'2019-05-03 00:00:00','14','Cameron Hochberg','[{\"changed\": {\"fields\": [\"classes\"]}}]',7,1,'2'),(51,'2019-05-03 00:00:00','1','GenTsuki','[{\"added\": {}}]',8,1,'1'),(52,'2019-05-03 00:00:00','5','Cardio Fitness','[{\"added\": {}}]',5,1,'1'),(53,'2019-05-03 00:00:00','6','Cardio Games','[{\"added\": {}}]',5,1,'1'),(54,'2019-05-04 00:00:00','20','gyh','[{\"added\": {}}]',7,20,'1'),(55,'2019-05-04 00:00:00','20','gyh','[{\"added\": {}}]',8,20,'1'),(56,'2019-05-05 00:00:00','24',' ','',7,1,'3'),(57,'2019-05-05 00:00:00','22',' ','',7,1,'3'),(58,'2019-05-05 00:00:00','21',' ','',7,1,'3'),(59,'2019-05-05 00:00:00','19',' ','',7,1,'3'),(60,'2019-05-05 00:00:00','18',' ','',7,1,'3');
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) DEFAULT NULL,
  `app_label` varchar(100) DEFAULT NULL,
  `model` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (9,'admin','logentry'),(11,'auth','group'),(10,'auth','permission'),(12,'contenttypes','contenttype'),(5,'login','class'),(14,'login','level'),(7,'login','member'),(15,'login','memberlevel'),(6,'login','membership'),(8,'login','staff'),(4,'login','user'),(2,'polls','choice'),(1,'polls','question'),(3,'polls','test'),(17,'profile','choice'),(16,'profile','question'),(18,'profile','test'),(13,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) DEFAULT NULL,
  `app` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `applied` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2019-04-20 00:00:00'),(2,'contenttypes','0002_remove_content_type_name','2019-04-20 00:00:00'),(3,'auth','0001_initial','2019-04-20 00:00:00'),(4,'auth','0002_alter_permission_name_max_length','2019-04-20 00:00:00'),(5,'auth','0003_alter_user_email_max_length','2019-04-20 00:00:00'),(6,'auth','0004_alter_user_username_opts','2019-04-20 00:00:00'),(7,'auth','0005_alter_user_last_login_null','2019-04-20 00:00:00'),(8,'auth','0006_require_contenttypes_0002','2019-04-20 00:00:00'),(9,'auth','0007_alter_validators_add_error_messages','2019-04-20 00:00:00'),(10,'auth','0008_alter_user_username_max_length','2019-04-20 00:00:00'),(11,'auth','0009_alter_user_last_name_max_length','2019-04-20 00:00:00'),(12,'login','0001_initial','2019-04-20 00:00:00'),(13,'admin','0001_initial','2019-04-20 00:00:00'),(14,'admin','0002_logentry_remove_auto_add','2019-04-20 00:00:00'),(15,'admin','0003_logentry_add_action_flag_choices','2019-04-20 00:00:00'),(16,'sessions','0001_initial','2019-04-20 00:00:00'),(17,'login','0002_level','2019-04-28 00:00:00'),(18,'login','0002_auto_20190428_0442','2019-04-28 00:00:00'),(19,'login','0003_auto_20190428_0522','2019-04-28 00:00:00'),(20,'login','0004_auto_20190428_0540','2019-04-28 00:00:00'),(21,'login','0005_auto_20190428_0603','2019-04-28 00:00:00'),(22,'login','0002_class_time_day','2019-04-28 00:00:00'),(23,'login','0002_auto_20190428_0620','2019-04-28 00:00:00'),(24,'polls','0001_initial','2019-04-28 00:00:00'),(25,'login','0002_auto_20190429_0030','2019-04-29 00:00:00'),(26,'login','0003_auto_20190429_0031','2019-04-29 00:00:00'),(27,'login','0004_auto_20190429_0038','2019-04-29 00:00:00'),(28,'auth','0010_alter_group_name_max_length','2019-04-29 00:00:00'),(29,'auth','0011_update_proxy_permissions','2019-04-29 00:00:00'),(30,'login','0002_auto_20190503_0018','2019-05-03 00:00:00'),(31,'admin','0004_auto_20190503_0156','2019-05-03 00:00:00'),(32,'login','0003_auto_20190503_0620','2019-05-03 00:00:00'),(33,'login','0004_class_description','2019-05-03 00:00:00'),(34,'login','0002_auto_20190504_2107','2019-05-04 00:00:00');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) DEFAULT NULL,
  `session_data` text,
  `expire_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('xjtzje5rliabrnb5kwkr6if2h9hk2r8v','ODRkZGU1OTUwYzc4ZjZhZmM1MTY0NTNjNWRiM2M5OGFhZTM1MmJiMzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwMjdjZGViYTEzYWNiYTYzNzQ1MDhhY2IxNWU4MDUzYzFlYmFhZmZhIn0=','2019-05-12 00:00:00'),('j93o2ndhbkxpwgc1xa0asqi4zphp476v','NGViODEwZTQwOGE4YjcwZjE5YmEwMGE1MDEzODI1NjZiYTNjYTA0ZTp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3YTc0MzJjMDhmOWRhMjVlMGRiZDFmMDg4N2YzMDcxMDVhYjA3MzgzIn0=','2019-05-13 00:00:00'),('d7s0vhe26uv5ibvrfvyc9x5nbac09dbm','ODRkZGU1OTUwYzc4ZjZhZmM1MTY0NTNjNWRiM2M5OGFhZTM1MmJiMzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwMjdjZGViYTEzYWNiYTYzNzQ1MDhhY2IxNWU4MDUzYzFlYmFhZmZhIn0=','2019-05-14 00:00:00'),('88egornrc1kkeid868osqn8u3fzcoduk','MDU0ZDM0ZmIxOWE0YWIyY2M5MWVkYTk5NzRhMmRlYTgzMzNjMDAyZTp7fQ==','2019-05-15 00:00:00'),('afl81h7z5ozruegpnjhh26n7vgfkvssg','MDU0ZDM0ZmIxOWE0YWIyY2M5MWVkYTk5NzRhMmRlYTgzMzNjMDAyZTp7fQ==','2019-05-15 00:00:00'),('jruf2gswa8d891eqfnztk7ucs2gqnwtd','MDU0ZDM0ZmIxOWE0YWIyY2M5MWVkYTk5NzRhMmRlYTgzMzNjMDAyZTp7fQ==','2019-05-15 00:00:00'),('p34m536xdjp0gh4ew0gpa16p15jkoyg2','MDU0ZDM0ZmIxOWE0YWIyY2M5MWVkYTk5NzRhMmRlYTgzMzNjMDAyZTp7fQ==','2019-05-15 00:00:00'),('pmv3707xa04ij2icg0f09j9f0adt87bp','N2IyZTQ3M2I1NTRkNjc5ZmNiNGFkYjYyYWJjZGY3ZjBiZjFiNTk2Mzp7Il9hdXRoX3VzZXJfaWQiOiI5IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyMWVhMDYzZTg0MGFmZmFkZmNlMjRiMmQzZTRhMmJjMzk4MDVkYzgwIn0=','2019-05-15 00:00:00'),('ty89dp699dalgad96491bi8pe149sr3d','ODY3NGYwMWMwNzJkZmQ5ODkyMjY3MGY0MzNlNzgyOGViNjI3OTkyYjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1YTI3OTU1ZTVhNTkxM2MwZGU3NjI4MWE1MDVjOTdhNTA0ZjAyOGJlIn0=','2019-05-17 00:00:00'),('cyzfo7g1d5ogzlesfc9xndi9b56bicyc','MmY5NmQ3OTNmYWI4OWExODhjZTc5MzE5MWQ4YWZhZGYwN2EzNjliMDp7Il9hdXRoX3VzZXJfaWQiOiIxMyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiOTA2YTlkNzEzMmU2ODQ1NjgzOWU1YTZkOGM2NjM1MTcwNDE4YzM0YyJ9','2019-05-17 00:00:00'),('jgfxk109s3cog74xgnx5q2cj7sw36jwg','MDRlZDQ4NDNkZTZmZmRkMmMyNmQyOGRkOWM1ZjFiMzhhZDZmMzQ0MTp7Il9hdXRoX3VzZXJfaWQiOiIxNiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYTNkZDQ3MjIwNjM4N2Y1YTJiNGJiYmJhNGMxN2NjNTg0ZWQ4ODMzNCJ9','2019-05-17 00:00:00'),('feptjv5j3bzgvk4yvn8wt6aeqpm51g51','ODY3NGYwMWMwNzJkZmQ5ODkyMjY3MGY0MzNlNzgyOGViNjI3OTkyYjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1YTI3OTU1ZTVhNTkxM2MwZGU3NjI4MWE1MDVjOTdhNTA0ZjAyOGJlIn0=','2019-05-17 00:00:00'),('5zrtf6onvrzrgbs0k9wh2uag2749s67r','YThkYmM3MTRiNTc0ZjM0ZjZhOTczMzlhMWM2NTUwOWQyNGVkNjM1Zjp7Il9hdXRoX3VzZXJfaWQiOiIyMCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMTEzMzM3YjBjZjAzNzU0ZjFiNGE0YjUwZmY4Y2UxMWNhYjdmZjE0ZiJ9','2019-05-18 00:00:00'),('umeys3h2077j1etzqaowh8rm6vz5cqhu','ODY3NGYwMWMwNzJkZmQ5ODkyMjY3MGY0MzNlNzgyOGViNjI3OTkyYjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1YTI3OTU1ZTVhNTkxM2MwZGU3NjI4MWE1MDVjOTdhNTA0ZjAyOGJlIn0=','2019-05-18 00:00:00'),('ktn2wkp1vowmmmnimtbqjtpl76kln3xm','ODY3NGYwMWMwNzJkZmQ5ODkyMjY3MGY0MzNlNzgyOGViNjI3OTkyYjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1YTI3OTU1ZTVhNTkxM2MwZGU3NjI4MWE1MDVjOTdhNTA0ZjAyOGJlIn0=','2019-05-18 00:00:00'),('5lqoapyv7kxmixq7kowichnmx2hbvfcw','MDU0ZDM0ZmIxOWE0YWIyY2M5MWVkYTk5NzRhMmRlYTgzMzNjMDAyZTp7fQ==','2019-05-18 00:00:00'),('80cufomdqa8tk56dte6zc8m7fnlqq21s','ODY3NGYwMWMwNzJkZmQ5ODkyMjY3MGY0MzNlNzgyOGViNjI3OTkyYjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1YTI3OTU1ZTVhNTkxM2MwZGU3NjI4MWE1MDVjOTdhNTA0ZjAyOGJlIn0=','2019-05-19 00:00:00');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login_class`
--

DROP TABLE IF EXISTS `login_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login_class` (
  `id` int(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `location` varchar(50) DEFAULT NULL,
  `time_day` varchar(3) DEFAULT NULL,
  `time_start` text,
  `time_end` text,
  `staff_id` int(11) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_class`
--

LOCK TABLES `login_class` WRITE;
/*!40000 ALTER TABLE `login_class` DISABLE KEYS */;
INSERT INTO `login_class` VALUES (1,'Swimming','Veale','WED','15:30:00','16:30:00',3,''),(2,'Yoga','Veale 306','WED','11:30:00','12:30:00',3,''),(3,'Tennis','Veale','SAT','18:00:00','19:00:00',3,''),(4,'Fencing','Veale 341','TUE','08:30:00','09:30:00',3,''),(5,'Cardio Fitness','Veale 201','TUE','10:30:00','11:30:00',1,''),(6,'Cardio Games','Veale 301','FRI','11:30:00','12:30:00',1,'');
/*!40000 ALTER TABLE `login_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login_level`
--

DROP TABLE IF EXISTS `login_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login_level` (
  `id` int(11) DEFAULT NULL,
  `level_status` varchar(1) DEFAULT NULL,
  `price` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_level`
--

LOCK TABLES `login_level` WRITE;
/*!40000 ALTER TABLE `login_level` DISABLE KEYS */;
/*!40000 ALTER TABLE `login_level` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login_member`
--

DROP TABLE IF EXISTS `login_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login_member` (
  `user_id` int(11) DEFAULT NULL,
  `funds` decimal(10,0) DEFAULT NULL,
  `expired_date` text,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(254) DEFAULT NULL,
  `level_id` varchar(1) DEFAULT NULL,
  `phone_number` varchar(17) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_member`
--

LOCK TABLES `login_member` WRITE;
/*!40000 ALTER TABLE `login_member` DISABLE KEYS */;
INSERT INTO `login_member` VALUES (1,50,'','GenTsuki','gentsk77@gmail.com','S','2165712111'),(3,0,'','Melody','gentsk77@gmail.com','G','2165564784'),(5,39,'','Huahua Luo','luojh2014@gmail.com','S',''),(7,520,'','Minglei','zhaminglei@qq.com','P',''),(9,9237,'','Melody Li','yxl1632@case.edu','D','2164561965'),(13,120,'','Travis','travis1997@126.com','G','13636468012'),(14,0,'','Cameron Hochberg','clh137@case.edu','B','1010101010'),(20,1000000,'','gyh','kljlj@case.edu','D','1111111111'),(25,0,'','testeer student','haha@gmail.com','B','1010101010'),(26,0,'','dfdf dfsf','dfsf@fds.com','B','1234567890'),(27,0,'','adfasfds afdfas','dfsf@sfd.com','B','1234567890');
/*!40000 ALTER TABLE `login_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login_member_classes`
--

DROP TABLE IF EXISTS `login_member_classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login_member_classes` (
  `id` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `class_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_member_classes`
--

LOCK TABLES `login_member_classes` WRITE;
/*!40000 ALTER TABLE `login_member_classes` DISABLE KEYS */;
INSERT INTO `login_member_classes` VALUES (58,1,2),(59,1,3),(60,1,4),(18,3,1),(22,3,2),(23,3,3),(24,3,4),(5,5,1),(28,7,1),(25,9,1),(26,9,2),(27,9,3),(29,13,1),(37,14,1),(38,14,2),(50,20,3),(51,20,4);
/*!40000 ALTER TABLE `login_member_classes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login_memberlevel`
--

DROP TABLE IF EXISTS `login_memberlevel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login_memberlevel` (
  `level_status` varchar(1) DEFAULT NULL,
  `price` decimal(10,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_memberlevel`
--

LOCK TABLES `login_memberlevel` WRITE;
/*!40000 ALTER TABLE `login_memberlevel` DISABLE KEYS */;
INSERT INTO `login_memberlevel` VALUES ('B',10),('S',17),('G',22),('P',30),('D',50);
/*!40000 ALTER TABLE `login_memberlevel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login_staff`
--

DROP TABLE IF EXISTS `login_staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login_staff` (
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_staff`
--

LOCK TABLES `login_staff` WRITE;
/*!40000 ALTER TABLE `login_staff` DISABLE KEYS */;
INSERT INTO `login_staff` VALUES (1,'GenTsuki'),(3,'Melody'),(20,'gyh');
/*!40000 ALTER TABLE `login_staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login_user`
--

DROP TABLE IF EXISTS `login_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login_user` (
  `id` int(11) DEFAULT NULL,
  `password` varchar(128) DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` text,
  `username` varchar(150) DEFAULT NULL,
  `first_name` varchar(30) DEFAULT NULL,
  `last_name` varchar(150) DEFAULT NULL,
  `email` varchar(254) DEFAULT NULL,
  `is_staff` text,
  `is_active` text,
  `date_joined` datetime DEFAULT NULL,
  `is_student` text,
  `is_teacher` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_user`
--

LOCK TABLES `login_user` WRITE;
/*!40000 ALTER TABLE `login_user` DISABLE KEYS */;
INSERT INTO `login_user` VALUES (1,'pbkdf2_sha256$100000$3lwn347k9bSg$RtG26HKqYOQH6wMTXByFNhqANdj4a6EvovDZWJWZI7M=','2019-05-05 00:00:00','1','gentsk77','','','gentsk77@gmail.com','1','1','2019-04-28 00:00:00','0','0'),(3,'','0000-00-00 00:00:00','0','Melody','','','','0','1','2019-04-28 00:00:00','1','0'),(4,'pbkdf2_sha256$150000$Ng2TJ7GgcdYM$Ye2rDU9TLhl/1E9WYWuQmhdFoenqHadV2vthtTucn/o=','2019-05-01 00:00:00','1','melodyli','','','yxl1632@case.edu','1','1','2019-04-29 00:00:00','0','0'),(5,'43997k7k','0000-00-00 00:00:00','0','luojh2014','Huahua','Luo','luojh2014@gmail.com','0','1','0000-00-00 00:00:00','1','0'),(6,'pbkdf2_sha256$150000$kjcZ6xYbSGZO$NHOs91OV067WbjWJzJHPK3wHd3tfj8gokrcHm1wI5x4=','0000-00-00 00:00:00','0','123333333','','','a@gmail.com','0','1','2019-04-30 00:00:00','0','0'),(7,'pbkdf2_sha256$150000$MNFjav7ynX2Y$CDXjYeKUmLWiulQVXTVaUuulM9wd7KL8xl46WgzlxD8=','2019-05-01 00:00:00','0','zhazha','','','zhaminglei@qq.com','0','1','2019-04-30 00:00:00','0','0'),(8,'pbkdf2_sha256$150000$X1SZrdbMlTWU$yZzM+H51axy4cGeD0dkZZEBT+lVGLoZxAht+PjXhDZA=','2019-04-30 00:00:00','0','zz','','','z@q.com','0','1','2019-04-30 00:00:00','0','0'),(9,'pbkdf2_sha256$150000$s5zhBzTnUUQG$u6CoeF4GGQqCtXSMlG7bOhQlOYZUjIb1LfrBJQmHs38=','2019-05-01 00:00:00','0','yxl1632','','','','0','1','2019-05-01 00:00:00','0','0'),(10,'pbkdf2_sha256$100000$Mbxd8lvO24tH$XEFa/4Zp9JdfxbbMcU2i0bYUvB/SdHsh/XurGv96SHM=','0000-00-00 00:00:00','0','yueyue','','','travis1997@126.com','0','1','2019-05-02 00:00:00','0','0'),(11,'pbkdf2_sha256$100000$XV5GXxDmuED9$zdagQ1URDbQgJyHBkW7yoBV7sb1w9PTMaGlEl8Ub2Z4=','2019-05-03 00:00:00','0','huahua','','','abc@126.com','0','1','2019-05-02 00:00:00','0','0'),(12,'pbkdf2_sha256$100000$XTwETDp8yyBX$LBygJhz/gSES1NuNDFYAXduR7qSK6DOpuH4wEKBITVU=','0000-00-00 00:00:00','0','miao','','','a@b.com','0','1','2019-05-03 00:00:00','0','0'),(13,'pbkdf2_sha256$100000$8hZQDlodMRRY$aIPDqQt++glSDBV7XuHsLebAnAxNZ/XIqT8nuZfC3Dc=','2019-05-03 00:00:00','1','travis1997','','','','1','1','0000-00-00 00:00:00','0','0'),(14,'pbkdf2_sha256$100000$ONfQU1whAebu$Kgz4YuuMuAw2EB6OrQCaNzKPY4F0LCuK8suXjnJrKOg=','2019-05-04 00:00:00','1','fukurou','Cameron','Hochberg','clh137@case.edu','1','1','0000-00-00 00:00:00','0','0'),(15,'pbkdf2_sha256$100000$mQzDlY5JWoj6$4oUa745/fwSun20Gocct7It7roBF5kwAurMsvmokp68=','0000-00-00 00:00:00','0','fukurouTeacher','','','caos2804@hotmail.com','0','1','2019-05-03 00:00:00','0','0'),(16,'pbkdf2_sha256$100000$MU9ru74tMZq2$4T7L4Wz4QJ4iifhK5Dy9PTLxofE46ARAGtRxC+j8jB0=','2019-05-03 00:00:00','0','fukurou1','','','cameronho@jcwj.com','0','1','2019-05-03 00:00:00','0','0'),(17,'pbkdf2_sha256$100000$nri4qeHwOsBb$Sz4UE91HynN+l6fVrqINGhfoC2Z+iztq0Xi2l9u5Nzw=','2019-05-03 00:00:00','0','luoman','','','luoman@gmail.com','0','1','2019-05-03 00:00:00','0','0'),(18,'pbkdf2_sha256$100000$j5ApshcWXYhP$TgFG0y22abI1fwaUOS7desmqFQkexbjBtEOgIfifF0c=','2019-05-03 00:00:00','0','ikea','','','ikea@gmail.com','0','1','2019-05-03 00:00:00','0','0'),(19,'pbkdf2_sha256$100000$X0lyxguQhfvb$0GdmSjuVB8bbtDTPml+nGO6qj4tFvo5t9pS3XsTd0lo=','2019-05-03 00:00:00','0','myname','','','myname@case.edu','0','1','2019-05-03 00:00:00','0','0'),(20,'pbkdf2_sha256$100000$bCptSYNOKXd5$RVHtqaFe1bQFn+ktcYOxXkX1WeuhE13BbfxSnP3Djnk=','2019-05-04 00:00:00','1','yxg352','','','yxg352@case.edu','1','1','2019-05-04 00:00:00','0','0'),(21,'pbkdf2_sha256$100000$nxvW7NZ0dnaA$4G/PrS8OInO0QVp08oHeZ9yjrKKnKsNth4s3qOUbles=','2019-05-04 00:00:00','0','ggyy','','','ggyy@case.edu','0','1','2019-05-04 00:00:00','0','0'),(22,'pbkdf2_sha256$100000$Qq6c6O2o6fZG$Cn5O9aMzsXs6DswLB1vBvmmBeAr1EDL0kERGceMDnUA=','2019-05-04 00:00:00','0','urulu','','','fukurou@gmail.com','0','1','2019-05-04 00:00:00','0','0'),(23,'pbkdf2_sha256$100000$7VYr9GEZawKF$hLC4/yq9gvVrSVU9lcv0TyX6H0dhMnkNzcZyM7XePRQ=','0000-00-00 00:00:00','0','test','','','cameronho@jcwj.com','0','1','2019-05-04 00:00:00','0','0'),(24,'pbkdf2_sha256$100000$eZMRj5svfAbE$ZpF5nOkpxxtXwm+NHJhFkHjJnNk/OmTksz3cEFAq6gY=','2019-05-04 00:00:00','0','test0','','','cameronho@jcwj.com','0','1','2019-05-04 00:00:00','0','0'),(25,'pbkdf2_sha256$100000$hY4jDSuoYtjr$YixzDQHhqDVUYD+1Mi32Ydty826yiRrHzOzTBY4cxBo=','2019-05-05 00:00:00','0','test3','testeer','student','haha@gmail.com','0','1','2019-05-05 00:00:00','0','0'),(26,'pbkdf2_sha256$100000$3wOKOMDg5iWM$4i92OG/7W1Cf8OjL9LBIlSV2VRfDsAhKkmqcUR3FG5Y=','2019-05-05 00:00:00','0','test5','dfdf','dfsf','dfsf@fds.com','0','1','2019-05-05 00:00:00','0','0'),(27,'pbkdf2_sha256$100000$DTwLOunlF4wm$S26bJ0FPOSu4H7QoJmRq9HPXJnCrrX4yqOD0psiFnsI=','2019-05-05 00:00:00','0','test2','adfasfds','afdfas','dfsf@sfd.com','0','1','2019-05-05 00:00:00','0','0');
/*!40000 ALTER TABLE `login_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login_user_groups`
--

DROP TABLE IF EXISTS `login_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login_user_groups` (
  `id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_user_groups`
--

LOCK TABLES `login_user_groups` WRITE;
/*!40000 ALTER TABLE `login_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `login_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login_user_user_permissions`
--

DROP TABLE IF EXISTS `login_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login_user_user_permissions` (
  `id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `permission_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_user_user_permissions`
--

LOCK TABLES `login_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `login_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `login_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;
