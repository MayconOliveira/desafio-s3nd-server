/*
SQLyog Community v13.1.7 (64 bit)
MySQL - 8.0.22 : Database - s3nd
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`s3nd` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `s3nd`;

/*Table structure for table `conversations` */

DROP TABLE IF EXISTS `conversations`;

CREATE TABLE `conversations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `support_id` int DEFAULT NULL,
  `status` int DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `conversations` */

/*Table structure for table `failed_jobs` */

DROP TABLE IF EXISTS `failed_jobs`;

CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `failed_jobs` */

/*Table structure for table `messages` */

DROP TABLE IF EXISTS `messages`;

CREATE TABLE `messages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `conversation` int DEFAULT NULL,
  `user` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`id`),
  KEY `conversation` (`conversation`),
  CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`conversation`) REFERENCES `conversations` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;

/*Data for the table `messages` */

/*Table structure for table `migrations` */

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `migrations` */

insert  into `migrations`(`id`,`migration`,`batch`) values 
(1,'2014_10_12_000000_create_users_table',1),
(2,'2014_10_12_100000_create_password_resets_table',1),
(3,'2016_06_01_000001_create_oauth_auth_codes_table',1),
(4,'2016_06_01_000002_create_oauth_access_tokens_table',1),
(5,'2016_06_01_000003_create_oauth_refresh_tokens_table',1),
(6,'2016_06_01_000004_create_oauth_clients_table',1),
(7,'2016_06_01_000005_create_oauth_personal_access_clients_table',1),
(8,'2019_08_19_000000_create_failed_jobs_table',1);

/*Table structure for table `oauth_access_tokens` */

