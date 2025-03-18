/*
SQLyog Community v13.0.1 (64 bit)
MySQL - 8.0.33 : Database - pcod_db
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`pcod_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `pcod_db`;

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
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
(61,'Can add tips',16,'add_tips'),
(62,'Can change tips',16,'change_tips'),
(63,'Can delete tips',16,'delete_tips'),
(64,'Can view tips',16,'view_tips'),
(65,'Can add schedule',17,'add_schedule'),
(66,'Can change schedule',17,'change_schedule'),
(67,'Can delete schedule',17,'delete_schedule'),
(68,'Can view schedule',17,'view_schedule'),
(69,'Can add review',18,'add_review'),
(70,'Can change review',18,'change_review'),
(71,'Can delete review',18,'delete_review'),
(72,'Can view review',18,'view_review'),
(73,'Can add prescription',19,'add_prescription'),
(74,'Can change prescription',19,'change_prescription'),
(75,'Can delete prescription',19,'delete_prescription'),
(76,'Can view prescription',19,'view_prescription'),
(77,'Can add complaint',20,'add_complaint'),
(78,'Can change complaint',20,'change_complaint'),
(79,'Can delete complaint',20,'delete_complaint'),
(80,'Can view complaint',20,'view_complaint'),
(81,'Can add prescription_table',21,'add_prescription_table'),
(82,'Can change prescription_table',21,'change_prescription_table'),
(83,'Can delete prescription_table',21,'delete_prescription_table'),
(84,'Can view prescription_table',21,'view_prescription_table'),
(85,'Can add tips_table',16,'add_tips_table'),
(86,'Can change tips_table',16,'change_tips_table'),
(87,'Can delete tips_table',16,'delete_tips_table'),
(88,'Can view tips_table',16,'view_tips_table'),
(89,'Can add trainer_review',22,'add_trainer_review'),
(90,'Can change trainer_review',22,'change_trainer_review'),
(91,'Can delete trainer_review',22,'delete_trainer_review'),
(92,'Can view trainer_review',22,'view_trainer_review');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_user` */

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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_content_type` */

insert  into `django_content_type`(`id`,`app_label`,`model`) values 
(1,'admin','logentry'),
(3,'auth','group'),
(2,'auth','permission'),
(4,'auth','user'),
(5,'contenttypes','contenttype'),
(7,'MYAPP','booking'),
(8,'MYAPP','chat'),
(20,'MYAPP','complaint'),
(9,'MYAPP','doctor'),
(10,'MYAPP','login_table'),
(11,'MYAPP','notification'),
(19,'MYAPP','prescription'),
(21,'MYAPP','prescription_table'),
(18,'MYAPP','review'),
(17,'MYAPP','schedule'),
(16,'MYAPP','tips_table'),
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
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_migrations` */

