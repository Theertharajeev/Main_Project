/*
SQLyog Community v13.0.1 (64 bit)
MySQL - 8.0.33 : Database - early_pcod
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`early_pcod` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `early_pcod`;

/*Table structure for table `auth_group` */

DROP TABLE IF EXISTS `auth_group`;

CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_group` */

/*Table structure for table `auth_group_permissions` */

DROP TABLE IF EXISTS `auth_group_permissions`;

CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_group_permissions` */

/*Table structure for table `auth_permission` */

DROP TABLE IF EXISTS `auth_permission`;

CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_permission` */

insert  into `auth_permission`(`id`,`name`,`content_type_id`,`codename`) values 
(1,'Can add log entry',1,'add_logentry'),
(2,'Can change log entry',1,'change_logentry'),
(3,'Can delete log entry',1,'delete_logentry'),
(4,'Can view log entry',1,'view_logentry'),
(5,'Can add permission',2,'add_permission'),
(6,'Can change permission',2,'change_permission'),
(7,'Can delete permission',2,'delete_permission'),
(8,'Can view permission',2,'view_permission'),
(9,'Can add group',3,'add_group'),
(10,'Can change group',3,'change_group'),
(11,'Can delete group',3,'delete_group'),
(12,'Can view group',3,'view_group'),
(13,'Can add user',4,'add_user'),
(14,'Can change user',4,'change_user'),
(15,'Can delete user',4,'delete_user'),
(16,'Can view user',4,'view_user'),
(17,'Can add content type',5,'add_contenttype'),
(18,'Can change content type',5,'change_contenttype'),
(19,'Can delete content type',5,'delete_contenttype'),
(20,'Can view content type',5,'view_contenttype'),
(21,'Can add session',6,'add_session'),
(22,'Can change session',6,'change_session'),
(23,'Can delete session',6,'delete_session'),
(24,'Can view session',6,'view_session'),
(25,'Can add booking',7,'add_booking'),
(26,'Can change booking',7,'change_booking'),
(27,'Can delete booking',7,'delete_booking'),
(28,'Can view booking',7,'view_booking'),
(29,'Can add chat',8,'add_chat'),
(30,'Can change chat',8,'change_chat'),
(31,'Can delete chat',8,'delete_chat'),
(32,'Can view chat',8,'view_chat'),
(33,'Can add doctor',9,'add_doctor'),
(34,'Can change doctor',9,'change_doctor'),
(35,'Can delete doctor',9,'delete_doctor'),
(36,'Can view doctor',9,'view_doctor'),
(37,'Can add login_table',10,'add_login_table'),
(38,'Can change login_table',10,'change_login_table'),
(39,'Can delete login_table',10,'delete_login_table'),
(40,'Can view login_table',10,'view_login_table'),
(41,'Can add notification',11,'add_notification'),
(42,'Can change notification',11,'change_notification'),
(43,'Can delete notification',11,'delete_notification'),
(44,'Can view notification',11,'view_notification'),
(45,'Can add yoga_trainer',12,'add_yoga_trainer'),
(46,'Can change yoga_trainer',12,'change_yoga_trainer'),
(47,'Can delete yoga_trainer',12,'delete_yoga_trainer'),
(48,'Can view yoga_trainer',12,'view_yoga_trainer'),
(49,'Can add videos',13,'add_videos'),
(50,'Can change videos',13,'change_videos'),
(51,'Can delete videos',13,'delete_videos'),
(52,'Can view videos',13,'view_videos'),
(53,'Can add user',14,'add_user'),
(54,'Can change user',14,'change_user'),
(55,'Can delete user',14,'delete_user'),
(56,'Can view user',14,'view_user'),
(57,'Can add trainer_request',15,'add_trainer_request'),
(58,'Can change trainer_request',15,'change_trainer_request'),
(59,'Can delete trainer_request',15,'delete_trainer_request'),
(60,'Can view trainer_request',15,'view_trainer_request'),
(61,'Can add schedule',16,'add_schedule'),
(62,'Can change schedule',16,'change_schedule'),
(63,'Can delete schedule',16,'delete_schedule'),
(64,'Can view schedule',16,'view_schedule'),
(65,'Can add review',17,'add_review'),
(66,'Can change review',17,'change_review'),
(67,'Can delete review',17,'delete_review'),
(68,'Can view review',17,'view_review'),
(69,'Can add prescription',18,'add_prescription'),
(70,'Can change prescription',18,'change_prescription'),
(71,'Can delete prescription',18,'delete_prescription'),
(72,'Can view prescription',18,'view_prescription'),
(73,'Can add complaint',19,'add_complaint'),
(74,'Can change complaint',19,'change_complaint'),
(75,'Can delete complaint',19,'delete_complaint'),
(76,'Can view complaint',19,'view_complaint'),
(77,'Can add prescription_table',20,'add_prescription_table'),
(78,'Can change prescription_table',20,'change_prescription_table'),
(79,'Can delete prescription_table',20,'delete_prescription_table'),
(80,'Can view prescription_table',20,'view_prescription_table'),
(81,'Can add tips_table',21,'add_tips_table'),
(82,'Can change tips_table',21,'change_tips_table'),
(83,'Can delete tips_table',21,'delete_tips_table'),
(84,'Can view tips_table',21,'view_tips_table'),
(85,'Can add trainer_review',22,'add_trainer_review'),
(86,'Can change trainer_review',22,'change_trainer_review'),
(87,'Can delete trainer_review',22,'delete_trainer_review'),
(88,'Can view trainer_review',22,'view_trainer_review'),
(89,'Can add trainer_complaint_table',23,'add_trainer_complaint_table'),
(90,'Can change trainer_complaint_table',23,'change_trainer_complaint_table'),
(91,'Can delete trainer_complaint_table',23,'delete_trainer_complaint_table'),
(92,'Can view trainer_complaint_table',23,'view_trainer_complaint_table'),
(93,'Can add doc_complaint_table',24,'add_doc_complaint_table'),
(94,'Can change doc_complaint_table',24,'change_doc_complaint_table'),
(95,'Can delete doc_complaint_table',24,'delete_doc_complaint_table'),
(96,'Can view doc_complaint_table',24,'view_doc_complaint_table'),
(97,'Can add complaint_table',24,'add_complaint_table'),
(98,'Can change complaint_table',24,'change_complaint_table'),
(99,'Can delete complaint_table',24,'delete_complaint_table'),
(100,'Can view complaint_table',24,'view_complaint_table');

/*Table structure for table `auth_user` */

DROP TABLE IF EXISTS `auth_user`;

CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_user` */