DROP TABLE IF EXISTS `oauth_access_tokens`;

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `client_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `oauth_access_tokens` */

insert  into `oauth_access_tokens`(`id`,`user_id`,`client_id`,`name`,`scopes`,`revoked`,`created_at`,`updated_at`,`expires_at`) values 
('0156d12f69e145edbba1ed4c72bebbe3d700d3457006f602655dde74af67d19b0fab0261ec2f0065',7,1,'Personal Access Token','[]',1,'2021-05-21 03:26:27','2021-05-21 03:26:27','2022-05-21 03:26:27'),
('01b43e2438520a9038e15980c464228a06e5f793e3eb0efedb7e93a029a25ed0af1037926ffeba7c',5,1,'Personal Access Token','[]',1,'2021-05-22 01:42:20','2021-05-22 01:42:20','2022-05-22 01:42:20'),
('048f0d935bf3d7bbf1780ccb07a8deeba622d82869f70242707df074a32afd15588fcc65f250360d',5,1,'Personal Access Token','[]',1,'2021-05-21 03:51:46','2021-05-21 03:51:46','2022-05-21 03:51:46'),
('060fac778b9cf99f9f72324071c765784b8930944e5b0fa2cb83ab35efc1bd44eb5df6d7f9670296',5,1,'Personal Access Token','[]',1,'2021-05-21 03:23:35','2021-05-21 03:23:35','2022-05-21 03:23:35'),
('068fb11bd70b2368cf36b6f0f47e4c999b14b596f013d5beaa1b35d25e861143eba90b830529ad5a',7,1,'Personal Access Token','[]',1,'2021-05-21 03:26:49','2021-05-21 03:26:49','2022-05-21 03:26:49'),
('07a2dbcd923012fdf22cc7609b33e9326a86ec6a3f3e7ef4b5ce29665a20df6172d4aeeac3ec8cc6',5,1,'Personal Access Token','[]',1,'2021-05-21 01:15:06','2021-05-21 01:15:06','2022-05-21 01:15:06'),
('0ab4c655531d142badb3bc084894aba6296e1df1b6679ce6bdd49d9078797157ddf951f57cc851ad',5,1,'Personal Access Token','[]',1,'2021-05-21 01:15:08','2021-05-21 01:15:08','2022-05-21 01:15:08'),
('0da4b53e33643390626467596ea3fbe8d906b83d0fa9558cfa35e6d65e2c8b35d6af4e0becfbc0d2',1,1,'Personal Access Token','[]',0,'2021-05-20 04:08:47','2021-05-20 04:08:47','2022-05-20 04:08:47'),
('12eff90d6d81307dfd0db2aaf31793128a5dcee34c2d65d267865aa2dd6b2bf3f1a98f3665555f4c',5,1,'Personal Access Token','[]',1,'2021-05-21 03:24:43','2021-05-21 03:24:43','2022-05-21 03:24:43'),
('14e7f5d977fdf714ae195cb09a5ceb32857773774bb5003eb95df505571e9af3fd68b4fd178a6b0a',5,1,'Personal Access Token','[]',1,'2021-05-20 23:53:59','2021-05-20 23:53:59','2022-05-20 23:53:59'),
('17b256e222fd73ec1c23b983313c158fa305cbfa07b24e19561ab969425b5dacb18328b98759b79e',5,1,'Personal Access Token','[]',1,'2021-05-22 17:52:11','2021-05-22 17:52:11','2022-05-22 17:52:11'),
('199e9eb9037a43548f2e2e379cc8db43144237812ddaf2f28cea0efbf6b0f787a7c041167a7c48f0',6,1,'Personal Access Token','[]',1,'2021-05-22 02:53:49','2021-05-22 02:53:49','2022-05-22 02:53:49'),
('19e13edcecb2f872695aa91feec133e4cc95a2bf4cbed4f8ac15eced6a2a01065e8253903a747047',3,1,'Personal Access Token','[]',1,'2021-05-20 04:09:29','2021-05-20 04:09:29','2022-05-20 04:09:29'),
('1cb8e01d1fbc4ac3936d9016cf3082ea5cd269d22a072cae3a6220a60010358e4a0bba8d0db10d2f',5,1,'Personal Access Token','[]',1,'2021-05-22 18:09:36','2021-05-22 18:09:36','2022-05-22 18:09:36'),
('1eab1eefe542fee8f429cf2f52da6574a9edfa37051bc34b399429d3e2374bddfcbe6410960fc495',5,1,'Personal Access Token','[]',1,'2021-05-20 23:08:07','2021-05-20 23:08:07','2022-05-20 23:08:07'),
('2130a41625b519d326d3718b221c305d609acbe7136dc6a397df4627240a33b60d449bef72db51cc',8,1,'Personal Access Token','[]',1,'2021-05-22 15:39:57','2021-05-22 15:39:57','2022-05-22 15:39:57'),
('24c8af7ca733a59e97e4405241de19ec86bd4625b02c4ce121a2a7827cdf2ecd5eb85e2a1b1a0e0e',5,1,'Personal Access Token','[]',1,'2021-05-22 00:52:50','2021-05-22 00:52:50','2022-05-22 00:52:50'),
('297384fddf9af425f81ecef262f5aaf4d4d5a36110b83aa561b5ba8c2bfe3c7062bc23479ff6dc9a',5,1,'Personal Access Token','[]',1,'2021-05-20 04:39:24','2021-05-20 04:39:24','2022-05-20 04:39:24'),
('2db4a13081f05ed3c157e08f027cde521da13b14108cb07895215b4ba0f39b5a3a8dfb56139a1878',5,1,'Personal Access Token','[]',1,'2021-05-21 01:30:15','2021-05-21 01:30:15','2022-05-21 01:30:15'),
('2db7f57cb49d3df0bafccc57280c7ac42789040f7f4007fdc0bcea939daaaecffb9cb164e01fe6b0',5,1,'Personal Access Token','[]',1,'2021-05-22 15:34:38','2021-05-22 15:34:38','2022-05-22 15:34:38'),
('2e59b88aa5ea88a1c23b64780fbd71165c8d9bcc96d4e5ef7be6addeca9c52f5cff57f693888df72',6,1,'Personal Access Token','[]',1,'2021-05-21 03:57:41','2021-05-21 03:57:41','2022-05-21 03:57:41'),
('36207ed546166cb677a03c4aac075ca5f547bed40104368107961d2ca6ab7e3c499e810ec97ed7bd',5,1,'Personal Access Token','[]',1,'2021-05-21 03:22:08','2021-05-21 03:22:08','2022-05-21 03:22:08'),
('362119bbed34ccaf09b5bfd1414e5458a7d270e4351b7a2b700069441a83202f9ffdc6f5e358cde9',5,1,'Personal Access Token','[]',1,'2021-05-20 23:48:15','2021-05-20 23:48:15','2022-05-20 23:48:15'),
('37cb7353eb3dc2b8f11f81547af713be550badc602ea6327a4b140fe42e1287edc295ed62f2b0b09',5,1,'Personal Access Token','[]',1,'2021-05-21 03:22:33','2021-05-21 03:22:33','2022-05-21 03:22:33'),
('3ba3bef06a8d30c65385d003264811b1d83c695768e114d4ea6612c7d736e538d51d07e9e5680f65',5,1,'Personal Access Token','[]',1,'2021-05-22 15:33:43','2021-05-22 15:33:43','2022-05-22 15:33:43'),
('3c22f9cdfdfb743761519025d1e73229d907076578821087b02507227450cede244449c16554b47c',5,1,'Personal Access Token','[]',1,'2021-05-21 03:23:21','2021-05-21 03:23:21','2022-05-21 03:23:21'),
('3c394a5ac02dbe6480ef74ba35d3439a437320d64ce086bc1383fd78f189a272545d7439627aed2c',5,1,'Personal Access Token','[]',1,'2021-05-20 23:15:10','2021-05-20 23:15:10','2022-05-20 23:15:10'),
('3cf16ae80fd39d080cf3fd7890b29afa7e171788ab4d378d93d057a39512afbf919f6c2bcee11ae6',5,1,'Personal Access Token','[]',1,'2021-05-21 03:24:25','2021-05-21 03:24:25','2022-05-21 03:24:25'),
('3e2f975a2d774c1cd470aa78857952e6979271f8e2e566b681f32a6995a3c3fe9edd293c9f3b57d6',10,1,'Personal Access Token','[]',1,'2021-05-22 18:12:04','2021-05-22 18:12:04','2022-05-22 18:12:04'),
('3fda58bfb93f3bf05b0421ca3a28296324866bde5cf2076fa8e4e02202f1e05cc23beae5dbdf1392',5,1,'Personal Access Token','[]',1,'2021-05-21 02:34:35','2021-05-21 02:34:35','2022-05-21 02:34:35'),
('486d539d24e3cd61afc0afde12909f40952bb143faff19d090ab82295c440d237615baa82fd1152d',6,1,'Personal Access Token','[]',1,'2021-05-21 03:52:47','2021-05-21 03:52:47','2022-05-21 03:52:47'),
('4c41b1f2e76eaa0e6812f7280d9435d63cbb65ab9dc55d2a8bd7e982a4a9e0373ba6c4b32526e58c',5,1,'Personal Access Token','[]',1,'2021-05-20 23:51:37','2021-05-20 23:51:37','2022-05-20 23:51:37'),
('51fe5b1b71025923958a8e1d1abc6be0c288c6864c8a8dc43f80829aa43330e2d06c6e478e3f3975',5,1,'Personal Access Token','[]',1,'2021-05-21 03:41:36','2021-05-21 03:41:36','2022-05-21 03:41:36'),
('528d836c995d9f697dff9ad851bf5a38a9f1228c846f7638afdfcdbd680617c01f35fcfa9ef5cfbc',5,1,'Personal Access Token','[]',1,'2021-05-20 04:45:16','2021-05-20 04:45:16','2022-05-20 04:45:16'),
('54dbdc586f37358c1fccfa4559edec5f34be52e08854ea2838c90e17342214fe2732b723db4b54b6',5,1,'Personal Access Token','[]',1,'2021-05-22 00:00:42','2021-05-22 00:00:42','2022-05-22 00:00:42'),
('5bbb74ae7e32b5c3504cfe4b91ad7c3cccad3ddd048976e6ab2d9a4c807da8e122eb13f85fa8e730',5,1,'Personal Access Token','[]',1,'2021-05-22 18:11:42','2021-05-22 18:11:42','2022-05-22 18:11:42'),
('60061eed5301c4bb5b6cd93fabf69ea05995fc4fab766de81a0ecec6979c1da2b5d29ae97253596e',7,1,'Personal Access Token','[]',1,'2021-05-21 03:28:08','2021-05-21 03:28:08','2022-05-21 03:28:08'),
('606aaad41053064ecb371c2d453e1ea8a88ec01007486024831e36c1558e5ec006abead1f1014540',5,1,'Personal Access Token','[]',1,'2021-05-21 04:06:28','2021-05-21 04:06:28','2022-05-21 04:06:28'),
('64d5b111d0361f40602f381a0f621c618f1df135d0e559e62bbdae21bb18e9ee9f5aef54355feec9',5,1,'Personal Access Token','[]',1,'2021-05-21 03:23:39','2021-05-21 03:23:39','2022-05-21 03:23:39'),
('655dabc979316790ea5369ef2cabc18423a371ebc63f5bfab06ebf36f00e27c111b6caea869968bf',10,1,'Personal Access Token','[]',1,'2021-05-22 18:14:59','2021-05-22 18:14:59','2022-05-22 18:14:59'),
('69c1aaac8dd795bcf472a66eb920e7ca7a93f3dcd90e975a115be40f2a75957aaa35e0fd02ce2ac5',5,1,'Personal Access Token','[]',1,'2021-05-21 03:48:24','2021-05-21 03:48:24','2022-05-21 03:48:24'),
('6b6f67dbb8e92a490fca085e584be0f1e948a71da493e618909c80a16ea49436f4882f31aa376244',5,1,'Personal Access Token','[]',1,'2021-05-22 01:21:00','2021-05-22 01:21:00','2022-05-22 01:21:00'),
('751a23881bf228329a576b9320754515ec0211a5a831f418ab8e53540b676c2a86fb2dcba38d0b9f',10,1,'Personal Access Token','[]',1,'2021-05-22 18:12:12','2021-05-22 18:12:12','2022-05-22 18:12:12'),
('7959b144651ffd8b1d7803f82c3562fb1059aa1d225421c7a43fad1dd5d2e3d717500a65169e9e62',5,1,'Personal Access Token','[]',1,'2021-05-20 04:17:28','2021-05-20 04:17:28','2022-05-20 04:17:28'),
('7ac2a26fab464890c1b99316a5ebacd3fdc3997835f41f601d1675007001906babe0e60d2cb52236',5,1,'Personal Access Token','[]',1,'2021-05-20 23:30:18','2021-05-20 23:30:18','2022-05-20 23:30:18'),
('813eac5b4f2cac09569bf598a25cf22f3d3ed06d1b2460b3693eb8d3f6255a47e2e9e5d7c7459cd7',5,1,'Personal Access Token','[]',1,'2021-05-20 23:20:16','2021-05-20 23:20:16','2022-05-20 23:20:16'),
('816cc4b249da3e9a2cd7e1a2a1d02b48f6f3bbed4787b0aca0668779735572248afe71832bfb1181',5,1,'Personal Access Token','[]',1,'2021-05-22 18:08:59','2021-05-22 18:08:59','2022-05-22 18:08:59'),
('86747eac4a3b9b511381d2b00ce384ab211ccb7eecfe325dfa2b039920335b6928fc29011a1130d6',5,1,'Personal Access Token','[]',1,'2021-05-20 23:46:41','2021-05-20 23:46:41','2022-05-20 23:46:41'),
('8b2623a3d34f4b44bfa2c19e42f30f544d5aa898867762337cbefc46332823bc5bdbd85c945cb965',6,1,'Personal Access Token','[]',1,'2021-05-22 02:54:30','2021-05-22 02:54:30','2022-05-22 02:54:30'),
('8ca961a315a71be8576cb4dac3c10d2fb27c134e9b2d55152a195c519d9723b60a5031ca4a057295',5,1,'Personal Access Token','[]',1,'2021-05-20 23:48:47','2021-05-20 23:48:47','2022-05-20 23:48:47'),
('8d92b5b80fbe4f383a6caf4161420baf2a452f5103fe749f2fdf40c1ff80dfb23935affa42a3f524',1,1,'Personal Access Token','[]',0,'2021-05-20 04:08:36','2021-05-20 04:08:36','2022-05-20 04:08:36'),
('917a7dda94d3eb421bd7d81549195fca40adf9a60b146534e31ed10984e435ea47f0e016768a52b1',9,1,'Personal Access Token','[]',1,'2021-05-22 18:11:36','2021-05-22 18:11:36','2022-05-22 18:11:36'),
('938a1055c5db5934b3b64ccfbbe4333e3da111785a7db8775edf88ab8e2f04ee0883d8b63ef86400',5,1,'Personal Access Token','[]',1,'2021-05-21 04:13:10','2021-05-21 04:13:10','2022-05-21 04:13:10'),
('93ba69c986d966b6c500bfba7bfb31c1d5e59201db12d914c6163a9e9fb6fba80e2c1670143c1cab',5,1,'Personal Access Token','[]',1,'2021-05-21 03:20:57','2021-05-21 03:20:57','2022-05-21 03:20:57'),
('9c7d08f5044b4b6cdb2f16f91e55c3197e1bf85317a4c8929f0a5b58cec88e7d1ef9e1e1ee8074f1',5,1,'Personal Access Token','[]',1,'2021-05-20 04:10:28','2021-05-20 04:10:28','2022-05-20 04:10:28'),
('a33466572e75dccdf068119481fc0b147afc135871c56615a39b4c00f4b374c5ca34e7651f0f4990',1,1,'Personal Access Token','[]',0,'2021-05-20 04:08:15','2021-05-20 04:08:15','2022-05-20 04:08:15'),
('a4247be4230830dec46d90eebb2198a03330fa73ad6ae389d654f27e4dd93316a4fc7de1f160545f',5,1,'Personal Access Token','[]',1,'2021-05-22 01:40:16','2021-05-22 01:40:16','2022-05-22 01:40:16'),
('a7893116f3146575a0e8b66aaa1979add2ba8b5cf490331aed8cac1f1e849030f26d2e443c4c3cb4',5,1,'Personal Access Token','[]',1,'2021-05-21 03:46:58','2021-05-21 03:46:58','2022-05-21 03:46:58'),
('a877d87037019b5735ea5e8eaa9e370a3b239f36d76222c9b0ec459dcd658d716a019f5070af4b2b',5,1,'Personal Access Token','[]',1,'2021-05-21 00:13:32','2021-05-21 00:13:32','2022-05-21 00:13:32'),
('ac336ffee66b39d44842a96a60c6c20d42e48a9271e2bf35e5a4d8bf52d9f888f708820a5f1aab08',2,1,'Personal Access Token','[]',0,'2021-05-20 04:09:06','2021-05-20 04:09:06','2022-05-20 04:09:06'),
('bcf82c506280d725bcb78d37f22dc4acbd9787b6224eef60f3791ce9b30b5c1b9bcd050b406abf0e',5,1,'Personal Access Token','[]',1,'2021-05-21 00:45:07','2021-05-21 00:45:07','2022-05-21 00:45:07'),
('c017bca17d049deb3989264d794bd1fd53d91dd66264d1f4b5407e59228f28b13b138e8e9f447d21',5,1,'Personal Access Token','[]',1,'2021-05-22 00:08:33','2021-05-22 00:08:33','2022-05-22 00:08:33'),
('c0274dbf1b240f35e55f6ec5f641fc29c30d5ae23dbe523dc65fa09fd1c39d1f17222c8454ecc3e5',5,1,'Personal Access Token','[]',1,'2021-05-21 03:43:55','2021-05-21 03:43:55','2022-05-21 03:43:55'),
('c7d971d6eb65206bc53bb3da6865fa67f0691707491772e92c7e020c091dc3d7e98a524dd73a5e6d',5,1,'Personal Access Token','[]',1,'2021-05-20 23:46:19','2021-05-20 23:46:19','2022-05-20 23:46:19'),
('c7f164f0a6f4a3c5b5ccde6dc1648eda1b35b3603e8c32f17837333ec1a91bd92c5bfd3077af7945',5,1,'Personal Access Token','[]',1,'2021-05-21 03:43:19','2021-05-21 03:43:19','2022-05-21 03:43:19'),
('c84daffba6e0196df7ebd92a66fbbcd5158e1b9ef655bc3c9059a341f7f03274d987c02a5bd23915',5,1,'Personal Access Token','[]',1,'2021-05-21 03:23:31','2021-05-21 03:23:31','2022-05-21 03:23:31'),
('c851be66f9a52e06cfd5d07b57c9b4afd43d6fea519c8d0148c0cb95a66aea3e84b5374152ae6e75',5,1,'Personal Access Token','[]',1,'2021-05-21 03:57:32','2021-05-21 03:57:32','2022-05-21 03:57:32'),
('c863cbde4bea36d530d9c7642a97a268bb35ee8995660772f0ae1d892f9405dc54694190c363102f',5,1,'Personal Access Token','[]',1,'2021-05-22 17:51:50','2021-05-22 17:51:50','2022-05-22 17:51:50'),
('ca0e88b8fee0ceaf0ae081562cb29901f02ba6607d8bf8b3f37ea47ddb3e8c081f184fb19d878cd6',5,1,'Personal Access Token','[]',1,'2021-05-21 03:20:39','2021-05-21 03:20:39','2022-05-21 03:20:39'),
('cf0179acd12f3fdac76335fa9c242625920906f2838d3ac843a90bc7d1afe6f36cf8e31a94e288ce',5,1,'Personal Access Token','[]',1,'2021-05-21 03:21:17','2021-05-21 03:21:17','2022-05-21 03:21:17'),
('cf6cdcada2eb55cbef9be0951e90d2558f9ed21c45962ffe86eac4990b20ef203ca6f1151f14828a',5,1,'Personal Access Token','[]',1,'2021-05-22 18:06:59','2021-05-22 18:06:59','2022-05-22 18:06:59'),
('d87b1297c2e3d247d2855d30e5333e986573fadb2ff358337a273d5b3c2eeca0fd8a746e55ecb070',5,1,'Personal Access Token','[]',1,'2021-05-21 00:06:37','2021-05-21 00:06:37','2022-05-21 00:06:37'),
('dab1a08431244d7ff6869f5d3b10267eb66339c4e361ffbcfaadfdb3d7187dfd486732c93f0f0d59',6,1,'Personal Access Token','[]',1,'2021-05-22 02:53:39','2021-05-22 02:53:39','2022-05-22 02:53:39'),
('dafacb1dde10f46706592d070ff53842b78298561c726140c3da3ac7c5a96fb86e1b7a10b375152f',4,1,'Personal Access Token','[]',1,'2021-05-20 04:09:54','2021-05-20 04:09:54','2022-05-20 04:09:54'),
('e1e90806c45d986af511851bbbbb678b1eaf1e94fbbd65aace89535f302566ce78dd9e2e2650af6d',5,1,'Personal Access Token','[]',1,'2021-05-22 15:39:41','2021-05-22 15:39:41','2022-05-22 15:39:41'),
('ec8aba87647b625f8279c5411d0ef61c25e80176e213aa1c35f44e0afcb2f47efda2e76a0e4d333a',5,1,'Personal Access Token','[]',1,'2021-05-22 15:40:07','2021-05-22 15:40:07','2022-05-22 15:40:07'),
('ef0860d00611f59763866d4f60c6994ff05cb1ced0a74a7f44dbb9bc33f8f85a9317b8e36d1b93c1',5,1,'Personal Access Token','[]',1,'2021-05-21 01:27:20','2021-05-21 01:27:20','2022-05-21 01:27:20'),
('f1d4793ae623b02a38f0fd67d356f777596a41d1ce3846d6bb896c318012e1b6c460376d4c72d50d',5,1,'Personal Access Token','[]',1,'2021-05-22 18:09:46','2021-05-22 18:09:46','2022-05-22 18:09:46'),
('f21562bc5c8de9a41fc19b56ad87272ef84c190dc0f2b1619ce5a4cadded5aec530c326ae68b680e',5,1,'Personal Access Token','[]',1,'2021-05-21 03:20:17','2021-05-21 03:20:17','2022-05-21 03:20:17'),
('f6221fbf74712e29417578c0dc8476a9c603edd7192adfc24f373ce61f7df221c7dd435883371a01',5,1,'Personal Access Token','[]',1,'2021-05-22 01:49:43','2021-05-22 01:49:43','2022-05-22 01:49:43'),
('fcee3308339df04e8e62ed787876e777e096a9d41fecc9de63894403fab9d3c1394d0f6b8bc5685f',5,1,'Personal Access Token','[]',1,'2021-05-22 18:11:15','2021-05-22 18:11:15','2022-05-22 18:11:15');

/*Table structure for table `oauth_auth_codes` */

DROP TABLE IF EXISTS `oauth_auth_codes`;

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `client_id` bigint unsigned NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_auth_codes_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `oauth_auth_codes` */

/*Table structure for table `oauth_clients` */

DROP TABLE IF EXISTS `oauth_clients`;

CREATE TABLE `oauth_clients` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `oauth_clients` */

insert  into `oauth_clients`(`id`,`user_id`,`name`,`secret`,`provider`,`redirect`,`personal_access_client`,`password_client`,`revoked`,`created_at`,`updated_at`) values 
(1,NULL,'Laravel Personal Access Client','bOmHI5oy3Yb22dZbDNFJcxvJd8ZhiNbu6NmdGyKl',NULL,'http://localhost',1,0,0,'2021-05-20 03:10:52','2021-05-20 03:10:52'),
(2,NULL,'Laravel Password Grant Client','t9XBYdwqzjlEio9h56zIXBX7IzbI5xxYf5v5ykHR','users','http://localhost',0,1,0,'2021-05-20 03:10:52','2021-05-20 03:10:52');

/*Table structure for table `oauth_personal_access_clients` */

DROP TABLE IF EXISTS `oauth_personal_access_clients`;

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `client_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `oauth_personal_access_clients` */