insert  into `django_migrations`(`id`,`app`,`name`,`applied`) values 
(1,'MYAPP','0001_initial','2024-10-04 07:34:38.599500'),
(2,'MYAPP','0002_alter_booking_date_alter_chat_date_and_more','2024-10-04 07:34:38.695336'),
(3,'contenttypes','0001_initial','2024-10-04 07:34:38.739705'),
(4,'auth','0001_initial','2024-10-04 07:34:39.344827'),
(5,'admin','0001_initial','2024-10-04 07:34:39.478330'),
(6,'admin','0002_logentry_remove_auto_add','2024-10-04 07:34:39.486306'),
(7,'admin','0003_logentry_add_action_flag_choices','2024-10-04 07:34:39.493883'),
(8,'contenttypes','0002_remove_content_type_name','2024-10-04 07:34:39.579861'),
(9,'auth','0002_alter_permission_name_max_length','2024-10-04 07:34:39.652502'),
(10,'auth','0003_alter_user_email_max_length','2024-10-04 07:34:39.683230'),
(11,'auth','0004_alter_user_username_opts','2024-10-04 07:34:39.698775'),
(12,'auth','0005_alter_user_last_login_null','2024-10-04 07:34:39.766442'),
(13,'auth','0006_require_contenttypes_0002','2024-10-04 07:34:39.770052'),
(14,'auth','0007_alter_validators_add_error_messages','2024-10-04 07:34:39.779771'),
(15,'auth','0008_alter_user_username_max_length','2024-10-04 07:34:39.848989'),
(16,'auth','0009_alter_user_last_name_max_length','2024-10-04 07:34:39.910300'),
(17,'auth','0010_alter_group_name_max_length','2024-10-04 07:34:39.934935'),
(18,'auth','0011_update_proxy_permissions','2024-10-04 07:34:39.953311'),
(19,'auth','0012_alter_user_first_name_max_length','2024-10-04 07:34:40.038870'),
(20,'sessions','0001_initial','2024-10-04 07:34:40.092582'),
(21,'MYAPP','0003_notification_type','2024-10-11 08:50:01.753226'),
(22,'MYAPP','0004_review_doctor_id','2024-10-18 06:23:47.891316'),
(23,'MYAPP','0005_remove_schedule_doctor_id_schedule_user_id','2024-10-25 07:55:30.675441'),
(24,'MYAPP','0006_remove_schedule_user_id_schedule_doctor_id','2024-10-25 09:22:57.321380'),
(25,'MYAPP','0007_prescription_table','2024-10-25 11:35:57.561859'),
(26,'MYAPP','0008_rename_tips_tips_table','2024-11-01 07:12:38.151872'),
(27,'MYAPP','0009_remove_chat_from_id_remove_chat_message_and_more','2024-11-01 08:52:41.436200'),
(28,'MYAPP','0010_doctor_department','2024-11-02 17:21:01.013065'),
(29,'MYAPP','0011_auto_20241103_0016','2024-11-02 18:46:41.379203'),
(30,'MYAPP','0012_trainer_review','2024-11-03 05:18:01.479046'),
(31,'MYAPP','0013_remove_trainer_review_rating','2024-11-03 05:19:23.848066');

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
('snz39axq72resgqx666bb2rsvzcmibvv','eyJsaWQiOjEyLCJiaWQiOiIzIn0:1t6o5n:_kVNrixjgjWVl_iYIJdm_Rjc1myUSjK2fJIYbBOsgRY','2024-11-15 09:37:19.296802'),
('zpwi3k7m5n2yzeqtvcy5v3ck83qzmb3m','eyJsaWQiOjF9:1t76Fl:l3NbYqOmRfVoy5QZ2Y9WyDRIIqTc7aPI8yKdsBsJXfY','2024-11-16 05:00:49.033208');

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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `myapp_booking` */

insert  into `myapp_booking`(`id`,`date`,`status`,`SCHEDULE_ID_id`,`USER_ID_id`) values 
(3,'2024-10-30','accepted',4,4),
(7,'2024-11-03','pending',5,4),
(8,'2024-11-03','pending',4,4);

/*Table structure for table `myapp_chat` */

DROP TABLE IF EXISTS `myapp_chat`;

CREATE TABLE `myapp_chat` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `fromid_id` bigint NOT NULL,
  `msg` varchar(1000) NOT NULL,
  `toid_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `MYAPP_chat_fromid_id_441d525f_fk_MYAPP_login_table_id` (`fromid_id`),
  KEY `MYAPP_chat_toid_id_7e81646b_fk_MYAPP_login_table_id` (`toid_id`),
  CONSTRAINT `MYAPP_chat_fromid_id_441d525f_fk_MYAPP_login_table_id` FOREIGN KEY (`fromid_id`) REFERENCES `myapp_login_table` (`id`),
  CONSTRAINT `MYAPP_chat_toid_id_7e81646b_fk_MYAPP_login_table_id` FOREIGN KEY (`toid_id`) REFERENCES `myapp_login_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `myapp_chat` */

insert  into `myapp_chat`(`id`,`date`,`fromid_id`,`msg`,`toid_id`) values 
(1,'2024-11-01',15,'Hi',2),
(2,'2024-11-01',2,'hlo',15),
(3,'2024-11-01',12,'FloHloo',2),
(4,'2024-11-01',12,'Hlooo',3),
(5,'2024-11-03',16,'kk',12),
(6,'2024-11-03',16,'yu',12),
(7,'2024-11-03',16,'dey',6),
(8,'2024-11-03',16,'how are you',12);

/*Table structure for table `myapp_complaint` */

DROP TABLE IF EXISTS `myapp_complaint`;

CREATE TABLE `myapp_complaint` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `complaint` varchar(100) NOT NULL,
  `reply` varchar(100) NOT NULL,
  `date` date NOT NULL,
  `USER_ID_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `MYAPP_complaint_USER_ID_id_0775edb9_fk_MYAPP_user_id` (`USER_ID_id`),
  CONSTRAINT `MYAPP_complaint_USER_ID_id_0775edb9_fk_MYAPP_user_id` FOREIGN KEY (`USER_ID_id`) REFERENCES `myapp_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `myapp_complaint` */

