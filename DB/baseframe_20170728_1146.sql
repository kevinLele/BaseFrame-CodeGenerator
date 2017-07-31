/*
SQLyog  v12.2.6 (64 bit)
MySQL - 5.7.17 : Database - baseframe
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`baseframe` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `baseframe`;

/*Table structure for table `ca_order` */

DROP TABLE IF EXISTS `ca_order`;

CREATE TABLE `ca_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单ID|true,aa,bb',
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `order_name` varchar(50) DEFAULT NULL COMMENT '订单名称|true,cc,dd',
  `order_date` datetime DEFAULT NULL COMMENT '订单生成时间',
  `price` double DEFAULT NULL COMMENT '订单价格',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `ca_order` */

/*Table structure for table `ca_organization` */

DROP TABLE IF EXISTS `ca_organization`;

CREATE TABLE `ca_organization` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '唯一标识码',
  `parent_id` bigint(20) NOT NULL COMMENT '父机构的id',
  `name` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '机构名称',
  `code` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '机构编码',
  `description` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '机构描述',
  `create_date` datetime DEFAULT NULL COMMENT '机构创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '最后修改时间',
  `updater_id` bigint(20) DEFAULT NULL COMMENT '最后的修改人的id',
  `address` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '机构地址',
  `phone` char(12) COLLATE utf8_bin DEFAULT NULL COMMENT '机构的联系电话',
  `email` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '与机构联系的邮箱',
  `is_delete` int(11) NOT NULL DEFAULT '0' COMMENT '组织机构状态0正常，1表示删除',
  `issuer` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `link_man` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '联系人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='CA_组织机构表';

/*Data for the table `ca_organization` */

insert  into `ca_organization`(`id`,`parent_id`,`name`,`code`,`description`,`create_date`,`update_date`,`updater_id`,`address`,`phone`,`email`,`is_delete`,`issuer`,`link_man`) values 
(0,-1,'云平台','root',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL),
(1,0,'国土局','c1','desc２','2017-05-25 09:54:46','2017-06-01 09:46:29',NULL,'cheshicheshi','13138212523','tset@163.com',0,'系统管理员','习近'),
(2,0,'人保局','c2','desc','2017-05-24 13:55:38','2017-06-27 10:00:01',NULL,'address　地址','13128212523','tset@163.com',0,'系统管理员','李克'),
(3,0,'公安局','c3','desc','2017-06-10 13:56:45',NULL,NULL,'address　地址','13128212523','tset@163.com',0,'系统管理员','李伟'),
(4,0,'环卫局','c4','desc','2017-05-12 13:55:41',NULL,NULL,'address　地址','13128212523','tset@163.com',0,'系统管理员','李伟'),
(5,3,'洪山分局','c5','desc','2017-05-05 13:55:49','2017-05-31 11:53:58',NULL,'address　地址','131282121523','tset@163.com',0,'系统管理员','lessonss'),
(6,3,'武昌分局','c6','desc','2017-06-02 13:56:43',NULL,NULL,'address　地址','13128212523','tset@163.com',0,'系统管理员','李伟'),
(7,3,'江汉分局','c7','desc','2017-05-15 13:55:46',NULL,NULL,'address　地址','13128212523','tset@163.com',0,'系统管理员','李伟'),
(8,3,'汉阳分局','c8','desc','2017-05-07 13:55:50',NULL,NULL,'address　地址','13128122523','tset@163.com',0,'系统管理员','李伟'),
(9,6,'财务科','c9','desc','2017-05-22 13:55:53',NULL,NULL,'address　地址','13128212523','tset@163.com',0,'系统管理员','李伟'),
(10,6,'监查科','c10','desc','2017-05-05 13:55:44',NULL,NULL,'address　地址','13128212523','tset@163.com',0,'系统管理员','李伟'),
(11,6,'事务科','c11','desc','2017-05-08 13:56:33',NULL,NULL,'address　地址','13128211523','tset@163.com',0,'系统管理员','李伟'),
(12,6,'民生科','c12','desc','2017-05-24 13:56:30',NULL,NULL,'address　地址','13128212523','tset@163.com',0,'系统管理员','李伟'),
(13,6,'医务科','c13','desc','2017-05-31 13:56:40',NULL,NULL,'address　地址','13128212523','tset@163.com',0,'系统管理员','李伟'),
(14,9,'财务一部','c14','desc','2017-05-05 13:56:35',NULL,NULL,'address　地址','13128212523','tset@163.com',0,'系统管理员','李伟'),
(15,9,'财务二部','c15','desc','2017-05-06 13:56:38',NULL,NULL,'address　地址','13128212523','tset@163.com',0,'系统管理员','李伟'),
(16,9,'财务三部','c16','desc','2017-05-09 13:55:55',NULL,NULL,'address　地址','131282212523','tset@163.com',0,'系统管理员','李伟'),
(17,9,'财务四部','c17','desc','2017-05-12 13:55:57',NULL,NULL,'address　地址','13128212523','tset@163.com',0,'系统管理员','李伟'),
(18,9,'财务五部','c18','desc','2017-05-01 13:55:59',NULL,NULL,'address　地址','13128212523','tset@163.com',0,'系统管理员','李伟'),
(19,16,'事务三组','74F54C7153454E38B7B222280B0975AC','desc','2017-05-26 09:44:10','2017-05-26 10:00:28',NULL,'武汉','13128212523','tset@163.com',0,'系统管理员','李伟'),
(20,16,'事务一组','c20','desc','2017-05-04 13:56:08',NULL,NULL,'address　地址','13128212523','tset@163.com',0,'系统管理员','李伟'),
(21,16,'事务二组','c21','desc','2017-05-03 13:56:06',NULL,NULL,'address　地址','13128212523','tset@163.com',0,'系统管理员','李伟'),
(22,16,'事务三组','c22','desc','2017-05-16 13:56:04',NULL,NULL,'address　地址','13128212523','tset@163.com',0,'系统管理员','李伟'),
(53,22,'张三','E3C850FE7839499CBFF10474E52B28CE','desc','2017-05-26 15:04:21','2017-04-27 11:28:40',NULL,'董斌','13128212523','tset@163.com',0,'系统管理员','李伟'),
(54,22,'事务四组','E3C850FE7839499CBFF10474E52B28CE','desc','2017-05-26 15:07:36','2017-05-26 15:07:40',11,'李四','13128212523','tset@163.com',0,'系统管理员','李伟'),
(55,22,'事务五组','E3C850FE7839499CBFF10474E52B28CE','desc','2017-05-26 15:12:10','2017-05-26 15:11:40',11,'武汉','13128212523','tset@163.com',0,'系统管理员','李伟'),
(56,22,'事务六组','E3C850FE7839499CBFF10474E52B28CE','desc','2017-05-26 16:05:40','2017-05-26 16:13:05',11,'武汉','13128212523','tset@163.com',0,'系统管理员','李伟'),
(57,7,'1','EQFE913212343KDWQEIEKQWEIFJEWQWE','desc','2017-05-26 18:04:02',NULL,NULL,'address　地址','4','5',1,'系统管理员','李伟'),
(58,1,'测45试','AAAAAC',NULL,'2017-05-27 14:41:59','2017-05-31 11:48:54',NULL,'士大45夫似的',NULL,NULL,1,'系45管理员',NULL),
(59,4,'武昌1环卫局','BAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA','测试111111','2017-05-31 14:11:51','2017-06-02 16:28:09',NULL,'武汉市武昌区','18507108472','a@126.com',0,'张三三','李克强'),
(60,4,'江夏环卫局','AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA','测试','2017-05-31 14:46:37','2017-05-31 16:49:01',NULL,'测试','12345678','@163.com',1,'张三三','LI'),
(61,60,'','','','2017-05-31 14:57:22','2017-05-31 15:01:51',NULL,'','','',1,'',''),
(62,1,'测试','AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA',NULL,'2017-05-31 16:33:03',NULL,NULL,'士大夫似的',NULL,NULL,0,'系管理员',NULL),
(63,5,'洪山','E3C850FE7839499CBFF10474E52B28CE',NULL,'2017-05-31 16:39:50',NULL,5,'吉塔','13128212523','tset@163.com',0,'吉塔','aa'),
(64,4,'汉阳环卫局','AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA','测试','2017-05-31 16:40:58',NULL,NULL,'测试','18507108471','test@163.com',0,'李四四','李四四'),
(65,4,'江夏环卫局','AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA','测试','2017-05-31 16:46:28',NULL,NULL,'测试','18507108471','test@163.com',0,'李四四','李四四'),
(66,4,'汉口环卫局','AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA','测试','2017-05-31 16:48:26',NULL,NULL,'测试','18507108471','test@163.com',0,'王五五','王五五'),
(67,4,'武昌环卫局','AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA','测试','2017-06-01 09:06:22',NULL,NULL,'测试','18520147954','test@163.com',0,NULL,'LISS'),
(68,1,'测试1','AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA',NULL,'2017-06-01 09:41:53','2017-06-14 13:33:45',NULL,'士大夫似的',NULL,NULL,1,'系管理员',NULL),
(69,2,'一级机构','yjjg','asdfbb','2017-06-01 16:20:10','2017-06-01 16:23:46',NULL,'asdf','13828282821','a@a.a',0,NULL,'测试人1'),
(70,69,'二级机构','ejjg','ddd','2017-06-01 16:22:10',NULL,NULL,'ccc','13133332222','b@b.b',0,NULL,'王五'),
(71,1,'1测试','AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA',NULL,'2017-06-01 16:40:33',NULL,NULL,'士大夫似的',NULL,NULL,1,'2系管理员',NULL),
(72,1,'4','AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA',NULL,'2017-06-01 16:40:59',NULL,NULL,'士大夫似的',NULL,NULL,1,'2系管理员',NULL),
(73,1,'4','AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA',NULL,'2017-06-01 16:41:17',NULL,NULL,'r',NULL,NULL,1,'2系管理员',NULL),
(74,1,'4','AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA',NULL,'2017-06-01 16:41:22',NULL,NULL,'r',NULL,NULL,0,'2',NULL),
(75,1,'4','AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA',NULL,'2017-06-01 16:41:27',NULL,NULL,'r',NULL,NULL,1,'',NULL),
(76,6,'武昌分局','AAAA','aa','2017-06-08 16:18:06',NULL,NULL,'武汉','15872549525','dbongin@163.com',0,'张三','董斌'),
(77,4,'光谷环卫局','aa','光谷','2017-06-08 16:29:43',NULL,NULL,'光谷','15872549525','tset@163.com',0,'张三','张三'),
(78,1,'江夏','gfd','测试','2017-06-13 14:10:22',NULL,NULL,'测试','18507108471','test@163.com',1,'张三','郭嘉'),
(79,1,'江夏','hfgdh','测试','2017-06-13 14:12:24',NULL,NULL,'测','18507108471','test@163.com',1,'张三','郭嘉'),
(80,1,'江夏','gfdsg','测试','2017-06-13 14:14:32',NULL,NULL,'车位','18507108471','test@163.com',1,'张三','郭嘉'),
(81,0,'111','222','cccc','2017-06-14 13:30:58',NULL,NULL,'b.b.b','13111111111','a@a.a',1,'张三','333'),
(82,62,'222ddd','222','dddddd','2017-06-14 13:31:31','2017-06-14 13:33:30',NULL,'cccccc','13188899898','b@b.b',1,'张三','222'),
(84,4,'试试1121111','ss','测试1','2017-06-14 17:46:34','2017-06-14 17:54:20',NULL,'测试1','18524741874','tes@163.com',1,'张三','试试'),
(85,4,'试试','dfs','试试','2017-06-15 09:23:29',NULL,NULL,'试试','18521741874','test@163.com',1,'张三','ss'),
(86,4,'试试','ss','测试','2017-06-15 11:00:44',NULL,NULL,'测试','18524718471','test@163.com',1,'张三','ss'),
(88,4,'测试父节点','ss','测试','2017-06-15 11:13:50',NULL,NULL,'测试','18527108471','test@163.com',0,'张三','ss'),
(89,88,'测试子节点1','ss','测试','2017-06-15 11:14:30',NULL,NULL,'测试','18521741847','test@163.com',1,'张三','ss'),
(90,0,'aaa','bbb','ccc','2017-06-15 11:29:53',NULL,NULL,'bbb','13133333333','aa@aa.aa',1,'张三','ccc'),
(91,90,'bbb1','bb','测试','2017-06-15 11:30:55','2017-06-27 17:37:29',NULL,'测试','18501748471','test@163.com',1,'张三','bb'),
(92,91,'ccc','ddd','asdf','2017-06-15 11:50:45',NULL,NULL,'asdf','13133333333','aa@aa.acom',1,'张三','eee'),
(93,90,'ccc','ccc','测试','2017-06-15 13:27:59',NULL,NULL,'测是','18524107471','test@163.com',1,'张三','dd'),
(94,88,'测试子节点2','dd','测试','2017-06-15 13:33:23',NULL,NULL,'测试','18520107471','test@163.com',0,'张三','dd'),
(95,3,'青山分局','111','bbb','2017-06-27 09:37:59',NULL,NULL,'aaa','13511111111','test@163.com',0,'张三','222'),
(97,62,'aaa','bbb','ccc','2017-06-27 20:13:03',NULL,NULL,'bbb','13511111111','2222@a.a',0,'张三','ccc'),
(98,90,'托福','b2','是','2017-06-28 10:32:13',NULL,NULL,'广寒','18501748471','test89@163.com',1,'张三','bb'),
(99,90,'bbb1','vv','水电费','2017-06-28 10:34:07',NULL,NULL,'找茬','13133333333','vv90@163.com',1,'张三','vv'),
(100,0,'aaa','bbb','是佛','2017-06-28 10:36:04',NULL,NULL,'是佛','13133333333','aa45@163.com',1,'张三','ccc');

/*Table structure for table `ca_role` */

DROP TABLE IF EXISTS `ca_role`;

CREATE TABLE `ca_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '唯一标识码',
  `name` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '角色名称',
  `code` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '角色编码',
  `description` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '角色的相关描述',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  `issuer` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '创建人',
  `is_delete` int(11) NOT NULL DEFAULT '0' COMMENT '角色状态0正常，1表示删除',
  `appcode` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '应用编码',
  `orgId` bigint(20) NOT NULL COMMENT '所属机构',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='CA_角色信息表';

