/*
SQLyog  v12.2.6 (64 bit)
MySQL - 5.7.17 : Database - rmc
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`rmc` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `rmc`;

/*Table structure for table `rmc_apply` */

DROP TABLE IF EXISTS `rmc_apply`;

CREATE TABLE `rmc_apply` (
  `id` varchar(32) NOT NULL COMMENT '主键ID',
  `res_id` varchar(32) DEFAULT NULL COMMENT '资源ID',
  `create_date` datetime DEFAULT NULL COMMENT '提交时间',
  `creator_id` varchar(32) DEFAULT NULL COMMENT '提交人ID',
  `creator` varchar(30) DEFAULT NULL COMMENT '提交人姓名',
  `apply_detail_id` varchar(32) DEFAULT NULL COMMENT '申请详细信息, 方便一次提交多个申请时只保存一份申请说明信息',
  `audit_date` datetime DEFAULT NULL COMMENT '审核日期',
  `auditor_id` varchar(32) DEFAULT NULL COMMENT '审核人ID',
  `auditor` varchar(30) DEFAULT NULL COMMENT '审核人',
  `audit_status` varchar(20) DEFAULT NULL COMMENT '审核状态:待审核/通过/不通过',
  `audit_opinion` varchar(500) DEFAULT NULL COMMENT '审核意见',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `rmc_apply` */

/*Table structure for table `rmc_apply_detail` */

DROP TABLE IF EXISTS `rmc_apply_detail`;

CREATE TABLE `rmc_apply_detail` (
  `id` varchar(32) NOT NULL COMMENT '主键ID',
  `description` varchar(500) DEFAULT NULL COMMENT '申请描述信息',
  `valid_from` datetime DEFAULT NULL COMMENT '有效期开始时间',
  `valid_to` datetime DEFAULT NULL COMMENT '有效期结束时间',
  `apply_count` int(11) DEFAULT NULL COMMENT '申请可使用的次数',
  `east_longitude` double DEFAULT NULL COMMENT '申请使用范围:东经',
  `west_longitude` double DEFAULT NULL COMMENT '申请使用范围:西经',
  `south_latitude` double DEFAULT NULL COMMENT '申请使用范围:南纬',
  `north_latitude` double DEFAULT NULL COMMENT '申请使用范围:北纬',
  `can_update` int(11) DEFAULT '0' COMMENT '申请编辑权限',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `rmc_apply_detail` */

/*Table structure for table `rmc_catalog` */

DROP TABLE IF EXISTS `rmc_catalog`;

CREATE TABLE `rmc_catalog` (
  `id` varchar(32) NOT NULL COMMENT '主键ID',
  `parent_id` varchar(32) DEFAULT NULL COMMENT '父目录ID',
  `name` varchar(50) DEFAULT NULL COMMENT '目录名称',
  `publish_status` varchar(20) DEFAULT NULL COMMENT '发布状态:已发布/未发布',
  `publish_type` varchar(100) DEFAULT NULL COMMENT '发布类型:内网/外网/手机端',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `creator_id` varchar(32) DEFAULT NULL COMMENT '创建人ID',
  `creator` varchar(30) DEFAULT NULL COMMENT '创建人姓名',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `updater_id` varchar(32) DEFAULT NULL COMMENT '更新人ID',
  `updater` varchar(30) DEFAULT NULL COMMENT '更新人姓名',
  `delete_date` datetime DEFAULT NULL COMMENT '删除时间',
  `deleter_id` varchar(32) DEFAULT NULL COMMENT '删除人ID',
  `deleter` varchar(30) DEFAULT NULL COMMENT '删除人姓名',
  `is_delete` int(11) DEFAULT '0' COMMENT '是否已删除',
  `is_valid` int(11) DEFAULT '0' COMMENT '是否有效:启用/停用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `rmc_catalog` */

insert  into `rmc_catalog`(`id`,`parent_id`,`name`,`publish_status`,`publish_type`,`create_date`,`creator_id`,`creator`,`update_date`,`updater_id`,`updater`,`delete_date`,`deleter_id`,`deleter`,`is_delete`,`is_valid`) values 
('0','-1','系统目录','unpublished','inside,mobile',NULL,NULL,NULL,'2017-07-26 16:16:39',NULL,'生动风景',NULL,NULL,'C:\\',0,0),
('01BC49CD490B41EBB73AB72944E8BD5A','36ED63AF68C94978A7E42068AE53B67E','江夏分局','unpublished',NULL,'2017-07-21 15:30:21',NULL,NULL,'2017-07-26 16:16:51',NULL,NULL,NULL,NULL,NULL,0,0),
('029C5388DFA249FA96274C6EEDE3FDB3','36ED63AF68C94978A7E42068AE53B67E','汉阳分局','unpublished',NULL,'2017-07-21 15:30:28',NULL,NULL,'2017-07-26 16:16:51',NULL,NULL,NULL,NULL,NULL,0,0),
('1194485895594D0E981D2477FE62FF13','345E0CB9E91545CF89849AC24ECF2CF7','汉阳分局','unpublished',NULL,'2017-07-21 15:39:00',NULL,NULL,'2017-07-26 16:17:02',NULL,NULL,NULL,NULL,NULL,0,0),
('1B522C84E21A4A99B98E486AE23001C8','377C4A227A17469CB457C156074109CF','不不不','published',NULL,'2017-07-21 15:49:11',NULL,NULL,'2017-07-26 16:09:06',NULL,'为什么',NULL,NULL,NULL,0,0),
('20AEC97F29894636846054C070E18303','377C4A227A17469CB457C156074109CF','bbb','published',NULL,'2017-07-21 15:44:37',NULL,NULL,'2017-07-26 16:09:06',NULL,NULL,NULL,NULL,NULL,0,0),
('2BD7886F35DF4A8E98A768B96DF47408','345E0CB9E91545CF89849AC24ECF2CF7','蒜香','unpublished',NULL,'2017-07-21 15:39:51',NULL,NULL,'2017-07-26 16:17:02',NULL,NULL,NULL,NULL,NULL,0,0),
('2F19EF19BAFC4899BA5919F53BE86D7F','0','一级目录d','unpublished','inside,mobile','2017-07-13 16:45:56',NULL,'2M','2017-07-26 16:16:39',NULL,NULL,NULL,NULL,'是',0,0),
('345E0CB9E91545CF89849AC24ECF2CF7','0','一级目录i','unpublished',NULL,'2017-07-21 15:16:48',NULL,'2kb','2017-07-26 16:16:39',NULL,NULL,NULL,NULL,'是',0,0),
('36ED63AF68C94978A7E42068AE53B67E','0','环卫局','unpublished',NULL,'2017-07-21 15:25:49',NULL,NULL,'2017-07-26 16:16:39',NULL,NULL,NULL,NULL,NULL,0,0),
('377C4A227A17469CB457C156074109CF','0','人保局','unpublished',NULL,'2017-07-21 15:17:03',NULL,NULL,'2017-07-26 16:16:39',NULL,NULL,NULL,NULL,NULL,0,0),
('385FD601B0EC4CEB9BF2592E4585E4CF','377C4A227A17469CB457C156074109CF','bbb','published',NULL,'2017-07-21 15:48:27',NULL,NULL,'2017-07-26 16:09:06',NULL,'自己',NULL,NULL,NULL,0,0),
('41187623D6F948BE8BC7AAF4DD766A32','36ED63AF68C94978A7E42068AE53B67E','汉阳分局','unpublished',NULL,'2017-07-21 15:37:54',NULL,NULL,'2017-07-26 16:16:51',NULL,NULL,NULL,NULL,NULL,0,0),
('41E3A85EAC164478A38DAA308347C0F6','36ED63AF68C94978A7E42068AE53B67E','江夏分局','unpublished',NULL,'2017-07-21 15:38:09',NULL,NULL,'2017-07-26 16:17:02',NULL,NULL,NULL,NULL,NULL,0,0),
('4ADFA5E06B6B4CFF9E9CC2013471A8C7','345E0CB9E91545CF89849AC24ECF2CF7','汉口分局','unpublished',NULL,'2017-07-21 15:29:34',NULL,NULL,'2017-07-26 16:16:51',NULL,NULL,NULL,NULL,NULL,0,0),
('5534CA5CD96B4E439B13BFC0F03D6A95','7387DB584EDB44A79256123617624119','以为','published','mobile','2017-07-23 00:00:27',NULL,'7kb','2017-07-26 16:09:06',NULL,NULL,NULL,NULL,'否',0,0),
('64B7D075EC8643DE83125D468A5AA029','0','一级目录e','published','inside','2017-07-23 00:23:07',NULL,'4kb','2017-07-26 16:09:06',NULL,NULL,NULL,NULL,'是',0,0),
('729045EC60AE4E618CA1F766309F325E','345E0CB9E91545CF89849AC24ECF2CF7','MongoDB','unpublished',NULL,'2017-07-21 15:42:01',NULL,NULL,'2017-07-26 16:17:02',NULL,'type-2',NULL,NULL,'fore',0,0),
('7387DB584EDB44A79256123617624119','0','一级目录w','published',NULL,'2017-07-22 23:56:44',NULL,'3kb','2017-07-26 16:09:06',NULL,NULL,NULL,NULL,'是',0,0),
('75C8055958C84943A991A16D0E2AFBF2','345E0CB9E91545CF89849AC24ECF2CF7','武昌分局','unpublished',NULL,'2017-07-21 15:29:45',NULL,NULL,'2017-07-26 16:16:51',NULL,NULL,NULL,NULL,NULL,0,0),
('7D3A5784142847D59056F6F00D923F82','2F19EF19BAFC4899BA5919F53BE86D7F','yourfile','unpublished','inside,mobile','2017-07-20 16:26:54',NULL,NULL,'2017-07-26 16:16:39',NULL,NULL,NULL,NULL,NULL,0,1),
('83D0135C57B34F99AEA45CD4F2785E5C','64B7D075EC8643DE83125D468A5AA029','李四','published','outside,mobile','2017-07-23 00:28:52',NULL,NULL,'2017-07-26 16:16:13',NULL,'的金佛山',NULL,NULL,NULL,0,1),
('8CEA04C61437440384763CB6E86F3329','345E0CB9E91545CF89849AC24ECF2CF7','青山分局','unpublished',NULL,'2017-07-21 15:39:21',NULL,NULL,'2017-07-26 16:17:02',NULL,NULL,NULL,NULL,NULL,0,0),
('93A68F3945A54057911182D35BA9F91E','7387DB584EDB44A79256123617624119','奋不顾身','published',NULL,'2017-07-23 00:00:00',NULL,NULL,'2017-07-26 16:09:06',NULL,NULL,NULL,NULL,'否',0,0),
('A30C7F9A6EB4409E9CFB753EE4A97368','345E0CB9E91545CF89849AC24ECF2CF7','上帝莫言','unpublished','outside','2017-07-21 15:43:21',NULL,NULL,'2017-07-26 16:17:02',NULL,'666',NULL,NULL,'是',0,1),
('A4FF1612C92E4E4FA5642EE392F07F1F','345E0CB9E91545CF89849AC24ECF2CF7','MySQL','unpublished',NULL,'2017-07-21 15:43:44',NULL,NULL,'2017-07-26 16:17:02',NULL,'type-1',NULL,NULL,NULL,0,0),
('A62BD43AA7A04AF3A190E00B058E2656','377C4A227A17469CB457C156074109CF','aaa','unpublished',NULL,'2017-07-21 15:44:29',NULL,NULL,'2017-07-26 16:06:50',NULL,'颜色',NULL,NULL,NULL,0,0),
('C3E774ED791C40D39B08EA1DC975A50E','2F19EF19BAFC4899BA5919F53BE86D7F','圣诞快乐','unpublished',NULL,'2017-07-21 15:28:40',NULL,NULL,'2017-07-26 16:16:51',NULL,'111',NULL,NULL,NULL,0,0),
('C81CE4440B5C441B966840FBB9F5DEF0','36ED63AF68C94978A7E42068AE53B67E','武昌分局','unpublished',NULL,'2017-07-21 15:37:07',NULL,NULL,'2017-07-26 16:16:51',NULL,NULL,NULL,NULL,NULL,0,0),
('C9F18652D74149BF9F484CB83B548014','36ED63AF68C94978A7E42068AE53B67E','光谷分局','unpublished',NULL,'2017-07-21 15:37:30',NULL,NULL,'2017-07-26 16:16:51',NULL,'啥',NULL,NULL,NULL,0,0),
('D22AE3871DBC4029BE93455F1C3347CD','36ED63AF68C94978A7E42068AE53B67E','青山分局','unpublished',NULL,'2017-07-21 15:44:00',NULL,NULL,'2017-07-26 16:17:02',NULL,'青山',NULL,NULL,NULL,0,0),
('D5D5D45A136B40AD8F0068B9508E9190','345E0CB9E91545CF89849AC24ECF2CF7','收到货了会计法','unpublished',NULL,'2017-07-21 15:41:00',NULL,'进行中','2017-07-26 16:17:02',NULL,'55',NULL,NULL,'看清',0,0),
('D6251014023F41ADB7DAE942F15A9CB0','345E0CB9E91545CF89849AC24ECF2CF7','display','published',NULL,'2017-07-23 00:01:46',NULL,NULL,'2017-07-26 16:09:06',NULL,NULL,NULL,NULL,NULL,0,0),
('E0A2EC8E3E0B456DB06B0FD3F492E0E9','2F19EF19BAFC4899BA5919F53BE86D7F','keep2','unpublished',NULL,'2017-07-21 15:28:32',NULL,NULL,'2017-07-26 16:16:39',NULL,'--',NULL,NULL,'否',0,0),
('E2517D90B51042EC8F9ADE85E9C4680F','345E0CB9E91545CF89849AC24ECF2CF7','江汉分局','unpublished',NULL,'2017-07-21 15:38:51',NULL,NULL,'2017-07-26 16:17:02',NULL,NULL,NULL,NULL,NULL,0,0),
('E8C6F41EE7E0482486A77F9D2C52A1AB','36ED63AF68C94978A7E42068AE53B67E','光谷分局','unpublished',NULL,'2017-07-21 15:30:50',NULL,NULL,'2017-07-26 16:16:51',NULL,NULL,NULL,NULL,NULL,0,0),
('F70585F549E245AD9CBBB6A021230D6D','345E0CB9E91545CF89849AC24ECF2CF7','四大行费立刻就','unpublished',NULL,'2017-07-21 15:29:26',NULL,NULL,'2017-07-26 16:16:51',NULL,NULL,NULL,NULL,NULL,0,0),
('FDCFF46D8D3B4063837F25A368F53873','2F19EF19BAFC4899BA5919F53BE86D7F','myfile','unpublished',NULL,'2017-07-20 16:40:54',NULL,NULL,'2017-07-26 16:16:39',NULL,NULL,NULL,NULL,NULL,0,1);

/*Table structure for table `rmc_catalog_res` */

DROP TABLE IF EXISTS `rmc_catalog_res`;

CREATE TABLE `rmc_catalog_res` (
  `id` varchar(32) NOT NULL COMMENT '主键ID',
  `catalog_id` varchar(32) DEFAULT NULL COMMENT '目录ID',
  `res_id` varchar(32) DEFAULT NULL COMMENT '资源ID',
  `create_date` datetime DEFAULT NULL COMMENT '编目时间',
  `creator_id` varchar(32) DEFAULT NULL COMMENT '编目人ID',
  `creator` varchar(30) DEFAULT NULL COMMENT '编目人姓名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `rmc_catalog_res` */

insert  into `rmc_catalog_res`(`id`,`catalog_id`,`res_id`,`create_date`,`creator_id`,`creator`) values 
('18227759E5924E4EA9BF25418D56E63D','EC6CA7F2325245E8A11C78443C1977E3','3','2017-07-18 15:04:31',NULL,NULL),
('2A021517C7D24B1A9C15B02AF5A5BFE3','2F19EF19BAFC4899BA5919F53BE86D7F','4','2017-07-17 14:02:28',NULL,NULL),
('62EF688D1A774887BDA7197BE5E4BEDF','FDCFF46D8D3B4063837F25A368F53873','2','2017-07-21 09:50:51',NULL,NULL),
('6310EE884E4F4D95AB0D7AAA9853D675','E7778A340D9B4CB2BF7B011094041AFB','2','2017-07-20 11:05:19',NULL,NULL),
('83947F450D30439C8E4C7AD8C0B8A3C3','0','3','2017-07-17 14:01:11',NULL,NULL),
('9B6C752C629B4645BBF259E055310927','EC6CA7F2325245E8A11C78443C1977E3','2','2017-07-18 15:04:31',NULL,NULL),
('ACBB736331404786BE4BE2FE8DED7EFC','','4','2017-07-17 13:52:53',NULL,NULL),
('BEEB4DCE99A84BCC9105FF79690EFD09','EC6CA7F2325245E8A11C78443C1977E3','1','2017-07-18 15:04:31',NULL,NULL),
('D4576804589C4640875965C2599F8DF7','','2','2017-07-17 13:41:36',NULL,NULL),
('D640F480D65B4FDC986BC23131546230','2F19EF19BAFC4899BA5919F53BE86D7F','3','2017-07-17 14:06:52',NULL,NULL),
('D7688A1E57DF4E2B881047C95D8CC404','FDCFF46D8D3B4063837F25A368F53873','4','2017-07-21 09:50:51',NULL,NULL),
('E74540692A3C4C00A533B9E400940A7E','E7778A340D9B4CB2BF7B011094041AFB','1','2017-07-20 11:05:19',NULL,NULL);

/*Table structure for table `rmc_detail_attachment` */

DROP TABLE IF EXISTS `rmc_detail_attachment`;

CREATE TABLE `rmc_detail_attachment` (
  `id` varchar(32) NOT NULL COMMENT '主键',
  `apply_detail_id` varchar(32) DEFAULT NULL COMMENT '申请详细信息ID',
  `attached_type` varchar(20) DEFAULT NULL COMMENT '附件类型',
  `url` varchar(200) DEFAULT NULL COMMENT '附件URL',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `rmc_detail_attachment` */

/*Table structure for table `rmc_release` */

DROP TABLE IF EXISTS `rmc_release`;

CREATE TABLE `rmc_release` (
  `id` varchar(32) NOT NULL COMMENT '主键ID',
  `release_type` varchar(20) DEFAULT NULL COMMENT '发布类型:数据/文件/GIS',
  `rls_property_id` varchar(32) DEFAULT NULL COMMENT '此发布的属性信息ID',
  `description` varchar(500) DEFAULT NULL COMMENT '此发布的描述信息',
  `release_status` varchar(20) DEFAULT NULL COMMENT '发布状态: 成功/失败',
  `need_audit` int(11) DEFAULT '0' COMMENT '是否需要审核',
  `audit_status` varchar(20) DEFAULT NULL COMMENT '审核状态:待审核/通过/不通过',
  `audit_date` datetime DEFAULT NULL COMMENT '审核时间',
  `auditor_id` varchar(32) DEFAULT NULL COMMENT '审核人ID',
  `auditor` varchar(30) DEFAULT NULL COMMENT '审核人姓名',
  `audit_opinion` varchar(500) DEFAULT NULL COMMENT '审核意见',
  `create_date` datetime DEFAULT NULL COMMENT '发布时间',
  `creator_id` varchar(32) DEFAULT NULL COMMENT '发布人ID',
  `creator` varchar(30) DEFAULT NULL COMMENT '发布人姓名',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `updater_id` varchar(32) DEFAULT NULL COMMENT '更新人ID',
  `updater` varchar(30) DEFAULT NULL COMMENT '更新人姓名',
  `is_delete` int(11) DEFAULT '0' COMMENT '是否已删除',
  `delete_date` datetime DEFAULT NULL COMMENT '删除时间',
  `deleter_id` varchar(32) DEFAULT NULL COMMENT '删除人ID',
  `deleter` varchar(30) DEFAULT NULL COMMENT '删除人姓名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `rmc_release` */

/*Table structure for table `rmc_res_authority` */

DROP TABLE IF EXISTS `rmc_res_authority`;

CREATE TABLE `rmc_res_authority` (
  `id` varchar(32) NOT NULL COMMENT '主键ID',
  `source_type` varchar(20) DEFAULT NULL COMMENT '权限来源:授权/申请',
  `apply_id` varchar(32) DEFAULT NULL COMMENT '申请记录ID:当权限来源为授权时无效',
  `res_id` varchar(32) DEFAULT NULL COMMENT '资源ID',
  `target_type` varchar(20) DEFAULT NULL COMMENT '授权对象类型:人/角色/机构',
  `target_id` varchar(32) DEFAULT NULL COMMENT '授权对象ID:用户ID/角色ID/机构ID',
  `valid_from` datetime DEFAULT NULL COMMENT '有效期开始时间',
  `valid_to` datetime DEFAULT NULL COMMENT '有效期结束时间',
  `use_count_limit` int(11) DEFAULT '0' COMMENT '是否启用使用次数限制',
  `granted_count` int(11) DEFAULT NULL COMMENT '已授权的使用次数:当不启用使用次数限制时无效',
  `used_count` int(11) DEFAULT NULL COMMENT '已使用次数:当不启用使用次数限制时无效',
  `use_region_limit` int(11) DEFAULT '0' COMMENT '是否启用区域限制',
  `east_longitude` double DEFAULT NULL COMMENT '东经:当不启用区域限制时无效',
  `west_longitude` double DEFAULT NULL COMMENT '西经:当不启用区域限制时无效',
  `south_latitude` double DEFAULT NULL COMMENT '南纬:当不启用区域限制时无效',
  `north_latitude` double DEFAULT NULL COMMENT '北纬:当不启用区域限制时无效',
  `can_update` int(11) DEFAULT '0' COMMENT '是否有编辑权限',
  `authorizer_id` varchar(32) DEFAULT NULL COMMENT '授权人ID:当权限来源为授权时无效',
  `authorizer` varchar(30) DEFAULT NULL COMMENT '授权人姓名:当权限来源为授权时无效',
  `authorize_date` datetime DEFAULT NULL COMMENT '授权时间:当权限来源为授权时无效',
  `is_valid` int(11) DEFAULT '1' COMMENT '是否有效:启用/停用',
  `is_delete` int(11) DEFAULT '0' COMMENT '是否已删除',
  `delete_date` datetime DEFAULT NULL COMMENT '删除时间',
  `deleter_id` varchar(32) DEFAULT NULL COMMENT '删除人ID',
  `deleter` varchar(30) DEFAULT NULL COMMENT '删除人姓名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `rmc_res_authority` */

insert  into `rmc_res_authority`(`id`,`source_type`,`apply_id`,`res_id`,`target_type`,`target_id`,`valid_from`,`valid_to`,`use_count_limit`,`granted_count`,`used_count`,`use_region_limit`,`east_longitude`,`west_longitude`,`south_latitude`,`north_latitude`,`can_update`,`authorizer_id`,`authorizer`,`authorize_date`,`is_valid`,`is_delete`,`delete_date`,`deleter_id`,`deleter`) values 
('BE9AE5C3FEF640F78DD7FCF612C395EB','authorize',NULL,'1','user','123','2017-01-01 00:00:00','2017-01-02 00:00:00',1,1,NULL,1,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,0,0,NULL,NULL,NULL);

/*Table structure for table `rmc_res_data_property` */

DROP TABLE IF EXISTS `rmc_res_data_property`;

CREATE TABLE `rmc_res_data_property` (
  `id` varchar(32) NOT NULL COMMENT '主键ID',
  `description` varchar(500) DEFAULT NULL COMMENT '描述信息',
  `can_insert` int(11) DEFAULT '0' COMMENT '是否可插入',
  `can_update` int(11) DEFAULT '0' COMMENT '是否可更新',
  `can_delete` int(11) DEFAULT '0' COMMENT '是否可删除',
  `max_row_count` int(11) DEFAULT NULL COMMENT '允许的最大行数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `rmc_res_data_property` */

insert  into `rmc_res_data_property`(`id`,`description`,`can_insert`,`can_update`,`can_delete`,`max_row_count`) values 
('25B888A9F8C34ACC81933D61F48B9B09','范德萨',0,0,0,10),
('9EE128B4E6054639B177E8C6C4ED4905','aa',0,0,0,11),
('A4DC73DB3CC7437392E581DC73F9CB0F','范德萨',0,0,0,10),
('B14F3E74567846138A7FD11F6F9EC789','范德萨',1,1,1,100000);

/*Table structure for table `rmc_res_file_property` */

DROP TABLE IF EXISTS `rmc_res_file_property`;

CREATE TABLE `rmc_res_file_property` (
  `id` varchar(32) NOT NULL COMMENT '主键ID',
  `description` varchar(500) DEFAULT NULL COMMENT '描述信息',
  `max_dir_count` int(11) DEFAULT NULL COMMENT '允许最多可创建目录的数量',
  `max_file_count` int(11) DEFAULT NULL COMMENT '允许最多可创建文件的数量',
  `max_file_size` int(11) DEFAULT NULL COMMENT '允许一个单文件最大的文件大小',
  `max_content_size` int(11) DEFAULT NULL COMMENT '允许最多一共可创建文件的文件大小',
  `can_create_dir` int(11) DEFAULT '0' COMMENT '是否可创建目录',
  `can_delete_dir` int(11) DEFAULT '0' COMMENT '是否可删除文件',
  `can_create_file` int(11) DEFAULT '0' COMMENT '是否可创建文件',
  `can_delete_file` int(11) DEFAULT '0' COMMENT '是否可删除文件',
  `can_rename_dir` int(11) DEFAULT '0' COMMENT '是否可对目录重命名',
  `can_rename_file` int(11) DEFAULT '0' COMMENT '是否可对文件重命名',
  `can_share_dir` int(11) DEFAULT '0' COMMENT '是否可分享目录',
  `can_share_file` int(11) DEFAULT '0' COMMENT '是否可分享文件',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `rmc_res_file_property` */

insert  into `rmc_res_file_property`(`id`,`description`,`max_dir_count`,`max_file_count`,`max_file_size`,`max_content_size`,`can_create_dir`,`can_delete_dir`,`can_create_file`,`can_delete_file`,`can_rename_dir`,`can_rename_file`,`can_share_dir`,`can_share_file`) values 
('A6265DA0022A4581AF6AF7A6041E50C3','1',10,1,1,1,1,1,0,0,1,1,1,0),
('E2956D19E0244623A4C61B05D6C92D42','111',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `rmc_res_gis_property` */

DROP TABLE IF EXISTS `rmc_res_gis_property`;

CREATE TABLE `rmc_res_gis_property` (
  `id` varchar(32) NOT NULL COMMENT '主键ID',
  `description` varchar(500) DEFAULT NULL COMMENT '资源描述信息',
  `service_type` varchar(50) DEFAULT NULL COMMENT '服务类型',
  `service_version` varchar(20) DEFAULT NULL COMMENT '服务类型版本',
  `layer_name` varchar(50) DEFAULT NULL COMMENT '图层名称',
  `east_longitude` double DEFAULT NULL COMMENT '东经',
  `west_longitude` double DEFAULT NULL COMMENT '西经',
  `south_latitude` double DEFAULT NULL COMMENT '南纬',
  `north_latitude` double DEFAULT NULL COMMENT '北纬',
  `layer_order_num` int(11) DEFAULT NULL COMMENT '图层叠加顺序',
  `min_blc` varchar(50) DEFAULT NULL COMMENT '最小比例尺',
  `max_blc` varchar(50) DEFAULT NULL COMMENT '最大比例尺',
  `zbczx` varchar(50) DEFAULT NULL COMMENT '坐标参照系',
  `blcfm` int(11) DEFAULT NULL COMMENT '比例尺分母',
  `tycs` varchar(50) DEFAULT NULL COMMENT '投影参数',
  `gcjz` varchar(50) DEFAULT NULL COMMENT '高程基数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `rmc_res_gis_property` */

insert  into `rmc_res_gis_property`(`id`,`description`,`service_type`,`service_version`,`layer_name`,`east_longitude`,`west_longitude`,`south_latitude`,`north_latitude`,`layer_order_num`,`min_blc`,`max_blc`,`zbczx`,`blcfm`,`tycs`,`gcjz`) values 
('59DDD62BB01844639ACC29C252BDE7CD','1','1','1','1',1,1,1,1,1,'1','1','1',1,'1','1'),
('70329B7BE1064B9CBCB11119886498DA','1','1','1','1',1,1,1,1,1,'1','1','1',1,'1','1'),
('79FBFB146F484AAA96513D40D12881E9','80','1','90','2',10,3,11,4,12,'5','13','6',14,'7','15'),
('7D2284AD1D60403986DC1D6A6A7AF316','broad','AAA','9040','2',10,3,11,4,12,'5','13','6',14,'7','15'),
('8E48A19DD0874FB2BDBFE585D2B582B4','10','3','11','4',12,5,14,6,12,'7','14','8',12,'9','11'),
('92AF3042DA3149F5A53BD9D9EF0ABB3F','8','1','9','2',10,3,11,4,12,'5','13','6',14,'7','15'),
('9F95AE29F44D4368964ECCDE3271ACC1','9','2','10','3',11,4,12,5,13,'6','14','7',15,'8','16');

/*Table structure for table `rmc_res_metadata` */

DROP TABLE IF EXISTS `rmc_res_metadata`;

CREATE TABLE `rmc_res_metadata` (
  `id` varchar(32) NOT NULL COMMENT '主键ID',
  `keywords` varchar(200) DEFAULT NULL COMMENT '关键字',
  `domain` varchar(50) DEFAULT NULL COMMENT '领域',
  `secret_level` varchar(50) DEFAULT NULL COMMENT '保密级别',
  `theme_type` varchar(50) DEFAULT NULL COMMENT '主题分类',
  `published_date` datetime DEFAULT NULL COMMENT '发布时间',
  `update_frequency` varchar(50) DEFAULT NULL COMMENT '更新频率',
  `company_name` varchar(100) DEFAULT NULL COMMENT '单位名称',
  `company_address` varchar(100) DEFAULT NULL COMMENT '单位地址',
  `company_owner` varchar(20) DEFAULT NULL COMMENT '单位责任人',
  `company_phone` varchar(13) DEFAULT NULL COMMENT '单位电话',
  `company_fax` varchar(20) DEFAULT NULL COMMENT '单位传真',
  `company_url` varchar(200) DEFAULT NULL COMMENT '单位网址',
  `company_email` varchar(100) DEFAULT NULL COMMENT '单位邮箱',
  `company_country` varchar(50) DEFAULT NULL COMMENT '国家',
  `company_province` varchar(50) DEFAULT NULL COMMENT '省份',
  `company_city` varchar(50) DEFAULT NULL COMMENT '城市',
  `description` varchar(500) DEFAULT NULL COMMENT '资源的描述信息',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `rmc_res_metadata` */

insert  into `rmc_res_metadata`(`id`,`keywords`,`domain`,`secret_level`,`theme_type`,`published_date`,`update_frequency`,`company_name`,`company_address`,`company_owner`,`company_phone`,`company_fax`,`company_url`,`company_email`,`company_country`,`company_province`,`company_city`,`description`) values 
('03CBF1347827400E9587EA151CDB1593','','','','',NULL,NULL,'','','','','','','','','','',''),
('051FAF05517344648F5873944295161A','4','4','4','4',NULL,NULL,'4','4','4','4','4','4','4','4','4','4','4'),
('17E1EA9F8D284F9A9B54609C713F1351','21','3','21','3',NULL,NULL,'21','33','21','3','21','3','2','3','3','3','3'),
('1A0D21CAB7BA44B6BF05CAC19364FF71','1','1','1','1',NULL,NULL,'1','1','1','1','1','1','','1','1','','1'),
('1C0D540385AB4CD190FCEC3BC4426388','3','3','3','3',NULL,NULL,'33','3','3','18507108471','3','3','test@163.com','3','3','3','3'),
('1C9B52C9B69B4A8F924F6074BDA3486B','2','2','2','2',NULL,NULL,'22','2','2','2','2','2','2','2','2','2','2'),
('202CBCCC4AD3424FAE1F2DD11B0E5466','','','','',NULL,NULL,'','','','','','','','','','',''),
('204A0DB4C7944BD68F42F3FB1A528819','','','','',NULL,NULL,'','','','','','','','','','',''),
('21705EF446DE4998839DC9E8F0B1765F','','','','',NULL,NULL,'','','','','','','','','','',''),
('24C9219E33C74E91AEBF21C4547381A9','郭芙',NULL,NULL,NULL,NULL,NULL,'aasir',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,''),
('25E73E7582CD461494C47A68BF34D7E8','1','1','1','1',NULL,NULL,'1','1','1','1','1','1','','1','1','1','1'),
('2CE6D67EFC18451BA47BC35C3BC28823','','','','',NULL,NULL,'','','','','','','','','','',''),
('36FB383C2B544A6FA9239941625DD257','4','4','4','4',NULL,NULL,'4','4','4','4','4','4','4','4','4','4','4'),
('3E36F9BF8CFE4CA7B90378D2A799D1A2','aaa','aa','aa','aa',NULL,NULL,'aa','aa','aa','aa','aa','aa','aa','aa','aa','aa','aa'),
('4CBFD1DBFE8C42EF906EBD1A9AA7E385','1','1','1','1',NULL,NULL,'1','1','1','1','1','1','','1','1','','1'),
('4E4DA937CDC54A66AC2FE302B93DE83E','','','','',NULL,NULL,'','','','','','','','','','',''),
('4E6CFFAABAD34438B69498C9D844B78F','1','1','1','1',NULL,NULL,'1','1','1','1','1','1','','1','1','','1'),
('60FC288BE0334F67AB2595ACF48EEFF7','','','','',NULL,NULL,'','','','','','','','','','',''),
('6264F70EE5C547D19071684397070851','3','3','3','3',NULL,NULL,'33','3','3','18507108471','3','3','test@163.com','3','3','3','3'),
('63B141C1445A436C8775F72953B3CF34','','','','',NULL,NULL,'','','','','','','','','','',''),
('6DCA53C6CEFC44E2AC6626809AB9FB8C','1','1','1','1',NULL,NULL,'1','1','1','1','1','1','1','中国','湖北','武汉','啊啊啊'),
('6F00EF7BCA8D48B79CE770F521291608','1','1','1','1',NULL,NULL,'1','1','1','18507108471','1','1','test@163.com','1','1','1','1'),
('6FF88DA3683D4B83A6310A33FB3F0197','',NULL,'','',NULL,'','','','','15872549525','','','test@163.com','','','',''),
('72CAB2C53691428C84D44CF345F04C08','','','','',NULL,NULL,'','','','','','','','','','',''),
('7B3B03B3E9804DCFBF32B71381B1BE3C','3','3','3','3',NULL,NULL,'33','3','3','18507108471','3','3','test@163.com','3','3','3','3'),
('7DAE8C3B0DC04421A5DEA9F834230D59','bb',NULL,'B','B','1970-01-01 08:00:00','B','bb','bb','bb','15872549525','bb','bb','test@163.com','bb','bb','bb','bb'),
('80A4112217224AAA84E9245FB876E961','',NULL,'','',NULL,'','','','','15872549525','','','test@163.com','','','',''),
('8111782A3AEA4EEC8BCBA55F528BF509','哈哈哈',NULL,NULL,NULL,NULL,NULL,'hhh',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,''),
('8505F01974DA4B919B9B16B7E52EF26D','','','','',NULL,NULL,'','','','','','','','','','',''),
('8AA99907CE774373B31C52BB4AD82846','1',NULL,'A','A','1970-01-01 08:00:00','A','1','1','1','15872549525','1','1','test@163.com','1','1','1','1'),
('8C6FEC68DEB84169B5FC19D4F9006BB0','','','','',NULL,NULL,'','','','','','','','','','',''),
('8F0298E46514440A98143DD3B1163C3F','','','','',NULL,NULL,'','','','','','','','','','',''),
('A415EE9244524599AB8C4F6D4F2EE069','3','3','3','3',NULL,NULL,'33','3','3','18507108471','3','3','test@163.com','3','3','3','3'),
('A5E259063C6048718CF493236B9F850C','3','3','3','3',NULL,NULL,'3','3','3','3','3','3','3','3','3','3','3'),
('A7108DF74B524A0B9CD076391119735D','aaa','aa','aa','aa',NULL,NULL,'aa','aa','aa','aa','aa','aa','aa','aa','aa','aa','aa'),
('AC5BEA4023AE42A9AAEFC74F7FBA5D64','3','3','3','3',NULL,NULL,'33','3','3','18507108471','3','3','test@163.com','3','3','3','3'),
('AD4585AE894F40498F0AC8F3F2508D72','','','','',NULL,NULL,'','','','','','','','','','',''),
('B5B19F9F8E2B451D80B740BFA73BC703','1','1','1','1',NULL,NULL,'1','1','1','1','1','1','','1','1','1','1'),
('BD1D42B168DA415A91F19B6E88C0F7AE','3','3','3','3',NULL,NULL,'33','3','3','18507108471','3','3','test@163.com','3','3','3','3'),
('D81B6CE01551404CA20BF0571C7E76AA','','','','',NULL,NULL,'','','','','','','','','','',''),
('D8C4B29132894D46A55F63BEAB306781','1','1','1','1',NULL,NULL,'1','1','1','1','1','1','1','1','1','1','1'),
('DC1F959B85CA40D9B577080D4B7F3722','21','3','21','3',NULL,NULL,'21','33','21','3','21','3','2','3','3','3','3'),
('DC2C261387504CE8A6F1529F02BDBA54','1','1','1','1',NULL,NULL,'1','1','1','1','1','1','','1','1','','1'),
('E124ED9FE5CF4CDFA14A21C6BD38E8CE','郭靖',NULL,NULL,NULL,NULL,NULL,'guojing',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,''),
('E8C6C6B1864241B78F32AAB15FE53B37','3','2','3','2',NULL,NULL,'3','2','3','18507108471','3','2','test@163.com','2','2','2','2'),
('E8CE02E7FFB349D0AFF285B67695D578','李四',NULL,NULL,NULL,NULL,NULL,'ceshi',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,''),
('E94C12F59B554490BD9DC5BFAB7B6BF8','吕碧成',NULL,NULL,NULL,NULL,NULL,'dgd',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,''),
('ED3E0045A2A2427D8DA20938B604C408','4','aqxy_002','4','4',NULL,NULL,'4','4','4','4','4','4','4','4','4','4','4'),
('EF09E7CAE5EE488DBC86D083C1AC2A2B','4','4','4','4',NULL,NULL,'4','4','4','4','4','4','4','4','4','4','4'),
('F0B91D2A7F2D42B5AE592F2212821B56','LUCK',NULL,NULL,NULL,NULL,'7090','AAA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,''),
('F32D0F56FF264096B2FB146D8D10380D','4','4','4','4',NULL,NULL,'4','4','4','4','4','4','4','4','4','4','4'),
('F7CD2CEB33CA4D72BD15D341DDDCD43B','1','1','1','1',NULL,NULL,'1','1','1','1','1','1','','1','1','','1');

/*Table structure for table `rmc_res_oper_log` */

DROP TABLE IF EXISTS `rmc_res_oper_log`;

CREATE TABLE `rmc_res_oper_log` (
  `id` varchar(32) NOT NULL COMMENT '主键ID',
  `res_id` varchar(32) DEFAULT NULL COMMENT '资源ID',
  `oper_type` varchar(20) DEFAULT NULL COMMENT '操作类型:注册/发布/审核',
  `description` varchar(500) DEFAULT NULL COMMENT '操作描述信息',
  `operate_date` datetime DEFAULT NULL COMMENT '操作时间',
  `operator_id` varchar(32) DEFAULT NULL COMMENT '操作人ID',
  `operator` varchar(30) DEFAULT NULL COMMENT '操作人姓名',
  `operator_ip` varchar(50) DEFAULT NULL COMMENT '操作人IP',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `rmc_res_oper_log` */

insert  into `rmc_res_oper_log`(`id`,`res_id`,`oper_type`,`description`,`operate_date`,`operator_id`,`operator`,`operator_ip`) values 
('001294C3B7B646C790161BE907BF4A40','2','registry','wangwu:2','2017-07-27 16:40:49','3','王五','192.168.0.3'),
('0234F3AC38524DEB9FE102E0FEF1B668','1BF2A7B347DC4FD784AC377373AE07CD','audit','wangwu:1BF2A7B347DC4FD784AC377373AE07CD','2017-07-27 16:40:49','3','王五','192.168.0.3'),
('02A8CB0477E547A1A184D8D365D95F51','3','registry','wangwu:3','2017-07-27 16:40:49','3','王五','192.168.0.3'),
('04F8700D19FE4216B72AD2FA912652B7','1BF2A7B347DC4FD784AC377373AE07CD','audit','zhaoliu:1BF2A7B347DC4FD784AC377373AE07CD','2017-07-27 16:40:49','4','赵六','192.168.0.4'),
('056B61EF76EB4CFA97BD3317756F2977','32ABC9B38A274FDE86E8F17444C858D0','audit','qianqi:32ABC9B38A274FDE86E8F17444C858D0','2017-07-27 16:40:49','5','钱七','192.168.0.5'),
('0777440172424B92A4DDD40E4101FE21','3','release','wangwu:3','2017-07-27 16:40:49','3','王五','192.168.0.3'),
('08A1E84FEB8D48EB9E45E6B057F868EC','1BF2A7B347DC4FD784AC377373AE07CD','registry','zhaoliu:1BF2A7B347DC4FD784AC377373AE07CD','2017-07-27 16:40:50','4','赵六','192.168.0.4'),
('0DF3B3926F124DCA88843DC82AABCF7A','3','registry','qianqi:3','2017-07-27 16:40:49','5','钱七','192.168.0.5'),
('0FBFEC152ACB4770836D6E886D65DDC5','3','release','qianqi:3','2017-07-27 16:40:49','5','钱七','192.168.0.5'),
('11F42367F16747838E3E323EDF69E89E','2','registry','qianqi:2','2017-07-27 16:40:50','5','钱七','192.168.0.5'),
('131883B221EE40A98AFB572331806622','1BF2A7B347DC4FD784AC377373AE07CD','registry','zhangsan:1BF2A7B347DC4FD784AC377373AE07CD','2017-07-27 16:40:49','1','张三','192.168.0.1'),
('140CFAD7CDA04FBE93E47A02B4A3B6EB','1BF2A7B347DC4FD784AC377373AE07CD','registry','qianqi:1BF2A7B347DC4FD784AC377373AE07CD','2017-07-27 16:40:49','5','钱七','192.168.0.5'),
('15DFD5B542814D6B958FA59B59470E45','1BF2A7B347DC4FD784AC377373AE07CD','release','zhangsan:1BF2A7B347DC4FD784AC377373AE07CD','2017-07-27 16:40:49','1','张三','192.168.0.1'),
('17AC6830932D440CBD26DAAC1580C73F','1BF2A7B347DC4FD784AC377373AE07CD','audit','qianqi:1BF2A7B347DC4FD784AC377373AE07CD','2017-07-27 16:40:49','5','钱七','192.168.0.5'),
('1895AE5509C2442A9FD1288A98243238','1BF2A7B347DC4FD784AC377373AE07CD','audit','zhangsan:1BF2A7B347DC4FD784AC377373AE07CD','2017-07-27 16:40:49','1','张三','192.168.0.1'),
('190B765A6A0E473DBA82B814740B6D4F','32ABC9B38A274FDE86E8F17444C858D0','release','qianqi:32ABC9B38A274FDE86E8F17444C858D0','2017-07-27 16:40:49','5','钱七','192.168.0.5'),
('193859BF026C4F0D9FF2B20D981B3F2D','3','registry','qianqi:3','2017-07-27 16:40:49','5','钱七','192.168.0.5'),
('19A1C6433206410CA6157951DBB55065','3','registry','wangwu:3','2017-07-27 16:40:49','3','王五','192.168.0.3'),
('19E9B249C23F4E4797D7370B76CE8D86','1','registry','qianqi:1','2017-07-27 16:40:49','5','钱七','192.168.0.5'),
('1A76E0955F3044019F87DC0C39241916','1BF2A7B347DC4FD784AC377373AE07CD','registry','lisi:1BF2A7B347DC4FD784AC377373AE07CD','2017-07-27 16:40:50','2','李四','192.168.0.2'),
('1B04BB4AA55B4797B463DD35348C9E9F','1','registry','qianqi:1','2017-07-27 16:40:50','5','钱七','192.168.0.5'),
('1B198228C3594EA3A36299B576E494E5','1','registry','zhaoliu:1','2017-07-27 16:40:49','4','赵六','192.168.0.4'),
('1CBF0E7055724355B680E9C4F937BFA1','3','audit','zhangsan:3','2017-07-27 16:40:50','1','张三','192.168.0.1'),
('2060B36072874B7294DFE94EB9CC684B','32ABC9B38A274FDE86E8F17444C858D0','audit','qianqi:32ABC9B38A274FDE86E8F17444C858D0','2017-07-27 16:40:50','5','钱七','192.168.0.5'),
('2201A54F499C4C35A155E2872589E425','1','release','zhangsan:1','2017-07-27 16:40:49','1','张三','192.168.0.1'),
('227E29B99D554464A28E858FC68D907B','2','registry','zhaoliu:2','2017-07-27 16:40:49','4','赵六','192.168.0.4'),
('22E39DF6A98B44059A54509BF62E1A0F','3','release','wangwu:3','2017-07-27 16:40:50','3','王五','192.168.0.3'),
('251648F697CC4B15AEC8FD78BCFCB56F','2','registry','lisi:2','2017-07-27 16:40:50','2','李四','192.168.0.2'),
('26E10924561A49CCBFE7826040C665FD','2','audit','wangwu:2','2017-07-27 16:40:49','3','王五','192.168.0.3'),
('275D7FB58F8B4E959AE6190CABAD296A','1','release','lisi:1','2017-07-27 16:40:49','2','李四','192.168.0.2'),
('2920AFEF500C4ABAA44C49259045F8C4','1','registry','wangwu:1','2017-07-27 16:40:49','3','王五','192.168.0.3'),
('29CE6C3DBDD841A9B0E1CE72B2AE8F07','1BF2A7B347DC4FD784AC377373AE07CD','release','lisi:1BF2A7B347DC4FD784AC377373AE07CD','2017-07-27 16:40:49','2','李四','192.168.0.2'),
('2B7F3C8C8CB3412B9CD5210B89F6ED3F','3','release','qianqi:3','2017-07-27 16:40:49','5','钱七','192.168.0.5'),
('2C57010D3B8043CFA98F44B864B1ED12','3','release','lisi:3','2017-07-27 16:40:49','2','李四','192.168.0.2'),
('2CFE6878802A4FB782559B9B2D597037','1','audit','zhaoliu:1','2017-07-27 16:40:50','4','赵六','192.168.0.4'),
('2D312CD0B31C4B08BDBE9B58433260BC','32ABC9B38A274FDE86E8F17444C858D0','audit','zhaoliu:32ABC9B38A274FDE86E8F17444C858D0','2017-07-27 16:40:49','4','赵六','192.168.0.4'),
('2DFFCC925D6A40E1872C6671D985C60F','3','release','zhaoliu:3','2017-07-27 16:40:49','4','赵六','192.168.0.4'),
('2FAE0A6561DF4208BD5E93F69085F115','2','registry','qianqi:2','2017-07-27 16:40:50','5','钱七','192.168.0.5'),
('3187FAF50DE2401D96D83F694856187E','1','release','qianqi:1','2017-07-27 16:40:49','5','钱七','192.168.0.5'),
('334A0EED72274CC4BF5D0B360940296F','2','audit','zhaoliu:2','2017-07-27 16:40:49','4','赵六','192.168.0.4'),
('3578557B3B954ECAAFA6B0DF84F05B17','1BF2A7B347DC4FD784AC377373AE07CD','audit','qianqi:1BF2A7B347DC4FD784AC377373AE07CD','2017-07-27 16:40:49','5','钱七','192.168.0.5'),
('3BA34E62C5E54EFD80638988F84411D1','3','registry','zhaoliu:3','2017-07-27 16:40:49','4','赵六','192.168.0.4'),
('3C37436C0F934044B89519D79AD7DAAD','32ABC9B38A274FDE86E8F17444C858D0','audit','zhangsan:32ABC9B38A274FDE86E8F17444C858D0','2017-07-27 16:40:50','1','张三','192.168.0.1'),
('3D765EEAA2134C298C524211C18035EC','3','registry','zhaoliu:3','2017-07-27 16:40:49','4','赵六','192.168.0.4'),
('3DDB568F8EC64C9894ED2CC281FB8C0B','32ABC9B38A274FDE86E8F17444C858D0','registry','wangwu:32ABC9B38A274FDE86E8F17444C858D0','2017-07-27 16:40:50','3','王五','192.168.0.3'),
('4031C7EBED5F4A20B23BF0A2E5519A4D','3','release','zhangsan:3','2017-07-27 16:40:49','1','张三','192.168.0.1'),
('42C8BB24AD754BA9918CE86F78F30CA4','1BF2A7B347DC4FD784AC377373AE07CD','release','lisi:1BF2A7B347DC4FD784AC377373AE07CD','2017-07-27 16:40:49','2','李四','192.168.0.2'),
('43028C68152F47C990968B59E66572B3','1BF2A7B347DC4FD784AC377373AE07CD','audit','zhaoliu:1BF2A7B347DC4FD784AC377373AE07CD','2017-07-27 16:40:49','4','赵六','192.168.0.4'),
('43B1340344CD4E4DB4B1B3E27C3C983A','3','registry','qianqi:3','2017-07-27 16:40:50','5','钱七','192.168.0.5'),
('43C845B690FC45F0844DC7309B2A5D60','3','registry','zhaoliu:3','2017-07-27 16:40:49','4','赵六','192.168.0.4'),
('440D872645DC4EEEAEEE7B3BA0A46443','1','registry','lisi:1','2017-07-27 16:40:49','2','李四','192.168.0.2'),
('4429EAE71AD5446DBEB59ABD20FC52CA','3','registry','qianqi:3','2017-07-27 16:40:49','5','钱七','192.168.0.5'),
('44A2297532534181853D3A89147E621B','2','audit','zhangsan:2','2017-07-27 16:40:49','1','张三','192.168.0.1'),
('466CF69A93EE456C84D3D58B3F1DF06B','1BF2A7B347DC4FD784AC377373AE07CD','audit','wangwu:1BF2A7B347DC4FD784AC377373AE07CD','2017-07-27 16:40:49','3','王五','192.168.0.3'),
('46BC14BA031B421683940A87F0A5AA70','1BF2A7B347DC4FD784AC377373AE07CD','release','zhaoliu:1BF2A7B347DC4FD784AC377373AE07CD','2017-07-27 16:40:49','4','赵六','192.168.0.4'),
('48ADFC5DC4544DB9AD3647A2D135ADA1','3','audit','qianqi:3','2017-07-27 16:40:49','5','钱七','192.168.0.5'),
('4B084DC639C34744AC7849560E21E7E8','3','audit','zhangsan:3','2017-07-27 16:40:49','1','张三','192.168.0.1'),
('4D04129F546F4A4FBA6E62DB1CBB224F','1BF2A7B347DC4FD784AC377373AE07CD','release','lisi:1BF2A7B347DC4FD784AC377373AE07CD','2017-07-27 16:40:49','2','李四','192.168.0.2'),
('4E441AF330CD457DBDDA64090D3C0A0C','32ABC9B38A274FDE86E8F17444C858D0','audit','zhangsan:32ABC9B38A274FDE86E8F17444C858D0','2017-07-27 16:40:50','1','张三','192.168.0.1'),
('4F829D92FDB8418FBD809C4D3AE20343','1','release','zhangsan:1','2017-07-27 16:40:49','1','张三','192.168.0.1'),
('5034CBE281524CAA8A4F2C68DACD77D4','3','release','zhaoliu:3','2017-07-27 16:40:50','4','赵六','192.168.0.4'),
('5062A52D0C2445ACBEE0991E0588A13B','32ABC9B38A274FDE86E8F17444C858D0','release','qianqi:32ABC9B38A274FDE86E8F17444C858D0','2017-07-27 16:40:50','5','钱七','192.168.0.5'),
('50A091E42D024CC2BF41B2CB4D74CB32','1','release','lisi:1','2017-07-27 16:40:49','2','李四','192.168.0.2'),
('51418C93B214465F8D0D4C76AB305DBC','1BF2A7B347DC4FD784AC377373AE07CD','registry','qianqi:1BF2A7B347DC4FD784AC377373AE07CD','2017-07-27 16:40:49','5','钱七','192.168.0.5'),
('53229F0985CD4E9395C6F7A445C898E7','1','audit','qianqi:1','2017-07-27 16:40:49','5','钱七','192.168.0.5'),
('546ED4DA9F3B47649407FCC976A361FC','32ABC9B38A274FDE86E8F17444C858D0','audit','zhaoliu:32ABC9B38A274FDE86E8F17444C858D0','2017-07-27 16:40:49','4','赵六','192.168.0.4'),
('54C7E9EA3F66431CAE295176E50ECE55','32ABC9B38A274FDE86E8F17444C858D0','release','zhaoliu:32ABC9B38A274FDE86E8F17444C858D0','2017-07-27 16:40:49','4','赵六','192.168.0.4'),
('59156AEAB96542E88D037609336E003F','2','release','lisi:2','2017-07-27 16:40:49','2','李四','192.168.0.2'),
('5A6C800EE4804713A6F0FC6FE9BAA07E','32ABC9B38A274FDE86E8F17444C858D0','release','zhangsan:32ABC9B38A274FDE86E8F17444C858D0','2017-07-27 16:40:49','1','张三','192.168.0.1'),
('5B3382F0B7A24C4D97D3A45BE752A907','3','release','lisi:3','2017-07-27 16:40:49','2','李四','192.168.0.2'),
('5E52332F73334CA79C5128AF3B6BFEDC','1','release','wangwu:1','2017-07-27 16:40:49','3','王五','192.168.0.3'),
('5EB668D12CA442B3B5D800C2FF182BB1','2','audit','wangwu:2','2017-07-27 16:40:50','3','王五','192.168.0.3'),
('61427196B3D2497784C2CD1E283818DE','1','registry','lisi:1','2017-07-27 16:40:49','2','李四','192.168.0.2'),
('615B8C51A99042068D9DC85647B34929','32ABC9B38A274FDE86E8F17444C858D0','release','zhangsan:32ABC9B38A274FDE86E8F17444C858D0','2017-07-27 16:40:49','1','张三','192.168.0.1'),
('62A5432A1B4F4A0DA06739851D8078CB','3','registry','lisi:3','2017-07-27 16:40:50','2','李四','192.168.0.2'),
('6374439F00C44A8CBEA0B3D691D89DAF','32ABC9B38A274FDE86E8F17444C858D0','audit','lisi:32ABC9B38A274FDE86E8F17444C858D0','2017-07-27 16:40:49','2','李四','192.168.0.2'),
('6553DCF2F772477A97E8372EE6C06A57','1','audit','wangwu:1','2017-07-27 16:40:49','3','王五','192.168.0.3'),
('66B488B17B374E1FA44F2B8F69D9BD65','1','release','zhaoliu:1','2017-07-27 16:40:49','4','赵六','192.168.0.4'),
('684B1582D44B4F56ABD59D36A856F04C','32ABC9B38A274FDE86E8F17444C858D0','release','zhangsan:32ABC9B38A274FDE86E8F17444C858D0','2017-07-27 16:40:49','1','张三','192.168.0.1'),
('69C61914941E49D4A878603180DA253D','32ABC9B38A274FDE86E8F17444C858D0','registry','zhaoliu:32ABC9B38A274FDE86E8F17444C858D0','2017-07-27 16:40:49','4','赵六','192.168.0.4'),
('6C325A52AA5E4D5D8C9E193537165F58','3','registry','wangwu:3','2017-07-27 16:40:49','3','王五','192.168.0.3'),
('6D56C214633440CD920CA4AC4FF6E310','1','registry','wangwu:1','2017-07-27 16:40:49','3','王五','192.168.0.3'),
('6E54AB09B8304B5AA847D11EBC1009B1','3','audit','zhaoliu:3','2017-07-27 16:40:49','4','赵六','192.168.0.4'),
('6E9442B75F664DC5BBFBC542126819F4','1BF2A7B347DC4FD784AC377373AE07CD','audit','zhangsan:1BF2A7B347DC4FD784AC377373AE07CD','2017-07-27 16:40:50','1','张三','192.168.0.1'),
('6EE34472FEC5497FB6FE2CCA2E4F4291','1BF2A7B347DC4FD784AC377373AE07CD','audit','wangwu:1BF2A7B347DC4FD784AC377373AE07CD','2017-07-27 16:40:49','3','王五','192.168.0.3'),
('7233C6FFB82B49BB9AE5C7BB1F58BB72','1BF2A7B347DC4FD784AC377373AE07CD','release','zhaoliu:1BF2A7B347DC4FD784AC377373AE07CD','2017-07-27 16:40:49','4','赵六','192.168.0.4'),
('72707C04ABC9458DB73D91EC878402EC','1BF2A7B347DC4FD784AC377373AE07CD','release','zhangsan:1BF2A7B347DC4FD784AC377373AE07CD','2017-07-27 16:40:49','1','张三','192.168.0.1'),
('731057D20A6C4C038A25F1ACD133A001','1BF2A7B347DC4FD784AC377373AE07CD','audit','lisi:1BF2A7B347DC4FD784AC377373AE07CD','2017-07-27 16:40:49','2','李四','192.168.0.2'),
('75F8F701B22946D597A15836EEA8C6F6','32ABC9B38A274FDE86E8F17444C858D0','audit','lisi:32ABC9B38A274FDE86E8F17444C858D0','2017-07-27 16:40:49','2','李四','192.168.0.2'),
('764208CAF52A4F00BCF91B28C8A3A4CA','1','release','zhaoliu:1','2017-07-27 16:40:50','4','赵六','192.168.0.4'),
('7788C5A9D857471EB27A24011655E448','32ABC9B38A274FDE86E8F17444C858D0','registry','wangwu:32ABC9B38A274FDE86E8F17444C858D0','2017-07-27 16:40:49','3','王五','192.168.0.3'),
('78079DCACE6F4581B5AAD22D19A87A06','32ABC9B38A274FDE86E8F17444C858D0','release','qianqi:32ABC9B38A274FDE86E8F17444C858D0','2017-07-27 16:40:49','5','钱七','192.168.0.5'),
('783CEFD3174B4733974C3A41179584CE','2','registry','lisi:2','2017-07-27 16:40:49','2','李四','192.168.0.2'),
('7AB28C26E9D0423EA414113BEE44F3FB','32ABC9B38A274FDE86E8F17444C858D0','release','zhaoliu:32ABC9B38A274FDE86E8F17444C858D0','2017-07-27 16:40:49','4','赵六','192.168.0.4'),
('7C3438F586B34F538DCF4C193C40E77B','32ABC9B38A274FDE86E8F17444C858D0','registry','qianqi:32ABC9B38A274FDE86E8F17444C858D0','2017-07-27 16:40:50','5','钱七','192.168.0.5'),
('7C7E3491AACF4032A60E906888621C05','2','release','zhaoliu:2','2017-07-27 16:40:49','4','赵六','192.168.0.4'),
('7D68FDC7B6534252A2CD9AC9809FB336','1','audit','qianqi:1','2017-07-27 16:40:49','5','钱七','192.168.0.5'),
('7F88BAE3C023489E9DF6F2900031E244','32ABC9B38A274FDE86E8F17444C858D0','registry','zhangsan:32ABC9B38A274FDE86E8F17444C858D0','2017-07-27 16:40:49','1','张三','192.168.0.1'),
('7F932F182AA84BFBB1748B4F411BC888','1','registry','zhaoliu:1','2017-07-27 16:40:49','4','赵六','192.168.0.4'),
('8225FB31F0044D12B5FDF2FAEA251B15','32ABC9B38A274FDE86E8F17444C858D0','registry','wangwu:32ABC9B38A274FDE86E8F17444C858D0','2017-07-27 16:40:48','3','王五','192.168.0.3'),
('82FA8B7D9BC545268D54998D5597C6C9','32ABC9B38A274FDE86E8F17444C858D0','release','zhaoliu:32ABC9B38A274FDE86E8F17444C858D0','2017-07-27 16:40:49','4','赵六','192.168.0.4'),
('884A976C5CD043FCB767AEFA19FB1989','2','release','wangwu:2','2017-07-27 16:40:49','3','王五','192.168.0.3'),
('8B45C301A8684CD090FE302A26ED1A76','1','registry','zhaoliu:1','2017-07-27 16:40:50','4','赵六','192.168.0.4'),
('8C409F903B124877927EA60AE232213B','2','release','zhangsan:2','2017-07-27 16:40:50','1','张三','192.168.0.1'),
('8C562067F56F41D4A2C16DD60F105CE0','1','audit','zhaoliu:1','2017-07-27 16:40:49','4','赵六','192.168.0.4'),
('8C8399A61CDB483586257BE04F1AF3CD','3','registry','zhangsan:3','2017-07-27 16:40:49','1','张三','192.168.0.1'),
('8E1114643F5D42009A1DE24952501FFD','3','release','lisi:3','2017-07-27 16:40:49','2','李四','192.168.0.2'),
('8E98CCCCEEBD4D0A91F2DB0312DCD952','2','registry','qianqi:2','2017-07-27 16:40:49','5','钱七','192.168.0.5'),
('8F242788EEBB44F98AFFA96631C753FB','3','registry','lisi:3','2017-07-27 16:40:49','2','李四','192.168.0.2'),
('8F7B634DA1344FDFB1202171DACE9C30','2','release','zhaoliu:2','2017-07-27 16:40:49','4','赵六','192.168.0.4'),
('911F1C2254F941D3A67692CCA22B1B4F','3','audit','wangwu:3','2017-07-27 16:40:49','3','王五','192.168.0.3'),
('9442A5AFADD148629FDB70757F604530','1','registry','wangwu:1','2017-07-27 16:40:49','3','王五','192.168.0.3'),
('9627CA8C0E014EB3B828A7F3FBF8F8ED','3','registry','wangwu:3','2017-07-27 16:40:49','3','王五','192.168.0.3'),
('9631073AFBE0446493BD2298848C3159','1BF2A7B347DC4FD784AC377373AE07CD','audit','zhaoliu:1BF2A7B347DC4FD784AC377373AE07CD','2017-07-27 16:40:49','4','赵六','192.168.0.4'),
('96F8FE4ED2F84D10AC8436A3CE8E2AE2','3','release','zhaoliu:3','2017-07-27 16:40:49','4','赵六','192.168.0.4'),
('974228B7AC7347559C18FB50C73517CA','1BF2A7B347DC4FD784AC377373AE07CD','release','zhaoliu:1BF2A7B347DC4FD784AC377373AE07CD','2017-07-27 16:40:49','4','赵六','192.168.0.4'),
('989D31BCF8B64B5D9A999B951CAB56AA','32ABC9B38A274FDE86E8F17444C858D0','audit','wangwu:32ABC9B38A274FDE86E8F17444C858D0','2017-07-27 16:40:49','3','王五','192.168.0.3'),
('98D95DA3F62346BFB0F2360A2F8967DD','1','audit','qianqi:1','2017-07-27 16:40:49','5','钱七','192.168.0.5'),
('99072CE677C747B58D37A808A2F94D09','32ABC9B38A274FDE86E8F17444C858D0','registry','zhangsan:32ABC9B38A274FDE86E8F17444C858D0','2017-07-27 16:40:49','1','张三','192.168.0.1'),
('9E23E6AA7C344C079846BCC8F1B3374C','3','audit','wangwu:3','2017-07-27 16:40:49','3','王五','192.168.0.3'),
('9E5ACFF2C03B4FAF8887D8E654C76B2D','32ABC9B38A274FDE86E8F17444C858D0','audit','qianqi:32ABC9B38A274FDE86E8F17444C858D0','2017-07-27 16:40:49','5','钱七','192.168.0.5'),
('9EC9BC1CF5354B40907CC1985266EE3C','2','release','qianqi:2','2017-07-27 16:40:49','5','钱七','192.168.0.5'),
('9F8571587BBD42B7AD3F8643AC0181D3','32ABC9B38A274FDE86E8F17444C858D0','release','wangwu:32ABC9B38A274FDE86E8F17444C858D0','2017-07-27 16:40:49','3','王五','192.168.0.3'),
('A0540A3FE0CF409092CCA4B6648DAFF3','2','audit','zhangsan:2','2017-07-27 16:40:49','1','张三','192.168.0.1'),
('A117F90695E2479F85EC38AEB3630BC1','1BF2A7B347DC4FD784AC377373AE07CD','audit','zhaoliu:1BF2A7B347DC4FD784AC377373AE07CD','2017-07-27 16:40:49','4','赵六','192.168.0.4'),
('A2C45627A53249718C9AB4F2D7695EED','32ABC9B38A274FDE86E8F17444C858D0','registry','wangwu:32ABC9B38A274FDE86E8F17444C858D0','2017-07-27 16:40:50','3','王五','192.168.0.3'),
('A390FEE4E869402FAD9D76EE20563989','1','registry','wangwu:1','2017-07-27 16:40:50','3','王五','192.168.0.3'),
('A3EF38AA788141CD8840FFD7039BE503','1BF2A7B347DC4FD784AC377373AE07CD','release','zhaoliu:1BF2A7B347DC4FD784AC377373AE07CD','2017-07-27 16:40:49','4','赵六','192.168.0.4'),
('A466D6C983DA413AB4CD928869CCC218','2','release','qianqi:2','2017-07-27 16:40:50','5','钱七','192.168.0.5'),
('A5169FDFD4BE4AE08EB798F76D59C77D','2','registry','wangwu:2','2017-07-27 16:40:49','3','王五','192.168.0.3'),
('A6111E2D5A6E42C9897F045595475FE2','1BF2A7B347DC4FD784AC377373AE07CD','registry','lisi:1BF2A7B347DC4FD784AC377373AE07CD','2017-07-27 16:40:49','2','李四','192.168.0.2'),
('A7EBF635A00643AB9DC7B48E38EADA2B','1','audit','zhangsan:1','2017-07-27 16:40:49','1','张三','192.168.0.1'),
('A9BEEC55F64B4B9AB56142D1082A1249','3','audit','qianqi:3','2017-07-27 16:40:49','5','钱七','192.168.0.5'),
('AD9255E78924481DAAF2082262AE6DAD','1','release','wangwu:1','2017-07-27 16:40:49','3','王五','192.168.0.3'),
('AFD7D6811C7A4E6CAC257688C5D8FBCC','1BF2A7B347DC4FD784AC377373AE07CD','registry','zhaoliu:1BF2A7B347DC4FD784AC377373AE07CD','2017-07-27 16:40:49','4','赵六','192.168.0.4'),
('B2FF5B340F87422B81EC157EE1D54C1F','1','release','zhangsan:1','2017-07-27 16:40:49','1','张三','192.168.0.1'),
('B3291C26685341BA9DE30487A16999BC','1BF2A7B347DC4FD784AC377373AE07CD','registry','zhaoliu:1BF2A7B347DC4FD784AC377373AE07CD','2017-07-27 16:40:49','4','赵六','192.168.0.4'),
('B3E4E89CC8A34E9C843B2C7BB4004423','1BF2A7B347DC4FD784AC377373AE07CD','release','wangwu:1BF2A7B347DC4FD784AC377373AE07CD','2017-07-27 16:40:49','3','王五','192.168.0.3'),
('B408C35F05D846EB883323945E809EE1','3','release','zhangsan:3','2017-07-27 16:40:49','1','张三','192.168.0.1'),
('B6322FA5452F4C32ADBE0B6412141CB6','1BF2A7B347DC4FD784AC377373AE07CD','release','zhangsan:1BF2A7B347DC4FD784AC377373AE07CD','2017-07-27 16:40:49','1','张三','192.168.0.1'),
('B72CCBF78CFA46A193E52872B40FB234','1BF2A7B347DC4FD784AC377373AE07CD','registry','zhangsan:1BF2A7B347DC4FD784AC377373AE07CD','2017-07-27 16:40:49','1','张三','192.168.0.1'),
('B80BBD66194B4761BB937844E46BE31D','1BF2A7B347DC4FD784AC377373AE07CD','registry','wangwu:1BF2A7B347DC4FD784AC377373AE07CD','2017-07-27 16:40:49','3','王五','192.168.0.3'),
('BA6599FFB3B24279A3F056D59EB857F8','1','audit','zhaoliu:1','2017-07-27 16:40:50','4','赵六','192.168.0.4'),
('BAF1C21767DC4E05B1E605EFE87B6C19','32ABC9B38A274FDE86E8F17444C858D0','registry','wangwu:32ABC9B38A274FDE86E8F17444C858D0','2017-07-27 16:40:49','3','王五','192.168.0.3'),
('BC7B41B6243C4CCA90C769B3B9570E34','3','registry','zhangsan:3','2017-07-27 16:40:49','1','张三','192.168.0.1'),
('BE2579E81FEA4FE1B7F705BE0A4F309C','2','release','wangwu:2','2017-07-27 16:40:49','3','王五','192.168.0.3'),
('BFE301F257904A179E0257C07D372505','1','audit','lisi:1','2017-07-27 16:40:49','2','李四','192.168.0.2'),
('C017C9350D5948BE98816D256A036991','2','audit','zhaoliu:2','2017-07-27 16:40:49','4','赵六','192.168.0.4'),
('C16C4993CACC466F8FEBC4D7E0F296E3','32ABC9B38A274FDE86E8F17444C858D0','registry','wangwu:32ABC9B38A274FDE86E8F17444C858D0','2017-07-27 16:40:50','3','王五','192.168.0.3'),
('C27AB69CA1704C72B95A001999DB3F2E','32ABC9B38A274FDE86E8F17444C858D0','audit','wangwu:32ABC9B38A274FDE86E8F17444C858D0','2017-07-27 16:40:49','3','王五','192.168.0.3'),
('C3B979ED51284106BB26B1899B1784FC','3','audit','wangwu:3','2017-07-27 16:40:49','3','王五','192.168.0.3'),
('C5244AA9B2224C8AA22757040198E864','3','registry','wangwu:3','2017-07-27 16:40:49','3','王五','192.168.0.3'),
('C53613FB5214495F8ACC3F8C148D27D7','32ABC9B38A274FDE86E8F17444C858D0','registry','qianqi:32ABC9B38A274FDE86E8F17444C858D0','2017-07-27 16:40:49','5','钱七','192.168.0.5'),
('C6E48A7EE8244B2D82B00B808E4641CB','1BF2A7B347DC4FD784AC377373AE07CD','registry','lisi:1BF2A7B347DC4FD784AC377373AE07CD','2017-07-27 16:40:49','2','李四','192.168.0.2'),
('C7D1F972496A4FB0BAC902886F1609E3','1','audit','zhaoliu:1','2017-07-27 16:40:49','4','赵六','192.168.0.4'),
('CCDEA80728D4459B812283A4826398AB','1','registry','wangwu:1','2017-07-27 16:40:49','3','王五','192.168.0.3'),
('CE25BFA6FF6A496E849AD6D7D086E948','1','registry','lisi:1','2017-07-27 16:40:49','2','李四','192.168.0.2'),
('CE80E2F0AD074DE79B3CDDB539E714DF','1BF2A7B347DC4FD784AC377373AE07CD','release','zhangsan:1BF2A7B347DC4FD784AC377373AE07CD','2017-07-27 16:40:49','1','张三','192.168.0.1'),
('CE89836C76374F40B938576DC3F6B227','2','registry','zhaoliu:2','2017-07-27 16:40:49','4','赵六','192.168.0.4'),
('CEA8D7271B6D4DDA90016CD3B91635EC','2','release','qianqi:2','2017-07-27 16:40:49','5','钱七','192.168.0.5'),
('CF033F47D587476EBC9928A96AE27B30','32ABC9B38A274FDE86E8F17444C858D0','audit','lisi:32ABC9B38A274FDE86E8F17444C858D0','2017-07-27 16:40:50','2','李四','192.168.0.2'),
('CF27EADFEAA44AC4AF3B9CB38169456E','1BF2A7B347DC4FD784AC377373AE07CD','release','lisi:1BF2A7B347DC4FD784AC377373AE07CD','2017-07-27 16:40:49','2','李四','192.168.0.2'),
('CF4415C43D114401ADE5B564E82299EE','1','audit','qianqi:1','2017-07-27 16:40:49','5','钱七','192.168.0.5'),
('CF8BB58823854C318A9BBE66C27A4EDC','1BF2A7B347DC4FD784AC377373AE07CD','release','wangwu:1BF2A7B347DC4FD784AC377373AE07CD','2017-07-27 16:40:49','3','王五','192.168.0.3'),
('CFB248A28D584419B56EF2725EE72365','1BF2A7B347DC4FD784AC377373AE07CD','registry','zhaoliu:1BF2A7B347DC4FD784AC377373AE07CD','2017-07-27 16:40:49','4','赵六','192.168.0.4'),
('D0EAB49C5E8F4A1FB16828B69ADAD14F','32ABC9B38A274FDE86E8F17444C858D0','registry','zhaoliu:32ABC9B38A274FDE86E8F17444C858D0','2017-07-27 16:40:49','4','赵六','192.168.0.4'),
('D10AAE535F864BE9879A506E279105B0','1BF2A7B347DC4FD784AC377373AE07CD','audit','lisi:1BF2A7B347DC4FD784AC377373AE07CD','2017-07-27 16:40:49','2','李四','192.168.0.2'),
('D1903225C67A4CAEB12DFC8EFE357ED0','32ABC9B38A274FDE86E8F17444C858D0','registry','zhaoliu:32ABC9B38A274FDE86E8F17444C858D0','2017-07-27 16:40:49','4','赵六','192.168.0.4'),
('D494C223F4CA49C5B86948311394D118','32ABC9B38A274FDE86E8F17444C858D0','registry','wangwu:32ABC9B38A274FDE86E8F17444C858D0','2017-07-27 16:40:49','3','王五','192.168.0.3'),
('D65473A3D2EC4F2EB77275D2152FF6A3','3','release','zhaoliu:3','2017-07-27 16:40:49','4','赵六','192.168.0.4'),
('D663D6C26AF643008494BAF5330C9F27','1','release','lisi:1','2017-07-27 16:40:49','2','李四','192.168.0.2'),
('D7506CC886964285BB2F69765B61DD45','1','release','zhaoliu:1','2017-07-27 16:40:50','4','赵六','192.168.0.4'),
('D9B423706D2F41CBBBE9C3B741785FDB','32ABC9B38A274FDE86E8F17444C858D0','registry','wangwu:32ABC9B38A274FDE86E8F17444C858D0','2017-07-27 16:40:49','3','王五','192.168.0.3'),
('DA125FA0E30E4C5A81A0C50E753178DF','1','registry','zhaoliu:1','2017-07-27 16:40:49','4','赵六','192.168.0.4'),
('DBA4F34027E1439498040AC160E424E8','32ABC9B38A274FDE86E8F17444C858D0','release','lisi:32ABC9B38A274FDE86E8F17444C858D0','2017-07-27 16:40:49','2','李四','192.168.0.2'),
('DF52DC674DD447E98262EA4592BD0238','32ABC9B38A274FDE86E8F17444C858D0','registry','qianqi:32ABC9B38A274FDE86E8F17444C858D0','2017-07-27 16:40:49','5','钱七','192.168.0.5'),
('E0248B91F8984630B87CDDCF2AAA3D8D','1','audit','zhangsan:1','2017-07-27 16:40:49','1','张三','192.168.0.1'),
('E03BE5CC1E3A4390815673339AA30392','1','registry','lisi:1','2017-07-27 16:40:50','2','李四','192.168.0.2'),
('E1118D0AAA974308A5F486A5516F175D','2','registry','qianqi:2','2017-07-27 16:40:50','5','钱七','192.168.0.5'),
('E1473D9A7BA24841ADA258DDAFCF518A','1','audit','zhaoliu:1','2017-07-27 16:40:50','4','赵六','192.168.0.4'),
('E2BB766F1748447D8067F046CA95F294','2','release','qianqi:2','2017-07-27 16:40:49','5','钱七','192.168.0.5'),
('E4D7676ED5D64F28B529E07CBC87C885','3','audit','zhaoliu:3','2017-07-27 16:40:50','4','赵六','192.168.0.4'),
('E596A989E8C64544A4B6E71EF14B5AF1','2','audit','qianqi:2','2017-07-27 16:40:49','5','钱七','192.168.0.5'),
('E65F85C7F3C34359958FA5F7187B31F8','32ABC9B38A274FDE86E8F17444C858D0','audit','wangwu:32ABC9B38A274FDE86E8F17444C858D0','2017-07-27 16:40:50','3','王五','192.168.0.3'),
('E68F09003F91468CA4D9A4370D926598','2','audit','wangwu:2','2017-07-27 16:40:49','3','王五','192.168.0.3'),
('E8F78730A7D2419C8F1C36AB063BFFB8','3','registry','wangwu:3','2017-07-27 16:40:50','3','王五','192.168.0.3'),
('E954276043A5470EBB4A072CA6B309C2','3','audit','wangwu:3','2017-07-27 16:40:49','3','王五','192.168.0.3'),
('ED1B3CFA977B4551B01138148C5FB7CB','1','audit','wangwu:1','2017-07-27 16:40:49','3','王五','192.168.0.3'),
('EED2A523C1294DEBBA24E1EBEE69F011','2','registry','lisi:2','2017-07-27 16:40:49','2','李四','192.168.0.2'),
('F30A05815AFF4B748086DD9B5748088A','32ABC9B38A274FDE86E8F17444C858D0','audit','qianqi:32ABC9B38A274FDE86E8F17444C858D0','2017-07-27 16:40:49','5','钱七','192.168.0.5'),
('F3D5DCCEE55C4AB9ABDBBEE5C1E0B268','3','audit','wangwu:3','2017-07-27 16:40:49','3','王五','192.168.0.3'),
('F77049AC84F44F23B4DC24F29D762C50','2','registry','zhaoliu:2','2017-07-27 16:40:50','4','赵六','192.168.0.4'),
('F7A25A81DBCD44F4A6757767FF7C656E','3','audit','lisi:3','2017-07-27 16:40:49','2','李四','192.168.0.2'),
('FA0C23298B2C4408B478C6F3C6A240C9','1BF2A7B347DC4FD784AC377373AE07CD','audit','zhaoliu:1BF2A7B347DC4FD784AC377373AE07CD','2017-07-27 16:40:49','4','赵六','192.168.0.4'),
('FA169F1DB7B345069444CCC834070BB1','1BF2A7B347DC4FD784AC377373AE07CD','registry','zhaoliu:1BF2A7B347DC4FD784AC377373AE07CD','2017-07-27 16:40:50','4','赵六','192.168.0.4'),
('FA66C36841D7416AA4D3E75FE6A07E77','1BF2A7B347DC4FD784AC377373AE07CD','registry','zhaoliu:1BF2A7B347DC4FD784AC377373AE07CD','2017-07-27 16:40:50','4','赵六','192.168.0.4'),
('FB5287821A864058A8BF7CE3FD824CCA','32ABC9B38A274FDE86E8F17444C858D0','audit','wangwu:32ABC9B38A274FDE86E8F17444C858D0','2017-07-27 16:40:49','3','王五','192.168.0.3'),
('FC9E5DB9F75B4CA087F70061DDA1A971','1BF2A7B347DC4FD784AC377373AE07CD','release','zhangsan:1BF2A7B347DC4FD784AC377373AE07CD','2017-07-27 16:40:49','1','张三','192.168.0.1'),
('FD59C3E6B75749389935296ECF6499DE','3','registry','wangwu:3','2017-07-27 16:40:49','3','王五','192.168.0.3'),
('FE44EEBD70134F3995E7F2E5AABEEB63','2','audit','lisi:2','2017-07-27 16:40:50','2','李四','192.168.0.2');

/*Table structure for table `rmc_res_ownership` */

DROP TABLE IF EXISTS `rmc_res_ownership`;

CREATE TABLE `rmc_res_ownership` (
  `id` varchar(32) NOT NULL COMMENT '主键ID',
  `res_id` varchar(32) DEFAULT NULL COMMENT '资源ID',
  `target_type` varchar(20) DEFAULT NULL COMMENT '权属对象类型:用户/角色/机构',
  `target_id` varchar(32) DEFAULT NULL COMMENT '权属对象ID:用户ID/角色ID/机构ID',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `creator_id` varchar(32) DEFAULT NULL COMMENT '创建人ID',
  `creator` varchar(30) DEFAULT NULL COMMENT '创建人姓名',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `updater_id` varchar(32) DEFAULT NULL COMMENT '更新人ID',
  `updater` varchar(30) DEFAULT NULL COMMENT '更新人姓名',
  `delete_date` datetime DEFAULT NULL COMMENT '删除时间',
  `deleter_id` varchar(32) DEFAULT NULL COMMENT '删除人ID',
  `deleter` varchar(30) DEFAULT NULL COMMENT '删除人姓名',
  `is_delete` int(11) DEFAULT '0' COMMENT '是否已删除',
  `is_valid` int(11) DEFAULT '0' COMMENT '是否有效:启用/停用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `rmc_res_ownership` */

insert  into `rmc_res_ownership`(`id`,`res_id`,`target_type`,`target_id`,`create_date`,`creator_id`,`creator`,`update_date`,`updater_id`,`updater`,`delete_date`,`deleter_id`,`deleter`,`is_delete`,`is_valid`) values 
('02D543675A24421AA8321CB44F328E43','2','user','111','2017-07-24 15:37:01',NULL,NULL,'2017-07-24 15:50:26',NULL,NULL,NULL,NULL,NULL,0,1),
('19866922C5DE43FB9B0220523F96A797','2','org','67','2017-07-25 09:00:45',NULL,NULL,'2017-07-25 09:02:28',NULL,NULL,NULL,NULL,NULL,0,1),
('2A3D6A0CB2BE4FC2BAA56FC6308A57A4','2','user','116','2017-07-24 15:37:01',NULL,NULL,'2017-07-24 16:58:04',NULL,NULL,NULL,NULL,NULL,0,1),
('39B26C3E972D449ABD3561128955ACB3','1','role','62','2017-07-26 09:48:20',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0),
('3C1EA8A163E941B285231643AC0AFF84','2','org','59','2017-07-25 09:00:45',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0),
('4DF82A6115E04E8295B4872FDF7FE2B0','1','user','116','2017-07-24 15:37:01',NULL,NULL,'2017-07-24 15:52:03',NULL,NULL,NULL,NULL,NULL,0,1),
('4E1C6ABAA0B646489B61AAD842C16E5C','650481EE0FF944608BF673001D0D0549','org','1','2017-07-25 09:02:16',NULL,NULL,'2017-07-25 09:02:22',NULL,NULL,NULL,NULL,NULL,0,1),
('65069F0315524B1DA77D5DF2F4C2BA60','1','org','3','2017-07-25 09:33:40',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,0),
('65A1950826744EC0B2299C43E71FA8F2','1','user','111','2017-07-24 15:37:01',NULL,NULL,'2017-07-24 16:59:54',NULL,NULL,NULL,NULL,NULL,0,1),
('6CA1C36ADBCF4055AD5771A4C33501EC','1','org','67','2017-07-25 09:00:45',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0),
('6D17D17A87004D4DB334BE2E2A08CB93','80E40338F5434D69975A63AFBC240D53','role','62','2017-07-26 09:48:20',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0),
('70C47E16C5AF4294A4E84C2BB62BC41F','1','role','50','2017-07-26 09:48:20',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0),
('780D254B0DF848BC913B2E97AFF84B70','650481EE0FF944608BF673001D0D0549','role','64','2017-07-26 09:48:20',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0),
('7CB8D3512D824013AB28F6B7201DF3B8','1','org','59','2017-07-25 09:00:45',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0),
('8D8BB4814EB4484BAF860ED46699A39F','650481EE0FF944608BF673001D0D0549','user','','2017-07-24 11:23:25',NULL,NULL,'2017-07-24 16:03:06',NULL,NULL,NULL,NULL,NULL,0,1),
('8E4706E568E6458B86618144C0DD6289','80E40338F5434D69975A63AFBC240D53','role','50','2017-07-26 09:48:20',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0),
('93E821030BD34B2985B1209289F338EF','650481EE0FF944608BF673001D0D0549','user','118','2017-07-24 16:16:45',NULL,NULL,'2017-07-24 17:54:34',NULL,NULL,NULL,NULL,NULL,0,1),
('A965D1B32C164DDEB5770BC14BE8B80F','650481EE0FF944608BF673001D0D0549','role','50','2017-07-24 11:32:03',NULL,NULL,'2017-07-24 16:59:50',NULL,NULL,NULL,NULL,NULL,0,1),
('B34605D96ED445EBAB04A13A751929E9','80E40338F5434D69975A63AFBC240D53','role','64','2017-07-26 09:48:20',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0),
('BB8903EABD7F4FE297624CD0201D207E','1','role','64','2017-07-26 09:48:20',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0),
('D67ACC2E8C42409CA34B7E446832D68E','1','user','123','2017-07-24 16:16:45',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0),
('D6AEC26B3F62406DB7AEE0C0D57FFEFF','650481EE0FF944608BF673001D0D0549','user','123','2017-07-24 16:16:45',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,0),
('DC685966D4664B2FB42CB4EFFFDA0C39','1','role','47','2017-07-25 09:31:45',NULL,NULL,'2017-07-26 09:18:08',NULL,NULL,NULL,NULL,NULL,0,1),
('F10A080282874FA5B97DC24EC2CD9D77','650481EE0FF944608BF673001D0D0549','role','62','2017-07-26 09:48:20',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0),
('F3A1580DE26443C48AB9B4B49F95CE52','1','1','1','2017-07-24 11:16:49',NULL,NULL,'2017-07-24 16:03:26',NULL,NULL,NULL,NULL,NULL,0,0),
('FB365E841424478597091391B9848A10','1','user','118','2017-07-24 16:16:45',NULL,NULL,'2017-07-24 16:58:04',NULL,NULL,NULL,NULL,NULL,0,1),
('FF169F1921B84A169FDDF42D63524491','80E40338F5434D69975A63AFBC240D53','user','123','2017-07-26 10:12:57',NULL,NULL,'2017-07-27 14:59:31',NULL,NULL,NULL,NULL,NULL,0,0);

/*Table structure for table `rmc_res_service_property` */

DROP TABLE IF EXISTS `rmc_res_service_property`;

CREATE TABLE `rmc_res_service_property` (
  `id` varchar(32) NOT NULL COMMENT '主键ID',
  `description` varchar(500) DEFAULT NULL COMMENT '资源描述信息',
  `request_type` varchar(20) DEFAULT NULL COMMENT '请求方式:get/post',
  `request_desc` text COMMENT '请求参数描述',
  `response_desc` text COMMENT '响应参数描述',
  `request_demo` text COMMENT '请求示例',
  `response_demo` text COMMENT '响应示例',
  `test_key_name` varchar(50) DEFAULT NULL COMMENT '测试用的keyName',
  `test_key_value` varchar(50) DEFAULT NULL COMMENT '测试用的keyValue',
  `test_token` varchar(50) DEFAULT NULL COMMENT '测试用的token',
  `test_username` varchar(30) DEFAULT NULL COMMENT '测试用的用户名',
  `test_password` varchar(30) DEFAULT NULL COMMENT '测试用的密码',
  `test_remark` varchar(50) DEFAULT NULL COMMENT '测试用的备注信息',
  `attachment_url` varchar(200) DEFAULT NULL COMMENT '附件地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `rmc_res_service_property` */

insert  into `rmc_res_service_property`(`id`,`description`,`request_type`,`request_desc`,`response_desc`,`request_demo`,`response_demo`,`test_key_name`,`test_key_value`,`test_token`,`test_username`,`test_password`,`test_remark`,`attachment_url`) values 
('0CD52B8777B94E53BE0AA0428D911D95','1','get','1','1','1','1','1','1','1','1','1','1',NULL);

/*Table structure for table `rmc_res_visit_log` */

DROP TABLE IF EXISTS `rmc_res_visit_log`;

CREATE TABLE `rmc_res_visit_log` (
  `id` varchar(32) NOT NULL COMMENT '主键ID',
  `res_id` varchar(32) DEFAULT NULL COMMENT '资源ID',
  `visit_date` datetime DEFAULT NULL COMMENT '访问时间',
  `visit_ip` varchar(50) DEFAULT NULL COMMENT '访问IP',
  `visit_username` varchar(30) DEFAULT NULL COMMENT '访问时所使用的用户名',
  `visit_token` varchar(100) DEFAULT NULL COMMENT '访问时所使用的Token',
  `visit_key` varchar(50) DEFAULT NULL COMMENT '访问时所使用的Key',
  `visit_value` varchar(100) DEFAULT NULL COMMENT '访问时所使用的Value',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `rmc_res_visit_log` */

insert  into `rmc_res_visit_log`(`id`,`res_id`,`visit_date`,`visit_ip`,`visit_username`,`visit_token`,`visit_key`,`visit_value`) values 
('02ACB17FB6234A02BB4A3C9701031DAA','3','2017-07-27 17:03:45','192.168.0.4','赵六','00150114622539400000000108','IXMPTWOWSYRFIMFDWYAUTJMGLEYEESBG','2'),
('046CF0A383134D91A59C90F38DA7C033','1','2017-07-27 17:03:46','192.168.0.4','赵六','00150114622571400000000157','LWFXJQRUWQPAXCWJUGWFHVOOLRQWDAOP','8'),
('04CA7D44E6E54177B90F1E8CAEABDEB4','2','2017-07-27 17:03:46','192.168.0.1','张三','00150114622590600000000188','FIGJVBRNSTOWYUIDLFSGFGMXEYIXGVPG','6'),
('052DD8F587F24B5F95D10FCAA52A5F2E','1','2017-07-27 17:03:45','192.168.0.1','张三','00150114622528000000000093','KOMLVEOTDTAVRKDCRUNHTSKLWXLICDAO','0'),
('0597E59B318E402DA5F28734D785AD2D','1BF2A7B347DC4FD784AC377373AE07CD','2017-07-27 17:03:45','192.168.0.1','张三','00150114622503400000000050','XRPVWJMFFMYFOLOBSLIOLXIVUTMERWBD','15'),
('06FE8441A8964DFFA6991DF568BAB9B7','1','2017-07-27 17:03:45','192.168.0.3','王五','00150114622508600000000059','GBYRUPOQKVPRPOKXJWHGIYLHPQENCOJI','14'),
('0830017AA48D41C7A6ABA2B67B8586E6','32ABC9B38A274FDE86E8F17444C858D0','2017-07-27 17:03:46','192.168.0.3','王五','00150114622562900000000146','TMTIYYMVVVOPYMVWNDOBLAWQYSYLEERK','17'),
('0B20433BB9714E10B4B11F0CAD578419','1BF2A7B347DC4FD784AC377373AE07CD','2017-07-27 17:03:45','192.168.0.5','钱七','00150114622540400000000110','CGHETTTJPMQMSIORAGMUHPPOIBHAOXQS','5'),
('0B25E0AD90FD4B5F8C6C9405C4B47C94','32ABC9B38A274FDE86E8F17444C858D0','2017-07-27 17:03:45','192.168.0.4','赵六','00150114622521700000000083','XDUWIEFPJWQUYHNBPHUMAYBOTEQLPKYE','19'),
('0B751532805847E786DC0AF637D2FE95','1','2017-07-27 17:03:45','192.168.0.3','王五','00150114622531900000000100','GTUTRFUEPMORVLHCYRQDRTMGBMNDFUVT','19'),
('0F14520815D146758A9FC81E01989416','1BF2A7B347DC4FD784AC377373AE07CD','2017-07-27 17:03:46','192.168.0.4','赵六','00150114622584500000000180','NILAGYGFVPFQSNOBVSPYLKWIRWRCIQTX','8'),
('0FB19D01E5004D3DAA1838026DEA92B1','3','2017-07-27 17:03:45','192.168.0.1','张三','00150114622518900000000078','VGTUUDSSLCHDVKLUYUCTHFVUJHXIVGAB','10'),
('11ECAD2F613F42A287F718A328DD4539','1BF2A7B347DC4FD784AC377373AE07CD','2017-07-27 17:03:46','192.168.0.5','钱七','00150114622580500000000173','JOGGHVXTPABPQLSQIEVRWRPTBEJFWDBS','15'),
('120D7DD6A9864E599CF21CF21AE9013A','3','2017-07-27 17:03:45','192.168.0.1','张三','00150114622499600000000044','BEVCWWWOAQRJNCCKAKFKSWQWXLCIDLIX','17'),
('156FD74A1AB34732ACFF16627DA9B80A','3','2017-07-27 17:03:46','192.168.0.2','李四','00150114622555800000000136','HHRTWNQILIBBXTOWWUIXCBEMHCVMBBHD','4'),
('176B2608DDA54C7C923C2542DD1A5C6E','3','2017-07-27 17:03:45','192.168.0.5','钱七','00150114622541000000000111','AOBIPWXKXDPHDYTRQGLSWECBCUSLGQEJ','15'),
('17F78E80FA7E4EFC91CA426923B5D7AE','1','2017-07-27 17:03:45','192.168.0.2','李四','00150114622519500000000079','BNQSCJXVLWOREVPSWRDILWDSNIUGXIOB','3'),
('1869FC9546184318A64594A7110D5B79','32ABC9B38A274FDE86E8F17444C858D0','2017-07-27 17:03:46','192.168.0.5','钱七','00150114622553800000000133','QCQPWJKWSOPLKQJGQGJJTHSCWFUTQJTR','15'),
('199CB022C6D94A7792C25146839EBC68','32ABC9B38A274FDE86E8F17444C858D0','2017-07-27 17:03:46','192.168.0.3','王五','00150114622592200000000190','GWMCYQFCPPYQBKRGQCJKTTVYGAENKWGC','8'),
('1A34F62747474B4298F75B592CCCD35D','3','2017-07-27 17:03:45','192.168.0.2','李四','00150114622549500000000126','MWNKPBBWKLEPMCXJATJBEIIILTOMWWCF','6'),
('1A862BFC332B4AECB05D90D1D49896E7','2','2017-07-27 17:03:45','192.168.0.5','钱七','00150114622538800000000107','PFHNJSCOXCVNEVMCNEPCFYYTPLQISINV','3'),
('1BB4D5EDEEDA409CB6B09871B42CB7C6','1BF2A7B347DC4FD784AC377373AE07CD','2017-07-27 17:03:45','192.168.0.5','钱七','00150114622512100000000066','QPLYGQGCJWJPLODYFOYVRGHOQHWHKBFS','9'),
('1D77412FF45342079DE78D70EFE6842F','32ABC9B38A274FDE86E8F17444C858D0','2017-07-27 17:03:45','192.168.0.5','钱七','00150114622529900000000096','FHARFMQCWQJPSLCYQPVXCIDKWXMAMHQE','19'),
('1E3655C7B08148FFB98365EDC948053D','3','2017-07-27 17:03:45','192.168.0.3','王五','00150114622473700000000004','TOJPWPQDMHJITOHDWRDHWLWYATYNERYH','2'),
('21B55386055C499982F5EFC770629A11','3','2017-07-27 17:03:45','192.168.0.1','张三','00150114622504400000000052','QONCEIEBLWVYDYKKKUJHFTNOXSVXCNFQ','16'),
('22D95C99838D4948883203F04675C592','2','2017-07-27 17:03:46','192.168.0.3','王五','00150114622556200000000137','YUSYDERJHGQMGKELCEPKKINSGXUNPOGP','19'),
('2522A7B581BA4A358859929EB838D9B4','32ABC9B38A274FDE86E8F17444C858D0','2017-07-27 17:03:45','192.168.0.4','赵六','00150114622484100000000019','RWBMYFDXFTXKIVTDDMMJTTINDMVMBSOE','21'),
('262033E31C55424583A339F4C25FDB38','32ABC9B38A274FDE86E8F17444C858D0','2017-07-27 17:03:45','192.168.0.2','李四','00150114622491400000000030','PLQIWURBHCMVYBFSLOODGDWHTOKWJNER','15'),
('27E399473CBF4C8289FE0A13CFF188AE','3','2017-07-27 17:03:45','192.168.0.1','张三','00150114622546500000000121','LFQCILIWQINWDOHPFGVKWTXMYYFXSPRM','0'),
('28D167C5DC2C4B5A96A296FDF686D612','2','2017-07-27 17:03:45','192.168.0.1','张三','00150114622497400000000040','PARFMWDDYVGIEFRVSEKQOMQYDVXGQWOU','9'),
('290A36FE884E4613BECB27BEBDD0E37F','1','2017-07-27 17:03:46','192.168.0.4','赵六','00150114622581000000000174','AQMHEBRHSXAKBQBPQRXOKCGHHMEJDQHK','19'),
('2DD6157A3A7343AB8934304D4C4ABB1A','1BF2A7B347DC4FD784AC377373AE07CD','2017-07-27 17:03:46','192.168.0.4','赵六','00150114622595000000000194','ASIGYFCQFILEOIBPNSGYXONTNTRTCEPA','13'),
('2FEDB8BDC110439DB5D5BA3CD4FF1771','3','2017-07-27 17:03:45','192.168.0.1','张三','00150114622529500000000095','XLVOKPLLFNUDJSUAFYIADIKIBEPUWRGK','16'),
('3088864DE11B41469F46981625997C75','1BF2A7B347DC4FD784AC377373AE07CD','2017-07-27 17:03:46','192.168.0.2','李四','00150114622581500000000175','YIFOQCTRGMDFOXNXIKIVABAUJULEBDGM','1'),
('32E8AAA913DF4F7085D77DBD82449335','2','2017-07-27 17:03:46','192.168.0.3','王五','00150114622593900000000192','WEQXHGEMKMMFVVVUWOTCWTFDRWBCILJI','10'),
('36964E115C20441AA024F39FD22AC493','1BF2A7B347DC4FD784AC377373AE07CD','2017-07-27 17:03:45','192.168.0.4','赵六','00150114622493400000000034','NJSNEOGAEMALRENHUXEBLDSIIGCTPAWC','3'),
('36E4E9654FA141A09032A3E47C6C40DA','1BF2A7B347DC4FD784AC377373AE07CD','2017-07-27 17:03:45','192.168.0.3','王五','00150114622510000000000062','VNEFCPAPYUFOOLLYDRXPFRTFQLPLCKQC','6'),
('36FACA0BF835476181B3F043117BE166','1BF2A7B347DC4FD784AC377373AE07CD','2017-07-27 17:03:45','192.168.0.2','李四','00150114622511200000000064','WQKDPHDGKXQQMOEBAUDRFNJPRCUDVEMC','0'),
('37E568D284EF4CD99327C70AD26CBB3C','1','2017-07-27 17:03:46','192.168.0.5','钱七','00150114622567800000000154','WBOYGACEBEHPGIRAIQKVYNXVDYOAUBQQ','7'),
('381CC62827964F10B60E813E01F0A49C','32ABC9B38A274FDE86E8F17444C858D0','2017-07-27 17:03:46','192.168.0.2','李四','00150114622565600000000150','BEXFFOKFGPAXFXNAWKRBPPMYBHGYSWNF','13'),
('38D2DE0245BC40EDA7F3B10282781A38','3','2017-07-27 17:03:45','192.168.0.5','钱七','00150114622517700000000076','NITPVWTHDAJBXGPQLFRVOCCRCCOSXSYX','20'),
('39492BD5C67146398F1085C773712A57','32ABC9B38A274FDE86E8F17444C858D0','2017-07-27 17:03:45','192.168.0.1','张三','00150114622536600000000103','RBMWJYWQRYFNOPVEXQCXHJSNDYINIOYN','15'),
('3B3FF7DFF4FB45A58DB8D6DF5D028719','32ABC9B38A274FDE86E8F17444C858D0','2017-07-27 17:03:45','192.168.0.2','李四','00150114622508100000000058','XNORRQTDHJPNEORHUVEVQYBPOAKSSNJO','6'),
('40CB815CCD7D483782747686E49DB279','32ABC9B38A274FDE86E8F17444C858D0','2017-07-27 17:03:45','192.168.0.5','钱七','00150114622500400000000045','DPYSUOYDNQIUQRXGNSPTSGNJCSXWWFDR','19'),
('410F752DA569426CB3BF805F04118FC9','32ABC9B38A274FDE86E8F17444C858D0','2017-07-27 17:03:45','192.168.0.1','张三','00150114622525000000000088','DYGFNRLLWARANUKEQICPLKEOOEXWEKYJ','13'),
('42AC2EDC9B5F42DD895453CE617481FB','2','2017-07-27 17:03:45','192.168.0.5','钱七','00150114622482400000000017','NXBRVYWVEOKIVUFXBHDWWQFCKQFJXNJR','14'),
('440FFC00558B45D49A184A072D421401','3','2017-07-27 17:03:45','192.168.0.2','李四','00150114622531500000000099','HSMAOTKAHRSQRXXFLDMHNFWHOVWTQRGM','20'),
('46AE33D714B0416E9141F7EF9DE5A908','3','2017-07-27 17:03:46','192.168.0.3','王五','00150114622591400000000189','OUOQNULFMMKLBJYIFUBIFDMDMGVECXWP','3'),
('4BC743B40A8E460A9E94D0E2CDD95F8F','32ABC9B38A274FDE86E8F17444C858D0','2017-07-27 17:03:46','192.168.0.2','李四','00150114622550400000000128','GGRKMCBGJDAXIDFRUUPLPXOBYGLCHRPH','11'),
('4BF3A0B995B1469991DCC28848D8205C','32ABC9B38A274FDE86E8F17444C858D0','2017-07-27 17:03:45','192.168.0.5','钱七','00150114622487100000000025','IBAQIGWNJVRQNQFYYAFCIBYBNKCCQLUF','17'),
('4D7F4A0AC00C4ED8AD1068E5F0EED211','2','2017-07-27 17:03:46','192.168.0.5','钱七','00150114622576700000000166','QAAXHXANGCKTMEKUTYTVVBLMYFLLEMWA','19'),
('4E12B0237A7D4488B9D278F72F33F91F','1BF2A7B347DC4FD784AC377373AE07CD','2017-07-27 17:03:45','192.168.0.2','李四','00150114622474500000000005','YLALPKSAHHUAGKUOUJJOMNMQXKBNMXFX','10'),
('4F4F2FD9192B468D847037F8344124B4','1','2017-07-27 17:03:45','192.168.0.4','赵六','00150114622485100000000021','NHPEMACQFUEWQNNXDTEFHEYXTAVCECFI','19'),
('504055FFC51F49A6BC7880A4FAEB40C8','1','2017-07-27 17:03:46','192.168.0.3','王五','00150114622582800000000177','FJMMNBHTEHOMBNCKDAKFWEKFNIUYXCFD','6'),
('50B51A538B8F4E31B3ACBDAA03FB0A2D','2','2017-07-27 17:03:45','192.168.0.4','赵六','00150114622507000000000056','ITPPEBNTCFSLMNHNLYLQFSLIQNVADOPS','9'),
('51881DC48D934378B0195297AAEDC4D4','3','2017-07-27 17:03:46','192.168.0.4','赵六','00150114622552900000000132','GECDHSVHLBFPCDRUGJJBVXUQXXWTTSBK','9'),
('51BB8F635FDE4840B58F02B6F4ED6165','2','2017-07-27 17:03:46','192.168.0.1','张三','00150114622558500000000141','DHUPSLJTSAFCKESENLAOLXXXTYTSRCHB','21'),
('52EAD2E4A94948F384C42041AAEC8646','1','2017-07-27 17:03:46','192.168.0.1','张三','00150114622567200000000153','CVNXKPJOBRVYAEIKYDWUKRKRBVFJSDLI','1'),
('54AADB5A2A404AD49C9DF0707FAEC2E1','32ABC9B38A274FDE86E8F17444C858D0','2017-07-27 17:03:46','192.168.0.3','王五','00150114622551900000000131','JONKMMFNFUPJSMNMJMHEMAQKCIXNPIHE','19'),
('55256795970542BABCD766A4263716DA','32ABC9B38A274FDE86E8F17444C858D0','2017-07-27 17:03:45','192.168.0.2','李四','00150114622478300000000010','EDJFTGEELRIYDPRNFYULMKREJYHHNTKL','1'),
('562C5A2A4AF14E1ABDF7EE11EC913A23','1BF2A7B347DC4FD784AC377373AE07CD','2017-07-27 17:03:46','192.168.0.2','李四','00150114622573400000000161','XLCYAKMKYUHEFHOVRCUSVCXOGQPSGRBA','3'),
('580035F6776D4DF98B061C49E9CAE76D','3','2017-07-27 17:03:45','192.168.0.4','赵六','00150114622494200000000035','TMUPPMGGEVXMBLWVCVBWRUSXGKQBJOJC','16'),
('5880365C2426424F844A454753F262BA','1','2017-07-27 17:03:45','192.168.0.4','赵六','00150114622510700000000063','GQUWFSLEXUYFMMRAXPQRVAWUMARQPEWV','14'),
('58C33AE521F84C9085CAB9EE2D3828CF','3','2017-07-27 17:03:46','192.168.0.3','王五','00150114622590000000000187','LTMWUSHUBIMCSRVWYFKQCPPHVWJYYART','2'),
('590B2001A7384979BCFE199EF92E144B','3','2017-07-27 17:03:45','192.168.0.5','钱七','00150114622513200000000068','QFPLXDXITALJXJEXGQONFFOUEJGEMMJS','3'),
('595B01A54B104051AA3DF202B7B99F3E','3','2017-07-27 17:03:46','192.168.0.3','王五','00150114622596200000000196','BNHQITEMLARJVCFFYUKKMPUAMUNFRSYS','21'),
('5A482EE28DD541549FEF8C2F6F6198A6','1BF2A7B347DC4FD784AC377373AE07CD','2017-07-27 17:03:46','192.168.0.4','赵六','00150114622574500000000163','IIWBEGONOVLDPNGESLIPFUHXHDCSQLPA','19'),
('5BE71F82D0254989ACA0D0DF1998B63A','3','2017-07-27 17:03:45','192.168.0.2','李四','00150114622474900000000006','LIHBDYSWHUXIWTVLOBDGGKRHYYAPATXD','5'),
('5BF4D38C629840499F23A9CBECD5DB2D','1','2017-07-27 17:03:46','192.168.0.5','钱七','00150114622579100000000170','PIMIELVTJYHBYXSGKODKCMVLPNYKISVU','10'),
('5C08F100ECB44DBC912E0CB016087EF8','32ABC9B38A274FDE86E8F17444C858D0','2017-07-27 17:03:45','192.168.0.2','李四','00150114622527300000000092','TPFMPYLYJTLTOEOCPSSJESMDMLQFGHXB','6'),
('5C6A4BE754F3496296DB2BBBEBEA4F5C','1','2017-07-27 17:03:45','192.168.0.4','赵六','00150114622523000000000085','OEKUTXHSNMIRRLCCSPNUOMGOARTBKRWM','13'),
('614F6C7A016A408685AADBAF7CB5F4EE','3','2017-07-27 17:03:45','192.168.0.1','张三','00150114622542100000000113','CPNYOJUFGTLWWTMNENPYLDQGMQHCHAFS','0'),
('6180E764E8FA45D2A945DCC90876D54C','32ABC9B38A274FDE86E8F17444C858D0','2017-07-27 17:03:46','192.168.0.1','张三','00150114622572400000000159','UGVMRNACBQXUEUKKBGUKQBCBPGWWCXQG','20'),
('64AD24F6BE0044A8BE43CACF843D576B','2','2017-07-27 17:03:46','192.168.0.2','李四','00150114622582200000000176','NJDCTPXFUJIYTBBQWKITKXWJUPYANMOP','8'),
('64BFCF452E48427B920BF53FCB2E0B6B','32ABC9B38A274FDE86E8F17444C858D0','2017-07-27 17:03:45','192.168.0.4','赵六','00150114622485600000000022','VFWWSGHRWVREKCMWUHHCKDNGWGGQKNUJ','1'),
('6642749EF5B144E8800E133ADBFAB075','1BF2A7B347DC4FD784AC377373AE07CD','2017-07-27 17:03:45','192.168.0.3','王五','00150114622547200000000122','ICMHJYEFYYFYYAFYUPCJUOTTEGNVGHHV','12'),
('6762AEC8A16147509D949D78B32C9435','32ABC9B38A274FDE86E8F17444C858D0','2017-07-27 17:03:46','192.168.0.3','王五','00150114622578000000000168','BVUMGEEVUARMUBNIPCLAPXWIYKFNVXJC','12'),
('6887688F125B4576BA8EDE28C5C9B4F8','32ABC9B38A274FDE86E8F17444C858D0','2017-07-27 17:03:46','192.168.0.5','钱七','00150114622554700000000134','SADMDOLWOTJGEBFEQIUVQODBYQXAOLMT','15'),
('69299BA6FA0E4B1A8B16ED15309EB2D0','1','2017-07-27 17:03:45','192.168.0.4','赵六','00150114622509600000000061','DEYQBXLFUDQDTGRMTNWMOUMCLJSCXKFJ','9'),
('6B373BE7FB9A4AB9B6B3E94129F7FC5D','1BF2A7B347DC4FD784AC377373AE07CD','2017-07-27 17:03:46','192.168.0.3','王五','00150114622562500000000145','KBNHLTOJCRGDQTCKXCUXPEEIWMOLIYGD','12'),
('6FDE1AA46A2B459EA288319BE0415F04','2','2017-07-27 17:03:45','192.168.0.2','李四','00150114622492500000000032','NOETCUQCWGWJGMQMSAIRLWODOJIKAWWO','5'),
('6FE9638413A74896A8A3CF53EA4DE0D6','1BF2A7B347DC4FD784AC377373AE07CD','2017-07-27 17:03:45','192.168.0.2','李四','00150114622502400000000048','RPXOHGEBRCEXCDQHWOXXAGJAHXDCWVBN','9'),
('702C693BD77F412597FC81DE4469638E','32ABC9B38A274FDE86E8F17444C858D0','2017-07-27 17:03:46','192.168.0.4','赵六','00150114622571800000000158','MIPIUXJEYRWPMEWUPWCOFQYCJNCAVGVL','17'),
('7055E49CE66547D68498D208C58BFE2A','32ABC9B38A274FDE86E8F17444C858D0','2017-07-27 17:03:45','192.168.0.4','赵六','00150114622489500000000027','AMXRIXFRIRQFQKYXKGLRFPPQOLOEAGIE','16'),
('70B77AB817D24C9ABA516923AB02928E','1','2017-07-27 17:03:45','192.168.0.1','张三','00150114622539900000000109','HWLTDNIYXVAXDQDECSECSGCYQYMFICLX','0'),
('70D720A2822B49A69512CDA3F987B809','2','2017-07-27 17:03:46','192.168.0.3','王五','00150114622563500000000147','RNEOUIRSPWANUHJJVXNBADLCRNYWIDXQ','1'),
('720F6D6B849E4441B616D49369BEB0CB','3','2017-07-27 17:03:45','192.168.0.3','王五','00150114622535600000000101','OSRXNDOCYQMJAJULDYYMIOULHORRBXKX','10'),
('729C296A4B4748B6A0EA6CDF493EBB14','1BF2A7B347DC4FD784AC377373AE07CD','2017-07-27 17:03:45','192.168.0.2','李四','00150114622525500000000089','PTGPVPNVCCADLDCPWLGYAJFCXMXUHQPG','5'),
('730FF01FD63B4E9A81232947A58EE6AD','2','2017-07-27 17:03:46','192.168.0.1','张三','00150114622597800000000199','CTCRFQBIYCMWTUFECUOXNKORFLEEDFKI','17'),
('739EC8D3737D488DA85FD57369A82FC9','2','2017-07-27 17:03:45','192.168.0.2','李四','00150114622491800000000031','DXUTVAFRNOIGDPYNISCCRHTDEPIXRSEL','14'),
('747B7377643A4BC6B9B0D70C6AB86D50','3','2017-07-27 17:03:46','192.168.0.2','李四','00150114622595600000000195','RIKNQCDAKXLDMBPCMUHJUHMLNGMWOIYU','9'),
('79FA0E25565A491A9953D4CD66A446C0','3','2017-07-27 17:03:46','192.168.0.3','王五','00150114622555100000000135','JECBHKDGEDNPVTMGKUWVVIBNPRGWIHYV','19'),
('7D74E6E775BD46D5A54D5C38D9938737','1BF2A7B347DC4FD784AC377373AE07CD','2017-07-27 17:03:46','192.168.0.5','钱七','00150114622596600000000197','KOTLVYAGUBEJFBWJJORMGYIATDFIWBKT','12'),
('7D85B1B0B9CA412B950EEAD3845546D4','2','2017-07-27 17:03:45','192.168.0.5','钱七','00150114622526600000000091','FGNBEINYRCSQTXGAYSBADTENYVXFQCNF','15'),
('82DC1995DE464EEDAF89D687E915B1E2','32ABC9B38A274FDE86E8F17444C858D0','2017-07-27 17:03:45','192.168.0.5','钱七','00150114622544400000000117','AMOXFOVIXUGIMGHUONYSIMBKEGHAURJL','13'),
('82FE3CD18E94404B91EAE49AE2DA6968','1','2017-07-27 17:03:45','192.168.0.5','钱七','00150114622546000000000120','CSQRVOIYGSOJTMWRASYLFMEQFEWKFHFM','1'),
('83F0B94A43934A2CA2E2741062213E62','32ABC9B38A274FDE86E8F17444C858D0','2017-07-27 17:03:45','192.168.0.4','赵六','00150114622477700000000009','GDCFDUSJBYHXACINEJAXDSRBVQKDJWDJ','15'),
('865A1CDBC70C47DAB2349B2AC311A05F','1BF2A7B347DC4FD784AC377373AE07CD','2017-07-27 17:03:45','192.168.0.5','钱七','00150114622480500000000014','SFNFKKOQSEGQKDEXUHNVKNKMMBDJNXPJ','1'),
('8932CF289CD64F958F7BDCF634749F48','2','2017-07-27 17:03:45','192.168.0.4','赵六','00150114622472500000000002','RECCWGWLEHEUVXHTFJISNNRENECVSTTA','4'),
('8A2F8B8B5D684087ACABEB09AD8689C0','2','2017-07-27 17:03:45','192.168.0.5','钱七','00150114622528500000000094','UCYGPDGAGDTQHTEXJHEJMKYRNPLKQUGN','0'),
('8AC48B41703A43709991457E565428AB','3','2017-07-27 17:03:45','192.168.0.4','赵六','00150114622479100000000011','CGEYUYFGHRVWEVLHGENUUJLUXKVXSMUL','11'),
('8BB9716B209A497D8CD1B608594B7D0F','1','2017-07-27 17:03:45','192.168.0.5','钱七','00150114622548900000000125','MKCCRGFXUPHFIRAIADOUMNGUPCIXSNML','1'),
('8E3A7EC69EAC49FB9890AA1B0DD520FD','32ABC9B38A274FDE86E8F17444C858D0','2017-07-27 17:03:45','192.168.0.5','钱七','00150114622518200000000077','MYBPRFBJFFVUTBAPSUKQHEWLRFSCOVHJ','4'),
('8E5E79E0E9184B9A8059A528175056F5','32ABC9B38A274FDE86E8F17444C858D0','2017-07-27 17:03:46','192.168.0.5','钱七','00150114622594500000000193','WBIPCUXQOTFYYUPCIYDIXXJDUVHFSAHS','10'),
('8F06843014E94351B5D4E70A15A45150','2','2017-07-27 17:03:45','192.168.0.5','钱七','00150114622507600000000057','TNNNSFPYMAPKNUHGGFAUVOPWBJDVNOYQ','8'),
('8F5F03D4707F4F00B50259AB550E3722','1BF2A7B347DC4FD784AC377373AE07CD','2017-07-27 17:03:45','192.168.0.1','张三','00150114622548000000000123','LQMOHWLTFCIHPOYXMBDSUFXPGSTOHIYS','6'),
('8FA815FE52844E988E0DF7FA7CF43DE1','32ABC9B38A274FDE86E8F17444C858D0','2017-07-27 17:03:45','192.168.0.5','钱七','00150114622483300000000018','RQYISUREGQUBIHSYPINQMPMQKTLCITNW','11'),
('90AC9F2F3DE249748A0475FC32D13A43','1BF2A7B347DC4FD784AC377373AE07CD','2017-07-27 17:03:45','192.168.0.5','钱七','00150114622543700000000116','JHGRSKXOPFXWPKKNADYVXMIGTRDQFCVU','0'),
('90FED5376B8D4161AD765ACFD2AF7449','3','2017-07-27 17:03:45','192.168.0.3','王五','00150114622484600000000020','EHRDCGPUWUXSRYPAVWSCGYLDUOCCVOJU','20'),
('90FF0ADECF3145E4861B4CF19D49E927','1BF2A7B347DC4FD784AC377373AE07CD','2017-07-27 17:03:45','192.168.0.3','王五','00150114622491000000000029','GQWCMFQNDPGOBLSIFNEXNBIQOKFSGPMR','14'),
('927ADD6A52EF428C97C6EC9F60FCFB4B','1BF2A7B347DC4FD784AC377373AE07CD','2017-07-27 17:03:45','192.168.0.1','张三','00150114622515100000000072','WQWWLAYJQPDEVWIALAOXWRTPTOYNELOR','17'),
('9308EC9BE65E4D0DB7EBAC95B1D488F6','3','2017-07-27 17:03:45','192.168.0.3','王五','00150114622537200000000104','KVLHAKMIBNDEVEIMLNQRDIUYFPIHFXGJ','2'),
('939FC1F1C14846EDB3EE3B61FBED6117','32ABC9B38A274FDE86E8F17444C858D0','2017-07-27 17:03:45','192.168.0.4','赵六','00150114622481000000000015','IGGOYDKPAPKHEOCJQYHCRCDXEUCGYHQG','8'),
('957E4602A53B410DBE262387A61A76A2','3','2017-07-27 17:03:45','192.168.0.5','钱七','00150114622505800000000054','BVGTJELCYIWJINMROSNBJRSPOEIOPUSF','17'),
('97236BF0128E40D2BB57877C64BABD19','1BF2A7B347DC4FD784AC377373AE07CD','2017-07-27 17:03:46','192.168.0.4','赵六','00150114622564200000000148','SUOHPCSEXTWWREJTARKILIYEUWHVUFOU','7'),
('9797F7209646464F813E7FE79C5E5EA3','1','2017-07-27 17:03:46','192.168.0.2','李四','00150114622572900000000160','WPHLYJAJQAJXOUKMUNLCCXMETYAQOJAE','3'),
('99906D7D227E425999D707AEBCF5DF6E','2','2017-07-27 17:03:45','192.168.0.2','李四','00150114622537800000000105','WEWWNAUNKBOBDIXQCHNIMJFLPUHRJUFY','2'),
('99B65ADBB2F245D69B5A7C23B87795D4','3','2017-07-27 17:03:46','192.168.0.5','钱七','00150114622587900000000185','FWDFAYPCMGJTLFTLSFXMSTKDRCLYSRCW','5'),
('9A5B25DF0AE046F6A041B561B1D10F43','32ABC9B38A274FDE86E8F17444C858D0','2017-07-27 17:03:45','192.168.0.2','李四','00150114622545400000000119','SRETKLWSUCCFXSOVBYXLQRIYXNHJJDPK','3'),
('9C7FD203975B4DB8A863F3FA560DBAB3','2','2017-07-27 17:03:46','192.168.0.4','赵六','00150114622583900000000179','BVQSMFRLODOMOCQUUBFVCKFVNKYYFMGW','3'),
('9F854E51AB094D39BC100D0ADF05D509','2','2017-07-27 17:03:46','192.168.0.1','张三','00150114622585600000000182','IWTVWIYIEKOCVBWMGYFKLNNNIKQNFVAF','1'),
('A145A9664D234EC29F2B58FE263D0D4A','1BF2A7B347DC4FD784AC377373AE07CD','2017-07-27 17:03:45','192.168.0.2','李四','00150114622544900000000118','UWFKDSUWNGAAMVGLXSRPHVPSWGQTJAQE','8'),
('A1B369570FA84F088E835359DBAD7482','32ABC9B38A274FDE86E8F17444C858D0','2017-07-27 17:03:45','192.168.0.4','赵六','00150114622517100000000075','PHMWAMVYLWUILHQHNAAQIWTUOHPXTSIG','6'),
('A211A8B1CD764CD89938A57510352D42','32ABC9B38A274FDE86E8F17444C858D0','2017-07-27 17:03:45','192.168.0.1','张三','00150114622503800000000051','QWGYDCJGSLYYRNWUFEUGYYLSLDNVSMVK','9'),
('A39D5CD7455748379F3D5E6729C5F088','3','2017-07-27 17:03:45','192.168.0.4','赵六','00150114622514700000000071','NYQJBUQKAGWRLHIRVHGMHLGQMRHMYHRP','4'),
('A5F1637063A5479698417F4BEDEB61B6','32ABC9B38A274FDE86E8F17444C858D0','2017-07-27 17:03:46','192.168.0.4','赵六','00150114622580000000000172','EOKAYQNXHNSGRVGGMTJWNMVCKYGAPKNU','16'),
('A65A1FDD4F104384B6818AB6D94AB7DF','32ABC9B38A274FDE86E8F17444C858D0','2017-07-27 17:03:45','192.168.0.2','李四','00150114622513700000000069','DNJNLQQHEBASABHMSWIYTVAVASAWYWAV','8'),
('A6D936D86A984BF7AD48110FB5DBDAFC','3','2017-07-27 17:03:45','192.168.0.5','钱七','00150114622530500000000097','YAPKEFQEDXNVWADRLQLSPUEGAOCNVVCE','3'),
('A7EA31D432D04D1E9A269ED7323093D6','2','2017-07-27 17:03:45','192.168.0.4','赵六','00150114622526100000000090','UKCRUOCVMINGTQXRKMYYAQEXJTCWFTPH','2'),
('A99279C5C5694F03A20CCEF38B8A4625','3','2017-07-27 17:03:45','192.168.0.5','钱七','00150114622549900000000127','CVRAYLKINBWRHOIUXBUEGBRLAUYMQVLI','19'),
('AA1C8313FAB94A6E9B8841BAEC2A8D0A','2','2017-07-27 17:03:45','192.168.0.3','王五','00150114622495100000000036','FRBWYOQNLKTRKERIUSRLDVPNNDFTCHKY','5'),
('AA7819E065E5430E9E9FE1AF563776BB','32ABC9B38A274FDE86E8F17444C858D0','2017-07-27 17:03:45','192.168.0.3','王五','00150114622486200000000023','EHXIVDPKHLNPSNMUFWWKDEHLLDQLPEEK','10'),
('AB22916E025542F0AFC0512DC6685402','32ABC9B38A274FDE86E8F17444C858D0','2017-07-27 17:03:46','192.168.0.4','赵六','00150114622589400000000186','LUJJPLMOSVVUKTIFJKHOEQHTBHYFBHPM','3'),
('ABF3D59FD79C4C5BB3CD902B9D619008','1','2017-07-27 17:03:45','192.168.0.1','张三','00150114622459200000000001','HTRELPMSDWOXBCQEHYNCRGSFNJWUUBUI','11'),
('B0F5247BB75B47F49834C0FF57371A7E','1BF2A7B347DC4FD784AC377373AE07CD','2017-07-27 17:03:45','192.168.0.3','王五','00150114622515700000000073','OFEPDWELNXONEDQISVBRETWRPQXKVPUT','17'),
('B1D03D2B9F644ECD91F554D789D0864B','3','2017-07-27 17:03:45','192.168.0.3','王五','00150114622542700000000114','TDMGQCGBOOCBAFDBHVMWRYAJGBNBRMOA','17'),
('B5D583E56C594907A57310BA403362A5','3','2017-07-27 17:03:45','192.168.0.1','张三','00150114622543200000000115','TBKDBFJFKXYEUWEQDKRAFHEUHDJTHYPE','5'),
('B5F6268352D54DFF9A7030B59F40F6B1','1BF2A7B347DC4FD784AC377373AE07CD','2017-07-27 17:03:45','192.168.0.4','赵六','00150114622495800000000037','WATPJSIWQYRIEKNBGFFFIFCTDJALFVGN','9'),
('B8EE4D35F3304320873AB61249E1F4CB','32ABC9B38A274FDE86E8F17444C858D0','2017-07-27 17:03:46','192.168.0.2','李四','00150114622586200000000183','YEFFGRTWLIOOHDBKWHECGCPODPCITNEX','5'),
('B92AC7C9D0174CE8AF28165C9082F540','32ABC9B38A274FDE86E8F17444C858D0','2017-07-27 17:03:45','192.168.0.3','王五','00150114622523700000000086','CQNNUNGGTEDOUWPPYOHBONMLFPMXNAGI','2'),
('BA00595928E44A47B3003C5E0880E9A9','1','2017-07-27 17:03:45','192.168.0.3','王五','00150114622520500000000081','RSLLRUHLUVJSQDDPVGOVOXWSRQVVHBPA','6'),
('BB99509E6CF547558ED6F11D95039262','1','2017-07-27 17:03:45','192.168.0.4','赵六','00150114622520000000000080','CGAUBNAKPYYSJBSLQPSHVOVNOWVRMGLG','0'),
('BBA73CB05FC94F8CABE16EE93EBB99C0','32ABC9B38A274FDE86E8F17444C858D0','2017-07-27 17:03:46','192.168.0.5','钱七','00150114622575000000000164','LHMXTIYADUEYCCOXTKNQNJIQTVHJSSMV','11'),
('BBCBBA07AE774E70AC1E4A3B70916F76','2','2017-07-27 17:03:46','192.168.0.2','李四','00150114622586900000000184','BGDVYLAOCOBDBBEGFEOLJCOYTRGCKWQA','7'),
('BC03846B9A9847BE83A177D588EDD2B8','1','2017-07-27 17:03:46','192.168.0.3','王五','00150114622551400000000130','HGIOHQSAUCRSNNVTGOQEWKYDVMVMDNAY','8'),
('BFDD0ACF16B843829A95C83F9C1778CE','1','2017-07-27 17:03:45','192.168.0.1','张三','00150114622496700000000039','QLPIPVOFHKHPKNDPFMJOGACAXXDGURHX','8'),
('C02821C926C24BBDBCC3E2452AA258A3','2','2017-07-27 17:03:45','192.168.0.2','李四','00150114622514200000000070','JGEUTQLFSTVGACCUGYJQKPWOQERRSMNJ','18'),
('C05776E74DDB402DAC8CB5A1A5351E32','2','2017-07-27 17:03:45','192.168.0.4','赵六','00150114622476600000000008','QEXAHXCULDPSJUGKOFTIKYSUOCDRGHOY','2'),
('C264F48FDB53441F91087D35EDDEB281','2','2017-07-27 17:03:46','192.168.0.2','李四','00150114622560100000000143','THLLTNKBPQBVVJEGLEXPNPBUTVXHPHJF','17'),
('C64DC4556E65432BB69D32FB41B4AAD1','2','2017-07-27 17:03:46','192.168.0.1','张三','00150114622597300000000198','AGGWMXGVSYMURFGTEEJSBDRGSIJCDIBW','0'),
('C66B3A4F607244B4A6891260F65875B3','32ABC9B38A274FDE86E8F17444C858D0','2017-07-27 17:03:46','192.168.0.3','王五','00150114622557300000000139','HEOMUWXPNUASQWHHDVLSXLMUQJDETUNX','11'),
('C6E348A775154BC0BD619621D4F2AE80','32ABC9B38A274FDE86E8F17444C858D0','2017-07-27 17:03:45','192.168.0.1','张三','00150114622541600000000112','IYBWXRGBDJHHWISQMKXVNVSSQCJTQHKS','9'),
('C7A9D28941AB4473A667EDA858889B19','2','2017-07-27 17:03:45','192.168.0.1','张三','00150114622506500000000055','KKPXILGGPPTRFOCYCHEXKEPBVURREPOK','12'),
('C9FE56E40021482EB2599FBC8F5B85D7','1','2017-07-27 17:03:45','192.168.0.4','赵六','00150114622475800000000007','HABPXVQIIJVPNLSIKFEKSFIRQWYNQJDN','18'),
('CD479A78E19D4E06A3C96D6B86F412CD','2','2017-07-27 17:03:45','192.168.0.4','赵六','00150114622480000000000013','EUXEGAYNXBJXMPBYIXEGMTHPBUTFOYFT','20'),
('CE1BBAF7F0D64CD9815D29DAFCD20A28','1BF2A7B347DC4FD784AC377373AE07CD','2017-07-27 17:03:45','192.168.0.5','钱七','00150114622479600000000012','UTKVKFHRBGNUKJOOGLJPMQPUSNNGSVWT','0'),
('CEAA1A1A9748457282B4B3FDC67DCDB9','1','2017-07-27 17:03:45','192.168.0.1','张三','00150114622505100000000053','LACBHFPEIRGULFHIYFFSDQKJSKCVYNNN','11'),
('D303B41FBF8E487996E50316124AA342','1BF2A7B347DC4FD784AC377373AE07CD','2017-07-27 17:03:45','192.168.0.5','钱七','00150114622497900000000041','EPCSIREREOQWTODCESFHFRKEIIGUWUXT','5'),
('D3F9562B8DE944EFA83AD54A12CD45F5','3','2017-07-27 17:03:45','192.168.0.1','张三','00150114622521100000000082','NWQIDELXUILGEOLTPWTQJWOGVJGHJVUH','3'),
('D8A1E5B3A9D44B3DAC30417960E5180A','3','2017-07-27 17:03:45','192.168.0.4','赵六','00150114622516200000000074','WDTYEBQLOTOLBSMIDXIBJYCPTYHTHGUJ','0'),
('DA63942F10EA4F5CB11B4F731B191550','1','2017-07-27 17:03:46','192.168.0.5','钱七','00150114622569800000000155','MDWAKYHXVXQFCLOBMJLGXANMVEEXOPBV','4'),
('DBC409EE37904AC68712894A1DA59182','2','2017-07-27 17:03:46','192.168.0.5','钱七','00150114622556800000000138','FEJWVNYUUWCXYOHHSSDDPLQCPOYAFUBK','10'),
('DBE70AACC2BF4FA9B4FE8E576EA51927','3','2017-07-27 17:03:45','192.168.0.5','钱七','00150114622522500000000084','MOTSXHACUYHMTOMURSEJVQIDGQGAVIIO','18'),
('DE8513ABBE074A87B09DFE47220F8CDB','1','2017-07-27 17:03:45','192.168.0.1','张三','00150114622501200000000046','VIQIIDQLSKWUADXWNFYTNESNRMLYKSHO','15'),
('E088B90A88F34229A792ECF0A9E0A8D4','1','2017-07-27 17:03:45','192.168.0.4','赵六','00150114622486600000000024','IUDVXHOLOCSQSOLCAPNYNGAPADKRNOGS','10'),
('E327C97AE2E04F9CA5F201922B4425E6','1BF2A7B347DC4FD784AC377373AE07CD','2017-07-27 17:03:45','192.168.0.4','赵六','00150114622509100000000060','BVNXTFLWLTIKHVEAPIHJUBIWQYLIFAJF','1'),
('E430DE1746EF4395B4B98CAF59D94724','1','2017-07-27 17:03:46','192.168.0.4','赵六','00150114622578500000000169','QDBNSYDWUQUIAOPDPSKQWXEKKIOFPKKA','6'),
('E6587C51566146E890A504CD1DBE6A42','2','2017-07-27 17:03:45','192.168.0.4','赵六','00150114622511600000000065','ACICTSIFIDVBEXNDVHLNAGTMSTVDIFJN','3'),
('E6905004EE7642369A75DF067658F8B8','32ABC9B38A274FDE86E8F17444C858D0','2017-07-27 17:03:46','192.168.0.5','钱七','00150114622566200000000151','RQSFLDNPXYVBJHYHCFEWRCJXLXNYPXST','11'),
('E6913D619AD6467C9006AC72D46D424F','3','2017-07-27 17:03:45','192.168.0.3','王五','00150114622524500000000087','SOAPNRVMHGSORSNYKJDUKWNRETTKAULE','19'),
('E7E9622EED50494CBADF21C9357502E4','2','2017-07-27 17:03:46','192.168.0.2','李四','00150114622585000000000181','GKVXFYACAYLJQLELFHSDMALEXDUHIRFL','18'),
('E8FF6A4068D9479CA10A7747EF6038EA','1','2017-07-27 17:03:45','192.168.0.4','赵六','00150114622501700000000047','AFGEYXJYVTICVAEFLUMWNQWQSFPXXKXX','14'),
('EAEC4880043B45BF974FF1743F4B1DDA','1','2017-07-27 17:03:45','192.168.0.2','李四','00150114622498900000000043','IVSHIUJNSCHETLALSVYWUTTGOBBHRHFX','19'),
('EC0C6EE392AD45CF986FE7E25197A411','32ABC9B38A274FDE86E8F17444C858D0','2017-07-27 17:03:46','192.168.0.3','王五','00150114622561900000000144','EBQYYKBFRWSNVHTVKFGDKVCPPVJXTCLD','5'),
('ECA694815E86424D882A05F408D4A359','1BF2A7B347DC4FD784AC377373AE07CD','2017-07-27 17:03:46','192.168.0.4','赵六','00150114622570600000000156','YGPSOWBHPHWAKRIHBJJKAMCLCRNTOSPK','8'),
('EF1B448BD8424DE085BED9CE1290143E','1','2017-07-27 17:03:46','192.168.0.3','王五','00150114622593200000000191','BIXXHYBKFGVSFTYBUFEVTHPBLWOXKRMP','10'),
('EF534F6F783F44DF97647B70E107E05B','3','2017-07-27 17:03:45','192.168.0.1','张三','00150114622512700000000067','YWWAWNCCVYKSKKXGXACIJDPVOQAAFOME','4'),
('F0B416F9AAA64C9CA5BB6C84D982AC7B','1','2017-07-27 17:03:46','192.168.0.3','王五','00150114622579600000000171','MTVILOXLCEVTBOBSBXKQRKTMHLQEEYIJ','15'),
('F151E60074754F839E07C9DA0557A723','32ABC9B38A274FDE86E8F17444C858D0','2017-07-27 17:03:45','192.168.0.3','王五','00150114622502900000000049','AYOTRWLKLQFIXGTUWHVKFMWOXOPOAWIF','0'),
('F33C3BFD47F5437FBC5F1CA385E895EE','32ABC9B38A274FDE86E8F17444C858D0','2017-07-27 17:03:46','192.168.0.5','钱七','00150114622550900000000129','AROTXVGRSSBMTWMGCQCPHTYOSFAPDJYE','15'),
('F365AE90857E4A4585733706C10F80F6','1BF2A7B347DC4FD784AC377373AE07CD','2017-07-27 17:03:45','192.168.0.1','张三','00150114622538200000000106','SWBKESIPUMKJNQEOJDHPSFBYTUJNJEEK','1'),
('F4D922974DAB4D53A2E6CCA527191311','2','2017-07-27 17:03:45','192.168.0.2','李四','00150114622492900000000033','AMWIWJVPSBOCBELYPLHEUSBMDTIDMAJG','1'),
('F510685B31B34B419435C4023E2C6305','2','2017-07-27 17:03:46','192.168.0.3','王五','00150114622564900000000149','ODRTETLIEFVCRUCMAMMLFFBQPGFWTEUK','7'),
('F545282B259F4100AE5E73906AF85B1A','3','2017-07-27 17:03:46','192.168.0.5','钱七','00150114622575800000000165','LHSNJECCKJHHLDKEBXYBAIGXAMAKFRPB','0'),
('F66F03F33D3E4ABE9D7AEEA88E7C91F6','3','2017-07-27 17:03:46','192.168.0.1','张三','00150114622566600000000152','LEMJTDMFBHPYPFKDSPERYKPRWMTPUEWQ','13'),
('F6A8EBC3088E43C292DC297CC22BC8DF','1','2017-07-27 17:03:45','192.168.0.3','王五','00150114622548400000000124','SCMPFPWANVOXQOEUGJCAVDDYCLVPULJN','3'),
('F748264B3D83403F8B9DA303417B74C9','32ABC9B38A274FDE86E8F17444C858D0','2017-07-27 17:03:46','192.168.0.4','赵六','00150114622598300000000200','SECQCJOJDNBGSTQYTQBXSCHGQBVOLFVS','0'),
('F8C5B9A7860449B2B6488EE90FA64B52','1BF2A7B347DC4FD784AC377373AE07CD','2017-07-27 17:03:45','192.168.0.1','张三','00150114622473100000000003','PMRQCUJXWGWTMVGJSWNJRWTSVAVPSFJW','6'),
('F95E093B409C45D6955A0EE5E504810B','2','2017-07-27 17:03:46','192.168.0.3','王五','00150114622577500000000167','VUCCGHEREPTYORMGNXDYJOXKEURAULFV','1'),
('F96A4DDCF8FE473E93C39C17E73D2F9B','1','2017-07-27 17:03:46','192.168.0.1','张三','00150114622574000000000162','PORFBDGPRWLRWYECWSUTWRGHWBSCRLSG','10'),
('F9D2A0D592064906925D2A2125513F93','3','2017-07-27 17:03:46','192.168.0.3','王五','00150114622583300000000178','XTPNIFMMNCHOHAUARJXWYDWAWPBNMMGG','8'),
('FA4F717F54464CD1B18933E394EE580E','2','2017-07-27 17:03:46','192.168.0.5','钱七','00150114622558000000000140','DTIAUUGIJMVOUAQFLONXSTAEFXODUNBH','20'),
('FA7729D531F8437D9C4AD232C69152AA','1BF2A7B347DC4FD784AC377373AE07CD','2017-07-27 17:03:45','192.168.0.5','钱七','00150114622536200000000102','XYHLPPCINJTWTNIOAILVXKGBVARMUXAF','10'),
('FC2C5F2D421E4201B6217E7FFB8BE71C','2','2017-07-27 17:03:45','192.168.0.4','赵六','00150114622531000000000098','KLQHRVGKBHRKEYURPFOFHGCSCPECKQLW','8'),
('FD11BB9D1253490D8222BD9AAA6A857A','1','2017-07-27 17:03:45','192.168.0.1','张三','00150114622490300000000028','BIXYOCPGHUUYKFPUBOXFGGBLURDXTRTC','21'),
('FD602F5FFFF6430D97BC45130A2A969B','2','2017-07-27 17:03:45','192.168.0.5','钱七','00150114622496300000000038','OUUDIMLRCBSBCICOOUEGACMELFBETWQU','17'),
('FE3DCF165C554C049A0F38A25E9702AB','1BF2A7B347DC4FD784AC377373AE07CD','2017-07-27 17:03:45','192.168.0.3','王五','00150114622498300000000042','IWRITMVOJIYHNINVNFVJRDIYWGWRSXFB','19'),
('FEB15A1230D341878942B87F28F60302','2','2017-07-27 17:03:45','192.168.0.3','王五','00150114622481500000000016','WWBANGWAHNUKBXXEHLKATOKYWIBRXIHI','8'),
('FEE8E644CE81492FB76FB942522C4CD3','1BF2A7B347DC4FD784AC377373AE07CD','2017-07-27 17:03:46','192.168.0.4','赵六','00150114622559000000000142','CJJCHDEXAYCNCJSVNEJAALQXWOBIVBTN','9'),
('FFEA967CAF8E4770AD516EB76A2057A9','32ABC9B38A274FDE86E8F17444C858D0','2017-07-27 17:03:45','192.168.0.3','王五','00150114622487900000000026','USKMJJBIQJKGVLLEXVBVNARJEFKQOMRE','5');

/*Table structure for table `rmc_resource` */

DROP TABLE IF EXISTS `rmc_resource`;

CREATE TABLE `rmc_resource` (
  `id` varchar(32) NOT NULL COMMENT '主键ID',
  `name` varchar(100) DEFAULT NULL COMMENT '资源名称|true`.*{2,100}`资源名称长度必须大于2位长度',
  `type` varchar(20) DEFAULT NULL COMMENT '资源类型',
  `property_id` varchar(32) DEFAULT NULL COMMENT '资源属性ID',
  `metadata_id` varchar(32) DEFAULT NULL COMMENT '资源元数据ID',
  `url` varchar(200) DEFAULT NULL COMMENT '资源的URL|true`^[A-Za-z]+://`不合法的URL地址',
  `icon` longtext COMMENT '资源图标',
  `use_proxy` int(11) DEFAULT '0' COMMENT '是否使用代理',
  `proxy_url` varchar(200) DEFAULT NULL COMMENT '代理地址',
  `use_cache` int(11) DEFAULT '0' COMMENT '是否使用缓存',
  `cache_config_id` varchar(32) DEFAULT NULL COMMENT '缓存配置ID',
  `org_id` varchar(32) DEFAULT NULL COMMENT '资源所属组织机构ID',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `need_audit` int(11) DEFAULT '0' COMMENT '是否需要审核',
  `audit_status` varchar(20) DEFAULT NULL COMMENT '审核状态',
  `audit_date` datetime DEFAULT NULL COMMENT '审核时间',
  `auditor_id` varchar(32) DEFAULT NULL COMMENT '审核人ID',
  `auditor` varchar(30) DEFAULT NULL COMMENT '审核人姓名',
  `audit_opinion` varchar(500) DEFAULT NULL COMMENT '审核意见',
  `create_date` datetime DEFAULT NULL COMMENT '注册时间',
  `creator_id` varchar(32) DEFAULT NULL COMMENT '注册人ID',
  `creator` varchar(30) DEFAULT NULL COMMENT '注册人姓名',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `updater_id` varchar(32) DEFAULT NULL COMMENT '更新人ID',
  `updater` varchar(30) DEFAULT NULL COMMENT '更新人姓名',
  `is_delete` int(11) DEFAULT '0' COMMENT '是否已删除',
  `delete_date` datetime DEFAULT NULL COMMENT '删除时间',
  `deleter_id` varchar(32) DEFAULT NULL COMMENT '删除人ID',
  `deleter` varchar(30) DEFAULT NULL COMMENT '删除人姓名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `rmc_resource` */

insert  into `rmc_resource`(`id`,`name`,`type`,`property_id`,`metadata_id`,`url`,`icon`,`use_proxy`,`proxy_url`,`use_cache`,`cache_config_id`,`org_id`,`remark`,`need_audit`,`audit_status`,`audit_date`,`auditor_id`,`auditor`,`audit_opinion`,`create_date`,`creator_id`,`creator`,`update_date`,`updater_id`,`updater`,`is_delete`,`delete_date`,`deleter_id`,`deleter`) values 
('1','tt','数据资源',NULL,NULL,NULL,NULL,1,NULL,1,NULL,'4','呵呵',0,NULL,NULL,NULL,NULL,NULL,'2017-07-13 13:44:26',NULL,NULL,'2017-07-21 10:00:19',NULL,'张三',0,NULL,NULL,NULL),
('1BF2A7B347DC4FD784AC377373AE07CD','服务1','服务资源','0CD52B8777B94E53BE0AA0428D911D95','6DCA53C6CEFC44E2AC6626809AB9FB8C','1','11',0,NULL,0,NULL,'1','1',0,NULL,NULL,NULL,NULL,NULL,'2017-07-26 14:27:04',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL),
('2','ee','gis资源',NULL,NULL,NULL,NULL,0,NULL,1,NULL,'4',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-07-21 10:00:19',NULL,NULL,0,NULL,NULL,NULL),
('3','ff','服务资源',NULL,NULL,NULL,NULL,0,NULL,1,NULL,'1','秀禾服甲方',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-07-21 10:00:19',NULL,NULL,0,NULL,NULL,NULL),
('32ABC9B38A274FDE86E8F17444C858D0','a','a','59DDD62BB01844639ACC29C252BDE7CD','25E73E7582CD461494C47A68BF34D7E8','1','1',0,NULL,0,NULL,'1','1',0,NULL,NULL,NULL,NULL,NULL,'2017-07-25 10:21:33',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
('4','gg','文件资源',NULL,NULL,NULL,NULL,1,NULL,1,NULL,'3',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-07-24 09:04:23',NULL,NULL,0,NULL,NULL,NULL),
('650481EE0FF944608BF673001D0D0549','q','q','5651EE47CEFA44B8B0345F5AC05CAF94','7AF3434ECA714A8C992A07061C1AFE1C','q','q',1,NULL,NULL,NULL,'q','q',NULL,NULL,NULL,NULL,NULL,NULL,'2017-07-20 09:01:07',NULL,NULL,'2017-07-24 09:04:23',NULL,NULL,0,NULL,NULL,NULL),
('80E40338F5434D69975A63AFBC240D53','资源','资源1','B14F3E74567846138A7FD11F6F9EC789','051FAF05517344648F5873944295161A','w://','1',0,NULL,0,NULL,'1','1',0,NULL,NULL,NULL,NULL,NULL,'2017-07-25 17:23:43',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL),
('85F0A81779204AF2B11B34B6555425EB','a','a','70329B7BE1064B9CBCB11119886498DA','B5B19F9F8E2B451D80B740BFA73BC703','1','1',0,NULL,0,NULL,'1','1',0,NULL,NULL,NULL,NULL,NULL,'2017-07-25 10:07:54',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
('9F6279D07AB647439481D196E5DE3A10','文件1','文件资源','A6265DA0022A4581AF6AF7A6041E50C3','6F00EF7BCA8D48B79CE770F521291608','1','1',0,NULL,0,NULL,'1','1',0,NULL,NULL,NULL,NULL,NULL,'2017-07-27 14:36:06',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL),
('AEEF0282B45C442384A0106C9BE15F89','文件1','文件资源','E2956D19E0244623A4C61B05D6C92D42','D8C4B29132894D46A55F63BEAB306781','1','1',0,NULL,0,NULL,'1','1',0,NULL,NULL,NULL,NULL,NULL,'2017-07-26 15:35:24',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL),
('DC507238145649ED96ED90405A24D5C7','服务3','服务资源','53B8F22F23CD4B9490CF07E0E4C7C9DB','1C9B52C9B69B4A8F924F6074BDA3486B','2','2',0,NULL,0,NULL,'2','2',0,NULL,NULL,NULL,NULL,NULL,'2017-07-26 14:42:10',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL),
('E09CC0D691EF457F950D1788A6E57EE9','服务2','服务资源','0E7FF04A8FC7478480F75F7B8D2F02E3','A5E259063C6048718CF493236B9F850C','3','3',0,NULL,0,NULL,'3','3',0,NULL,NULL,NULL,NULL,NULL,'2017-07-26 14:36:38',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL);

/*Table structure for table `rmc_rls_data_property` */

DROP TABLE IF EXISTS `rmc_rls_data_property`;

CREATE TABLE `rmc_rls_data_property` (
  `id` varchar(32) DEFAULT NULL COMMENT '主键ID',
  `description` varchar(500) DEFAULT NULL COMMENT '描述信息'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `rmc_rls_data_property` */

/*Table structure for table `rmc_rls_file_property` */

DROP TABLE IF EXISTS `rmc_rls_file_property`;

CREATE TABLE `rmc_rls_file_property` (
  `id` varchar(32) DEFAULT NULL COMMENT '主键ID',
  `description` varchar(500) DEFAULT NULL COMMENT '描述信息'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `rmc_rls_file_property` */

/*Table structure for table `rmc_rls_gis_property` */

DROP TABLE IF EXISTS `rmc_rls_gis_property`;

CREATE TABLE `rmc_rls_gis_property` (
  `id` varchar(32) DEFAULT NULL COMMENT '主键ID',
  `description` varchar(500) DEFAULT NULL COMMENT '描述信息'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `rmc_rls_gis_property` */

/*Table structure for table `rmc_subject` */

DROP TABLE IF EXISTS `rmc_subject`;

CREATE TABLE `rmc_subject` (
  `id` varchar(32) NOT NULL COMMENT '主键ID',
  `name` varchar(50) DEFAULT NULL COMMENT '专题名称|true',
  `description` varchar(500) DEFAULT NULL COMMENT '专题描述信息',
  `icon` longtext COMMENT '专题图标',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `creator_id` varchar(32) DEFAULT NULL COMMENT '创建人ID',
  `creator` varchar(30) DEFAULT NULL COMMENT '创建人姓名',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `updater_id` varchar(32) DEFAULT NULL COMMENT '更新人ID',
  `updater` varchar(30) DEFAULT NULL COMMENT '更新人姓名',
  `delete_date` datetime DEFAULT NULL COMMENT '删除时间',
  `deleter_id` varchar(32) DEFAULT NULL COMMENT '删除人ID',
  `deleter` varchar(30) DEFAULT NULL COMMENT '删除人姓名',
  `is_delete` int(11) DEFAULT '0' COMMENT '是否已删除',
  `is_valid` int(11) DEFAULT '0' COMMENT '是否有效:启用/停用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `rmc_subject` */

insert  into `rmc_subject`(`id`,`name`,`description`,`icon`,`create_date`,`creator_id`,`creator`,`update_date`,`updater_id`,`updater`,`delete_date`,`deleter_id`,`deleter`,`is_delete`,`is_valid`) values 
('11AA0961F051426E87A82299C9094AE3','奥巴马','人终有一死，而有些人则需要一点小小的帮助',NULL,'2017-07-14 11:10:31',NULL,NULL,'2017-07-18 10:46:31',NULL,NULL,NULL,NULL,NULL,0,0),
('36AFE94DB1294CD2B39942F1DFEF6962','李青','双眼失明丝毫不影响我追捕敌人',NULL,'2017-07-14 13:13:07',NULL,NULL,'2017-07-18 10:46:25',NULL,NULL,NULL,NULL,NULL,1,1),
('396262121DA84DB2BC4E4C62B6B5B7B9','aa','',NULL,'2017-07-26 08:58:49','1','张三',NULL,NULL,NULL,NULL,NULL,NULL,1,0),
('4C31CC7476A345E486B6089D4736DF91','劫','只有高手才能活下来',NULL,'2017-07-14 13:17:37',NULL,NULL,'2017-07-18 10:46:31',NULL,NULL,NULL,NULL,NULL,0,0),
('547AD8956FBF4D8487CEADC0BFA19978','辛德拉','我的能量无穷无尽',NULL,'2017-07-25 15:35:11','1','张三','2017-07-25 16:13:16','1','张三',NULL,NULL,NULL,0,0),
('5B15B99A82D14406884318FCABB57AF7','贾克斯','没想到吧我又回来了',NULL,'2017-07-25 15:30:52','1','张三',NULL,NULL,NULL,NULL,NULL,NULL,0,0),
('75C39336A00E45589DFE374560CD4DAF','嘉文四世','犯我德邦者虽远必诛',NULL,'2017-07-25 11:19:01','1','张三','2017-07-25 11:48:25','1','张三',NULL,NULL,NULL,0,0),
('91F140B90F8241CB80F8B80D347AE6EF','AA','',NULL,'2017-07-26 09:05:03','1','张三',NULL,NULL,NULL,NULL,NULL,NULL,1,0),
('B526658364C64F81BEC96396F386A913','卡兹克','改变就是好事',NULL,'2017-07-17 14:25:55',NULL,NULL,'2017-07-21 10:20:42',NULL,NULL,NULL,NULL,NULL,1,0),
('BE3628C3D0C34B0CB2E8B62B383C124A','李青','我用双手成就你的梦想了',NULL,'2017-07-21 11:19:51',NULL,NULL,'2017-07-21 13:32:42',NULL,NULL,NULL,NULL,NULL,0,0),
('C7E7EA4455904E1F9C4A1049049A14A6','亚索','死亡如风',NULL,'2017-07-17 14:55:01',NULL,NULL,'2017-07-24 11:00:50',NULL,NULL,NULL,NULL,NULL,0,1),
('E928F58CD03B47459DB16A7561344A7D','赫卡里姆','暗影岛',NULL,'2017-07-14 16:34:30',NULL,NULL,'2017-07-24 11:00:50',NULL,NULL,NULL,NULL,NULL,0,1),
('EE768C17415A4D3E9A4A6A1C4C2A49A0','伊泽瑞尔','在别的游戏里，像我这么帅的一般都是主角哦',NULL,'2017-07-21 11:17:19',NULL,NULL,'2017-07-21 13:35:01',NULL,NULL,NULL,NULL,NULL,0,0);

/*Table structure for table `rmc_subject_authority` */

DROP TABLE IF EXISTS `rmc_subject_authority`;

CREATE TABLE `rmc_subject_authority` (
  `id` varchar(32) NOT NULL COMMENT '主键ID',
  `subject_id` varchar(32) DEFAULT NULL COMMENT '专题ID',
  `target_type` varchar(20) DEFAULT NULL COMMENT '授权对象类型: 用户/角色/机构',
  `target_id` varchar(32) DEFAULT NULL COMMENT '授权对象ID:用户ID/角色ID/机构ID',
  `authorize_date` datetime DEFAULT NULL COMMENT '授权时间',
  `authorizer_id` varchar(32) DEFAULT NULL COMMENT '授权人ID',
  `authorizer` varchar(30) DEFAULT NULL COMMENT '授权人姓名',
  `is_valid` int(11) DEFAULT '0' COMMENT '是否有效: 启用/停用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `rmc_subject_authority` */

insert  into `rmc_subject_authority`(`id`,`subject_id`,`target_type`,`target_id`,`authorize_date`,`authorizer_id`,`authorizer`,`is_valid`) values 
('0208FF0DB0414C4F8A68AA0371CE3CD7','EE768C17415A4D3E9A4A6A1C4C2A49A0','用户','101','2017-07-21 11:21:46','1','张三',0),
('06089BE12FE7430B9EA346493EB5A112','EE768C17415A4D3E9A4A6A1C4C2A49A0','角色','62','2017-07-21 11:20:32','1','张三',1),
('0C8E1B31D3BA4A1A9351112CF4FAF6DE','BE3628C3D0C34B0CB2E8B62B383C124A','机构','66','2017-07-21 13:31:43','1','张三',0),
('14EB7038089B4513A49FE132B735D094','11AA0961F051426E87A82299C9094AE3','角色','1','2017-07-20 10:23:04','1','张三',0),
('22DC8AB5025248B688D5CB4CD8EC69DE','11AA0961F051426E87A82299C9094AE3','用户','90','2017-07-20 16:39:31','1','张三',1),
('262919EA3A3A49EF884586C34F9AFBCC','BE3628C3D0C34B0CB2E8B62B383C124A','用户','112','2017-07-21 13:31:02','1','张三',0),
('2BB12963D73B47339C0CEB778919FA37','BE3628C3D0C34B0CB2E8B62B383C124A','角色','1','2017-07-21 13:31:19','1','张三',0),
('2FE054D781E64375A6B07F162711F140','11AA0961F051426E87A82299C9094AE3','角色','47','2017-07-20 13:42:25','1','张三',1),
('315D1675FF3E4F5E84900AE9BD5B9E97','EE768C17415A4D3E9A4A6A1C4C2A49A0','机构','67','2017-07-21 11:20:42','1','张三',1),
('339A4B61ABB3465F8E2784C689CCD671','11AA0961F051426E87A82299C9094AE3','角色','62','2017-07-20 10:21:11','1','张三',0),
('346A34AD67414F9E99C743B1C918720C','EE768C17415A4D3E9A4A6A1C4C2A49A0','用户','106','2017-07-21 11:21:46','1','张三',0),
('4A6BA62F78BA4C90968077877EBAB782','BE3628C3D0C34B0CB2E8B62B383C124A','机构','7','2017-07-21 13:31:43','1','张三',0),
('4D4EAF6C6CB848228F6F5BA991F4BB22','BE3628C3D0C34B0CB2E8B62B383C124A','用户','4','2017-07-21 13:31:02','1','张三',0),
('4D560B1F6CA04AB3A517ACCD9C8AEDCE','EE768C17415A4D3E9A4A6A1C4C2A49A0','机构','88','2017-07-21 11:20:42','1','张三',1),
('582F28D0F4FE4315B3E14D4E352D2EDD','BE3628C3D0C34B0CB2E8B62B383C124A','机构','2','2017-07-21 13:31:52','1','张三',0),
('6BBE2D237B094540872F4FF23776109F','EE768C17415A4D3E9A4A6A1C4C2A49A0','用户','118','2017-07-21 11:21:46','1','张三',0),
('6BE64961AB2241BEAEFB60307674A107','C7E7EA4455904E1F9C4A1049049A14A6','机构','6','2017-07-20 09:13:15','1','张三',1),
('7E8C1266D87A4CCD99A40E5F300FB1AD','EE768C17415A4D3E9A4A6A1C4C2A49A0','用户','116','2017-07-21 11:20:23','1','张三',1),
('84DFA62BB92D4303ADB7B7915D9AB293','BE3628C3D0C34B0CB2E8B62B383C124A','用户','7','2017-07-21 13:31:02','1','张三',0),
('8AC1F0589EF44DDCA19B97E7E7B4EFAD','BE3628C3D0C34B0CB2E8B62B383C124A','用户','88','2017-07-21 13:31:02','1','张三',0),
('9405A52D00F2402996313B7E648D5FBE','11AA0961F051426E87A82299C9094AE3','机构','59','2017-07-20 13:39:39','1','张三',0),
('9666FA8A2D06455CB5F629459D64694C','BE3628C3D0C34B0CB2E8B62B383C124A','机构','8','2017-07-21 13:31:43','1','张三',0),
('967C3ED48AFC421E901C78BEF12EE63A','EE768C17415A4D3E9A4A6A1C4C2A49A0','用户','88','2017-07-21 11:21:46','1','张三',1),
('97F9C07A996A4C7DB4463C7993DD5896','BE3628C3D0C34B0CB2E8B62B383C124A','用户','123','2017-07-21 13:31:02','1','张三',0),
('A477DBD0E4A5479B88C90C4610DA3711','11AA0961F051426E87A82299C9094AE3','用户','116','2017-07-20 10:04:45','1','张三',0),
('A5952B4890314FE0A74D00ADF087CF97','BE3628C3D0C34B0CB2E8B62B383C124A','角色','47','2017-07-21 13:31:19','1','张三',0),
('B5FA37FB8028427B8C24D3CB91E4BCFC','BE3628C3D0C34B0CB2E8B62B383C124A','机构','62','2017-07-21 13:31:43','1','张三',0),
('CA0F3E5B8E484636A4C42D1BEDA4464E','EE768C17415A4D3E9A4A6A1C4C2A49A0','用户','94','2017-07-21 11:21:46','1','张三',1),
('CC04477BB2FC428DA15408FAF7F5DB06','EE768C17415A4D3E9A4A6A1C4C2A49A0','用户','108','2017-07-21 11:21:46','1','张三',0),
('CFD3D7AAAD474C949DE3B138D6745F0A','C7E7EA4455904E1F9C4A1049049A14A6','用户','116','2017-07-20 10:34:10','1','张三',1),
('D3261C7833A24FC5A0E8D964BA992FF0','BE3628C3D0C34B0CB2E8B62B383C124A','角色','62','2017-07-21 13:31:19','1','张三',0),
('EE18D738E0674C8B9C36F5618C714DA3','EE768C17415A4D3E9A4A6A1C4C2A49A0','角色','2','2017-07-21 11:21:27','1','张三',0),
('F0E3D074F35E4557889E4FF1B5ACDCA6','BE3628C3D0C34B0CB2E8B62B383C124A','角色','35','2017-07-21 13:31:19','1','张三',0),
('FB7B57DA8E4844B4BFEB11D2D7AD10E7','11AA0961F051426E87A82299C9094AE3','角色','50','2017-07-20 10:21:11','1','张三',1),
('FB970E7B9E2E4568803F08D786EAC476','11AA0961F051426E87A82299C9094AE3','机构','66','2017-07-20 10:23:48','1','张三',1);

/*Table structure for table `rmc_subject_res` */

DROP TABLE IF EXISTS `rmc_subject_res`;

CREATE TABLE `rmc_subject_res` (
  `id` varchar(32) NOT NULL COMMENT '主键ID',
  `subject_id` varchar(32) DEFAULT NULL COMMENT '专题ID',
  `res_id` varchar(32) DEFAULT NULL COMMENT '资源ID',
  `create_date` datetime DEFAULT NULL COMMENT '专题资源配置时间',
  `creator_id` varchar(32) DEFAULT NULL COMMENT '配置人ID',
  `creator` varchar(30) DEFAULT NULL COMMENT '配置人姓名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `rmc_subject_res` */

insert  into `rmc_subject_res`(`id`,`subject_id`,`res_id`,`create_date`,`creator_id`,`creator`) values 
('70EAE3D1435941EAB3BEEF563B24B295','EE768C17415A4D3E9A4A6A1C4C2A49A0','2','2017-07-21 11:19:11','1','张三'),
('7E7239FD45EE4E5D94BC2477D8C54258','11AA0961F051426E87A82299C9094AE3','1','2017-07-21 13:26:36','1','张三'),
('7FEA57B874E449D1A06B4F0FE64C236C','BE3628C3D0C34B0CB2E8B62B383C124A','4','2017-07-21 13:30:22','1','张三'),
('94497F025DC34EC3B04ADF717F665FB2','B526658364C64F81BEC96396F386A913','2','2017-07-18 13:15:39','1','张三'),
('A8FE9C0E87144FE18A01FDDD7B6EB042','11AA0961F051426E87A82299C9094AE3','2','2017-07-21 13:26:36','1','张三'),
('C06466F8440D44E99D5FC5FE73AAA0ED','EE768C17415A4D3E9A4A6A1C4C2A49A0','3','2017-07-21 11:19:11','1','张三'),
('C405453439084D669BA68CCBE917AC21','B526658364C64F81BEC96396F386A913','1','2017-07-18 13:15:39','1','张三'),
('C4D4C0FF6869459C86BA6392063009EF','BE3628C3D0C34B0CB2E8B62B383C124A','2','2017-07-21 13:30:22','1','张三'),
('CC0A218AF79F4458A158B303AC19701F','C7E7EA4455904E1F9C4A1049049A14A6','1','2017-07-21 10:21:32','1','张三'),
('D725DD6862EA41FC9D51D7429B69B6DB','B72C3106EA344CA9A4BE2F258EC3098B','1','2017-07-18 11:25:47','1','张三'),
('F15D28FD8DE14EFA9A9A7A0AD649AB87','B72C3106EA344CA9A4BE2F258EC3098B','2','2017-07-18 11:25:47','1','张三'),
('F970609CFE7D4C8AB2C4289F1904A0FE','EE768C17415A4D3E9A4A6A1C4C2A49A0','1','2017-07-21 11:18:45','1','张三');

/*Table structure for table `rmc_sys_oper_log` */

DROP TABLE IF EXISTS `rmc_sys_oper_log`;

CREATE TABLE `rmc_sys_oper_log` (
  `id` varchar(32) NOT NULL COMMENT '主键ID',
  `module` varchar(100) DEFAULT NULL COMMENT '功能模块',
  `description` varchar(500) DEFAULT NULL COMMENT '操作描述',
  `operate_date` datetime DEFAULT NULL COMMENT '操作时间',
  `operator_id` varchar(32) DEFAULT NULL COMMENT '操作人ID',
  `operator` varchar(30) DEFAULT NULL COMMENT '操作人姓名',
  `operator_ip` varchar(50) DEFAULT NULL COMMENT '操作人IP',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `rmc_sys_oper_log` */

insert  into `rmc_sys_oper_log`(`id`,`module`,`description`,`operate_date`,`operator_id`,`operator`,`operator_ip`) values 
('00AEE745BDD54F4985FBA43348E37B9D','专题管理','zhaoliu:3','2017-07-27 16:55:56','4','赵六','192.168.0.4'),
('03CD0AA040D344F2AA7EFF0D3BD6B11E','资源配置','zhaoliu:32ABC9B38A274FDE86E8F17444C858D0','2017-07-27 16:55:56','4','赵六','192.168.0.4'),
('07A9E79140D146EBAFF019E85E3A8B0B','问题管理','lisi:1','2017-07-27 16:55:56','2','李四','192.168.0.2'),
('07C08FEAE1F04B56B04CE69BEEC7FFD3','典型案例管理','wangwu:3','2017-07-27 16:55:56','3','王五','192.168.0.3'),
('07C6C9458FED40FD9F71F82A6CFA8DF8','资源配置','qianqi:2','2017-07-27 16:55:56','5','钱七','192.168.0.5'),
('07E151B073D448AC9347F152E291984F','日志管理','zhangsan:1BF2A7B347DC4FD784AC377373AE07CD','2017-07-27 16:55:56','1','张三','192.168.0.1'),
('0A09136C42D742A593DDA80B4D4DC40E','行业资讯管理','zhangsan:1BF2A7B347DC4FD784AC377373AE07CD','2017-07-27 16:55:56','1','张三','192.168.0.1'),
('0A925776DB28484A98923FBFF5FB520C','资源发布','zhaoliu:1','2017-07-27 16:55:56','4','赵六','192.168.0.4'),
('0C12D696FC104DE1B6CFBFC6677080D3','资源目录','zhaoliu:2','2017-07-27 16:55:56','4','赵六','192.168.0.4'),
('0E324D1FF24E4B438A849566CA6C7FF1','日志管理','qianqi:32ABC9B38A274FDE86E8F17444C858D0','2017-07-27 16:55:56','5','钱七','192.168.0.5'),
('0F54BCD6547C40C689CFF46C6AF5990D','我的任务','zhangsan:1','2017-07-27 16:55:56','1','张三','192.168.0.1'),
('0FB5C32A345042AFA964176350538A6C','日志管理','qianqi:1BF2A7B347DC4FD784AC377373AE07CD','2017-07-27 16:55:56','5','钱七','192.168.0.5'),
('0FE6AED25D1241E4A8368D06CAE6BDCC','资源发布','qianqi:32ABC9B38A274FDE86E8F17444C858D0','2017-07-27 16:55:56','5','钱七','192.168.0.5'),
('116A601B670E44B1A39418F8EDDE1C67','资源配置','wangwu:32ABC9B38A274FDE86E8F17444C858D0','2017-07-27 16:55:56','3','王五','192.168.0.3'),
('138E3CEC45784ECA9750A7AC2CDC360D','行业资讯管理','zhaoliu:2','2017-07-27 16:55:56','4','赵六','192.168.0.4'),
('13F6943EEC1F4705A7C9A017121D973A','典型案例管理','zhangsan:3','2017-07-27 16:55:56','1','张三','192.168.0.1'),
('14D949B5490840879DAA94BDD1014A7B','专题管理','qianqi:2','2017-07-27 16:55:56','5','钱七','192.168.0.5'),
('151FBCC8593B4620A22DCCC0EB6BC49E','日志管理','wangwu:1BF2A7B347DC4FD784AC377373AE07CD','2017-07-27 16:55:56','3','王五','192.168.0.3'),
('15696B4463DA43188764EEC992FB8814','日志管理','lisi:3','2017-07-27 16:55:56','2','李四','192.168.0.2'),
('187B22A02E99475FA890CEECFBDD068E','专题管理','zhaoliu:1','2017-07-27 16:55:56','4','赵六','192.168.0.4'),
('18A356F9B584450B8CE03647432C4EED','日志管理','lisi:1','2017-07-27 16:55:56','2','李四','192.168.0.2'),
('18C73B803A7F49C2880E7B15A9E515E9','典型案例管理','zhaoliu:1','2017-07-27 16:55:56','4','赵六','192.168.0.4'),
('1BC410F9B8604A0AB0E84757EC28CD1E','资源目录','lisi:1BF2A7B347DC4FD784AC377373AE07CD','2017-07-27 16:55:56','2','李四','192.168.0.2'),
('1CF8F049C0F24C28935A6F009F4DC1A5','我的任务','zhangsan:32ABC9B38A274FDE86E8F17444C858D0','2017-07-27 16:55:56','1','张三','192.168.0.1'),
('1D5618C0B6CC44A1AECA76F53F7583D9','日志管理','qianqi:32ABC9B38A274FDE86E8F17444C858D0','2017-07-27 16:55:56','5','钱七','192.168.0.5'),
('1D7F117602004FF6B01DF1C9239E921D','资源配置','zhaoliu:1','2017-07-27 16:55:56','4','赵六','192.168.0.4'),
('216065332C8E40B78915D62E28FD7BB8','资源发布','qianqi:1BF2A7B347DC4FD784AC377373AE07CD','2017-07-27 16:55:57','5','钱七','192.168.0.5'),
('22116218351F420186492E1838F51F98','通知公告管理','qianqi:32ABC9B38A274FDE86E8F17444C858D0','2017-07-27 16:55:56','5','钱七','192.168.0.5'),
('22475482007B4ED395D7EA999296EC44','专题管理','zhaoliu:2','2017-07-27 16:55:56','4','赵六','192.168.0.4'),
('244300303092423BA2A0247F9FE18B93','问题管理','wangwu:2','2017-07-27 16:55:57','3','王五','192.168.0.3'),
('24ADAF2A2DFE45A69E2517A704A0E0C6','专题管理','lisi:2','2017-07-27 16:55:56','2','李四','192.168.0.2'),
('25E1955CCE3D42DB8357E0E643FEAD29','行业资讯管理','zhangsan:3','2017-07-27 16:55:56','1','张三','192.168.0.1'),
('2610F6B341ED4CA69A7C7AF43592CEA4','资源发布','zhaoliu:3','2017-07-27 16:55:56','4','赵六','192.168.0.4'),
('2693E14299F742859ED385F04B592CD1','问题管理','wangwu:2','2017-07-27 16:55:56','3','王五','192.168.0.3'),
('279EE0EE66C249D6BCFD6EB210EFDF6D','专题管理','wangwu:1BF2A7B347DC4FD784AC377373AE07CD','2017-07-27 16:55:56','3','王五','192.168.0.3'),
('28E963C2899B4FA0982DC4DB3B4A2057','资源注册','lisi:2','2017-07-27 16:55:56','2','李四','192.168.0.2'),
('2989A727C1A04936A4F8AAF95E6B9092','我的任务','lisi:1BF2A7B347DC4FD784AC377373AE07CD','2017-07-27 16:55:56','2','李四','192.168.0.2'),
('29EDFC730FED44C6B419B7C45635BFAA','资源权限管理','qianqi:2','2017-07-27 16:55:56','5','钱七','192.168.0.5'),
('2B324F960F234D7CAD7527C7828FB3FD','典型案例管理','qianqi:1','2017-07-27 16:55:56','5','钱七','192.168.0.5'),
('2B8D44DD2897461D9A86C8E22E6E502F','日志管理','qianqi:1','2017-07-27 16:55:56','5','钱七','192.168.0.5'),
('2C0CDADE03BB4D61BA64C15F3EDF87A7','资源配置','qianqi:3','2017-07-27 16:55:56','5','钱七','192.168.0.5'),
('2C22DA71F86E4C6D8C5A4D0827DEB513','我的任务','wangwu:1BF2A7B347DC4FD784AC377373AE07CD','2017-07-27 16:55:56','3','王五','192.168.0.3'),
('2DE0369B5CED40628BB18B8C67B882FC','资源配置','zhangsan:1','2017-07-27 16:55:56','1','张三','192.168.0.1'),
('2F6EACA65F324648A34285CAE5BBA34A','专题管理','wangwu:2','2017-07-27 16:55:56','3','王五','192.168.0.3'),
('303B1245947F429598CBB010F18814BF','问题管理','qianqi:1BF2A7B347DC4FD784AC377373AE07CD','2017-07-27 16:55:56','5','钱七','192.168.0.5'),
('304217A9FCC0434594948BB0700F23BB','资源发布','wangwu:1BF2A7B347DC4FD784AC377373AE07CD','2017-07-27 16:55:56','3','王五','192.168.0.3'),
('319AF27984014FDEA5F36FFB3938EA55','资源目录','wangwu:1BF2A7B347DC4FD784AC377373AE07CD','2017-07-27 16:55:56','3','王五','192.168.0.3'),
('3261705B7D6B4B8DA99ECCDEE861D556','资源目录','zhaoliu:1BF2A7B347DC4FD784AC377373AE07CD','2017-07-27 16:55:57','4','赵六','192.168.0.4'),
('32F211A6D8AA4579A458C4007CB1996A','专题管理','lisi:32ABC9B38A274FDE86E8F17444C858D0','2017-07-27 16:55:57','2','李四','192.168.0.2'),
('33ADE40FA23844DBA60978D3B7A0B750','资源发布','wangwu:1BF2A7B347DC4FD784AC377373AE07CD','2017-07-27 16:55:56','3','王五','192.168.0.3'),
('3516F290C37A409EA20F0D4727C14D22','专题管理','wangwu:1BF2A7B347DC4FD784AC377373AE07CD','2017-07-27 16:55:56','3','王五','192.168.0.3'),
('3626321A50D7493A950A81AF27E39495','资源发布','qianqi:1','2017-07-27 16:55:57','5','钱七','192.168.0.5'),
('36A392F64EA04A4E983C1689870CFE09','我的任务','wangwu:2','2017-07-27 16:55:56','3','王五','192.168.0.3'),
('36D68EAD839546EC8CC2FF8C21EC1ECE','资源配置','zhaoliu:32ABC9B38A274FDE86E8F17444C858D0','2017-07-27 16:55:57','4','赵六','192.168.0.4'),
('38280B08CABD489AB17206AB89241883','专题管理','zhangsan:1BF2A7B347DC4FD784AC377373AE07CD','2017-07-27 16:55:57','1','张三','192.168.0.1'),
('3C18FD89E3AE43D78D4DB78A5072FEFA','资源目录','qianqi:3','2017-07-27 16:55:56','5','钱七','192.168.0.5'),
('3CF9ADBC4D51424089117D602134250A','行业资讯管理','qianqi:2','2017-07-27 16:55:56','5','钱七','192.168.0.5'),
('3EA2CAD2FAFE4563B1AE34F1FC1B5068','资源目录','zhaoliu:32ABC9B38A274FDE86E8F17444C858D0','2017-07-27 16:55:56','4','赵六','192.168.0.4'),
('40EA962479F34AAD869152C381A87890','资源权限管理','lisi:1','2017-07-27 16:55:56','2','李四','192.168.0.2'),
('445ED107626E4FA3983E4A79EC4CB0DE','通知公告管理','qianqi:2','2017-07-27 16:55:57','5','钱七','192.168.0.5'),
('4498E5F1C375424283FC493CF96449B7','行业资讯管理','qianqi:1','2017-07-27 16:55:56','5','钱七','192.168.0.5'),
('44DCF7E0014A470080B9A7B7F434766E','专题管理','qianqi:3','2017-07-27 16:55:56','5','钱七','192.168.0.5'),
('458181ABE3B04CB8A96FDFF44B51081E','通知公告管理','zhaoliu:1BF2A7B347DC4FD784AC377373AE07CD','2017-07-27 16:55:56','4','赵六','192.168.0.4'),
('45DC667F7C6B4BC3B2076CFC9DEA7B98','日志管理','qianqi:3','2017-07-27 16:55:57','5','钱七','192.168.0.5'),
('4707E063119A4396A76BA7731E002CD3','典型案例管理','lisi:32ABC9B38A274FDE86E8F17444C858D0','2017-07-27 16:55:57','2','李四','192.168.0.2'),
('474DC2BA22FE4CD8A006A07249A38403','资源权限管理','wangwu:2','2017-07-27 16:55:56','3','王五','192.168.0.3'),
('47A671BD2C96443E98792E46E691620A','我的任务','wangwu:32ABC9B38A274FDE86E8F17444C858D0','2017-07-27 16:55:56','3','王五','192.168.0.3'),
('4AD11163AC4045B7BF93EAE4AD6F9D20','问题管理','zhaoliu:32ABC9B38A274FDE86E8F17444C858D0','2017-07-27 16:55:56','4','赵六','192.168.0.4'),
('4BE3F12D4E494EFA8D043CDB1A3C541C','通知公告管理','qianqi:1','2017-07-27 16:55:57','5','钱七','192.168.0.5'),
('4C705EE1EC494AF1B78C62237F08B681','资源权限管理','wangwu:1BF2A7B347DC4FD784AC377373AE07CD','2017-07-27 16:55:57','3','王五','192.168.0.3'),
('4CA3799F40F4487DA3DDB9A1DA74BEFD','问题管理','wangwu:2','2017-07-27 16:55:56','3','王五','192.168.0.3'),
('4F49928875C34D52A109E3DD2B4ACC80','资源注册','lisi:1','2017-07-27 16:55:56','2','李四','192.168.0.2'),
('5386DF16375D4CC5B4BA7CDF6FDCAF27','资源注册','lisi:2','2017-07-27 16:55:57','2','李四','192.168.0.2'),
('546D3CC5CBCA4DC6B9EB27758F4B7D50','日志管理','qianqi:32ABC9B38A274FDE86E8F17444C858D0','2017-07-27 16:55:57','5','钱七','192.168.0.5'),
('54CEF6D88E72495496E24CE411B549FD','专题管理','zhangsan:32ABC9B38A274FDE86E8F17444C858D0','2017-07-27 16:55:56','1','张三','192.168.0.1'),
('54DAF26359894A999780BEF417355347','日志管理','zhangsan:3','2017-07-27 16:55:56','1','张三','192.168.0.1'),
('56BC8B29BFF145AF9C1BAB3E5EFA5BD9','行业资讯管理','zhangsan:3','2017-07-27 16:55:56','1','张三','192.168.0.1'),
('575C9871126F459BA455A499C6039510','专题管理','zhangsan:2','2017-07-27 16:55:56','1','张三','192.168.0.1'),
('58D3904CC1F347BFBEBDCF2E59C34292','通知公告管理','qianqi:1','2017-07-27 16:55:56','5','钱七','192.168.0.5'),
('5946F3FC63334E0A9FAD188EDB814970','资源发布','wangwu:1BF2A7B347DC4FD784AC377373AE07CD','2017-07-27 16:55:56','3','王五','192.168.0.3'),
('5B58AD88D7164C9892F75DFD48A51CDD','我的任务','wangwu:1','2017-07-27 16:55:57','3','王五','192.168.0.3'),
('5B88B46445F948B389CE0F970FBE2590','专题管理','wangwu:32ABC9B38A274FDE86E8F17444C858D0','2017-07-27 16:55:56','3','王五','192.168.0.3'),
('6139E24F3A57407DAD3A22EA007A8878','专题管理','zhaoliu:1','2017-07-27 16:55:56','4','赵六','192.168.0.4'),
('61D556BD51E44653A8B7F565478F1639','资源注册','lisi:32ABC9B38A274FDE86E8F17444C858D0','2017-07-27 16:55:56','2','李四','192.168.0.2'),
('6255D2BE4BFF49B89E970A74E1CF4ECF','资源发布','lisi:3','2017-07-27 16:55:56','2','李四','192.168.0.2'),
('6275C42797AD46AAA17A374AA2D209EF','日志管理','lisi:1BF2A7B347DC4FD784AC377373AE07CD','2017-07-27 16:55:56','2','李四','192.168.0.2'),
('629F97D3CEBA4D5BB163EB61B7B161DB','资源发布','zhangsan:3','2017-07-27 16:55:56','1','张三','192.168.0.1'),
('6371F1BFB48B46A9993EC1AA15B089FF','资源发布','qianqi:1BF2A7B347DC4FD784AC377373AE07CD','2017-07-27 16:55:56','5','钱七','192.168.0.5'),
('639AF6611B8E4A598E83A68033D9367F','资源目录','zhaoliu:32ABC9B38A274FDE86E8F17444C858D0','2017-07-27 16:55:56','4','赵六','192.168.0.4'),
('63BE18945BBD47A6B76CBEFE3085745D','资源注册','zhaoliu:3','2017-07-27 16:55:56','4','赵六','192.168.0.4'),
('642E1958D1DE48E5A84494AC4C81F71D','行业资讯管理','zhaoliu:1','2017-07-27 16:55:57','4','赵六','192.168.0.4'),
('64747755E1D94EDFBDB137CCE6184C91','资源注册','qianqi:1BF2A7B347DC4FD784AC377373AE07CD','2017-07-27 16:55:57','5','钱七','192.168.0.5'),
('65291F7E1BB14B4D8F2EAA264B3C951F','资源目录','qianqi:3','2017-07-27 16:55:56','5','钱七','192.168.0.5'),
('687E52FF695D4F489B489CE6D98A45B5','资源配置','lisi:32ABC9B38A274FDE86E8F17444C858D0','2017-07-27 16:55:56','2','李四','192.168.0.2'),
('69CFB17EC1104D39825358C84D85D323','问题管理','lisi:2','2017-07-27 16:55:57','2','李四','192.168.0.2'),
('6B59F4ACD1514FBC9733417E6967D56F','资源发布','wangwu:1','2017-07-27 16:55:56','3','王五','192.168.0.3'),
('6B824AB87A594243A34B22578FF889C6','资源目录','lisi:32ABC9B38A274FDE86E8F17444C858D0','2017-07-27 16:55:57','2','李四','192.168.0.2'),
('6E6FDAD3914D40EBAC52E02C49D58777','资源权限管理','zhangsan:32ABC9B38A274FDE86E8F17444C858D0','2017-07-27 16:55:56','1','张三','192.168.0.1'),
('70372AD7F76D4957B023375F423833D4','专题管理','lisi:32ABC9B38A274FDE86E8F17444C858D0','2017-07-27 16:55:56','2','李四','192.168.0.2'),
('70859A8009B64EC7B35259ADD9EE90D7','资源目录','qianqi:2','2017-07-27 16:55:57','5','钱七','192.168.0.5'),
('71B3FCA5F4D14387949C5D25A166AD2B','资源发布','zhangsan:1','2017-07-27 16:55:56','1','张三','192.168.0.1'),
('73A2EAEB9EB245ED9D50C2C239D0941C','资源注册','lisi:3','2017-07-27 16:55:56','2','李四','192.168.0.2'),
('73CC8D136D8B40148A3D9362BF128D76','日志管理','qianqi:1','2017-07-27 16:55:56','5','钱七','192.168.0.5'),
('74A9EE2658B44273B82ACEF449273F39','问题管理','qianqi:2','2017-07-27 16:55:56','5','钱七','192.168.0.5'),
('74F3E8DF54EC497CB10BAB276F6DC0D5','资源配置','zhaoliu:32ABC9B38A274FDE86E8F17444C858D0','2017-07-27 16:55:56','4','赵六','192.168.0.4'),
('7AB1B0A8956D40F68438B1CBE02A1AF2','日志管理','wangwu:1BF2A7B347DC4FD784AC377373AE07CD','2017-07-27 16:55:57','3','王五','192.168.0.3'),
('7ABF52D650E440F0853B4704DFCBB63A','通知公告管理','wangwu:3','2017-07-27 16:55:56','3','王五','192.168.0.3'),
('7AC9EB9072624CF7B747707ED2C462C4','资源注册','lisi:32ABC9B38A274FDE86E8F17444C858D0','2017-07-27 16:55:56','2','李四','192.168.0.2'),
('7B90A7B50AD0406882F88C6BBF10E064','专题管理','lisi:2','2017-07-27 16:55:56','2','李四','192.168.0.2'),
('7BD39B604B0F4A2C886D7F0CD68D9C76','我的任务','zhangsan:1','2017-07-27 16:55:56','1','张三','192.168.0.1'),
('7C1E851D19174F7280920F939A024597','资源配置','zhangsan:1BF2A7B347DC4FD784AC377373AE07CD','2017-07-27 16:55:56','1','张三','192.168.0.1'),
('7C426CE42B57480A86A7B0BBCBF142C9','通知公告管理','wangwu:1BF2A7B347DC4FD784AC377373AE07CD','2017-07-27 16:55:56','3','王五','192.168.0.3'),
('7CF116B133F7477B8C128474A5002F15','资源注册','qianqi:1BF2A7B347DC4FD784AC377373AE07CD','2017-07-27 16:55:56','5','钱七','192.168.0.5'),
('7EC86226A7224C8582B18A460BB40368','通知公告管理','zhaoliu:3','2017-07-27 16:55:56','4','赵六','192.168.0.4'),
('8017E9D4FE4F4943BA1283569FF90540','资源注册','wangwu:3','2017-07-27 16:55:56','3','王五','192.168.0.3'),
('82614E8D72A94F32AD89FE49DC1193DF','资源配置','zhangsan:1','2017-07-27 16:55:57','1','张三','192.168.0.1'),
('85B9A03F872E4C1F842DC89251B7800D','专题管理','wangwu:1BF2A7B347DC4FD784AC377373AE07CD','2017-07-27 16:55:56','3','王五','192.168.0.3'),
('879AFE5FA7134DF6808D43457FDFA7F5','资源权限管理','zhangsan:32ABC9B38A274FDE86E8F17444C858D0','2017-07-27 16:55:56','1','张三','192.168.0.1'),
('87A576BC09A04D30842E0507845AFF29','资源配置','qianqi:1','2017-07-27 16:55:56','5','钱七','192.168.0.5'),
('87F4B3D5A38642CBAB7FE501924B7FD0','通知公告管理','qianqi:2','2017-07-27 16:55:57','5','钱七','192.168.0.5'),
('88E0CF58080A4A76A1FCE0C62CCBE3F5','日志管理','wangwu:1','2017-07-27 16:55:56','3','王五','192.168.0.3'),
('8A8DF2CED0A64EC4834B26EE576CE122','资源发布','zhaoliu:3','2017-07-27 16:55:56','4','赵六','192.168.0.4'),
('8CA445CB084C453DA8552C57F3AEC044','资源目录','zhangsan:3','2017-07-27 16:55:56','1','张三','192.168.0.1'),
('8F60E9143B85489FA6B6F9400606CAE1','典型案例管理','wangwu:3','2017-07-27 16:55:56','3','王五','192.168.0.3'),
('94DE217C35AC4C848299C3ECBD258CA7','日志管理','zhaoliu:1','2017-07-27 16:55:56','4','赵六','192.168.0.4'),
('95E22D5E8A904370B28B40BA058A67F5','典型案例管理','zhaoliu:3','2017-07-27 16:55:56','4','赵六','192.168.0.4'),
('985CF221DE874F7DA6CF85B6004F2F3E','资源发布','zhaoliu:3','2017-07-27 16:55:56','4','赵六','192.168.0.4'),
('98D40255B1534507896CF6D5A904226B','资源发布','zhaoliu:2','2017-07-27 16:55:56','4','赵六','192.168.0.4'),
('9FF81A25C08942B29E9E603CB3FE6025','行业资讯管理','wangwu:3','2017-07-27 16:55:56','3','王五','192.168.0.3'),
('A0C0321D18E046BD87E459573159F68F','专题管理','zhaoliu:1','2017-07-27 16:55:56','4','赵六','192.168.0.4'),
('A1E59E217F434547944772FB795BB320','资源注册','lisi:32ABC9B38A274FDE86E8F17444C858D0','2017-07-27 16:55:55','2','李四','192.168.0.2'),
('A28B24D02C13421E90A22C8554C7C7B9','行业资讯管理','wangwu:3','2017-07-27 16:55:56','3','王五','192.168.0.3'),
('A7DF781F5A3841089445B9D7C5A50E19','资源配置','zhangsan:2','2017-07-27 16:55:56','1','张三','192.168.0.1'),
('A8823BEAB35C40E1BB990010E8439423','通知公告管理','wangwu:32ABC9B38A274FDE86E8F17444C858D0','2017-07-27 16:55:56','3','王五','192.168.0.3'),
('A894689BFA324DDFABF1C9E2F3B67CCF','资源发布','zhangsan:1BF2A7B347DC4FD784AC377373AE07CD','2017-07-27 16:55:56','1','张三','192.168.0.1'),
('A9FE2D2D6BA244BD9DC61D83DC9CAFB3','资源权限管理','zhaoliu:1BF2A7B347DC4FD784AC377373AE07CD','2017-07-27 16:55:56','4','赵六','192.168.0.4'),
('AF369907BCC14FCE924B01C4B68C26F4','资源配置','wangwu:32ABC9B38A274FDE86E8F17444C858D0','2017-07-27 16:55:56','3','王五','192.168.0.3'),
('B049CC26551345FD83257D01373024CA','问题管理','zhangsan:32ABC9B38A274FDE86E8F17444C858D0','2017-07-27 16:55:56','1','张三','192.168.0.1'),
('B074E61D8503425B95147F7F947CDFCD','问题管理','wangwu:1BF2A7B347DC4FD784AC377373AE07CD','2017-07-27 16:55:56','3','王五','192.168.0.3'),
('B298B83132BC4F7696153495D04CA757','通知公告管理','wangwu:3','2017-07-27 16:55:56','3','王五','192.168.0.3'),
('B2C5F87386384313AA6AA506CD67222A','资源发布','qianqi:1BF2A7B347DC4FD784AC377373AE07CD','2017-07-27 16:55:56','5','钱七','192.168.0.5'),
('B333DC834CCD474BB197ED3C61552A0A','资源目录','wangwu:1','2017-07-27 16:55:56','3','王五','192.168.0.3'),
('B3EAB19ABFCD484B82FC128136F4A322','资源权限管理','lisi:1BF2A7B347DC4FD784AC377373AE07CD','2017-07-27 16:55:56','2','李四','192.168.0.2'),
('B6060EE7128C486F8D3AB2CD77C9935C','资源权限管理','zhaoliu:32ABC9B38A274FDE86E8F17444C858D0','2017-07-27 16:55:56','4','赵六','192.168.0.4'),
('B64DF2586B7149E5807DF4123D044B2D','资源发布','zhangsan:1','2017-07-27 16:55:56','1','张三','192.168.0.1'),
('B704A60C427B4E6EB184DD2544983DCD','问题管理','lisi:1','2017-07-27 16:55:56','2','李四','192.168.0.2'),
('B999AA1493ED4527AE7E414C088B1FC3','问题管理','wangwu:32ABC9B38A274FDE86E8F17444C858D0','2017-07-27 16:55:56','3','王五','192.168.0.3'),
('B9F59C8E96FC45749A73169839A4A92D','日志管理','zhangsan:3','2017-07-27 16:55:56','1','张三','192.168.0.1'),
('BA48CCA2C2404029AF94AA5671F067FD','我的任务','qianqi:1BF2A7B347DC4FD784AC377373AE07CD','2017-07-27 16:55:56','5','钱七','192.168.0.5'),
('BE19A6FEB18842F78D154D34E251EC4F','行业资讯管理','wangwu:3','2017-07-27 16:55:56','3','王五','192.168.0.3'),
('BE5323388999416D8C56C8A3B0775EDE','资源注册','zhangsan:2','2017-07-27 16:55:57','1','张三','192.168.0.1'),
('BF56630B07D44E658164812832059C4D','典型案例管理','zhaoliu:1','2017-07-27 16:55:56','4','赵六','192.168.0.4'),
('C2A6F83265314331971B521DC4FFA4AD','资源配置','wangwu:32ABC9B38A274FDE86E8F17444C858D0','2017-07-27 16:55:56','3','王五','192.168.0.3'),
('C35EAA695C8E4D2297590EE8D537AF51','资源注册','wangwu:1','2017-07-27 16:55:56','3','王五','192.168.0.3'),
('C362A24F97B34C55861263A705335A19','资源权限管理','zhangsan:2','2017-07-27 16:55:56','1','张三','192.168.0.1'),
('C4C9AB9807A74C21BDCD4B6F0F8CAE9B','资源发布','wangwu:32ABC9B38A274FDE86E8F17444C858D0','2017-07-27 16:55:56','3','王五','192.168.0.3'),
('C5DA18AD83C54DF2BDF137A1A85B733F','通知公告管理','lisi:2','2017-07-27 16:55:56','2','李四','192.168.0.2'),
('C669620805EC45B1A1CE270C808E2B72','典型案例管理','lisi:32ABC9B38A274FDE86E8F17444C858D0','2017-07-27 16:55:56','2','李四','192.168.0.2'),
('C714DEBD36064E1AA62D0ECA13DDE201','行业资讯管理','zhangsan:3','2017-07-27 16:55:56','1','张三','192.168.0.1'),
('CB24A7AB73BA49DD9521B19BD1620139','资源权限管理','zhaoliu:1BF2A7B347DC4FD784AC377373AE07CD','2017-07-27 16:55:56','4','赵六','192.168.0.4'),
('CBF579014E0E4FD695E66027AE19597D','资源注册','wangwu:1','2017-07-27 16:55:56','3','王五','192.168.0.3'),
('CE4DFF0CBEF5441AAB6B3E7D6BDAB00E','资源配置','zhaoliu:1','2017-07-27 16:55:56','4','赵六','192.168.0.4'),
('D2C9D1A0D8AC471A87396921A1ACED58','资源注册','zhangsan:1BF2A7B347DC4FD784AC377373AE07CD','2017-07-27 16:55:56','1','张三','192.168.0.1'),
('D41EC73BB2A64E2E98B737C36A2EEB5D','资源配置','zhangsan:2','2017-07-27 16:55:57','1','张三','192.168.0.1'),
('D47BD6353CA64CB78DC867AC6C025B91','日志管理','zhaoliu:2','2017-07-27 16:55:56','4','赵六','192.168.0.4'),
('D4BDDDB7A5BA4D35A1B1BA2830B21792','资源目录','zhaoliu:32ABC9B38A274FDE86E8F17444C858D0','2017-07-27 16:55:56','4','赵六','192.168.0.4'),
('D6140A61CC7B43D589434E6D3D5E8F4E','专题管理','wangwu:2','2017-07-27 16:55:57','3','王五','192.168.0.3'),
('D81438A7B2124B178409C22754649E69','资源发布','zhaoliu:2','2017-07-27 16:55:56','4','赵六','192.168.0.4'),
('D82E8155B70E4583A2F11B86DFDDC795','日志管理','wangwu:2','2017-07-27 16:55:56','3','王五','192.168.0.3'),
('DB6D92EB839A43F2A5AB9A36B20AC4F8','问题管理','lisi:1BF2A7B347DC4FD784AC377373AE07CD','2017-07-27 16:55:56','2','李四','192.168.0.2'),
('DBA45E5F76964FCB9ECBF2A4AF77CBB8','典型案例管理','qianqi:32ABC9B38A274FDE86E8F17444C858D0','2017-07-27 16:55:57','5','钱七','192.168.0.5'),
('DD278B2504854F3E80EA4525C402BE6D','日志管理','qianqi:2','2017-07-27 16:55:56','5','钱七','192.168.0.5'),
('DD98EC78674847EB9E639BAAD1BC8F99','典型案例管理','zhaoliu:32ABC9B38A274FDE86E8F17444C858D0','2017-07-27 16:55:56','4','赵六','192.168.0.4'),
('DDD17BAD73BB404684B7C1DA312DA7D4','我的任务','lisi:32ABC9B38A274FDE86E8F17444C858D0','2017-07-27 16:55:56','2','李四','192.168.0.2'),
('DE205C6279A043F383665A32CE8EB955','资源权限管理','zhaoliu:1','2017-07-27 16:55:56','4','赵六','192.168.0.4'),
('DE595DDCAA5F409694FE5DB30700F701','资源权限管理','zhaoliu:2','2017-07-27 16:55:56','4','赵六','192.168.0.4'),
('DED214C6F4FE4FFF9DE01BE3D77CDE4F','专题管理','wangwu:1','2017-07-27 16:55:57','3','王五','192.168.0.3'),
('DF22481EC3854189991B95F99A04DC3A','专题管理','qianqi:1','2017-07-27 16:55:56','5','钱七','192.168.0.5'),
('E0D390E444784271ABDE9C22537C5FD8','通知公告管理','lisi:1BF2A7B347DC4FD784AC377373AE07CD','2017-07-27 16:55:56','2','李四','192.168.0.2'),
('E14BC678A5FE48EF83F7FFF7FA6F3660','资源权限管理','lisi:2','2017-07-27 16:55:56','2','李四','192.168.0.2'),
('E1A191280B454B42A2BE0E86053C002D','通知公告管理','zhangsan:1BF2A7B347DC4FD784AC377373AE07CD','2017-07-27 16:55:56','1','张三','192.168.0.1'),
('E43546168C4149D18C2FB8C6F602424E','问题管理','lisi:1BF2A7B347DC4FD784AC377373AE07CD','2017-07-27 16:55:56','2','李四','192.168.0.2'),
('E690509C277D46449A45BFF644185B81','典型案例管理','wangwu:3','2017-07-27 16:55:56','3','王五','192.168.0.3'),
('E80278AF06B74DE4A7483E43BD506FEA','行业资讯管理','qianqi:32ABC9B38A274FDE86E8F17444C858D0','2017-07-27 16:55:57','5','钱七','192.168.0.5'),
('EA71161AD400463F80C2DFF9DA1132D6','资源发布','qianqi:1','2017-07-27 16:55:57','5','钱七','192.168.0.5'),
('EAE282DF2A2344B2AF5D3AAFC3E2CD6E','典型案例管理','wangwu:3','2017-07-27 16:55:56','3','王五','192.168.0.3'),
('ED2A66F1A9F1466281B699C5E95B9B6B','资源目录','zhaoliu:1','2017-07-27 16:55:56','4','赵六','192.168.0.4'),
('EEAC86817CA44758A5D85D9D00F95425','资源权限管理','wangwu:1BF2A7B347DC4FD784AC377373AE07CD','2017-07-27 16:55:57','3','王五','192.168.0.3'),
('EF932D5F3E7D42219FC87B9E585722AF','行业资讯管理','zhangsan:1BF2A7B347DC4FD784AC377373AE07CD','2017-07-27 16:55:56','1','张三','192.168.0.1'),
('EF969C91B0BE4D9BA1D47B89A46B31DE','典型案例管理','lisi:3','2017-07-27 16:55:56','2','李四','192.168.0.2'),
('EFCA3659F6D74455AF140FBE4CE0594A','问题管理','zhaoliu:3','2017-07-27 16:55:56','4','赵六','192.168.0.4'),
('F1377597E2984234B44DFA5584E69FA6','资源权限管理','qianqi:3','2017-07-27 16:55:56','5','钱七','192.168.0.5'),
('F1E4439B439B4115B6EAD93329F88F58','典型案例管理','lisi:1','2017-07-27 16:55:57','2','李四','192.168.0.2'),
('F2680C0983ED4090A2E1DD2414C5100E','行业资讯管理','zhangsan:1','2017-07-27 16:55:56','1','张三','192.168.0.1'),
('F67F286393094F4B8759E3900E862DE6','专题管理','lisi:1BF2A7B347DC4FD784AC377373AE07CD','2017-07-27 16:55:56','2','李四','192.168.0.2'),
('F6D737576254422B980159DB3A124C9E','日志管理','zhaoliu:1','2017-07-27 16:55:56','4','赵六','192.168.0.4'),
('F93384363F7C4A14B21D98C2531E69D7','资源发布','wangwu:1','2017-07-27 16:55:56','3','王五','192.168.0.3'),
('F94D512347E54EC295BA877E9736E1B1','行业资讯管理','wangwu:2','2017-07-27 16:55:56','3','王五','192.168.0.3'),
('F9D1736B4C1A4C83911A0CF65261A828','资源注册','qianqi:1BF2A7B347DC4FD784AC377373AE07CD','2017-07-27 16:55:56','5','钱七','192.168.0.5'),
('FDDE06D364A44DAE8B2C47E7D7176A7D','日志管理','qianqi:1BF2A7B347DC4FD784AC377373AE07CD','2017-07-27 16:55:56','5','钱七','192.168.0.5');

/* Function  structure for function  `getCatalogChildId` */

/*!50003 DROP FUNCTION IF EXISTS `getCatalogChildId` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`huiqing`@`%` FUNCTION `getCatalogChildId`(parentId VARCHAR(50)) RETURNS longtext CHARSET utf8
BEGIN
	DECLARE pTemp LONGTEXT;  
        DECLARE cTemp LONGTEXT;
        
        SET pTemp = '$';  
        SET cTemp =cast(parentId as CHAR);
        
        
        WHILE cTemp is not null DO  
         SET pTemp = concat(pTemp,',',cTemp);  
         SELECT group_concat(id) INTO cTemp FROM rmc_catalog
         WHERE FIND_IN_SET(parent_id,cTemp)>0; 
                
       END WHILE;  
       RETURN pTemp;
    END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