insert  into `myapp_complaint`(`id`,`complaint`,`reply`,`date`,`USER_ID_id`) values 
(1,'njnfsjnj','pending','2024-11-02',4),
(2,'jj','pending','2024-11-02',4),
(3,'good','pending','2024-11-03',4);

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `myapp_doctor` */

insert  into `myapp_doctor`(`id`,`name`,`email`,`phone`,`place`,`pin`,`post`,`language`,`experience`,`certificate`,`image`,`licence`,`LOGIN_id`,`department`) values 
(1,'doc1','dfghj',234,'sdfg',345,'df','sd',4,'dr.doc','Screenshot 2022-04-26 160548.png','dfgh',4,'ent'),
(2,'doc2','doc2',6464,'hbb',656,'vvh','hb',6,'dr.doc','Screenshot 2022-04-26 160548.png','dfgh',5,'nephro'),
(3,'doc3','doc3',7678,'bjj',78676,'njjh','vhv',5,'dr.doc','Screenshot 2022-04-26 160548.png','dfgh',6,'derma'),
(4,'ihjas','iha@gmail.com',9496526314,'dkjwgd',987,'mhg','sdfgh',7,'nnn.doc','Screenshot 2022-04-26 160548.png','jddhd.doc',11,'ent'),
(5,'ihjas','iha@gmail.com',949652,'dkjwgd',987,'sdd','sdfgh',7,'Screenshot 2022-04-26 160726_JHnRyne.png','Screenshot 2022-04-26 160548_sM2SVRX.png','asus.jpg',12,'ortho'),
(6,'knjkn','jknjkn',64564,'54564',45545,'564564','654654',564654,'pexels-aleksandar-pasaric-325185_c9aJAyA.jpg','Screenshot 2022-04-26 160548.png','Screenshot 2022-04-26 160946.png',13,'ortho');

/*Table structure for table `myapp_login_table` */

DROP TABLE IF EXISTS `myapp_login_table`;

CREATE TABLE `myapp_login_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `type` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `myapp_login_table` */

insert  into `myapp_login_table`(`id`,`username`,`password`,`type`) values 
(1,'admin','admin','admin'),
(2,'anagha','anagha','user'),
(3,'albin','albin','user'),
(4,'doctor1','123','doctor'),
(5,'doc2','doc2','doctor'),
(6,'doc3','doc3','doctor'),
(7,'yoga1','yoga1','reject'),
(8,'hoya','hoya','trainer'),
(11,'','','doctor'),
(12,'doctor','ihjasmhd','doctor'),
(13,'doc4','doc4','doctor'),
(15,'yoga','yoga1','yoga_trainer'),
(16,'ashi','ashi1234','user');

/*Table structure for table `myapp_notification` */

DROP TABLE IF EXISTS `myapp_notification`;

CREATE TABLE `myapp_notification` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `notification` varchar(100) NOT NULL,
  `date` date NOT NULL,
  `type` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `myapp_notification` */

insert  into `myapp_notification`(`id`,`notification`,`date`,`type`) values 
(6,'susfhjhydfh','2024-10-12','trainer'),
(7,'jgjhgj','2024-10-11','user'),
(8,'hgfhfhf','2024-10-25','doctor'),
(9,'hello guys','2024-10-25','doctor');

/*Table structure for table `myapp_prescription` */

DROP TABLE IF EXISTS `myapp_prescription`;

CREATE TABLE `myapp_prescription` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `prescription` varchar(100) NOT NULL,
  `BOOKING_ID_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `MYAPP_prescription_BOOKING_ID_id_6e592e1e_fk_MYAPP_booking_id` (`BOOKING_ID_id`),
  CONSTRAINT `MYAPP_prescription_BOOKING_ID_id_6e592e1e_fk_MYAPP_booking_id` FOREIGN KEY (`BOOKING_ID_id`) REFERENCES `myapp_booking` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `myapp_prescription` */

insert  into `myapp_prescription`(`id`,`prescription`,`BOOKING_ID_id`) values 
(1,'Aztor 10mg',3);

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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `myapp_prescription_table` */

insert  into `myapp_prescription_table`(`id`,`date`,`pres`,`BOOK_id`) values 
(1,'2024-10-25','bhihiuhiu',3),
(2,'2024-10-25','knkn',3),
(3,'2024-10-25','jnkjnkjn',3),
(4,'2024-10-25','jnkjnkjn',3),
(5,'2024-10-25','jnkjnkjn',3),
(6,'2024-10-25','jnkjnkjn',3),
(7,'2024-10-25','jnkjnkjn',3),
(8,'2024-10-25','jnkjnkjn',3),
(9,'2024-10-25','hi',3);

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `myapp_review` */