/*Data for the table `ca_role` */

insert  into `ca_role`(`id`,`name`,`code`,`description`,`create_date`,`update_date`,`issuer`,`is_delete`,`appcode`,`orgId`) values 
(1,'管理员','admin','啦啦啦啦','2017-05-02 10:17:37','2017-06-01 15:09:44','机构管理员',0,'QWERTYUIOPLKJHGFDSAZXCVBNMLKJHG',1),
(2,'超级管理员','administrator','蛮三刀','2017-05-18 19:41:41','2017-06-01 15:10:26','机构管理员',0,'wwwwwwwwwwwwwwwwwwwwwwwwwwwwwww',1),
(34,'管理员','QWERTYUIOPLKJHGFDSAZXCVBNMLKJHGF','dddd','2017-05-24 18:04:08','2017-06-01 16:24:37','机构管理员',1,'QWERTYUIOPLKJHGFDSAZXCVBNMLKJHGF',2),
(35,'董斌','QWERTYUIOPLKJHGFDSAZXCVBNMLKJHGF','dccceee','2017-05-25 19:59:36','2017-06-15 13:14:44','机构管理员',0,'QWERTYUIOPLKJHGFDSAZXCVBNMLKJHGF',4),
(36,'这些3','SSDSSSSSSSSSSSSSSSSSSSSSSSSSSSSS','XF3G','2017-05-27 10:43:42','2017-05-27 10:50:12','相册3',1,',jdbcType=BIGINT',1),
(37,'role','aaa',NULL,NULL,NULL,'bbb',1,'eee',1),
(38,'role2','aaaq1',NULL,NULL,NULL,'bbb1',0,'eee1',1),
(39,'role3','aaa2',NULL,NULL,NULL,'bbb2',0,'eee2',1),
(40,'role4','aaa3',NULL,NULL,NULL,'bbb3',0,'eee3',1),
(41,'role5','aaa4',NULL,NULL,NULL,'bbb4',0,'eee4',1),
(42,'role6','aaa5',NULL,NULL,NULL,'bbb5',1,'eee5',1),
(43,'role7','aaa6',NULL,NULL,NULL,'bbb6',1,'eee6',2),
(44,'role8','aaa7',NULL,NULL,NULL,'bbb7',1,'eee7',1),
(45,'洪口','E3C850FE7839499CBFF10474E52B28CE','测试','2017-05-31 17:00:07','2017-06-01 15:08:50','机构管理员',0,'AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA',5),
(46,'武林至尊','SSDSSSSSSSSSSSSSSSSSSSSSSSSSSSSS','测试eee','2017-06-01 09:53:50','2017-06-01 16:25:24','机构管理员',1,'AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA',0),
(47,'李修贤1','E3C850FE7839499CBFF10474E52B28CE','测试','2017-06-01 14:45:04','2017-06-27 09:37:26','机构管理员',0,'E3C850FE7839499CBFF10474E52B28CE',2),
(50,'洪山','E3C850FE7839499CBFF10474E52B28CE','测试','2017-06-05 14:34:50','2017-06-27 20:50:29','机构管理员',0,'AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA',2),
(51,'洪山','E3C850FE7839499CBFF10474E52B28CE','测试','2017-06-05 14:40:17',NULL,'吉塔',1,'AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA',5),
(52,'洪山','E3C850FE7839499CBFF10474E52B28CE','测试','2017-06-05 14:40:27',NULL,'吉塔FFD',1,'AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA',5),
(53,'洪山','E3C850FE7839499CBFF10474E52B28CE','测试','2017-06-05 14:40:54',NULL,'吉塔FFD',1,'AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA',22),
(54,'洪山','E3C850FE7839499CBFF10474E52B28CE','','2017-06-05 14:41:27',NULL,'吉塔FFD',1,'AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA',22),
(55,'洪山','E3C850FE7839499CBFF10474E52','测试','2017-06-05 14:42:24',NULL,'吉塔FFD',1,'AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA',2),
(56,'董永','E3C850FE7839499CBFF10474E52B2888',NULL,'2017-06-05 16:54:58','2017-06-05 16:57:25','董永',1,'E3C850FE7839499CBFF10474E52B2899',7001),
(57,'国画','FDSFSD','CES','2017-06-13 13:26:58','2017-06-27 08:50:44','机构管理员',1,'DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD',2),
(58,'高度','fdsg','FDS','2017-06-13 13:37:25',NULL,'张三',0,'SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS',1),
(59,'就会','fdh','GHH','2017-06-13 14:05:21',NULL,'张三',1,'DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD',1),
(60,'发过','gfds','FDS','2017-06-13 14:07:39',NULL,'张三',1,'FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF',1),
(61,'测试bbb','bbb','测试','2017-06-26 10:35:04',NULL,'张三',1,'AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA',91),
(62,'科长','001','承认','2017-06-27 09:38:21','2017-06-28 09:24:41','机构管理员',0,'AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA',3),
(63,'测试新增','ddd','CES','2017-06-29 13:38:15',NULL,'张三',0,'AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA',1);