insert  into `auth_user`(`id`,`password`,`last_login`,`is_superuser`,`username`,`first_name`,`last_name`,`email`,`is_staff`,`is_active`,`date_joined`) values 
(1,'pbkdf2_sha256$260000$3PsggZtEdAiO9Y9btixM07$6gi1A+tzHkwn2Ms51VIA0uLhDfCnnv1wYPO3nytn4FU=','2024-11-19 03:28:02.902104',1,'admin','','','admin@gmail.com',1,1,'2024-11-07 10:42:48.406844');

/*Table structure for table `auth_user_groups` */

DROP TABLE IF EXISTS `auth_user_groups`;

CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_user_groups` */

/*Table structure for table `auth_user_user_permissions` */

DROP TABLE IF EXISTS `auth_user_user_permissions`;

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_user_user_permissions` */

/*Table structure for table `django_admin_log` */

DROP TABLE IF EXISTS `django_admin_log`;

CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_admin_log` */

/*Table structure for table `django_content_type` */

DROP TABLE IF EXISTS `django_content_type`;

CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_content_type` */

insert  into `django_content_type`(`id`,`app_label`,`model`) values 
(1,'admin','logentry'),
(3,'auth','group'),
(2,'auth','permission'),
(4,'auth','user'),
(5,'contenttypes','contenttype'),
(7,'MYAPP','booking'),
(8,'MYAPP','chat'),
(19,'MYAPP','complaint'),
(24,'MYAPP','complaint_table'),
(9,'MYAPP','doctor'),
(10,'MYAPP','login_table'),
(11,'MYAPP','notification'),
(18,'MYAPP','prescription'),
(20,'MYAPP','prescription_table'),
(17,'MYAPP','review'),
(16,'MYAPP','schedule'),
(21,'MYAPP','tips_table'),
(23,'MYAPP','trainer_complaint_table'),
(15,'MYAPP','trainer_request'),
(22,'MYAPP','trainer_review'),
(14,'MYAPP','user'),
(13,'MYAPP','videos'),
(12,'MYAPP','yoga_trainer'),
(6,'sessions','session');

/*Table structure for table `django_migrations` */

DROP TABLE IF EXISTS `django_migrations`;

CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_migrations` */

insert  into `django_migrations`(`id`,`app`,`name`,`applied`) values 
(1,'MYAPP','0001_initial','2024-11-07 10:41:20.906538'),
(2,'MYAPP','0002_alter_booking_date_alter_chat_date_and_more','2024-11-07 10:41:21.047131'),
(3,'MYAPP','0003_notification_type','2024-11-07 10:41:21.093997'),
(4,'MYAPP','0004_review_doctor_id','2024-11-07 10:41:21.218964'),
(5,'MYAPP','0005_remove_schedule_doctor_id_schedule_user_id','2024-11-07 10:41:21.500146'),
(6,'MYAPP','0006_remove_schedule_user_id_schedule_doctor_id','2024-11-07 10:41:21.710000'),
(7,'MYAPP','0007_prescription_table','2024-11-07 10:41:21.819344'),
(8,'MYAPP','0008_rename_tips_tips_table','2024-11-07 10:41:21.866207'),
(9,'MYAPP','0009_remove_chat_from_id_remove_chat_message_and_more','2024-11-07 10:41:22.225502'),
(10,'MYAPP','0010_doctor_department','2024-11-07 10:41:22.287982'),
(11,'MYAPP','0011_auto_20241103_0016','2024-11-07 10:41:22.506716'),
(12,'MYAPP','0012_trainer_review','2024-11-07 10:41:22.756623'),
(13,'MYAPP','0013_remove_trainer_review_rating','2024-11-07 10:41:22.803486'),
(14,'contenttypes','0001_initial','2024-11-07 10:41:22.881593'),
(15,'auth','0001_initial','2024-11-07 10:41:23.850118'),
(16,'admin','0001_initial','2024-11-07 10:41:24.162540'),
(17,'admin','0002_logentry_remove_auto_add','2024-11-07 10:41:24.178162'),
(18,'admin','0003_logentry_add_action_flag_choices','2024-11-07 10:41:24.193783'),
(19,'contenttypes','0002_remove_content_type_name','2024-11-07 10:41:24.318754'),
(20,'auth','0002_alter_permission_name_max_length','2024-11-07 10:41:24.412482'),
(21,'auth','0003_alter_user_email_max_length','2024-11-07 10:41:24.443724'),
(22,'auth','0004_alter_user_username_opts','2024-11-07 10:41:24.474967'),
(23,'auth','0005_alter_user_last_login_null','2024-11-07 10:41:24.615559'),
(24,'auth','0006_require_contenttypes_0002','2024-11-07 10:41:24.615559'),
(25,'auth','0007_alter_validators_add_error_messages','2024-11-07 10:41:24.631179'),
(26,'auth','0008_alter_user_username_max_length','2024-11-07 10:41:24.777129'),
(27,'auth','0009_alter_user_last_name_max_length','2024-11-07 10:41:24.917719'),
(28,'auth','0010_alter_group_name_max_length','2024-11-07 10:41:24.948965'),
(29,'auth','0011_update_proxy_permissions','2024-11-07 10:41:24.980205'),
(30,'auth','0012_alter_user_first_name_max_length','2024-11-07 10:41:25.089552'),
(31,'sessions','0001_initial','2024-11-07 10:41:25.152038'),
(32,'MYAPP','0014_doc_complaint_table_trainer_complaint_table_and_more','2024-11-15 06:36:37.232073'),
(33,'MYAPP','0015_rename_doc_complaint_table_complaint_table_and_more','2024-11-15 06:50:44.387873'),
(34,'MYAPP','0016_chat_status','2024-11-15 12:03:55.403813'),
(35,'MYAPP','0017_alter_schedule_date','2024-11-18 13:22:12.790554');

/*Table structure for table `django_session` */

DROP TABLE IF EXISTS `django_session`;

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_session` */

insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values 
('5gm4fz6qodj4ub0tqefm2msnl5orl41g','.eJxVjjsOwyAQBe9CbSFg_YGU6XMGa9cswYkFkrGrKHePiVwk7Zun0bzEiPsWx73wOs5eXIQWze9GOD05VeAfmO5ZTjlt60yyXuRJi7xlz8v1_P4JIpZYtVoz-QkDKKt071zoAIcWukBBe9ADKW6BwVvTB-usdUgBWAEdsMPhkC61zzSCvp1gxPsDMNY8ZQ:1tCz5T:-seSTV4qsIXMFwJTa6a1va8QBcCJbr6xG6WYKlbBVUc','2024-12-02 10:34:31.764559'),
('91ypnjb2x7rs0krzwz3cvo5wdreterjb','.eJxVjjsOwyAQBe9CHSHwGgMp0-cM1i4swYkFkj9VlLvHSC6S9s1o9N5ixH3L477yMk5RXIUWl9-NMLy4NBCfWB5Vhlq2ZSLZFHnSVd5r5Pl2un-BjGtuWa2ZYsAEyik9eJ8MoO3BJEo6grakuAeG6LohOe-cR0rACuiABu0Rndu_7vMFpoI54w:1tCySy:s8BWnZtn26Vp9QFzRYtoX0AeiDzcev6MaWveSkZNrFM','2024-12-02 09:54:44.810214'),
('eu3oaksxwwxs4cqjlutksigjbq4rpz97','.eJxVjkEOgjAQRe_StWk6DoXWpXvOQGbo1KKEJhRWxrtLExa6_e_l5b_VQPuWhr3IOkxB3RSoy-_GNL5kqSA8aXlkPeZlWyfWVdEnLbrPQeb76f4FEpVUswDCYaSIxhlovY8WqWvQRo4QEDo20qBgcNc2Ou-cJ44oBvmAlrojOtd_8PkCpoA54g:1tCzGa:T8UJy-PtFI8DeyluuhAZa3VGu2Lqek-RjFzfS-h4duE','2024-12-02 10:46:00.702104'),
('kpmp5z22wcghr49gib2hacv8bul6hxhu','.eJxVjjsOwyAQBe9CHSHwGgMp0-cM1i4swYkFkj9VlLvHSC6S9s1o9N5ixH3L477yMk5RXIUWl9-NMLy4NBCfWB5Vhlq2ZSLZFHnSVd5r5Pl2un-BjGtuWa2ZYsAEyik9eJ8MoO3BJEo6grakuAeG6LohOe-cR0rACuiABu0Rndu_7vMFpoI54w:1tBv0N:3oLcc9TLUpQJIu9XwefJWO4wZXD3HIfSLs_WrA6vpvU','2024-11-29 12:00:51.824267'),
('mybmyzu9xvlnf2pshingvmsvx2lka12t','.eJxVjjsOgzAQBe_iGlneLGA7ZXrOgHbtdUyCQOJTRbl7cESRtG-eRvNSPe1b7vdVln6I6qpAVb8bU3jKVEB80HSfdZinbRlYl4s-6aq7Ocp4O79_gkxrLloA4RgooXEGWu9Tg2RrbBIniAiWjdQoGN2lTc4754kTikE-YEP2kI6lDyoVvp1OvT_0qTw4:1tBtLr:AyOadEYkcvUeBVqjGBQ9npZDlu6KBNTW0ltZfRO0vRk','2024-11-29 10:14:55.009956'),
('n5rpgf8tobo7ditcsqjif4ukuybvl31f','.eJxVjDsOgzAQRO-ydWR58Qc7ZfqcwVp7TUyCQMJQRbl7sERDN3rzZr4wjQx3vEGgfSthr3kNjQDChUVKnzy3gt80vxaRlnlbxyiaIs62iufCeXqc7uWgUC3HWiN3SloarPRDNL2XMcXkmI5o0WKvSGv2xqguD56V9F1vHCo0KaN0DL8_OWE4-g:1t8zyi:FKAZK6xT-ZVIkJRKJl8W6JcfhNKXytc1rgY1Y4QYiVA','2024-11-21 10:43:04.376137'),
('r8jxrlzrcc45xvqe1mog0vonxddcdcw3','.eJxVjjsOwyAQBe9CHSHwGgMp0-cM1i4swYkFkj9VlLvHSC6S9s1o9N5ixH3L477yMk5RXIUWl9-NMLy4NBCfWB5Vhlq2ZSLZFHnSVd5r5Pl2un-BjGtuWa2ZYsAEyik9eJ8MoO3BJEo6grakuAeG6LohOe-cR0rACuiABu0Rndu_7vMFpoI54w:1tDEuI:6Be-AXlwBheKmb8trYa4AadjTbO215zhtYnxWxStNWQ','2024-12-03 03:28:02.905576');