insert  into `myapp_review`(`id`,`review`,`rating`,`date`,`DOCTOR_ID_id`,`USER_id`) values 
(1,'adfg','dghjii11','2024-10-18',1,1),
(2,'hhjjh','ddd','2024-10-24',2,1),
(3,'gfdgfdg','gdghdgh','2024-10-11',5,1),
(4,'po','2.5','2024-11-03',3,4),
(5,'ghio','2.5','2024-11-03',2,4);

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `myapp_schedule` */

insert  into `myapp_schedule`(`id`,`date`,`from_time`,`to_time`,`DOCTOR_ID_id`) values 
(4,'2024-10-25','19:23:00.000000','15:17:00.000000',5),
(5,'2024-11-20','19:23:00.000000','20:20:00.000000',5);

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `myapp_tips_table` */

insert  into `myapp_tips_table`(`id`,`tips`,`date`,`descriptions`,`TRAINER_ID_id`) values 
(3,'ki9lophj','2024-11-01','umikkiujhhuio',3);

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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `myapp_trainer_request` */

insert  into `myapp_trainer_request`(`id`,`date`,`status`,`description`,`TRAINER_ID_id`,`USER_ID_id`) values 
(8,'2024-11-03','pending','ggg',3,4),
(9,'2024-11-03','pending','cf',3,4),
(10,'2024-11-03','pending','yy',3,4),
(11,'2024-11-03','pending','jeej',3,4);

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
(1,'gyhi','2024-11-03',1,4),
(2,'gui','2024-11-03',1,4),
(3,'done','2024-11-03',1,4);

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `myapp_user` */

insert  into `myapp_user`(`id`,`name`,`email`,`phone`,`place`,`pin`,`post`,`image`,`LOGIN_id`) values 
(1,'anagha','ana@gmail.com',34567,'sdf',345,'34','pexels-aleksandar-pasaric-325185_jvXVrcJ.jpg',2),
(3,'albin','albin@gmail.com',34567,'dfgh',345,'345','pexels-aleksandar-pasaric-325185_jvXVrcJ.jpg',3),
(4,'ashi','sgsh@gmail.com',9497642312,'ahsi',4567,'','hock36.jpg',16);

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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `myapp_videos` */

insert  into `myapp_videos`(`id`,`video`,`date`,`descriptions`,`TRAINER_ID_id`) values 
(2,'pexels-aleksandar-pasaric-325185_jvXVrcJ.jpg','2024-11-01','asdfghjklikm',3),
(3,'pexels-aleksandar-pasaric-325185_zGHYrZs.jpg','2024-11-01','sdfghjkl;cvbnm',3),
(4,'pexels-aleksandar-pasaric-325185_IIimMxx.jpg','2024-11-01','sdfghjkl;cvbnm',3),
(5,'pexels-aleksandar-pasaric-325185_ZiWhmNO.jpg','2024-11-01','sdfghjkl;cvbnm',3),
(6,'Screenshot_2022-04-26_160853.png','2024-11-01','asdfghj',3),
(7,'3327752-hd_1920_1080_24fps.mp4','2024-11-01','asdfg',1);

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `myapp_yoga_trainer` */

insert  into `myapp_yoga_trainer`(`id`,`name`,`email`,`phone`,`place`,`pin`,`post`,`language`,`experience`,`certificate`,`image`,`licence`,`LOGIN_id`) values 
(1,'albin','albiii',456621,'vatakara',4563,'hbhgu','english',8,'cbhukm.doc','pexels-aleksandar-pasaric-325185_hLPWLQ1.jpg','Screenshot 2022-04-26 160726_LuvKHlV.png',7),
(2,'anagha','anaghaaa',7412,'sfg',852345,'sdfg','hondhi',5,'ghj.doc','pexels-aleksandar-pasaric-325185_hLPWLQ1.jpg','Screenshot 2022-04-26 160726_LuvKHlV.png',8),
(3,'angf','ihj@gmail.com',6238512250,'eravtaoor',8282,'252','malayalam',2,'asus_ucd0CGH.jpg','pexels-aleksandar-pasaric-325185_hLPWLQ1.jpg','Screenshot 2022-04-26 160726_LuvKHlV.png',15);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
