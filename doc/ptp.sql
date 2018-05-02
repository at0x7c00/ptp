/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50538
Source Host           : localhost:3306
Source Database       : ptp

Target Server Type    : MYSQL
Target Server Version : 50538
File Encoding         : 65001

Date: 2018-05-02 17:56:33
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `aud_audit_log`
-- ----------------------------
DROP TABLE IF EXISTS `aud_audit_log`;
CREATE TABLE `aud_audit_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `timestamp` datetime DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aud_audit_log
-- ----------------------------

-- ----------------------------
-- Table structure for `lnk_product_filee`
-- ----------------------------
DROP TABLE IF EXISTS `lnk_product_filee`;
CREATE TABLE `lnk_product_filee` (
  `product_id` int(11) NOT NULL,
  `filee_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`filee_id`),
  KEY `FKA63B748380DACB47` (`filee_id`),
  KEY `FKA63B7483E631B03F` (`product_id`),
  CONSTRAINT `FKA63B748380DACB47` FOREIGN KEY (`filee_id`) REFERENCES `sys_file` (`id`),
  CONSTRAINT `FKA63B7483E631B03F` FOREIGN KEY (`product_id`) REFERENCES `trace_product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lnk_product_filee
-- ----------------------------
INSERT INTO `lnk_product_filee` VALUES ('1', '738');

-- ----------------------------
-- Table structure for `lnk_product_filee_quali`
-- ----------------------------
DROP TABLE IF EXISTS `lnk_product_filee_quali`;
CREATE TABLE `lnk_product_filee_quali` (
  `product_id` int(11) NOT NULL,
  `filee_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`filee_id`),
  KEY `FKDB30323E80DACB47` (`filee_id`),
  KEY `FKDB30323EE631B03F` (`product_id`),
  CONSTRAINT `FKDB30323E80DACB47` FOREIGN KEY (`filee_id`) REFERENCES `sys_file` (`id`),
  CONSTRAINT `FKDB30323EE631B03F` FOREIGN KEY (`product_id`) REFERENCES `trace_product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lnk_product_filee_quali
-- ----------------------------
INSERT INTO `lnk_product_filee_quali` VALUES ('1', '739');

-- ----------------------------
-- Table structure for `lnk_regist_apply_filee_quali`
-- ----------------------------
DROP TABLE IF EXISTS `lnk_regist_apply_filee_quali`;
CREATE TABLE `lnk_regist_apply_filee_quali` (
  `apply_id` int(11) NOT NULL,
  `filee_id` int(11) NOT NULL,
  PRIMARY KEY (`apply_id`,`filee_id`),
  KEY `FKC8C202080DACB47` (`filee_id`),
  KEY `FKC8C2020703C3B3C` (`apply_id`),
  CONSTRAINT `FKC8C2020703C3B3C` FOREIGN KEY (`apply_id`) REFERENCES `trace_register_apply` (`id`),
  CONSTRAINT `FKC8C202080DACB47` FOREIGN KEY (`filee_id`) REFERENCES `sys_file` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lnk_regist_apply_filee_quali
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_common_folder`
-- ----------------------------
DROP TABLE IF EXISTS `sys_common_folder`;
CREATE TABLE `sys_common_folder` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `folder_name` varchar(100) NOT NULL,
  `store_path` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_common_folder
-- ----------------------------
INSERT INTO `sys_common_folder` VALUES ('1', 'test', '/root/uploads_zlwhgc');
INSERT INTO `sys_common_folder` VALUES ('2', '应用软件', 'C:/software/App');
INSERT INTO `sys_common_folder` VALUES ('3', '操作系统', 'C:/software/OS');
INSERT INTO `sys_common_folder` VALUES ('4', '补丁程序', 'C:/software/Patch');
INSERT INTO `sys_common_folder` VALUES ('5', '配置文件', 'C:/software/Config');
INSERT INTO `sys_common_folder` VALUES ('6', '脚本文件', 'C:/software/Script');

-- ----------------------------
-- Table structure for `sys_config`
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_value` date DEFAULT NULL,
  `datetime_value` datetime DEFAULT NULL,
  `descripttion1` text,
  `descripttion2` text,
  `double_value` double DEFAULT NULL,
  `float_value` float DEFAULT NULL,
  `int_value` int(11) DEFAULT NULL,
  `name` text,
  `yes_no` enum('Yes','No') DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES ('1', null, null, 'smtp.yeah.net', null, null, null, null, '主机', null);
INSERT INTO `sys_config` VALUES ('2', null, null, 'mistest', null, null, null, null, '用户名', null);
INSERT INTO `sys_config` VALUES ('3', null, null, '1234%abcd', null, null, null, null, '密码', null);
INSERT INTO `sys_config` VALUES ('4', null, null, 'Yes', null, null, null, null, '发送是否验证', 'Yes');
INSERT INTO `sys_config` VALUES ('5', null, null, 'mistest@yeah.net', null, null, null, null, '发送人', null);
INSERT INTO `sys_config` VALUES ('6', null, null, null, null, null, null, null, 'http://221.122.94.10/cgi-bin/os_install.py', null);
INSERT INTO `sys_config` VALUES ('7', null, null, null, null, null, null, null, 'http://221.122.94.10/cgi-bin/write_file_ansible.py', null);
INSERT INTO `sys_config` VALUES ('8', null, null, null, null, null, null, null, 'http://221.122.94.10/cgi-bin/write_file_ansible.py', null);
INSERT INTO `sys_config` VALUES ('9', null, null, null, null, null, null, null, 'http://221.122.94.10/cgi-bin/temp_analysis.py', null);
INSERT INTO `sys_config` VALUES ('10', null, null, null, null, null, null, null, 'http://221.122.94.10/cgi-bin/file_analysis.py', null);
INSERT INTO `sys_config` VALUES ('11', null, null, null, null, null, null, null, '/var/www/html/', null);
INSERT INTO `sys_config` VALUES ('12', null, null, null, null, null, null, null, 'http://221.122.94.10/cgi-bin/list_file.py', null);
INSERT INTO `sys_config` VALUES ('13', null, null, null, null, null, null, null, 'http://221.122.94.10/cgi-bin/rsync_file.py', null);
INSERT INTO `sys_config` VALUES ('14', null, null, null, null, null, null, null, 'http://221.122.94.10:8080/', null);

-- ----------------------------
-- Table structure for `sys_department`
-- ----------------------------
DROP TABLE IF EXISTS `sys_department`;
CREATE TABLE `sys_department` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `manageKey` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `_version` int(11) DEFAULT '0',
  `parent` int(11) DEFAULT NULL,
  `children` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `status` enum('InUse','UnUse') NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1AC988045A30A5BA` (`parent`) USING BTREE,
  KEY `FK1AC988046F03BF01` (`children`) USING BTREE,
  KEY `FK1AC98804878011D2` (`parent_id`) USING BTREE,
  CONSTRAINT `sys_department_ibfk_1` FOREIGN KEY (`children`) REFERENCES `sys_department` (`id`),
  CONSTRAINT `sys_department_ibfk_2` FOREIGN KEY (`parent_id`) REFERENCES `sys_department` (`id`),
  CONSTRAINT `sys_department_ibfk_3` FOREIGN KEY (`parent`) REFERENCES `sys_department` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_department
-- ----------------------------
INSERT INTO `sys_department` VALUES ('1', '0e3cb5772f644a096f77b288ae03645a', '运营1部', '1', '0', null, null, null, 'InUse');
INSERT INTO `sys_department` VALUES ('2', '8477d00803903b3fcb758334f402f615', '运营2部', '2', '0', null, null, null, 'InUse');
INSERT INTO `sys_department` VALUES ('3', 'dee1bbd9f02e163f6bb227d7b224a6e6', '财务室', '1', '0', '1', null, null, 'InUse');