/*Table structure for table `myapp_booking` */

DROP TABLE IF EXISTS `myapp_booking`;

CREATE TABLE `myapp_booking` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `status` varchar(100) NOT NULL,
  `SCHEDULE_ID_id` bigint NOT NULL,
  `USER_ID_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `MYAPP_booking_SCHEDULE_ID_id_7dcd6020_fk_MYAPP_schedule_id` (`SCHEDULE_ID_id`),
  KEY `MYAPP_booking_USER_ID_id_f0b85938_fk_MYAPP_user_id` (`USER_ID_id`),
  CONSTRAINT `MYAPP_booking_SCHEDULE_ID_id_7dcd6020_fk_MYAPP_schedule_id` FOREIGN KEY (`SCHEDULE_ID_id`) REFERENCES `myapp_schedule` (`id`),
  CONSTRAINT `MYAPP_booking_USER_ID_id_f0b85938_fk_MYAPP_user_id` FOREIGN KEY (`USER_ID_id`) REFERENCES `myapp_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `myapp_booking` */

insert  into `myapp_booking`(`id`,`date`,`status`,`SCHEDULE_ID_id`,`USER_ID_id`) values 
(28,'2024-11-08','accepted',2,3),
(34,'2024-11-18','accepted',4,6),
(35,'2024-11-18','rejected',5,6),
(38,'2024-11-18','accepted',13,6),
(39,'2024-11-18','pending',12,6),
(40,'2024-11-18','pending',4,2),
(41,'2024-11-18','pending',4,5);

/*Table structure for table `myapp_chat` */

DROP TABLE IF EXISTS `myapp_chat`;