insert  into `oauth_personal_access_clients`(`id`,`client_id`,`created_at`,`updated_at`) values 
(1,1,'2021-05-20 03:10:52','2021-05-20 03:10:52');

/*Table structure for table `oauth_refresh_tokens` */

DROP TABLE IF EXISTS `oauth_refresh_tokens`;

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `oauth_refresh_tokens` */

/*Table structure for table `password_resets` */

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `password_resets` */

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `api_token` text COLLATE utf8mb4_unicode_ci,
  `support` int DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `users` */

insert  into `users`(`id`,`name`,`email`,`email_verified_at`,`password`,`remember_token`,`created_at`,`updated_at`,`api_token`,`support`) values 
(5,'Maycon','maycon.oliveira@live.com',NULL,'',NULL,'2021-05-20 04:10:28','2021-05-22 18:11:42','eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiNWJiYjc0YWU3ZTMyYjVjMzUwNGNmZTRiOTFhZDdjM2NjY2FkM2RkZDA0ODk3NmU2YWIyZDlhNGM4MDdkYThlMTIyZWIxM2Y4NWZhOGU3MzAiLCJpYXQiOjE2MjE3MDcxMDIuNjM3OTIsIm5iZiI6MTYyMTcwNzEwMi42Mzc5MjYsImV4cCI6MTY1MzI0MzEwMi40OTM3ODgsInN1YiI6IjUiLCJzY29wZXMiOltdfQ.uNt9s8DBq_Rc4XZesmDv39vK8GVs0FdSQ17Uz3dq-BOqg86Ilsyohwle3-xoywzNwV24ynjpZkGn53i1dAtwrpBqsgB73SqN2qr8-v8-1GJCLGLX_JNe9ROydO4IytI6FDZFgko1rK-vXS7xe7wP-H-m7DIRQwgsXm5HULlttBIpE_bh1gLfyMqjriJEAwB4icO6QZ4b0Mg-tvC7qUZe6Z1ieqqBH85lS6PZzf4K7GMZmrp_Gvoqh930un4tzLz3wwEpA0UoG4yX7YsH1XY-UBHEwfAVVU2A1eZjmi38uEBnmXlUIFRPGlNk9FPrA45AgB1OAGg0JXAbUnYjYlHOKjcvff60Rp1zlqLVS5exY-bcCPi50jFYrqTOhL7S6tELoVDP38x1LbNpmNLFaEIc8Gqz3hJyNas39LAEWYb5e2apUxhEFB0KuxRxczr4DRaY96P1Uh2uYLjLvpxVBuFDFmskLPHGuQf26wmk1eHOjyJWoZRwFN-xb8LbEU3Zz4qR8HjahnmTHbBEEKTzEW-u2VQcGnz5mtfqLC2tIUu3d5LJlungQtxeDdIg5YeWw3VOjPqvHL-HJLoMDe-SgiQxZMaFZaQD3BnLRh4IVnhax2wX0Mb-lr9G96OjeX8hNOpw0a6luFMjwja8Waw-S3dEvU01F2p9FjSvRZEBXydNjgY',1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