-- ----------------------------
-- Table structure for `sys_file`
-- ----------------------------
DROP TABLE IF EXISTS `sys_file`;
CREATE TABLE `sys_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_date` datetime DEFAULT NULL,
  `createDateEnd` datetime DEFAULT NULL,
  `createDateStart` datetime DEFAULT NULL,
  `extension_name` varchar(20) DEFAULT NULL,
  `manage_key` varchar(100) DEFAULT NULL,
  `name` varchar(200) NOT NULL,
  `store_name` varchar(100) DEFAULT NULL,
  `folder` int(11) NOT NULL,
  `status` enum('InUse','UnUse') DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK74A127AE81D99090` (`folder`) USING BTREE,
  CONSTRAINT `sys_file_ibfk_1` FOREIGN KEY (`folder`) REFERENCES `sys_common_folder` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=749 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_file
-- ----------------------------
INSERT INTO `sys_file` VALUES ('1', '2017-03-04 10:39:27', null, null, '.jpg', 'e68db8fb1abaeb56fd2f1f626c4321d7', '2政策动态.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('2', '2017-03-04 10:39:37', null, null, '.jpg', '5271f551147c3f31799afb8207dffef8', '2政策动态.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('3', '2017-03-04 10:44:32', null, null, '.jpg', 'a09cda72871b0e7d0360077a87391a7f', '2政策动态.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('4', '2017-03-04 12:04:09', null, null, '.jpg', 'f73741a24a9daca673d0f64ef14ed300', '1首页.jpg', '', '3', 'InUse');
INSERT INTO `sys_file` VALUES ('5', '2017-03-04 12:05:10', null, null, '.jpg', '2462eeb9704e2d3ee7a5ca7558d4b877', '8-1查询中心~结果2.jpg', '', '3', 'InUse');
INSERT INTO `sys_file` VALUES ('6', '2017-03-04 12:05:27', null, null, '.jpg', '2fdeb4d23b73eb6575cc2b1af5fcb524', '8-1查询中心~结果2.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('7', '2017-03-04 12:14:05', null, null, '.jpg', '5190bd1ab0d2ae2a7c5baf43e61bd5a8', '8-1查询中心~结果2.jpg', '', '3', 'InUse');
INSERT INTO `sys_file` VALUES ('8', '2017-03-04 12:14:10', null, null, '.jpg', '87784784aa812faa734761801b8f9f88', '4会员风采.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('9', '2017-03-04 13:57:12', null, null, '.jpg', '8a74cd15c1a1fd306524bb3ab11c1cb2', '1首页.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('10', '2017-03-04 14:04:14', null, null, '.jpg', 'ac14e83833d93b8dc8db99f1df25ab4a', '8-1查询中心~结果2.jpg', '', '3', 'InUse');
INSERT INTO `sys_file` VALUES ('11', '2017-03-04 14:22:58', null, null, '.jpg', '2dbc2ba341b290165ce903350ccc2ca8', '8-1查询中心~结果2.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('12', '2017-03-04 14:34:11', null, null, '.jpg', 'd09c6ba7b8d3dd1af6a089960a5fb462', '3质量热点.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('13', '2017-03-04 14:34:42', null, null, '.jpg', '645634adb620c05c66990c773c3ff67e', '8-1查询中心~结果1.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('14', '2017-03-04 14:54:05', null, null, '.jpg', '2713741f18a694be3f19db3f0e62b367', '8-1查询中心~结果2.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('15', '2017-03-04 14:55:10', null, null, '.jpg', 'ca9497eca492af454bdf63fbac7d2946', '8-1查询中心~结果3.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('16', '2017-03-04 14:55:52', null, null, '.jpg', 'ba58f7ef2e616d5c6d379afd7e5c8078', '8-1查询中心~结果2.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('17', '2017-03-04 14:57:38', null, null, '.jpg', '8c5650b8703836a68d6dd8d72f12ad74', '8-1查询中心~结果2.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('18', '2017-03-04 14:57:49', null, null, '.jpg', '57ef405cd2fe05817e51e7d3681cb6dd', '8-1查询中心~结果2.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('19', '2017-03-04 14:58:04', null, null, '.jpg', '2b60d2c74866b5e7d66291bf4fb0c6cf', '8-1查询中心~结果4.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('20', '2017-03-04 14:58:13', null, null, '.jpg', '0135df9212cc23a697034500f74270c3', '8-1查询中心~结果2.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('21', '2017-03-04 14:58:17', null, null, '.jpg', 'affadb88433fe612cedd55d128677529', '8-1查询中心~结果1.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('22', '2017-03-04 14:58:23', null, null, '.jpg', '2295bbca5e8580693bbc38693b55f341', '8-1查询中心~结果3.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('23', '2017-03-04 14:58:56', null, null, '.jpg', '9d4a7ecd1ee374ab0a97a4f778786253', '8-1查询中心~结果3.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('24', '2017-03-04 14:59:44', null, null, '.jpg', 'f63cf1ef03473ae9e2e6ebaa50f08308', '8-1查询中心~结果2.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('25', '2017-03-04 15:12:03', null, null, '.jpg', 'f1422e80faa7ce34d3c4d987bd3cc018', '8-1查询中心~结果1.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('26', '2017-03-04 15:12:14', null, null, '.jpg', '19c25c5b862cad44ddec1c061c5644fb', '8-1查询中心~结果3.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('27', '2017-03-04 15:12:18', null, null, '.jpg', 'f3a8af359e11748ffcf4f5aedfee4d35', '8-1查询中心~结果3.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('28', '2017-03-04 15:17:34', null, null, '.jpg', '7a7fd07fc0869683f7caf2e640ef1710', '1首页.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('29', '2017-03-04 15:17:38', null, null, '.jpg', 'a6801a5c772078e746dd168648da68c2', '2政策动态.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('30', '2017-03-04 15:17:41', null, null, '.jpg', 'd367f91e08a40c55f1a6406227f08426', '3质量热点.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('31', '2017-03-04 15:17:46', null, null, '.jpg', '65d5cfe953408b2e27920edcf9960eba', '4会员风采.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('32', '2017-03-04 15:17:49', null, null, '.jpg', 'd59ed6dacbbbfa467d1f233bf8c7ccd6', '5-1质量档案-企业展示.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('33', '2017-03-04 15:21:39', null, null, '.jpg', '50ccbe01cce978e125473562ba4c9c85', '8-1查询中心~结果2.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('34', '2017-03-04 15:21:53', null, null, '.jpg', 'd44a078feb9a28efdb0eebd5d548b275', '7关于我们.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('35', '2017-03-04 15:41:14', null, null, '.jpg', '5924370dac7204ac0d866628a4e510f9', '8-1查询中心~结果4.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('36', '2017-03-04 15:43:22', null, null, '.jpg', 'b0f0d78146ba940ac9d0c602a2a4b612', '3质量热点.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('37', '2017-03-04 16:34:36', null, null, '.jpg', '8b0afb29298c14684ee0e5cef713e634', '8-1查询中心~结果2.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('38', '2017-03-04 16:38:17', null, null, '.jpg', '65022bb3c24bc1657a31b75213131537', '8-1查询中心~结果2.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('39', '2017-03-04 16:45:52', null, null, '.jpg', 'b58d6593c7d45272a9f704d24613fae7', '5-1质量档案-企业展示.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('40', '2017-03-04 17:13:56', null, null, '.jpg', '647389cb76e330bdb3783a7b22bee8a4', '8-1查询中心~结果3.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('41', '2017-03-04 17:16:50', null, null, '.jpg', '9916c7212297d55fcdf3f40fb352a304', '8-1查询中心~结果2.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('43', '2017-03-06 14:04:49', null, null, '.jpg', '3c6540f84168c0c0223892951b64dacd', 'W020140606330951432729.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('44', '2017-03-06 14:05:10', null, null, '.jpg', 'f5b42cd53de64c5f56698e27dfa87418', 'W020140606330951432729.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('46', '2017-03-07 16:34:45', null, null, '.jpg', '1fbf3ba00b43c3afb2a3f2b64451ae95', 'W020140606330951432729.jpg', '', '3', 'InUse');
INSERT INTO `sys_file` VALUES ('47', '2017-03-07 17:34:21', null, null, '.jpg', '6a81d0f86b85774e021488fd419d67fc', 'W020140606330951432729.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('48', '2017-03-07 18:15:36', null, null, '.png', '2999962f0cd15fed84ab3042e429116d', 'news.png', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('49', '2017-03-07 18:16:24', null, null, '.png', '706327d6a52edd574ec3b4c7f31dffca', 'news-4.png', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('50', '2017-03-07 18:16:52', null, null, '.png', '7f5e664e94c3a8ae44e6a13c4d91a679', 'news-2.png', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('51', '2017-03-07 18:24:59', null, null, '.jpg', '09a5d34c408b9111b8c92eebede2b018', '1488798726591.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('52', '2017-03-07 18:25:09', null, null, '.jpg', '5977b65025e4d8038767c3f56725ca3c', '1488274935297.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('53', '2017-03-07 18:43:53', null, null, '.png', '3dcaf68d332787764f77295e014daab7', 'huiyuan-demo.png', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('54', '2017-03-07 19:34:54', null, null, '.png', '24b2d7d8a8997810ccbc65932ea83cca', 'huiyuan-demo.png', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('55', '2017-03-07 19:37:03', null, null, '.jpg', '438c8779d848007faf5273783e81ea6f', '1488509153978.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('56', '2017-03-07 19:37:36', null, null, '.jpg', '40e8d22736f341898b30585bbfd1d310', '1488691031862.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('57', '2017-03-07 19:38:01', null, null, '.jpg', '17bfc63976c4b57f25efc85c2ae03bfc', '1488770685195.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('58', '2017-03-07 19:38:40', null, null, '.jpg', 'd6402f5d87aad0b7af829d2b33da0c68', '1488780430104.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('59', '2017-03-07 19:39:04', null, null, '.jpg', '81625853d7a35a2b32a30244b58688f7', '1488769788719.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('60', '2017-03-07 19:39:32', null, null, '.jpg', '62c4ceb16f41aa981de22f5ec2d35f27', '1488770685195.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('61', '2017-03-08 11:23:12', null, null, '.jpg', '960235054c2a215159ad5d0e12600ca9', '1488798726591.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('62', '2017-03-08 11:23:20', null, null, '.jpg', 'fd5f33175846b941e43d334d77b2e611', '1488770685195.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('63', '2017-03-08 11:23:28', null, null, '.jpg', 'e3d7ee03f6c9df6c640406499eafaf29', '1488769788719.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('64', '2017-03-08 11:23:39', null, null, '.jpg', '1ef751fee5e252c6b03d5ed1a5c9317b', '1488691031862.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('65', '2017-03-08 16:25:26', null, null, '.jpg', '55c410ec2bfbd2f80458688315f65616', '1488780430104.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('66', '2017-03-08 16:25:30', null, null, '.jpg', 'ca8442edf670263c4c6fedb788fe2587', '1488769788719.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('67', '2017-03-08 16:25:35', null, null, '.jpg', 'f5631f3b2d41f36659f6edc7d9f84c17', '1488274935297.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('68', '2017-03-08 16:30:29', null, null, '.jpg', '99b6995139783bb9ca44c3a0d28d3e18', '1488691031862.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('69', '2017-03-08 16:30:33', null, null, '.jpg', '60993f05d9a2ee5a6f10c7beef4e762e', '1488509153978.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('70', '2017-03-08 16:30:39', null, null, '.jpg', 'c18c34d14b4cde8b534315aede7b5cd2', 'test.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('71', '2017-03-08 17:30:32', null, null, '.mp4', '81e4559dc11c01efb17b9c8882ec3bb8.mp4', 'oceans.mp4', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('72', '2017-03-11 09:14:27', null, null, '.jpg', '199226933814eaf654972021f55fd5eb', 'test.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('73', '2017-03-11 10:13:33', null, null, '.jpg', '3ab9245db849ad378c132ed8e5348128', '1488769788719.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('74', '2017-03-12 16:20:25', null, null, '.png', 'abca0866b006963e9b99fdcf508943c6', 'news.png', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('75', '2017-03-12 16:20:37', null, null, '.png', '764fa27961422a542e8a29414a292d39', 'news-4.png', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('76', '2017-03-12 16:20:47', null, null, '.png', 'd2bb8fcf7479cc95ce5824e99f8ff4a3', 'news-2.png', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('77', '2017-03-12 16:36:33', null, null, '.jpg', '96f73c0791d23dab03bb4b599704c715', '1488274935297.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('78', '2017-03-12 16:37:50', null, null, '.png', 'de02b70c3b9ad19c849e1491b4239a9c', 'ad1.png', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('79', '2017-03-12 16:37:57', null, null, '.png', '09843f7ff39c378f60c32331e61f9ebb', 'ad2.png', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('80', '2017-03-12 16:38:48', null, null, '.png', 'e81455cf3b6028beffebd6fea2c60580', 'ad1.png', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('81', '2017-03-12 16:38:56', null, null, '.png', '8fa734c1a3fd45523262739b82104c55', 'ad2.png', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('82', '2017-03-12 16:40:25', null, null, '.png', 'af460580dd38660eb7c22bce30eaa9a9', 'ad1.png', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('83', '2017-03-12 16:40:38', null, null, '.png', '13b1f97158606414019ec1fe24223d09', 'ad2.png', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('84', '2017-03-12 16:41:08', null, null, '.png', '9d484f3dd98d4060038819ee4696da49', 'huiyuan-demo.png', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('85', '2017-03-12 16:41:35', null, null, '.jpg', 'd05cca5ad984467e7bffb357df6c10df', '1488509153978.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('86', '2017-03-12 16:41:43', null, null, '.jpg', '2caae9c2c6ccc2731fd6376163a62889', '1488691031862.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('91', '2017-03-12 16:42:32', null, null, '.jpg', '6212add1f8b7d767caa68691cc1ea455', '1488274935297.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('92', '2017-03-12 16:43:59', null, null, '.jpg', '4933c70caa44d5acf7c6c3d2f770bd9b', '1488780430104.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('93', '2017-03-12 16:44:07', null, null, '.jpg', '5f5e60b8efa65b29b8ebecb103e5072b', '1488769788719.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('94', '2017-03-12 16:44:20', null, null, '.jpg', '9776fed7907f5d0650bf67444fa53c70', '1488509153978.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('95', '2017-03-12 16:44:31', null, null, '.jpg', '3a9a364cc2a95d5ec12ebe8984ef438d', 'test.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('99', '2017-03-12 16:48:36', null, null, '.jpg', 'a1569ddfff6e01ba682934c0b490351c', 'timg (1).jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('100', '2017-03-12 16:48:40', null, null, '.jpg', 'd878c9a4d55a81ec06f098f6674a835c', 'timg (2).jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('101', '2017-03-12 16:48:43', null, null, '.jpg', '5b5671eb1dbd5791eff4cc02c2b67a77', 'timg (3).jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('102', '2017-03-12 16:48:47', null, null, '.jpg', '6df2c42eec138ff88d8d6385a01c6eef', 'timg (4).jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('103', '2017-03-12 16:48:50', null, null, '.jpg', '6357008052d8eec8d46175e07b67595f', 'timg (5).jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('109', '2017-03-13 14:40:23', null, null, '.jpg', 'bbca541491a5ff01a401c8f177ba35d4', '1488274935297.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('111', '2017-03-14 11:24:38', null, null, '.png', '8a223fa04b67f8b3e73e98be045d311b', 'news-1.png', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('112', '2017-03-14 11:24:50', null, null, '.png', 'bd4b25e7892d4348e4dc38982bbeab57', 'news-3.png', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('113', '2017-03-14 11:26:02', null, null, '.png', '24e49ce2cb6a4ffc06de4bf7a2620f70', 'news-3.png', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('114', '2017-03-14 11:26:41', null, null, '.png', 'dad90756752e054e987be7a4a108cf37', 'news-2.png', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('120', '2017-03-15 10:55:58', null, null, '.png', '18191f44ad94a8fdafc004f474c58317', 'p4.png', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('121', '2017-03-15 10:56:01', null, null, '.png', 'e848aa7d3f13c25efa0a14301403e686', 'p5.png', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('122', '2017-03-16 15:31:00', null, null, '.jpg', '6dadae697a5e33c245c91583f9ff1f49', '杭州乔拓科技有限公司中国上传-01.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('123', '2017-03-17 11:06:08', null, null, '.jpg', 'fc2ce39ca2352451c6eb67e17ec4a9e0', '396318001017293481_副本1.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('124', '2017-03-17 11:22:03', null, null, '.png', '1d1636d77733ba8b3123ed16a5ff7ee4', '160815164215503815038383.png', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('125', '2017-03-17 11:22:15', null, null, '.png', '4484d7daa60453ea11df816f18ea7423', '160815164215503815038383.png', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('126', '2017-03-17 11:23:51', null, null, '.jpg', '0e79ea0a0daae42f37428063c2ed99a1', 'QQ截图20170317112329.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('130', '2017-03-17 11:25:41', null, null, '.jpg', '45527ea1ffbd84b00748694b750a7f98', '160819155852888318883204.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('131', '2017-03-17 11:25:46', null, null, '.png', '460362cac98825d7db37f1598420f781', '161021172216221012210927.png', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('132', '2017-03-17 11:27:00', null, null, '.jpg', '885be2ebddcc6d44355c3ba6990af3f6', 'QQ截图20170317112329.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('135', '2017-03-17 16:34:53', null, null, '.png', 'ace61d27225f60b2b227dcb4f98d9fd2', '图片1.png', '', '3', 'InUse');
INSERT INTO `sys_file` VALUES ('136', '2017-03-17 16:39:17', null, null, '.png', '4563c6a94f604c249ccfda2c83ada486', '图片2.png', '', '3', 'InUse');
INSERT INTO `sys_file` VALUES ('137', '2017-03-17 16:39:49', null, null, '.png', 'e1a55338f038d623c1fa784d83540185', '图片3.png', '', '3', 'InUse');
INSERT INTO `sys_file` VALUES ('138', '2017-03-17 16:41:37', null, null, '.png', 'fd6f7c47923d7fb663bb7ebac1ad6ff7', '图片2.png', '', '3', 'InUse');
INSERT INTO `sys_file` VALUES ('139', '2017-03-17 16:41:54', null, null, '.png', '5f00bced2c713ddd1b7d2014ac294f70', '图片1.png', '', '3', 'InUse');
INSERT INTO `sys_file` VALUES ('140', '2017-03-17 16:45:32', null, null, '.png', '77330dd08bbf69786b17e7c4bbb9cebe', '图片1.png', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('141', '2017-03-17 17:04:25', null, null, '.jpg', '3e6b17d4a6cd75e78c1835eeac9fa0be', '封面.jpg', '', '1', 'UnUse');
INSERT INTO `sys_file` VALUES ('142', '2017-03-17 17:08:55', null, null, '.jpg', 'c9a41f47c423224fbe911df65baedc3d', '11.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('143', '2017-03-17 17:09:34', null, null, '.png', 'a9309c3760265b52700c09ef5dc29791', '图片1.png', '', '3', 'InUse');
INSERT INTO `sys_file` VALUES ('144', '2017-03-17 17:09:54', null, null, '.png', 'd38e88eb6d11e2a8e2301fbf017eef75', '图片2.png', '', '3', 'InUse');
INSERT INTO `sys_file` VALUES ('145', '2017-03-17 17:10:30', null, null, '.png', 'e6b58e45cf00beb3ec40ad433fad227c', '图片2.png', '', '3', 'InUse');
INSERT INTO `sys_file` VALUES ('146', '2017-03-17 17:10:57', null, null, '.png', 'e05d95cdf256fda2fb17923b5e666195', '封面.png', '', '3', 'InUse');
INSERT INTO `sys_file` VALUES ('147', '2017-03-17 17:14:33', null, null, '.png', '9238c5ee571a1955c59c35f03ed4474c', '图片1.png', '', '3', 'InUse');
INSERT INTO `sys_file` VALUES ('148', '2017-03-17 17:14:49', null, null, '.png', '6fdcb4fc99af7613543d1cd2a5f9f426', '图片2.png', '', '3', 'InUse');
INSERT INTO `sys_file` VALUES ('149', '2017-03-17 17:22:27', null, null, '.jpg', 'ade4acef87078041672e6ec78b874e2b', '封面.jpg', '', '3', 'InUse');
INSERT INTO `sys_file` VALUES ('150', '2017-03-17 17:22:40', null, null, '.jpg', '2046dbbba5fdccd3e4bb60d0b6e9ec10', '封面.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('151', '2017-03-17 17:27:47', null, null, '.jpg', '19b7ef6b2d32b1a1922a9d286f4b1810', '绿色食品.jpg', '', '3', 'InUse');
INSERT INTO `sys_file` VALUES ('152', '2017-03-17 17:28:08', null, null, '.png', 'db4d784cf49e836428d3181fc26c4af5', '图片1.png', '', '3', 'InUse');
INSERT INTO `sys_file` VALUES ('153', '2017-03-17 17:28:24', null, null, '.png', '777c32d3369511d088be67665e9d4b49', '图片2.png', '', '3', 'InUse');
INSERT INTO `sys_file` VALUES ('154', '2017-03-17 17:28:34', null, null, '.jpg', '4bef6a8ff6cde1c439815e80ffab8fba', '封面.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('155', '2017-03-17 17:35:10', null, null, '.jpg', 'd61b94f7a69a4945efdb0158f6cfe29b', '图片1.jpg', '', '3', 'InUse');
INSERT INTO `sys_file` VALUES ('156', '2017-03-17 17:35:41', null, null, '.png', 'a29f2e9d4f696afe9569c453843fc9f3', '图片2.png', '', '3', 'InUse');
INSERT INTO `sys_file` VALUES ('157', '2017-03-17 17:36:52', null, null, '.jpg', '3f09b3d561948468386486bf4a189b36', '封面.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('158', '2017-03-17 17:46:03', null, null, '.jpg', '5563247287741256c1e6b08595cc109c', '1763.jpg_wh1200.jpg', '', '3', 'InUse');
INSERT INTO `sys_file` VALUES ('159', '2017-03-17 17:46:37', null, null, '.png', '2531b193b2bd6a61be5fb75aa86e3617', '图片2.png', '', '3', 'InUse');
INSERT INTO `sys_file` VALUES ('160', '2017-03-17 17:46:48', null, null, '.jpg', '4dd272ee49f68159136b3b50876b24df', '图片3.webp.jpg', '', '3', 'InUse');
INSERT INTO `sys_file` VALUES ('161', '2017-03-17 17:47:16', null, null, '.jpg', 'f6bd840b9d10e4fe1cc7a4854ee59290', '封面.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('162', '2017-03-17 17:56:03', null, null, '.jpg', '0aa9aa0bf7296c7b12b220ca1fc7bf3f', '581735_20141017182026078200_1.jpg', '', '3', 'InUse');
INSERT INTO `sys_file` VALUES ('163', '2017-03-17 17:56:17', null, null, '.jpg', 'd163435e8f7e379d51477c2bb2ea3288', '1085371_20170216155442754015_1.jpg', '', '3', 'InUse');
INSERT INTO `sys_file` VALUES ('164', '2017-03-17 17:56:28', null, null, '.jpg', 'ff45d27e3b1547148115bca35a5391e9', '封面.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('165', '2017-03-17 18:04:58', null, null, '.jpg', '15dbdb97fa6ae46c5050a6fd42525889', '131.webp.jpg', '', '3', 'InUse');
INSERT INTO `sys_file` VALUES ('166', '2017-03-17 18:05:26', null, null, '.png', 'e9f5c2405a636b7f4efe94f31589ab47', '图片1.png', '', '3', 'InUse');
INSERT INTO `sys_file` VALUES ('167', '2017-03-17 18:05:38', null, null, '.png', 'd701a90247e1e7cdff5e8527d809893e', '图片2.png', '', '3', 'InUse');
INSERT INTO `sys_file` VALUES ('168', '2017-03-17 18:05:46', null, null, '.jpg', '296b92cecc4c2158576050974080f1e1', '封面.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('169', '2017-03-17 18:23:49', null, null, '.jpg', 'fcc241453327fc373eb3bf616ff16d99', '李克强回答中外记者提问.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('170', '2017-03-17 18:31:17', null, null, '.jpg', '74a6d657b0cb0a74f994dc1175139928', '李克强回答中外记者提问.jpg', '', '1', 'UnUse');
INSERT INTO `sys_file` VALUES ('171', '2017-03-17 18:40:54', null, null, '.png', 'bab9ec9f89e0e822baca42bd83a73206', 'wzsl_tl.png', '', '3', 'InUse');
INSERT INTO `sys_file` VALUES ('172', '2017-03-17 18:59:12', null, null, '.jpg', '8dfdbf9eaf00691fb2cf622544b19b4e', 'timg.jpg', '', '3', 'InUse');
INSERT INTO `sys_file` VALUES ('173', '2017-03-17 19:10:12', null, null, '.jpg', '27e55e9775be7eaed1ebfa54b3cfacc1', 'timg.jpg', '', '3', 'InUse');
INSERT INTO `sys_file` VALUES ('174', '2017-03-17 19:11:39', null, null, '.jpg', '09fa51f3a60ed611b6eb49b1b22f9848', 'timg.jpg', '', '3', 'InUse');
INSERT INTO `sys_file` VALUES ('175', '2017-03-17 19:13:26', null, null, '.jpg', '727109c7a016ed7b13a061c6bae1f44d', '1.jpg', '', '3', 'InUse');
INSERT INTO `sys_file` VALUES ('176', '2017-03-17 19:13:27', null, null, '.png', '87e36c89f0387ac76612fb83f23f6cb0', '图片2.png', '', '3', 'InUse');
INSERT INTO `sys_file` VALUES ('177', '2017-03-17 19:13:45', null, null, '.png', 'fed0e1cfdd111f227f77e83d399417f2', '图片1.png', '', '3', 'InUse');
INSERT INTO `sys_file` VALUES ('178', '2017-03-17 19:14:00', null, null, '.png', 'f9ad22aeb58c06ac0a306ad37211061d', '图片3.png', '', '3', 'InUse');
INSERT INTO `sys_file` VALUES ('179', '2017-03-17 19:14:21', null, null, '.jpg', '3c16509a9fcf9f2537fa3084238890e7', '20170316101512140.jpg', '', '3', 'InUse');
INSERT INTO `sys_file` VALUES ('180', '2017-03-17 19:15:07', null, null, '.png', 'ee273b61f5368af4f5e3c89e3442ce95', '图片1.png', '', '3', 'InUse');
INSERT INTO `sys_file` VALUES ('181', '2017-03-17 19:15:20', null, null, '.png', '4089753cc96b8fe6508ea05688a0e6cb', '图片2.png', '', '3', 'InUse');
INSERT INTO `sys_file` VALUES ('182', '2017-03-17 19:15:41', null, null, '.png', '458e612b3295291812578d42dbcee6af', '封面.png', '', '3', 'InUse');
INSERT INTO `sys_file` VALUES ('183', '2017-03-17 19:15:42', null, null, '.jpg', 'f91eedfdb286accdf9827e6aa5816760', '20170316101512249.jpg', '', '3', 'InUse');
INSERT INTO `sys_file` VALUES ('184', '2017-03-17 19:16:35', null, null, '.jpg', 'eecf2efd069996664cdb00f3d76545de', '封面.jpg', '', '3', 'InUse');
INSERT INTO `sys_file` VALUES ('185', '2017-03-17 19:16:46', null, null, '.jpg', '5efd13604a17a8781f04e62df82d3ebf', '1.jpg', '', '3', 'InUse');
INSERT INTO `sys_file` VALUES ('186', '2017-03-17 19:16:49', null, null, '.jpg', 'e89a463b8e82c493f9a5f6aa6510b418', '20170316101512474.jpg', '', '3', 'InUse');
INSERT INTO `sys_file` VALUES ('187', '2017-03-17 19:16:52', null, null, '.png', '90a360483103378600c2c02892bddfc8', '图片1.png', '', '3', 'InUse');
INSERT INTO `sys_file` VALUES ('188', '2017-03-17 19:17:06', null, null, '.png', '2ec2437d704f9a419f0f8003d80e10ce', '图片2.png', '', '3', 'InUse');
INSERT INTO `sys_file` VALUES ('189', '2017-03-17 19:17:37', null, null, '.jpg', 'a45ff7021d75e05bca0982ec25c856c6', '20170316101513532.jpg', '', '3', 'InUse');
INSERT INTO `sys_file` VALUES ('190', '2017-03-17 19:17:57', null, null, '.jpg', '95c69c4fcee2ce283d95f5994e9e43bc', '绿色食品.jpg', '', '3', 'InUse');
INSERT INTO `sys_file` VALUES ('191', '2017-03-17 19:18:06', null, null, '.jpg', '22c44858b5dbfdb1c7e988b3575ef93b', '2.jpg', '', '3', 'InUse');
INSERT INTO `sys_file` VALUES ('192', '2017-03-17 19:18:09', null, null, '.png', '7de74a1e3c93b5c8b7a0fd3d084fb197', '图片1.png', '', '3', 'InUse');
INSERT INTO `sys_file` VALUES ('193', '2017-03-17 19:18:24', null, null, '.jpg', '419ca64707267e0b760616d3b247568b', '20170316101513972.jpg', '', '3', 'InUse');
INSERT INTO `sys_file` VALUES ('194', '2017-03-17 19:18:24', null, null, '.png', '7aa39c1a02cd80388287005e59e06a34', '图片2.png', '', '3', 'InUse');
INSERT INTO `sys_file` VALUES ('195', '2017-03-17 19:18:39', null, null, '.gif', 'e5c608b69cc0d3546b2be67d4d7e2de5', '3.gif', '', '3', 'InUse');
INSERT INTO `sys_file` VALUES ('196', '2017-03-17 19:18:58', null, null, '.jpg', 'b3890d1d8e64e69fca2982240cdbe112', '图片1.jpg', '', '3', 'InUse');
INSERT INTO `sys_file` VALUES ('197', '2017-03-17 19:19:13', null, null, '.png', '576a22e16011a8b30030fe58eb8d4cc6', '图片2.png', '', '3', 'InUse');
INSERT INTO `sys_file` VALUES ('198', '2017-03-17 19:19:43', null, null, '.jpg', 'c348454868329fd4baf8b4b40ce2e822', '1763.jpg_wh1200.jpg', '', '3', 'InUse');
INSERT INTO `sys_file` VALUES ('199', '2017-03-17 19:19:57', null, null, '.jpg', '1a5b2ad9d9110933589175959e283fe8', '2.jpg', '', '3', 'InUse');
INSERT INTO `sys_file` VALUES ('200', '2017-03-17 19:20:11', null, null, '.png', '2652da310eb4e9f14b15eb25626be07f', '图片2.png', '', '3', 'InUse');
INSERT INTO `sys_file` VALUES ('201', '2017-03-17 19:20:16', null, null, '.jpg', 'c0747404c0ef42dc69dc246f3643e458', '20170316101843826.jpg', '', '3', 'InUse');
INSERT INTO `sys_file` VALUES ('202', '2017-03-17 19:20:21', null, null, '.jpg', '123824f6aec6b680828710b9619c7834', '图片3.webp.jpg', '', '3', 'InUse');
INSERT INTO `sys_file` VALUES ('203', '2017-03-17 19:21:07', null, null, '.jpg', '6390d6bcbc755d0376db1dc2b9cf5fc2', '20170316101843705.jpg', '', '3', 'InUse');
INSERT INTO `sys_file` VALUES ('204', '2017-03-17 19:21:09', null, null, '.jpg', 'e2dc3900c21fbe8299ef1b612cbdd6b5', '131.webp.jpg', '', '3', 'InUse');
INSERT INTO `sys_file` VALUES ('205', '2017-03-17 19:21:22', null, null, '.png', '4eab04817c6f3d23aa4f42ff7f7058e9', '图片1.png', '', '3', 'InUse');
INSERT INTO `sys_file` VALUES ('206', '2017-03-17 19:21:38', null, null, '.png', '9bfc200a9ae81f0afdecdc36bc225429', '图片2.png', '', '3', 'InUse');
INSERT INTO `sys_file` VALUES ('207', '2017-03-17 19:21:40', null, null, '.jpg', '3650cf0868800e0081f15a43f213ac62', '20170316101844558.jpg', '', '3', 'InUse');
INSERT INTO `sys_file` VALUES ('208', '2017-03-17 19:22:07', null, null, '.jpg', '7ab8bce4df38d4db6bccf839d6094967', '581735_20141017182026078200_1.jpg', '', '3', 'InUse');
INSERT INTO `sys_file` VALUES ('209', '2017-03-17 19:22:27', null, null, '.jpg', '64a8e38f482a18e6d13b79f4537a730f', '1085371_20170216155442754015_1.jpg', '', '3', 'InUse');
INSERT INTO `sys_file` VALUES ('210', '2017-03-17 19:22:42', null, null, '.jpg', 'f84c9311bbc3a4e75170c9ae0dee51af', '20170316101844235.jpg', '', '3', 'InUse');
INSERT INTO `sys_file` VALUES ('211', '2017-03-17 19:23:20', null, null, '.jpg', '9b1dba9ce844fbc8b294c1e7618b80f7', '1.jpg', '', '3', 'InUse');
INSERT INTO `sys_file` VALUES ('212', '2017-03-17 19:23:40', null, null, '.jpg', '6cf1de1e9b1466c2a62b2d9dd7cb469d', '2.jpg', '', '3', 'InUse');
INSERT INTO `sys_file` VALUES ('213', '2017-03-17 19:23:56', null, null, '.jpg', '3b255568c3a46d64029cd5d7a81e2fcb', '3.jpg', '', '3', 'InUse');
INSERT INTO `sys_file` VALUES ('214', '2017-03-17 19:26:01', null, null, '.png', '4dcd0a0b8f3bdb68fb94d2f89108f6c9', 'wzsl_tl.png', '', '3', 'InUse');
INSERT INTO `sys_file` VALUES ('215', '2017-03-17 19:26:36', null, null, '.jpg', '70857d3fe1892871a10537d39f80917a', '20170317103035790.jpg', '', '3', 'InUse');
INSERT INTO `sys_file` VALUES ('216', '2017-03-17 19:26:42', null, null, '.jpg', 'e9ca7ad799bacfee46011c8b316b1936', 'timg.jpg', '', '3', 'InUse');
INSERT INTO `sys_file` VALUES ('217', '2017-03-17 19:36:48', null, null, '.jpg', '9595c48ff0835b18122aef72e56ca36a', '0.jpg', '', '3', 'InUse');
INSERT INTO `sys_file` VALUES ('218', '2017-03-17 19:37:39', null, null, '.jpg', '9291ffe016e24d312990cb5dff874d90', '0 (1).jpg', '', '3', 'InUse');
INSERT INTO `sys_file` VALUES ('219', '2017-03-17 19:38:14', null, null, '.jpg', 'b9516c5f7248e6f75f3ef671ee8dcacd', '0 (2).jpg', '', '3', 'InUse');
INSERT INTO `sys_file` VALUES ('220', '2017-03-17 19:39:05', null, null, '.jpg', 'deaa6f5bf16d8d943fb98d02582d98bd', '0 (3).jpg', '', '3', 'InUse');
INSERT INTO `sys_file` VALUES ('221', '2017-03-17 19:39:25', null, null, '.jpg', '4eac621edb71cf4570f48add815059ee', '0 (3).jpg', '', '3', 'InUse');
INSERT INTO `sys_file` VALUES ('222', '2017-03-17 19:39:40', null, null, '.jpg', '9ac7fb435f479621095dc45698b129b6', '0 (3).jpg', '', '3', 'InUse');
INSERT INTO `sys_file` VALUES ('223', '2017-03-17 19:39:50', null, null, '.jpg', '039ddd3b079ce1e808a5df813b61f5d9', 'b71426bdeba24839802f68a008f32a1a.jpg', '', '3', 'InUse');
INSERT INTO `sys_file` VALUES ('224', '2017-03-17 19:40:17', null, null, '.jpg', 'ad66c34074132d311e4df0b289c6d363', '0 (4).jpg', '', '3', 'InUse');
INSERT INTO `sys_file` VALUES ('225', '2017-03-17 19:41:41', null, null, '.jpg', '2d06c3e798eb6bf98b61176fd70cf106', '0 (5).jpg', '', '3', 'InUse');
INSERT INTO `sys_file` VALUES ('226', '2017-03-17 19:42:20', null, null, '.jpg', '8241d87f47d9ab83a73b29ea5672d976', '0 (6).jpg', '', '3', 'InUse');
INSERT INTO `sys_file` VALUES ('227', '2017-03-17 19:43:04', null, null, '.jpg', 'dd04d7ef913a6c791054b831d2083244', '0 (8).jpg', '', '3', 'InUse');
INSERT INTO `sys_file` VALUES ('228', '2017-03-17 19:53:21', null, null, '.jpg', '865f352644dfdd833fb9f145cd502212', '2017年3·15第三届中国质量诚信品牌论坛在北京成功举办.jpg', '', '1', 'UnUse');
INSERT INTO `sys_file` VALUES ('229', '2017-03-17 20:22:21', null, null, '.jpg', 'a07cf621557a994336ac8902fcb5a8e5', '李克强：要用先进标准倒逼“中国制造”升级.jpg', '', '1', 'UnUse');
INSERT INTO `sys_file` VALUES ('231', '2017-03-17 20:42:17', null, null, '.jpg', '917dd237e21bcd0ea5901696f1314627', 'timg.jpg', '', '3', 'InUse');
INSERT INTO `sys_file` VALUES ('232', '2017-03-17 20:42:58', null, null, '.jpg', '54c9c55bea9575fb54c4646a2761f519', 'viewPic.do.jpg', '', '3', 'InUse');
INSERT INTO `sys_file` VALUES ('244', '2017-03-20 11:32:02', null, null, '.jpg', 'cccfa9f91a82402ebabd8ca96fb24f74', 'QQ截图20170320113129.jpg', '', '1', 'UnUse');
INSERT INTO `sys_file` VALUES ('245', '2017-03-20 11:36:44', null, null, '.jpg', '74af9d10ac586699c03dde3d4b88fa19', '餐厅.jpg', '', '1', 'UnUse');
INSERT INTO `sys_file` VALUES ('246', '2017-03-20 11:36:48', null, null, '.jpg', 'a5834af7008d5277f9765afe425a3a26', '厨房.jpg', '', '1', 'UnUse');
INSERT INTO `sys_file` VALUES ('247', '2017-03-20 11:36:52', null, null, '.jpg', 'b801fbf693bf533b27a788f1f726ab2e', '客厅立面图.jpg', '', '1', 'UnUse');
INSERT INTO `sys_file` VALUES ('248', '2017-03-20 11:36:56', null, null, '.jpg', 'c23421ba834c6e9ea751c5cf2375f0c5', '现代欧式客厅.jpg', '', '1', 'UnUse');
INSERT INTO `sys_file` VALUES ('249', '2017-03-20 11:37:00', null, null, '.jpg', '7f83568918c7471fb48d9cf48a64d0a2', '中式客厅.jpg', '', '1', 'UnUse');
INSERT INTO `sys_file` VALUES ('250', '2017-03-20 11:38:20', null, null, '.jpg', 'feda20748894dfd89c4b782d3ba7a229', '形象.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('251', '2017-03-20 11:40:37', null, null, '.jpg', 'c2210c9d5cdd57490f59986cc88e9399', '公司图.jpg', '', '1', 'UnUse');
INSERT INTO `sys_file` VALUES ('258', '2017-03-20 12:00:41', null, null, '.jpg', '0bab939e79ea32c5b7cea02190e32722', '便携式激光夜视产品.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('259', '2017-03-20 12:00:45', null, null, '.jpg', 'fe7b32a2de334778ed1900322a4ac841', '单视窗可见光产品.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('260', '2017-03-20 12:00:49', null, null, '.jpg', 'c08fee95a6735e555f80c6b2d1cd8592', '单视窗热成像仪产品.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('261', '2017-03-20 12:00:53', null, null, '.jpg', 'cf5f386a80b2570a47b68dee3fdeec89', '激光 热成像多光谱产品.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('262', '2017-03-20 12:00:57', null, null, '.jpg', 'f7593aab659746464325311272356468', '激光夜视产品.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('263', '2017-03-20 12:01:01', null, null, '.jpg', 'f505ed22f329ff6647038772d5e26c3e', '可见光 热成像双光谱产品.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('264', '2017-03-20 12:01:05', null, null, '.jpg', '8b4b477079e166f9bfb8e6e807eda9c3', '智能重型云台产品.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('265', '2017-03-20 13:09:16', null, null, '.jpg', '840fdc6c64b5148edf0a2b935b3c93e6', '封面.jpg', '', '1', 'UnUse');
INSERT INTO `sys_file` VALUES ('266', '2017-03-20 13:51:35', null, null, '.jpg', 'ffa4a23e3c5c2278d06486702b4a9293', '图.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('267', '2017-03-20 14:19:45', null, null, '.jpg', 'f267d7ce2415df265d0d6c3de6d1ac02', '001.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('268', '2017-03-20 14:23:39', null, null, '.jpg', 'e505a8896a3e0a0e7af8936b1f06704c', '广东赤龙.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('269', '2017-03-20 14:39:58', null, null, '.jpg', '467587333927d8793a0991399092e68d', '于磊.jpg', '', '1', 'UnUse');
INSERT INTO `sys_file` VALUES ('270', '2017-03-20 16:00:44', null, null, '.jpg', '9fdf45a9a87f780af2b6e78f4fa76752', '封面.jpg', '', '1', 'UnUse');
INSERT INTO `sys_file` VALUES ('275', '2017-03-20 16:03:57', null, null, '.jpg', 'ea280738b6a715dc84c484e18b70ebaf', '高强度刻度尺专利石膏板.jpg', '', '1', 'UnUse');
INSERT INTO `sys_file` VALUES ('276', '2017-03-20 16:04:54', null, null, '.jpg', 'ddd2d7229e25e23bd8c5a504d62c49a6', '精准刻度尺纸面石膏板.jpg', '', '1', 'UnUse');
INSERT INTO `sys_file` VALUES ('280', '2017-03-20 16:05:27', null, null, '.jpg', '716b8cee0ce8c3c5a6a1871f62992b5b', '1.jpg', '', '1', 'UnUse');
INSERT INTO `sys_file` VALUES ('281', '2017-03-20 16:06:25', null, null, '.jpg', '8cb2f48940c51b39f2af858da2875cc3', 'CCTV采访企业.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('282', '2017-03-20 16:29:28', null, null, '.jpg', 'ec76b1425e1f65991169367dbc828f80', '图片.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('283', '2017-03-20 16:29:35', null, null, '.jpg', '8f22d4f683f7a63582cbb5e12e7e2951', 'ENR-BNR系列变压器中性点接地电阻柜.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('284', '2017-03-20 16:29:39', null, null, '.jpg', 'b86633836d59fe32871fb3947fe74211', 'ENR-DR-低压接地电阻柜（高阻柜）.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('285', '2017-03-20 16:29:43', null, null, '.jpg', '60fd187ea997c21e8f414eb4d1102a2d', 'ENR-FNR发电机中性点接地电阻柜.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('286', '2017-03-20 16:29:47', null, null, '.jpg', 'ca3a4cf5c30ad606309b3de0a499f6c1', 'ENR-JCG-10KV真空接触器柜（高压接地柜）.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('287', '2017-03-20 16:29:51', null, null, '.jpg', '25ed4cce872a6b7b75da97a36861f390', 'ENR-JXB系列变压器中性点间隙接地保护成套装置.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('288', '2017-03-20 16:29:55', null, null, '.jpg', '3151cc02009de19c453b49d4872d00a3', 'ENR-XHBZ消弧线圈及接地变成套装置.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('289', '2017-03-20 16:29:59', null, null, '.jpg', 'a708d8e497f54a16e1e12bf15700fd13', 'ENR-XHZ系列消弧消谐及过电压保护装置.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('290', '2017-03-20 16:30:02', null, null, '.jpg', 'a3670ed1ebe3c1962a35b904595a6088', 'ENR-ZR自控式阻容吸收器.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('294', '2017-03-20 16:31:15', null, null, '.jpg', 'd760bf08c67b134b5080872cf202c85e', '封面.jpg', '', '1', 'UnUse');
INSERT INTO `sys_file` VALUES ('295', '2017-03-20 16:54:25', null, null, '.jpg', '7040177db50bb68c651fa479f2a50e75', '封面.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('296', '2017-03-20 16:54:35', null, null, '.jpg', '9d6c7f1e0e6922f7c2c64a073b30f857', '白衣仙子水性粉笔.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('297', '2017-03-20 16:54:39', null, null, '.jpg', '83f2b1919f3b572bca25d726bc87ec01', '儿童手指画套装.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('298', '2017-03-20 16:54:44', null, null, '.jpg', 'd8cd4dbdaa41e4a70ac62a585819ba81', '啦啦彩（人体彩绘）.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('299', '2017-03-20 16:54:48', null, null, '.jpg', '3169bc85dd2686b46e06305ca7c73192', '水溶性写画笔.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('300', '2017-03-20 16:54:52', null, null, '.jpg', 'a8bdc73d51f65aeb2b67b63b4137df0a', '幼儿园涂鸦角.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('305', '2017-03-20 16:55:23', null, null, '.jpg', 'dee39be06e8096b2cdbdba079b92c00c', '5.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('309', '2017-03-20 16:59:42', null, null, '.jpg', 'fd11ea4b8a7b4279d123fc5f0d39223c', '封面.jpg', '', '1', 'UnUse');
INSERT INTO `sys_file` VALUES ('310', '2017-03-20 17:03:15', null, null, '.jpg', 'eb141efe35798d813e14bac36fc7c7cb', '公司简介图片.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('311', '2017-03-20 17:17:52', null, null, '.jpg', '2a6c38b109b217f34de0bc73cffde5a3', '证书.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('312', '2017-03-20 17:22:31', null, null, '.jpg', '60803ef34326fa4ebb9b71d5de17280c', '证书_看图王.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('313', '2017-03-20 17:25:54', null, null, '.jpg', '0d3343fe26106a990b0c213cb5e0ca3e', '证书_看图王_副本.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('314', '2017-03-20 17:42:51', null, null, '.jpg', '82fe743b6b00fb0576a5b0d0298c07d1', '001_副本.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('315', '2017-03-20 17:44:06', null, null, '.jpg', 'aeb5e8940a1c09a842cb8f078c88da1e', '001_副本.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('316', '2017-03-20 17:45:59', null, null, '.jpg', '9b7114f663f78424594d4dfbfca3a71f', '002_副本.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('317', '2017-03-21 09:19:52', null, null, '.jpg', '93702ac288cb3ad65401441bcbff4c3d', '南充_副本.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('318', '2017-03-21 09:21:09', null, null, '.jpg', 'ce36601d9b13c6a13c2e214a1e7a5860', '松齐明_副本.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('319', '2017-03-21 09:21:50', null, null, '.jpg', '35897f74c599db952e7549d9b17844e8', '中大云科_副本.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('320', '2017-03-21 10:43:10', null, null, '.jpg', 'dd1fb1aae1a2553751af107768c7c915', '四川桂溪_副本.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('321', '2017-03-21 10:47:34', null, null, '.jpg', '2fe565d48bd8544620808ba7ec4261e9', '船城_副本.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('322', '2017-03-21 10:51:09', null, null, '.jpg', '26dbbe919d4f2b5ff902d67155e4bae0', '红苹果_副本.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('323', '2017-03-21 11:04:08', null, null, '.jpg', 'b49695bfebebe3b920976d86bdc6655e', '成都舒慰_副本.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('324', '2017-03-21 11:09:23', null, null, '.jpg', 'f779fcab8e204cd0fc3830a67172f50f', '鸿兴土木_副本.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('325', '2017-03-21 11:15:03', null, null, '.jpg', '702a9c04d1219ac1a965ee650812c9b6', '予邦生物_副本.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('326', '2017-03-21 11:15:58', null, null, '.jpg', '92e1ded75ce3573303181d15a3a4280c', '佛山雅素丽_副本.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('327', '2017-03-21 11:16:29', null, null, '.jpg', '17d9827e764668f1168c3333282171d4', '梅州新佳利_副本.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('328', '2017-03-21 11:16:37', null, null, '.jpg', 'b409007182c6afd822a9918145e52e9f', '平远威大地_副本.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('329', '2017-03-21 11:17:35', null, null, '.jpg', '86f57f42fdcd09f34cbddb47287c6069', '四川大彭_副本.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('330', '2017-03-21 11:17:47', null, null, '.jpg', '23c202eff4c278992cc0b294a8b9ed60', '东汇龙_副本.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('331', '2017-03-21 11:19:15', null, null, '.jpg', '1232be3144b7a6ea93000e7ea003a65f', '重庆小时候_副本.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('332', '2017-03-21 11:19:50', null, null, '.jpg', 'd532ef9d7443761f4a896ddd6d577ae3', '江门康庭_副本.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('333', '2017-03-21 11:20:22', null, null, '.jpg', '369eab7703b692f06ee32fbe5e982a59', '中山特美新_副本.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('334', '2017-03-21 11:20:52', null, null, '.jpg', '035a2550d91fa47a1c0f8847c548530e', '易启东方_副本.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('335', '2017-03-21 11:21:20', null, null, '.jpg', '209f7a21f1c996ce73b7f4ac10652ac4', '临洮六禾_副本.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('336', '2017-03-21 11:21:49', null, null, '.jpg', '8f528b24bc220658de267dbd0bca6381', '四川中道辟谷_副本.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('337', '2017-03-22 14:54:01', null, null, '.jpg', 'd2943279cad72b3b4f4b39280614ada7', '1.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('338', '2017-03-22 14:54:34', null, null, '.jpg', 'c49d516c56ccdde4673e6a005c6ad05b', '2.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('339', '2017-03-22 14:54:49', null, null, '.jpg', '280b19ff547391d58c3fe379638b5d35', '3.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('340', '2017-03-22 14:55:05', null, null, '.jpg', '40ba06c4adec03ff10009337383c7377', '4.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('341', '2017-03-22 14:55:21', null, null, '.jpg', '5e722a87a3b2e784e2dc75b6cdd6c779', '5.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('342', '2017-03-22 14:55:35', null, null, '.jpg', 'b0023440cba24a01a8b31f659100266e', '6.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('343', '2017-03-22 14:55:48', null, null, '.jpg', '934d95be645c526c4be048f6b77b7150', '7.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('344', '2017-03-22 14:56:15', null, null, '.jpg', 'a37f313ae108d61aa94cfb0433a2cd13', '2.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('345', '2017-03-22 14:58:44', null, null, '.jpg', 'f51f405fee60c1d9266e7b41ae9012bd', '1.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('346', '2017-03-22 14:58:58', null, null, '.jpg', '34fc6344abb430266af932fc19958147', '2.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('347', '2017-03-22 14:59:14', null, null, '.jpg', '6c80aaa282688c4f5b1243694a8ecb9f', '3.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('348', '2017-03-22 14:59:29', null, null, '.jpg', '00ea8e71643937ba5affc9577564f9b3', '4.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('349', '2017-03-22 14:59:43', null, null, '.jpg', '7b0bff06adb01b3db305e057e5236d9c', '5.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('350', '2017-03-22 14:59:59', null, null, '.jpg', '1f2f83550925ddab29116b7268451b47', '1.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('352', '2017-03-23 11:40:58', null, null, '.png', '649a5329fdad38d26570f311563d58ab', '285x160.png', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('354', '2017-03-23 13:49:14', null, null, '.jpg', '854eccf56ad98c336ab7ecee87a0e3f3', '1.jpg', '', '1', 'UnUse');
INSERT INTO `sys_file` VALUES ('355', '2017-03-23 13:49:20', null, null, '.jpg', 'f6ddc00e99c466fb8fd3a98d0da15bfa', '2.jpg', '', '1', 'UnUse');
INSERT INTO `sys_file` VALUES ('356', '2017-03-23 13:49:24', null, null, '.jpg', '3cfa43d2f4c362b067d570c6bc05d240', '3.jpg', '', '1', 'UnUse');
INSERT INTO `sys_file` VALUES ('357', '2017-03-23 13:49:28', null, null, '.jpg', '74a7bb68d0f06445a7961baf7c163797', '4.jpg', '', '1', 'UnUse');
INSERT INTO `sys_file` VALUES ('358', '2017-03-23 13:49:31', null, null, '.jpg', '4b3f5be31f660807d82351a9022b1343', '5.jpg', '', '1', 'UnUse');
INSERT INTO `sys_file` VALUES ('359', '2017-03-23 13:49:35', null, null, '.jpg', 'aeca58272cc06c535a822b6434a73208', '6.jpg', '', '1', 'UnUse');
INSERT INTO `sys_file` VALUES ('360', '2017-03-23 13:49:38', null, null, '.jpg', '175bd1f5a1f6d3ceb2ce5f09dd81054e', '7.jpg', '', '1', 'UnUse');
INSERT INTO `sys_file` VALUES ('361', '2017-03-23 13:50:12', null, null, '.jpg', 'a0bcbd2078e80ec0c38b52137262f283', '1.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('362', '2017-03-23 13:50:17', null, null, '.jpg', 'c4c7761deea4e04444f3e612723d7383', '2.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('363', '2017-03-23 13:50:20', null, null, '.jpg', '7de954d03a05aeb16c83f4d2cc170f21', '3.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('364', '2017-03-23 13:50:24', null, null, '.jpg', '0707dcc3d7c8d7ccdea8dea52a18f11f', '4.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('365', '2017-03-23 13:50:27', null, null, '.jpg', 'da544d3dc597216c74c97e394f91fea9', '5.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('366', '2017-03-23 13:50:56', null, null, '.jpg', '743d9cccfe561172aedb6d66a222886f', 'b-hbzz.jpg', '', '1', 'UnUse');
INSERT INTO `sys_file` VALUES ('367', '2017-03-23 13:51:03', null, null, '.jpg', '3aa21e913b4c3f7711086c789583eee0', '002.jpg', '', '1', 'UnUse');
INSERT INTO `sys_file` VALUES ('368', '2017-03-23 13:51:08', null, null, '.jpg', 'd6596946d1b827699faf4a16e188e826', 'b-jkzz.jpg', '', '1', 'UnUse');
INSERT INTO `sys_file` VALUES ('369', '2017-03-23 13:51:12', null, null, '.jpg', '33ea06bcf77124acb707cb1e9c73a0bb', 'b-zlzz.jpg', '', '1', 'UnUse');
INSERT INTO `sys_file` VALUES ('370', '2017-03-23 13:51:41', null, null, '.jpg', '00a782aefd17367fb7d7cc76cf0c5bc1', '2.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('371', '2017-03-23 13:51:45', null, null, '.jpg', '62412935c40d73c3dffd9749b85b5b28', '1.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('372', '2017-03-23 13:51:51', null, null, '.jpg', '073c4ce40a0b2160f64e8717a6fd1e84', '3.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('373', '2017-03-23 13:52:06', null, null, '.jpg', 'd352c63c3ab14bc995fe3ba1e5911b84', '1.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('374', '2017-03-23 13:52:09', null, null, '.jpg', '66b39ce269805540cba56c61090c7139', '2.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('375', '2017-03-23 13:52:13', null, null, '.jpg', '18d48f0805d5597b55bee443b8516340', '3.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('376', '2017-03-23 13:52:16', null, null, '.jpg', '869bb4400a8168ec2b681d28ad4a0542', '4.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('377', '2017-03-23 13:52:30', null, null, '.jpg', 'e03bc7a268306705183fd9d6f1f69385', '5.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('378', '2017-03-23 13:52:43', null, null, '.jpg', 'dd9adf760b75a7638d3af77a7964d012', '6.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('379', '2017-03-23 13:52:46', null, null, '.jpg', '1c8ba627825b068b52a5957c5f8f2a33', '7.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('380', '2017-04-26 17:54:10', null, null, '.jpg', '14db24386d43df077538a2eb73ca22ed', '240404-1303200R54095.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('381', '2017-04-26 17:55:00', null, null, '.jpg', 'c75a37614181272bc34ec8fcae82d45f', '9511.jpg_wh1200_看图王.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('382', '2017-04-26 17:56:09', null, null, '.jpeg', '325ecb62bcd8f589d2c240a4d498754c', '20150604150948_r5UEs_看图王.jpeg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('384', '2017-04-27 09:51:55', null, null, '.jpg', '8381b5c0d439524515b80298e8a1d03b', '240404-1303200R54095.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('385', '2017-04-27 10:15:59', null, null, '.jpg', 'ffe28d4dc2233c77660faef7d6919fb8', '9511.jpg_wh1200_看图王.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('386', '2017-04-27 10:16:31', null, null, '.jpeg', '69207d9b8a9638f1caeae151f2bab6d1', '20150604150948_r5UEs_看图王.jpeg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('387', '2017-04-27 10:24:37', null, null, '.jpg', '212ceb09ec04ca3479a4fb949ca03749.jpg', '摄图网-挂在那的一堆衣服_会员风采.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('392', '2017-04-27 11:07:27', null, null, '.jpg', '87c0043878e262a4ce499868561c74b0', 'BC216F4F-A4C1-0CA7-0716-132727DD75FD.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('393', '2017-04-27 11:07:57', null, null, '.jpg', '5b652a211ef8fdb8451b856bc1f3b51e', '6198265.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('394', '2017-04-27 11:08:21', null, null, '.jpg', 'c376db6b605fd2c14ebb73d35d4862ba', '1194967524545.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('395', '2017-04-27 11:08:48', null, null, '.jpg', '24e7e0f18d046babfff0cf3dca471eac', '71.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('396', '2017-04-27 11:10:46', null, null, '.jpg', '6985f3f6d919724e750c7a1b2e8c42d2.jpg', 'XYWB2014112739_1_编辑.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('397', '2017-04-27 17:46:31', null, null, '.jpg', '474e356d1db368a7540efa8f8fd89a4a', 'u=2383312635,55479644&fm=214&gp=0.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('398', '2017-04-27 17:47:09', null, null, '.jpg', '6197151fe5a9fc47836c5e706b6be9b6', '74ad2f4518f84994880b57f71dc66463.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('399', '2017-04-27 17:47:44', null, null, '.jpg', '2d57fae0a6b877d13c0683686fd91dc8', '1463134361128.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('400', '2017-04-27 17:48:06', null, null, '.jpg', '2a9fcc848ce67b7857c54b437ca4f0fe', '467232_8.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('401', '2017-04-27 17:48:50', null, null, '.jpg', '8549732d57c6dff2b672922089ea8b95', 'tbs20134151599835.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('402', '2017-04-27 17:56:50', null, null, '.jpg', '3226ed5a14eecfb0a2fee4575ddaef33.jpg', '3319.jpg_wh1200_看图王_副本.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('404', '2017-05-03 15:20:03', null, null, '.jpg', 'fec86b2f62959685ae11ef8d1dace61b', '微信图片_20170503151126_副本.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('405', '2017-05-03 15:20:54', null, null, '.jpg', '830a27f32d941406a400548370182f2f', '微信图片_20170503152039.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('406', '2017-05-03 15:21:49', null, null, '.jpg', 'f91e96867c4b5a1618196b0bbb4da431', '微信图片_20170503152123.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('407', '2017-05-03 15:22:36', null, null, '.jpg', '733b056af84873debe85a7e42ba3023f', '微信图片_20170503152221.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('408', '2017-05-03 15:23:19', null, null, '.jpg', '5f3cf966faa593237db54b8b1365b135', '微信图片_20170503152302.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('409', '2017-05-03 15:32:14', null, null, '.jpg', 'd98ded4a95eef9ef2ace0ef1c29cbdde.jpg', '4770.jpg_wh1200.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('410', '2017-05-03 16:12:07', null, null, '.jpg', 'f6541e460cec869716aa52d66e3e13b8', '微信图片_20170503161150.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('411', '2017-05-03 16:13:06', null, null, '.jpg', '854040066af4fdd61fde3e175b2c0b2c', '微信图片_20170503161244.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('413', '2017-05-03 16:14:28', null, null, '.jpg', 'dd5821730499056f5d6364513e37c362', '微信图片_20170503161332.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('414', '2017-05-03 16:15:22', null, null, '.jpg', '7c73ee817977365baedf3e0fa8a2002d', '微信图片_20170503161508.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('415', '2017-05-03 16:52:12', null, null, '.jpg', '4363b2d923d3e6657702fb258d5d8c5d', '微信图片_20170503165057.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('416', '2017-05-03 16:53:12', null, null, '.jpg', 'ccb401946da3de6c560a4ec61b6afbc9', '微信图片_20170503165257.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('417', '2017-05-03 16:53:51', null, null, '.jpg', '2131b3096fe660b8b52e7f390b11d572', '微信图片_20170503165335.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('418', '2017-05-03 16:54:34', null, null, '.jpg', '9b4f6b7325ba5c470a4d797fb8369aed', '微信图片_20170503165420.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('423', '2017-05-25 11:07:36', null, null, '.jpg', '64db5d7478125ffbc5b7beb3f7730b7c', '8417.jpg_wh1200_看图王.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('425', '2017-05-25 11:09:05', null, null, '.jpg', '3ed6dcc480a4562627ecb811061651c0', '2.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('426', '2017-05-25 11:09:48', null, null, '.jpg', '49f2d5163d38c8dae439502451646a36', 'bf41459c-487e-4632-8772-3e50ad0fd7d8.jpg_wh1200_看图王.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('427', '2017-05-25 11:10:12', null, null, '.jpg', 'b31ec0b4e74644042bb98cb1c122f0f1', '1.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('428', '2017-05-25 11:10:20', null, null, '.jpg', 'f5199fb1812595ba2d8ed1a89b91ffa1', '6040.jpg_wh1200_看图王.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('430', '2017-05-25 11:10:56', null, null, '.jpg', '95f4c47cefbe58aafadd61e6c4b130fc', '7191.jpg_wh1200_看图王.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('433', '2017-05-25 11:47:50', null, null, '.jpg', 'e8848897197382516dcea06945d2b9b0', '5541.jpg_wh1200_看图王.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('434', '2017-05-25 11:48:38', null, null, '.jpg', 'fdef605279c8d780c1ba513f7c60ff1f', '5540.jpg_wh1200_看图王.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('435', '2017-05-25 11:49:10', null, null, '.jpg', 'aa32460dd9b0ce4fb50fdd112fcc2a5f', '0696.jpg_wh1200_看图王.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('436', '2017-05-25 11:49:47', null, null, '.jpg', 'ef46f408fc027dd30534a1a6bda6bfcf', '5005.jpg_wh1200_看图王.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('438', '2017-05-25 11:57:07', null, null, '.jpg', '7338968d924deef7015efa9394a2cd1f', '7185.jpg_wh1200_看图王.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('440', '2017-05-25 12:03:37', null, null, '.jpg', '71fe5a4f1101206bca3d3e577d7dd2ba', '3851.jpg_wh1200_看图王.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('443', '2017-05-25 13:56:41', null, null, '.jpg', '31dfc6ae65c3d47ee32d75e416c47f45', '3947.jpg_wh1200_看图王.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('444', '2017-05-25 13:57:18', null, null, '.jpg', '7d8ee67d7071abb7c00a57bc6aae0e16', '0334.jpg_wh1200_看图王.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('445', '2017-05-25 13:57:48', null, null, '.jpg', 'efb90070e82cb4bd0bace629c3a30295', '2014012111595259.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('446', '2017-05-25 13:58:10', null, null, '.jpg', '75ab78b1fbb5e8c853ea1c5513055f3a', '4937.jpg_wh1200_看图王.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('450', '2017-05-25 14:06:38', null, null, '.jpg', 'b6710ee8d61123c83c01c38ddb204653', '0334.jpg_wh1200_看图王.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('452', '2017-05-25 14:07:39', null, null, '.jpg', 'b3f5972eb59adb9a4187f0471f2570e1', '2014012111595259.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('453', '2017-05-25 14:08:08', null, null, '.jpg', '53ec539ec190c497a4b6fd477d599e7a', '4937.jpg_wh1200_看图王.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('455', '2017-05-25 14:13:34', null, null, '.jpg', 'f66e990a1e2da60d07059d38dd8972af', 'xpic4562.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('456', '2017-05-25 14:13:57', null, null, '.jpg', 'a1fb16bd63c6f059734fb0214c46aeda', '16c800007d1e5d7ea611.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('457', '2017-05-25 14:14:19', null, null, '.jpg', '066de791f4068c16722aaa222a368a83', '16c20004fbdb4770451d.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('458', '2017-05-25 14:14:43', null, null, '.jpg', '247a165f81c4220f9fd3b301e19220bb', '16c800008266c051f94a.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('459', '2017-05-25 14:17:57', null, null, '.jpg', 'f9d03599d5777b7f1005573fad7a22c3.jpg', '00.jpg', '', '1', 'UnUse');
INSERT INTO `sys_file` VALUES ('460', '2017-05-25 14:18:56', null, null, '.jpg', '6008fa5e2cb8ae262e54eb8e072cee54.jpg', '3382.jpg_wh1200_看图王_封面.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('461', '2017-05-25 14:19:59', null, null, '.jpg', 'c6ba317a0e5b2743e04c3413a16561df', '7ff93f2d2c85ef591326e11c013aab05.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('462', '2017-05-25 14:20:48', null, null, '.jpg', '7cda6e9f4004f8de10517436e7dbfc93', 'fce47f60ddde3ccc8d51d49f8c0c2180.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('463', '2017-05-25 14:21:21', null, null, '.jpg', '99cfbf57c66f0ae5304a71e843c88987', 'bafacc5147f303cf49616ee79c6517c8.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('465', '2017-05-25 14:24:03', null, null, '.jpg', '6edade1de4054d2ba5bfa0cdae7dbd7f', '1.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('466', '2017-05-25 14:24:16', null, null, '.jpg', '3880c87545242c3e5d44cfa6b0d9b3d4.jpg', '30142719687_封面.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('467', '2017-05-25 14:25:19', null, null, '.png', '7e47e12beb2872acaa0785a625470fe7', 'QQ截图20170317150845.png', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('469', '2017-05-25 14:25:41', null, null, '.jpg', '8906d845d5cf05e9b6b328500024bef4', 'u=586337813,3985104546&fm=214&gp=0.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('470', '2017-05-25 14:25:56', null, null, '.jpg', '9dcf61fd0027545694fe167feb8f2716', '1.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('471', '2017-05-25 14:26:15', null, null, '.jpg', '52099e8dfce626786ec2d16de59e002a', '32b1OOOPIC52.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('473', '2017-05-25 14:29:06', null, null, '.jpg', '928db6d9b5b7c73037ef1405189dcbe4', 'res15_attpic_brief.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('474', '2017-05-25 14:29:27', null, null, '.jpg', 'b95b93e76ae797f8522672115108acc1', '1-16102G625413K.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('475', '2017-05-25 14:29:51', null, null, '.png', 'cc7f7da1c19e2c95efadb21a4b7b9a63', 'QQ截图20170313190420.png', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('480', '2017-05-25 14:46:33', null, null, '.jpg', '36b12be227041e5fcf2f2f6d9176fa9e.jpg', '6740.jpg_wh1200_看图王_会员风采封面.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('481', '2017-05-25 14:48:43', null, null, '.jpg', 'a75cf9a5482d2e51fb8eb4f76d69799e.jpg', '1699.jpg_wh1200_看图王_封面.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('482', '2017-06-07 17:49:46', null, null, '.png', 'c096e958da4121d8ab99261a6bb8ec90.png', '睡王-01.png', '', '1', 'UnUse');
INSERT INTO `sys_file` VALUES ('500', '2017-06-08 13:10:34', null, null, '.png', '1d1a569b792970a0f755f728f8307baa.png', 'K012 (韩国绒）.png', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('501', '2017-06-08 13:10:44', null, null, '.png', '6f7a0c80500829d6451b7bba5f1c72e6.png', 'B630.png', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('507', '2017-06-08 13:11:25', null, null, '.png', 'd207ab5b5fa880c6396b6511c0af488f.png', '中国质量万里行促进会牌匾.png', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('508', '2017-06-08 13:11:29', null, null, '.png', '446243542ec92b7c7225fd0bb37c589e.png', '中国质量万里行促进会证书.png', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('509', '2017-06-08 13:11:33', null, null, '.png', 'a66ec38ba0e9ef2788fb6d9fe951a8c8.png', '对话星品牌受邀嘉宾.png', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('510', '2017-06-08 13:11:37', null, null, '.png', 'b49281faf46f35cd1c2c721d559fbcdd.png', '中国3.15诚信品牌.png', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('511', '2017-06-08 13:11:41', null, null, '.png', 'bb0cd45996a8ad5834bb2e4f939191ee.png', '中国床垫行业领军品牌.png', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('512', '2017-06-08 13:11:52', null, null, '.png', 'b8dba6af2b59f30e83dd7e0c7dc4d8a8.png', '中国床垫行业十大品牌合照.png', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('513', '2017-06-08 13:11:56', null, null, '.png', 'c9d9804d646f1a00c39ab5619ac5f310.png', '中国床垫行业首选产品.png', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('514', '2017-06-08 13:12:01', null, null, '.png', '8cf024e880d7d9c9b3871233831c17fa.png', '中国床垫行业特色加盟品牌.png', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('515', '2017-06-08 13:12:04', null, null, '.png', 'ab53f9bb8480d2aaf65de977bc5fb451.png', '中国著名品牌.png', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('516', '2017-06-08 13:12:08', null, null, '.png', '575295f0699f8dc663d18eebb809b6c8.png', '中国自主创新企业.png', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('517', '2017-06-08 13:12:11', null, null, '.png', '78fbe1b28de48ab69dd5ddb987ab67a6.png', '中国自主创新最具影响力品牌.png', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('518', '2017-06-15 10:05:57', null, null, '.jpg', '193849b82330fc4bf0ac05427fa1a100', '117221.gif@660x440.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('522', '2017-06-26 16:20:26', null, null, '.jpg', 'beabf40bd7537ec45335990a63641aba', '巨腾.jpg', '', '1', 'UnUse');
INSERT INTO `sys_file` VALUES ('524', '2017-06-29 14:09:25', null, null, '.jpg', '82acb30a3dccfc3019b8d961f40b962e', 'QQ图片20170629112929.jpg', '', '1', 'UnUse');
INSERT INTO `sys_file` VALUES ('525', '2017-06-29 14:10:42', null, null, '.jpg', '12ffd362c209dbd54c047c8387fdfdc3', 'QQ图片20170629112929.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('526', '2017-06-29 14:11:43', null, null, '.jpg', 'b4539a3b1afaedb902bd9d9cc9b6840a', 'QQ图片20170629112929.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('527', '2017-06-29 14:12:38', null, null, '.jpg', 'd5673024f7f98006386b51fadebf0517', 'QQ图片20170629112929.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('528', '2017-06-29 15:59:09', null, null, '.jpg', 'c150180701b2dc148b51dc003a3f1889', 'QQ图片20170629155757.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('549', '2017-07-10 13:47:30', null, null, '.png', 'e2f1188ddcf06c5c794adfd26210fbd9', '巨腾.png', '', '1', 'UnUse');
INSERT INTO `sys_file` VALUES ('550', '2017-07-10 13:55:27', null, null, '.png', '2917f5af60661eb905f49bc7c0f14bc5', '21世纪美术logo.png', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('551', '2017-07-10 14:03:37', null, null, '.jpg', 'f4459e3b2658ee5a3fd418b0281378e1', '河北纳森.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('552', '2017-07-10 14:08:35', null, null, '.jpg', 'ad1bd0165ff6486cd65ab37733559a07', '重庆予邦 .jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('553', '2017-07-10 14:16:16', null, null, '.jpg', 'db4955477d92548eaace43abef12e69a', '高普乐商标.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('554', '2017-07-10 14:22:07', null, null, '.jpg', 'f46ff621d5cd62207c23510dd7cdec96', '鲁菜根LOGO竖版.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('555', '2017-07-10 14:23:37', null, null, '.jpg', '6bea266ae0063d7fca318aeaeeb32c62', '绿新居牌高档玻璃布加强筋刻度尺专利石膏板.jpg', '', '1', 'UnUse');
INSERT INTO `sys_file` VALUES ('556', '2017-07-10 14:23:50', null, null, '.jpg', '7ed4bc9af88df716a9388a96d58aae4e', '绿新居牌活性炭专利纸面石膏板.jpg', '', '1', 'UnUse');
INSERT INTO `sys_file` VALUES ('557', '2017-07-10 14:24:03', null, null, '.jpg', '29d40a10bb80c909ce982fe17ae40491', '绿新居牌双防刻度尺高档专利石膏板.jpg', '', '1', 'UnUse');
INSERT INTO `sys_file` VALUES ('558', '2017-07-10 14:41:38', null, null, '.png', '746e7fa4f6107762e2c4bdad4689f74e', '罗康.png', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('559', '2017-07-10 14:42:57', null, null, '.jpg', 'ebcbb1fede810c077050efb35a1eb55e', '赛行阿胶.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('561', '2017-07-10 14:44:22', null, null, '.png', 'ae46e3c7dd9603f68de041003ca22f71', '舒慰商标---定稿-2016.4.18.png', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('562', '2017-07-10 14:45:51', null, null, '.jpg', '9a00e53bb620afee8f0621ef6049c44b', '双虎.jpg', '', '1', 'UnUse');
INSERT INTO `sys_file` VALUES ('563', '2017-07-10 14:48:45', null, null, '.jpg', '1f64a677d4be49f933439bfb8f27a39a', '新佳利标志源文件logo-x3.jpg', '', '1', 'UnUse');
INSERT INTO `sys_file` VALUES ('564', '2017-07-10 14:52:06', null, null, '.jpg', '30cf32de185690de6ec9900cf03bd188', '雅素丽水印LOGOxin.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('565', '2017-07-10 14:55:33', null, null, '.png', 'd19907b29d7cb53b8f26bf6b557d9fcd', '予馨海韵.png', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('566', '2017-07-10 14:56:29', null, null, '.png', '6e03ba9ff6d5bec8cde0c4ac8721f51c', '重庆小时候.png', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('567', '2017-07-10 14:57:50', null, null, '.jpg', '8dac6d9b4072e16223687bce0a65cc12', '船城风.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('568', '2017-07-10 14:58:46', null, null, '.jpg', '6b03d3642404e23602817fc6d592aab8', '梓熙.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('569', '2017-07-17 14:00:48', null, null, '.png', '8978f36d7f082990aed7b634bfd67785', 'F003舒爽空间.png', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('570', '2017-07-17 14:00:58', null, null, '.png', '25a355e7e4bf4531b39829797647b596', 'K012电动床垫.png', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('571', '2017-07-17 14:01:06', null, null, '.png', 'a0f92928b2f0b402f5e905f983f7ad9b', 'K035玲珑竹音.png', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('572', '2017-07-17 14:01:14', null, null, '.png', '0dbb9044d8970851a223311f949c4178', 'M017艾心之家.png', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('573', '2017-07-17 14:01:22', null, null, '.png', '4dce4d69ef0358d5c20ff6b7dfdbf083', 'M019土耳其宣言.png', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('575', '2017-07-19 15:57:41', null, null, '.jpg', 'ffdd95ab4dc0f1642915efbb78e3c645', '807389-1397558628707.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('577', '2017-07-19 15:59:19', null, null, '.jpg', 'f9830fc80cb666e4ee304ae430547dd3', '30-110F613064029.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('579', '2017-07-19 16:00:23', null, null, '.jpg', 'e5e44d6a14c258bfcbc85fc04a783a7c', '33.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('580', '2017-07-19 16:01:15', null, null, '.jpg', 'ed9f3764107709bad865475404027a3a', '010_副本.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('587', '2017-07-19 16:09:55', null, null, '.jpg', 'e1893223d0f7c4b11fdadd5a5ed283a7', '100285861.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('588', '2017-07-19 16:10:22', null, null, '.jpg', 'fe5c5619e773c24488dabbac8facc034', 'timg_副本.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('589', '2017-07-19 16:10:37', null, null, '.jpg', 'f1c55baee49883f73dfe16a28dd3dc0c', '56559d8992dba.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('590', '2017-07-19 16:11:41', null, null, '.jpg', 'b0c1c7aef48f9f1eb9dd30023557bd01', '51e7412c143e0.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('591', '2017-07-19 16:15:37', null, null, '.png', '4dcc5914076e0aa0cddf5ca698347477', '58804fea29417.png', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('592', '2017-07-19 17:57:58', null, null, '.jpg', '8caa5243caec427d7b1f8720802d06dc', '56e92712N47e3eadf.jpg!q70.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('598', '2017-07-20 17:17:31', null, null, '.jpg', '33192ef83b0834863d76018cb7673813', '堃霖封面.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('599', '2017-07-20 17:18:08', null, null, '.jpg', 'ddd69ef2de3a718e9fc6a4bf497e0e61', '新佳利_封面.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('600', '2017-07-20 17:21:07', null, null, '.jpg', '3daa8d7ad12edffa4b1ed8b4bd5621cb', '567185_副本.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('601', '2017-07-20 17:21:50', null, null, '.jpg', 'ae48bd9910901055439de537fdf9ffdf', '广西易启东方封面.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('602', '2017-07-20 17:22:41', null, null, '.jpg', 'ef5d84623e47d7bc44e81c874049b6fd', '梓熙封面.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('605', '2017-07-26 15:19:41', null, null, '.jpg', '26d5d0c5322025f6dfd2e215fbac30ba', 'u=3813391600,3400328373&fm=23&gp=0.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('607', '2017-07-26 15:20:41', null, null, '.jpg', '2137da8d2fe7c221c585ec42685d1659', '微信图片_20170607133041.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('612', '2017-07-26 15:30:05', null, null, '.jpg', '4795bcaf0805909d7f4706506dcc76ee', '匠仙封面.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('613', '2017-07-26 15:42:09', null, null, '.jpg', 'cfa640421677a5856ac15db3c559bf84', '500502612_副本.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('614', '2017-07-26 15:51:41', null, null, '.jpg', '7b75092f27b9c4fd44246f09d746bccf', '100465329.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('615', '2017-07-26 15:56:49', null, null, '.jpg', '4eececefd1782fe69deffc8cedd8aafc', '13232132.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('616', '2017-07-26 15:57:29', null, null, '.jpg', 'ef35eb79279f41b2a60431c0b397192a', '2008_5_30_10_39_35_3128.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('617', '2017-07-26 15:58:00', null, null, '.jpg', 'fa4e1c3ac67f96fcaafaa5afdd38507c', '14.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('618', '2017-07-26 15:59:53', null, null, '.jpg', '9db7f95df67642244c6fbef767c1a9dc', '500464117_副本.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('619', '2017-07-26 16:07:00', null, null, '.png', '347d5cbbc9d2ba0165c43b2e75c19545', '阳台垮掉1.png', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('620', '2017-07-26 16:38:24', null, null, '.jpg', '0be59b797638f856b483bc711e79a93d', '电梯爆炸1.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('621', '2017-08-03 10:20:54', null, null, '.jpg', 'be90f6a4b8224b1ee8d5f4e0da7119ec', 'u=1435145676,62822023&fm=214&gp=0.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('622', '2017-08-03 10:26:43', null, null, '.jpg', '0c38ac54950a6478b5dc1df5d73a4d5d', '11341571_11341571_1335128472281.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('624', '2017-08-03 11:13:11', null, null, '.jpg', '1515e6e8e539b0033965d3b8676293b8', '5684e12269c62.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('625', '2017-08-03 11:16:03', null, null, '.jpg', '4852d582c2fcd7081ebb35b14a984d7b', 'd86c9f539535435c8660bbcbf040953a_D_640_360.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('626', '2017-08-03 11:18:19', null, null, '.jpg', '07834418f9df42070e7f139ab1234e1d', '2149972_474529.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('627', '2017-08-03 11:21:17', null, null, '.jpg', '1917583df2d9f09d490877275ad40a6e', 'u=1469893537,1782403207&fm=214&gp=0_副本.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('628', '2017-08-07 17:29:30', null, null, '.jpg', '291912edc7edfd479b8bc1331c875807', '170504143212496014960941.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('629', '2017-08-07 17:34:10', null, null, '.jpg', '9b26651d58a18f708b19ede662a0ad1a', '170504110806343713437506_副本.jpg', '', '1', 'UnUse');
INSERT INTO `sys_file` VALUES ('630', '2017-08-08 13:36:51', null, null, '.jpg', 'a736824849e67f207612d8694544ee73', '微信图片_20170412095525.jpg', '', '1', 'UnUse');
INSERT INTO `sys_file` VALUES ('631', '2017-08-08 13:43:34', null, null, '.png', '88a0f2588f9a1bea649f0b20c75e5ca9', '盼石（上海）新材料科技股份有限公司.png', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('632', '2017-08-08 13:51:37', null, null, '.png', '1491cecebedb52b93388105b927aa2f9', '1122logo 确定稿.png', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('633', '2017-08-08 14:04:04', null, null, '.jpg', '1943cc852c7c059f7174c6321ad186bb', 'logo.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('634', '2017-08-08 14:06:42', null, null, '.png', '9038673e550ae45647680f6a9d19e4de', 'QQ图片20170614105556.png', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('635', '2017-08-08 14:07:52', null, null, '.png', 'cdb8188ee0274633dfd5180a3d958536', '德雕标志.png', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('636', '2017-08-08 14:09:52', null, null, '.png', 'd6f455dd1ab3b5b018349f63d80af64d', '001.png', '', '1', 'UnUse');
INSERT INTO `sys_file` VALUES ('637', '2017-08-08 14:11:25', null, null, '.png', 'eb6978fc648c3643e68d7d4f22e669be', '鹊神标志.png', '', '1', 'UnUse');
INSERT INTO `sys_file` VALUES ('638', '2017-08-08 14:28:20', null, null, '.jpg', '652187089e121413c75aafc9d9be1b96', '微信图片_20170412095525.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('639', '2017-08-08 15:10:09', null, null, '.jpg', '4aa3abae959e4f95dc19600423b2d56e', 'b.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('640', '2017-08-08 15:10:30', null, null, '.png', '538c581dca6ca6c3ee5165aba4885e50', '0.png', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('641', '2017-08-08 15:10:44', null, null, '.png', '8ae5edde0838fe053916b715050dae41', 'topvee45px.png', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('642', '2017-08-08 15:10:57', null, null, '.png', '8ea60c172236addaff3147dac773b963', 'test-logo.png', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('643', '2017-08-08 15:11:07', null, null, '.png', '7d981a3e75fbeef1c1e63ad57e09f42d', 'baidu.png', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('644', '2017-10-23 11:51:38', null, null, '.jpg', '757525ca0233d81d78eb278964a74295', 'viewPic3.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('645', '2017-10-23 11:51:54', null, null, '.jpg', '77cd25d72bc5f2a711870a6e39e7f8e3', 'viewPic5.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('646', '2017-10-23 11:52:08', null, null, '.jpg', 'd90da8c4d4546293832e554498cef92f', 'viewPic2.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('647', '2017-10-24 10:22:20', null, null, '.jpg', '3610a567d2ce099bfbda0c429c772dc0', 'viewPic6.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('648', '2017-10-24 10:23:26', null, null, '.jpg', '6a4c630945301a9b8d6bdbb8cde12d2c', 'viewPic6.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('649', '2017-10-24 15:01:45', null, null, '.jpg', '56b87659d8541e5e26e12ebd1d272f5d', 'viewPic2.jpg', '', '1', 'UnUse');
INSERT INTO `sys_file` VALUES ('650', '2017-10-24 15:01:54', null, null, '.jpg', '230cc92baf9512d383c8779b7087b8c4', 'viewPic3.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('651', '2017-10-24 15:02:01', null, null, '.jpg', '33e1dba40811ffabf56d7bbe0c24a090', 'viewPic4.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('652', '2017-10-24 15:02:10', null, null, '.jpg', '51f39af1f9a70cd25e790167c01cde66', 'viewPic5.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('653', '2017-10-24 15:03:45', null, null, '.jpg', '5cc9e9a8fdc697b2d9b10626c0e0190d', 'viewPic3.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('654', '2017-10-24 18:33:10', null, null, '.jpg', '4e18cff7aac7a4eb3db9d5c3279cddb8', 'viewPic2222.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('655', '2017-10-24 18:50:46', null, null, '.jpg', '9fe9a563218463a1806e78d1928c7bfb', 'viewPic6.jpg', '', '1', 'UnUse');
INSERT INTO `sys_file` VALUES ('656', '2017-10-24 18:50:59', null, null, '.jpg', '6420b905a158860e7d81ed32ecb0423c', 'wwww.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('657', '2017-10-24 18:51:15', null, null, '.jpg', '702297dc5b08823c2ff3d897fe603e0b', 'ssssss.jpg', '', '1', 'UnUse');
INSERT INTO `sys_file` VALUES ('658', '2017-10-24 18:51:26', null, null, '.jpg', '2223a094fb2e2cd0b1e7be4e8bdb522f', '的放大法.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('659', '2017-10-24 18:51:34', null, null, '.jpg', 'bb52e6f136b0713eebdbf88cdd667edf', '点点滴滴.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('660', '2017-10-24 18:51:50', null, null, '.jpg', '2813d47ec9c44d9a4c74fb8dda06b93b', '事实上.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('661', '2017-10-25 20:08:42', null, null, '.jpg', '52dfb4169e1225e6d528dc5f51f006a2', 'www.jpg', '', '1', 'UnUse');
INSERT INTO `sys_file` VALUES ('662', '2017-10-26 10:26:28', null, null, '.jpg', 'ad13249bfba11af18910402879add917', 'www.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('663', '2017-10-26 10:26:41', null, null, '.jpg', '641a7bf2041893fb5205311c19bfa274', 'wwww.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('664', '2017-10-26 10:26:51', null, null, '.jpg', 'a42f05c2b5ab95aaf5533dcdb790dced', '点点滴滴.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('665', '2017-10-26 10:26:54', null, null, '.jpg', '55abb52d91ee18f07697b6c6e5011bc5', '的放大法.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('666', '2017-10-26 10:26:56', null, null, '.jpg', 'f387b87467e0685d66cd12a756e22dea', 'www.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('667', '2017-10-26 10:26:59', null, null, '.jpg', '4501950e59ed1d29c6bbbcf02e4d331a', 'viewPic6.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('668', '2017-10-26 10:27:07', null, null, '.jpg', '33380f574d2ee4a88f39262d97f4a3ba', '点点滴滴.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('669', '2017-10-26 10:27:10', null, null, '.jpg', '525e4c48bf98e73f9f03550deee6eb18', 'viewPic2222.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('670', '2017-10-26 10:27:13', null, null, '.jpg', 'a55e4e69fc1aade2addd306d19bb0b13', 'viewPic3.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('671', '2017-10-26 10:27:16', null, null, '.jpg', 'aea3cfdbeacedd5600e5dea36482ad79', 'viewPic1.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('672', '2017-10-26 10:27:18', null, null, '.jpg', '36453bc49be7c1d2aa3a325ee6929c29', 'viewPic5.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('673', '2017-10-26 10:27:54', null, null, '.png', 'fca18ec9b63feba2986a1492cb213e9e', 'qrcode.png', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('674', '2017-10-26 10:28:16', null, null, '.jpg', '21c7db7927b84dc563ada695e41727c6', 'viewPic4.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('675', '2017-10-26 10:37:55', null, null, '.jpg', '9215baf98205bad3f6871259fc22662d', 'viewPic1.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('676', '2017-10-26 15:13:33', null, null, '.jpg', 'ee5b9b365e829c6a1ae61e784d0d6524', 'www.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('677', '2017-10-26 15:14:04', null, null, '.jpg', '78c42a1792f65c0bce52682259bc14d6', 'viewPic5.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('678', '2017-10-26 15:14:27', null, null, '.jpg', '546a5fb1c7b70fa67bf4ddbf2f7f4f1e', 'viewPic4.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('679', '2017-10-26 15:14:41', null, null, '.jpg', '34b5008d9d7e4cb68349213e0491216f', 'viewPic3.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('680', '2017-10-26 15:32:33', null, null, '.jpg', 'c47f0e356379dd6f2676f0d29f3c1839', 'wwww.jpg', '', '1', 'UnUse');
INSERT INTO `sys_file` VALUES ('681', '2017-10-27 16:05:05', null, null, '.jpg', 'e7be907049ca652f1a2035fb0c711225', 'viewPic5.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('682', '2017-11-20 13:44:33', null, null, '.png', '139664f488b5dedc2857d9da602e316d', 't1.png', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('683', '2017-11-20 13:44:39', null, null, '.png', '9e81c1b835c54493686132986242f4d4', 't2.png', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('684', '2017-11-20 13:44:43', null, null, '.png', '1b5b9a83c5eb9cd60515f101b3d51dc8', 't3.png', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('685', '2017-11-20 13:45:57', null, null, '.png', '423845a294fc9d27605f8c6e36ad7c12', 't2.png', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('686', '2017-11-20 13:46:47', null, null, '.png', '33090baa02c44409489d873875fd8c03', 't3.png', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('687', '2017-11-20 14:09:11', null, null, '.png', 'f84ac6ab7f1ce6f62147f2b073e1e36a', 't3.png', '', '1', 'UnUse');
INSERT INTO `sys_file` VALUES ('688', '2017-11-20 14:09:18', null, null, '.jpg', '42f4979888b72183175cda4385327784', '微信图片_20170728103217.jpg', '', '1', 'UnUse');
INSERT INTO `sys_file` VALUES ('689', '2017-11-20 14:12:25', null, null, '.png', '22e8a80812a9288b5b615a6a06a31ae6', 't3.png', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('690', '2017-11-20 14:12:31', null, null, '.jpg', '9e909c34f800fbb7c5f78648f71ca80d', '微信图片_20170728103217.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('691', '2017-11-24 11:06:36', null, null, '.png', 'a0211b41a5e7508e7e57a757939d0f04', 't4.png', '', '1', 'UnUse');
INSERT INTO `sys_file` VALUES ('692', '2017-11-24 11:10:29', null, null, '.png', '4fcde02e8bd0a3210b2fb68843f437d4', 't5.png', '', '1', 'UnUse');
INSERT INTO `sys_file` VALUES ('693', '2017-11-24 11:13:34', null, null, '.png', 'd4dbaaa2b366866399a3e4966c72a7f2', 't6.png', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('694', '2017-11-24 11:15:11', null, null, '.png', '878e0e6662fd537fe4a81f630f9a1f0f', 't2.png', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('695', '2017-11-24 11:16:25', null, null, '.jpg', '8361a03fefd5072c363b00d8950e412c', '微信图片_20170629164701.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('696', '2017-11-24 11:16:36', null, null, '.jpg', 'ff59db0b5e477ed20243dce955780861', '微信图片_20170728103217.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('697', '2017-11-24 11:17:00', null, null, '.png', 'cfd077c5afcac0f19e39e022a2ee5740', 'u.png', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('698', '2017-11-24 15:01:24', null, null, '.png', '3e9ecfbd18b157f6f5da44768098d38d', 'QQ截图20171124145948.png', '', '1', 'UnUse');
INSERT INTO `sys_file` VALUES ('699', '2017-11-24 15:03:25', null, null, '.png', 'c7b4a3821de1f9111acc429afc138ea4', 'qrcode.png', '', '1', 'UnUse');
INSERT INTO `sys_file` VALUES ('700', '2017-11-24 15:24:38', null, null, '.png', 'beef0365e8c47509dd85ebdf1f1b5e65', 'QQ截图20171124145948.png', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('701', '2017-11-30 18:19:22', null, null, '.png', '0e9f1ecf8ee465d63cec91d053cb6c9f', '未标题-1.png', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('702', '2017-11-30 18:19:36', null, null, '.jpg', 'c2baa3950414693d681686f15e1b3cb0', '微信图片_20170728103217.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('703', '2017-11-30 18:19:45', null, null, '.png', 'd769e918fb249ac919b1188447d51135', 't2.png', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('704', '2017-11-30 18:19:48', null, null, '.png', '51c7a405db8c9d01cdf71546fc5f10bb', 't3.png', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('705', '2017-11-30 18:19:51', null, null, '.png', '7e59149c2a660cada22cfaaf772597e1', 't4.png', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('706', '2017-11-30 18:19:53', null, null, '.png', '4f5b2a9ff41f19f7fdbc23e7696028fd', 't5.png', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('707', '2017-11-30 18:19:56', null, null, '.png', 'ce129180229f33066a11b0ef1a5c4e30', 't6.png', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('708', '2017-11-30 18:20:04', null, null, '.png', '2ce580a83b59d58957fc77d74d193b23', 'HashMap.png', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('709', '2017-11-30 18:20:07', null, null, '.png', 'a53edbaa0bc74a1a29cd3ac2ace14b97', 'r-tree.png', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('710', '2017-11-30 18:20:09', null, null, '.png', '44271abd2ac23d55bfea32ba5244dc42', 't1.png', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('711', '2017-11-30 18:20:12', null, null, '.png', '06f01a4c859172f01350933a3d28cde6', 't6.png', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('712', '2017-11-30 18:20:15', null, null, '.png', '99cb5a0cf7cf4d10fbe65c7d6c4212b6', '无标题.png', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('713', '2017-11-30 18:20:18', null, null, '.png', 'cff66a2abb6b66e71eae5a998d7fe37c', '无标题2.png', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('714', '2017-11-30 18:20:27', null, null, '.png', 'dfd66f488a3ad22d91e5886767bd37b3', 'qrcode.png', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('715', '2017-11-30 18:21:49', null, null, '.jpg', '52038bd2c30eae80d9b0eb886a820342', 'viewPic6.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('716', '2017-11-30 18:21:52', null, null, '.jpg', '825aba9551eb7cd57441fd2cfebbef18', 'www.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('717', '2017-11-30 18:22:24', null, null, '.jpg', '4b56ac8de2bbfeb5c69dbe702886c5e5', 'viewPic5.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('718', '2017-11-30 18:22:26', null, null, '.jpg', 'de9b25ebf3b9544ffc405fd84f41fa13', 'viewPic2222.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('719', '2017-11-30 18:22:29', null, null, '.jpg', '3de67242c945660f8d24a1400ec53a98', 'wwww.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('720', '2017-12-12 11:41:25', null, null, '.mp4', '1475ef2e6ab8238ebe764116f49b9dc9', 'e2cc55b167a7eb2acdf0fdf9baa68ed4.mp4', '', '1', 'UnUse');
INSERT INTO `sys_file` VALUES ('721', '2017-12-12 11:45:35', null, null, '.png', 'fa973b4ee777e06540db68b2cbfe3d4f', 'u.png', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('722', '2018-01-24 14:01:13', null, null, '.png', 'c26ac837f1b399d88d8f682d5ad5d748', 't6.png', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('723', '2018-01-24 14:01:18', null, null, '.png', '4a912234bfe7c931e0c7153edc6048ab', 't4.png', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('724', '2018-01-24 14:01:22', null, null, '.png', 'e9b7793702d793152427efb67705dcde', 't6.png', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('725', '2018-01-24 14:01:30', null, null, '.png', '72c94125581dfda9b2d68ecc22f654dc', 'r-tree.png', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('726', '2018-04-21 00:22:22', null, null, '.png', 'cd8868b3eba859ddb6fdcb981647e986', 'u.png', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('727', '2018-04-21 00:22:29', null, null, '.jpg', '305a300959e66297d9319f8fadc2c28e', '微信图片_20170728103217.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('728', '2018-04-21 00:26:27', null, null, '.png', 'd1920cc240ad1dfe289952f65df756f2', 't3.png', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('729', '2018-04-29 18:59:29', null, null, '.jpg', 'f32a6d3294cce3d707c8eab7c97386ea', '微信图片_20170728103217.jpg', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('730', '2018-04-29 19:00:14', null, null, '.png', 'ff7fa83861f73985c17694ffd15566a8', 't3.png', '', '1', 'UnUse');
INSERT INTO `sys_file` VALUES ('731', '2018-04-29 19:13:46', null, null, '.png', 'b4a75e06e3050197f79a433d5cbb03d4', '无标题.png', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('732', '2018-04-29 19:13:52', null, null, '.png', 'f941471915094f4de2ca48b97c0deb8d', '无标题2.png', '', '1', 'UnUse');
INSERT INTO `sys_file` VALUES ('733', '2018-04-29 19:13:57', null, null, '.png', '4003834941ff44f081badd4d9e305a84', 't5.png', '', '1', 'UnUse');
INSERT INTO `sys_file` VALUES ('734', '2018-04-29 19:14:14', null, null, '.png', 'efbdeb88b382686a8d26b0bf9e5a3a55', '无标题.png', '', '1', 'UnUse');
INSERT INTO `sys_file` VALUES ('735', '2018-04-29 19:31:57', null, null, '.png', 'd083adb8369f1a72a6cfd2cbc965fdab', 't6.png', '', '1', 'UnUse');
INSERT INTO `sys_file` VALUES ('736', '2018-04-29 19:34:28', null, null, '.png', 'baf6fdad5275e4f0109d01786187061d', 't5.png', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('737', '2018-04-29 19:34:31', null, null, '.png', '1cefea698eb0862f20bc4db6e1d2b41b', 't6.png', '', '1', 'UnUse');
INSERT INTO `sys_file` VALUES ('738', '2018-04-29 19:43:57', null, null, '.png', '5c075185e5ce2918b9035cb92845cb77', 't5.png', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('739', '2018-04-29 19:44:00', null, null, '.png', 'd98200c43807b2ea992b126cdf8222b4', 't6.png', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('740', '2018-04-29 19:55:12', null, null, '.png', '84c864e647a3bf3faa390972df86e954', 'HashMap.png', '', '1', 'UnUse');
INSERT INTO `sys_file` VALUES ('741', '2018-04-29 19:55:15', null, null, '.png', '3d744d94cb206ceaf0021d6398e451f6', 't1.png', '', '1', 'UnUse');
INSERT INTO `sys_file` VALUES ('742', '2018-04-29 19:55:18', null, null, '.png', 'e987731d5a1cca31a74f8b39ae76612c', '无标题.png', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('743', '2018-04-29 19:55:21', null, null, '.png', '24a84125b045555e5a73a190acd4ee72', '无标题2.png', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('744', '2018-04-29 19:55:25', null, null, '.png', '3a11cdcc1a63f65d0bf42ecc3084e373', 't5.png', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('745', '2018-04-29 19:55:28', null, null, '.png', '7a34829426e77de59b00fe2109500dd9', 't6.png', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('746', '2018-04-29 20:18:38', null, null, '.png', '5983fb14350e99c7b7bb262e89c190b1', 't4.png', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('747', '2018-04-29 20:19:41', null, null, '.png', '46deeddc431f8ad0dae18fd2732e773d', 't3.png', '', '1', 'InUse');
INSERT INTO `sys_file` VALUES ('748', '2018-04-29 20:19:58', null, null, '.png', '058573da3018edc2ea1f48fd2e5873e9', 't2.png', '', '1', 'UnUse');

-- ----------------------------
-- Table structure for `sys_function_point`
-- ----------------------------
DROP TABLE IF EXISTS `sys_function_point`;
CREATE TABLE `sys_function_point` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `icon` varchar(255) DEFAULT NULL,
  `is_display` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `order_num` int(11) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `parent` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKED2F861BC67030DB` (`parent`) USING BTREE,
  CONSTRAINT `sys_function_point_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `sys_function_point` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=838 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_function_point
-- ----------------------------
INSERT INTO `sys_function_point` VALUES ('109', '', '0', '文件管理', '109', 'filee/list.do', '132');
INSERT INTO `sys_function_point` VALUES ('110', null, '0', '添加文件', '1', 'filee/add.do', '109');
INSERT INTO `sys_function_point` VALUES ('111', null, '0', '修改文件', '2', 'filee/update.do', '109');
INSERT INTO `sys_function_point` VALUES ('112', null, '0', '删除文件', '3', 'filee/delete.do', '109');
INSERT INTO `sys_function_point` VALUES ('113', '', '0', '文件夹管理', '113', 'commonFolder/list.do', '132');
INSERT INTO `sys_function_point` VALUES ('114', null, '0', '添加文件夹', '1', 'commonFolder/add.do', '113');
INSERT INTO `sys_function_point` VALUES ('115', '', '0', '修改文件夹', '2', 'commonFolder/update.do', '113');
INSERT INTO `sys_function_point` VALUES ('116', null, '0', '删除文件夹', '3', 'commonFolder/delete.do', '113');
INSERT INTO `sys_function_point` VALUES ('117', null, '1', '用户管理', '116', 'user/list.do', '132');
INSERT INTO `sys_function_point` VALUES ('118', null, '0', '添加用户', '1', 'user/add.do', '117');
INSERT INTO `sys_function_point` VALUES ('119', null, '0', '修改用户', '2', 'user/update.do', '117');
INSERT INTO `sys_function_point` VALUES ('120', null, '0', '删除用户', '3', 'user/delete.do', '117');
INSERT INTO `sys_function_point` VALUES ('121', null, '1', '角色管理', '119', 'role/list.do', '132');
INSERT INTO `sys_function_point` VALUES ('122', null, '0', '添加角色', '1', 'role/add.do', '121');
INSERT INTO `sys_function_point` VALUES ('123', null, '0', '修改角色', '2', 'role/update.do', '121');
INSERT INTO `sys_function_point` VALUES ('124', null, '0', '删除角色', '3', 'role/delete.do', '121');
INSERT INTO `sys_function_point` VALUES ('125', '', '1', '权限管理', '120', 'functionPoint/list.do', '132');
INSERT INTO `sys_function_point` VALUES ('132', 'fa-cog', '1', '系统管理', '100', 'admin/system', null);
INSERT INTO `sys_function_point` VALUES ('136', '', '1', '修改权限', '2', 'functionPoint/update.do', '125');
INSERT INTO `sys_function_point` VALUES ('137', '', '1', '删除权限', '3', 'functionPoint/delete.do', '125');
INSERT INTO `sys_function_point` VALUES ('138', null, '1', '设置角色', '4', 'user/setRole.do', '117');
INSERT INTO `sys_function_point` VALUES ('139', '', '1', '添加权限', '1', 'functionPoint/add.do', '125');
INSERT INTO `sys_function_point` VALUES ('140', null, '1', '设置权限', '4', 'role/setPrivilege.do', '121');
INSERT INTO `sys_function_point` VALUES ('149', ' ', '0', '修改密码', '5', 'user/updatePassword.do', '117');
INSERT INTO `sys_function_point` VALUES ('288', null, '0', '查看用户', '4', 'user/detail.do', '117');
INSERT INTO `sys_function_point` VALUES ('656', '0', '0', '系统参数配置', '1', 'config/systemConfig.do', '132');
INSERT INTO `sys_function_point` VALUES ('700', null, '1', '部门管理', '700', 'department/list.do', '132');
INSERT INTO `sys_function_point` VALUES ('701', null, '0', '部门添加', '1', 'department/add.do', '700');
INSERT INTO `sys_function_point` VALUES ('702', null, '0', '删除部门', '2', 'department/delete.do', '700');
INSERT INTO `sys_function_point` VALUES ('703', null, '0', '部门修改', '3', 'department/update.do', '700');
INSERT INTO `sys_function_point` VALUES ('705', null, '0', '部门查看', '5', 'department/detail.do', '700');
INSERT INTO `sys_function_point` VALUES ('706', 'fa-globe', '1', '数据管理', '1', 'admin/content', null);
INSERT INTO `sys_function_point` VALUES ('800', null, '1', '类目管理', '800', 'category/list.do', '706');
INSERT INTO `sys_function_point` VALUES ('801', null, '0', '类目添加', '1', 'category/add.do', '800');
INSERT INTO `sys_function_point` VALUES ('802', null, '0', '删除类目', '2', 'category/delete.do', '800');
INSERT INTO `sys_function_point` VALUES ('803', null, '0', '类目修改', '3', 'category/update.do', '800');
INSERT INTO `sys_function_point` VALUES ('805', null, '0', '类目查看', '5', 'category/detail.do', '800');
INSERT INTO `sys_function_point` VALUES ('808', null, '1', '商品管理', '807', 'product/list.do', '706');
INSERT INTO `sys_function_point` VALUES ('809', null, '0', '商品添加', '1', 'product/add.do', '808');
INSERT INTO `sys_function_point` VALUES ('810', null, '0', '删除商品', '2', 'product/delete.do', '808');
INSERT INTO `sys_function_point` VALUES ('811', null, '0', '商品修改', '3', 'product/update.do', '808');
INSERT INTO `sys_function_point` VALUES ('813', null, '0', '商品查看', '5', 'product/detail.do', '808');
INSERT INTO `sys_function_point` VALUES ('816', null, '1', '访问日志管理', '814', 'accessLog/list.do', '706');
INSERT INTO `sys_function_point` VALUES ('817', null, '0', '访问日志添加', '1', 'accessLog/add.do', '816');
INSERT INTO `sys_function_point` VALUES ('818', null, '0', '删除访问日志', '2', 'accessLog/delete.do', '816');
INSERT INTO `sys_function_point` VALUES ('819', null, '0', '访问日志修改', '3', 'accessLog/update.do', '816');
INSERT INTO `sys_function_point` VALUES ('821', null, '0', '访问日志查看', '5', 'accessLog/detail.do', '816');
INSERT INTO `sys_function_point` VALUES ('824', null, '1', '注册申请管理', '821', 'registerApply/list.do', '706');
INSERT INTO `sys_function_point` VALUES ('825', null, '0', '注册申请添加', '1', 'registerApply/add.do', '824');
INSERT INTO `sys_function_point` VALUES ('826', null, '0', '删除注册申请', '2', 'registerApply/delete.do', '824');
INSERT INTO `sys_function_point` VALUES ('827', null, '0', '注册申请修改', '3', 'registerApply/update.do', '824');
INSERT INTO `sys_function_point` VALUES ('829', null, '0', '注册申请查看', '5', 'registerApply/detail.do', '824');
INSERT INTO `sys_function_point` VALUES ('830', null, '1', '我的商品', '807', 'product/myList.do', '706');
INSERT INTO `sys_function_point` VALUES ('831', null, '0', '商品添加', '1', 'product/myAdd.do', '830');
INSERT INTO `sys_function_point` VALUES ('832', null, '0', '删除商品', '2', 'product/myDelete.do', '830');
INSERT INTO `sys_function_point` VALUES ('833', null, '0', '商品修改', '3', 'product/myUpdate.do', '830');
INSERT INTO `sys_function_point` VALUES ('834', null, '0', '商品查看', '5', 'product/myDetail.do', '830');
INSERT INTO `sys_function_point` VALUES ('835', null, '0', '注册申请处理', '5', 'registerApply/deal.do', '824');
INSERT INTO `sys_function_point` VALUES ('836', null, '0', '数据统计', '5', 'accessLog/stat.do', '706');
INSERT INTO `sys_function_point` VALUES ('837', null, '0', '全部数据统计', '5', 'accessLog/allStat.do', '706');

-- ----------------------------
-- Table structure for `sys_notice`
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_content` text,
  `create_time` datetime DEFAULT NULL,
  `_level` enum('High','Middle','Low') DEFAULT NULL,
  `manageKey` varchar(255) DEFAULT NULL,
  `_title` varchar(255) DEFAULT NULL,
  `creator_id` varchar(20) DEFAULT NULL,
  `dept_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKDEF5048A834CFF89` (`creator_id`) USING BTREE,
  KEY `FKDEF5048A68C27257` (`dept_id`) USING BTREE,
  CONSTRAINT `sys_notice_ibfk_1` FOREIGN KEY (`dept_id`) REFERENCES `sys_department` (`id`),
  CONSTRAINT `sys_notice_ibfk_2` FOREIGN KEY (`creator_id`) REFERENCES `sys_user` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `_key` varchar(255) DEFAULT NULL,
  `_type` enum('Normal','Advance') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '', '管理员', null, 'Advance');