CREATE TABLE `myapp_chat` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `fromid_id` bigint NOT NULL,
  `msg` varchar(1000) NOT NULL,
  `toid_id` bigint NOT NULL,
  `status` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `MYAPP_chat_fromid_id_441d525f_fk_MYAPP_login_table_id` (`fromid_id`),
  KEY `MYAPP_chat_toid_id_7e81646b_fk_MYAPP_login_table_id` (`toid_id`),
  CONSTRAINT `MYAPP_chat_fromid_id_441d525f_fk_MYAPP_login_table_id` FOREIGN KEY (`fromid_id`) REFERENCES `myapp_login_table` (`id`),
  CONSTRAINT `MYAPP_chat_toid_id_7e81646b_fk_MYAPP_login_table_id` FOREIGN KEY (`toid_id`) REFERENCES `myapp_login_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `myapp_chat` */

insert  into `myapp_chat`(`id`,`date`,`fromid_id`,`msg`,`toid_id`,`status`) values 
(9,'2024-11-08',2,',njbjb',5,'pending'),
(10,'2024-11-08',5,'nnknkn',2,'viwed'),
(11,'2024-11-08',5,'hiufgh',2,'viwed'),
(12,'2024-11-08',2,'mbbh',5,'pending'),
(13,'2024-11-08',5,'jjji',2,'viwed'),
(14,'2024-11-08',5,'hui',3,'pending'),
(15,'2024-11-08',3,'WDd',5,'pending'),
(17,'2024-11-08',9,'hello',5,'pending'),
(18,'2024-11-08',6,'hi',7,'pending'),
(19,'2024-11-08',7,'hjbbhb',6,'pending'),
(20,'2024-11-08',6,'hi mam',9,'pending'),
(21,'2024-11-08',9,'nkjhhi',6,'pending'),
(24,'2024-11-15',2,'hai',5,''),
(25,'2024-11-15',2,'hai',6,''),
(27,'2024-11-15',2,'hello',5,''),
(37,'2024-11-18',2,'hi',5,''),
(44,'2024-11-18',2,'hy',5,''),
(45,'2024-11-18',12,'ht',7,'pending'),
(46,'2024-11-18',12,'hyy',2,'viwed'),
(47,'2024-11-18',2,'hy',12,''),
(48,'2024-11-18',12,'hg',2,'pending'),
(49,'2024-11-18',12,'gh',2,'pending'),
(50,'2024-11-18',12,'g',2,'pending'),
(51,'2024-11-18',3,'hy',12,''),
(52,'2024-11-18',12,'ht',3,''),
(53,'2024-11-18',12,'vh',3,''),
(54,'2024-11-18',3,'hy',12,''),
(55,'2024-11-18',12,'ydhs',3,''),
(56,'2024-11-18',12,'jsja',3,''),
(57,'2024-11-18',12,'jsjw',3,''),
(58,'2024-11-18',12,'ddhu',3,''),
(59,'2024-11-18',5,'hy',2,'viwed'),
(60,'2024-11-18',5,'hy',2,'viwed'),
(61,'2024-11-19',13,'hy',5,''),
(62,'2024-11-19',2,'hyy',5,''),
(63,'2024-11-19',5,'h',2,'viwed');

/*Table structure for table `myapp_complaint_table` */

DROP TABLE IF EXISTS `myapp_complaint_table`;

CREATE TABLE `myapp_complaint_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `complaint` varchar(100) NOT NULL,
  `reply` varchar(100) NOT NULL,
  `date` date NOT NULL,
  `USER_ID_id` bigint NOT NULL,
  `LOGIN_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `MYAPP_doc_complaint_table_USER_ID_id_d7a74ac1_fk_MYAPP_user_id` (`USER_ID_id`),
  KEY `MYAPP_complaint_table_LOGIN_id_df0d1927_fk_MYAPP_login_table_id` (`LOGIN_id`),
  CONSTRAINT `MYAPP_complaint_table_LOGIN_id_df0d1927_fk_MYAPP_login_table_id` FOREIGN KEY (`LOGIN_id`) REFERENCES `myapp_login_table` (`id`),
  CONSTRAINT `MYAPP_doc_complaint_table_USER_ID_id_d7a74ac1_fk_MYAPP_user_id` FOREIGN KEY (`USER_ID_id`) REFERENCES `myapp_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `myapp_complaint_table` */

insert  into `myapp_complaint_table`(`id`,`complaint`,`reply`,`date`,`USER_ID_id`,`LOGIN_id`) values 
(10,'shhdhd','thanks','2024-11-18',6,2),
(11,'not good','Thanks for your valuable feedback.','2024-11-18',2,2),
(12,'not good','pending','2024-11-18',2,2);

/*Table structure for table `myapp_doctor` */

DROP TABLE IF EXISTS `myapp_doctor`;

CREATE TABLE `myapp_doctor` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` bigint NOT NULL,
  `place` varchar(100) NOT NULL,
  `pin` bigint NOT NULL,
  `post` varchar(100) NOT NULL,
  `language` varchar(100) NOT NULL,
  `experience` bigint NOT NULL,
  `certificate` varchar(100) NOT NULL,
  `image` varchar(100) NOT NULL,
  `licence` varchar(100) NOT NULL,
  `LOGIN_id` bigint NOT NULL,
  `department` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `MYAPP_doctor_LOGIN_id_30233af3_fk_MYAPP_login_table_id` (`LOGIN_id`),
  CONSTRAINT `MYAPP_doctor_LOGIN_id_30233af3_fk_MYAPP_login_table_id` FOREIGN KEY (`LOGIN_id`) REFERENCES `myapp_login_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `myapp_doctor` */