/*Table structure for table `ca_user` */

DROP TABLE IF EXISTS `ca_user`;

CREATE TABLE `ca_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '唯一标识码',
  `org_id` bigint(20) NOT NULL COMMENT '组织机构ID',
  `login_name` varchar(30) COLLATE utf8_bin NOT NULL COMMENT '登陆名',
  `password` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '登陆密码',
  `username` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '姓名',
  `job_num` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '工号',
  `last_login_date` datetime DEFAULT NULL COMMENT '最后登录时间',
  `login_ip` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '登陆IP',
  `is_lock` int(11) DEFAULT '0' COMMENT '锁定值 1：锁定 0：解锁',
  `lock_date` datetime DEFAULT NULL COMMENT '锁定时间',
  `try_count` int(11) DEFAULT '0' COMMENT '登陆错误次数',
  `phone` char(12) COLLATE utf8_bin DEFAULT NULL COMMENT '电话号码',
  `email` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '邮箱',
  `is_delete` int(11) DEFAULT '0' COMMENT '账号状态0正常，1表示删除',
  `creator` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `updater` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `deleter` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `delete_date` datetime DEFAULT NULL,
  `creator_id` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `updater_id` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `deleter_id` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='CA_用户信息表';

/*Data for the table `ca_user` */

insert  into `ca_user`(`id`,`org_id`,`login_name`,`password`,`username`,`job_num`,`last_login_date`,`login_ip`,`is_lock`,`lock_date`,`try_count`,`phone`,`email`,`is_delete`,`creator`,`updater`,`deleter`,`create_date`,`update_date`,`delete_date`,`creator_id`,`updater_id`,`deleter_id`) values 
(1,2,'zhangsan','96e79218965eb72c92a549dd5a330112','张三','1','2017-06-30 17:31:32','192.168.1.198',0,'2017-05-25 14:56:23',0,'13540861109','yh@163.com',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(2,2,'lisi','96e79218965eb72c92a549dd5a330112','李四','2','2017-06-16 09:54:58',NULL,0,NULL,0,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(3,2,'wangwu','96e79218965eb72c92a549dd5a330112','王五','4',NULL,NULL,0,NULL,0,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(4,2,'zhaoliu','96e79218965eb72c92a549dd5a330112','赵六','5',NULL,NULL,0,NULL,0,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(5,69,'qianqi','96e79218965eb72c92a549dd5a330112','钱七','6',NULL,NULL,0,NULL,0,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(6,69,'sunba','96e79218965eb72c92a549dd5a330112','孙八','7',NULL,NULL,0,NULL,0,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(7,7,'wanger','96e79218965eb72c92a549dd5a330112','王二','8',NULL,NULL,0,NULL,0,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(8,8,'murong','96e79218965eb72c92a549dd5a330112','慕容复','9',NULL,NULL,0,NULL,0,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(9,4,'guojing','96e79218965eb72c92a549dd5a330112','郭靖','10',NULL,NULL,0,NULL,0,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(10,10,'zhangsanfeng','96e79218965eb72c92a549dd5a330112','张三丰','11',NULL,NULL,0,NULL,0,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(11,2,'miaorenfeng','96e79218965eb72c92a549dd5a330112','苗人凤','12',NULL,NULL,0,NULL,0,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(87,1,'qiaofeng','96e79218965eb72c92a549dd5a330112','乔峰45','3',NULL,NULL,0,NULL,0,'15871421224',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(88,70,'zhangwuji','e10adc3949ba59abbe56e057f20f883e','张无忌','3',NULL,'192.168.1.23',0,NULL,0,'15871421224',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(89,5,'A01','9e9c2aea25302f2a9116c63519f6e46b','吉塔','吉塔',NULL,NULL,0,NULL,0,'15872549525','yh@163.com',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(90,70,'wenjiabao','e10adc3949ba59abbe56e057f20f883e','温家宝','110',NULL,NULL,0,NULL,0,'18524716852','test@163.com',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(94,4,'ceshi','96e79218965eb72c92a549dd5a330112','李四',NULL,NULL,NULL,0,NULL,0,'13577777777','y.9h@163.com',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(95,3,'zhangquandan','e10adc3949ba59abbe56e057f20f883e','张全蛋','0011',NULL,NULL,0,NULL,0,'18524754857','test@163.com',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(101,69,'xijinp','e10adc3949ba59abbe56e057f20f883e','习近平','001',NULL,NULL,0,NULL,0,'18524748547','t@163.com',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(102,1,'wangwu','e10adc3949ba59abbe56e057f20f883e','王五','3',NULL,NULL,0,NULL,0,'15871421224','hello@126.com',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(103,1,'wangwu','e10adc3949ba59abbe56e057f20f883e','王五','3',NULL,NULL,0,NULL,0,'15871421224','hello@126.com',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(104,1234,'xiexun','e10adc3949ba59abbe56e057f20f883e','谢逊','3',NULL,'192.168.101.23',0,NULL,0,'15871421224','xiexun@126.com',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(105,1,'lala','e10adc3949ba59abbe56e057f20f883e','啦啦','0014',NULL,NULL,0,NULL,0,'18507108471','rest@163.com',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(106,1,'xixixi','e10adc3949ba59abbe56e057f20f883e','嘻嘻嘻','0010',NULL,NULL,0,NULL,0,'18514754784','test@163.com',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(107,1,'lalal','e10adc3949ba59abbe56e057f20f883e','啦啦啦','00141',NULL,NULL,0,NULL,0,'18501741874','tes@163.com',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(108,1,'lala','e10adc3949ba59abbe56e057f20f883e','啦啦啦','9527',NULL,NULL,0,NULL,0,'18507108471','test@163.com',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(109,0,'gdg','b52c96bea30646abf8170f333bbd42b9','吕碧城','999',NULL,NULL,0,NULL,0,'15858639088','sleind345y@163.com',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(110,2,'gdg','b52c96bea30646abf8170f333bbd42b9','吕碧城','666',NULL,NULL,0,NULL,0,'15872549525','kollor78@163.com',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `ca_user_role` */

DROP TABLE IF EXISTS `ca_user_role`;

CREATE TABLE `ca_user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '唯一标识码',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  `issuer` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=326 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='CA_用户角色关联关系表';