-- ----------------------------
-- Table structure for `sys_role_function_point`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_function_point`;
CREATE TABLE `sys_role_function_point` (
  `role_id` int(11) NOT NULL,
  `functionpoint_id` int(11) NOT NULL,
  PRIMARY KEY (`role_id`,`functionpoint_id`),
  KEY `FK896F00E08877B633` (`functionpoint_id`) USING BTREE,
  KEY `FK896F00E011FCE641` (`role_id`) USING BTREE,
  CONSTRAINT `sys_role_function_point_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `sys_role` (`id`),
  CONSTRAINT `sys_role_function_point_ibfk_2` FOREIGN KEY (`functionpoint_id`) REFERENCES `sys_function_point` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role_function_point
-- ----------------------------
INSERT INTO `sys_role_function_point` VALUES ('1', '109');
INSERT INTO `sys_role_function_point` VALUES ('1', '110');
INSERT INTO `sys_role_function_point` VALUES ('1', '111');
INSERT INTO `sys_role_function_point` VALUES ('1', '112');
INSERT INTO `sys_role_function_point` VALUES ('1', '113');
INSERT INTO `sys_role_function_point` VALUES ('1', '114');
INSERT INTO `sys_role_function_point` VALUES ('1', '115');
INSERT INTO `sys_role_function_point` VALUES ('1', '116');
INSERT INTO `sys_role_function_point` VALUES ('1', '117');
INSERT INTO `sys_role_function_point` VALUES ('1', '118');
INSERT INTO `sys_role_function_point` VALUES ('1', '119');
INSERT INTO `sys_role_function_point` VALUES ('1', '120');
INSERT INTO `sys_role_function_point` VALUES ('1', '121');
INSERT INTO `sys_role_function_point` VALUES ('1', '122');
INSERT INTO `sys_role_function_point` VALUES ('1', '123');
INSERT INTO `sys_role_function_point` VALUES ('1', '124');
INSERT INTO `sys_role_function_point` VALUES ('1', '125');
INSERT INTO `sys_role_function_point` VALUES ('1', '132');
INSERT INTO `sys_role_function_point` VALUES ('1', '136');
INSERT INTO `sys_role_function_point` VALUES ('1', '137');
INSERT INTO `sys_role_function_point` VALUES ('1', '138');
INSERT INTO `sys_role_function_point` VALUES ('1', '139');
INSERT INTO `sys_role_function_point` VALUES ('1', '140');
INSERT INTO `sys_role_function_point` VALUES ('1', '149');
INSERT INTO `sys_role_function_point` VALUES ('1', '288');
INSERT INTO `sys_role_function_point` VALUES ('1', '656');
INSERT INTO `sys_role_function_point` VALUES ('1', '700');
INSERT INTO `sys_role_function_point` VALUES ('1', '701');
INSERT INTO `sys_role_function_point` VALUES ('1', '702');
INSERT INTO `sys_role_function_point` VALUES ('1', '703');
INSERT INTO `sys_role_function_point` VALUES ('1', '705');
INSERT INTO `sys_role_function_point` VALUES ('1', '706');
INSERT INTO `sys_role_function_point` VALUES ('1', '800');
INSERT INTO `sys_role_function_point` VALUES ('1', '801');
INSERT INTO `sys_role_function_point` VALUES ('1', '802');
INSERT INTO `sys_role_function_point` VALUES ('1', '803');
INSERT INTO `sys_role_function_point` VALUES ('1', '805');
INSERT INTO `sys_role_function_point` VALUES ('1', '808');
INSERT INTO `sys_role_function_point` VALUES ('1', '809');
INSERT INTO `sys_role_function_point` VALUES ('1', '810');
INSERT INTO `sys_role_function_point` VALUES ('1', '811');
INSERT INTO `sys_role_function_point` VALUES ('1', '813');
INSERT INTO `sys_role_function_point` VALUES ('1', '816');
INSERT INTO `sys_role_function_point` VALUES ('1', '817');
INSERT INTO `sys_role_function_point` VALUES ('1', '818');
INSERT INTO `sys_role_function_point` VALUES ('1', '819');
INSERT INTO `sys_role_function_point` VALUES ('1', '821');
INSERT INTO `sys_role_function_point` VALUES ('1', '824');
INSERT INTO `sys_role_function_point` VALUES ('1', '825');
INSERT INTO `sys_role_function_point` VALUES ('1', '826');
INSERT INTO `sys_role_function_point` VALUES ('1', '827');
INSERT INTO `sys_role_function_point` VALUES ('1', '829');
INSERT INTO `sys_role_function_point` VALUES ('1', '830');
INSERT INTO `sys_role_function_point` VALUES ('1', '831');
INSERT INTO `sys_role_function_point` VALUES ('1', '832');
INSERT INTO `sys_role_function_point` VALUES ('1', '833');
INSERT INTO `sys_role_function_point` VALUES ('1', '834');
INSERT INTO `sys_role_function_point` VALUES ('1', '835');
INSERT INTO `sys_role_function_point` VALUES ('1', '836');
INSERT INTO `sys_role_function_point` VALUES ('1', '837');