insert  into `myapp_doctor`(`id`,`name`,`email`,`phone`,`place`,`pin`,`post`,`language`,`experience`,`certificate`,`image`,`licence`,`LOGIN_id`,`department`) values 
(1,'anagha','anagha@gmail.com',9544983733,'calicut',673616,'calicut','malalayam',3,'OFFER LETTER_M87Ibo5.docx','WhatsApp Image 2024-11-18 at 11.52.27 AM_4FcpAaj.jpeg','OFFER LETTER.docx',2,''),
(2,'albin ','albin@gmail.com',9526955529,'kozhikode',673586,'kozhikode','english',3,'Orton Ligth Quotation_pCCcISZ.pdf','hock36_29UxpQj_jtbgKgK.jpg','Orton Ligth Quotation_DiT2eYC.pdf',7,''),
(4,'Ashiqu','ashiqu@gmail.com',9807654321,'calicut',673303,'cacalicut','eng',2,'OFFER LETTER_M87Ibo5.docx','WhatsApp Image 2024-11-18 at 11.52.28 AM_bned0s3.jpeg','OFFER LETTER_M87Ibo5.docx',13,'aaa');

/*Table structure for table `myapp_login_table` */

DROP TABLE IF EXISTS `myapp_login_table`;

CREATE TABLE `myapp_login_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `type` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `myapp_login_table` */

insert  into `myapp_login_table`(`id`,`username`,`password`,`type`) values 
(1,'admin','Ihjas@123','admin'),
(2,'doctor','Doctor@12','doctor'),
(3,'trainer','Trainer@12','yoga_trainer'),
(5,'ashi','ashi1','user'),
(6,'anu@123','Minnu@123','user'),
(7,'albin','Albin@12','doctor'),
(9,'minnu12','Minnu121@','yoga_trainer'),
(11,'cfbnn','Ihjas@123','user'),
(12,'anagha','Anagha@123','user'),
(13,'Ashiqu','Ashiqu','doctor');

/*Table structure for table `myapp_notification` */

DROP TABLE IF EXISTS `myapp_notification`;

CREATE TABLE `myapp_notification` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `notification` varchar(100) NOT NULL,
  `date` date NOT NULL,
  `type` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `myapp_notification` */

insert  into `myapp_notification`(`id`,`notification`,`date`,`type`) values 
(4,'time schedule changed','2024-11-07','user'),
(7,'please check the date ','2024-11-18','doctor'),
(8,'check the latest','2024-11-18','trainer');

/*Table structure for table `myapp_prescription` */

DROP TABLE IF EXISTS `myapp_prescription`;

CREATE TABLE `myapp_prescription` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `prescription` varchar(100) NOT NULL,
  `BOOKING_ID_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `MYAPP_prescription_BOOKING_ID_id_6e592e1e_fk_MYAPP_booking_id` (`BOOKING_ID_id`),
  CONSTRAINT `MYAPP_prescription_BOOKING_ID_id_6e592e1e_fk_MYAPP_booking_id` FOREIGN KEY (`BOOKING_ID_id`) REFERENCES `myapp_booking` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `myapp_prescription` */

/*Table structure for table `myapp_prescription_table` */

DROP TABLE IF EXISTS `myapp_prescription_table`;

CREATE TABLE `myapp_prescription_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `pres` varchar(100) NOT NULL,
  `BOOK_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `MYAPP_prescription_table_BOOK_id_61c1a0a6_fk_MYAPP_booking_id` (`BOOK_id`),
  CONSTRAINT `MYAPP_prescription_table_BOOK_id_61c1a0a6_fk_MYAPP_booking_id` FOREIGN KEY (`BOOK_id`) REFERENCES `myapp_booking` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `myapp_prescription_table` */

insert  into `myapp_prescription_table`(`id`,`date`,`pres`,`BOOK_id`) values 
(2,'2024-11-08','take this medicine daily',28),
(4,'2024-11-18','dolooo',34);

/*Table structure for table `myapp_review` */

DROP TABLE IF EXISTS `myapp_review`;

CREATE TABLE `myapp_review` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `review` varchar(100) NOT NULL,
  `rating` varchar(100) NOT NULL,
  `date` date NOT NULL,
  `DOCTOR_ID_id` bigint NOT NULL,
  `USER_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `MYAPP_review_DOCTOR_ID_id_d05af278_fk_MYAPP_doctor_id` (`DOCTOR_ID_id`),
  KEY `MYAPP_review_USER_id_907038f7_fk_MYAPP_user_id` (`USER_id`),
  CONSTRAINT `MYAPP_review_DOCTOR_ID_id_d05af278_fk_MYAPP_doctor_id` FOREIGN KEY (`DOCTOR_ID_id`) REFERENCES `myapp_doctor` (`id`),
  CONSTRAINT `MYAPP_review_USER_id_907038f7_fk_MYAPP_user_id` FOREIGN KEY (`USER_id`) REFERENCES `myapp_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `myapp_review` */

insert  into `myapp_review`(`id`,`review`,`rating`,`date`,`DOCTOR_ID_id`,`USER_id`) values 
(4,'nice','5','2024-11-08',2,3),
(5,'good','4','2024-11-08',2,5),
(11,'good','3.5','2024-11-18',1,3),
(12,'hh','3.0','2024-11-18',1,2),
(13,'hbhjb','5','2024-11-06',4,3),
(14,'hjghgh','3','2024-11-18',4,2),
(15,'good','5.0','2024-11-19',1,2);