/*Data for the table `ca_user_role` */

insert  into `ca_user_role`(`id`,`user_id`,`role_id`,`create_date`,`update_date`,`issuer`) values 
(2,87,2,'2017-05-31 11:03:14',NULL,'李四'),
(4,87,34,'2017-05-31 11:04:08',NULL,'赵六'),
(8,4,38,'2017-05-31 11:14:05',NULL,'郭靖'),
(9,5,39,'2017-05-31 11:14:20',NULL,'苗人凤'),
(10,6,40,'2017-05-31 11:14:37',NULL,'张三丰'),
(11,7,41,'2017-05-31 11:14:54',NULL,'逍遥子'),
(42,2,62,'2017-06-28 19:42:22',NULL,'张三'),
(43,2,61,'2017-06-28 19:42:22',NULL,'张三'),
(44,2,58,'2017-06-28 19:42:22',NULL,'张三'),
(45,2,50,'2017-06-28 19:42:22',NULL,'张三'),
(48,110,2,'2017-06-29 08:02:58',NULL,'张三'),
(50,107,62,'2017-06-29 08:07:40',NULL,'张三'),
(51,107,61,'2017-06-29 08:07:40',NULL,'张三'),
(52,107,58,'2017-06-29 08:07:40',NULL,'张三'),
(53,107,50,'2017-06-29 08:07:40',NULL,'张三'),
(54,107,47,'2017-06-29 08:07:40',NULL,'张三'),
(55,107,45,'2017-06-29 08:07:40',NULL,'张三'),
(56,107,35,'2017-06-29 08:07:40',NULL,'张三'),
(57,107,2,'2017-06-29 08:07:40',NULL,'张三'),
(221,2,37,'2017-06-29 08:45:04',NULL,'张三'),
(222,4,37,'2017-06-29 08:45:04',NULL,'张三'),
(223,7,37,'2017-06-29 08:45:04',NULL,'张三'),
(224,8,37,'2017-06-29 08:45:04',NULL,'张三'),
(226,10,37,'2017-06-29 08:45:04',NULL,'张三'),
(227,11,37,'2017-06-29 08:45:04',NULL,'张三'),
(228,87,37,'2017-06-29 08:45:04',NULL,'张三'),
(229,88,37,'2017-06-29 08:45:04',NULL,'张三'),
(230,90,37,'2017-06-29 08:45:04',NULL,'张三'),
(232,95,37,'2017-06-29 08:45:04',NULL,'张三'),
(233,101,37,'2017-06-29 08:45:04',NULL,'张三'),
(234,106,37,'2017-06-29 08:45:04',NULL,'张三'),
(235,107,37,'2017-06-29 08:45:04',NULL,'张三'),
(236,108,37,'2017-06-29 08:45:04',NULL,'张三'),
(238,110,37,'2017-06-29 08:45:04',NULL,'张三'),
(276,1,1,'2017-06-29 13:41:17',NULL,'张三'),
(279,95,1,'2017-06-29 13:41:17',NULL,'张三'),
(280,107,1,'2017-06-29 13:41:17',NULL,'张三'),
(281,108,1,'2017-06-29 13:41:17',NULL,'张三'),
(282,110,1,'2017-06-29 13:41:17',NULL,'张三'),
(291,9,39,'2017-06-29 19:02:35',NULL,'张三'),
(292,9,40,'2017-06-29 19:02:35',NULL,'张三'),
(296,109,62,'2017-06-29 19:21:16',NULL,'张三'),
(297,109,61,'2017-06-29 19:21:16',NULL,'张三'),
(314,94,38,'2017-06-29 19:32:36',NULL,'张三'),
(315,94,39,'2017-06-29 19:32:36',NULL,'张三'),
(316,94,40,'2017-06-29 19:32:36',NULL,'张三'),
(317,94,45,'2017-06-29 19:32:36',NULL,'张三'),
(318,94,62,'2017-06-29 19:32:36',NULL,'张三'),
(320,1,63,'2017-06-29 20:20:02',NULL,'张三'),
(322,8,63,'2017-06-29 20:20:02',NULL,'张三'),
(324,11,63,'2017-06-29 20:20:02',NULL,'张三'),
(325,87,63,'2017-06-29 20:20:02',NULL,'张三');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