-- ----------------------------
-- Table structure for `sys_user`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `username` varchar(20) NOT NULL,
  `chinese_name` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(100) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `status` enum('Active','Approving','InActive') NOT NULL,
  `dept` int(11) DEFAULT NULL,
  `english_name` varchar(255) DEFAULT NULL,
  `type` enum('Local','Domain') NOT NULL,
  `head_portrait` int(11) DEFAULT NULL,
  `largPhoto` int(11) DEFAULT NULL,
  `photo` int(11) DEFAULT NULL,
  `lastLoginTime` datetime DEFAULT NULL,
  `thisLoginTime` datetime DEFAULT NULL,
  PRIMARY KEY (`username`),
  KEY `FK74A81DFD95B49B55` (`dept`) USING BTREE,
  KEY `FK74A81DFD197771A3` (`head_portrait`) USING BTREE,
  KEY `FK74A81DFD50C75491` (`largPhoto`) USING BTREE,
  KEY `FK74A81DFD294CF4BB` (`photo`) USING BTREE,
  CONSTRAINT `sys_user_ibfk_1` FOREIGN KEY (`head_portrait`) REFERENCES `sys_file` (`id`),
  CONSTRAINT `sys_user_ibfk_2` FOREIGN KEY (`photo`) REFERENCES `sys_file` (`id`),
  CONSTRAINT `sys_user_ibfk_3` FOREIGN KEY (`largPhoto`) REFERENCES `sys_file` (`id`),
  CONSTRAINT `sys_user_ibfk_4` FOREIGN KEY (`dept`) REFERENCES `sys_department` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('aaaa', 'a', '', '74b87337454200d4d33f80c4663dc5e5', '', 'Active', '1', null, 'Local', null, null, null, null, null);