/*Table structure for table `myapp_schedule` */

DROP TABLE IF EXISTS `myapp_schedule`;

CREATE TABLE `myapp_schedule` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `from_time` time(6) NOT NULL,
  `to_time` time(6) NOT NULL,
  `DOCTOR_ID_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `MYAPP_schedule_DOCTOR_ID_id_f603aaf6_fk_MYAPP_doctor_id` (`DOCTOR_ID_id`),
  CONSTRAINT `MYAPP_schedule_DOCTOR_ID_id_f603aaf6_fk_MYAPP_doctor_id` FOREIGN KEY (`DOCTOR_ID_id`) REFERENCES `myapp_doctor` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `myapp_schedule` */

insert  into `myapp_schedule`(`id`,`date`,`from_time`,`to_time`,`DOCTOR_ID_id`) values 
(2,'2024-11-08','11:35:00.000000','12:36:00.000000',2),
(3,'2024-11-15','12:35:00.000000','12:40:00.000000',2),
(4,'2024-11-22','12:35:00.000000','12:40:00.000000',1),
(5,'2024-11-12','15:02:00.000000','18:03:00.000000',1),
(12,'2024-11-18','01:10:00.000000','01:30:00.000000',1),
(13,'2024-11-22','18:00:00.000000','19:00:00.000000',1),
(14,'2024-11-22','10:30:00.000000','11:00:00.000000',4),
(15,'2024-11-21','08:33:00.000000','09:33:00.000000',4),
(16,'2024-11-21','08:00:00.000000','10:58:00.000000',1),
(17,'2024-11-23','10:00:00.000000','12:00:00.000000',1),
(18,'2024-12-02','02:00:00.000000','03:00:00.000000',1);

/*Table structure for table `myapp_tips_table` */

DROP TABLE IF EXISTS `myapp_tips_table`;

CREATE TABLE `myapp_tips_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `tips` varchar(100) NOT NULL,
  `date` date NOT NULL,
  `descriptions` varchar(100) NOT NULL,
  `TRAINER_ID_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `MYAPP_tips_TRAINER_ID_id_2bbe1e2e_fk_MYAPP_yoga_trainer_id` (`TRAINER_ID_id`),
  CONSTRAINT `MYAPP_tips_TRAINER_ID_id_2bbe1e2e_fk_MYAPP_yoga_trainer_id` FOREIGN KEY (`TRAINER_ID_id`) REFERENCES `myapp_yoga_trainer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `myapp_tips_table` */

insert  into `myapp_tips_table`(`id`,`tips`,`date`,`descriptions`,`TRAINER_ID_id`) values 
(2,'all must do this tips ','2024-11-08','do it every morning',2),
(4,'time','2024-11-19','Be consistent',1);

/*Table structure for table `myapp_trainer_request` */

DROP TABLE IF EXISTS `myapp_trainer_request`;

CREATE TABLE `myapp_trainer_request` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `status` varchar(100) NOT NULL,
  `description` varchar(100) NOT NULL,
  `TRAINER_ID_id` bigint NOT NULL,
  `USER_ID_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `MYAPP_trainer_reques_TRAINER_ID_id_a9ea59ba_fk_MYAPP_yog` (`TRAINER_ID_id`),
  KEY `MYAPP_trainer_request_USER_ID_id_4433c6e3_fk_MYAPP_user_id` (`USER_ID_id`),
  CONSTRAINT `MYAPP_trainer_reques_TRAINER_ID_id_a9ea59ba_fk_MYAPP_yog` FOREIGN KEY (`TRAINER_ID_id`) REFERENCES `myapp_yoga_trainer` (`id`),
  CONSTRAINT `MYAPP_trainer_request_USER_ID_id_4433c6e3_fk_MYAPP_user_id` FOREIGN KEY (`USER_ID_id`) REFERENCES `myapp_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `myapp_trainer_request` */

insert  into `myapp_trainer_request`(`id`,`date`,`status`,`description`,`TRAINER_ID_id`,`USER_ID_id`) values 
(2,'2024-11-08','accepted','please upload new videos',2,3),
(3,'2024-11-18','rejected','hii',1,6),
(4,'2024-11-18','accepted','hyy',1,6);

/*Table structure for table `myapp_trainer_review` */

DROP TABLE IF EXISTS `myapp_trainer_review`;

CREATE TABLE `myapp_trainer_review` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `review` varchar(100) NOT NULL,
  `date` date NOT NULL,
  `TRAINER_id` bigint NOT NULL,
  `USER_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `MYAPP_trainer_review_TRAINER_id_c9db6621_fk_MYAPP_yog` (`TRAINER_id`),
  KEY `MYAPP_trainer_review_USER_id_2728d6e4_fk_MYAPP_user_id` (`USER_id`),
  CONSTRAINT `MYAPP_trainer_review_TRAINER_id_c9db6621_fk_MYAPP_yog` FOREIGN KEY (`TRAINER_id`) REFERENCES `myapp_yoga_trainer` (`id`),
  CONSTRAINT `MYAPP_trainer_review_USER_id_2728d6e4_fk_MYAPP_user_id` FOREIGN KEY (`USER_id`) REFERENCES `myapp_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `myapp_trainer_review` */