INSERT INTO `sys_user` VALUES ('admin', 'admin', 'admin@localhost.com', '0cc175b9c0f1b6a831c399e269772661', '133026500000', 'Active', '1', null, 'Local', null, null, null, '2018-04-30 00:03:31', '2018-04-30 00:05:56');

-- ----------------------------
-- Table structure for `sys_user_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `userName` varchar(20) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`userName`,`role_id`),
  KEY `FK660C5178D1093C23` (`role_id`) USING BTREE,
  KEY `FK660C51786F229ACA` (`userName`) USING BTREE,
  CONSTRAINT `sys_user_role_ibfk_1` FOREIGN KEY (`userName`) REFERENCES `sys_user` (`username`),
  CONSTRAINT `sys_user_role_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `sys_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('admin', '1');

-- ----------------------------
-- Table structure for `trace_access_log`
-- ----------------------------
DROP TABLE IF EXISTS `trace_access_log`;
CREATE TABLE `trace_access_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `access_time` datetime DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `manageKey` varchar(255) DEFAULT NULL,
  `page` varchar(255) DEFAULT NULL,
  `session_id` varchar(255) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of trace_access_log
-- ----------------------------

-- ----------------------------
-- Table structure for `trace_category`
-- ----------------------------
DROP TABLE IF EXISTS `trace_category`;
CREATE TABLE `trace_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `manageKey` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `order_num` int(11) DEFAULT NULL,
  `remark` text,
  `status` enum('Yes','No') DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK76FA9AB8F3257189` (`parent_id`),
  CONSTRAINT `FK76FA9AB8F3257189` FOREIGN KEY (`parent_id`) REFERENCES `trace_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of trace_category
-- ----------------------------
INSERT INTO `trace_category` VALUES ('1', 'fc3c44e16a598d872ca59e5b23e91d09', 'test22222', '12', 'xxxx', 'Yes', null);
INSERT INTO `trace_category` VALUES ('2', '7210845a11a149c549231084f905a2e7', 'www', null, 's', 'Yes', '1');
INSERT INTO `trace_category` VALUES ('5', 'f48ba2e2d3d345286b3041c8b908bc28', 'fasfdsa >fdsafad >fdsafdas >', '2', '32', 'Yes', null);
INSERT INTO `trace_category` VALUES ('6', 'a57b84079aaba73614d5a11e0627353d', 'test', null, '', 'Yes', null);
INSERT INTO `trace_category` VALUES ('7', '8c9a54136a4d6c0f61d48c217282f743', '222', '22', '范德萨发的', 'Yes', '6');
INSERT INTO `trace_category` VALUES ('8', 'c3890c768d3adc98c68b9ba569e703de', 'a3', '22', 'fds', 'Yes', '2');
INSERT INTO `trace_category` VALUES ('9', '8b00a8a4594858a85b2497dddf04531a', 'fdsfad', '1', 'fdsf', 'No', '2');

-- ----------------------------
-- Table structure for `trace_product`
-- ----------------------------
DROP TABLE IF EXISTS `trace_product`;
CREATE TABLE `trace_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `batch_num` varchar(255) DEFAULT NULL,
  `bradn` varchar(255) DEFAULT NULL,
  `deadline` datetime DEFAULT NULL,
  `description` text,
  `manageKey` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `product_addr` varchar(255) DEFAULT NULL,
  `spec` varchar(255) DEFAULT NULL,
  `standard` varchar(255) DEFAULT NULL,
  `status` enum('UnApprove','Failed','Success','Down') DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `_trace` varchar(255) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `creator` varchar(20) DEFAULT NULL,
  `picture_id` int(11) DEFAULT NULL,
  `qr_code` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK5CA64FF5D3676CB5` (`category_id`),
  KEY `FK5CA64FF5345BB8FA` (`creator`),
  KEY `FK5CA64FF54F61A492` (`picture_id`),
  KEY `FK5CA64FF5CE3C9DE1` (`qr_code`),
  CONSTRAINT `FK5CA64FF5345BB8FA` FOREIGN KEY (`creator`) REFERENCES `sys_user` (`username`),
  CONSTRAINT `FK5CA64FF54F61A492` FOREIGN KEY (`picture_id`) REFERENCES `sys_file` (`id`),
  CONSTRAINT `FK5CA64FF5CE3C9DE1` FOREIGN KEY (`qr_code`) REFERENCES `sys_file` (`id`),
  CONSTRAINT `FK5CA64FF5D3676CB5` FOREIGN KEY (`category_id`) REFERENCES `trace_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of trace_product
-- ----------------------------
INSERT INTO `trace_product` VALUES ('1', 'LN201804170001', '法里卓瓦庄园', '2018-04-24 18:44:02', '法里卓瓦2014红葡萄酒，来自葡萄牙阿连特如产区采摘于2014年的丹魄、希拉和国产多瑞加。经过在橡木桶中陈酿9个月，酿造出红宝石色的色泽；轻闻一下，能够品出明显的紫罗兰、樱桃和巧克力的味，此酒适合家庭聚会享用。', '9428cae334247a754638d0816a7dfc24', '法里卓瓦庄园-2014红葡萄酒', '辽宁吾同进出口有限公司', '750ML', 'sss', 'UnApprove', '12311112222', '50%丹魄，40%希拉', '7', 'admin', '729', '731');

-- ----------------------------
-- Table structure for `trace_register_apply`
-- ----------------------------
DROP TABLE IF EXISTS `trace_register_apply`;
CREATE TABLE `trace_register_apply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `_contact` varchar(255) DEFAULT NULL,
  `deal_remak` text,
  `email` varchar(255) DEFAULT NULL,
  `law_person` varchar(255) DEFAULT NULL,
  `manageKey` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `status` enum('UnDeal','Failed','Succes') DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `id_card` int(11) DEFAULT NULL,
  `license` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK85E6790CF26B84A` (`id_card`),
  KEY `FK85E6790CB69B1CD7` (`license`),
  CONSTRAINT `FK85E6790CB69B1CD7` FOREIGN KEY (`license`) REFERENCES `sys_file` (`id`),
  CONSTRAINT `FK85E6790CF26B84A` FOREIGN KEY (`id_card`) REFERENCES `sys_file` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of trace_register_apply
-- ----------------------------