insert  into `myapp_trainer_review`(`id`,`review`,`date`,`TRAINER_id`,`USER_id`) values 
(3,'good trainer','2024-11-08',2,3);

/*Table structure for table `myapp_user` */

DROP TABLE IF EXISTS `myapp_user`;

CREATE TABLE `myapp_user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` bigint NOT NULL,
  `place` varchar(100) NOT NULL,
  `pin` bigint NOT NULL,
  `post` varchar(100) NOT NULL,
  `image` varchar(100) NOT NULL,
  `LOGIN_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `MYAPP_user_LOGIN_id_bf51953a_fk_MYAPP_login_table_id` (`LOGIN_id`),
  CONSTRAINT `MYAPP_user_LOGIN_id_bf51953a_fk_MYAPP_login_table_id` FOREIGN KEY (`LOGIN_id`) REFERENCES `myapp_login_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `myapp_user` */

insert  into `myapp_user`(`id`,`name`,`email`,`phone`,`place`,`pin`,`post`,`image`,`LOGIN_id`) values 
(2,'Ashi','ashi@gmail.com',9656269853,' Calicut',565659,'','hock36_maX2zrp.jpg',5),
(3,'Anu','anagharam2001@gmail.com',6238512250,'vatakara',673533,'','pexels-tima-miroshnichenko-5452293_XdK93OC.jpg',6),
(5,'igvvb','udgff@gmil.com',8855564895,'eedhknv',525088,'','1000343219.jpg',11),
(6,'anagha','ansd@gmail.com',9796526314,'perambrs',673525,'','1000342391_7jl26Ba.jpg',12);

/*Table structure for table `myapp_videos` */

DROP TABLE IF EXISTS `myapp_videos`;

CREATE TABLE `myapp_videos` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `video` varchar(100) NOT NULL,
  `date` date NOT NULL,
  `descriptions` varchar(100) NOT NULL,
  `TRAINER_ID_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `MYAPP_videos_TRAINER_ID_id_9c495eb7_fk_MYAPP_yoga_trainer_id` (`TRAINER_ID_id`),
  CONSTRAINT `MYAPP_videos_TRAINER_ID_id_9c495eb7_fk_MYAPP_yoga_trainer_id` FOREIGN KEY (`TRAINER_ID_id`) REFERENCES `myapp_yoga_trainer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `myapp_videos` */

insert  into `myapp_videos`(`id`,`video`,`date`,`descriptions`,`TRAINER_ID_id`) values 
(2,'992694-hd_1920_1080_25fps_skTIyO2.mp4','2024-11-07','Yogaa',1),
(3,'992694-hd_1920_1080_25fps_1ud6Uc9.mp4','2024-11-08','do it',2),
(4,'4352405-hd_1920_1080_25fps_cQSR6VA_SYExrsX.mp4','2024-11-18','sheershasanam',1);

/*Table structure for table `myapp_yoga_trainer` */

DROP TABLE IF EXISTS `myapp_yoga_trainer`;

CREATE TABLE `myapp_yoga_trainer` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` bigint NOT NULL,
  `place` varchar(100) NOT NULL,
  `pin` bigint NOT NULL,
  `post` varchar(100) NOT NULL,
  `language` varchar(100) NOT NULL,
  `experience` bigint NOT NULL,
  `certificate` varchar(100) NOT NULL,
  `image` varchar(100) NOT NULL,
  `licence` varchar(100) NOT NULL,
  `LOGIN_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `MYAPP_yoga_trainer_LOGIN_id_85a3fb4f_fk_MYAPP_login_table_id` (`LOGIN_id`),
  CONSTRAINT `MYAPP_yoga_trainer_LOGIN_id_85a3fb4f_fk_MYAPP_login_table_id` FOREIGN KEY (`LOGIN_id`) REFERENCES `myapp_login_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `myapp_yoga_trainer` */

insert  into `myapp_yoga_trainer`(`id`,`name`,`email`,`phone`,`place`,`pin`,`post`,`language`,`experience`,`certificate`,`image`,`licence`,`LOGIN_id`) values 
(1,'aishu','aishu@gmail.com',9645037073,'calicut',673616,'calicut','malalayam',2,'QUESTION A (1).docx','pexels-mikhail-nilov-6944804_6t1WLHD.jpg','QUESTION B (1).docx',3),
(2,'anagha','anagharam2001@gmail.com',6238512250,'vatakara',673542,'mayyannur','english',2,'Orton Ligth Quotation_Mg0Tt6y_jusJgvI.pdf','Smart-Casual-Men_RJvhdee.jpg','Orton Ligth Quotation_Mg0Tt6y_LFNk0Dj.pdf',9);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
