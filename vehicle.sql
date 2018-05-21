/*
SQLyog  v12.2.6 (64 bit)
MySQL - 5.6.36-log : Database - vehcile_platform
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`vehcile_platform` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `vehcile_platform`;

/*Table structure for table `biz_byxqxx` */

CREATE TABLE `biz_byxqxx` (
  `byd_id` varchar(32) NOT NULL COMMENT '主键id',
  `v_id` varchar(32) DEFAULT NULL COMMENT '车辆id',
  `v_hphm` varchar(10) DEFAULT NULL COMMENT '车牌号码',
  `byd_bydz` varchar(200) DEFAULT NULL COMMENT '保养地点',
  `byd_gcmc` varchar(100) DEFAULT NULL COMMENT '保养工厂名称',
  `byd_byje` decimal(7,2) DEFAULT NULL COMMENT '保养费用',
  `create_user` varchar(50) DEFAULT NULL COMMENT '创建人',
  `create_time` varchar(20) DEFAULT NULL COMMENT '创建时间',
  `byd_bz` varchar(200) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`byd_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='车辆保养详情记录表';

/*Data for the table `biz_byxqxx` */

/*Table structure for table `biz_byxx` */

CREATE TABLE `biz_byxx` (
  `by_id` varchar(32) NOT NULL COMMENT '主键id',
  `v_id` varchar(32) DEFAULT NULL COMMENT '车辆id',
  `v_hphm` varchar(10) DEFAULT NULL COMMENT '车牌号码',
  `by_bysj` varchar(20) DEFAULT NULL COMMENT '最后一次保养时间',
  `by_byje` decimal(7,2) DEFAULT NULL COMMENT '最后一次保养金额',
  `update_user` varchar(50) DEFAULT NULL COMMENT '修改人',
  `update_time` varchar(20) DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`by_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='车辆保养表';

/*Data for the table `biz_byxx` */

/*Table structure for table `biz_files` */

CREATE TABLE `biz_files` (
  `vf_id` varchar(32) NOT NULL COMMENT '主键ID',
  `p_id` varchar(32) DEFAULT NULL COMMENT '主体ID',
  `p_ztlx` varchar(5) DEFAULT NULL COMMENT '主体类型。10：人员；20：车辆；30：保险；40：违法',
  `vf_dalx` varchar(5) DEFAULT NULL COMMENT '档案类型',
  `vf_damc` varchar(50) DEFAULT NULL COMMENT '档案名称',
  `vf_loc_path` varchar(500) DEFAULT NULL COMMENT '档案本地存储路径',
  `vf_net_path` varchar(500) DEFAULT NULL COMMENT '档案网络路径',
  `create_user` varchar(50) DEFAULT NULL COMMENT '创建人',
  `create_time` varchar(20) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`vf_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='通用文件上传信息';

/*Data for the table `biz_files` */

insert  into `biz_files`(`vf_id`,`p_id`,`p_ztlx`,`vf_dalx`,`vf_damc`,`vf_loc_path`,`vf_net_path`,`create_user`,`create_time`) values ('447158178266742784','446638357951283200','10',NULL,'sfzzmFile','D:\\keystore\\images\\sfzFile\\2018-05-19\\eb430179924a4894ab53c7716c3e9313.jpg','sfzFile\\2018-05-19\\eb430179924a4894ab53c7716c3e9313.jpg','1-超级管理员','2018-05-19 11:30:27');
insert  into `biz_files`(`vf_id`,`p_id`,`p_ztlx`,`vf_dalx`,`vf_damc`,`vf_loc_path`,`vf_net_path`,`create_user`,`create_time`) values ('447359998851284992','446638357951283200','10',NULL,'sfzfmFile','D:\\keystore\\images\\sfzFile\\2018-05-19\\f93a1eb0faec4503ba9f611826cd05ee.jpg','sfzFile\\2018-05-19\\f93a1eb0faec4503ba9f611826cd05ee.jpg','1-超级管理员','2018-05-19 11:29:10');
insert  into `biz_files`(`vf_id`,`p_id`,`p_ztlx`,`vf_dalx`,`vf_damc`,`vf_loc_path`,`vf_net_path`,`create_user`,`create_time`) values ('447360113594859520','446638357951283200','10',NULL,'jszfmFile','D:\\keystore\\images\\jszFile\\2018-05-19\\2b60aecc86f14c5db25361f3bbc11203.jpg','jszFile\\2018-05-19\\2b60aecc86f14c5db25361f3bbc11203.jpg','1-超级管理员','2018-05-19 11:29:22');
insert  into `biz_files`(`vf_id`,`p_id`,`p_ztlx`,`vf_dalx`,`vf_damc`,`vf_loc_path`,`vf_net_path`,`create_user`,`create_time`) values ('447400313171738624','446638357951283200','10',NULL,'jszzmFile','D:\\keystore\\images\\jszFile\\2018-05-19\\0e143b7016b147b6ac9c64cf1e88a776.jpg','jszFile\\2018-05-19\\0e143b7016b147b6ac9c64cf1e88a776.jpg','1-超级管理员','2018-05-19 14:09:06');
insert  into `biz_files`(`vf_id`,`p_id`,`p_ztlx`,`vf_dalx`,`vf_damc`,`vf_loc_path`,`vf_net_path`,`create_user`,`create_time`) values ('447400428762562560','446638357951283200','10',NULL,'jlzzmFile','D:\\keystore\\images\\jlzFile\\2018-05-19\\79aca4d4753e4d70ae054a622264ba08.jpg','jlzFile\\2018-05-19\\79aca4d4753e4d70ae054a622264ba08.jpg','1-超级管理员','2018-05-19 14:09:34');
insert  into `biz_files`(`vf_id`,`p_id`,`p_ztlx`,`vf_dalx`,`vf_damc`,`vf_loc_path`,`vf_net_path`,`create_user`,`create_time`) values ('447656036078190592','447529271901028352','20',NULL,'vehOtherFile','D:\\keystore\\images\\vehOtherFile\\2018-05-20\\efa244396d5f4b239c755b52fa997005.jpg','vehOtherFile\\2018-05-20\\efa244396d5f4b239c755b52fa997005.jpg','1-超级管理员','2018-05-20 07:05:16');
insert  into `biz_files`(`vf_id`,`p_id`,`p_ztlx`,`vf_dalx`,`vf_damc`,`vf_loc_path`,`vf_net_path`,`create_user`,`create_time`) values ('447656145843126272','447529271901028352','20',NULL,'vehOtherFile','D:\\keystore\\images\\vehOtherFile\\2018-05-20\\635b4084fe634ae2b18347d81332e632.jpg','vehOtherFile\\2018-05-20\\635b4084fe634ae2b18347d81332e632.jpg','1-超级管理员','2018-05-20 07:05:42');
insert  into `biz_files`(`vf_id`,`p_id`,`p_ztlx`,`vf_dalx`,`vf_damc`,`vf_loc_path`,`vf_net_path`,`create_user`,`create_time`) values ('447656146350637056','447529271901028352','20',NULL,'vehOtherFile','D:\\keystore\\images\\vehOtherFile\\2018-05-20\\e461530dc68d4e4b90577f2ba34a2d5c.jpg','vehOtherFile\\2018-05-20\\e461530dc68d4e4b90577f2ba34a2d5c.jpg','1-超级管理员','2018-05-20 07:05:42');
insert  into `biz_files`(`vf_id`,`p_id`,`p_ztlx`,`vf_dalx`,`vf_damc`,`vf_loc_path`,`vf_net_path`,`create_user`,`create_time`) values ('447656469970550784','447529271901028352','20',NULL,'vehOtherFile','D:\\keystore\\images\\vehOtherFile\\2018-05-20\\87f1faa1e5294324891344395f73713d.jpg','vehOtherFile\\2018-05-20\\87f1faa1e5294324891344395f73713d.jpg','1-超级管理员','2018-05-20 07:06:59');
insert  into `biz_files`(`vf_id`,`p_id`,`p_ztlx`,`vf_dalx`,`vf_damc`,`vf_loc_path`,`vf_net_path`,`create_user`,`create_time`) values ('447656626397118464','447529271901028352','20',NULL,'vehOtherFile','D:\\keystore\\images\\vehOtherFile\\2018-05-20\\891491c361244bce8f19e85027b9c298.jpg','vehOtherFile\\2018-05-20\\891491c361244bce8f19e85027b9c298.jpg','1-超级管理员','2018-05-20 07:07:36');
insert  into `biz_files`(`vf_id`,`p_id`,`p_ztlx`,`vf_dalx`,`vf_damc`,`vf_loc_path`,`vf_net_path`,`create_user`,`create_time`) values ('447656741081972736','447529271901028352','20',NULL,'vehOtherFile','D:\\keystore\\images\\vehOtherFile\\2018-05-20\\60fd9ddbe36644489161e79724cecc48.jpg','vehOtherFile\\2018-05-20\\60fd9ddbe36644489161e79724cecc48.jpg','1-超级管理员','2018-05-20 07:08:04');
insert  into `biz_files`(`vf_id`,`p_id`,`p_ztlx`,`vf_dalx`,`vf_damc`,`vf_loc_path`,`vf_net_path`,`create_user`,`create_time`) values ('447659864261394432','447441975281451008','20',NULL,'vehOtherFile','D:\\keystore\\images\\vehOtherFile\\2018-05-20\\8c698a6534204870a3323149e41bc227.jpg','vehOtherFile\\2018-05-20\\8c698a6534204870a3323149e41bc227.jpg','1-超级管理员','2018-05-20 07:20:28');
insert  into `biz_files`(`vf_id`,`p_id`,`p_ztlx`,`vf_dalx`,`vf_damc`,`vf_loc_path`,`vf_net_path`,`create_user`,`create_time`) values ('447659873719549952','447441975281451008','20',NULL,'vehOtherFile','D:\\keystore\\images\\vehOtherFile\\2018-05-20\\1e490182ffdc43e5941aeb94fdc1a69c.png','vehOtherFile\\2018-05-20\\1e490182ffdc43e5941aeb94fdc1a69c.png','1-超级管理员','2018-05-20 07:20:31');
insert  into `biz_files`(`vf_id`,`p_id`,`p_ztlx`,`vf_dalx`,`vf_damc`,`vf_loc_path`,`vf_net_path`,`create_user`,`create_time`) values ('447785110117285888','447529271901028352','20',NULL,'xszfmFile','D:\\keystore\\images\\xszFile\\2018-05-20\\102bcc615e4241a5b15742ceacfd55e7.jpg','xszFile\\2018-05-20\\102bcc615e4241a5b15742ceacfd55e7.jpg','1-超级管理员','2018-05-20 15:40:01');
insert  into `biz_files`(`vf_id`,`p_id`,`p_ztlx`,`vf_dalx`,`vf_damc`,`vf_loc_path`,`vf_net_path`,`create_user`,`create_time`) values ('447860343339745280','447807072117981184','30',NULL,'insuranceFile','D:\\keystore\\images\\insuranceFile\\2018-05-20\\9daa70bf1f1e4f73bb11bdcba1589a90.jpg','insuranceFile\\2018-05-20\\9daa70bf1f1e4f73bb11bdcba1589a90.jpg','1-超级管理员','2018-05-20 20:37:06');
insert  into `biz_files`(`vf_id`,`p_id`,`p_ztlx`,`vf_dalx`,`vf_damc`,`vf_loc_path`,`vf_net_path`,`create_user`,`create_time`) values ('447860366731378688','447807072117981184','30',NULL,'insuranceFile','D:\\keystore\\images\\insuranceFile\\2018-05-20\\ea4ff3658a1842379cde27eb62212f8c.jpg','insuranceFile\\2018-05-20\\ea4ff3658a1842379cde27eb62212f8c.jpg','1-超级管理员','2018-05-20 20:37:12');
insert  into `biz_files`(`vf_id`,`p_id`,`p_ztlx`,`vf_dalx`,`vf_damc`,`vf_loc_path`,`vf_net_path`,`create_user`,`create_time`) values ('448020027963080704','448019998397431808','30',NULL,'insuranceFile','D:\\keystore\\images\\insuranceFile\\2018-05-21\\b2d92803f50d47c6b2720517acf57286.jpg','insuranceFile\\2018-05-21\\b2d92803f50d47c6b2720517acf57286.jpg','1-超级管理员','2018-05-21 07:11:38');
insert  into `biz_files`(`vf_id`,`p_id`,`p_ztlx`,`vf_dalx`,`vf_damc`,`vf_loc_path`,`vf_net_path`,`create_user`,`create_time`) values ('448095249064001536','111','40',NULL,'wfzp-0','D:\\keystore\\images\\\\wfxxFile\\2018-05-21\\860acf9f91e14bf3b3edd23b85e101b4.jpg','wfxxFile\\2018-05-21\\860acf9f91e14bf3b3edd23b85e101b4.jpg','1-超级管理员','2018-05-21 12:18:20');
insert  into `biz_files`(`vf_id`,`p_id`,`p_ztlx`,`vf_dalx`,`vf_damc`,`vf_loc_path`,`vf_net_path`,`create_user`,`create_time`) values ('448095249118527488','111','40',NULL,'wfzp-1','D:\\keystore\\images\\\\wfxxFile\\2018-05-21\\9f0068849278409ca98e45dc5ff792de.jpg','wfxxFile\\2018-05-21\\9f0068849278409ca98e45dc5ff792de.jpg','1-超级管理员','2018-05-21 12:18:20');
insert  into `biz_files`(`vf_id`,`p_id`,`p_ztlx`,`vf_dalx`,`vf_damc`,`vf_loc_path`,`vf_net_path`,`create_user`,`create_time`) values ('448097213432725504','111','40',NULL,'wfzp-2','D:\\keystore\\images\\\\wfxxFile\\2018-05-21\\12c037d098cc40438389ff20149930ef.jpg','wfxxFile\\2018-05-21\\12c037d098cc40438389ff20149930ef.jpg','1-超级管理员','2018-05-21 12:18:20');

/*Table structure for table `biz_insurance` */

CREATE TABLE `biz_insurance` (
  `in_id` varchar(32) NOT NULL COMMENT '主键ID',
  `in_bdh` varchar(50) DEFAULT NULL COMMENT '保单编号',
  `v_id` varchar(32) DEFAULT NULL COMMENT '车辆ID',
  `v_hphm` varchar(10) DEFAULT NULL COMMENT '车牌号码',
  `in_bxgs` varchar(50) DEFAULT NULL COMMENT '商业险保险公司',
  `in_bxdh` varchar(15) DEFAULT NULL COMMENT '商业险保险电话',
  `in_qbrq` varchar(20) DEFAULT NULL COMMENT '商业险起保时间',
  `in_zbrq` varchar(20) DEFAULT NULL COMMENT '商业险终保时间。根据起保时间自动推算一年',
  `in_bxje` decimal(6,2) DEFAULT NULL COMMENT '商业险保险金额',
  `in_xz` varchar(100) DEFAULT NULL COMMENT '商业险险种。多个险种使用'',''分隔',
  `create_user` varchar(50) DEFAULT NULL COMMENT '创建人',
  `create_time` varchar(20) DEFAULT NULL COMMENT '创建时间',
  `in_jqbdh` char(10) DEFAULT NULL COMMENT '交强险保单号',
  `in_jqbxgs` varchar(50) DEFAULT NULL COMMENT '交强险保险公司',
  `in_jqbxdh` varchar(15) DEFAULT NULL COMMENT '交强险保险电话',
  `in_jqqbrq` varchar(20) DEFAULT NULL COMMENT '交强险起保时间',
  `in_jqzbrq` varchar(20) DEFAULT NULL COMMENT '交强险终保时间。根据起保时间自动推算一年',
  `in_jqbxje` decimal(6,2) DEFAULT NULL COMMENT '交强险保险金额',
  PRIMARY KEY (`in_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='保险信息表';

/*Data for the table `biz_insurance` */

insert  into `biz_insurance`(`in_id`,`in_bdh`,`v_id`,`v_hphm`,`in_bxgs`,`in_bxdh`,`in_qbrq`,`in_zbrq`,`in_bxje`,`in_xz`,`create_user`,`create_time`,`in_jqbdh`,`in_jqbxgs`,`in_jqbxdh`,`in_jqqbrq`,`in_jqzbrq`,`in_jqbxje`) values ('447807072117981184','125689045','447441975281451008','鄂A20102','中国平安','95502','2018-05-01','2019-04-30',111.00,'01,04','1-超级管理员','2018-05-20 17:05:25','233','中国人保','95501','2018-05-02','2019-05-01',2222.00);

/*Table structure for table `biz_usecar` */

CREATE TABLE `biz_usecar` (
  `uc_id` varchar(32) NOT NULL COMMENT '主键id',
  `v_id` varchar(32) DEFAULT NULL COMMENT '车牌id',
  `v_hphm` varchar(10) DEFAULT NULL COMMENT '车牌号码',
  `uc_ccsj` varchar(20) DEFAULT NULL COMMENT '出车时间',
  `uc_ccsy` varchar(200) DEFAULT NULL COMMENT '出车事由',
  `uc_jyrid` varchar(32) DEFAULT NULL COMMENT '借用人id',
  `uc_jyr` varchar(50) DEFAULT NULL COMMENT '借用人',
  `uc_yjhcsj` varchar(20) DEFAULT NULL COMMENT '预计还车时间',
  `uc_cclcs` int(11) DEFAULT NULL COMMENT '出车前里程数',
  `un_hclcs` int(11) DEFAULT NULL COMMENT '还车里程数',
  `create_user` varchar(50) DEFAULT NULL COMMENT '创建人',
  `create_time` varchar(20) DEFAULT NULL COMMENT '创建时间',
  `update_user` varchar(50) DEFAULT NULL COMMENT '修改人',
  `update_time` varchar(20) DEFAULT NULL COMMENT '修改时间',
  `uc_bz` varchar(200) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`uc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='出车记录表';

/*Data for the table `biz_usecar` */

insert  into `biz_usecar`(`uc_id`,`v_id`,`v_hphm`,`uc_ccsj`,`uc_ccsy`,`uc_jyrid`,`uc_jyr`,`uc_yjhcsj`,`uc_cclcs`,`un_hclcs`,`create_user`,`create_time`,`update_user`,`update_time`,`uc_bz`) values ('448222200781078528','447441975281451008','鄂A20102','2018-05-01','1231','1','超级管理员','2018-05-08',122,NULL,'1-超级管理员','2018-05-21 20:35:00',NULL,NULL,NULL);

/*Table structure for table `biz_veh_log` */

CREATE TABLE `biz_veh_log` (
  `vl_id` varchar(32) NOT NULL COMMENT '主键id',
  `v_id` varchar(32) DEFAULT NULL COMMENT '车辆ID',
  `v_hphm` varchar(10) DEFAULT NULL COMMENT '车牌号码',
  `vl_xqlx` varchar(10) DEFAULT NULL COMMENT '续期类型。10：年审；20：保险；30：保养',
  `vl_xqsj` varchar(20) DEFAULT NULL COMMENT '续期时间',
  `vl_text` varchar(200) DEFAULT NULL COMMENT '续期内容',
  `create_user` varchar(50) DEFAULT NULL COMMENT '操作人',
  `create_time` varchar(20) DEFAULT NULL COMMENT '操作时间',
  `vl_bz` varchar(200) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`vl_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='车辆续期记录表';

/*Data for the table `biz_veh_log` */

insert  into `biz_veh_log`(`vl_id`,`v_id`,`v_hphm`,`vl_xqlx`,`vl_xqsj`,`vl_text`,`create_user`,`create_time`,`vl_bz`) values ('448220286731419648','447529271901028352','津QWQ12312',NULL,'2018-05-15 07:07:07','李克强为','1-超级管理员','2018-05-21 20:27:23',NULL);

/*Table structure for table `biz_vehicle` */

CREATE TABLE `biz_vehicle` (
  `v_id` varchar(32) NOT NULL COMMENT '主键ID',
  `v_hphm` varchar(10) DEFAULT NULL COMMENT '车牌号',
  `v_hpzl` varchar(5) DEFAULT NULL COMMENT '车辆类型',
  `v_clph` varchar(50) DEFAULT NULL COMMENT '车辆品牌',
  `v_cllx` varchar(50) DEFAULT NULL COMMENT '车辆型号',
  `v_ccdjrq` varchar(20) DEFAULT NULL COMMENT '注册登记日期',
  `v_nsrq` varchar(20) DEFAULT NULL COMMENT '年审时间.通过登记日期自动计算',
  `v_syl` varchar(50) DEFAULT NULL COMMENT '所有人',
  `v_syxz` varchar(5) DEFAULT NULL COMMENT '使用性质',
  `v_cjh` varchar(50) DEFAULT NULL COMMENT '车架号',
  `v_fdjh` varchar(50) DEFAULT NULL COMMENT '发动机号',
  `v_zt` varchar(5) DEFAULT NULL COMMENT '状态',
  `v_gsdm` varchar(20) DEFAULT NULL COMMENT '所属公司代码',
  `v_gsmc` varchar(50) DEFAULT NULL COMMENT '所属公司名称',
  `v_lxr` varchar(200) DEFAULT NULL COMMENT '使用人',
  `v_lxdh` varchar(500) DEFAULT NULL COMMENT '使用人联系电话',
  `v_bdhm` varchar(50) DEFAULT NULL COMMENT '保单号码',
  `create_user` varchar(50) DEFAULT NULL COMMENT '创建人',
  `create_time` varchar(20) DEFAULT NULL COMMENT '创建时间',
  `update_user` varchar(50) DEFAULT NULL COMMENT '修改人',
  `update_time` varchar(20) DEFAULT NULL COMMENT '修改时间',
  `last_fuel_money` float DEFAULT NULL COMMENT '最后一次加油金额',
  `last_fuel_capacity` float DEFAULT NULL COMMENT '最后一次加油容量',
  `last_fuel_time` varchar(20) DEFAULT NULL COMMENT '最后加油时间',
  PRIMARY KEY (`v_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='车辆信息表';

/*Data for the table `biz_vehicle` */

insert  into `biz_vehicle`(`v_id`,`v_hphm`,`v_hpzl`,`v_clph`,`v_cllx`,`v_ccdjrq`,`v_nsrq`,`v_syl`,`v_syxz`,`v_cjh`,`v_fdjh`,`v_zt`,`v_gsdm`,`v_gsmc`,`v_lxr`,`v_lxdh`,`v_bdhm`,`create_user`,`create_time`,`update_user`,`update_time`,`last_fuel_money`,`last_fuel_capacity`,`last_fuel_time`) values ('447441975281451008','鄂A20102','10','14','','2018-05-19','2019-05-31','1的个','10','','','','','','','','','1-超级管理员','2018-05-19 16:54:39','1-超级管理员','2018-05-21 18:53:28',100,10,'2018-05-21 20:33:30');
insert  into `biz_vehicle`(`v_id`,`v_hphm`,`v_hpzl`,`v_clph`,`v_cllx`,`v_ccdjrq`,`v_nsrq`,`v_syl`,`v_syxz`,`v_cjh`,`v_fdjh`,`v_zt`,`v_gsdm`,`v_gsmc`,`v_lxr`,`v_lxdh`,`v_bdhm`,`create_user`,`create_time`,`update_user`,`update_time`,`last_fuel_money`,`last_fuel_capacity`,`last_fuel_time`) values ('447529271901028352','津QWQ12312','20','','123123','2018-05-19','2020-05-31','去问问','10','','123123','','','','446638357951283200-管理员','18602714780','','1-超级管理员','2018-05-19 22:41:33','1-超级管理员','2018-05-21 20:27:24',NULL,NULL,'');

/*Table structure for table `biz_vehicle_extra` */

CREATE TABLE `biz_vehicle_extra` (
  `v_id` varchar(32) DEFAULT NULL COMMENT '车辆id',
  `v_hphm` varchar(10) DEFAULT NULL COMMENT '车牌号',
  `last_fuel_time` varchar(20) DEFAULT NULL COMMENT '最后一次加油时间',
  `last_fuel_money` decimal(7,2) DEFAULT NULL COMMENT '最后一次加油金额',
  `last_fuel_capacity` int(11) DEFAULT NULL COMMENT '最后一次加油容量',
  `last_repair_time` varchar(20) DEFAULT NULL COMMENT '最后一次维修时间',
  `last_repair_project` varchar(32) DEFAULT NULL COMMENT '最后一次维修项目',
  `last_repair_money` decimal(7,2) DEFAULT NULL COMMENT '最后一次应付维修金额',
  `last_repair_real_money` decimal(7,2) DEFAULT NULL COMMENT '最后一次实付维修金额',
  `total_repairMoney` decimal(7,2) DEFAULT NULL COMMENT '累计维修金额',
  `last_maintain_time` varchar(20) DEFAULT NULL COMMENT '最后一次保养时间',
  `last_maintain_money` decimal(7,2) DEFAULT NULL COMMENT '最后一次保养金额'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='车辆信息扩展表';

/*Data for the table `biz_vehicle_extra` */

/*Table structure for table `biz_wfxx` */

CREATE TABLE `biz_wfxx` (
  `wf_id` varchar(30) NOT NULL COMMENT '违法编号',
  `wf_wfsj` varchar(20) DEFAULT NULL COMMENT '违法时间',
  `wf_wfdz` varchar(200) DEFAULT NULL COMMENT '违法地点',
  `wf_wfxw` varchar(10) DEFAULT NULL COMMENT '违法行为',
  `v_id` varchar(32) DEFAULT NULL COMMENT '车辆ID',
  `v_hphm` varchar(10) DEFAULT NULL COMMENT '车牌号码',
  `wf_wfjf` int(11) DEFAULT NULL COMMENT '违法记分',
  `wf_wfje` int(11) DEFAULT NULL COMMENT '违法金额',
  `wf_wfzt` varchar(5) DEFAULT NULL COMMENT '违法状态',
  `create_user` varchar(50) DEFAULT NULL COMMENT '创建人',
  `create_time` varchar(20) DEFAULT NULL COMMENT '创建时间',
  `update_user` varchar(50) DEFAULT NULL COMMENT '修改人',
  `update_time` varchar(20) DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`wf_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='车辆违法信息表';

/*Data for the table `biz_wfxx` */

insert  into `biz_wfxx`(`wf_id`,`wf_wfsj`,`wf_wfdz`,`wf_wfxw`,`v_id`,`v_hphm`,`wf_wfjf`,`wf_wfje`,`wf_wfzt`,`create_user`,`create_time`,`update_user`,`update_time`) values ('111','2018-05-09 00:00:00','','212','447441975281451008','鄂A20102',0,0,'01','1-超级管理员','2018-05-21 12:10:32','1-超级管理员','2018-05-21 12:18:20');
insert  into `biz_wfxx`(`wf_id`,`wf_wfsj`,`wf_wfdz`,`wf_wfxw`,`v_id`,`v_hphm`,`wf_wfjf`,`wf_wfje`,`wf_wfzt`,`create_user`,`create_time`,`update_user`,`update_time`) values ('123123','2018-05-01 08:07:06','1231','12','447529271901028352','津QWQ12312',11,121,'02','1-超级管理员','2018-05-21 07:40:48','1-超级管理员','2018-05-21 07:43:52');

/*Table structure for table `biz_wxjl` */

CREATE TABLE `biz_wxjl` (
  `wx_id` varchar(32) NOT NULL COMMENT '主键id',
  `v_id` varchar(32) DEFAULT NULL COMMENT '车辆id',
  `v_hphm` varchar(10) DEFAULT NULL COMMENT '车牌号码',
  `wx_wxsj` varchar(20) DEFAULT NULL COMMENT '最后一次维修时间',
  `wx_wxxm` varchar(200) DEFAULT NULL COMMENT '最后一次维修项目',
  `wx_zsyfje` decimal(7,2) DEFAULT NULL COMMENT '最后一次应付维护费用',
  `wx_zsbxje` decimal(7,2) DEFAULT NULL COMMENT '最后一次保险抵扣费用',
  `wx_zssfje` decimal(7,2) DEFAULT NULL COMMENT '最后一次实付维护费用',
  `wx_wxzje` decimal(9,2) DEFAULT NULL COMMENT '累计维修金额',
  `update_user` varchar(50) DEFAULT NULL COMMENT '修改人',
  `update_time` varchar(20) DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`wx_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='车辆维护表';

/*Data for the table `biz_wxjl` */

/*Table structure for table `biz_wxjlxq` */

CREATE TABLE `biz_wxjlxq` (
  `wxx_id` varchar(32) NOT NULL COMMENT '主键id',
  `v_id` varchar(32) DEFAULT NULL COMMENT '车辆id',
  `v_hphm` varchar(10) DEFAULT NULL COMMENT '车牌号码',
  `wxx_wxxm` varchar(200) DEFAULT NULL COMMENT '维修项目',
  `wxx_wxxq` varchar(200) DEFAULT NULL COMMENT '维修详情',
  `wxx_wxsj` varchar(20) DEFAULT NULL COMMENT '维修时间',
  `wxx_gcmc` varchar(100) DEFAULT NULL COMMENT '维修工厂名',
  `wxx_wxdd` varchar(200) DEFAULT NULL COMMENT '维修地点',
  `wxx_yfje` decimal(7,2) DEFAULT NULL COMMENT '维修应付金额',
  `wxx_bxje` decimal(7,2) DEFAULT NULL COMMENT '保险报销金额',
  `wxx_sfje` decimal(7,2) DEFAULT NULL COMMENT '维修实付金额',
  `wxx_wxzt` varchar(5) DEFAULT NULL COMMENT '维修状态',
  `create_user` varchar(50) DEFAULT NULL COMMENT '创建人',
  `create_time` varchar(20) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`wxx_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='车辆维修记录详情表';

/*Data for the table `biz_wxjlxq` */

/*Table structure for table `biz_ykjl` */

CREATE TABLE `biz_ykjl` (
  `yk_id` varchar(30) NOT NULL COMMENT '油卡卡号',
  `yk_fkgs` varchar(50) DEFAULT NULL COMMENT '发卡公司',
  `yk_zsyksj` varchar(20) DEFAULT NULL COMMENT '最后一次用卡时间',
  `yk_ye` decimal(7,2) DEFAULT NULL COMMENT '卡余额',
  `yk_zshphm` varchar(10) DEFAULT NULL COMMENT '最后一次用卡车牌号',
  `create_user` varchar(50) DEFAULT NULL COMMENT '创建人',
  `create_time` varchar(20) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`yk_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='油卡信息记录表';

/*Data for the table `biz_ykjl` */

insert  into `biz_ykjl`(`yk_id`,`yk_fkgs`,`yk_zsyksj`,`yk_ye`,`yk_zshphm`,`create_user`,`create_time`) values ('123','123','2018-05-21 20:33:30',2900.00,'鄂A20102',NULL,'2018-05-21 20:30:50');

/*Table structure for table `biz_yljl` */

CREATE TABLE `biz_yljl` (
  `yl_id` varchar(32) NOT NULL COMMENT '主键id',
  `yl_czlx` varchar(5) DEFAULT NULL COMMENT '操作类型。10：充值；20：消费',
  `yk_id` varchar(30) DEFAULT NULL COMMENT '油卡卡号',
  `yl_yllx` varchar(10) DEFAULT NULL COMMENT '油料类型。92，95，98',
  `yl_ylrs` int(11) DEFAULT NULL COMMENT '油料容量',
  `yl_je` decimal(7,2) DEFAULT NULL COMMENT '金额',
  `v_id` varchar(32) DEFAULT NULL COMMENT '车辆id',
  `v_hphm` varchar(10) DEFAULT NULL COMMENT '车牌号',
  `yl_czsj` varchar(20) DEFAULT NULL COMMENT '操作时间',
  `create_user` varchar(50) DEFAULT NULL COMMENT '创建人',
  `create_time` varchar(20) DEFAULT NULL COMMENT '创建时间',
  `yl_bz` varchar(200) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`yl_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='油料记录表';

/*Data for the table `biz_yljl` */

insert  into `biz_yljl`(`yl_id`,`yl_czlx`,`yk_id`,`yl_yllx`,`yl_ylrs`,`yl_je`,`v_id`,`v_hphm`,`yl_czsj`,`create_user`,`create_time`,`yl_bz`) values ('448221185562378240','10','123',NULL,NULL,2000.00,NULL,NULL,NULL,'1-超级管理员','2018-05-21 20:30:58',NULL);
insert  into `biz_yljl`(`yl_id`,`yl_czlx`,`yk_id`,`yl_yllx`,`yl_ylrs`,`yl_je`,`v_id`,`v_hphm`,`yl_czsj`,`create_user`,`create_time`,`yl_bz`) values ('448221822358388736','20','123',NULL,10,100.00,'447441975281451008','鄂A20102',NULL,'1-超级管理员','2018-05-21 20:33:30',NULL);

/*Table structure for table `sys_clk_ptjs` */

CREATE TABLE `sys_clk_ptjs` (
  `JS_ID` varchar(32) NOT NULL COMMENT '角色id',
  `JSMC` varchar(32) DEFAULT NULL COMMENT '角色名称',
  `JSLX` varchar(32) DEFAULT NULL COMMENT '角色类型',
  `CJSJ` varchar(32) DEFAULT NULL COMMENT '创建时间',
  `CJR` varchar(64) DEFAULT NULL COMMENT '创建人',
  `XGR` varchar(64) DEFAULT NULL COMMENT '修改人',
  `XGSJ` varchar(32) DEFAULT NULL COMMENT '修改时间',
  `ZT` char(32) DEFAULT NULL COMMENT '状态',
  `JGDM` varchar(32) DEFAULT NULL COMMENT '机构代码',
  `SM` varchar(1000) DEFAULT NULL COMMENT '说明',
  PRIMARY KEY (`JS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='平台角色表\r\nSYS_CLK_PTJS';

/*Data for the table `sys_clk_ptjs` */

insert  into `sys_clk_ptjs`(`JS_ID`,`JSMC`,`JSLX`,`CJSJ`,`CJR`,`XGR`,`XGSJ`,`ZT`,`JGDM`,`SM`) values ('000000','管理员','00','','1-超级管理员','1-超级管理员','2018-05-17 16:02:20','','100','');

/*Table structure for table `sys_clk_ptyh` */

CREATE TABLE `sys_clk_ptyh` (
  `YHID` varchar(32) NOT NULL COMMENT '用户id',
  `ZH` varchar(32) DEFAULT NULL COMMENT '账号',
  `MM` varchar(32) DEFAULT NULL COMMENT '密码',
  `SJH` varchar(32) DEFAULT NULL COMMENT '手机号',
  `CJR` varchar(64) DEFAULT NULL COMMENT '创建人',
  `CJSJ` varchar(32) DEFAULT NULL COMMENT '创建时间',
  `XGR` varchar(64) DEFAULT NULL COMMENT '修改人',
  `XGSJ` varchar(32) DEFAULT NULL COMMENT '修改时间',
  `ZT` varchar(2) DEFAULT NULL COMMENT '状态',
  `JGDM` varchar(20) DEFAULT NULL COMMENT '机构代码',
  `XM` varchar(32) DEFAULT NULL COMMENT '姓名',
  `LX` varchar(2) DEFAULT NULL COMMENT '类型。10管理员；20：工作人员；30：教练员',
  `XB` varchar(32) DEFAULT NULL COMMENT '性别',
  `ZJHM` varchar(32) DEFAULT NULL COMMENT '证件号码',
  `MMYXQ` varchar(32) DEFAULT NULL COMMENT '密码有效期',
  `ZW` varchar(32) DEFAULT NULL COMMENT '职务',
  `zjhmexp` varchar(50) DEFAULT NULL COMMENT '身份证有效期',
  `zjcx` varchar(5) DEFAULT NULL COMMENT '准驾车型',
  `rzrq` varchar(20) DEFAULT NULL COMMENT '入职日期',
  `jszclrq` varchar(20) DEFAULT NULL COMMENT '驾驶证初次登记日期',
  `jszjzrq` varchar(20) DEFAULT NULL COMMENT '驾驶证截止日期',
  PRIMARY KEY (`YHID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='平台用户表\r\nSYS_CLK_PTYH';

/*Data for the table `sys_clk_ptyh` */

insert  into `sys_clk_ptyh`(`YHID`,`ZH`,`MM`,`SJH`,`CJR`,`CJSJ`,`XGR`,`XGSJ`,`ZT`,`JGDM`,`XM`,`LX`,`XB`,`ZJHM`,`MMYXQ`,`ZW`,`zjhmexp`,`zjcx`,`rzrq`,`jszclrq`,`jszjzrq`) values ('1','admini','4DA3BB20330A34F4','手机号','cjr','2018-05-16 12:55:32','','','01','100','超级管理员','su','1','证件号码','','管理员',NULL,NULL,NULL,NULL,NULL);
insert  into `sys_clk_ptyh`(`YHID`,`ZH`,`MM`,`SJH`,`CJR`,`CJSJ`,`XGR`,`XGSJ`,`ZT`,`JGDM`,`XM`,`LX`,`XB`,`ZJHM`,`MMYXQ`,`ZW`,`zjhmexp`,`zjcx`,`rzrq`,`jszclrq`,`jszjzrq`) values ('446638357951283200','tester','4DA3BB20330A34F4','18602714780','','2018-05-17 11:41:22','','','01','100','管理员','20','1','420381198601060017','','','2000-01-01','C1','2018-05-01','2018-05-10','2018-05-24');

/*Table structure for table `sys_fwgn` */

CREATE TABLE `sys_fwgn` (
  `GNDM` varchar(32) NOT NULL COMMENT '功能代码',
  `GNMC` varchar(32) DEFAULT NULL COMMENT '功能名称',
  `FWDM` varchar(32) DEFAULT NULL COMMENT '服务代码',
  `CJSJ` varchar(32) DEFAULT NULL COMMENT '创建时间',
  `CJR` varchar(64) DEFAULT NULL COMMENT '创建人',
  `XGSJ` varchar(32) DEFAULT NULL COMMENT '修改时间',
  `XGR` varchar(64) DEFAULT NULL COMMENT '修改人',
  `ZT` varchar(2) DEFAULT NULL COMMENT '状态',
  `BZ` varchar(255) DEFAULT NULL COMMENT '备注',
  `URL` varchar(255) DEFAULT NULL COMMENT 'URL',
  `FJD` varchar(32) DEFAULT NULL COMMENT '父节点',
  `TZDZ` varchar(32) DEFAULT NULL COMMENT '跳转地址',
  `TB` varchar(32) DEFAULT NULL COMMENT '图标',
  `API_QZ` varchar(64) DEFAULT NULL COMMENT 'API前缀',
  `API_HZ` varchar(64) DEFAULT NULL COMMENT 'API后缀',
  `PX` float(32,0) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`GNDM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='服务功能(菜单表)\r\nSYS_FWGN\r\n';

/*Data for the table `sys_fwgn` */

insert  into `sys_fwgn`(`GNDM`,`GNMC`,`FWDM`,`CJSJ`,`CJR`,`XGSJ`,`XGR`,`ZT`,`BZ`,`URL`,`FJD`,`TZDZ`,`TB`,`API_QZ`,`API_HZ`,`PX`) values ('system','系统管理','1','','初始导入','','1-超级管理员','00','','system','','','navicon-round','/','',1);
insert  into `sys_fwgn`(`GNDM`,`GNMC`,`FWDM`,`CJSJ`,`CJR`,`XGSJ`,`XGR`,`ZT`,`BZ`,`URL`,`FJD`,`TZDZ`,`TB`,`API_QZ`,`API_HZ`,`PX`) values ('system-daily','日志管理','1','','初始导入','','1-超级管理员','00','','system-daily','system','','android-create','/api/rz/','',7);
insert  into `sys_fwgn`(`GNDM`,`GNMC`,`FWDM`,`CJSJ`,`CJR`,`XGSJ`,`XGR`,`ZT`,`BZ`,`URL`,`FJD`,`TZDZ`,`TB`,`API_QZ`,`API_HZ`,`PX`) values ('system-dictionary','字典管理','1','','初始导入','','1-超级管理员','00','','system-dictionary','system','','ios-keypad','/api/zd/','',4);
insert  into `sys_fwgn`(`GNDM`,`GNMC`,`FWDM`,`CJSJ`,`CJR`,`XGSJ`,`XGR`,`ZT`,`BZ`,`URL`,`FJD`,`TZDZ`,`TB`,`API_QZ`,`API_HZ`,`PX`) values ('system-framework','组织机构','1','','初始导入','','1-超级管理员','00','','system-framework','system','','flag','/api/gn/','',3);
insert  into `sys_fwgn`(`GNDM`,`GNMC`,`FWDM`,`CJSJ`,`CJR`,`XGSJ`,`XGR`,`ZT`,`BZ`,`URL`,`FJD`,`TZDZ`,`TB`,`API_QZ`,`API_HZ`,`PX`) values ('system-function','功能管理','1','','初始导入','','1-超级管理员','00','','system-function','system','','ios-cog','/api/gn/','',6);
insert  into `sys_fwgn`(`GNDM`,`GNMC`,`FWDM`,`CJSJ`,`CJR`,`XGSJ`,`XGR`,`ZT`,`BZ`,`URL`,`FJD`,`TZDZ`,`TB`,`API_QZ`,`API_HZ`,`PX`) values ('system-ITSM','服务管理','1','','初始导入','','1-超级管理员','00','','system-ITSM','system','','ios-briefcase','/api/fw/','',5);
insert  into `sys_fwgn`(`GNDM`,`GNMC`,`FWDM`,`CJSJ`,`CJR`,`XGSJ`,`XGR`,`ZT`,`BZ`,`URL`,`FJD`,`TZDZ`,`TB`,`API_QZ`,`API_HZ`,`PX`) values ('system-role','角色管理','1','','1','','1-超级管理员','00',' ','system-role','system','','ios-people','/api/js/','',2);
insert  into `sys_fwgn`(`GNDM`,`GNMC`,`FWDM`,`CJSJ`,`CJR`,`XGSJ`,`XGR`,`ZT`,`BZ`,`URL`,`FJD`,`TZDZ`,`TB`,`API_QZ`,`API_HZ`,`PX`) values ('system-user','用户管理','1','','初始导入','','1-超级管理员','00','','system-user','system','','person-stalker','/api/yh/','',1);
insert  into `sys_fwgn`(`GNDM`,`GNMC`,`FWDM`,`CJSJ`,`CJR`,`XGSJ`,`XGR`,`ZT`,`BZ`,`URL`,`FJD`,`TZDZ`,`TB`,`API_QZ`,`API_HZ`,`PX`) values ('vehbaoxian','维保管理','1','2018-05-17 15:57:28','1-超级管理员','2018-05-17 16:04:16','446638357951283200-管理员','00','','vehbaoxian',NULL,'vehbaoxian','settings','/','',3);
insert  into `sys_fwgn`(`GNDM`,`GNMC`,`FWDM`,`CJSJ`,`CJR`,`XGSJ`,`XGR`,`ZT`,`BZ`,`URL`,`FJD`,`TZDZ`,`TB`,`API_QZ`,`API_HZ`,`PX`) values ('vehbaoxian-baoyang','保养管理','1','2018-05-17 16:01:36','1-超级管理员',NULL,NULL,'00',NULL,'vehbaoxian-baoyang','vehbaoxian','vehbaoxian-baoyang','ios','/api/vehbaoxian',NULL,4);
insert  into `sys_fwgn`(`GNDM`,`GNMC`,`FWDM`,`CJSJ`,`CJR`,`XGSJ`,`XGR`,`ZT`,`BZ`,`URL`,`FJD`,`TZDZ`,`TB`,`API_QZ`,`API_HZ`,`PX`) values ('vehbaoxian-weixiu','维修管理','1','2018-05-17 15:59:59','1-超级管理员','2018-05-17 16:00:03','1-超级管理员','00','','vehbaoxian-weixiu','vehbaoxian','vehbaoxian-weixiu','ios','/api/vehbaoxian','',3);
insert  into `sys_fwgn`(`GNDM`,`GNMC`,`FWDM`,`CJSJ`,`CJR`,`XGSJ`,`XGR`,`ZT`,`BZ`,`URL`,`FJD`,`TZDZ`,`TB`,`API_QZ`,`API_HZ`,`PX`) values ('vehbaoxian-youka','油卡管理','1','2018-05-17 15:58:21','1-超级管理员',NULL,NULL,'00',NULL,'vehbaoxian-youka','vehbaoxian','vehbaoxian-youka','ios','/api/vehbaoxian',NULL,1);
insert  into `sys_fwgn`(`GNDM`,`GNMC`,`FWDM`,`CJSJ`,`CJR`,`XGSJ`,`XGR`,`ZT`,`BZ`,`URL`,`FJD`,`TZDZ`,`TB`,`API_QZ`,`API_HZ`,`PX`) values ('vehbaoxian-youliao','油料管理','1','2018-05-17 15:59:04','1-超级管理员',NULL,NULL,'00',NULL,'vehbaoxian-youliao','vehbaoxian','vehbaoxian-youliao','ios','/api/vehbaoxian',NULL,2);
insert  into `sys_fwgn`(`GNDM`,`GNMC`,`FWDM`,`CJSJ`,`CJR`,`XGSJ`,`XGR`,`ZT`,`BZ`,`URL`,`FJD`,`TZDZ`,`TB`,`API_QZ`,`API_HZ`,`PX`) values ('vehicle','车辆管理','1','2018-05-17 15:49:48','1-超级管理员','2018-05-17 15:57:33','1-超级管理员','00','','/',NULL,'/','model-s','/vehicle','',2);
insert  into `sys_fwgn`(`GNDM`,`GNMC`,`FWDM`,`CJSJ`,`CJR`,`XGSJ`,`XGR`,`ZT`,`BZ`,`URL`,`FJD`,`TZDZ`,`TB`,`API_QZ`,`API_HZ`,`PX`) values ('vehicle-baoxian','保险管理','1','2018-05-17 15:54:33','1-超级管理员',NULL,NULL,'00',NULL,'vehicle-baoxian','vehicle','vehicle-baoxian','ios-bookmarks','/api/vehicle',NULL,2);
insert  into `sys_fwgn`(`GNDM`,`GNMC`,`FWDM`,`CJSJ`,`CJR`,`XGSJ`,`XGR`,`ZT`,`BZ`,`URL`,`FJD`,`TZDZ`,`TB`,`API_QZ`,`API_HZ`,`PX`) values ('vehicle-mgr','车辆管理','1','2018-05-17 15:51:44','1-超级管理员','2018-05-17 15:51:53','1-超级管理员','00','','vehicle-mgr','vehicle','/vehicle-mgr','model-s','/api/vehicle','',1);
insert  into `sys_fwgn`(`GNDM`,`GNMC`,`FWDM`,`CJSJ`,`CJR`,`XGSJ`,`XGR`,`ZT`,`BZ`,`URL`,`FJD`,`TZDZ`,`TB`,`API_QZ`,`API_HZ`,`PX`) values ('vehicle-usecar','出车管理','1','2018-05-17 15:56:37','1-超级管理员','2018-05-17 16:02:10','1-超级管理员','00','','vehicle-usecar','vehicle','vehicle-usecar','ios','/api/vehicle','',4);
insert  into `sys_fwgn`(`GNDM`,`GNMC`,`FWDM`,`CJSJ`,`CJR`,`XGSJ`,`XGR`,`ZT`,`BZ`,`URL`,`FJD`,`TZDZ`,`TB`,`API_QZ`,`API_HZ`,`PX`) values ('vehicle-wfxx','违法管理','1','2018-05-17 15:55:34','1-超级管理员','2018-05-21 07:23:01','1-超级管理员','00','','vehicle-wfxx','vehicle','vehicle-wfxx','ios-camera','/api/vehicle','',3);

/*Table structure for table `sys_jgsqlb` */

CREATE TABLE `sys_jgsqlb` (
  `ID` varchar(32) NOT NULL COMMENT 'ID',
  `JGDM` varchar(20) DEFAULT NULL COMMENT '机构代码',
  `FWDM` varchar(32) DEFAULT NULL COMMENT '服务代码',
  `GNDM` varchar(32) DEFAULT NULL COMMENT '功能代码',
  `CJSJ` varchar(32) DEFAULT NULL COMMENT '创建时间',
  `CJR` varchar(64) DEFAULT NULL COMMENT '创建人',
  `XGSJ` varchar(32) DEFAULT NULL COMMENT '修改时间',
  `XGR` varchar(64) DEFAULT NULL COMMENT '修改人',
  `YXQ` varchar(32) DEFAULT NULL COMMENT '有效期',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sys_jgsqlb` */

insert  into `sys_jgsqlb`(`ID`,`JGDM`,`FWDM`,`GNDM`,`CJSJ`,`CJR`,`XGSJ`,`XGR`,`YXQ`) values ('443091726173732864','100','1','system','','1-超级管理员','','','');
insert  into `sys_jgsqlb`(`ID`,`JGDM`,`FWDM`,`GNDM`,`CJSJ`,`CJR`,`XGSJ`,`XGR`,`YXQ`) values ('443091727046148096','100','1','system-user','','1-超级管理员','','','');
insert  into `sys_jgsqlb`(`ID`,`JGDM`,`FWDM`,`GNDM`,`CJSJ`,`CJR`,`XGSJ`,`XGR`,`YXQ`) values ('443091728732258304','100','1','system-role','','1-超级管理员','','','');
insert  into `sys_jgsqlb`(`ID`,`JGDM`,`FWDM`,`GNDM`,`CJSJ`,`CJR`,`XGSJ`,`XGR`,`YXQ`) values ('443091729067802624','100','1','system-framework','','1-超级管理员','','','');
insert  into `sys_jgsqlb`(`ID`,`JGDM`,`FWDM`,`GNDM`,`CJSJ`,`CJR`,`XGSJ`,`XGR`,`YXQ`) values ('443091729483038720','100','1','system-dictionary','','1-超级管理员','','','');
insert  into `sys_jgsqlb`(`ID`,`JGDM`,`FWDM`,`GNDM`,`CJSJ`,`CJR`,`XGSJ`,`XGR`,`YXQ`) values ('443091731290783744','100','1','system-ITSM','','1-超级管理员','','','');
insert  into `sys_jgsqlb`(`ID`,`JGDM`,`FWDM`,`GNDM`,`CJSJ`,`CJR`,`XGSJ`,`XGR`,`YXQ`) values ('443091731722797056','100','1','system-function','','1-超级管理员','','','');
insert  into `sys_jgsqlb`(`ID`,`JGDM`,`FWDM`,`GNDM`,`CJSJ`,`CJR`,`XGSJ`,`XGR`,`YXQ`) values ('443091736755961856','100','1','system-daily','','1-超级管理员','','','');
insert  into `sys_jgsqlb`(`ID`,`JGDM`,`FWDM`,`GNDM`,`CJSJ`,`CJR`,`XGSJ`,`XGR`,`YXQ`) values ('443091737464799232','100','1','system-suggestions','','1-超级管理员','','','');
insert  into `sys_jgsqlb`(`ID`,`JGDM`,`FWDM`,`GNDM`,`CJSJ`,`CJR`,`XGSJ`,`XGR`,`YXQ`) values ('443091737762594816','100','1','system-notice','','1-超级管理员','','','');
insert  into `sys_jgsqlb`(`ID`,`JGDM`,`FWDM`,`GNDM`,`CJSJ`,`CJR`,`XGSJ`,`XGR`,`YXQ`) values ('443091739083800576','100','1','system-propelling','','1-超级管理员','','','');
insert  into `sys_jgsqlb`(`ID`,`JGDM`,`FWDM`,`GNDM`,`CJSJ`,`CJR`,`XGSJ`,`XGR`,`YXQ`) values ('443091739465482240','100','1','system-advertising','','1-超级管理员','','','');
insert  into `sys_jgsqlb`(`ID`,`JGDM`,`FWDM`,`GNDM`,`CJSJ`,`CJR`,`XGSJ`,`XGR`,`YXQ`) values ('443388386258976768','100038','','system','','1-超级管理员','','','');
insert  into `sys_jgsqlb`(`ID`,`JGDM`,`FWDM`,`GNDM`,`CJSJ`,`CJR`,`XGSJ`,`XGR`,`YXQ`) values ('443388386401583104','100038','','system-role','','1-超级管理员','','','');
insert  into `sys_jgsqlb`(`ID`,`JGDM`,`FWDM`,`GNDM`,`CJSJ`,`CJR`,`XGSJ`,`XGR`,`YXQ`) values ('443388386514829312','100038','','system-user','','1-超级管理员','','','');
insert  into `sys_jgsqlb`(`ID`,`JGDM`,`FWDM`,`GNDM`,`CJSJ`,`CJR`,`XGSJ`,`XGR`,`YXQ`) values ('443388386628075520','100038','','system-framework','','1-超级管理员','','','');
insert  into `sys_jgsqlb`(`ID`,`JGDM`,`FWDM`,`GNDM`,`CJSJ`,`CJR`,`XGSJ`,`XGR`,`YXQ`) values ('443388386753904640','100038','','system-dictionary','','1-超级管理员','','','');
insert  into `sys_jgsqlb`(`ID`,`JGDM`,`FWDM`,`GNDM`,`CJSJ`,`CJR`,`XGSJ`,`XGR`,`YXQ`) values ('443388386858762240','100038','','system-ITSM','','1-超级管理员','','','');
insert  into `sys_jgsqlb`(`ID`,`JGDM`,`FWDM`,`GNDM`,`CJSJ`,`CJR`,`XGSJ`,`XGR`,`YXQ`) values ('443388386972008448','100038','','system-function','','1-超级管理员','','','');
insert  into `sys_jgsqlb`(`ID`,`JGDM`,`FWDM`,`GNDM`,`CJSJ`,`CJR`,`XGSJ`,`XGR`,`YXQ`) values ('443388387093643264','100038','','system-daily','','1-超级管理员','','','');
insert  into `sys_jgsqlb`(`ID`,`JGDM`,`FWDM`,`GNDM`,`CJSJ`,`CJR`,`XGSJ`,`XGR`,`YXQ`) values ('443388387227860992','100038','','system-suggestions','','1-超级管理员','','','');
insert  into `sys_jgsqlb`(`ID`,`JGDM`,`FWDM`,`GNDM`,`CJSJ`,`CJR`,`XGSJ`,`XGR`,`YXQ`) values ('443388387336912896','100038','','system-notice','','1-超级管理员','','','');
insert  into `sys_jgsqlb`(`ID`,`JGDM`,`FWDM`,`GNDM`,`CJSJ`,`CJR`,`XGSJ`,`XGR`,`YXQ`) values ('443388387445964800','100038','','system-propelling','','1-超级管理员','','','');
insert  into `sys_jgsqlb`(`ID`,`JGDM`,`FWDM`,`GNDM`,`CJSJ`,`CJR`,`XGSJ`,`XGR`,`YXQ`) values ('443388387555016704','100038','','system-advertising','','1-超级管理员','','','');
insert  into `sys_jgsqlb`(`ID`,`JGDM`,`FWDM`,`GNDM`,`CJSJ`,`CJR`,`XGSJ`,`XGR`,`YXQ`) values ('446325076342603776','100001',NULL,'system','2018-05-16 14:56:30','1-超级管理员',NULL,NULL,NULL);
insert  into `sys_jgsqlb`(`ID`,`JGDM`,`FWDM`,`GNDM`,`CJSJ`,`CJR`,`XGSJ`,`XGR`,`YXQ`) values ('446325076443267072','100001',NULL,'system-daily','2018-05-16 14:56:30','1-超级管理员',NULL,NULL,NULL);
insert  into `sys_jgsqlb`(`ID`,`JGDM`,`FWDM`,`GNDM`,`CJSJ`,`CJR`,`XGSJ`,`XGR`,`YXQ`) values ('446325076539736064','100001',NULL,'system-dictionary','2018-05-16 14:56:30','1-超级管理员',NULL,NULL,NULL);
insert  into `sys_jgsqlb`(`ID`,`JGDM`,`FWDM`,`GNDM`,`CJSJ`,`CJR`,`XGSJ`,`XGR`,`YXQ`) values ('446325076636205056','100001',NULL,'system-framework','2018-05-16 14:56:30','1-超级管理员',NULL,NULL,NULL);
insert  into `sys_jgsqlb`(`ID`,`JGDM`,`FWDM`,`GNDM`,`CJSJ`,`CJR`,`XGSJ`,`XGR`,`YXQ`) values ('446325076732674048','100001',NULL,'system-function','2018-05-16 14:56:30','1-超级管理员',NULL,NULL,NULL);
insert  into `sys_jgsqlb`(`ID`,`JGDM`,`FWDM`,`GNDM`,`CJSJ`,`CJR`,`XGSJ`,`XGR`,`YXQ`) values ('446325076833337344','100001',NULL,'system-ITSM','2018-05-16 14:56:30','1-超级管理员',NULL,NULL,NULL);
insert  into `sys_jgsqlb`(`ID`,`JGDM`,`FWDM`,`GNDM`,`CJSJ`,`CJR`,`XGSJ`,`XGR`,`YXQ`) values ('446325076925612032','100001',NULL,'system-role','2018-05-16 14:56:30','1-超级管理员',NULL,NULL,NULL);
insert  into `sys_jgsqlb`(`ID`,`JGDM`,`FWDM`,`GNDM`,`CJSJ`,`CJR`,`XGSJ`,`XGR`,`YXQ`) values ('446325077022081024','100001',NULL,'system-user','2018-05-16 14:56:30','1-超级管理员',NULL,NULL,NULL);
insert  into `sys_jgsqlb`(`ID`,`JGDM`,`FWDM`,`GNDM`,`CJSJ`,`CJR`,`XGSJ`,`XGR`,`YXQ`) values ('446325078112600064','100001',NULL,'system-daily','2018-05-16 14:56:30','1-超级管理员',NULL,NULL,NULL);
insert  into `sys_jgsqlb`(`ID`,`JGDM`,`FWDM`,`GNDM`,`CJSJ`,`CJR`,`XGSJ`,`XGR`,`YXQ`) values ('446325078217457664','100001',NULL,'system-dictionary','2018-05-16 14:56:30','1-超级管理员',NULL,NULL,NULL);
insert  into `sys_jgsqlb`(`ID`,`JGDM`,`FWDM`,`GNDM`,`CJSJ`,`CJR`,`XGSJ`,`XGR`,`YXQ`) values ('446325078313926656','100001',NULL,'system-framework','2018-05-16 14:56:30','1-超级管理员',NULL,NULL,NULL);
insert  into `sys_jgsqlb`(`ID`,`JGDM`,`FWDM`,`GNDM`,`CJSJ`,`CJR`,`XGSJ`,`XGR`,`YXQ`) values ('446325078422978560','100001',NULL,'system-function','2018-05-16 14:56:31','1-超级管理员',NULL,NULL,NULL);
insert  into `sys_jgsqlb`(`ID`,`JGDM`,`FWDM`,`GNDM`,`CJSJ`,`CJR`,`XGSJ`,`XGR`,`YXQ`) values ('446325078527836160','100001',NULL,'system-ITSM','2018-05-16 14:56:31','1-超级管理员',NULL,NULL,NULL);
insert  into `sys_jgsqlb`(`ID`,`JGDM`,`FWDM`,`GNDM`,`CJSJ`,`CJR`,`XGSJ`,`XGR`,`YXQ`) values ('446325078624305152','100001',NULL,'system-role','2018-05-16 14:56:31','1-超级管理员',NULL,NULL,NULL);
insert  into `sys_jgsqlb`(`ID`,`JGDM`,`FWDM`,`GNDM`,`CJSJ`,`CJR`,`XGSJ`,`XGR`,`YXQ`) values ('446325078720774144','100001',NULL,'system-user','2018-05-16 14:56:31','1-超级管理员',NULL,NULL,NULL);
insert  into `sys_jgsqlb`(`ID`,`JGDM`,`FWDM`,`GNDM`,`CJSJ`,`CJR`,`XGSJ`,`XGR`,`YXQ`) values ('446325902209449984','100','henlei','1243434','2018-05-16 14:59:47','1-超级管理员',NULL,NULL,NULL);
insert  into `sys_jgsqlb`(`ID`,`JGDM`,`FWDM`,`GNDM`,`CJSJ`,`CJR`,`XGSJ`,`XGR`,`YXQ`) values ('446700876912918528','100','1','vehicle','2018-05-17 15:49:48','1-超级管理员',NULL,NULL,NULL);
insert  into `sys_jgsqlb`(`ID`,`JGDM`,`FWDM`,`GNDM`,`CJSJ`,`CJR`,`XGSJ`,`XGR`,`YXQ`) values ('446701365104738304','100','1','vehicle-mgr','2018-05-17 15:51:44','1-超级管理员',NULL,NULL,NULL);
insert  into `sys_jgsqlb`(`ID`,`JGDM`,`FWDM`,`GNDM`,`CJSJ`,`CJR`,`XGSJ`,`XGR`,`YXQ`) values ('446702072826429440','100','1','vehicle-baoxian','2018-05-17 15:54:33','1-超级管理员',NULL,NULL,NULL);
insert  into `sys_jgsqlb`(`ID`,`JGDM`,`FWDM`,`GNDM`,`CJSJ`,`CJR`,`XGSJ`,`XGR`,`YXQ`) values ('446702330595770368','100','1','vehicle-wfxx','2018-05-17 15:55:34','1-超级管理员',NULL,NULL,NULL);
insert  into `sys_jgsqlb`(`ID`,`JGDM`,`FWDM`,`GNDM`,`CJSJ`,`CJR`,`XGSJ`,`XGR`,`YXQ`) values ('446702594237136896','100','1','vehicle-usecar','2018-05-17 15:56:37','1-超级管理员',NULL,NULL,NULL);
insert  into `sys_jgsqlb`(`ID`,`JGDM`,`FWDM`,`GNDM`,`CJSJ`,`CJR`,`XGSJ`,`XGR`,`YXQ`) values ('446702807123230720','100','1','vehbaoxian','2018-05-17 15:57:28','1-超级管理员',NULL,NULL,NULL);
insert  into `sys_jgsqlb`(`ID`,`JGDM`,`FWDM`,`GNDM`,`CJSJ`,`CJR`,`XGSJ`,`XGR`,`YXQ`) values ('446703027894616064','100','1','vehbaoxian-youka','2018-05-17 15:58:21','1-超级管理员',NULL,NULL,NULL);
insert  into `sys_jgsqlb`(`ID`,`JGDM`,`FWDM`,`GNDM`,`CJSJ`,`CJR`,`XGSJ`,`XGR`,`YXQ`) values ('446703207582793728','100','1','vehbaoxian-youliao','2018-05-17 15:59:04','1-超级管理员',NULL,NULL,NULL);
insert  into `sys_jgsqlb`(`ID`,`JGDM`,`FWDM`,`GNDM`,`CJSJ`,`CJR`,`XGSJ`,`XGR`,`YXQ`) values ('446703439842377728','100','1','vehbaoxian-weixiu','2018-05-17 15:59:59','1-超级管理员',NULL,NULL,NULL);
insert  into `sys_jgsqlb`(`ID`,`JGDM`,`FWDM`,`GNDM`,`CJSJ`,`CJR`,`XGSJ`,`XGR`,`YXQ`) values ('446703848287895552','100','1','vehbaoxian-baoyang','2018-05-17 16:01:36','1-超级管理员',NULL,NULL,NULL);

/*Table structure for table `sys_js_fw` */

CREATE TABLE `sys_js_fw` (
  `id` varchar(32) NOT NULL COMMENT 'id',
  `JSDM` varchar(32) DEFAULT NULL COMMENT '角色代码',
  `FWDM` varchar(32) DEFAULT NULL COMMENT '服务代码',
  `CJSJ` varchar(32) DEFAULT NULL COMMENT '创建时间',
  `CJR` varchar(64) DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户角色关联表\r\nSYS_JS_FW';

/*Data for the table `sys_js_fw` */

/*Table structure for table `sys_js_gn` */

CREATE TABLE `sys_js_gn` (
  `ID` varchar(32) NOT NULL COMMENT 'id',
  `JSDM` varchar(32) DEFAULT NULL COMMENT '角色代码',
  `GNDM` varchar(32) DEFAULT NULL COMMENT '功能代码',
  `CJR` varchar(64) DEFAULT NULL COMMENT '创建人',
  `FWDM` varchar(32) DEFAULT NULL COMMENT '服务代码',
  `FGNDM` varchar(32) DEFAULT NULL COMMENT '父功能代码',
  `CJSJ` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色功能关联表\r\nSYS_JS_GN';

/*Data for the table `sys_js_gn` */

insert  into `sys_js_gn`(`ID`,`JSDM`,`GNDM`,`CJR`,`FWDM`,`FGNDM`,`CJSJ`) values ('434305549195018240','eee','system-role','1-超级管理员','1','system',NULL);
insert  into `sys_js_gn`(`ID`,`JSDM`,`GNDM`,`CJR`,`FWDM`,`FGNDM`,`CJSJ`) values ('434305549195018241','eee','system','1-超级管理员','1','',NULL);
insert  into `sys_js_gn`(`ID`,`JSDM`,`GNDM`,`CJR`,`FWDM`,`FGNDM`,`CJSJ`) values ('434305549195018242','eee','system-user','1-超级管理员','1','system',NULL);
insert  into `sys_js_gn`(`ID`,`JSDM`,`GNDM`,`CJR`,`FWDM`,`FGNDM`,`CJSJ`) values ('434305549195018243','eee','system-framework','1-超级管理员','1','system',NULL);
insert  into `sys_js_gn`(`ID`,`JSDM`,`GNDM`,`CJR`,`FWDM`,`FGNDM`,`CJSJ`) values ('434305549195018244','eee','system-dictionary','1-超级管理员','1','system',NULL);
insert  into `sys_js_gn`(`ID`,`JSDM`,`GNDM`,`CJR`,`FWDM`,`FGNDM`,`CJSJ`) values ('434305549195018245','eee','system-ITSM','1-超级管理员','1','system',NULL);
insert  into `sys_js_gn`(`ID`,`JSDM`,`GNDM`,`CJR`,`FWDM`,`FGNDM`,`CJSJ`) values ('434305549195018246','eee','system-function','1-超级管理员','1','system',NULL);
insert  into `sys_js_gn`(`ID`,`JSDM`,`GNDM`,`CJR`,`FWDM`,`FGNDM`,`CJSJ`) values ('434305549195018247','eee','system-daily','1-超级管理员','1','system',NULL);
insert  into `sys_js_gn`(`ID`,`JSDM`,`GNDM`,`CJR`,`FWDM`,`FGNDM`,`CJSJ`) values ('434305549195018248','eee','system-suggestions','1-超级管理员','1','system',NULL);
insert  into `sys_js_gn`(`ID`,`JSDM`,`GNDM`,`CJR`,`FWDM`,`FGNDM`,`CJSJ`) values ('434305549195018249','eee','system-notice','1-超级管理员','1','system',NULL);
insert  into `sys_js_gn`(`ID`,`JSDM`,`GNDM`,`CJR`,`FWDM`,`FGNDM`,`CJSJ`) values ('434305549195018250','eee','system-propelling','1-超级管理员','1','system',NULL);
insert  into `sys_js_gn`(`ID`,`JSDM`,`GNDM`,`CJR`,`FWDM`,`FGNDM`,`CJSJ`) values ('434305549195018251','eee','system-advertising','1-超级管理员','1','system',NULL);
insert  into `sys_js_gn`(`ID`,`JSDM`,`GNDM`,`CJR`,`FWDM`,`FGNDM`,`CJSJ`) values ('435778198454665216','1231','system-role','1-超级管理员','1','system',NULL);
insert  into `sys_js_gn`(`ID`,`JSDM`,`GNDM`,`CJR`,`FWDM`,`FGNDM`,`CJSJ`) values ('435778198454665217','1231','system','1-超级管理员','1','',NULL);
insert  into `sys_js_gn`(`ID`,`JSDM`,`GNDM`,`CJR`,`FWDM`,`FGNDM`,`CJSJ`) values ('435778198454665218','1231','system-user','1-超级管理员','1','system',NULL);
insert  into `sys_js_gn`(`ID`,`JSDM`,`GNDM`,`CJR`,`FWDM`,`FGNDM`,`CJSJ`) values ('435778198454665219','1231','system-framework','1-超级管理员','1','system',NULL);
insert  into `sys_js_gn`(`ID`,`JSDM`,`GNDM`,`CJR`,`FWDM`,`FGNDM`,`CJSJ`) values ('435778198454665220','1231','system-dictionary','1-超级管理员','1','system',NULL);
insert  into `sys_js_gn`(`ID`,`JSDM`,`GNDM`,`CJR`,`FWDM`,`FGNDM`,`CJSJ`) values ('435778198454665221','1231','system-ITSM','1-超级管理员','1','system',NULL);
insert  into `sys_js_gn`(`ID`,`JSDM`,`GNDM`,`CJR`,`FWDM`,`FGNDM`,`CJSJ`) values ('435778198454665222','1231','system-function','1-超级管理员','1','system',NULL);
insert  into `sys_js_gn`(`ID`,`JSDM`,`GNDM`,`CJR`,`FWDM`,`FGNDM`,`CJSJ`) values ('435778198454665223','1231','system-daily','1-超级管理员','1','system',NULL);
insert  into `sys_js_gn`(`ID`,`JSDM`,`GNDM`,`CJR`,`FWDM`,`FGNDM`,`CJSJ`) values ('435778198454665224','1231','system-suggestions','1-超级管理员','1','system',NULL);
insert  into `sys_js_gn`(`ID`,`JSDM`,`GNDM`,`CJR`,`FWDM`,`FGNDM`,`CJSJ`) values ('435778198454665225','1231','system-notice','1-超级管理员','1','system',NULL);
insert  into `sys_js_gn`(`ID`,`JSDM`,`GNDM`,`CJR`,`FWDM`,`FGNDM`,`CJSJ`) values ('435778198454665226','1231','system-propelling','1-超级管理员','1','system',NULL);
insert  into `sys_js_gn`(`ID`,`JSDM`,`GNDM`,`CJR`,`FWDM`,`FGNDM`,`CJSJ`) values ('435778198454665227','1231','system-advertising','1-超级管理员','1','system',NULL);
insert  into `sys_js_gn`(`ID`,`JSDM`,`GNDM`,`CJR`,`FWDM`,`FGNDM`,`CJSJ`) values ('435908246457286656','1221','system-role','1-超级管理员','1','system',NULL);
insert  into `sys_js_gn`(`ID`,`JSDM`,`GNDM`,`CJR`,`FWDM`,`FGNDM`,`CJSJ`) values ('435908246457286657','1221','system','1-超级管理员','1','',NULL);
insert  into `sys_js_gn`(`ID`,`JSDM`,`GNDM`,`CJR`,`FWDM`,`FGNDM`,`CJSJ`) values ('435908246457286658','1221','system-user','1-超级管理员','1','system',NULL);
insert  into `sys_js_gn`(`ID`,`JSDM`,`GNDM`,`CJR`,`FWDM`,`FGNDM`,`CJSJ`) values ('435908246457286659','1221','system-framework','1-超级管理员','1','system',NULL);
insert  into `sys_js_gn`(`ID`,`JSDM`,`GNDM`,`CJR`,`FWDM`,`FGNDM`,`CJSJ`) values ('435908246457286660','1221','system-dictionary','1-超级管理员','1','system',NULL);
insert  into `sys_js_gn`(`ID`,`JSDM`,`GNDM`,`CJR`,`FWDM`,`FGNDM`,`CJSJ`) values ('435908246457286661','1221','system-ITSM','1-超级管理员','1','system',NULL);
insert  into `sys_js_gn`(`ID`,`JSDM`,`GNDM`,`CJR`,`FWDM`,`FGNDM`,`CJSJ`) values ('435908246457286662','1221','system-function','1-超级管理员','1','system',NULL);
insert  into `sys_js_gn`(`ID`,`JSDM`,`GNDM`,`CJR`,`FWDM`,`FGNDM`,`CJSJ`) values ('435908246457286663','1221','system-daily','1-超级管理员','1','system',NULL);
insert  into `sys_js_gn`(`ID`,`JSDM`,`GNDM`,`CJR`,`FWDM`,`FGNDM`,`CJSJ`) values ('435908246457286664','1221','system-suggestions','1-超级管理员','1','system',NULL);
insert  into `sys_js_gn`(`ID`,`JSDM`,`GNDM`,`CJR`,`FWDM`,`FGNDM`,`CJSJ`) values ('435908246457286665','1221','system-notice','1-超级管理员','1','system',NULL);
insert  into `sys_js_gn`(`ID`,`JSDM`,`GNDM`,`CJR`,`FWDM`,`FGNDM`,`CJSJ`) values ('435908246457286666','1221','system-propelling','1-超级管理员','1','system',NULL);
insert  into `sys_js_gn`(`ID`,`JSDM`,`GNDM`,`CJR`,`FWDM`,`FGNDM`,`CJSJ`) values ('435908246457286667','1221','system-advertising','1-超级管理员','1','system',NULL);
insert  into `sys_js_gn`(`ID`,`JSDM`,`GNDM`,`CJR`,`FWDM`,`FGNDM`,`CJSJ`) values ('436255386190741504','1212','system-role','1-超级管理员','1','system',NULL);
insert  into `sys_js_gn`(`ID`,`JSDM`,`GNDM`,`CJR`,`FWDM`,`FGNDM`,`CJSJ`) values ('436255386190741505','1212','system','1-超级管理员','1','',NULL);
insert  into `sys_js_gn`(`ID`,`JSDM`,`GNDM`,`CJR`,`FWDM`,`FGNDM`,`CJSJ`) values ('436255386190741506','1212','system-user','1-超级管理员','1','system',NULL);
insert  into `sys_js_gn`(`ID`,`JSDM`,`GNDM`,`CJR`,`FWDM`,`FGNDM`,`CJSJ`) values ('436255386190741507','1212','system-framework','1-超级管理员','1','system',NULL);
insert  into `sys_js_gn`(`ID`,`JSDM`,`GNDM`,`CJR`,`FWDM`,`FGNDM`,`CJSJ`) values ('436255386190741508','1212','system-dictionary','1-超级管理员','1','system',NULL);
insert  into `sys_js_gn`(`ID`,`JSDM`,`GNDM`,`CJR`,`FWDM`,`FGNDM`,`CJSJ`) values ('436255386190741509','1212','system-ITSM','1-超级管理员','1','system',NULL);
insert  into `sys_js_gn`(`ID`,`JSDM`,`GNDM`,`CJR`,`FWDM`,`FGNDM`,`CJSJ`) values ('436255386190741510','1212','system-function','1-超级管理员','1','system',NULL);
insert  into `sys_js_gn`(`ID`,`JSDM`,`GNDM`,`CJR`,`FWDM`,`FGNDM`,`CJSJ`) values ('436255386190741511','1212','system-daily','1-超级管理员','1','system',NULL);
insert  into `sys_js_gn`(`ID`,`JSDM`,`GNDM`,`CJR`,`FWDM`,`FGNDM`,`CJSJ`) values ('436255386190741512','1212','system-suggestions','1-超级管理员','1','system',NULL);
insert  into `sys_js_gn`(`ID`,`JSDM`,`GNDM`,`CJR`,`FWDM`,`FGNDM`,`CJSJ`) values ('436255386190741513','1212','system-notice','1-超级管理员','1','system',NULL);
insert  into `sys_js_gn`(`ID`,`JSDM`,`GNDM`,`CJR`,`FWDM`,`FGNDM`,`CJSJ`) values ('436255386190741514','1212','system-propelling','1-超级管理员','1','system',NULL);
insert  into `sys_js_gn`(`ID`,`JSDM`,`GNDM`,`CJR`,`FWDM`,`FGNDM`,`CJSJ`) values ('436255386190741515','1212','system-advertising','1-超级管理员','1','system',NULL);
insert  into `sys_js_gn`(`ID`,`JSDM`,`GNDM`,`CJR`,`FWDM`,`FGNDM`,`CJSJ`) values ('436284395796561920','12','system-role','1-超级管理员','1','system',NULL);
insert  into `sys_js_gn`(`ID`,`JSDM`,`GNDM`,`CJR`,`FWDM`,`FGNDM`,`CJSJ`) values ('436284395796561921','12','system','1-超级管理员','1','',NULL);
insert  into `sys_js_gn`(`ID`,`JSDM`,`GNDM`,`CJR`,`FWDM`,`FGNDM`,`CJSJ`) values ('436284395796561922','12','system-user','1-超级管理员','1','system',NULL);
insert  into `sys_js_gn`(`ID`,`JSDM`,`GNDM`,`CJR`,`FWDM`,`FGNDM`,`CJSJ`) values ('436284395796561923','12','system-framework','1-超级管理员','1','system',NULL);
insert  into `sys_js_gn`(`ID`,`JSDM`,`GNDM`,`CJR`,`FWDM`,`FGNDM`,`CJSJ`) values ('436284395796561924','12','system-dictionary','1-超级管理员','1','system',NULL);
insert  into `sys_js_gn`(`ID`,`JSDM`,`GNDM`,`CJR`,`FWDM`,`FGNDM`,`CJSJ`) values ('436284395796561925','12','system-ITSM','1-超级管理员','1','system',NULL);
insert  into `sys_js_gn`(`ID`,`JSDM`,`GNDM`,`CJR`,`FWDM`,`FGNDM`,`CJSJ`) values ('436284395796561926','12','system-function','1-超级管理员','1','system',NULL);
insert  into `sys_js_gn`(`ID`,`JSDM`,`GNDM`,`CJR`,`FWDM`,`FGNDM`,`CJSJ`) values ('436284395796561927','12','system-daily','1-超级管理员','1','system',NULL);
insert  into `sys_js_gn`(`ID`,`JSDM`,`GNDM`,`CJR`,`FWDM`,`FGNDM`,`CJSJ`) values ('436284395796561928','12','system-suggestions','1-超级管理员','1','system',NULL);
insert  into `sys_js_gn`(`ID`,`JSDM`,`GNDM`,`CJR`,`FWDM`,`FGNDM`,`CJSJ`) values ('436284395796561929','12','system-notice','1-超级管理员','1','system',NULL);
insert  into `sys_js_gn`(`ID`,`JSDM`,`GNDM`,`CJR`,`FWDM`,`FGNDM`,`CJSJ`) values ('436284395796561930','12','system-propelling','1-超级管理员','1','system',NULL);
insert  into `sys_js_gn`(`ID`,`JSDM`,`GNDM`,`CJR`,`FWDM`,`FGNDM`,`CJSJ`) values ('436284395796561931','12','system-advertising','1-超级管理员','1','system',NULL);
insert  into `sys_js_gn`(`ID`,`JSDM`,`GNDM`,`CJR`,`FWDM`,`FGNDM`,`CJSJ`) values ('436288327990116352','23123','system-role','1-超级管理员','1','system',NULL);
insert  into `sys_js_gn`(`ID`,`JSDM`,`GNDM`,`CJR`,`FWDM`,`FGNDM`,`CJSJ`) values ('436288327990116353','23123','system','1-超级管理员','1','',NULL);
insert  into `sys_js_gn`(`ID`,`JSDM`,`GNDM`,`CJR`,`FWDM`,`FGNDM`,`CJSJ`) values ('436288327990116354','23123','system-user','1-超级管理员','1','system',NULL);
insert  into `sys_js_gn`(`ID`,`JSDM`,`GNDM`,`CJR`,`FWDM`,`FGNDM`,`CJSJ`) values ('436288327990116355','23123','system-framework','1-超级管理员','1','system',NULL);
insert  into `sys_js_gn`(`ID`,`JSDM`,`GNDM`,`CJR`,`FWDM`,`FGNDM`,`CJSJ`) values ('436288327990116356','23123','system-dictionary','1-超级管理员','1','system',NULL);
insert  into `sys_js_gn`(`ID`,`JSDM`,`GNDM`,`CJR`,`FWDM`,`FGNDM`,`CJSJ`) values ('436288327990116357','23123','system-ITSM','1-超级管理员','1','system',NULL);
insert  into `sys_js_gn`(`ID`,`JSDM`,`GNDM`,`CJR`,`FWDM`,`FGNDM`,`CJSJ`) values ('436288327990116358','23123','system-function','1-超级管理员','1','system',NULL);
insert  into `sys_js_gn`(`ID`,`JSDM`,`GNDM`,`CJR`,`FWDM`,`FGNDM`,`CJSJ`) values ('436288327990116359','23123','system-daily','1-超级管理员','1','system',NULL);
insert  into `sys_js_gn`(`ID`,`JSDM`,`GNDM`,`CJR`,`FWDM`,`FGNDM`,`CJSJ`) values ('436288327990116360','23123','system-suggestions','1-超级管理员','1','system',NULL);
insert  into `sys_js_gn`(`ID`,`JSDM`,`GNDM`,`CJR`,`FWDM`,`FGNDM`,`CJSJ`) values ('436288327990116361','23123','system-notice','1-超级管理员','1','system',NULL);
insert  into `sys_js_gn`(`ID`,`JSDM`,`GNDM`,`CJR`,`FWDM`,`FGNDM`,`CJSJ`) values ('436288327990116362','23123','system-propelling','1-超级管理员','1','system',NULL);
insert  into `sys_js_gn`(`ID`,`JSDM`,`GNDM`,`CJR`,`FWDM`,`FGNDM`,`CJSJ`) values ('436288327990116363','23123','system-advertising','1-超级管理员','1','system',NULL);
insert  into `sys_js_gn`(`ID`,`JSDM`,`GNDM`,`CJR`,`FWDM`,`FGNDM`,`CJSJ`) values ('436463544385404928','0000','system-role','1-超级管理员','1','system',NULL);
insert  into `sys_js_gn`(`ID`,`JSDM`,`GNDM`,`CJR`,`FWDM`,`FGNDM`,`CJSJ`) values ('436463544385404929','0000','system-framework','1-超级管理员','1','system',NULL);
insert  into `sys_js_gn`(`ID`,`JSDM`,`GNDM`,`CJR`,`FWDM`,`FGNDM`,`CJSJ`) values ('436463544385404930','0000','system-dictionary','1-超级管理员','1','system',NULL);
insert  into `sys_js_gn`(`ID`,`JSDM`,`GNDM`,`CJR`,`FWDM`,`FGNDM`,`CJSJ`) values ('436463544385404931','0000','system-ITSM','1-超级管理员','1','system',NULL);
insert  into `sys_js_gn`(`ID`,`JSDM`,`GNDM`,`CJR`,`FWDM`,`FGNDM`,`CJSJ`) values ('436463544385404932','0000','system-function','1-超级管理员','1','system',NULL);
insert  into `sys_js_gn`(`ID`,`JSDM`,`GNDM`,`CJR`,`FWDM`,`FGNDM`,`CJSJ`) values ('436463544385404933','0000','system-suggestions','1-超级管理员','1','system',NULL);
insert  into `sys_js_gn`(`ID`,`JSDM`,`GNDM`,`CJR`,`FWDM`,`FGNDM`,`CJSJ`) values ('436463544385404934','0000','system-notice','1-超级管理员','1','system',NULL);
insert  into `sys_js_gn`(`ID`,`JSDM`,`GNDM`,`CJR`,`FWDM`,`FGNDM`,`CJSJ`) values ('436463544385404935','0000','system-propelling','1-超级管理员','1','system',NULL);
insert  into `sys_js_gn`(`ID`,`JSDM`,`GNDM`,`CJR`,`FWDM`,`FGNDM`,`CJSJ`) values ('436463544385404936','0000','system-advertising','1-超级管理员','1','system',NULL);
insert  into `sys_js_gn`(`ID`,`JSDM`,`GNDM`,`CJR`,`FWDM`,`FGNDM`,`CJSJ`) values ('436471966480728064','111222','system-role','1-超级管理员','1','system',NULL);
insert  into `sys_js_gn`(`ID`,`JSDM`,`GNDM`,`CJR`,`FWDM`,`FGNDM`,`CJSJ`) values ('436471966480728065','111222','system','1-超级管理员','1','',NULL);
insert  into `sys_js_gn`(`ID`,`JSDM`,`GNDM`,`CJR`,`FWDM`,`FGNDM`,`CJSJ`) values ('436471966480728066','111222','system-user','1-超级管理员','1','system',NULL);
insert  into `sys_js_gn`(`ID`,`JSDM`,`GNDM`,`CJR`,`FWDM`,`FGNDM`,`CJSJ`) values ('436471966480728067','111222','system-framework','1-超级管理员','1','system',NULL);
insert  into `sys_js_gn`(`ID`,`JSDM`,`GNDM`,`CJR`,`FWDM`,`FGNDM`,`CJSJ`) values ('436471966480728068','111222','system-dictionary','1-超级管理员','1','system',NULL);
insert  into `sys_js_gn`(`ID`,`JSDM`,`GNDM`,`CJR`,`FWDM`,`FGNDM`,`CJSJ`) values ('436471966480728069','111222','system-ITSM','1-超级管理员','1','system',NULL);
insert  into `sys_js_gn`(`ID`,`JSDM`,`GNDM`,`CJR`,`FWDM`,`FGNDM`,`CJSJ`) values ('436471966480728070','111222','system-function','1-超级管理员','1','system',NULL);
insert  into `sys_js_gn`(`ID`,`JSDM`,`GNDM`,`CJR`,`FWDM`,`FGNDM`,`CJSJ`) values ('436471966480728071','111222','system-daily','1-超级管理员','1','system',NULL);
insert  into `sys_js_gn`(`ID`,`JSDM`,`GNDM`,`CJR`,`FWDM`,`FGNDM`,`CJSJ`) values ('436471966480728072','111222','system-suggestions','1-超级管理员','1','system',NULL);
insert  into `sys_js_gn`(`ID`,`JSDM`,`GNDM`,`CJR`,`FWDM`,`FGNDM`,`CJSJ`) values ('436471966480728073','111222','system-notice','1-超级管理员','1','system',NULL);
insert  into `sys_js_gn`(`ID`,`JSDM`,`GNDM`,`CJR`,`FWDM`,`FGNDM`,`CJSJ`) values ('436471966480728074','111222','system-propelling','1-超级管理员','1','system',NULL);
insert  into `sys_js_gn`(`ID`,`JSDM`,`GNDM`,`CJR`,`FWDM`,`FGNDM`,`CJSJ`) values ('436471966480728075','111222','system-advertising','1-超级管理员','1','system',NULL);
insert  into `sys_js_gn`(`ID`,`JSDM`,`GNDM`,`CJR`,`FWDM`,`FGNDM`,`CJSJ`) values ('439154967182311424','asdgrgftnA','system-role','438108538678542336-测试001','1','system',NULL);
insert  into `sys_js_gn`(`ID`,`JSDM`,`GNDM`,`CJR`,`FWDM`,`FGNDM`,`CJSJ`) values ('439154967182311425','asdgrgftnA','system','438108538678542336-测试001','1','',NULL);
insert  into `sys_js_gn`(`ID`,`JSDM`,`GNDM`,`CJR`,`FWDM`,`FGNDM`,`CJSJ`) values ('439154967182311426','asdgrgftnA','system-user','438108538678542336-测试001','1','system',NULL);
insert  into `sys_js_gn`(`ID`,`JSDM`,`GNDM`,`CJR`,`FWDM`,`FGNDM`,`CJSJ`) values ('439154967182311427','asdgrgftnA','system-framework','438108538678542336-测试001','1','system',NULL);
insert  into `sys_js_gn`(`ID`,`JSDM`,`GNDM`,`CJR`,`FWDM`,`FGNDM`,`CJSJ`) values ('439154967182311428','asdgrgftnA','system-dictionary','438108538678542336-测试001','1','system',NULL);
insert  into `sys_js_gn`(`ID`,`JSDM`,`GNDM`,`CJR`,`FWDM`,`FGNDM`,`CJSJ`) values ('439154967182311429','asdgrgftnA','system-ITSM','438108538678542336-测试001','1','system',NULL);
insert  into `sys_js_gn`(`ID`,`JSDM`,`GNDM`,`CJR`,`FWDM`,`FGNDM`,`CJSJ`) values ('439154967182311430','asdgrgftnA','system-function','438108538678542336-测试001','1','system',NULL);
insert  into `sys_js_gn`(`ID`,`JSDM`,`GNDM`,`CJR`,`FWDM`,`FGNDM`,`CJSJ`) values ('439154967182311431','asdgrgftnA','system-daily','438108538678542336-测试001','1','system',NULL);
insert  into `sys_js_gn`(`ID`,`JSDM`,`GNDM`,`CJR`,`FWDM`,`FGNDM`,`CJSJ`) values ('439154967182311432','asdgrgftnA','system-suggestions','438108538678542336-测试001','1','system',NULL);
insert  into `sys_js_gn`(`ID`,`JSDM`,`GNDM`,`CJR`,`FWDM`,`FGNDM`,`CJSJ`) values ('439154967182311433','asdgrgftnA','system-notice','438108538678542336-测试001','1','system',NULL);
insert  into `sys_js_gn`(`ID`,`JSDM`,`GNDM`,`CJR`,`FWDM`,`FGNDM`,`CJSJ`) values ('439154967182311434','asdgrgftnA','system-propelling','438108538678542336-测试001','1','system',NULL);
insert  into `sys_js_gn`(`ID`,`JSDM`,`GNDM`,`CJR`,`FWDM`,`FGNDM`,`CJSJ`) values ('439154967182311435','asdgrgftnA','system-advertising','438108538678542336-测试001','1','system',NULL);
insert  into `sys_js_gn`(`ID`,`JSDM`,`GNDM`,`CJR`,`FWDM`,`FGNDM`,`CJSJ`) values ('443003324254388231','10012','system-role','1-超级管理员','1','system',NULL);
insert  into `sys_js_gn`(`ID`,`JSDM`,`GNDM`,`CJR`,`FWDM`,`FGNDM`,`CJSJ`) values ('443003324254388232','10012','system','1-超级管理员','1','',NULL);
insert  into `sys_js_gn`(`ID`,`JSDM`,`GNDM`,`CJR`,`FWDM`,`FGNDM`,`CJSJ`) values ('443003324254388233','10012','system-user','1-超级管理员','1','system',NULL);
insert  into `sys_js_gn`(`ID`,`JSDM`,`GNDM`,`CJR`,`FWDM`,`FGNDM`,`CJSJ`) values ('443003324254388234','10012','system-framework','1-超级管理员','1','system',NULL);
insert  into `sys_js_gn`(`ID`,`JSDM`,`GNDM`,`CJR`,`FWDM`,`FGNDM`,`CJSJ`) values ('443003324254388239','10012','system-dictionary','1-超级管理员','1','system',NULL);
insert  into `sys_js_gn`(`ID`,`JSDM`,`GNDM`,`CJR`,`FWDM`,`FGNDM`,`CJSJ`) values ('443003324254388240','10012','system-ITSM','1-超级管理员','1','system',NULL);
insert  into `sys_js_gn`(`ID`,`JSDM`,`GNDM`,`CJR`,`FWDM`,`FGNDM`,`CJSJ`) values ('443003324254388241','10012','system-function','1-超级管理员','1','system',NULL);
insert  into `sys_js_gn`(`ID`,`JSDM`,`GNDM`,`CJR`,`FWDM`,`FGNDM`,`CJSJ`) values ('443003324254388242','10012','system-daily','1-超级管理员','1','system',NULL);
insert  into `sys_js_gn`(`ID`,`JSDM`,`GNDM`,`CJR`,`FWDM`,`FGNDM`,`CJSJ`) values ('443003324254388243','10012','system-suggestions','1-超级管理员','1','system',NULL);
insert  into `sys_js_gn`(`ID`,`JSDM`,`GNDM`,`CJR`,`FWDM`,`FGNDM`,`CJSJ`) values ('443003324254388244','10012','system-notice','1-超级管理员','1','system',NULL);
insert  into `sys_js_gn`(`ID`,`JSDM`,`GNDM`,`CJR`,`FWDM`,`FGNDM`,`CJSJ`) values ('443003324254388245','10012','system-propelling','1-超级管理员','1','system',NULL);
insert  into `sys_js_gn`(`ID`,`JSDM`,`GNDM`,`CJR`,`FWDM`,`FGNDM`,`CJSJ`) values ('443003324254388246','10012','system-advertising','1-超级管理员','1','system',NULL);
insert  into `sys_js_gn`(`ID`,`JSDM`,`GNDM`,`CJR`,`FWDM`,`FGNDM`,`CJSJ`) values ('446324848294100992','123','system','1-超级管理员','1','','2018-05-16 14:55:36');
insert  into `sys_js_gn`(`ID`,`JSDM`,`GNDM`,`CJR`,`FWDM`,`FGNDM`,`CJSJ`) values ('446324848294100993','123','system-daily','1-超级管理员','1','system','2018-05-16 14:55:36');
insert  into `sys_js_gn`(`ID`,`JSDM`,`GNDM`,`CJR`,`FWDM`,`FGNDM`,`CJSJ`) values ('446324848294100994','123','system-dictionary','1-超级管理员','1','system','2018-05-16 14:55:36');
insert  into `sys_js_gn`(`ID`,`JSDM`,`GNDM`,`CJR`,`FWDM`,`FGNDM`,`CJSJ`) values ('446324848294100995','123','system-framework','1-超级管理员','1','system','2018-05-16 14:55:36');
insert  into `sys_js_gn`(`ID`,`JSDM`,`GNDM`,`CJR`,`FWDM`,`FGNDM`,`CJSJ`) values ('446324848294100996','123','system-function','1-超级管理员','1','system','2018-05-16 14:55:36');
insert  into `sys_js_gn`(`ID`,`JSDM`,`GNDM`,`CJR`,`FWDM`,`FGNDM`,`CJSJ`) values ('446324848294100997','123','system-ITSM','1-超级管理员','1','system','2018-05-16 14:55:36');
insert  into `sys_js_gn`(`ID`,`JSDM`,`GNDM`,`CJR`,`FWDM`,`FGNDM`,`CJSJ`) values ('446324848294100998','123','system-role','1-超级管理员','1','system','2018-05-16 14:55:36');
insert  into `sys_js_gn`(`ID`,`JSDM`,`GNDM`,`CJR`,`FWDM`,`FGNDM`,`CJSJ`) values ('446324848294100999','123','system-user','1-超级管理员','1','system','2018-05-16 14:55:36');
insert  into `sys_js_gn`(`ID`,`JSDM`,`GNDM`,`CJR`,`FWDM`,`FGNDM`,`CJSJ`) values ('446704031985827840','000000','system','1-超级管理员','1','','2018-05-17 16:02:20');
insert  into `sys_js_gn`(`ID`,`JSDM`,`GNDM`,`CJR`,`FWDM`,`FGNDM`,`CJSJ`) values ('446704031985827841','000000','system-daily','1-超级管理员','1','system','2018-05-17 16:02:20');
insert  into `sys_js_gn`(`ID`,`JSDM`,`GNDM`,`CJR`,`FWDM`,`FGNDM`,`CJSJ`) values ('446704031985827842','000000','system-dictionary','1-超级管理员','1','system','2018-05-17 16:02:20');
insert  into `sys_js_gn`(`ID`,`JSDM`,`GNDM`,`CJR`,`FWDM`,`FGNDM`,`CJSJ`) values ('446704031985827843','000000','system-framework','1-超级管理员','1','system','2018-05-17 16:02:20');
insert  into `sys_js_gn`(`ID`,`JSDM`,`GNDM`,`CJR`,`FWDM`,`FGNDM`,`CJSJ`) values ('446704031985827844','000000','system-function','1-超级管理员','1','system','2018-05-17 16:02:20');
insert  into `sys_js_gn`(`ID`,`JSDM`,`GNDM`,`CJR`,`FWDM`,`FGNDM`,`CJSJ`) values ('446704031985827845','000000','system-ITSM','1-超级管理员','1','system','2018-05-17 16:02:20');
insert  into `sys_js_gn`(`ID`,`JSDM`,`GNDM`,`CJR`,`FWDM`,`FGNDM`,`CJSJ`) values ('446704031985827846','000000','system-role','1-超级管理员','1','system','2018-05-17 16:02:20');
insert  into `sys_js_gn`(`ID`,`JSDM`,`GNDM`,`CJR`,`FWDM`,`FGNDM`,`CJSJ`) values ('446704031985827847','000000','system-user','1-超级管理员','1','system','2018-05-17 16:02:20');
insert  into `sys_js_gn`(`ID`,`JSDM`,`GNDM`,`CJR`,`FWDM`,`FGNDM`,`CJSJ`) values ('446704031985827848','000000','vehbaoxian','1-超级管理员','1',NULL,'2018-05-17 16:02:20');
insert  into `sys_js_gn`(`ID`,`JSDM`,`GNDM`,`CJR`,`FWDM`,`FGNDM`,`CJSJ`) values ('446704031985827849','000000','vehbaoxian-baoyang','1-超级管理员','1','vehbaoxian','2018-05-17 16:02:20');
insert  into `sys_js_gn`(`ID`,`JSDM`,`GNDM`,`CJR`,`FWDM`,`FGNDM`,`CJSJ`) values ('446704031985827850','000000','vehbaoxian-weixiu','1-超级管理员','1','vehbaoxian','2018-05-17 16:02:20');
insert  into `sys_js_gn`(`ID`,`JSDM`,`GNDM`,`CJR`,`FWDM`,`FGNDM`,`CJSJ`) values ('446704031985827851','000000','vehbaoxian-youka','1-超级管理员','1','vehbaoxian','2018-05-17 16:02:20');
insert  into `sys_js_gn`(`ID`,`JSDM`,`GNDM`,`CJR`,`FWDM`,`FGNDM`,`CJSJ`) values ('446704031985827852','000000','vehbaoxian-youliao','1-超级管理员','1','vehbaoxian','2018-05-17 16:02:20');
insert  into `sys_js_gn`(`ID`,`JSDM`,`GNDM`,`CJR`,`FWDM`,`FGNDM`,`CJSJ`) values ('446704031985827853','000000','vehicle','1-超级管理员','1',NULL,'2018-05-17 16:02:20');
insert  into `sys_js_gn`(`ID`,`JSDM`,`GNDM`,`CJR`,`FWDM`,`FGNDM`,`CJSJ`) values ('446704031985827854','000000','vehicle-baoxian','1-超级管理员','1','vehicle','2018-05-17 16:02:20');
insert  into `sys_js_gn`(`ID`,`JSDM`,`GNDM`,`CJR`,`FWDM`,`FGNDM`,`CJSJ`) values ('446704031985827855','000000','vehicle-mgr','1-超级管理员','1','vehicle','2018-05-17 16:02:20');
insert  into `sys_js_gn`(`ID`,`JSDM`,`GNDM`,`CJR`,`FWDM`,`FGNDM`,`CJSJ`) values ('446704031985827856','000000','vehicle-usecar','1-超级管理员','1','vehicle','2018-05-17 16:02:20');
insert  into `sys_js_gn`(`ID`,`JSDM`,`GNDM`,`CJR`,`FWDM`,`FGNDM`,`CJSJ`) values ('446704031985827857','000000','vehicle-wfxx','1-超级管理员','1','vehicle','2018-05-17 16:02:20');

/*Table structure for table `sys_ptfw` */

CREATE TABLE `sys_ptfw` (
  `FW_ID` varchar(32) NOT NULL COMMENT '服务id',
  `FWMC` varchar(32) DEFAULT NULL COMMENT '服务名称',
  `FWDM` varchar(32) DEFAULT NULL COMMENT '服务代码',
  `CJR` varchar(64) DEFAULT NULL COMMENT '创建人',
  `XGSJ` varchar(32) DEFAULT NULL COMMENT '修改时间',
  `XGR` varchar(64) DEFAULT NULL COMMENT '修改人',
  `ZT` varchar(32) DEFAULT NULL COMMENT '状态',
  `API_QZ` varchar(64) DEFAULT NULL COMMENT 'API前缀',
  `TB` varchar(32) DEFAULT NULL COMMENT '图标',
  `CJSJ` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`FW_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='平台服务\r\nSYS_PTFW';

/*Data for the table `sys_ptfw` */

insert  into `sys_ptfw`(`FW_ID`,`FWMC`,`FWDM`,`CJR`,`XGSJ`,`XGR`,`ZT`,`API_QZ`,`TB`,`CJSJ`) values ('424961627075379200','系统服务','1','1','2018-05-16 13:02:30','1-超级管理员','00','1','11',NULL);

/*Table structure for table `sys_ptjg` */

CREATE TABLE `sys_ptjg` (
  `JGDM` varchar(20) NOT NULL COMMENT '机构代码',
  `JGMC` varchar(32) DEFAULT NULL COMMENT '机构名称',
  `JGLX` varchar(32) DEFAULT NULL COMMENT '机构类型',
  `ZT` varchar(32) DEFAULT NULL COMMENT '状态',
  `CJR` varchar(64) DEFAULT NULL COMMENT '创建人',
  `XGR` varchar(64) DEFAULT NULL COMMENT '修改人',
  `XGSJ` varchar(32) DEFAULT NULL COMMENT '修改时间',
  `GLY` varchar(32) DEFAULT NULL COMMENT '管理员',
  `GLYXM` varchar(32) DEFAULT NULL COMMENT '管理员姓名',
  `FJGDM` varchar(32) DEFAULT NULL COMMENT '父机构代码',
  `BZ` varchar(255) DEFAULT NULL COMMENT '备注',
  `JGDJ` int(11) DEFAULT '1' COMMENT '机构等级',
  `CJSJ` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`JGDM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='平台机构表\r\n\r\nSYS_PTJG';

/*Data for the table `sys_ptjg` */

insert  into `sys_ptjg`(`JGDM`,`JGMC`,`JGLX`,`ZT`,`CJR`,`XGR`,`XGSJ`,`GLY`,`GLYXM`,`FJGDM`,`BZ`,`JGDJ`,`CJSJ`) values ('100','平台','10','10','创建人','w修改人','2018-05-16 13:03:33','','t管理员姓名','','',1,NULL);
insert  into `sys_ptjg`(`JGDM`,`JGMC`,`JGLX`,`ZT`,`CJR`,`XGR`,`XGSJ`,`GLY`,`GLYXM`,`FJGDM`,`BZ`,`JGDJ`,`CJSJ`) values ('100001','天马挚友驾校','10','10','1-超级管理员',NULL,NULL,'',NULL,'100',NULL,2,'2018-05-17 08:57:48');

/*Table structure for table `sys_ptrz` */

CREATE TABLE `sys_ptrz` (
  `RZ_ID` varchar(32) NOT NULL COMMENT '日志id',
  `CZLX` varchar(32) DEFAULT NULL COMMENT '操作类型',
  `CZR` varchar(64) DEFAULT NULL COMMENT '操作人',
  `DX_ID` varchar(32) DEFAULT NULL COMMENT '对象id',
  `DXLX` varchar(32) DEFAULT NULL COMMENT '对象类型',
  `CS` varchar(1024) DEFAULT NULL COMMENT '参数',
  `JG` varchar(1112) DEFAULT NULL COMMENT '结果',
  `ZXSJ` int(11) DEFAULT NULL COMMENT '执行时间',
  `SM` varchar(32) DEFAULT NULL COMMENT '说明',
  `FF` varchar(64) DEFAULT NULL COMMENT '方法',
  `CZSJ` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`RZ_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='平台日志表';

/*Data for the table `sys_ptrz` */

insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('446328269529153536',NULL,'446327144486797312-羊祥',NULL,NULL,'{\"yhid\":\"446327144486797312\",\"zh\":\"宋玲云\",\"sjh\":\"12133131\",\"cjr\":\"\",\"cjsj\":\"2018-05-16 15:04:43\",\"xgr\":\"\",\"xgsj\":\"\",\"zt\":\"01\",\"jgdm\":\"100\",\"xm\":\"羊祥\",\"lx\":\"10\",\"xb\":\"0\",\"zjhm\":\"1313131\",\"mmyxq\":\"\",\"zw\":\"吃冰淇淋\"}','{\"code\":200,\"message\":\"操作成功\",\"success\":true}',151,NULL,'YhController.update','2018-05-16 15:09:11');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('446329077977055232',NULL,'446327144486797312-羊祥s',NULL,NULL,'{\"yhid\":\"446327144486797312\",\"zh\":\"宋玲云\",\"sjh\":\"12133131\",\"cjr\":\"\",\"cjsj\":\"2018-05-16 15:04:43\",\"xgr\":\"\",\"xgsj\":\"\",\"zt\":\"01\",\"jgdm\":\"100\",\"xm\":\"羊祥s\",\"lx\":\"10\",\"xb\":\"0\",\"zjhm\":\"1313131\",\"mmyxq\":\"\",\"zw\":\"吃冰淇淋\"}','{\"code\":200,\"message\":\"操作成功\",\"success\":true}',159,NULL,'YhController.update','2018-05-16 15:12:24');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('446597192329723904',NULL,'1-超级管理员',NULL,NULL,'{\"jgdm\":\"100001\",\"jgmc\":\"天马挚友驾校\",\"jglx\":\"10\",\"zt\":\"10\",\"cjsj\":\"2018-05-17 08:57:48\",\"cjr\":\"1-超级管理员\",\"gly\":\"\",\"fjgdm\":\"100\",\"jgdj\":2,\"children\":[],\"title\":\"天马挚友驾校\",\"level\":2}','{\"code\":200,\"message\":\"操作成功\",\"success\":true}',25,NULL,'JgController.save','2018-05-17 08:57:48');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('446598288607543296',NULL,'1-超级管理员',NULL,NULL,'{\"jgdm\":\"100002\",\"jgmc\":\"111\",\"jglx\":\"10\",\"zt\":\"10\",\"cjsj\":\"2018-05-17 09:02:09\",\"cjr\":\"1-超级管理员\",\"gly\":\"\",\"fjgdm\":\"100\",\"jgdj\":2,\"children\":[],\"title\":\"111\",\"level\":2}','{\"code\":200,\"message\":\"操作成功\",\"success\":true}',20,NULL,'JgController.save','2018-05-17 09:02:09');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('446598344081408000',NULL,'1-超级管理员',NULL,NULL,'[\"100002\"]','{\"code\":200,\"message\":\"数据删除成功！\",\"success\":true}',17,NULL,'JgController.remove','2018-05-17 09:02:22');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('446630591627001856',NULL,'1-超级管理员',NULL,NULL,'{\"lmdm\":\"ZJCX\",\"lmmc\":\"准驾车型\",\"cjsj\":\"2018-05-17 11:10:31\",\"cjr\":\"1-超级管理员\"}','{\"code\":200,\"message\":\"操作成功\",\"success\":true}',28,NULL,'ZdLmController.save','2018-05-17 11:10:31');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('446630637269417984',NULL,'1-超级管理员',NULL,NULL,'{\"zdId\":\"446630637202309120\",\"zdlmdm\":\"ZJCX\",\"zddm\":\"A1\",\"zdmc\":\"A1\",\"cjsj\":\"2018-05-17 11:10:41\",\"cjr\":\"1-超级管理员\"}','{\"code\":200,\"message\":\"操作成功\",\"success\":true}',28,NULL,'ZdxmController.save','2018-05-17 11:10:41');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('446630655883739136',NULL,'1-超级管理员',NULL,NULL,'{\"zdId\":\"446630655825018880\",\"zdlmdm\":\"ZJCX\",\"zddm\":\"A2\",\"zdmc\":\"A2\",\"cjsj\":\"2018-05-17 11:10:46\",\"cjr\":\"1-超级管理员\"}','{\"code\":200,\"message\":\"操作成功\",\"success\":true}',21,NULL,'ZdxmController.save','2018-05-17 11:10:46');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('446630673906663424',NULL,'1-超级管理员',NULL,NULL,'{\"zdId\":\"446630673847943168\",\"zdlmdm\":\"ZJCX\",\"zddm\":\"A3\",\"zdmc\":\"A3\",\"cjsj\":\"2018-05-17 11:10:50\",\"cjr\":\"1-超级管理员\"}','{\"code\":200,\"message\":\"操作成功\",\"success\":true}',21,NULL,'ZdxmController.save','2018-05-17 11:10:50');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('446630695708655616',NULL,'1-超级管理员',NULL,NULL,'{\"zdId\":\"446630695662518272\",\"zdlmdm\":\"ZJCX\",\"zddm\":\"B1\",\"zdmc\":\"B1\",\"cjsj\":\"2018-05-17 11:10:55\",\"cjr\":\"1-超级管理员\"}','{\"code\":200,\"message\":\"操作成功\",\"success\":true}',18,NULL,'ZdxmController.save','2018-05-17 11:10:55');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('446630723953098752',NULL,'1-超级管理员',NULL,NULL,'{\"zdId\":\"446630723923738624\",\"zdlmdm\":\"ZJCX\",\"zddm\":\"B2\",\"zdmc\":\"B2\",\"cjsj\":\"2018-05-17 11:11:02\",\"cjr\":\"1-超级管理员\"}','{\"code\":200,\"message\":\"操作成功\",\"success\":true}',13,NULL,'ZdxmController.save','2018-05-17 11:11:02');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('446630740952612864',NULL,'1-超级管理员',NULL,NULL,'{\"zdId\":\"446630740902281216\",\"zdlmdm\":\"ZJCX\",\"zddm\":\"B3\",\"zdmc\":\"B3\",\"cjsj\":\"2018-05-17 11:11:06\",\"cjr\":\"1-超级管理员\"}','{\"code\":200,\"message\":\"操作成功\",\"success\":true}',18,NULL,'ZdxmController.save','2018-05-17 11:11:06');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('446630756924522496',NULL,'1-超级管理员',NULL,NULL,'{\"zdId\":\"446630756886773760\",\"zdlmdm\":\"ZJCX\",\"zddm\":\"C1\",\"zdmc\":\"C1\",\"cjsj\":\"2018-05-17 11:11:10\",\"cjr\":\"1-超级管理员\"}','{\"code\":200,\"message\":\"操作成功\",\"success\":true}',16,NULL,'ZdxmController.save','2018-05-17 11:11:10');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('446630770316935168',NULL,'1-超级管理员',NULL,NULL,'{\"zdId\":\"446630770249826304\",\"zdlmdm\":\"ZJCX\",\"zddm\":\"C2\",\"zdmc\":\"C2\",\"cjsj\":\"2018-05-17 11:11:13\",\"cjr\":\"1-超级管理员\"}','{\"code\":200,\"message\":\"操作成功\",\"success\":true}',21,NULL,'ZdxmController.save','2018-05-17 11:11:13');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('446636709208129536',NULL,'1-超级管理员',NULL,NULL,'{\"zh\":\"tester\",\"mm\":\"123456\",\"sjh\":\"18602714782\",\"jgdm\":\"\",\"xm\":\"测试\",\"lx\":\"\",\"xb\":\"1\",\"zjhm\":\"\",\"zw\":\"\",\"zjhmexp\":\"\",\"zjcx\":\"\",\"rzrq\":\"\",\"jszclrq\":\"\",\"jszjzrq\":\"\"}','null',57,NULL,'YhController.save','2018-05-17 11:34:49');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('446636791689117696',NULL,'1-超级管理员',NULL,NULL,'{\"zh\":\"tester\",\"mm\":\"123456\",\"sjh\":\"18602714782\",\"jgdm\":\"\",\"xm\":\"测试\",\"lx\":\"20\",\"xb\":\"1\",\"zjhm\":\"\",\"zw\":\"\",\"zjhmexp\":\"\",\"zjcx\":\"\",\"rzrq\":\"\",\"jszclrq\":\"\",\"jszjzrq\":\"\"}','null',16421,NULL,'YhController.save','2018-05-17 11:35:09');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('446636824446631936',NULL,'1-超级管理员',NULL,NULL,'{\"zh\":\"tester\",\"mm\":\"123456\",\"sjh\":\"18602714782\",\"jgdm\":\"\",\"xm\":\"测试\",\"lx\":\"20\",\"xb\":\"1\",\"zjhm\":\"\",\"zw\":\"\",\"zjhmexp\":\"\",\"zjcx\":\"\",\"rzrq\":\"\",\"jszclrq\":\"\",\"jszjzrq\":\"\"}','null',4,NULL,'YhController.save','2018-05-17 11:35:17');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('446636855522230272',NULL,'1-超级管理员',NULL,NULL,'{\"zh\":\"tester\",\"mm\":\"123456\",\"sjh\":\"18602714782\",\"jgdm\":\"\",\"xm\":\"测试\",\"lx\":\"20\",\"xb\":\"1\",\"zjhm\":\"\",\"zw\":\"\",\"zjhmexp\":\"\",\"zjcx\":\"\",\"rzrq\":\"\",\"jszclrq\":\"\",\"jszjzrq\":\"\"}','null',5,NULL,'YhController.save','2018-05-17 11:35:24');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('446638358110666752',NULL,'1-超级管理员',NULL,NULL,'{\"yhid\":\"446638357951283200\",\"zh\":\"tester\",\"mm\":\"4DA3BB20330A34F4\",\"sjh\":\"18602714780\",\"cjsj\":\"2018-05-17 11:41:22\",\"zt\":\"01\",\"jgdm\":\"100\",\"xm\":\"管理员\",\"lx\":\"10\",\"xb\":\"1\",\"zjhm\":\"\",\"zw\":\"\",\"zjhmexp\":\"\",\"zjcx\":\"\",\"rzrq\":\"\",\"jszclrq\":\"\",\"jszjzrq\":\"\"}','{\"code\":200,\"message\":\"数据保存成功！\",\"success\":true}',54,NULL,'YhController.save','2018-05-17 11:41:22');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('446678331203518464',NULL,'446638357951283200-管理员',NULL,NULL,'{\"yhid\":\"446638357951283200\",\"zh\":\"tester\",\"sjh\":\"18602714780\",\"cjr\":\"\",\"cjsj\":\"2018-05-17 11:41:22\",\"xgr\":\"\",\"xgsj\":\"\",\"zt\":\"01\",\"jgdm\":\"100\",\"xm\":\"管理员\",\"lx\":\"20\",\"xb\":\"1\",\"zjhm\":\"\",\"mmyxq\":\"\",\"zw\":\"\",\"zjhmexp\":\"\",\"zjcx\":\"\",\"rzrq\":\"\",\"jszclrq\":\"\",\"jszjzrq\":\"\"}','{\"code\":200,\"message\":\"操作成功\",\"success\":true}',77,NULL,'YhController.update','2018-05-17 14:20:13');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('446678375977713664',NULL,'446638357951283200-管理员',NULL,NULL,'{\"yhid\":\"446638357951283200\",\"zh\":\"tester\",\"sjh\":\"18602714780\",\"cjr\":\"\",\"cjsj\":\"2018-05-17 11:41:22\",\"xgr\":\"\",\"xgsj\":\"\",\"zt\":\"01\",\"jgdm\":\"100\",\"xm\":\"管理员\",\"lx\":\"30\",\"xb\":\"1\",\"zjhm\":\"\",\"mmyxq\":\"\",\"zw\":\"\",\"zjhmexp\":\"\",\"zjcx\":\"\",\"rzrq\":\"\",\"jszclrq\":\"\",\"jszjzrq\":\"\"}','{\"code\":200,\"message\":\"操作成功\",\"success\":true}',50,NULL,'YhController.update','2018-05-17 14:20:23');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('446678691662004224',NULL,'446638357951283200-管理员',NULL,NULL,'{\"yhid\":\"446638357951283200\",\"zh\":\"tester\",\"sjh\":\"18602714780\",\"cjr\":\"\",\"cjsj\":\"2018-05-17 11:41:22\",\"xgr\":\"\",\"xgsj\":\"\",\"zt\":\"01\",\"jgdm\":\"100\",\"xm\":\"管理员\",\"lx\":\"20\",\"xb\":\"1\",\"zjhm\":\"\",\"mmyxq\":\"\",\"zw\":\"\",\"zjhmexp\":\"\",\"zjcx\":\"\",\"rzrq\":\"\",\"jszclrq\":\"\",\"jszjzrq\":\"\"}','{\"code\":200,\"message\":\"操作成功\",\"success\":true}',44,NULL,'YhController.update','2018-05-17 14:21:38');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('446679209503358976',NULL,'446638357951283200-管理员',NULL,NULL,'{\"yhid\":\"446638357951283200\",\"zh\":\"tester\",\"sjh\":\"18602714780\",\"cjr\":\"\",\"cjsj\":\"2018-05-17 11:41:22\",\"xgr\":\"\",\"xgsj\":\"\",\"zt\":\"01\",\"jgdm\":\"100\",\"xm\":\"管理员\",\"lx\":\"20\",\"xb\":\"1\",\"zjhm\":\"\",\"mmyxq\":\"\",\"zw\":\"\",\"zjhmexp\":\"\",\"zjcx\":\"\",\"rzrq\":\"\",\"jszclrq\":\"\",\"jszjzrq\":\"\"}','{\"code\":200,\"message\":\"操作成功\",\"success\":true}',20500,NULL,'YhController.update','2018-05-17 14:23:42');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('446680773471240192',NULL,'1-超级管理员',NULL,NULL,'{\"yhid\":\"446638357951283200\",\"zh\":\"tester\",\"sjh\":\"18602714780\",\"cjr\":\"\",\"cjsj\":\"2018-05-17 11:41:22\",\"xgr\":\"\",\"xgsj\":\"\",\"zt\":\"01\",\"jgdm\":\"100\",\"xm\":\"管理员\",\"lx\":\"20\",\"xb\":\"1\",\"zjhm\":\"\",\"mmyxq\":\"\",\"zw\":\"\",\"zjhmexp\":\"\",\"zjcx\":\"\",\"rzrq\":\"\",\"jszclrq\":\"\",\"jszjzrq\":\"\"}','null',120,NULL,'YhController.update','2018-05-17 14:29:55');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('446681017328074752',NULL,'446638357951283200-管理员',NULL,NULL,'{\"yhid\":\"446638357951283200\",\"zh\":\"tester\",\"sjh\":\"18602714780\",\"cjr\":\"\",\"cjsj\":\"2018-05-17 11:41:22\",\"xgr\":\"\",\"xgsj\":\"\",\"zt\":\"01\",\"jgdm\":\"100\",\"xm\":\"管理员\",\"lx\":\"20\",\"xb\":\"1\",\"zjhm\":\"420381198601060017\",\"mmyxq\":\"\",\"zw\":\"\",\"zjhmexp\":\"\",\"zjcx\":\"\",\"rzrq\":\"\",\"jszclrq\":\"\",\"jszjzrq\":\"\"}','{\"code\":200,\"message\":\"操作成功\",\"success\":true}',40,NULL,'YhController.update','2018-05-17 14:30:53');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('446681662684659712',NULL,'446638357951283200-管理员',NULL,NULL,'{\"yhid\":\"446638357951283200\",\"zh\":\"tester\",\"sjh\":\"18602714780\",\"cjr\":\"\",\"cjsj\":\"2018-05-17 11:41:22\",\"xgr\":\"\",\"xgsj\":\"\",\"zt\":\"01\",\"jgdm\":\"100\",\"xm\":\"管理员\",\"lx\":\"20\",\"xb\":\"1\",\"zjhm\":\"420381198601060017\",\"mmyxq\":\"\",\"zw\":\"\",\"zjhmexp\":\"\",\"zjcx\":\"\",\"rzrq\":\"\",\"jszclrq\":\"\",\"jszjzrq\":\"\"}','{\"code\":200,\"message\":\"操作成功\",\"success\":true}',48,NULL,'YhController.update','2018-05-17 14:33:27');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('446682483430260736',NULL,'446638357951283200-管理员',NULL,NULL,'{\"yhid\":\"446638357951283200\",\"zh\":\"tester\",\"sjh\":\"18602714780\",\"cjr\":\"\",\"cjsj\":\"2018-05-17 11:41:22\",\"xgr\":\"\",\"xgsj\":\"\",\"zt\":\"01\",\"jgdm\":\"100\",\"xm\":\"管理员\",\"lx\":\"20\",\"xb\":\"1\",\"zjhm\":\"420381198601060017\",\"mmyxq\":\"\",\"zw\":\"\",\"zjhmexp\":\"\",\"zjcx\":\"\",\"rzrq\":\"\",\"jszclrq\":\"\",\"jszjzrq\":\"\"}','{\"code\":200,\"message\":\"操作成功\",\"success\":true}',13604,NULL,'YhController.update','2018-05-17 14:36:43');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('446682758782124032',NULL,'446638357951283200-管理员',NULL,NULL,'{\"yhid\":\"446638357951283200\",\"zh\":\"tester\",\"sjh\":\"18602714780\",\"cjr\":\"\",\"cjsj\":\"2018-05-17 11:41:22\",\"xgr\":\"\",\"xgsj\":\"\",\"zt\":\"01\",\"jgdm\":\"100\",\"xm\":\"管理员\",\"lx\":\"20\",\"xb\":\"1\",\"zjhm\":\"420381198601060017\",\"mmyxq\":\"\",\"zw\":\"\",\"zjhmexp\":\"\",\"zjcx\":\"\",\"rzrq\":\"\",\"jszclrq\":\"\",\"jszjzrq\":\"\"}','{\"code\":200,\"message\":\"操作成功\",\"success\":true}',3138,NULL,'YhController.update','2018-05-17 14:37:48');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('446683384849104896',NULL,'446638357951283200-管理员',NULL,NULL,'{\"yhid\":\"446638357951283200\",\"zh\":\"tester\",\"sjh\":\"18602714780\",\"cjr\":\"\",\"cjsj\":\"2018-05-17 11:41:22\",\"xgr\":\"\",\"xgsj\":\"\",\"zt\":\"01\",\"jgdm\":\"100\",\"xm\":\"管理员\",\"lx\":\"20\",\"xb\":\"1\",\"zjhm\":\"420381198601060017\",\"mmyxq\":\"\",\"zw\":\"\",\"zjhmexp\":\"\",\"zjcx\":\"\",\"rzrq\":\"\",\"jszclrq\":\"\",\"jszjzrq\":\"\"}','{\"code\":200,\"message\":\"操作成功\",\"success\":true}',3172,NULL,'YhController.update','2018-05-17 14:40:17');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('446683558539427840',NULL,'1-超级管理员',NULL,NULL,'{\"yhid\":\"446638357951283200\",\"zh\":\"tester\",\"sjh\":\"18602714780\",\"cjr\":\"\",\"cjsj\":\"2018-05-17 11:41:22\",\"xgr\":\"\",\"xgsj\":\"\",\"zt\":\"01\",\"jgdm\":\"100\",\"xm\":\"管理员\",\"lx\":\"20\",\"xb\":\"1\",\"zjhm\":\"420381198601060017\",\"mmyxq\":\"\",\"zw\":\"\",\"zjhmexp\":\"\",\"zjcx\":\"\",\"rzrq\":\"\",\"jszclrq\":\"2018-05-16T16:00:00.000Z\",\"jszjzrq\":\"\"}','null',14,NULL,'YhController.update','2018-05-17 14:40:59');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('446683606039920640',NULL,'1-超级管理员',NULL,NULL,'{\"yhid\":\"446638357951283200\",\"zh\":\"tester\",\"sjh\":\"18602714780\",\"cjr\":\"\",\"cjsj\":\"2018-05-17 11:41:22\",\"xgr\":\"\",\"xgsj\":\"\",\"zt\":\"01\",\"jgdm\":\"100\",\"xm\":\"管理员\",\"lx\":\"20\",\"xb\":\"1\",\"zjhm\":\"420381198601060017\",\"mmyxq\":\"\",\"zw\":\"\",\"zjhmexp\":\"\",\"zjcx\":\"\",\"rzrq\":\"\",\"jszclrq\":\"2018-05-16T16:00:00.000Z\",\"jszjzrq\":\"\"}','null',9,NULL,'YhController.update','2018-05-17 14:41:10');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('446683799573495808',NULL,'1-超级管理员',NULL,NULL,'{\"yhid\":\"446638357951283200\",\"zh\":\"tester\",\"sjh\":\"18602714780\",\"cjr\":\"\",\"cjsj\":\"2018-05-17 11:41:22\",\"xgr\":\"\",\"xgsj\":\"\",\"zt\":\"01\",\"jgdm\":\"100\",\"xm\":\"管理员\",\"lx\":\"20\",\"xb\":\"1\",\"zjhm\":\"420381198601060017\",\"mmyxq\":\"\",\"zw\":\"\",\"zjhmexp\":\"\",\"zjcx\":\"A3\",\"rzrq\":\"\",\"jszclrq\":\"2018-05-16T16:00:00.000Z\",\"jszjzrq\":\"\"}','null',17185,NULL,'YhController.update','2018-05-17 14:41:56');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('446685177767264256',NULL,'1-超级管理员',NULL,NULL,'{\"yhid\":\"446638357951283200\",\"zh\":\"tester\",\"sjh\":\"18602714780\",\"cjr\":\"\",\"cjsj\":\"2018-05-17 11:41:22\",\"xgr\":\"\",\"xgsj\":\"\",\"zt\":\"01\",\"jgdm\":\"100\",\"xm\":\"管理员\",\"lx\":\"20\",\"xb\":\"1\",\"zjhm\":\"420381198601060017\",\"mmyxq\":\"\",\"zw\":\"\",\"zjhmexp\":\"\",\"zjcx\":\"\",\"rzrq\":\"\",\"jszclrq\":\"2018-05-24T16:00:00.000Z\",\"jszjzrq\":\"\"}','null',10,NULL,'YhController.update','2018-05-17 14:47:25');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('446685421997391872',NULL,'1-超级管理员',NULL,NULL,'{\"yhid\":\"446638357951283200\",\"zh\":\"tester\",\"sjh\":\"18602714780\",\"cjr\":\"\",\"cjsj\":\"2018-05-17 11:41:22\",\"xgr\":\"\",\"xgsj\":\"\",\"zt\":\"01\",\"jgdm\":\"100\",\"xm\":\"管理员\",\"lx\":\"20\",\"xb\":\"1\",\"zjhm\":\"420381198601060017\",\"mmyxq\":\"\",\"zw\":\"\",\"zjhmexp\":\"\",\"zjcx\":\"\",\"rzrq\":\"\",\"jszclrq\":\"2018年05月30日\",\"jszjzrq\":\"\"}','null',6,NULL,'YhController.update','2018-05-17 14:48:23');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('446686430719115264',NULL,'1-超级管理员',NULL,NULL,'{\"yhid\":\"446638357951283200\",\"zh\":\"tester\",\"sjh\":\"18602714780\",\"cjr\":\"\",\"cjsj\":\"2018-05-17 11:41:22\",\"xgr\":\"\",\"xgsj\":\"\",\"zt\":\"01\",\"jgdm\":\"100\",\"xm\":\"管理员\",\"lx\":\"20\",\"xb\":\"1\",\"zjhm\":\"420381198601060017\",\"mmyxq\":\"\",\"zw\":\"\",\"zjhmexp\":\"\",\"zjcx\":\"\",\"rzrq\":\"\",\"jszclrq\":\"2018-05-17\",\"jszjzrq\":\"\"}','null',9,NULL,'YhController.update','2018-05-17 14:52:24');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('446686462918787072',NULL,'1-超级管理员',NULL,NULL,'{\"yhid\":\"446638357951283200\",\"zh\":\"tester\",\"sjh\":\"18602714780\",\"cjr\":\"\",\"cjsj\":\"2018-05-17 11:41:22\",\"xgr\":\"\",\"xgsj\":\"\",\"zt\":\"01\",\"jgdm\":\"100\",\"xm\":\"管理员\",\"lx\":\"20\",\"xb\":\"1\",\"zjhm\":\"420381198601060017\",\"mmyxq\":\"\",\"zw\":\"\",\"zjhmexp\":\"\",\"zjcx\":\"\",\"rzrq\":\"\",\"jszclrq\":\"2018-05-17\",\"jszjzrq\":\"2018-05-23T16:00:00.000Z\"}','null',7,NULL,'YhController.update','2018-05-17 14:52:31');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('446686663918223360',NULL,'1-超级管理员',NULL,NULL,'{\"yhid\":\"446638357951283200\",\"zh\":\"tester\",\"sjh\":\"18602714780\",\"cjr\":\"\",\"cjsj\":\"2018-05-17 11:41:22\",\"xgr\":\"\",\"xgsj\":\"\",\"zt\":\"01\",\"jgdm\":\"100\",\"xm\":\"管理员\",\"lx\":\"20\",\"xb\":\"1\",\"zjhm\":\"420381198601060017\",\"mmyxq\":\"\",\"zw\":\"\",\"zjhmexp\":\"\",\"zjcx\":\"\",\"rzrq\":\"\",\"jszclrq\":\"2018-05-24\",\"jszjzrq\":\"\"}','null',6,NULL,'YhController.update','2018-05-17 14:53:19');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('446686687808978944',NULL,'1-超级管理员',NULL,NULL,'{\"yhid\":\"446638357951283200\",\"zh\":\"tester\",\"sjh\":\"18602714780\",\"cjr\":\"\",\"cjsj\":\"2018-05-17 11:41:22\",\"xgr\":\"\",\"xgsj\":\"\",\"zt\":\"01\",\"jgdm\":\"100\",\"xm\":\"管理员\",\"lx\":\"20\",\"xb\":\"1\",\"zjhm\":\"420381198601060017\",\"mmyxq\":\"\",\"zw\":\"\",\"zjhmexp\":\"\",\"zjcx\":\"\",\"rzrq\":\"\",\"jszclrq\":\"2018-05-24\",\"jszjzrq\":\"\"}','null',6,NULL,'YhController.update','2018-05-17 14:53:25');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('446686705836097536',NULL,'1-超级管理员',NULL,NULL,'{\"yhid\":\"446638357951283200\",\"zh\":\"tester\",\"sjh\":\"18602714780\",\"cjr\":\"\",\"cjsj\":\"2018-05-17 11:41:22\",\"xgr\":\"\",\"xgsj\":\"\",\"zt\":\"01\",\"jgdm\":\"100\",\"xm\":\"管理员\",\"lx\":\"20\",\"xb\":\"1\",\"zjhm\":\"420381198601060017\",\"mmyxq\":\"\",\"zw\":\"\",\"zjhmexp\":\"\",\"zjcx\":\"\",\"rzrq\":\"\",\"jszclrq\":\"2018-05-24\",\"jszjzrq\":\"\"}','null',10,NULL,'YhController.update','2018-05-17 14:53:29');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('446687423120801792',NULL,'446638357951283200-管理员',NULL,NULL,'{\"yhid\":\"446638357951283200\",\"zh\":\"tester\",\"sjh\":\"18602714780\",\"cjr\":\"\",\"cjsj\":\"2018-05-17 11:41:22\",\"xgr\":\"\",\"xgsj\":\"\",\"zt\":\"01\",\"jgdm\":\"100\",\"xm\":\"管理员\",\"lx\":\"20\",\"xb\":\"1\",\"zjhm\":\"420381198601060017\",\"mmyxq\":\"\",\"zw\":\"\",\"zjhmexp\":\"\",\"zjcx\":\"\",\"rzrq\":\"\",\"jszclrq\":\"\",\"jszjzrq\":\"2018-05-24\"}','{\"code\":200,\"message\":\"操作成功\",\"success\":true}',20,NULL,'YhController.update','2018-05-17 14:56:20');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('446687640704516096',NULL,'1-超级管理员',NULL,NULL,'{\"yhid\":\"446638357951283200\",\"zh\":\"tester\",\"sjh\":\"18602714780\",\"cjr\":\"\",\"cjsj\":\"2018-05-17 11:41:22\",\"xgr\":\"\",\"xgsj\":\"\",\"zt\":\"01\",\"jgdm\":\"100\",\"xm\":\"管理员\",\"lx\":\"20\",\"xb\":\"1\",\"zjhm\":\"420381198601060017\",\"mmyxq\":\"\",\"zw\":\"\",\"zjhmexp\":\"\",\"zjcx\":\"\",\"rzrq\":\"2018-05-01\",\"jszclrq\":\"\",\"jszjzrq\":\"2018-05-23T16:00:00.000Z\"}','null',18,NULL,'YhController.update','2018-05-17 14:57:12');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('446687799052075008',NULL,'1-超级管理员',NULL,NULL,'{\"yhid\":\"446638357951283200\",\"zh\":\"tester\",\"sjh\":\"18602714780\",\"cjr\":\"\",\"cjsj\":\"2018-05-17 11:41:22\",\"xgr\":\"\",\"xgsj\":\"\",\"zt\":\"01\",\"jgdm\":\"100\",\"xm\":\"管理员\",\"lx\":\"20\",\"xb\":\"1\",\"zjhm\":\"420381198601060017\",\"mmyxq\":\"\",\"zw\":\"\",\"zjhmexp\":\"\",\"zjcx\":\"\",\"rzrq\":\"\",\"jszclrq\":\"\",\"jszjzrq\":\"2018-05-23T16:00:00.000Z\"}','null',17,NULL,'YhController.update','2018-05-17 14:57:50');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('446688002920415232',NULL,'446638357951283200-管理员',NULL,NULL,'{\"yhid\":\"446638357951283200\",\"zh\":\"tester\",\"sjh\":\"18602714780\",\"cjr\":\"\",\"cjsj\":\"2018-05-17 11:41:22\",\"xgr\":\"\",\"xgsj\":\"\",\"zt\":\"01\",\"jgdm\":\"100\",\"xm\":\"管理员\",\"lx\":\"20\",\"xb\":\"1\",\"zjhm\":\"420381198601060017\",\"mmyxq\":\"\",\"zw\":\"\",\"zjhmexp\":\"\",\"zjcx\":\"\",\"rzrq\":\"\",\"jszclrq\":\"\",\"jszjzrq\":\"2018-05-24\"}','{\"code\":200,\"message\":\"操作成功\",\"success\":true}',27,NULL,'YhController.update','2018-05-17 14:58:38');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('446688074395549696',NULL,'446638357951283200-管理员',NULL,NULL,'{\"yhid\":\"446638357951283200\",\"zh\":\"tester\",\"sjh\":\"18602714780\",\"cjr\":\"\",\"cjsj\":\"2018-05-17 11:41:22\",\"xgr\":\"\",\"xgsj\":\"\",\"zt\":\"01\",\"jgdm\":\"100\",\"xm\":\"管理员\",\"lx\":\"20\",\"xb\":\"1\",\"zjhm\":\"420381198601060017\",\"mmyxq\":\"\",\"zw\":\"\",\"zjhmexp\":\"\",\"zjcx\":\"\",\"rzrq\":\"2018-05-01\",\"jszclrq\":\"\",\"jszjzrq\":\"2018-05-24\"}','{\"code\":200,\"message\":\"操作成功\",\"success\":true}',25,NULL,'YhController.update','2018-05-17 14:58:55');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('446688112047816704',NULL,'1-超级管理员',NULL,NULL,'{\"yhid\":\"446638357951283200\",\"zh\":\"tester\",\"sjh\":\"18602714780\",\"cjr\":\"\",\"cjsj\":\"2018-05-17 11:41:22\",\"xgr\":\"\",\"xgsj\":\"\",\"zt\":\"01\",\"jgdm\":\"100\",\"xm\":\"管理员\",\"lx\":\"20\",\"xb\":\"1\",\"zjhm\":\"420381198601060017\",\"mmyxq\":\"\",\"zw\":\"\",\"zjhmexp\":\"\",\"zjcx\":\"\",\"rzrq\":\"2018-05-01\",\"jszclrq\":\"2018-05-10\",\"jszjzrq\":\"2018-05-24\"}','null',13,NULL,'YhController.update','2018-05-17 14:59:04');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('446688236048220160',NULL,'1-超级管理员',NULL,NULL,'{\"yhid\":\"446638357951283200\",\"zh\":\"tester\",\"sjh\":\"18602714780\",\"cjr\":\"\",\"cjsj\":\"2018-05-17 11:41:22\",\"xgr\":\"\",\"xgsj\":\"\",\"zt\":\"01\",\"jgdm\":\"100\",\"xm\":\"管理员\",\"lx\":\"20\",\"xb\":\"1\",\"zjhm\":\"420381198601060017\",\"mmyxq\":\"\",\"zw\":\"\",\"zjhmexp\":\"\",\"zjcx\":\"\",\"rzrq\":\"2018-05-01\",\"jszclrq\":\"2018-05-10\",\"jszjzrq\":\"2018-05-24\"}','null',7,NULL,'YhController.update','2018-05-17 14:59:34');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('446688256801636352',NULL,'446638357951283200-管理员',NULL,NULL,'{\"yhid\":\"446638357951283200\",\"zh\":\"tester\",\"sjh\":\"18602714780\",\"cjr\":\"\",\"cjsj\":\"2018-05-17 11:41:22\",\"xgr\":\"\",\"xgsj\":\"\",\"zt\":\"01\",\"jgdm\":\"100\",\"xm\":\"管理员\",\"lx\":\"20\",\"xb\":\"1\",\"zjhm\":\"420381198601060017\",\"mmyxq\":\"\",\"zw\":\"\",\"zjhmexp\":\"\",\"zjcx\":\"C1\",\"rzrq\":\"2018-05-01\",\"jszclrq\":\"2018-05-10\",\"jszjzrq\":\"2018-05-24\"}','{\"code\":200,\"message\":\"操作成功\",\"success\":true}',21,NULL,'YhController.update','2018-05-17 14:59:39');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('446688394316087296',NULL,'446638357951283200-管理员',NULL,NULL,'{\"yhid\":\"446638357951283200\",\"zh\":\"tester\",\"sjh\":\"18602714780\",\"cjr\":\"\",\"cjsj\":\"2018-05-17 11:41:22\",\"xgr\":\"\",\"xgsj\":\"\",\"zt\":\"01\",\"jgdm\":\"100\",\"xm\":\"管理员\",\"lx\":\"20\",\"xb\":\"1\",\"zjhm\":\"420381198601060017\",\"mmyxq\":\"\",\"zw\":\"\",\"zjhmexp\":\"2000-01-01\",\"zjcx\":\"C1\",\"rzrq\":\"2018-05-01\",\"jszclrq\":\"2018-05-10\",\"jszjzrq\":\"2018-05-24\"}','{\"code\":200,\"message\":\"操作成功\",\"success\":true}',24,NULL,'YhController.update','2018-05-17 15:00:12');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('446689770047799296',NULL,'1-超级管理员',NULL,NULL,'[\"446327144486797312\"]','{\"code\":200,\"message\":\"数据删除成功！\",\"success\":true}',15,NULL,'YhController.remove','2018-05-17 15:05:40');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('446700877059719168',NULL,'1-超级管理员',NULL,NULL,'{\"gndm\":\"vehicle\",\"gnmc\":\"车辆管理\",\"fwdm\":\"1\",\"cjsj\":\"2018-05-17 15:49:48\",\"cjr\":\"1-超级管理员\",\"zt\":\"00\",\"url\":\"/\",\"tzdz\":\"/\",\"tb\":\"model-s\",\"apiQz\":\"/vehicle\",\"px\":1.0,\"title\":\"车辆管理\"}','{\"code\":200,\"message\":\"操作成功\",\"success\":true}',149,NULL,'GnController.save','2018-05-17 15:49:48');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('446701365217984512',NULL,'1-超级管理员',NULL,NULL,'{\"gndm\":\"vehicle-mgr\",\"gnmc\":\"车辆管理\",\"fwdm\":\"1\",\"cjsj\":\"2018-05-17 15:51:44\",\"cjr\":\"1-超级管理员\",\"zt\":\"00\",\"url\":\"/vehicle-mgr\",\"fjd\":\"vehicle\",\"tzdz\":\"/vehicle-mgr\",\"tb\":\"model-s\",\"apiQz\":\"/api/vehicle\",\"px\":1.0,\"title\":\"车辆管理\"}','{\"code\":200,\"message\":\"操作成功\",\"success\":true}',46,NULL,'GnController.save','2018-05-17 15:51:44');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('446701399921655808',NULL,'1-超级管理员',NULL,NULL,'{\"gndm\":\"vehicle-mgr\",\"gnmc\":\"车辆管理\",\"fwdm\":\"1\",\"cjsj\":\"2018-05-17 15:51:44\",\"cjr\":\"1-超级管理员\",\"xgsj\":\"2018-05-17 15:51:53\",\"xgr\":\"1-超级管理员\",\"zt\":\"00\",\"bz\":\"\",\"url\":\"vehicle-mgr\",\"fjd\":\"vehicle\",\"tzdz\":\"/vehicle-mgr\",\"tb\":\"model-s\",\"apiQz\":\"/api/vehicle\",\"apiHz\":\"\",\"px\":1.0,\"title\":\"车辆管理\",\"checked\":\"\"}','{\"code\":200,\"message\":\"操作成功\",\"success\":true}',38,NULL,'GnController.update','2018-05-17 15:51:53');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('446702072914509824',NULL,'1-超级管理员',NULL,NULL,'{\"gndm\":\"vehicle-baoxian\",\"gnmc\":\"保险管理\",\"fwdm\":\"1\",\"cjsj\":\"2018-05-17 15:54:33\",\"cjr\":\"1-超级管理员\",\"zt\":\"00\",\"url\":\"vehicle-baoxian\",\"fjd\":\"vehicle\",\"tzdz\":\"vehicle-baoxian\",\"tb\":\"ios-bookmarks\",\"apiQz\":\"/api/vehicle\",\"px\":2.0,\"title\":\"保险管理\"}','{\"code\":200,\"message\":\"操作成功\",\"success\":true}',38,NULL,'GnController.save','2018-05-17 15:54:33');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('446702330725793792',NULL,'1-超级管理员',NULL,NULL,'{\"gndm\":\"vehicle-wfxx\",\"gnmc\":\"违法管理\",\"fwdm\":\"1\",\"cjsj\":\"2018-05-17 15:55:34\",\"cjr\":\"1-超级管理员\",\"zt\":\"00\",\"url\":\"vehicle-wfxx\",\"fjd\":\"vehicle\",\"tzdz\":\"vehicle-wfxx\",\"tb\":\"ios\",\"apiQz\":\"/api/vehicle\",\"px\":3.0,\"title\":\"违法管理\"}','{\"code\":200,\"message\":\"操作成功\",\"success\":true}',51,NULL,'GnController.save','2018-05-17 15:55:34');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('446702594329411584',NULL,'1-超级管理员',NULL,NULL,'{\"gndm\":\"vehicle-usecar\",\"gnmc\":\"出车管理\",\"fwdm\":\"1\",\"cjsj\":\"2018-05-17 15:56:37\",\"cjr\":\"1-超级管理员\",\"zt\":\"00\",\"url\":\"vehicle-usecar\",\"tzdz\":\"vehicle-usecar\",\"tb\":\"ios\",\"apiQz\":\"/api/vehicle\",\"px\":1.0,\"title\":\"出车管理\"}','{\"code\":200,\"message\":\"操作成功\",\"success\":true}',35,NULL,'GnController.save','2018-05-17 15:56:37');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('446702615217045504',NULL,'1-超级管理员',NULL,NULL,'{\"gndm\":\"vehicle-usecar\",\"gnmc\":\"出车管理\",\"fwdm\":\"1\",\"cjsj\":\"2018-05-17 15:56:37\",\"cjr\":\"1-超级管理员\",\"xgsj\":\"2018-05-17 15:56:42\",\"xgr\":\"1-超级管理员\",\"zt\":\"00\",\"bz\":\"\",\"url\":\"vehicle-usecar\",\"tzdz\":\"vehicle-usecar\",\"tb\":\"ios\",\"apiQz\":\"/api/vehicle\",\"apiHz\":\"\",\"px\":4.0,\"title\":\"出车管理\",\"checked\":\"\"}','{\"code\":200,\"message\":\"操作成功\",\"success\":true}',29,NULL,'GnController.update','2018-05-17 15:56:42');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('446702807211311104',NULL,'1-超级管理员',NULL,NULL,'{\"gndm\":\"vehbaoxian\",\"gnmc\":\"维保管理\",\"fwdm\":\"1\",\"cjsj\":\"2018-05-17 15:57:28\",\"cjr\":\"1-超级管理员\",\"zt\":\"00\",\"url\":\"vehbaoxian\",\"tzdz\":\"vehbaoxian\",\"tb\":\"ios\",\"apiQz\":\"/\",\"px\":3.0,\"title\":\"维保管理\"}','{\"code\":200,\"message\":\"操作成功\",\"success\":true}',35,NULL,'GnController.save','2018-05-17 15:57:28');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('446702827876646912',NULL,'1-超级管理员',NULL,NULL,'{\"gndm\":\"vehicle\",\"gnmc\":\"车辆管理\",\"fwdm\":\"1\",\"cjsj\":\"2018-05-17 15:49:48\",\"cjr\":\"1-超级管理员\",\"xgsj\":\"2018-05-17 15:57:33\",\"xgr\":\"1-超级管理员\",\"zt\":\"00\",\"bz\":\"\",\"url\":\"/\",\"tzdz\":\"/\",\"tb\":\"model-s\",\"apiQz\":\"/vehicle\",\"apiHz\":\"\",\"px\":2.0,\"title\":\"车辆管理\",\"checked\":\"\"}','{\"code\":200,\"message\":\"操作成功\",\"success\":true}',33,NULL,'GnController.update','2018-05-17 15:57:33');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('446703027995279360',NULL,'1-超级管理员',NULL,NULL,'{\"gndm\":\"vehbaoxian-youka\",\"gnmc\":\"油卡管理\",\"fwdm\":\"1\",\"cjsj\":\"2018-05-17 15:58:21\",\"cjr\":\"1-超级管理员\",\"zt\":\"00\",\"url\":\"vehbaoxian-youka\",\"fjd\":\"vehbaoxian\",\"tzdz\":\"vehbaoxian-youka\",\"tb\":\"ios\",\"apiQz\":\"/api/vehbaoxian\",\"px\":1.0,\"title\":\"油卡管理\"}','{\"code\":200,\"message\":\"操作成功\",\"success\":true}',34,NULL,'GnController.save','2018-05-17 15:58:21');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('446703207696039936',NULL,'1-超级管理员',NULL,NULL,'{\"gndm\":\"vehbaoxian-youliao\",\"gnmc\":\"油料管理\",\"fwdm\":\"1\",\"cjsj\":\"2018-05-17 15:59:04\",\"cjr\":\"1-超级管理员\",\"zt\":\"00\",\"url\":\"vehbaoxian-youliao\",\"fjd\":\"vehbaoxian\",\"tzdz\":\"vehbaoxian-youliao\",\"tb\":\"ios\",\"apiQz\":\"/api/vehbaoxian\",\"px\":2.0,\"title\":\"油料管理\"}','{\"code\":200,\"message\":\"操作成功\",\"success\":true}',40,NULL,'GnController.save','2018-05-17 15:59:04');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('446703439922069504',NULL,'1-超级管理员',NULL,NULL,'{\"gndm\":\"vehbaoxian-weixiu\",\"gnmc\":\"维修管理\",\"fwdm\":\"1\",\"cjsj\":\"2018-05-17 15:59:59\",\"cjr\":\"1-超级管理员\",\"zt\":\"00\",\"url\":\"vehbaoxian-weixiu\",\"fjd\":\"vehbaoxian\",\"tzdz\":\"vehbaoxian-weixiu\",\"tb\":\"ios\",\"apiQz\":\"/api/vehbaoxian\",\"px\":1.0,\"title\":\"维修管理\"}','{\"code\":200,\"message\":\"操作成功\",\"success\":true}',33,NULL,'GnController.save','2018-05-17 15:59:59');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('446703458825797632',NULL,'1-超级管理员',NULL,NULL,'{\"gndm\":\"vehbaoxian-weixiu\",\"gnmc\":\"维修管理\",\"fwdm\":\"1\",\"cjsj\":\"2018-05-17 15:59:59\",\"cjr\":\"1-超级管理员\",\"xgsj\":\"2018-05-17 16:00:03\",\"xgr\":\"1-超级管理员\",\"zt\":\"00\",\"bz\":\"\",\"url\":\"vehbaoxian-weixiu\",\"fjd\":\"vehbaoxian\",\"tzdz\":\"vehbaoxian-weixiu\",\"tb\":\"ios\",\"apiQz\":\"/api/vehbaoxian\",\"apiHz\":\"\",\"px\":3.0,\"title\":\"维修管理\",\"checked\":\"\"}','{\"code\":200,\"message\":\"操作成功\",\"success\":true}',30,NULL,'GnController.update','2018-05-17 16:00:03');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('446703848359198720',NULL,'1-超级管理员',NULL,NULL,'{\"gndm\":\"vehbaoxian-baoyang\",\"gnmc\":\"保养管理\",\"fwdm\":\"1\",\"cjsj\":\"2018-05-17 16:01:36\",\"cjr\":\"1-超级管理员\",\"zt\":\"00\",\"url\":\"vehbaoxian-baoyang\",\"fjd\":\"vehbaoxian\",\"tzdz\":\"vehbaoxian-baoyang\",\"tb\":\"ios\",\"apiQz\":\"/api/vehbaoxian\",\"px\":4.0,\"title\":\"保养管理\"}','{\"code\":200,\"message\":\"操作成功\",\"success\":true}',33,NULL,'GnController.save','2018-05-17 16:01:36');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('446703990030204928',NULL,'1-超级管理员',NULL,NULL,'{\"gndm\":\"vehicle-usecar\",\"gnmc\":\"出车管理\",\"fwdm\":\"1\",\"cjsj\":\"2018-05-17 15:56:37\",\"cjr\":\"1-超级管理员\",\"xgsj\":\"2018-05-17 16:02:10\",\"xgr\":\"1-超级管理员\",\"zt\":\"00\",\"bz\":\"\",\"url\":\"vehicle-usecar\",\"fjd\":\"vehicle\",\"tzdz\":\"vehicle-usecar\",\"tb\":\"ios\",\"apiQz\":\"/api/vehicle\",\"apiHz\":\"\",\"px\":4.0,\"title\":\"出车管理\",\"checked\":\"\"}','{\"code\":200,\"message\":\"操作成功\",\"success\":true}',23,NULL,'GnController.update','2018-05-17 16:02:10');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('446704031520260096',NULL,'1-超级管理员',NULL,NULL,'{\"jsId\":\"000000\",\"jsmc\":\"管理员\",\"jslx\":\"00\",\"cjsj\":\"\",\"cjr\":\"1-超级管理员\",\"xgr\":\"1-超级管理员\",\"xgsj\":\"2018-05-17 16:02:20\",\"zt\":\"\",\"jgdm\":\"100\",\"sm\":\"\",\"_checked\":false}','{\"code\":200,\"message\":\"数据修改成功！\",\"success\":true}',33,NULL,'JsController.update','2018-05-17 16:02:20');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('446704518327959552',NULL,'446638357951283200-管理员',NULL,NULL,'{\"gndm\":\"vehbaoxian\",\"gnmc\":\"维保管理\",\"fwdm\":\"1\",\"cjsj\":\"2018-05-17 15:57:28\",\"cjr\":\"1-超级管理员\",\"xgsj\":\"2018-05-17 16:04:16\",\"xgr\":\"446638357951283200-管理员\",\"zt\":\"00\",\"bz\":\"\",\"url\":\"vehbaoxian\",\"tzdz\":\"vehbaoxian\",\"tb\":\"settings\",\"apiQz\":\"/\",\"apiHz\":\"\",\"px\":3.0,\"title\":\"维保管理\",\"checked\":\"\"}','{\"code\":200,\"message\":\"操作成功\",\"success\":true}',36,NULL,'GnController.update','2018-05-17 16:04:16');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('447420445730275328',NULL,'1-超级管理员',NULL,NULL,'{\"lmdm\":\"SYXZ\",\"lmmc\":\"车辆使用性质\",\"cjsj\":\"2018-05-19 15:29:06\",\"cjr\":\"1-超级管理员\"}','{\"code\":200,\"message\":\"操作成功\",\"success\":true}',74,NULL,'ZdLmController.save','2018-05-19 15:29:06');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('447420501510324224',NULL,'1-超级管理员',NULL,NULL,'{\"zdId\":\"447420501355134976\",\"zdlmdm\":\"SYXZ\",\"zddm\":\"10\",\"zdmc\":\"非营运机动车\",\"cjsj\":\"2018-05-19 15:29:20\",\"cjr\":\"1-超级管理员\"}','{\"code\":200,\"message\":\"操作成功\",\"success\":true}',68,NULL,'ZdxmController.save','2018-05-19 15:29:20');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('447420533315731456',NULL,'1-超级管理员',NULL,NULL,'{\"zdId\":\"447420533177319424\",\"zdlmdm\":\"SYXZ\",\"zddm\":\"20\",\"zdmc\":\"营运机动车\",\"cjsj\":\"2018-05-19 15:29:27\",\"cjr\":\"1-超级管理员\"}','{\"code\":200,\"message\":\"操作成功\",\"success\":true}',47,NULL,'ZdxmController.save','2018-05-19 15:29:27');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('447441975377920000',NULL,'1-超级管理员',NULL,NULL,'{\"vId\":\"447441975281451008\",\"vHphm\":\"鄂A20102\",\"vHpzl\":\"20\",\"vCcdjrq\":\"2018-05-19\",\"vSyl\":\"wcd 的\",\"vSyxz\":\"10\",\"createUser\":\"1-超级管理员\",\"createTime\":\"2018-05-19 16:54:39\"}','{\"code\":200,\"message\":\"数据保存成功！\",\"success\":true}',51,NULL,'CarCtrl.save','2018-05-19 16:54:39');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('447442004494778368',NULL,'1-超级管理员',NULL,NULL,'{\"vHphm\":\"鄂A20102\",\"vHpzl\":\"20\",\"vCcdjrq\":\"2018-05-19\",\"vSyl\":\"wcd 的\",\"vSyxz\":\"10\"}','null',7,NULL,'CarCtrl.save','2018-05-19 16:54:46');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('447442069019951104',NULL,'1-超级管理员',NULL,NULL,'{\"vHphm\":\"鄂A20102\",\"vHpzl\":\"20\",\"vCcdjrq\":\"2018-05-19\",\"vSyl\":\"wcd 的\",\"vSyxz\":\"10\"}','null',5,NULL,'CarCtrl.save','2018-05-19 16:55:02');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('447442094546485248',NULL,'1-超级管理员',NULL,NULL,'{\"vHphm\":\"鄂A20102\",\"vHpzl\":\"20\",\"vClph\":\"2\",\"vCllx\":\"2\",\"vCcdjrq\":\"2018-05-19\",\"vSyl\":\"wcd 的\",\"vSyxz\":\"10\",\"vCjh\":\"22\",\"vFdjh\":\"2\"}','null',5,NULL,'CarCtrl.save','2018-05-19 16:55:08');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('447442126498693120',NULL,'1-超级管理员',NULL,NULL,'{\"vHphm\":\"鄂A20102\",\"vHpzl\":\"20\",\"vClph\":\"5\",\"vCllx\":\"3\",\"vCcdjrq\":\"2018-05-19\",\"vSyl\":\"wcd 的\",\"vSyxz\":\"10\",\"vCjh\":\"22\",\"vFdjh\":\"1\"}','null',5,NULL,'CarCtrl.save','2018-05-19 16:55:16');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('447442468770676736',NULL,'1-超级管理员',NULL,NULL,'{\"vId\":\"447442468724539392\",\"vHphm\":\"鄂a0291w\",\"vHpzl\":\"20\",\"vCcdjrq\":\"2018-05-19\",\"vSyl\":\"请问\",\"vSyxz\":\"10\",\"createUser\":\"1-超级管理员\",\"createTime\":\"2018-05-19 16:56:37\"}','{\"code\":200,\"message\":\"数据保存成功！\",\"success\":true}',16,NULL,'CarCtrl.save','2018-05-19 16:56:37');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('447442494590812160',NULL,'1-超级管理员',NULL,NULL,'{\"vHphm\":\"鄂a0291w\",\"vHpzl\":\"20\",\"vCcdjrq\":\"2018-05-19\",\"vSyl\":\"请问\",\"vSyxz\":\"10\"}','null',9,NULL,'CarCtrl.save','2018-05-19 16:56:43');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('447442509975519232',NULL,'1-超级管理员',NULL,NULL,'{\"vId\":\"447442509933576192\",\"vHphm\":\"鄂a02911\",\"vHpzl\":\"20\",\"vCcdjrq\":\"2018-05-19\",\"vSyl\":\"请问\",\"vSyxz\":\"10\",\"createUser\":\"1-超级管理员\",\"createTime\":\"2018-05-19 16:56:47\"}','{\"code\":200,\"message\":\"数据保存成功！\",\"success\":true}',16,NULL,'CarCtrl.save','2018-05-19 16:56:47');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('447443007700992000',NULL,'1-超级管理员',NULL,NULL,'{\"vId\":\"447443007671631872\",\"vHphm\":\"鄂24544433\",\"vHpzl\":\"20\",\"vCcdjrq\":\"2018-05-19\",\"vSyxz\":\"\",\"createUser\":\"1-超级管理员\",\"createTime\":\"2018-05-19 16:58:46\"}','{\"code\":200,\"message\":\"数据保存成功！\",\"success\":true}',11,NULL,'CarCtrl.save','2018-05-19 16:58:46');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('447443024125886464',NULL,'1-超级管理员',NULL,NULL,'{\"vHphm\":\"鄂24544433\",\"vHpzl\":\"20\",\"vCcdjrq\":\"2018-05-19\",\"vSyxz\":\"\"}','null',4,NULL,'CarCtrl.save','2018-05-19 16:58:50');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('447443042383691776',NULL,'1-超级管理员',NULL,NULL,'{\"vId\":\"447443042341748736\",\"vHphm\":\"鄂24544432\",\"vHpzl\":\"20\",\"vCcdjrq\":\"2018-05-19\",\"vSyxz\":\"\",\"createUser\":\"1-超级管理员\",\"createTime\":\"2018-05-19 16:58:54\"}','{\"code\":200,\"message\":\"数据保存成功！\",\"success\":true}',14,NULL,'CarCtrl.save','2018-05-19 16:58:54');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('447443364854366208',NULL,'1-超级管理员',NULL,NULL,'{\"vId\":\"447443364816617472\",\"vHphm\":\"鄂23444444\",\"vHpzl\":\"20\",\"vCllx\":\"www\",\"vCcdjrq\":\"2018-05-19\",\"vSyl\":\"213\",\"vSyxz\":\"10\",\"createUser\":\"1-超级管理员\",\"createTime\":\"2018-05-19 17:00:11\"}','{\"code\":200,\"message\":\"数据保存成功！\",\"success\":true}',14,NULL,'CarCtrl.save','2018-05-19 17:00:11');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('447443381761605632',NULL,'1-超级管理员',NULL,NULL,'{\"vHphm\":\"鄂23444444\",\"vHpzl\":\"20\",\"vCllx\":\"www\",\"vCcdjrq\":\"2018-05-19\",\"vSyl\":\"213\",\"vSyxz\":\"10\"}','null',4,NULL,'CarCtrl.save','2018-05-19 17:00:15');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('447443403219664896',NULL,'1-超级管理员',NULL,NULL,'{\"vId\":\"447443403177721856\",\"vHphm\":\"鄂23444442\",\"vHpzl\":\"20\",\"vCllx\":\"www\",\"vCcdjrq\":\"2018-05-19\",\"vSyl\":\"213\",\"vSyxz\":\"10\",\"createUser\":\"1-超级管理员\",\"createTime\":\"2018-05-19 17:00:20\"}','{\"code\":200,\"message\":\"数据保存成功！\",\"success\":true}',14,NULL,'CarCtrl.save','2018-05-19 17:00:20');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('447443570756943872',NULL,'1-超级管理员',NULL,NULL,'{\"vId\":\"447443570715000832\",\"vHphm\":\"鄂qweweee2\",\"vHpzl\":\"20\",\"vCcdjrq\":\"2018-05-26\",\"vSyl\":\"123123\",\"vSyxz\":\"\",\"createUser\":\"1-超级管理员\",\"createTime\":\"2018-05-19 17:01:00\"}','{\"code\":200,\"message\":\"数据保存成功！\",\"success\":true}',13,NULL,'CarCtrl.save','2018-05-19 17:01:00');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('447444183095967744',NULL,'1-超级管理员',NULL,NULL,'{\"vId\":\"447444183058219008\",\"vHphm\":\"鄂03934444\",\"vHpzl\":\"20\",\"vCcdjrq\":\"2018-05-26\",\"vSyxz\":\"\",\"createUser\":\"1-超级管理员\",\"createTime\":\"2018-05-19 17:03:26\"}','{\"code\":200,\"message\":\"数据保存成功！\",\"success\":true}',16,NULL,'CarCtrl.save','2018-05-19 17:03:26');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('447444677629575168',NULL,'1-超级管理员',NULL,NULL,'{\"vId\":\"447444677604409344\",\"vHphm\":\"鄂23232321\",\"vHpzl\":\"20\",\"vCcdjrq\":\"2018-05-26\",\"vSyxz\":\"\",\"createUser\":\"1-超级管理员\",\"createTime\":\"2018-05-19 17:05:24\"}','{\"code\":200,\"message\":\"数据保存成功！\",\"success\":true}',9,NULL,'CarCtrl.save','2018-05-19 17:05:24');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('447444847012347904',NULL,'1-超级管理员',NULL,NULL,'[\"447442509933576192\"]','{\"code\":200,\"message\":\"数据删除成功！\",\"success\":true}',24,NULL,'CarCtrl.remove','2018-05-19 17:06:04');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('447444866134179840',NULL,'1-超级管理员',NULL,NULL,'[\"447442468724539392\"]','{\"code\":200,\"message\":\"数据删除成功！\",\"success\":true}',13,NULL,'CarCtrl.remove','2018-05-19 17:06:09');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('447444878062780416',NULL,'1-超级管理员',NULL,NULL,'[\"447443007671631872\"]','{\"code\":200,\"message\":\"数据删除成功！\",\"success\":true}',21,NULL,'CarCtrl.remove','2018-05-19 17:06:12');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('447444911772401664',NULL,'1-超级管理员',NULL,NULL,'[\"447443403177721856\"]','{\"code\":200,\"message\":\"数据删除成功！\",\"success\":true}',13,NULL,'CarCtrl.remove','2018-05-19 17:06:20');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('447444928029523968',NULL,'1-超级管理员',NULL,NULL,'[\"447443364816617472\"]','{\"code\":200,\"message\":\"数据删除成功！\",\"success\":true}',13,NULL,'CarCtrl.remove','2018-05-19 17:06:23');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('447444934488752128',NULL,'1-超级管理员',NULL,NULL,'[\"447443042341748736\"]','{\"code\":200,\"message\":\"数据删除成功！\",\"success\":true}',11,NULL,'CarCtrl.remove','2018-05-19 17:06:25');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('447444940423692288',NULL,'1-超级管理员',NULL,NULL,'[\"447443570715000832\"]','{\"code\":200,\"message\":\"数据删除成功！\",\"success\":true}',14,NULL,'CarCtrl.remove','2018-05-19 17:06:26');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('447444946035671040',NULL,'1-超级管理员',NULL,NULL,'[\"447444183058219008\"]','{\"code\":200,\"message\":\"数据删除成功！\",\"success\":true}',14,NULL,'CarCtrl.remove','2018-05-19 17:06:28');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('447444953421840384',NULL,'1-超级管理员',NULL,NULL,'[\"447444677604409344\"]','{\"code\":200,\"message\":\"数据删除成功！\",\"success\":true}',10,NULL,'CarCtrl.remove','2018-05-19 17:06:30');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('447445434781138944',NULL,'1-超级管理员',NULL,NULL,'{\"vHphm\":\"鄂11111111\",\"vHpzl\":\"20\",\"vCcdjrq\":\"\",\"vSyxz\":\"\"}','null',0,NULL,'CarCtrl.save','2018-05-19 17:08:24');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('447445452242026496',NULL,'1-超级管理员',NULL,NULL,'{\"vId\":\"447445452195889152\",\"vHphm\":\"鄂11111111\",\"vHpzl\":\"20\",\"vCcdjrq\":\"2018-05-19\",\"vSyxz\":\"\",\"createUser\":\"1-超级管理员\",\"createTime\":\"2018-05-19 17:08:28\"}','{\"code\":200,\"message\":\"数据保存成功！\",\"success\":true}',14,NULL,'CarCtrl.save','2018-05-19 17:08:28');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('447445741447675904',NULL,'1-超级管理员',NULL,NULL,'{\"vId\":\"447445741405732864\",\"vHphm\":\"鄂22222222\",\"vHpzl\":\"20\",\"vCcdjrq\":\"2018-05-12\",\"vSyxz\":\"\",\"createUser\":\"1-超级管理员\",\"createTime\":\"2018-05-19 17:09:37\"}','{\"code\":200,\"message\":\"数据保存成功！\",\"success\":true}',13,NULL,'CarCtrl.save','2018-05-19 17:09:37');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('447445789245964288',NULL,'1-超级管理员',NULL,NULL,'[\"447445452195889152\"]','{\"code\":200,\"message\":\"数据删除成功！\",\"success\":true}',13,NULL,'CarCtrl.remove','2018-05-19 17:09:49');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('447447156110917632',NULL,'1-超级管理员',NULL,NULL,'{\"vId\":\"447447156068974592\",\"vHphm\":\"鄂23333333\",\"vHpzl\":\"20\",\"vCcdjrq\":\"2018-05-26\",\"vSyxz\":\"\",\"createUser\":\"1-超级管理员\",\"createTime\":\"2018-05-19 17:15:15\"}','{\"code\":200,\"message\":\"数据保存成功！\",\"success\":true}',14,NULL,'CarCtrl.save','2018-05-19 17:15:15');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('447447551499567104',NULL,'1-超级管理员',NULL,NULL,'{\"vId\":\"447447551457624064\",\"vHphm\":\"鄂33443434\",\"vHpzl\":\"20\",\"vCcdjrq\":\"2018-05-26\",\"vSyxz\":\"\",\"createUser\":\"1-超级管理员\",\"createTime\":\"2018-05-19 17:16:49\"}','{\"code\":200,\"message\":\"数据保存成功！\",\"success\":true}',13,NULL,'CarCtrl.save','2018-05-19 17:16:49');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('447447629912080384',NULL,'1-超级管理员',NULL,NULL,'[\"447445741405732864\"]','{\"code\":200,\"message\":\"数据删除成功！\",\"success\":true}',18,NULL,'CarCtrl.remove','2018-05-19 17:17:08');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('447447644726362112',NULL,'1-超级管理员',NULL,NULL,'[\"447447551457624064\"]','{\"code\":200,\"message\":\"数据删除成功！\",\"success\":true}',14,NULL,'CarCtrl.remove','2018-05-19 17:17:11');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('447447697075470336',NULL,'1-超级管理员',NULL,NULL,'{\"vId\":\"447447697041915904\",\"vHphm\":\"鄂33333333\",\"vHpzl\":\"20\",\"vCcdjrq\":\"2018-05-26\",\"vSyxz\":\"\",\"createUser\":\"1-超级管理员\",\"createTime\":\"2018-05-19 17:17:24\"}','{\"code\":200,\"message\":\"数据保存成功！\",\"success\":true}',13,NULL,'CarCtrl.save','2018-05-19 17:17:24');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('447447712795721728',NULL,'1-超级管理员',NULL,NULL,'{\"vHphm\":\"鄂33333333\",\"vHpzl\":\"20\",\"vCcdjrq\":\"2018-05-26\",\"vSyxz\":\"\"}','null',5,NULL,'CarCtrl.save','2018-05-19 17:17:27');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('447447715605905408',NULL,'1-超级管理员',NULL,NULL,'{\"vHphm\":\"鄂33333333\",\"vHpzl\":\"20\",\"vCcdjrq\":\"2018-05-26\",\"vSyxz\":\"\"}','null',4,NULL,'CarCtrl.save','2018-05-19 17:17:28');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('447447733280702464',NULL,'1-超级管理员',NULL,NULL,'{\"vId\":\"447447733238759424\",\"vHphm\":\"鄂33333338\",\"vHpzl\":\"20\",\"vCcdjrq\":\"2018-05-26\",\"vSyxz\":\"\",\"createUser\":\"1-超级管理员\",\"createTime\":\"2018-05-19 17:17:32\"}','{\"code\":200,\"message\":\"数据保存成功！\",\"success\":true}',13,NULL,'CarCtrl.save','2018-05-19 17:17:32');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('447447977112371200',NULL,'1-超级管理员',NULL,NULL,'{\"vId\":\"447447977066233856\",\"vHphm\":\"鄂34344443\",\"vHpzl\":\"20\",\"vCcdjrq\":\"2018-05-26\",\"vSyxz\":\"\",\"createUser\":\"1-超级管理员\",\"createTime\":\"2018-05-19 17:18:30\"}','{\"code\":200,\"message\":\"数据保存成功！\",\"success\":true}',15,NULL,'CarCtrl.save','2018-05-19 17:18:30');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('447447985668751360',NULL,'1-超级管理员',NULL,NULL,'{\"vHphm\":\"鄂34344443\",\"vHpzl\":\"20\",\"vCcdjrq\":\"2018-05-26\",\"vSyxz\":\"\"}','null',3,NULL,'CarCtrl.save','2018-05-19 17:18:32');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('447447987921092608',NULL,'1-超级管理员',NULL,NULL,'{\"vHphm\":\"鄂34344443\",\"vHpzl\":\"20\",\"vCcdjrq\":\"2018-05-26\",\"vSyxz\":\"\"}','null',5,NULL,'CarCtrl.save','2018-05-19 17:18:33');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('447447988965474304',NULL,'1-超级管理员',NULL,NULL,'{\"vHphm\":\"鄂34344443\",\"vHpzl\":\"20\",\"vCcdjrq\":\"2018-05-26\",\"vSyxz\":\"\"}','null',3,NULL,'CarCtrl.save','2018-05-19 17:18:33');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('447447991725326336',NULL,'1-超级管理员',NULL,NULL,'{\"vHphm\":\"鄂34344443\",\"vHpzl\":\"20\",\"vCcdjrq\":\"2018-05-26\",\"vSyxz\":\"\"}','null',4,NULL,'CarCtrl.save','2018-05-19 17:18:34');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('447453531775959040',NULL,'1-超级管理员',NULL,NULL,'[\"447447977066233856\"]','{\"code\":200,\"message\":\"数据删除成功！\",\"success\":true}',26,NULL,'CarCtrl.remove','2018-05-19 17:40:35');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('447453536817512448',NULL,'1-超级管理员',NULL,NULL,'[\"447447733238759424\"]','{\"code\":200,\"message\":\"数据删除成功！\",\"success\":true}',23,NULL,'CarCtrl.remove','2018-05-19 17:40:36');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('447453540818878464',NULL,'1-超级管理员',NULL,NULL,'[\"447447697041915904\"]','{\"code\":200,\"message\":\"数据删除成功！\",\"success\":true}',27,NULL,'CarCtrl.remove','2018-05-19 17:40:37');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('447453545218703360',NULL,'1-超级管理员',NULL,NULL,'[\"447447156068974592\"]','{\"code\":200,\"message\":\"数据删除成功！\",\"success\":true}',27,NULL,'CarCtrl.remove','2018-05-19 17:40:38');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('447453571231776768',NULL,'1-超级管理员',NULL,NULL,'{\"vId\":\"447453571164667904\",\"vHphm\":\"鄂23123131\",\"vHpzl\":\"20\",\"vCcdjrq\":\"2018-05-26\",\"vSyxz\":\"\",\"createUser\":\"1-超级管理员\",\"createTime\":\"2018-05-19 17:40:44\"}','{\"code\":200,\"message\":\"数据保存成功！\",\"success\":true}',38,NULL,'CarCtrl.save','2018-05-19 17:40:44');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('447453658834010112',NULL,'1-超级管理员',NULL,NULL,'{\"vId\":\"447453658766901248\",\"vHphm\":\"鄂22323444\",\"vHpzl\":\"20\",\"vCcdjrq\":\"2018-05-26\",\"vSyxz\":\"\",\"createUser\":\"1-超级管理员\",\"createTime\":\"2018-05-19 17:41:05\"}','{\"code\":200,\"message\":\"数据保存成功！\",\"success\":true}',21,NULL,'CarCtrl.save','2018-05-19 17:41:05');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('447453664605372416',NULL,'1-超级管理员',NULL,NULL,'{\"vHphm\":\"鄂22323444\",\"vHpzl\":\"20\",\"vCcdjrq\":\"2018-05-26\",\"vSyxz\":\"\"}','null',5,NULL,'CarCtrl.save','2018-05-19 17:41:06');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('447453680531144704',NULL,'1-超级管理员',NULL,NULL,'[\"447453658766901248\"]','{\"code\":200,\"message\":\"数据删除成功！\",\"success\":true}',26,NULL,'CarCtrl.remove','2018-05-19 17:41:10');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('447453732053975040',NULL,'1-超级管理员',NULL,NULL,'{\"vId\":\"447453732003643392\",\"vHphm\":\"鄂22222222\",\"vHpzl\":\"20\",\"vCcdjrq\":\"2018-05-18\",\"vSyxz\":\"\",\"createUser\":\"1-超级管理员\",\"createTime\":\"2018-05-19 17:41:22\"}','{\"code\":200,\"message\":\"数据保存成功！\",\"success\":true}',18,NULL,'CarCtrl.save','2018-05-19 17:41:23');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('447453742975942656',NULL,'1-超级管理员',NULL,NULL,'[\"447453732003643392\"]','{\"code\":200,\"message\":\"数据删除成功！\",\"success\":true}',23,NULL,'CarCtrl.remove','2018-05-19 17:41:25');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('447453748084604928',NULL,'1-超级管理员',NULL,NULL,'[\"447453571164667904\"]','{\"code\":200,\"message\":\"数据删除成功！\",\"success\":true}',23,NULL,'CarCtrl.remove','2018-05-19 17:41:26');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('447524402473467904',NULL,'1-超级管理员',NULL,NULL,'{\"vId\":\"447524401190010880\",\"vHphm\":\"鄂222222\",\"vHpzl\":\"20\",\"vCcdjrq\":\"2018-05-19\",\"vSyxz\":\"\",\"createUser\":\"1-超级管理员\",\"createTime\":\"2018-05-19 22:22:11\"}','null',358,NULL,'CarCtrl.save','2018-05-19 22:22:12');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('447524498678218752',NULL,'1-超级管理员',NULL,NULL,'{\"vHphm\":\"鄂222222\",\"vHpzl\":\"20\",\"vCcdjrq\":\"2018-05-19\",\"vSyxz\":\"\"}','null',5,NULL,'CarCtrl.save','2018-05-19 22:22:35');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('447524509134618624',NULL,'1-超级管理员',NULL,NULL,'{\"vHphm\":\"鄂222222\",\"vHpzl\":\"20\",\"vCcdjrq\":\"2018-05-19\",\"vSyxz\":\"\"}','null',8,NULL,'CarCtrl.save','2018-05-19 22:22:37');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('447524548284252160',NULL,'1-超级管理员',NULL,NULL,'{\"vId\":\"447524548200366080\",\"vHphm\":\"鄂23333333\",\"vHpzl\":\"20\",\"vCcdjrq\":\"2018-05-19\",\"vSyxz\":\"\",\"createUser\":\"1-超级管理员\",\"createTime\":\"2018-05-19 22:22:46\"}','null',26,NULL,'CarCtrl.save','2018-05-19 22:22:46');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('447525001747234816',NULL,'1-超级管理员',NULL,NULL,'{\"vId\":\"447525001638182912\",\"vHphm\":\"鄂23211222\",\"vHpzl\":\"20\",\"vCcdjrq\":\"2018-05-19\",\"vSyxz\":\"\",\"createUser\":\"1-超级管理员\",\"createTime\":\"2018-05-19 22:24:35\"}','{\"code\":200,\"message\":\"数据保存成功！\",\"success\":true}',98,NULL,'CarCtrl.save','2018-05-19 22:24:35');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('447528987158118400',NULL,'1-超级管理员',NULL,NULL,'{\"vId\":\"447528987095203840\",\"vHphm\":\"蒙12312323\",\"vHpzl\":\"20\",\"vCcdjrq\":\"2018-05-19\",\"vSyxz\":\"\",\"createUser\":\"1-超级管理员\",\"createTime\":\"2018-05-19 22:40:25\"}','{\"code\":200,\"message\":\"数据保存成功！\",\"success\":true}',26,NULL,'CarCtrl.save','2018-05-19 22:40:25');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('447529271959748608',NULL,'1-超级管理员',NULL,NULL,'{\"vId\":\"447529271901028352\",\"vHphm\":\"宁qwq12312\",\"vHpzl\":\"20\",\"vCcdjrq\":\"2018-05-19\",\"vSyxz\":\"\",\"createUser\":\"1-超级管理员\",\"createTime\":\"2018-05-19 22:41:33\"}','{\"code\":200,\"message\":\"数据保存成功！\",\"success\":true}',21,NULL,'CarCtrl.save','2018-05-19 22:41:33');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('447531008959447040',NULL,'1-超级管理员',NULL,NULL,'{\"vId\":\"447529271901028352\",\"vHphm\":\"宁qwq12312\",\"vHpzl\":\"20\",\"vClph\":\"\",\"vCllx\":\"\",\"vCcdjrq\":\"2018-05-19\",\"vNsrq\":\"\",\"vSyl\":\"\",\"vSyxz\":\"\",\"vCjh\":\"\",\"vFdjh\":\"\",\"vZt\":\"\",\"vGsdm\":\"\",\"vGsmc\":\"\",\"vLxr\":\"\",\"vLxdh\":\"\",\"vBdhm\":\"\",\"createUser\":\"1-超级管理员\",\"createTime\":\"2018-05-19 22:41:33\",\"updateUser\":\"1-超级管理员\",\"updateTime\":\"2018-05-19 22:48:27\"}','{\"code\":200,\"message\":\"数据保存成功！\",\"success\":true}',63,NULL,'CarCtrl.update','2018-05-19 22:48:27');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('447531042497101824',NULL,'1-超级管理员',NULL,NULL,'{\"vId\":\"447529271901028352\",\"vHphm\":\"津qwq12312\",\"vHpzl\":\"20\",\"vClph\":\"\",\"vCllx\":\"\",\"vCcdjrq\":\"2018-05-19\",\"vNsrq\":\"\",\"vSyl\":\"\",\"vSyxz\":\"\",\"vCjh\":\"\",\"vFdjh\":\"\",\"vZt\":\"\",\"vGsdm\":\"\",\"vGsmc\":\"\",\"vLxr\":\"\",\"vLxdh\":\"\",\"vBdhm\":\"\",\"createUser\":\"1-超级管理员\",\"createTime\":\"2018-05-19 22:41:33\",\"updateUser\":\"1-超级管理员\",\"updateTime\":\"2018-05-19 22:48:35\"}','{\"code\":200,\"message\":\"数据保存成功！\",\"success\":true}',26,NULL,'CarCtrl.update','2018-05-19 22:48:35');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('447532941094944768',NULL,'1-超级管理员',NULL,NULL,'{\"vId\":\"447529271901028352\",\"vHphm\":\"津qwq12312\",\"vHpzl\":\"20\",\"vClph\":\"\",\"vCllx\":\"\",\"vCcdjrq\":\"2018-05-19\",\"vNsrq\":\"\",\"vSyl\":\"\",\"vSyxz\":\"\",\"vCjh\":\"\",\"vFdjh\":\"\",\"vZt\":\"\",\"vGsdm\":\"\",\"vGsmc\":\"\",\"vLxr\":\"\",\"vLxdh\":\"\",\"vBdhm\":\"\",\"createUser\":\"1-超级管理员\",\"createTime\":\"2018-05-19 22:41:33\",\"updateUser\":\"1-超级管理员\",\"updateTime\":\"2018-05-19 22:56:07\"}','{\"code\":200,\"message\":\"数据保存成功！\",\"success\":true}',25,NULL,'CarCtrl.update','2018-05-19 22:56:07');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('447533183685099520',NULL,'1-超级管理员',NULL,NULL,'{\"vId\":\"447529271901028352\",\"vHphm\":\"津qwq12312\",\"vHpzl\":\"20\",\"vClph\":\"\",\"vCllx\":\"\",\"vCcdjrq\":\"2018-05-19\",\"vNsrq\":\"\",\"vSyl\":\"\",\"vSyxz\":\"\",\"vCjh\":\"\",\"vFdjh\":\"\",\"vZt\":\"\",\"vGsdm\":\"\",\"vGsmc\":\"\",\"vLxr\":\"\",\"vLxdh\":\"\",\"vBdhm\":\"\",\"createUser\":\"1-超级管理员\",\"createTime\":\"2018-05-19 22:41:33\",\"updateUser\":\"1-超级管理员\",\"updateTime\":\"2018-05-19 22:56:07\"}','null',955,NULL,'CarCtrl.update','2018-05-19 22:57:05');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('447533594831749120',NULL,'1-超级管理员',NULL,NULL,'{\"vId\":\"447529271901028352\",\"vHphm\":\"津qwq12312\",\"vHpzl\":\"20\",\"vClph\":\"\",\"vCllx\":\"\",\"vCcdjrq\":\"2018-05-19\",\"vNsrq\":\"\",\"vSyl\":\"\",\"vSyxz\":\"\",\"vCjh\":\"\",\"vFdjh\":\"\",\"vZt\":\"\",\"vGsdm\":\"\",\"vGsmc\":\"\",\"vLxr\":\"\",\"vLxdh\":\"\",\"vBdhm\":\"\",\"createUser\":\"1-超级管理员\",\"createTime\":\"2018-05-19 22:41:33\",\"updateUser\":\"1-超级管理员\",\"updateTime\":\"2018-05-19 22:56:07\"}','null',43450,NULL,'CarCtrl.update','2018-05-19 22:58:43');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('447534068163149824',NULL,'1-超级管理员',NULL,NULL,'{\"vId\":\"447529271901028352\",\"vHphm\":\"津qwq12312\",\"vHpzl\":\"20\",\"vClph\":\"\",\"vCllx\":\"\",\"vCcdjrq\":\"2018-05-19\",\"vNsrq\":\"\",\"vSyl\":\"\",\"vSyxz\":\"\",\"vCjh\":\"\",\"vFdjh\":\"\",\"vZt\":\"\",\"vGsdm\":\"\",\"vGsmc\":\"\",\"vLxr\":\"\",\"vLxdh\":\"\",\"vBdhm\":\"\",\"createUser\":\"1-超级管理员\",\"createTime\":\"2018-05-19 22:41:33\",\"updateUser\":\"1-超级管理员\",\"updateTime\":\"2018-05-19 22:56:07\"}','null',22827,NULL,'CarCtrl.update','2018-05-19 23:00:36');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('447534726522077184',NULL,'1-超级管理员',NULL,NULL,'{\"vId\":\"447529271901028352\",\"vHphm\":\"津QWQ12312\",\"vHpzl\":\"20\",\"vClph\":\"\",\"vCllx\":\"\",\"vCcdjrq\":\"2018-05-19\",\"vNsrq\":\"\",\"vSyl\":\"\",\"vSyxz\":\"\",\"vCjh\":\"\",\"vFdjh\":\"\",\"vZt\":\"\",\"vGsdm\":\"\",\"vGsmc\":\"\",\"vLxr\":\"\",\"vLxdh\":\"\",\"vBdhm\":\"\",\"createUser\":\"1-超级管理员\",\"createTime\":\"2018-05-19 22:41:33\",\"updateUser\":\"1-超级管理员\",\"updateTime\":\"2018-05-19 23:03:13\"}','{\"code\":200,\"message\":\"数据保存成功！\",\"success\":true}',889,NULL,'CarCtrl.update','2018-05-19 23:03:13');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('447534786106359808',NULL,'1-超级管理员',NULL,NULL,'{\"vId\":\"447524548200366080\",\"vHphm\":\"鄂222222\",\"vHpzl\":\"20\",\"vClph\":\"\",\"vCllx\":\"\",\"vCcdjrq\":\"2018-05-19\",\"vNsrq\":\"\",\"vSyl\":\"\",\"vSyxz\":\"\",\"vCjh\":\"\",\"vFdjh\":\"\",\"vZt\":\"\",\"vGsdm\":\"\",\"vGsmc\":\"\",\"vLxr\":\"\",\"vLxdh\":\"\",\"vBdhm\":\"\",\"createUser\":\"1-超级管理员\",\"createTime\":\"2018-05-19 22:22:46\",\"updateUser\":\"\",\"updateTime\":\"\"}','null',9,NULL,'CarCtrl.update','2018-05-19 23:03:27');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('447534795426103296',NULL,'1-超级管理员',NULL,NULL,'{\"vId\":\"447524548200366080\",\"vHphm\":\"鄂222222\",\"vHpzl\":\"20\",\"vClph\":\"\",\"vCllx\":\"\",\"vCcdjrq\":\"2018-05-19\",\"vNsrq\":\"\",\"vSyl\":\"\",\"vSyxz\":\"\",\"vCjh\":\"\",\"vFdjh\":\"\",\"vZt\":\"\",\"vGsdm\":\"\",\"vGsmc\":\"\",\"vLxr\":\"\",\"vLxdh\":\"\",\"vBdhm\":\"\",\"createUser\":\"1-超级管理员\",\"createTime\":\"2018-05-19 22:22:46\",\"updateUser\":\"\",\"updateTime\":\"\"}','null',8,NULL,'CarCtrl.update','2018-05-19 23:03:30');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('447534837167816704',NULL,'1-超级管理员',NULL,NULL,'{\"vId\":\"447524548200366080\",\"vHphm\":\"鄂23333333\",\"vHpzl\":\"20\",\"vClph\":\"\",\"vCllx\":\"\",\"vCcdjrq\":\"2018-05-19\",\"vNsrq\":\"\",\"vSyl\":\"来不不不\",\"vSyxz\":\"\",\"vCjh\":\"\",\"vFdjh\":\"\",\"vZt\":\"\",\"vGsdm\":\"\",\"vGsmc\":\"\",\"vLxr\":\"\",\"vLxdh\":\"\",\"vBdhm\":\"\",\"createUser\":\"1-超级管理员\",\"createTime\":\"2018-05-19 22:22:46\",\"updateUser\":\"1-超级管理员\",\"updateTime\":\"2018-05-19 23:03:39\"}','{\"code\":200,\"message\":\"数据保存成功！\",\"success\":true}',22,NULL,'CarCtrl.update','2018-05-19 23:03:39');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('447534905698549760',NULL,'1-超级管理员',NULL,NULL,'{\"vId\":\"447529271901028352\",\"vHphm\":\"津QWQ12312\",\"vHpzl\":\"20\",\"vClph\":\"\",\"vCllx\":\"\",\"vCcdjrq\":\"2018-05-19\",\"vNsrq\":\"\",\"vSyl\":\"\",\"vSyxz\":\"10\",\"vCjh\":\"\",\"vFdjh\":\"\",\"vZt\":\"\",\"vGsdm\":\"\",\"vGsmc\":\"\",\"vLxr\":\"\",\"vLxdh\":\"\",\"vBdhm\":\"\",\"createUser\":\"1-超级管理员\",\"createTime\":\"2018-05-19 22:41:33\",\"updateUser\":\"1-超级管理员\",\"updateTime\":\"2018-05-19 23:03:56\"}','{\"code\":200,\"message\":\"数据保存成功！\",\"success\":true}',16,NULL,'CarCtrl.update','2018-05-19 23:03:56');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('447632823172464640',NULL,'1-超级管理员',NULL,NULL,'[\"447528987095203840\"]','{\"code\":200,\"message\":\"数据删除成功！\",\"success\":true}',14,NULL,'CarCtrl.remove','2018-05-20 05:33:01');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('447632827668758528',NULL,'1-超级管理员',NULL,NULL,'[\"447525001638182912\"]','{\"code\":200,\"message\":\"数据删除成功！\",\"success\":true}',14,NULL,'CarCtrl.remove','2018-05-20 05:33:02');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('447632831376523264',NULL,'1-超级管理员',NULL,NULL,'[\"447524548200366080\"]','{\"code\":200,\"message\":\"数据删除成功！\",\"success\":true}',13,NULL,'CarCtrl.remove','2018-05-20 05:33:03');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('447632835558244352',NULL,'1-超级管理员',NULL,NULL,'[\"447524401190010880\"]','{\"code\":200,\"message\":\"数据删除成功！\",\"success\":true}',18,NULL,'CarCtrl.remove','2018-05-20 05:33:04');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('447632846979334144',NULL,'1-超级管理员',NULL,NULL,'{\"vId\":\"447529271901028352\",\"vHphm\":\"津QWQ12312\",\"vHpzl\":\"20\",\"vClph\":\"\",\"vCllx\":\"\",\"vCcdjrq\":\"2018-05-19\",\"vNsrq\":\"\",\"vSyl\":\"\",\"vSyxz\":\"10\",\"vCjh\":\"\",\"vFdjh\":\"\",\"vZt\":\"\",\"vGsdm\":\"\",\"vGsmc\":\"\",\"vLxr\":\"\",\"vLxdh\":\"\",\"vBdhm\":\"\",\"createUser\":\"1-超级管理员\",\"createTime\":\"2018-05-19 22:41:33\",\"updateUser\":\"1-超级管理员\",\"updateTime\":\"2018-05-20 05:33:07\",\"lastFuelTime\":\"\"}','{\"code\":200,\"message\":\"数据保存成功！\",\"success\":true}',44,NULL,'CarCtrl.update','2018-05-20 05:33:07');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('447632869582438400',NULL,'1-超级管理员',NULL,NULL,'{\"vId\":\"447529271901028352\",\"vHphm\":\"津QWQ12312\",\"vHpzl\":\"20\",\"vClph\":\"\",\"vCllx\":\"\",\"vCcdjrq\":\"2018-05-19\",\"vNsrq\":\"\",\"vSyl\":\"去问问\",\"vSyxz\":\"10\",\"vCjh\":\"\",\"vFdjh\":\"\",\"vZt\":\"\",\"vGsdm\":\"\",\"vGsmc\":\"\",\"vLxr\":\"\",\"vLxdh\":\"\",\"vBdhm\":\"\",\"createUser\":\"1-超级管理员\",\"createTime\":\"2018-05-19 22:41:33\",\"updateUser\":\"1-超级管理员\",\"updateTime\":\"2018-05-20 05:33:12\",\"lastFuelTime\":\"\"}','{\"code\":200,\"message\":\"数据保存成功！\",\"success\":true}',17,NULL,'CarCtrl.update','2018-05-20 05:33:12');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('447632920006361088',NULL,'1-超级管理员',NULL,NULL,'{\"vId\":\"447529271901028352\",\"vHphm\":\"津QWQ12312\",\"vHpzl\":\"20\",\"vClph\":\"\",\"vCllx\":\"123123\",\"vCcdjrq\":\"2018-05-19\",\"vNsrq\":\"\",\"vSyl\":\"去问问\",\"vSyxz\":\"10\",\"vCjh\":\"1233\",\"vFdjh\":\"123123\",\"vZt\":\"\",\"vGsdm\":\"\",\"vGsmc\":\"\",\"vLxr\":\"\",\"vLxdh\":\"\",\"vBdhm\":\"\",\"createUser\":\"1-超级管理员\",\"createTime\":\"2018-05-19 22:41:33\",\"updateUser\":\"1-超级管理员\",\"updateTime\":\"2018-05-20 05:33:12\",\"lastFuelTime\":\"\"}','null',11,NULL,'CarCtrl.update','2018-05-20 05:33:24');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('447632939707006976',NULL,'1-超级管理员',NULL,NULL,'{\"vId\":\"447529271901028352\",\"vHphm\":\"津QWQ12312\",\"vHpzl\":\"20\",\"vClph\":\"\",\"vCllx\":\"123123\",\"vCcdjrq\":\"2018-05-19\",\"vNsrq\":\"\",\"vSyl\":\"去问问\",\"vSyxz\":\"10\",\"vCjh\":\"\",\"vFdjh\":\"123123\",\"vZt\":\"\",\"vGsdm\":\"\",\"vGsmc\":\"\",\"vLxr\":\"\",\"vLxdh\":\"\",\"vBdhm\":\"\",\"createUser\":\"1-超级管理员\",\"createTime\":\"2018-05-19 22:41:33\",\"updateUser\":\"1-超级管理员\",\"updateTime\":\"2018-05-20 05:33:29\",\"lastFuelTime\":\"\"}','{\"code\":200,\"message\":\"数据保存成功！\",\"success\":true}',18,NULL,'CarCtrl.update','2018-05-20 05:33:29');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('447632974591033344',NULL,'1-超级管理员',NULL,NULL,'{\"vId\":\"447441975281451008\",\"vHphm\":\"鄂A20102\",\"vHpzl\":\"20\",\"vClph\":\"\",\"vCllx\":\"\",\"vCcdjrq\":\"2018-05-19\",\"vNsrq\":\"\",\"vSyl\":\"\",\"vSyxz\":\"10\",\"vCjh\":\"\",\"vFdjh\":\"\",\"vZt\":\"\",\"vGsdm\":\"\",\"vGsmc\":\"\",\"vLxr\":\"\",\"vLxdh\":\"\",\"vBdhm\":\"\",\"createUser\":\"1-超级管理员\",\"createTime\":\"2018-05-19 16:54:39\",\"updateUser\":\"1-超级管理员\",\"updateTime\":\"2018-05-20 05:33:37\",\"lastFuelTime\":\"\"}','{\"code\":200,\"message\":\"数据保存成功！\",\"success\":true}',18,NULL,'CarCtrl.update','2018-05-20 05:33:37');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('447632996963450880',NULL,'1-超级管理员',NULL,NULL,'{\"vId\":\"447441975281451008\",\"vHphm\":\"鄂A20102\",\"vHpzl\":\"20\",\"vClph\":\"\",\"vCllx\":\"\",\"vCcdjrq\":\"2018-05-19\",\"vNsrq\":\"\",\"vSyl\":\"1\",\"vSyxz\":\"10\",\"vCjh\":\"\",\"vFdjh\":\"\",\"vZt\":\"\",\"vGsdm\":\"\",\"vGsmc\":\"\",\"vLxr\":\"\",\"vLxdh\":\"\",\"vBdhm\":\"\",\"createUser\":\"1-超级管理员\",\"createTime\":\"2018-05-19 16:54:39\",\"updateUser\":\"1-超级管理员\",\"updateTime\":\"2018-05-20 05:33:43\",\"lastFuelTime\":\"\"}','{\"code\":200,\"message\":\"数据保存成功！\",\"success\":true}',12,NULL,'CarCtrl.update','2018-05-20 05:33:43');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('447633016617959424',NULL,'1-超级管理员',NULL,NULL,'{\"vId\":\"447441975281451008\",\"vHphm\":\"鄂A20102\",\"vHpzl\":\"20\",\"vClph\":\"\",\"vCllx\":\"\",\"vCcdjrq\":\"2018-05-19\",\"vNsrq\":\"\",\"vSyl\":\"1的\",\"vSyxz\":\"10\",\"vCjh\":\"\",\"vFdjh\":\"\",\"vZt\":\"\",\"vGsdm\":\"\",\"vGsmc\":\"\",\"vLxr\":\"\",\"vLxdh\":\"\",\"vBdhm\":\"\",\"createUser\":\"1-超级管理员\",\"createTime\":\"2018-05-19 16:54:39\",\"updateUser\":\"1-超级管理员\",\"updateTime\":\"2018-05-20 05:33:47\",\"lastFuelTime\":\"\"}','{\"code\":200,\"message\":\"数据保存成功！\",\"success\":true}',18,NULL,'CarCtrl.update','2018-05-20 05:33:47');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('447633139460734976',NULL,'1-超级管理员',NULL,NULL,'{\"vId\":\"447441975281451008\",\"vHphm\":\"鄂A20102\",\"vHpzl\":\"20\",\"vClph\":\"大而我却\",\"vCllx\":\"\",\"vCcdjrq\":\"2018-05-19\",\"vNsrq\":\"\",\"vSyl\":\"1的\",\"vSyxz\":\"10\",\"vCjh\":\"\",\"vFdjh\":\"\",\"vZt\":\"\",\"vGsdm\":\"\",\"vGsmc\":\"\",\"vLxr\":\"\",\"vLxdh\":\"\",\"vBdhm\":\"\",\"createUser\":\"1-超级管理员\",\"createTime\":\"2018-05-19 16:54:39\",\"updateUser\":\"1-超级管理员\",\"updateTime\":\"2018-05-20 05:34:17\",\"lastFuelTime\":\"\"}','{\"code\":200,\"message\":\"数据保存成功！\",\"success\":true}',20,NULL,'CarCtrl.update','2018-05-20 05:34:17');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('447633283736403968',NULL,'1-超级管理员',NULL,NULL,'{\"vId\":\"447441975281451008\",\"vHphm\":\"鄂A20102\",\"vHpzl\":\"20\",\"vClph\":\"大而我却\",\"vCllx\":\"请问\",\"vCcdjrq\":\"2018-05-19\",\"vNsrq\":\"\",\"vSyl\":\"1的\",\"vSyxz\":\"10\",\"vCjh\":\"\",\"vFdjh\":\"\",\"vZt\":\"\",\"vGsdm\":\"\",\"vGsmc\":\"\",\"vLxr\":\"\",\"vLxdh\":\"\",\"vBdhm\":\"\",\"createUser\":\"1-超级管理员\",\"createTime\":\"2018-05-19 16:54:39\",\"updateUser\":\"1-超级管理员\",\"updateTime\":\"2018-05-20 05:34:51\",\"lastFuelTime\":\"\"}','{\"code\":200,\"message\":\"数据保存成功！\",\"success\":true}',19,NULL,'CarCtrl.update','2018-05-20 05:34:51');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('447633528125915136',NULL,'1-超级管理员',NULL,NULL,'{\"vId\":\"447441975281451008\",\"vHphm\":\"鄂A20102\",\"vHpzl\":\"20\",\"vClph\":\"大而我却\",\"vCllx\":\"\",\"vCcdjrq\":\"2018-05-19\",\"vNsrq\":\"\",\"vSyl\":\"1的\",\"vSyxz\":\"10\",\"vCjh\":\"\",\"vFdjh\":\"\",\"vZt\":\"\",\"vGsdm\":\"\",\"vGsmc\":\"\",\"vLxr\":\"\",\"vLxdh\":\"\",\"vBdhm\":\"\",\"createUser\":\"1-超级管理员\",\"createTime\":\"2018-05-19 16:54:39\",\"updateUser\":\"1-超级管理员\",\"updateTime\":\"2018-05-20 05:35:49\",\"lastFuelTime\":\"\"}','{\"code\":200,\"message\":\"数据保存成功！\",\"success\":true}',19,NULL,'CarCtrl.update','2018-05-20 05:35:49');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('447633550892597248',NULL,'1-超级管理员',NULL,NULL,'{\"vId\":\"447441975281451008\",\"vHphm\":\"鄂A20102\",\"vHpzl\":\"20\",\"vClph\":\"大而我\",\"vCllx\":\"\",\"vCcdjrq\":\"2018-05-19\",\"vNsrq\":\"\",\"vSyl\":\"1的\",\"vSyxz\":\"10\",\"vCjh\":\"\",\"vFdjh\":\"\",\"vZt\":\"\",\"vGsdm\":\"\",\"vGsmc\":\"\",\"vLxr\":\"\",\"vLxdh\":\"\",\"vBdhm\":\"\",\"createUser\":\"1-超级管理员\",\"createTime\":\"2018-05-19 16:54:39\",\"updateUser\":\"1-超级管理员\",\"updateTime\":\"2018-05-20 05:35:55\",\"lastFuelTime\":\"\"}','{\"code\":200,\"message\":\"数据保存成功！\",\"success\":true}',13,NULL,'CarCtrl.update','2018-05-20 05:35:55');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('447633563018330112',NULL,'1-超级管理员',NULL,NULL,'{\"vId\":\"447441975281451008\",\"vHphm\":\"鄂A20102\",\"vHpzl\":\"20\",\"vClph\":\"\",\"vCllx\":\"\",\"vCcdjrq\":\"2018-05-19\",\"vNsrq\":\"\",\"vSyl\":\"1的\",\"vSyxz\":\"10\",\"vCjh\":\"\",\"vFdjh\":\"\",\"vZt\":\"\",\"vGsdm\":\"\",\"vGsmc\":\"\",\"vLxr\":\"\",\"vLxdh\":\"\",\"vBdhm\":\"\",\"createUser\":\"1-超级管理员\",\"createTime\":\"2018-05-19 16:54:39\",\"updateUser\":\"1-超级管理员\",\"updateTime\":\"2018-05-20 05:35:58\",\"lastFuelTime\":\"\"}','{\"code\":200,\"message\":\"数据保存成功！\",\"success\":true}',15,NULL,'CarCtrl.update','2018-05-20 05:35:58');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('447633977520422912',NULL,'1-超级管理员',NULL,NULL,'{\"vId\":\"447441975281451008\",\"vHphm\":\"鄂A20102\",\"vHpzl\":\"20\",\"vClph\":\"1请问\",\"vCllx\":\"\",\"vCcdjrq\":\"2018-05-19\",\"vNsrq\":\"\",\"vSyl\":\"1的\",\"vSyxz\":\"10\",\"vCjh\":\"\",\"vFdjh\":\"\",\"vZt\":\"\",\"vGsdm\":\"\",\"vGsmc\":\"\",\"vLxr\":\"\",\"vLxdh\":\"\",\"vBdhm\":\"\",\"createUser\":\"1-超级管理员\",\"createTime\":\"2018-05-19 16:54:39\",\"updateUser\":\"1-超级管理员\",\"updateTime\":\"2018-05-20 05:37:36\",\"lastFuelTime\":\"\"}','{\"code\":200,\"message\":\"数据保存成功！\",\"success\":true}',21,NULL,'CarCtrl.update','2018-05-20 05:37:36');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('447634473664643072',NULL,'1-超级管理员',NULL,NULL,'{\"vId\":\"447441975281451008\",\"vHphm\":\"鄂A20102\",\"vHpzl\":\"20\",\"vClph\":\"1\",\"vCllx\":\"\",\"vCcdjrq\":\"2018-05-19\",\"vNsrq\":\"\",\"vSyl\":\"1的\",\"vSyxz\":\"10\",\"vCjh\":\"\",\"vFdjh\":\"\",\"vZt\":\"\",\"vGsdm\":\"\",\"vGsmc\":\"\",\"vLxr\":\"\",\"vLxdh\":\"\",\"vBdhm\":\"\",\"createUser\":\"1-超级管理员\",\"createTime\":\"2018-05-19 16:54:39\",\"updateUser\":\"1-超级管理员\",\"updateTime\":\"2018-05-20 05:39:35\",\"lastFuelTime\":\"\"}','{\"code\":200,\"message\":\"数据保存成功！\",\"success\":true}',19,NULL,'CarCtrl.update','2018-05-20 05:39:35');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('447662853000790016',NULL,'1-超级管理员',NULL,NULL,'{\"vId\":\"447529271901028352\",\"vHphm\":\"津QWQ12312\",\"vHpzl\":\"20\",\"vClph\":\"\",\"vCllx\":\"123123\",\"vCcdjrq\":\"2018-05-19\",\"vNsrq\":\"\",\"vSyl\":\"去问问\",\"vSyxz\":\"10\",\"vCjh\":\"\",\"vFdjh\":\"123123\",\"vZt\":\"\",\"vGsdm\":\"\",\"vGsmc\":\"\",\"vLxr\":\"446638357951283200-管理员\",\"vLxdh\":\"18602714780\",\"vBdhm\":\"\",\"createUser\":\"1-超级管理员\",\"createTime\":\"2018-05-19 22:41:33\",\"updateUser\":\"1-超级管理员\",\"updateTime\":\"2018-05-20 07:32:21\",\"lastFuelTime\":\"\"}','{\"code\":200,\"message\":\"数据保存成功！\",\"success\":true}',45,NULL,'CarCtrl.update','2018-05-20 07:32:21');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('447663024845619200',NULL,'1-超级管理员',NULL,NULL,'{\"vId\":\"447441975281451008\",\"vHphm\":\"鄂A20102\",\"vHpzl\":\"20\",\"vClph\":\"1\",\"vCllx\":\"\",\"vCcdjrq\":\"2018-05-19\",\"vNsrq\":\"\",\"vSyl\":\"1的\",\"vSyxz\":\"10\",\"vCjh\":\"\",\"vFdjh\":\"\",\"vZt\":\"\",\"vGsdm\":\"\",\"vGsmc\":\"\",\"vLxr\":\"\",\"vLxdh\":\"\",\"vBdhm\":\"\",\"createUser\":\"1-超级管理员\",\"createTime\":\"2018-05-19 16:54:39\",\"updateUser\":\"1-超级管理员\",\"updateTime\":\"2018-05-20 07:33:02\",\"lastFuelTime\":\"\"}','{\"code\":200,\"message\":\"数据保存成功！\",\"success\":true}',20,NULL,'CarCtrl.update','2018-05-20 07:33:02');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('447663080537587712',NULL,'1-超级管理员',NULL,NULL,'{\"vId\":\"447529271901028352\",\"vHphm\":\"津QWQ12312\",\"vHpzl\":\"20\",\"vClph\":\"\",\"vCllx\":\"123123\",\"vCcdjrq\":\"2018-05-19\",\"vNsrq\":\"\",\"vSyl\":\"去问问\",\"vSyxz\":\"10\",\"vCjh\":\"\",\"vFdjh\":\"123123\",\"vZt\":\"\",\"vGsdm\":\"\",\"vGsmc\":\"\",\"vLxr\":\"446638357951283200-管理员\",\"vLxdh\":\"18602714780\",\"vBdhm\":\"\",\"createUser\":\"1-超级管理员\",\"createTime\":\"2018-05-19 22:41:33\",\"updateUser\":\"1-超级管理员\",\"updateTime\":\"2018-05-20 07:33:15\",\"lastFuelTime\":\"\"}','{\"code\":200,\"message\":\"数据保存成功！\",\"success\":true}',21,NULL,'CarCtrl.update','2018-05-20 07:33:15');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('447663577684246528',NULL,'1-超级管理员',NULL,NULL,'{\"vId\":\"447441975281451008\",\"vHphm\":\"鄂A20102\",\"vHpzl\":\"20\",\"vClph\":\"1\",\"vCllx\":\"\",\"vCcdjrq\":\"2018-05-19\",\"vNsrq\":\"\",\"vSyl\":\"1的\",\"vSyxz\":\"10\",\"vCjh\":\"\",\"vFdjh\":\"\",\"vZt\":\"\",\"vGsdm\":\"\",\"vGsmc\":\"\",\"vLxr\":\"\",\"vLxdh\":\"\",\"vBdhm\":\"\",\"createUser\":\"1-超级管理员\",\"createTime\":\"2018-05-19 16:54:39\",\"updateUser\":\"1-超级管理员\",\"updateTime\":\"2018-05-20 07:35:14\",\"lastFuelTime\":\"\"}','{\"code\":200,\"message\":\"数据保存成功！\",\"success\":true}',19,NULL,'CarCtrl.update','2018-05-20 07:35:14');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('447663615969853440',NULL,'1-超级管理员',NULL,NULL,'{\"vId\":\"447441975281451008\",\"vHphm\":\"鄂A20102\",\"vHpzl\":\"20\",\"vClph\":\"1\",\"vCllx\":\"\",\"vCcdjrq\":\"2018-05-19\",\"vNsrq\":\"\",\"vSyl\":\"1的\",\"vSyxz\":\"10\",\"vCjh\":\"77777\",\"vFdjh\":\"\",\"vZt\":\"\",\"vGsdm\":\"\",\"vGsmc\":\"\",\"vLxr\":\"\",\"vLxdh\":\"\",\"vBdhm\":\"\",\"createUser\":\"1-超级管理员\",\"createTime\":\"2018-05-19 16:54:39\",\"updateUser\":\"1-超级管理员\",\"updateTime\":\"2018-05-20 07:35:14\",\"lastFuelTime\":\"\"}','null',13,NULL,'CarCtrl.update','2018-05-20 07:35:23');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('447663630339538944',NULL,'1-超级管理员',NULL,NULL,'{\"vId\":\"447441975281451008\",\"vHphm\":\"鄂A20102\",\"vHpzl\":\"20\",\"vClph\":\"14\",\"vCllx\":\"\",\"vCcdjrq\":\"2018-05-19\",\"vNsrq\":\"\",\"vSyl\":\"1的\",\"vSyxz\":\"10\",\"vCjh\":\"\",\"vFdjh\":\"\",\"vZt\":\"\",\"vGsdm\":\"\",\"vGsmc\":\"\",\"vLxr\":\"\",\"vLxdh\":\"\",\"vBdhm\":\"\",\"createUser\":\"1-超级管理员\",\"createTime\":\"2018-05-19 16:54:39\",\"updateUser\":\"1-超级管理员\",\"updateTime\":\"2018-05-20 07:35:26\",\"lastFuelTime\":\"\"}','{\"code\":200,\"message\":\"数据保存成功！\",\"success\":true}',21,NULL,'CarCtrl.update','2018-05-20 07:35:26');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('447663647473270784',NULL,'1-超级管理员',NULL,NULL,'{\"vId\":\"447441975281451008\",\"vHphm\":\"鄂A20102\",\"vHpzl\":\"20\",\"vClph\":\"14\",\"vCllx\":\"\",\"vCcdjrq\":\"2018-05-19\",\"vNsrq\":\"\",\"vSyl\":\"1的个\",\"vSyxz\":\"10\",\"vCjh\":\"\",\"vFdjh\":\"\",\"vZt\":\"\",\"vGsdm\":\"\",\"vGsmc\":\"\",\"vLxr\":\"\",\"vLxdh\":\"\",\"vBdhm\":\"\",\"createUser\":\"1-超级管理员\",\"createTime\":\"2018-05-19 16:54:39\",\"updateUser\":\"1-超级管理员\",\"updateTime\":\"2018-05-20 07:35:30\",\"lastFuelTime\":\"\"}','{\"code\":200,\"message\":\"数据保存成功！\",\"success\":true}',20,NULL,'CarCtrl.update','2018-05-20 07:35:30');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('447794871038640128',NULL,'1-超级管理员',NULL,NULL,'{\"lmdm\":\"SYXZ\",\"lmmc\":\"商业险种\",\"cjsj\":\"2018-05-20 16:16:56\",\"cjr\":\"1-超级管理员\"}','null',335,NULL,'ZdLmController.save','2018-05-20 16:16:56');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('447794881553760256',NULL,'1-超级管理员',NULL,NULL,'{\"lmdm\":\"SYXZ\",\"lmmc\":\"商业险种\",\"cjsj\":\"2018-05-20 16:16:59\",\"cjr\":\"1-超级管理员\"}','null',25,NULL,'ZdLmController.save','2018-05-20 16:16:59');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('447794907474558976',NULL,'1-超级管理员',NULL,NULL,'{\"lmdm\":\"BXSYXZ\",\"lmmc\":\"商业险种\",\"cjsj\":\"2018-05-20 16:17:05\",\"cjr\":\"1-超级管理员\"}','{\"code\":200,\"message\":\"操作成功\",\"success\":true}',37,NULL,'ZdLmController.save','2018-05-20 16:17:05');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('447794992409214976',NULL,'1-超级管理员',NULL,NULL,'{\"zdId\":\"447794992287580160\",\"zdlmdm\":\"BXSYXZ\",\"zddm\":\"01\",\"zdmc\":\"三者\",\"cjsj\":\"2018-05-20 16:17:25\",\"cjr\":\"1-超级管理员\"}','{\"code\":200,\"message\":\"操作成功\",\"success\":true}',50,NULL,'ZdxmController.save','2018-05-20 16:17:25');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('447795016438382592',NULL,'1-超级管理员',NULL,NULL,'{\"zdId\":\"447795016333524992\",\"zdlmdm\":\"BXSYXZ\",\"zddm\":\"02\",\"zdmc\":\"玻璃\",\"cjsj\":\"2018-05-20 16:17:31\",\"cjr\":\"1-超级管理员\"}','{\"code\":200,\"message\":\"操作成功\",\"success\":true}',39,NULL,'ZdxmController.save','2018-05-20 16:17:31');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('447795046373130240',NULL,'1-超级管理员',NULL,NULL,'{\"zdId\":\"447795046268272640\",\"zdlmdm\":\"BXSYXZ\",\"zddm\":\"03\",\"zdmc\":\"盗抢\",\"cjsj\":\"2018-05-20 16:17:38\",\"cjr\":\"1-超级管理员\"}','{\"code\":200,\"message\":\"操作成功\",\"success\":true}',35,NULL,'ZdxmController.save','2018-05-20 16:17:38');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('447795084264472576',NULL,'1-超级管理员',NULL,NULL,'{\"zdId\":\"447795084159614976\",\"zdlmdm\":\"BXSYXZ\",\"zddm\":\"04\",\"zdmc\":\"涉水\",\"cjsj\":\"2018-05-20 16:17:47\",\"cjr\":\"1-超级管理员\"}','{\"code\":200,\"message\":\"操作成功\",\"success\":true}',36,NULL,'ZdxmController.save','2018-05-20 16:17:47');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('447799544608980992',NULL,'1-超级管理员',NULL,NULL,'{\"lmdm\":\"BXGSXX\",\"lmmc\":\"保险公司\",\"cjsj\":\"2018-05-20 16:35:31\",\"cjr\":\"1-超级管理员\"}','{\"code\":200,\"message\":\"操作成功\",\"success\":true}',32,NULL,'ZdLmController.save','2018-05-20 16:35:31');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('447799590322700288',NULL,'1-超级管理员',NULL,NULL,'{\"zdId\":\"447799590192676864\",\"zdlmdm\":\"BXGSXX\",\"zddm\":\"95501\",\"zdmc\":\"中国人保\",\"cjsj\":\"2018-05-20 16:35:42\",\"cjr\":\"1-超级管理员\"}','{\"code\":200,\"message\":\"操作成功\",\"success\":true}',49,NULL,'ZdxmController.save','2018-05-20 16:35:42');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('447799637974188032',NULL,'1-超级管理员',NULL,NULL,'{\"zdId\":\"447799637852553216\",\"zdlmdm\":\"BXGSXX\",\"zddm\":\"95502\",\"zdmc\":\"中国平安\",\"cjsj\":\"2018-05-20 16:35:53\",\"cjr\":\"1-超级管理员\"}','{\"code\":200,\"message\":\"操作成功\",\"success\":true}',44,NULL,'ZdxmController.save','2018-05-20 16:35:53');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('447799673223118848',NULL,'1-超级管理员',NULL,NULL,'{\"zdId\":\"447799673097289728\",\"zdlmdm\":\"BXGSXX\",\"zddm\":\"95503\",\"zdmc\":\"中国人寿\",\"cjsj\":\"2018-05-20 16:36:01\",\"cjr\":\"1-超级管理员\"}','{\"code\":200,\"message\":\"操作成功\",\"success\":true}',44,NULL,'ZdxmController.save','2018-05-20 16:36:01');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('447804444050980864',NULL,'1-超级管理员',NULL,NULL,'{\"inId\":\"447804443908374528\",\"inBdh\":\"12312313\",\"vId\":\"447441975281451008\",\"vHphm\":\"鄂A20102\",\"inBxgs\":\"95501-中国人保\",\"inQbrq\":\"2018-05-20\",\"inBxje\":1000,\"inXz\":\"01,02,03\",\"createUser\":\"1-超级管理员\",\"createTime\":\"2018-05-20 16:54:59\",\"inJqbdh\":\"1321\",\"inJqbxgs\":\"95502-中国平安\",\"inJqqbrq\":\"2018-05-23\",\"inJqbxje\":2000}','{\"code\":200,\"message\":\"数据保存成功！\",\"success\":true}',61,NULL,'InsuranceCtrl.save','2018-05-20 16:54:59');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('447805573048565760',NULL,'1-超级管理员',NULL,NULL,'[\"447804443908374528\"]','{\"code\":200,\"message\":\"数据删除成功！\",\"success\":true}',24,NULL,'InsuranceCtrl.remove','2018-05-20 16:59:28');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('447807072227033088',NULL,'1-超级管理员',NULL,NULL,'{\"inId\":\"447807072117981184\",\"inBdh\":\"12\",\"vId\":\"447441975281451008\",\"vHphm\":\"鄂A20102\",\"inBxgs\":\"中国平安\",\"inBxdh\":\"95502\",\"inQbrq\":\"2018-05-01\",\"inZbrq\":\"2019-04-30\",\"inBxje\":111,\"inXz\":\"01,02\",\"createUser\":\"1-超级管理员\",\"createTime\":\"2018-05-20 17:05:25\",\"inJqbdh\":\"233\",\"inJqbxgs\":\"中国人寿\",\"inJqbxdh\":\"95503\",\"inJqqbrq\":\"2018-05-02\",\"inJqzbrq\":\"2019-04-30\",\"inJqbxje\":2222}','{\"code\":200,\"message\":\"数据保存成功！\",\"success\":true}',165,NULL,'InsuranceCtrl.save','2018-05-20 17:05:25');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('447846069485699072',NULL,'1-超级管理员',NULL,NULL,'{\"inId\":\"447807072117981184\",\"inBdh\":\"12\",\"vId\":\"447441975281451008\",\"vHphm\":\"447441975281451008\",\"inBxgs\":\"95502-中国平安\",\"inBxdh\":\"95502\",\"inQbrq\":\"2018-05-01\",\"inZbrq\":\"2019-04-30\",\"inBxje\":111,\"inXz\":\"01,04\",\"createUser\":\"1-超级管理员\",\"createTime\":\"2018-05-20 17:05:25\",\"inJqbdh\":\"233\",\"inJqbxgs\":\"95503-95503-中国人寿\",\"inJqbxdh\":\"95503\",\"inJqqbrq\":\"2018-05-02\",\"inJqzbrq\":\"2019-04-30\",\"inJqbxje\":2222}','null',335,NULL,'InsuranceCtrl.update','2018-05-20 19:40:23');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('447846102780084224',NULL,'1-超级管理员',NULL,NULL,'{\"inId\":\"447807072117981184\",\"inBdh\":\"12\",\"vId\":\"447441975281451008\",\"vHphm\":\"447441975281451008\",\"inBxgs\":\"95502-中国平安\",\"inBxdh\":\"95502\",\"inQbrq\":\"2018-05-01\",\"inZbrq\":\"2019-04-30\",\"inBxje\":111,\"inXz\":\"01,04\",\"createUser\":\"1-超级管理员\",\"createTime\":\"2018-05-20 17:05:25\",\"inJqbdh\":\"233\",\"inJqbxgs\":\"95503-95503-中国人寿\",\"inJqbxdh\":\"95503\",\"inJqqbrq\":\"2018-05-02\",\"inJqzbrq\":\"2019-04-30\",\"inJqbxje\":2222}','null',13,NULL,'InsuranceCtrl.update','2018-05-20 19:40:31');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('447847989914894336',NULL,'1-超级管理员',NULL,NULL,'{\"inId\":\"447807072117981184\",\"inBdh\":\"12\",\"vId\":\"447441975281451008\",\"vHphm\":\"447441975281451008\",\"inBxgs\":\"95502-中国平安\",\"inBxdh\":\"95502\",\"inQbrq\":\"2018-05-01\",\"inZbrq\":\"2019-04-30\",\"inBxje\":111,\"inXz\":\"01,02\",\"createUser\":\"1-超级管理员\",\"createTime\":\"2018-05-20 17:05:25\",\"inJqbdh\":\"233\",\"inJqbxgs\":\"95503-中国人寿\",\"inJqbxdh\":\"95503\",\"inJqqbrq\":\"2018-05-02\",\"inJqzbrq\":\"2019-04-30\",\"inJqbxje\":2222}','null',30,NULL,'InsuranceCtrl.update','2018-05-20 19:48:01');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('447848302713503744',NULL,'1-超级管理员',NULL,NULL,'{\"inId\":\"447807072117981184\",\"inBdh\":\"12\",\"vId\":\"447441975281451008\",\"vHphm\":\"鄂A20102\",\"inBxgs\":\"中国平安\",\"inBxdh\":\"95502\",\"inQbrq\":\"2018-05-01\",\"inZbrq\":\"2019-04-30\",\"inBxje\":111,\"inXz\":\"01,02\",\"createUser\":\"1-超级管理员\",\"createTime\":\"2018-05-20 17:05:25\",\"inJqbdh\":\"233\",\"inJqbxgs\":\"中国人寿\",\"inJqbxdh\":\"95503\",\"inJqqbrq\":\"2018-05-02\",\"inJqzbrq\":\"2019-05-01\",\"inJqbxje\":2222}','{\"code\":200,\"message\":\"数据保存成功！\",\"success\":true}',195,NULL,'InsuranceCtrl.update','2018-05-20 19:49:15');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('447848696923553792',NULL,'1-超级管理员',NULL,NULL,'{\"inId\":\"447807072117981184\",\"inBdh\":\"12\",\"vId\":\"447441975281451008\",\"vHphm\":\"鄂A20102\",\"inBxgs\":\"中国平安\",\"inBxdh\":\"95502\",\"inQbrq\":\"2018-05-01\",\"inZbrq\":\"2019-04-30\",\"inBxje\":111,\"inXz\":\"01,02\",\"createUser\":\"1-超级管理员\",\"createTime\":\"2018-05-20 17:05:25\",\"inJqbdh\":\"233\",\"inJqbxgs\":\"中国人保\",\"inJqbxdh\":\"95501\",\"inJqqbrq\":\"2018-05-02\",\"inJqzbrq\":\"2019-05-01\",\"inJqbxje\":2222}','{\"code\":200,\"message\":\"数据保存成功！\",\"success\":true}',27,NULL,'InsuranceCtrl.update','2018-05-20 19:50:49');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('447848750187020288',NULL,'1-超级管理员',NULL,NULL,'{\"inId\":\"447807072117981184\",\"inBdh\":\"12\",\"vId\":\"447441975281451008\",\"vHphm\":\"鄂A20102\",\"inBxgs\":\"中国平安\",\"inBxdh\":\"95502\",\"inQbrq\":\"2018-05-01\",\"inZbrq\":\"2019-04-30\",\"inBxje\":111,\"inXz\":\"01,04\",\"createUser\":\"1-超级管理员\",\"createTime\":\"2018-05-20 17:05:25\",\"inJqbdh\":\"233\",\"inJqbxgs\":\"中国人保\",\"inJqbxdh\":\"95501\",\"inJqqbrq\":\"2018-05-02\",\"inJqzbrq\":\"2019-05-01\",\"inJqbxje\":2222}','{\"code\":200,\"message\":\"数据保存成功！\",\"success\":true}',26,NULL,'InsuranceCtrl.update','2018-05-20 19:51:02');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('447848902247317504',NULL,'1-超级管理员',NULL,NULL,'{\"inId\":\"447807072117981184\",\"inBdh\":\"125689045\",\"vId\":\"447441975281451008\",\"vHphm\":\"鄂A20102\",\"inBxgs\":\"中国平安\",\"inBxdh\":\"95502\",\"inQbrq\":\"2018-05-01\",\"inZbrq\":\"2019-04-30\",\"inBxje\":111,\"inXz\":\"01,04\",\"createUser\":\"1-超级管理员\",\"createTime\":\"2018-05-20 17:05:25\",\"inJqbdh\":\"233\",\"inJqbxgs\":\"中国人保\",\"inJqbxdh\":\"95501\",\"inJqqbrq\":\"2018-05-02\",\"inJqzbrq\":\"2019-05-01\",\"inJqbxje\":2222}','{\"code\":200,\"message\":\"数据保存成功！\",\"success\":true}',21,NULL,'InsuranceCtrl.update','2018-05-20 19:51:38');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('448019998514872320',NULL,'1-超级管理员',NULL,NULL,'{\"inId\":\"448019998397431808\",\"inBdh\":\"1223312123\",\"vId\":\"447441975281451008\",\"vHphm\":\"鄂A20102\",\"inQbrq\":\"2018-05-01\",\"inZbrq\":\"2019-04-30\",\"createUser\":\"1-超级管理员\",\"createTime\":\"2018-05-21 07:11:31\"}','{\"code\":200,\"message\":\"数据保存成功！\",\"success\":true}',146,NULL,'InsuranceCtrl.save','2018-05-21 07:11:31');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('448020076705087488',NULL,'1-超级管理员',NULL,NULL,'[\"448019998397431808\"]','{\"code\":200,\"message\":\"数据删除成功！\",\"success\":true}',16,NULL,'InsuranceCtrl.remove','2018-05-21 07:11:50');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('448020195621994496',NULL,'1-超级管理员',NULL,NULL,'{\"wfId\":\"111222\",\"wfWfsj\":\"2018-05-01 10:07:06\",\"wfWfdz\":\"121231\",\"wfWfxw\":\"121\",\"vId\":\"448020195097706496\",\"vHphm\":\"447441975281451008\",\"wfWfjf\":12,\"wfWfje\":1111,\"createUser\":\"1-超级管理员\",\"createTime\":\"2018-05-21 07:12:18\"}','null',130,NULL,'IllegalCtrl.save','2018-05-21 07:12:18');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('448020205268893696',NULL,'1-超级管理员',NULL,NULL,'{\"wfId\":\"111222\",\"wfWfsj\":\"2018-05-01 10:07:06\",\"wfWfdz\":\"121231\",\"wfWfxw\":\"121\",\"vId\":\"448020205226950656\",\"vHphm\":\"447441975281451008\",\"wfWfjf\":12,\"wfWfje\":1111,\"createUser\":\"1-超级管理员\",\"createTime\":\"2018-05-21 07:12:20\"}','null',11,NULL,'IllegalCtrl.save','2018-05-21 07:12:20');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('448021996266061824',NULL,'1-超级管理员',NULL,NULL,'{\"lmdm\":\"WFZT\",\"lmmc\":\"违法处理状态\",\"cjsj\":\"2018-05-21 07:19:27\",\"cjr\":\"1-超级管理员\"}','{\"code\":200,\"message\":\"操作成功\",\"success\":true}',26,NULL,'ZdLmController.save','2018-05-21 07:19:27');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('448022058111074304',NULL,'1-超级管理员',NULL,NULL,'{\"zdId\":\"448022058031382528\",\"zdlmdm\":\"WFZT\",\"zddm\":\"01\",\"zdmc\":\"未处理\",\"cjsj\":\"2018-05-21 07:19:42\",\"cjr\":\"1-超级管理员\"}','{\"code\":200,\"message\":\"操作成功\",\"success\":true}',33,NULL,'ZdxmController.save','2018-05-21 07:19:42');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('448022082417065984',NULL,'1-超级管理员',NULL,NULL,'{\"zdId\":\"448022082354151424\",\"zdlmdm\":\"WFZT\",\"zddm\":\"02\",\"zdmc\":\"已处理\",\"cjsj\":\"2018-05-21 07:19:48\",\"cjr\":\"1-超级管理员\"}','{\"code\":200,\"message\":\"操作成功\",\"success\":true}',22,NULL,'ZdxmController.save','2018-05-21 07:19:48');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('448022893083754496',NULL,'1-超级管理员',NULL,NULL,'{\"gndm\":\"vehicle-wfxx\",\"gnmc\":\"违法管理\",\"fwdm\":\"1\",\"cjsj\":\"2018-05-17 15:55:34\",\"cjr\":\"1-超级管理员\",\"xgsj\":\"2018-05-21 07:23:01\",\"xgr\":\"1-超级管理员\",\"zt\":\"00\",\"bz\":\"\",\"url\":\"vehicle-wfxx\",\"fjd\":\"vehicle\",\"tzdz\":\"vehicle-wfxx\",\"tb\":\"ios-camera\",\"apiQz\":\"/api/vehicle\",\"apiHz\":\"\",\"px\":3.0,\"title\":\"违法管理\",\"checked\":\"\"}','{\"code\":200,\"message\":\"操作成功\",\"success\":true}',23,NULL,'GnController.update','2018-05-21 07:23:01');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('448023042900099072',NULL,'1-超级管理员',NULL,NULL,'{\"wfId\":\"12333\",\"wfWfsj\":\"2018-05-01 18:06:03\",\"wfWfdz\":\"lkljkjk\",\"wfWfxw\":\"1213231\",\"vId\":\"447529271901028352\",\"wfWfjf\":13,\"wfWfje\":200,\"wfWfzt\":\"01\"}','null',23,NULL,'IllegalCtrl.save','2018-05-21 07:23:37');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('448023354826293248',NULL,'1-超级管理员',NULL,NULL,'{\"wfId\":\"123123\",\"wfWfsj\":\"2018-05-21 18:05:04\",\"wfWfdz\":\"123123\",\"wfWfxw\":\"1211\",\"vId\":\"447529271901028352\",\"vHphm\":\"津QWQ12312\",\"wfWfjf\":13,\"wfWfje\":12,\"wfWfzt\":\"01\"}','null',40,NULL,'IllegalCtrl.save','2018-05-21 07:24:51');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('448023374677934080',NULL,'1-超级管理员',NULL,NULL,'{\"wfId\":\"123123\",\"wfWfsj\":\"2018-05-21 18:05:04\",\"wfWfdz\":\"123123\",\"wfWfxw\":\"1211\",\"vId\":\"448023374615019520\",\"vHphm\":\"津QWQ12312\",\"wfWfjf\":11,\"wfWfje\":12,\"wfWfzt\":\"01\",\"createUser\":\"1-超级管理员\",\"createTime\":\"2018-05-21 07:24:56\"}','{\"code\":200,\"message\":\"数据保存成功！\",\"success\":true}',22,NULL,'IllegalCtrl.save','2018-05-21 07:24:56');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('448025548724109312',NULL,'1-超级管理员',NULL,NULL,'{\"wfId\":\"123123\",\"wfWfsj\":\"2018-05-21 18:05:04\",\"wfWfdz\":\"123123\",\"wfWfxw\":\"1211\",\"vId\":\"448023374615019520\",\"vHphm\":\"448023374615019520\",\"wfWfjf\":11,\"wfWfje\":121,\"wfWfzt\":\"02\",\"createUser\":\"1-超级管理员\",\"createTime\":\"2018-05-21 07:24:56\",\"updateUser\":\"\",\"updateTime\":\"\"}','null',106,NULL,'IllegalCtrl.update','2018-05-21 07:33:34');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('448026353246142464',NULL,'1-超级管理员',NULL,NULL,'{\"wfId\":\"123123\",\"wfWfsj\":\"2018-05-21 18:05:04\",\"wfWfdz\":\"123123\",\"wfWfxw\":\"1211\",\"vId\":\"448023374615019520\",\"vHphm\":\"津QWQ12312\",\"wfWfjf\":11,\"wfWfje\":12,\"wfWfzt\":\"02\",\"createUser\":\"1-超级管理员\",\"createTime\":\"2018-05-21 07:24:56\",\"updateUser\":\"\",\"updateTime\":\"\"}','null',64,NULL,'IllegalCtrl.update','2018-05-21 07:36:46');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('448026446493908992',NULL,'1-超级管理员',NULL,NULL,'{\"wfId\":\"123123\",\"wfWfsj\":\"2018-05-21 18:05:04\",\"wfWfdz\":\"123123\",\"wfWfxw\":\"1211\",\"vId\":\"448023374615019520\",\"vHphm\":\"津QWQ12312\",\"wfWfjf\":11,\"wfWfje\":12,\"wfWfzt\":\"02\",\"createUser\":\"1-超级管理员\",\"createTime\":\"2018-05-21 07:24:56\",\"updateUser\":\"\",\"updateTime\":\"\"}','null',12,NULL,'IllegalCtrl.update','2018-05-21 07:37:08');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('448026656771145728',NULL,'1-超级管理员',NULL,NULL,'{\"wfId\":\"123123\",\"wfWfsj\":\"2018-05-21 18:05:04\",\"wfWfdz\":\"123123\",\"wfWfxw\":\"1211\",\"vId\":\"448023374615019520\",\"vHphm\":\"津QWQ12312\",\"wfWfjf\":11,\"wfWfje\":12,\"wfWfzt\":\"02\",\"createUser\":\"1-超级管理员\",\"createTime\":\"2018-05-21 07:24:56\",\"updateUser\":\"\",\"updateTime\":\"\"}','null',12,NULL,'IllegalCtrl.update','2018-05-21 07:37:58');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('448026995834486784',NULL,'1-超级管理员',NULL,NULL,'null','null',15,NULL,'IllegalCtrl.remove','2018-05-21 07:39:19');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('448027369186263040',NULL,'1-超级管理员',NULL,NULL,'{\"wfId\":\"123123\",\"wfWfsj\":\"2018-05-01 00:00:00\",\"wfWfdz\":\"1231\",\"wfWfxw\":\"12\",\"vId\":\"447529271901028352\",\"vHphm\":\"津QWQ12312\",\"wfWfjf\":12,\"wfWfje\":12,\"wfWfzt\":\"01\",\"createUser\":\"1-超级管理员\",\"createTime\":\"2018-05-21 07:40:48\"}','{\"code\":200,\"message\":\"数据保存成功！\",\"success\":true}',55,NULL,'IllegalCtrl.save','2018-05-21 07:40:48');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('448027404460359680',NULL,'1-超级管理员',NULL,NULL,'{\"wfId\":\"123123\",\"wfWfsj\":\"2018-05-01 00:00:00\",\"wfWfdz\":\"1231\",\"wfWfxw\":\"12\",\"vId\":\"447529271901028352\",\"vHphm\":\"津QWQ12312\",\"wfWfjf\":11,\"wfWfje\":121,\"wfWfzt\":\"02\",\"createUser\":\"1-超级管理员\",\"createTime\":\"2018-05-21 07:40:48\",\"updateUser\":\"1-超级管理员\",\"updateTime\":\"2018-05-21 07:40:57\"}','{\"code\":200,\"message\":\"数据保存成功！\",\"success\":true}',35,NULL,'IllegalCtrl.update','2018-05-21 07:40:57');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('448028141156302848',NULL,'1-超级管理员',NULL,NULL,'{\"wfId\":\"123123\",\"wfWfsj\":\"2018-05-01 08:07:06\",\"wfWfdz\":\"1231\",\"wfWfxw\":\"12\",\"vId\":\"447529271901028352\",\"vHphm\":\"津QWQ12312\",\"wfWfjf\":11,\"wfWfje\":121,\"wfWfzt\":\"02\",\"createUser\":\"1-超级管理员\",\"createTime\":\"2018-05-21 07:40:48\",\"updateUser\":\"1-超级管理员\",\"updateTime\":\"2018-05-21 07:43:52\"}','{\"code\":200,\"message\":\"数据保存成功！\",\"success\":true}',33,NULL,'IllegalCtrl.update','2018-05-21 07:43:52');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('448087821480099840',NULL,'1-超级管理员',NULL,NULL,'{\"wfId\":\"123123\",\"wfWfxw\":\"121\",\"vId\":\"447441975281451008\",\"wfWfjf\":0,\"wfWfzt\":\"01\"}','null',5,NULL,'IllegalCtrl.save','2018-05-21 11:41:01');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('448089837304545280',NULL,'1-超级管理员',NULL,NULL,'{\"wfId\":\"111\",\"wfWfxw\":\"2212\",\"vId\":\"447441975281451008\",\"wfWfjf\":0,\"wfWfzt\":\"01\"}','null',2,NULL,'IllegalCtrl.save','2018-05-21 11:49:02');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('448094569486090240',NULL,'1-超级管理员',NULL,NULL,'{\"wfId\":\"123\",\"wfWfsj\":\"2018-05-15 00:00:00\",\"wfWfdz\":\"12312\",\"wfWfxw\":\"111\",\"vId\":\"447441975281451008\",\"vHphm\":\"鄂A20102\",\"wfWfjf\":0,\"wfWfje\":100,\"wfWfzt\":\"01\"}','null',77,NULL,'IllegalCtrl.save','2018-05-21 12:07:50');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('448095249261133824',NULL,'1-超级管理员',NULL,NULL,'{\"wfId\":\"111\",\"wfWfsj\":\"2018-05-09 00:00:00\",\"wfWfxw\":\"212\",\"vId\":\"447441975281451008\",\"vHphm\":\"鄂A20102\",\"wfWfjf\":0,\"wfWfje\":0,\"wfWfzt\":\"01\",\"createUser\":\"1-超级管理员\",\"createTime\":\"2018-05-21 12:10:32\"}','{\"code\":200,\"message\":\"数据保存成功！\",\"success\":true}',106,NULL,'IllegalCtrl.save','2018-05-21 12:10:32');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('448097172089470976',NULL,'1-超级管理员',NULL,NULL,'{\"wfId\":\"111\",\"wfWfsj\":\"2018-05-09 00:00:00\",\"wfWfdz\":\"\",\"wfWfxw\":\"212\",\"vId\":\"447441975281451008\",\"vHphm\":\"鄂A20102\",\"wfWfjf\":0,\"wfWfje\":0,\"wfWfzt\":\"01\",\"createUser\":\"1-超级管理员\",\"createTime\":\"2018-05-21 12:10:32\",\"updateUser\":\"1-超级管理员\",\"updateTime\":\"2018-05-21 12:18:11\"}','{\"code\":200,\"message\":\"数据保存成功！\",\"success\":true}',124,NULL,'IllegalCtrl.update','2018-05-21 12:18:11');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('448097188526948352',NULL,'1-超级管理员',NULL,NULL,'{\"wfId\":\"111\",\"wfWfsj\":\"2018-05-09 00:00:00\",\"wfWfdz\":\"\",\"wfWfxw\":\"212\",\"vId\":\"447441975281451008\",\"vHphm\":\"鄂A20102\",\"wfWfjf\":0,\"wfWfje\":0,\"wfWfzt\":\"01\",\"createUser\":\"1-超级管理员\",\"createTime\":\"2018-05-21 12:10:32\",\"updateUser\":\"1-超级管理员\",\"updateTime\":\"2018-05-21 12:18:14\"}','{\"code\":200,\"message\":\"数据保存成功！\",\"success\":true}',48,NULL,'IllegalCtrl.update','2018-05-21 12:18:14');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('448097213529194496',NULL,'1-超级管理员',NULL,NULL,'{\"wfId\":\"111\",\"wfWfsj\":\"2018-05-09 00:00:00\",\"wfWfdz\":\"\",\"wfWfxw\":\"212\",\"vId\":\"447441975281451008\",\"vHphm\":\"鄂A20102\",\"wfWfjf\":0,\"wfWfje\":0,\"wfWfzt\":\"01\",\"createUser\":\"1-超级管理员\",\"createTime\":\"2018-05-21 12:10:32\",\"updateUser\":\"1-超级管理员\",\"updateTime\":\"2018-05-21 12:18:20\"}','{\"code\":200,\"message\":\"数据保存成功！\",\"success\":true}',51,NULL,'IllegalCtrl.update','2018-05-21 12:18:20');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('448195756835209216',NULL,'1-超级管理员',NULL,NULL,'{\"vId\":\"447529271901028352\",\"vHphm\":\"津QWQ12312\",\"vHpzl\":\"20\",\"vClph\":\"\",\"vCllx\":\"123123\",\"vCcdjrq\":\"2018-05-19\",\"vNsrq\":\"2020-05-31\",\"vSyl\":\"去问问\",\"vSyxz\":\"10\",\"vCjh\":\"\",\"vFdjh\":\"123123\",\"vZt\":\"\",\"vGsdm\":\"\",\"vGsmc\":\"\",\"vLxr\":\"446638357951283200-管理员\",\"vLxdh\":\"18602714780\",\"vBdhm\":\"\",\"createUser\":\"1-超级管理员\",\"createTime\":\"2018-05-19 22:41:33\",\"updateUser\":\"1-超级管理员\",\"updateTime\":\"2018-05-21 18:49:55\",\"lastFuelTime\":\"\"}','{\"code\":200,\"message\":\"数据保存成功！\",\"success\":true}',156,NULL,'CarCtrl.update','2018-05-21 18:49:55');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('448195785222258688',NULL,'1-超级管理员',NULL,NULL,'{\"vId\":\"447529271901028352\",\"vHphm\":\"津QWQ12312\",\"vHpzl\":\"20\",\"vClph\":\"\",\"vCllx\":\"123123\",\"vCcdjrq\":\"2018-05-19\",\"vNsrq\":\"2020-05-31\",\"vSyl\":\"去问问\",\"vSyxz\":\"10\",\"vCjh\":\"\",\"vFdjh\":\"123123\",\"vZt\":\"\",\"vGsdm\":\"\",\"vGsmc\":\"\",\"vLxr\":\"446638357951283200-管理员\",\"vLxdh\":\"18602714780\",\"vBdhm\":\"\",\"createUser\":\"1-超级管理员\",\"createTime\":\"2018-05-19 22:41:33\",\"updateUser\":\"1-超级管理员\",\"updateTime\":\"2018-05-21 18:50:02\",\"lastFuelTime\":\"\"}','{\"code\":200,\"message\":\"数据保存成功！\",\"success\":true}',35,NULL,'CarCtrl.update','2018-05-21 18:50:02');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('448196648993030144',NULL,'1-超级管理员',NULL,NULL,'{\"vId\":\"447441975281451008\",\"vHphm\":\"鄂A20102\",\"vHpzl\":\"10\",\"vClph\":\"14\",\"vCllx\":\"\",\"vCcdjrq\":\"2018-05-19\",\"vNsrq\":\"2019-05-31\",\"vSyl\":\"1的个\",\"vSyxz\":\"10\",\"vCjh\":\"\",\"vFdjh\":\"\",\"vZt\":\"\",\"vGsdm\":\"\",\"vGsmc\":\"\",\"vLxr\":\"\",\"vLxdh\":\"\",\"vBdhm\":\"\",\"createUser\":\"1-超级管理员\",\"createTime\":\"2018-05-19 16:54:39\",\"updateUser\":\"1-超级管理员\",\"updateTime\":\"2018-05-21 18:53:28\",\"lastFuelTime\":\"\"}','{\"code\":200,\"message\":\"数据保存成功！\",\"success\":true}',38,NULL,'CarCtrl.update','2018-05-21 18:53:28');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('448221152809058304',NULL,'1-超级管理员',NULL,NULL,'{\"ykId\":\"123\",\"ykFkgs\":\"123\",\"ykYe\":1000,\"createTime\":\"2018-05-21 20:30:50\"}','{\"code\":200,\"message\":\"操作成功\",\"success\":true}',34,NULL,'OilCardCtrl.save','2018-05-21 20:30:50');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('448221822551326720',NULL,'1-超级管理员',NULL,NULL,'{\"ylId\":\"448221822358388736\",\"ylCzlx\":\"20\",\"ykId\":\"123\",\"ylYlrs\":10,\"ylJe\":100,\"vId\":\"447441975281451008\",\"vHphm\":\"鄂A20102\",\"createUser\":\"1-超级管理员\",\"createTime\":\"2018-05-21 20:33:30\"}','{\"code\":200,\"message\":\"数据保存成功！\",\"success\":true}',49,NULL,'OilRecordCtrl.save','2018-05-21 20:33:30');
insert  into `sys_ptrz`(`RZ_ID`,`CZLX`,`CZR`,`DX_ID`,`DXLX`,`CS`,`JG`,`ZXSJ`,`SM`,`FF`,`CZSJ`) values ('448222200877547520',NULL,'1-超级管理员',NULL,NULL,'{\"ucId\":\"448222200781078528\",\"vId\":\"447441975281451008\",\"vHphm\":\"鄂A20102\",\"ucCcsj\":\"2018-05-01\",\"ucCcsy\":\"1231\",\"ucJyrid\":\"1\",\"ucJyr\":\"超级管理员\",\"ucYjhcsj\":\"2018-05-08\",\"ucCclcs\":122,\"createUser\":\"1-超级管理员\",\"createTime\":\"2018-05-21 20:35:00\"}','{\"code\":200,\"message\":\"数据保存成功！\",\"success\":true}',33,NULL,'UserCarCtrl.save','2018-05-21 20:35:00');

/*Table structure for table `sys_rlb` */

CREATE TABLE `sys_rlb` (
  `RQDM` varchar(8) NOT NULL COMMENT '日期代码',
  `XQ` int(11) DEFAULT NULL COMMENT '星期',
  `ZT` varchar(2) DEFAULT NULL COMMENT '状态',
  `RQ` varchar(16) DEFAULT NULL COMMENT '日期',
  PRIMARY KEY (`RQDM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='日历表\r\nSYS_RLB';

/*Data for the table `sys_rlb` */

insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1122',2,'1','2018-01-02');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1123',3,'1','2018-01-03');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1124',4,'1','2018-01-04');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1125',5,'1','2018-01-05');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1126',6,'2','2018-01-06');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1127',7,'2','2018-01-07');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1128',1,'1','2018-01-08');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1129',2,'1','2018-01-09');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1130',3,'1','2018-01-10');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1131',4,'1','2018-01-11');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1132',5,'1','2018-01-12');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1133',6,'2','2018-01-13');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1134',7,'2','2018-01-14');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1135',1,'1','2018-01-15');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1136',2,'1','2018-01-16');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1137',3,'1','2018-01-17');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1138',4,'1','2018-01-18');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1139',5,'1','2018-01-19');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1140',6,'2','2018-01-20');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1141',7,'2','2018-01-21');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1142',1,'1','2018-01-22');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1143',2,'1','2018-01-23');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1144',3,'1','2018-01-24');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1145',4,'1','2018-01-25');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1146',5,'1','2018-01-26');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1147',6,'2','2018-01-27');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1148',7,'2','2018-01-28');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1149',1,'1','2018-01-29');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1150',2,'1','2018-01-30');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1151',3,'1','2018-01-31');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1152',4,'1','2018-02-01');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1153',5,'1','2018-02-02');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1154',6,'2','2018-02-03');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1155',7,'2','2018-02-04');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1156',1,'1','2018-02-05');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1157',2,'1','2018-02-06');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1158',3,'1','2018-02-07');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1159',4,'1','2018-02-08');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1160',5,'1','2018-02-09');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1161',6,'2','2018-02-10');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1162',7,'4','2018-02-11');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1163',1,'1','2018-02-12');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1164',2,'1','2018-02-13');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1165',3,'1','2018-02-14');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1166',4,'3','2018-02-15');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1167',5,'3','2018-02-16');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1168',6,'3','2018-02-17');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1169',7,'3','2018-02-18');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1170',1,'3','2018-02-19');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1171',2,'3','2018-02-20');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1172',3,'3','2018-02-21');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1173',4,'1','2018-02-22');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1174',5,'1','2018-02-23');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1175',6,'1','2018-02-24');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1176',7,'2','2018-02-25');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1177',1,'1','2018-02-26');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1178',2,'1','2018-02-27');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1179',3,'1','2018-02-28');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1180',4,'1','2018-03-01');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1181',5,'1','2018-03-02');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1182',6,'2','2018-03-03');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1183',7,'2','2018-03-04');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1184',1,'1','2018-03-05');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1185',2,'1','2018-03-06');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1186',3,'1','2018-03-07');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1187',4,'1','2018-03-08');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1188',5,'1','2018-03-09');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1189',6,'2','2018-03-10');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1190',7,'2','2018-03-11');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1191',1,'1','2018-03-12');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1192',2,'1','2018-03-13');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1193',3,'1','2018-03-14');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1194',4,'1','2018-03-15');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1195',5,'1','2018-03-16');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1196',6,'2','2018-03-17');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1197',7,'2','2018-03-18');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1198',1,'1','2018-03-19');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1199',2,'1','2018-03-20');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1200',3,'1','2018-03-21');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1201',4,'1','2018-03-22');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1202',5,'1','2018-03-23');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1203',6,'2','2018-03-24');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1204',7,'2','2018-03-25');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1205',1,'1','2018-03-26');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1206',2,'1','2018-03-27');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1207',3,'1','2018-03-28');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1208',4,'1','2018-03-29');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1209',5,'1','2018-03-30');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1210',6,'2','2018-03-31');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1211',7,'2','2018-04-01');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1212',1,'1','2018-04-02');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1213',2,'1','2018-04-03');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1214',3,'1','2018-04-04');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1215',4,'3','2018-04-05');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1216',5,'3','2018-04-06');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1217',6,'3','2018-04-07');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1218',7,'4','2018-04-08');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1219',1,'1','2018-04-09');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1220',2,'1','2018-04-10');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1221',3,'1','2018-04-11');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1222',4,'1','2018-04-12');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1223',5,'1','2018-04-13');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1224',6,'2','2018-04-14');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1225',7,'2','2018-04-15');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1226',1,'1','2018-04-16');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1227',2,'1','2018-04-17');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1228',3,'1','2018-04-18');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1229',4,'1','2018-04-19');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1230',5,'1','2018-04-20');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1231',6,'2','2018-04-21');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1232',7,'2','2018-04-22');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1233',1,'1','2018-04-23');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1234',2,'1','2018-04-24');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1235',3,'1','2018-04-25');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1236',4,'1','2018-04-26');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1237',5,'1','2018-04-27');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1238',6,'4','2018-04-28');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1239',7,'3','2018-04-29');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1240',1,'3','2018-04-30');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1241',2,'3','2018-05-01');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1242',3,'1','2018-05-02');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1243',4,'1','2018-05-03');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1244',5,'1','2018-05-04');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1245',6,'2','2018-05-05');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1246',7,'2','2018-05-06');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1247',1,'1','2018-05-07');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1248',2,'1','2018-05-08');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1249',3,'1','2018-05-09');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1250',4,'1','2018-05-10');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1251',5,'1','2018-05-11');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1252',6,'2','2018-05-12');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1253',7,'2','2018-05-13');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1254',1,'1','2018-05-14');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1255',2,'1','2018-05-15');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1256',3,'1','2018-05-16');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1257',4,'1','2018-05-17');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1258',5,'1','2018-05-18');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1259',6,'2','2018-05-19');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1260',7,'2','2018-05-20');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1261',1,'1','2018-05-21');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1262',2,'1','2018-05-22');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1263',3,'1','2018-05-23');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1264',4,'1','2018-05-24');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1265',5,'1','2018-05-25');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1266',6,'2','2018-05-26');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1267',7,'2','2018-05-27');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1268',1,'1','2018-05-28');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1269',2,'1','2018-05-29');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1270',3,'1','2018-05-30');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1271',4,'1','2018-05-31');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1272',5,'1','2018-06-01');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1273',6,'2','2018-06-02');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1274',7,'2','2018-06-03');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1275',1,'1','2018-06-04');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1276',2,'1','2018-06-05');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1277',3,'1','2018-06-06');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1278',4,'1','2018-06-07');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1279',5,'1','2018-06-08');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1280',6,'2','2018-06-09');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1281',7,'2','2018-06-10');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1282',1,'1','2018-06-11');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1283',2,'1','2018-06-12');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1284',3,'1','2018-06-13');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1285',4,'1','2018-06-14');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1286',5,'1','2018-06-15');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1287',6,'3','2018-06-16');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1288',7,'3','2018-06-17');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1289',1,'3','2018-06-18');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1290',2,'1','2018-06-19');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1291',3,'1','2018-06-20');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1292',4,'1','2018-06-21');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1293',5,'1','2018-06-22');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1294',6,'2','2018-06-23');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1295',7,'2','2018-06-24');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1296',1,'1','2018-06-25');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1297',2,'1','2018-06-26');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1298',3,'1','2018-06-27');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1299',4,'1','2018-06-28');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1300',5,'1','2018-06-29');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1301',6,'2','2018-06-30');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1302',7,'2','2018-07-01');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1303',1,'1','2018-07-02');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1304',2,'1','2018-07-03');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1305',3,'1','2018-07-04');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1306',4,'1','2018-07-05');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1307',5,'1','2018-07-06');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1308',6,'2','2018-07-07');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1309',7,'2','2018-07-08');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1310',1,'1','2018-07-09');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1311',2,'1','2018-07-10');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1312',3,'1','2018-07-11');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1313',4,'1','2018-07-12');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1314',5,'1','2018-07-13');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1315',6,'2','2018-07-14');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1316',7,'2','2018-07-15');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1317',1,'1','2018-07-16');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1318',2,'1','2018-07-17');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1319',3,'1','2018-07-18');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1320',4,'1','2018-07-19');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1321',5,'1','2018-07-20');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1322',6,'2','2018-07-21');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1323',7,'2','2018-07-22');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1324',1,'1','2018-07-23');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1325',2,'1','2018-07-24');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1326',3,'1','2018-07-25');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1327',4,'1','2018-07-26');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1328',5,'1','2018-07-27');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1329',6,'2','2018-07-28');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1330',7,'2','2018-07-29');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1331',1,'1','2018-07-30');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1332',2,'1','2018-07-31');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1333',3,'1','2018-08-01');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1334',4,'1','2018-08-02');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1335',5,'1','2018-08-03');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1336',6,'2','2018-08-04');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1337',7,'2','2018-08-05');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1338',1,'1','2018-08-06');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1339',2,'1','2018-08-07');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1340',3,'1','2018-08-08');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1341',4,'1','2018-08-09');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1342',5,'1','2018-08-10');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1343',6,'2','2018-08-11');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1344',7,'2','2018-08-12');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1345',1,'1','2018-08-13');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1346',2,'1','2018-08-14');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1347',3,'1','2018-08-15');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1348',4,'1','2018-08-16');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1349',5,'1','2018-08-17');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1350',6,'2','2018-08-18');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1351',7,'2','2018-08-19');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1352',1,'1','2018-08-20');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1353',2,'1','2018-08-21');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1354',3,'1','2018-08-22');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1355',4,'1','2018-08-23');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1356',5,'1','2018-08-24');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1357',6,'2','2018-08-25');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1358',7,'2','2018-08-26');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1359',1,'1','2018-08-27');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1360',2,'1','2018-08-28');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1361',3,'1','2018-08-29');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1362',4,'1','2018-08-30');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1363',5,'1','2018-08-31');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1364',6,'2','2018-09-01');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1365',7,'2','2018-09-02');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1366',1,'1','2018-09-03');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1367',2,'1','2018-09-04');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1368',3,'1','2018-09-05');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1369',4,'1','2018-09-06');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1370',5,'1','2018-09-07');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1371',6,'2','2018-09-08');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1372',7,'2','2018-09-09');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1373',1,'1','2018-09-10');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1374',2,'1','2018-09-11');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1375',3,'1','2018-09-12');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1376',4,'1','2018-09-13');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1377',5,'1','2018-09-14');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1378',6,'2','2018-09-15');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1379',7,'2','2018-09-16');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1380',1,'1','2018-09-17');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1381',2,'1','2018-09-18');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1382',3,'1','2018-09-19');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1383',4,'1','2018-09-20');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1384',5,'1','2018-09-21');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1385',6,'3','2018-09-22');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1386',7,'3','2018-09-23');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1387',1,'3','2018-09-24');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1388',2,'1','2018-09-25');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1389',3,'1','2018-09-26');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1390',4,'1','2018-09-27');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1391',5,'1','2018-09-28');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1392',6,'4','2018-09-29');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1393',7,'4','2018-09-30');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1394',1,'3','2018-10-01');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1395',2,'3','2018-10-02');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1396',3,'3','2018-10-03');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1397',4,'3','2018-10-04');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1398',5,'3','2018-10-05');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1399',6,'3','2018-10-06');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1400',7,'3','2018-10-07');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1401',1,'1','2018-10-08');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1402',2,'1','2018-10-09');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1403',3,'1','2018-10-10');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1404',4,'1','2018-10-11');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1405',5,'1','2018-10-12');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1406',6,'2','2018-10-13');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1407',7,'2','2018-10-14');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1408',1,'1','2018-10-15');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1409',2,'1','2018-10-16');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1410',3,'1','2018-10-17');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1411',4,'1','2018-10-18');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1412',5,'1','2018-10-19');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1413',6,'2','2018-10-20');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1414',7,'2','2018-10-21');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1415',1,'1','2018-10-22');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1416',2,'1','2018-10-23');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1417',3,'1','2018-10-24');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1418',4,'1','2018-10-25');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1419',5,'1','2018-10-26');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1420',6,'2','2018-10-27');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1421',7,'2','2018-10-28');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1422',1,'1','2018-10-29');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1423',2,'1','2018-10-30');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1424',3,'1','2018-10-31');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1425',4,'1','2018-11-01');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1426',5,'1','2018-11-02');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1427',6,'2','2018-11-03');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1428',7,'2','2018-11-04');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1429',1,'1','2018-11-05');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1430',2,'1','2018-11-06');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1431',3,'1','2018-11-07');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1432',4,'1','2018-11-08');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1433',5,'1','2018-11-09');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1434',6,'2','2018-11-10');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1435',7,'2','2018-11-11');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1436',1,'1','2018-11-12');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1437',2,'1','2018-11-13');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1438',3,'1','2018-11-14');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1439',4,'1','2018-11-15');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1440',5,'1','2018-11-16');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1441',6,'2','2018-11-17');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1442',7,'2','2018-11-18');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1443',1,'1','2018-11-19');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1444',2,'1','2018-11-20');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1445',3,'1','2018-11-21');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1446',4,'1','2018-11-22');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1447',5,'1','2018-11-23');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1448',6,'2','2018-11-24');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1449',7,'2','2018-11-25');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1450',1,'1','2018-11-26');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1451',2,'1','2018-11-27');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1452',3,'1','2018-11-28');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1453',4,'1','2018-11-29');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1454',5,'1','2018-11-30');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1455',6,'2','2018-12-01');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1456',7,'2','2018-12-02');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1457',1,'1','2018-12-03');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1458',2,'1','2018-12-04');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1459',3,'1','2018-12-05');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1460',4,'1','2018-12-06');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1461',5,'1','2018-12-07');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1462',6,'2','2018-12-08');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1463',7,'2','2018-12-09');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1464',1,'1','2018-12-10');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1465',2,'1','2018-12-11');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1466',3,'1','2018-12-12');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1467',4,'1','2018-12-13');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1468',5,'1','2018-12-14');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1469',6,'2','2018-12-15');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1470',7,'2','2018-12-16');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1471',1,'1','2018-12-17');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1472',2,'1','2018-12-18');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1473',3,'1','2018-12-19');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1474',4,'1','2018-12-20');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1475',5,'1','2018-12-21');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1476',6,'2','2018-12-22');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1477',7,'2','2018-12-23');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1478',1,'1','2018-12-24');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1479',2,'1','2018-12-25');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1480',3,'1','2018-12-26');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1481',4,'1','2018-12-27');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1482',5,'1','2018-12-28');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1483',6,'2','2018-12-29');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1484',7,'2','2018-12-30');
insert  into `sys_rlb`(`RQDM`,`XQ`,`ZT`,`RQ`) values ('1485',1,'1','2018-12-31');

/*Table structure for table `sys_yh_js` */

CREATE TABLE `sys_yh_js` (
  `YHJS_ID` varchar(32) NOT NULL COMMENT '用户角色关联表id',
  `YH_ID` varchar(32) DEFAULT NULL COMMENT '用户id',
  `JS_ID` varchar(32) DEFAULT NULL COMMENT '角色id',
  `CJR` varchar(64) DEFAULT NULL COMMENT '创建人',
  `CJSJ` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`YHJS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户角色关联表';

/*Data for the table `sys_yh_js` */

insert  into `sys_yh_js`(`YHJS_ID`,`YH_ID`,`JS_ID`,`CJR`,`CJSJ`) values ('439027466611195904','439027207088635904','000000','1-超级管理员',NULL);
insert  into `sys_yh_js`(`YHJS_ID`,`YH_ID`,`JS_ID`,`CJR`,`CJSJ`) values ('439148685494845440','439094501680611328','000000','438108538678542336-测试001',NULL);
insert  into `sys_yh_js`(`YHJS_ID`,`YH_ID`,`JS_ID`,`CJR`,`CJSJ`) values ('439202646960635904','438108538678542336','000000','1-超级管理员',NULL);
insert  into `sys_yh_js`(`YHJS_ID`,`YH_ID`,`JS_ID`,`CJR`,`CJSJ`) values ('442809099038490624','442807867683110912','000000','1-超级管理员',NULL);
insert  into `sys_yh_js`(`YHJS_ID`,`YH_ID`,`JS_ID`,`CJR`,`CJSJ`) values ('443385639795163136','443385525315829760','000000','1-超级管理员',NULL);
insert  into `sys_yh_js`(`YHJS_ID`,`YH_ID`,`JS_ID`,`CJR`,`CJSJ`) values ('446704092291530752','446638357951283200','000000','1-超级管理员','2018-05-17 16:02:34');

/*Table structure for table `sys_zdlm` */

CREATE TABLE `sys_zdlm` (
  `LMDM` varchar(32) NOT NULL COMMENT '类目代码',
  `LMMC` varchar(32) DEFAULT NULL COMMENT '类目名称',
  `CJR` varchar(64) DEFAULT NULL COMMENT '创建人',
  `XGSJ` varchar(32) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '修改时间',
  `XGR` varchar(64) DEFAULT NULL COMMENT '修改人',
  `QZ` double(32,0) DEFAULT NULL COMMENT '权重',
  `CJSJ` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`LMDM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='平台字典类目表(字典类别)\r\n\r\nSYS_ZDLM';

/*Data for the table `sys_zdlm` */

insert  into `sys_zdlm`(`LMDM`,`LMMC`,`CJR`,`XGSJ`,`XGR`,`QZ`,`CJSJ`) values ('BXGSXX','保险公司','1-超级管理员','0000-00-00 00:00:00',NULL,NULL,'2018-05-20 16:35:31');
insert  into `sys_zdlm`(`LMDM`,`LMMC`,`CJR`,`XGSJ`,`XGR`,`QZ`,`CJSJ`) values ('BXSYXZ','商业险种','1-超级管理员','0000-00-00 00:00:00',NULL,NULL,'2018-05-20 16:17:05');
insert  into `sys_zdlm`(`LMDM`,`LMMC`,`CJR`,`XGSJ`,`XGR`,`QZ`,`CJSJ`) values ('HPZL','车辆类型',NULL,'0000-00-00 00:00:00',NULL,NULL,NULL);
insert  into `sys_zdlm`(`LMDM`,`LMMC`,`CJR`,`XGSJ`,`XGR`,`QZ`,`CJSJ`) values ('SYXZ','车辆使用性质','1-超级管理员','0000-00-00 00:00:00',NULL,NULL,'2018-05-19 15:29:06');
insert  into `sys_zdlm`(`LMDM`,`LMMC`,`CJR`,`XGSJ`,`XGR`,`QZ`,`CJSJ`) values ('WFZT','违法处理状态','1-超级管理员','0000-00-00 00:00:00',NULL,NULL,'2018-05-21 07:19:27');
insert  into `sys_zdlm`(`LMDM`,`LMMC`,`CJR`,`XGSJ`,`XGR`,`QZ`,`CJSJ`) values ('ZDCLK0002','用户状态','1','2018-05-16 13:16:59','',2,NULL);
insert  into `sys_zdlm`(`LMDM`,`LMMC`,`CJR`,`XGSJ`,`XGR`,`QZ`,`CJSJ`) values ('ZDCLK0003','用户类型','1','2018-05-16 13:16:59','',3,NULL);
insert  into `sys_zdlm`(`LMDM`,`LMMC`,`CJR`,`XGSJ`,`XGR`,`QZ`,`CJSJ`) values ('ZDCLK0004','角色类型','1','2018-05-16 13:16:59','',4,NULL);
insert  into `sys_zdlm`(`LMDM`,`LMMC`,`CJR`,`XGSJ`,`XGR`,`QZ`,`CJSJ`) values ('ZDCLK0005','角色状态','1','2018-05-16 13:16:59','',5,NULL);
insert  into `sys_zdlm`(`LMDM`,`LMMC`,`CJR`,`XGSJ`,`XGR`,`QZ`,`CJSJ`) values ('ZDCLK0006','服务状态','1','2018-05-16 13:16:59','',6,NULL);
insert  into `sys_zdlm`(`LMDM`,`LMMC`,`CJR`,`XGSJ`,`XGR`,`QZ`,`CJSJ`) values ('ZDCLK0007','功能状态','1','2018-05-16 13:16:59','',7,NULL);
insert  into `sys_zdlm`(`LMDM`,`LMMC`,`CJR`,`XGSJ`,`XGR`,`QZ`,`CJSJ`) values ('ZDCLK0008','机构状态','1','2018-05-16 13:16:59','',8,NULL);
insert  into `sys_zdlm`(`LMDM`,`LMMC`,`CJR`,`XGSJ`,`XGR`,`QZ`,`CJSJ`) values ('ZDCLK0011','日志类型','1','2018-05-16 13:16:59','',11,NULL);
insert  into `sys_zdlm`(`LMDM`,`LMMC`,`CJR`,`XGSJ`,`XGR`,`QZ`,`CJSJ`) values ('ZDCLK0014','文件类型','1','2018-05-16 13:16:59','',14,NULL);
insert  into `sys_zdlm`(`LMDM`,`LMMC`,`CJR`,`XGSJ`,`XGR`,`QZ`,`CJSJ`) values ('ZDCLK0015','接口状态','1','2018-05-16 13:16:59','',15,NULL);
insert  into `sys_zdlm`(`LMDM`,`LMMC`,`CJR`,`XGSJ`,`XGR`,`QZ`,`CJSJ`) values ('ZDCLK0030','文件类型','1','2018-05-16 13:16:59','',30,NULL);
insert  into `sys_zdlm`(`LMDM`,`LMMC`,`CJR`,`XGSJ`,`XGR`,`QZ`,`CJSJ`) values ('ZDCLK0035','日历状态','1','2018-05-16 13:16:59','',35,NULL);
insert  into `sys_zdlm`(`LMDM`,`LMMC`,`CJR`,`XGSJ`,`XGR`,`QZ`,`CJSJ`) values ('ZJCX','准驾车型','1-超级管理员','0000-00-00 00:00:00',NULL,NULL,'2018-05-17 11:10:31');

/*Table structure for table `sys_zdxm` */

CREATE TABLE `sys_zdxm` (
  `ZD_ID` varchar(32) NOT NULL COMMENT '字典id',
  `ZDLMDM` varchar(32) DEFAULT NULL COMMENT '字典类目代码',
  `ZDDM` varchar(32) DEFAULT NULL COMMENT '字典代码',
  `ZDMC` varchar(32) DEFAULT NULL COMMENT '字典名称',
  `QZ` float(32,0) DEFAULT NULL COMMENT '权重',
  `CJR` varchar(64) DEFAULT NULL COMMENT '创建人',
  `BY1` varchar(32) DEFAULT NULL COMMENT '备用1',
  `BY2` varchar(32) DEFAULT NULL COMMENT '备用2',
  `BY3` varchar(32) DEFAULT NULL COMMENT '备用3',
  `CJSJ` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`ZD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='平台字典表\r\nSYS_ZDXM';

/*Data for the table `sys_zdxm` */

insert  into `sys_zdxm`(`ZD_ID`,`ZDLMDM`,`ZDDM`,`ZDMC`,`QZ`,`CJR`,`BY1`,`BY2`,`BY3`,`CJSJ`) values ('442098297344098304','ZDCLK0004','20','驾驶员',NULL,'1-超级管理员','','','',NULL);
insert  into `sys_zdxm`(`ZD_ID`,`ZDLMDM`,`ZDDM`,`ZDMC`,`QZ`,`CJR`,`BY1`,`BY2`,`BY3`,`CJSJ`) values ('442098412624543744','ZDCLK0004','30','队长',NULL,'1-超级管理员','','','',NULL);
insert  into `sys_zdxm`(`ZD_ID`,`ZDLMDM`,`ZDDM`,`ZDMC`,`QZ`,`CJR`,`BY1`,`BY2`,`BY3`,`CJSJ`) values ('446325412138582016','耍流氓','00','刷',NULL,'1-超级管理员',NULL,NULL,NULL,'2018-05-16 14:57:50');
insert  into `sys_zdxm`(`ZD_ID`,`ZDLMDM`,`ZDDM`,`ZDMC`,`QZ`,`CJR`,`BY1`,`BY2`,`BY3`,`CJSJ`) values ('446630637202309120','ZJCX','A1','A1',NULL,'1-超级管理员',NULL,NULL,NULL,'2018-05-17 11:10:41');
insert  into `sys_zdxm`(`ZD_ID`,`ZDLMDM`,`ZDDM`,`ZDMC`,`QZ`,`CJR`,`BY1`,`BY2`,`BY3`,`CJSJ`) values ('446630655825018880','ZJCX','A2','A2',NULL,'1-超级管理员',NULL,NULL,NULL,'2018-05-17 11:10:46');
insert  into `sys_zdxm`(`ZD_ID`,`ZDLMDM`,`ZDDM`,`ZDMC`,`QZ`,`CJR`,`BY1`,`BY2`,`BY3`,`CJSJ`) values ('446630673847943168','ZJCX','A3','A3',NULL,'1-超级管理员',NULL,NULL,NULL,'2018-05-17 11:10:50');
insert  into `sys_zdxm`(`ZD_ID`,`ZDLMDM`,`ZDDM`,`ZDMC`,`QZ`,`CJR`,`BY1`,`BY2`,`BY3`,`CJSJ`) values ('446630695662518272','ZJCX','B1','B1',NULL,'1-超级管理员',NULL,NULL,NULL,'2018-05-17 11:10:55');
insert  into `sys_zdxm`(`ZD_ID`,`ZDLMDM`,`ZDDM`,`ZDMC`,`QZ`,`CJR`,`BY1`,`BY2`,`BY3`,`CJSJ`) values ('446630723923738624','ZJCX','B2','B2',NULL,'1-超级管理员',NULL,NULL,NULL,'2018-05-17 11:11:02');
insert  into `sys_zdxm`(`ZD_ID`,`ZDLMDM`,`ZDDM`,`ZDMC`,`QZ`,`CJR`,`BY1`,`BY2`,`BY3`,`CJSJ`) values ('446630740902281216','ZJCX','B3','B3',NULL,'1-超级管理员',NULL,NULL,NULL,'2018-05-17 11:11:06');
insert  into `sys_zdxm`(`ZD_ID`,`ZDLMDM`,`ZDDM`,`ZDMC`,`QZ`,`CJR`,`BY1`,`BY2`,`BY3`,`CJSJ`) values ('446630756886773760','ZJCX','C1','C1',NULL,'1-超级管理员',NULL,NULL,NULL,'2018-05-17 11:11:10');
insert  into `sys_zdxm`(`ZD_ID`,`ZDLMDM`,`ZDDM`,`ZDMC`,`QZ`,`CJR`,`BY1`,`BY2`,`BY3`,`CJSJ`) values ('446630770249826304','ZJCX','C2','C2',NULL,'1-超级管理员',NULL,NULL,NULL,'2018-05-17 11:11:13');
insert  into `sys_zdxm`(`ZD_ID`,`ZDLMDM`,`ZDDM`,`ZDMC`,`QZ`,`CJR`,`BY1`,`BY2`,`BY3`,`CJSJ`) values ('447420501355134976','SYXZ','10','非营运机动车',NULL,'1-超级管理员',NULL,NULL,NULL,'2018-05-19 15:29:20');
insert  into `sys_zdxm`(`ZD_ID`,`ZDLMDM`,`ZDDM`,`ZDMC`,`QZ`,`CJR`,`BY1`,`BY2`,`BY3`,`CJSJ`) values ('447420533177319424','SYXZ','20','营运机动车',NULL,'1-超级管理员',NULL,NULL,NULL,'2018-05-19 15:29:27');
insert  into `sys_zdxm`(`ZD_ID`,`ZDLMDM`,`ZDDM`,`ZDMC`,`QZ`,`CJR`,`BY1`,`BY2`,`BY3`,`CJSJ`) values ('447794992287580160','BXSYXZ','01','三者',NULL,'1-超级管理员',NULL,NULL,NULL,'2018-05-20 16:17:25');
insert  into `sys_zdxm`(`ZD_ID`,`ZDLMDM`,`ZDDM`,`ZDMC`,`QZ`,`CJR`,`BY1`,`BY2`,`BY3`,`CJSJ`) values ('447795016333524992','BXSYXZ','02','玻璃',NULL,'1-超级管理员',NULL,NULL,NULL,'2018-05-20 16:17:31');
insert  into `sys_zdxm`(`ZD_ID`,`ZDLMDM`,`ZDDM`,`ZDMC`,`QZ`,`CJR`,`BY1`,`BY2`,`BY3`,`CJSJ`) values ('447795046268272640','BXSYXZ','03','盗抢',NULL,'1-超级管理员',NULL,NULL,NULL,'2018-05-20 16:17:38');
insert  into `sys_zdxm`(`ZD_ID`,`ZDLMDM`,`ZDDM`,`ZDMC`,`QZ`,`CJR`,`BY1`,`BY2`,`BY3`,`CJSJ`) values ('447795084159614976','BXSYXZ','04','涉水',NULL,'1-超级管理员',NULL,NULL,NULL,'2018-05-20 16:17:47');
insert  into `sys_zdxm`(`ZD_ID`,`ZDLMDM`,`ZDDM`,`ZDMC`,`QZ`,`CJR`,`BY1`,`BY2`,`BY3`,`CJSJ`) values ('447799590192676864','BXGSXX','95501','中国人保',NULL,'1-超级管理员',NULL,NULL,NULL,'2018-05-20 16:35:42');
insert  into `sys_zdxm`(`ZD_ID`,`ZDLMDM`,`ZDDM`,`ZDMC`,`QZ`,`CJR`,`BY1`,`BY2`,`BY3`,`CJSJ`) values ('447799637852553216','BXGSXX','95502','中国平安',NULL,'1-超级管理员',NULL,NULL,NULL,'2018-05-20 16:35:53');
insert  into `sys_zdxm`(`ZD_ID`,`ZDLMDM`,`ZDDM`,`ZDMC`,`QZ`,`CJR`,`BY1`,`BY2`,`BY3`,`CJSJ`) values ('447799673097289728','BXGSXX','95503','中国人寿',NULL,'1-超级管理员',NULL,NULL,NULL,'2018-05-20 16:36:01');
insert  into `sys_zdxm`(`ZD_ID`,`ZDLMDM`,`ZDDM`,`ZDMC`,`QZ`,`CJR`,`BY1`,`BY2`,`BY3`,`CJSJ`) values ('448022058031382528','WFZT','01','未处理',NULL,'1-超级管理员',NULL,NULL,NULL,'2018-05-21 07:19:42');
insert  into `sys_zdxm`(`ZD_ID`,`ZDLMDM`,`ZDDM`,`ZDMC`,`QZ`,`CJR`,`BY1`,`BY2`,`BY3`,`CJSJ`) values ('448022082354151424','WFZT','02','已处理',NULL,'1-超级管理员',NULL,NULL,NULL,'2018-05-21 07:19:48');
insert  into `sys_zdxm`(`ZD_ID`,`ZDLMDM`,`ZDDM`,`ZDMC`,`QZ`,`CJR`,`BY1`,`BY2`,`BY3`,`CJSJ`) values ('HPZL000000001','HPZL','10','大型汽车',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `sys_zdxm`(`ZD_ID`,`ZDLMDM`,`ZDDM`,`ZDMC`,`QZ`,`CJR`,`BY1`,`BY2`,`BY3`,`CJSJ`) values ('HPZL000000002','HPZL','20','小型汽车',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `sys_zdxm`(`ZD_ID`,`ZDLMDM`,`ZDDM`,`ZDMC`,`QZ`,`CJR`,`BY1`,`BY2`,`BY3`,`CJSJ`) values ('HPZL000000003','HPZL','30','中型汽车',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `sys_zdxm`(`ZD_ID`,`ZDLMDM`,`ZDDM`,`ZDMC`,`QZ`,`CJR`,`BY1`,`BY2`,`BY3`,`CJSJ`) values ('HPZL000000004','HPZL','40','教练汽车',NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `sys_zdxm`(`ZD_ID`,`ZDLMDM`,`ZDDM`,`ZDMC`,`QZ`,`CJR`,`BY1`,`BY2`,`BY3`,`CJSJ`) values ('ZDCLK00020001','ZDCLK0002','00','正常',NULL,'1-超级管理员','','','',NULL);
insert  into `sys_zdxm`(`ZD_ID`,`ZDLMDM`,`ZDDM`,`ZDMC`,`QZ`,`CJR`,`BY1`,`BY2`,`BY3`,`CJSJ`) values ('ZDCLK00030001','ZDCLK0003','00','管理员',NULL,'1-超级管理员','','','',NULL);
insert  into `sys_zdxm`(`ZD_ID`,`ZDLMDM`,`ZDDM`,`ZDMC`,`QZ`,`CJR`,`BY1`,`BY2`,`BY3`,`CJSJ`) values ('ZDCLK00030002','ZDCLK0003','10','普通用户',NULL,'1-超级管理员','','','',NULL);
insert  into `sys_zdxm`(`ZD_ID`,`ZDLMDM`,`ZDDM`,`ZDMC`,`QZ`,`CJR`,`BY1`,`BY2`,`BY3`,`CJSJ`) values ('ZDCLK00040001','ZDCLK0004','00','管理员',NULL,'1-超级管理员','','','',NULL);
insert  into `sys_zdxm`(`ZD_ID`,`ZDLMDM`,`ZDDM`,`ZDMC`,`QZ`,`CJR`,`BY1`,`BY2`,`BY3`,`CJSJ`) values ('ZDCLK00040002','ZDCLK0004','10','普通用户',NULL,'1-超级管理员','','','',NULL);
insert  into `sys_zdxm`(`ZD_ID`,`ZDLMDM`,`ZDDM`,`ZDMC`,`QZ`,`CJR`,`BY1`,`BY2`,`BY3`,`CJSJ`) values ('ZDCLK00050001','ZDCLK0005','00','正常',NULL,'1-超级管理员','','','',NULL);
insert  into `sys_zdxm`(`ZD_ID`,`ZDLMDM`,`ZDDM`,`ZDMC`,`QZ`,`CJR`,`BY1`,`BY2`,`BY3`,`CJSJ`) values ('ZDCLK00050002','ZDCLK0005','10','停用',NULL,'1-超级管理员','','','',NULL);
insert  into `sys_zdxm`(`ZD_ID`,`ZDLMDM`,`ZDDM`,`ZDMC`,`QZ`,`CJR`,`BY1`,`BY2`,`BY3`,`CJSJ`) values ('ZDCLK00060001','ZDCLK0006','00','正常',NULL,'1-超级管理员','','','',NULL);
insert  into `sys_zdxm`(`ZD_ID`,`ZDLMDM`,`ZDDM`,`ZDMC`,`QZ`,`CJR`,`BY1`,`BY2`,`BY3`,`CJSJ`) values ('ZDCLK00060002','ZDCLK0006','10','停用',NULL,'1-超级管理员','','','',NULL);
insert  into `sys_zdxm`(`ZD_ID`,`ZDLMDM`,`ZDDM`,`ZDMC`,`QZ`,`CJR`,`BY1`,`BY2`,`BY3`,`CJSJ`) values ('ZDCLK00070001','ZDCLK0007','00','正常',NULL,'1-超级管理员','','','',NULL);
insert  into `sys_zdxm`(`ZD_ID`,`ZDLMDM`,`ZDDM`,`ZDMC`,`QZ`,`CJR`,`BY1`,`BY2`,`BY3`,`CJSJ`) values ('ZDCLK00070002','ZDCLK0007','10','停用',NULL,'1-超级管理员','','','',NULL);
insert  into `sys_zdxm`(`ZD_ID`,`ZDLMDM`,`ZDDM`,`ZDMC`,`QZ`,`CJR`,`BY1`,`BY2`,`BY3`,`CJSJ`) values ('ZDCLK00080001','ZDCLK0008','00','正常',NULL,'1-超级管理员','','','',NULL);
insert  into `sys_zdxm`(`ZD_ID`,`ZDLMDM`,`ZDDM`,`ZDMC`,`QZ`,`CJR`,`BY1`,`BY2`,`BY3`,`CJSJ`) values ('ZDCLK00080002','ZDCLK0008','10','停用',NULL,'1-超级管理员','','','',NULL);
insert  into `sys_zdxm`(`ZD_ID`,`ZDLMDM`,`ZDDM`,`ZDMC`,`QZ`,`CJR`,`BY1`,`BY2`,`BY3`,`CJSJ`) values ('ZDCLK00110001','ZDCLK0011','00','新增',NULL,'1-超级管理员','','','',NULL);
insert  into `sys_zdxm`(`ZD_ID`,`ZDLMDM`,`ZDDM`,`ZDMC`,`QZ`,`CJR`,`BY1`,`BY2`,`BY3`,`CJSJ`) values ('ZDCLK00110002','ZDCLK0011','10','修改',NULL,'1-超级管理员','','','',NULL);
insert  into `sys_zdxm`(`ZD_ID`,`ZDLMDM`,`ZDDM`,`ZDMC`,`QZ`,`CJR`,`BY1`,`BY2`,`BY3`,`CJSJ`) values ('ZDCLK00110003','ZDCLK0011','20','删除',NULL,'1-超级管理员','','','',NULL);
insert  into `sys_zdxm`(`ZD_ID`,`ZDLMDM`,`ZDDM`,`ZDMC`,`QZ`,`CJR`,`BY1`,`BY2`,`BY3`,`CJSJ`) values ('ZDCLK00140001','ZDCLK0014','00','视频',NULL,'1-超级管理员','','','',NULL);
insert  into `sys_zdxm`(`ZD_ID`,`ZDLMDM`,`ZDDM`,`ZDMC`,`QZ`,`CJR`,`BY1`,`BY2`,`BY3`,`CJSJ`) values ('ZDCLK00140002','ZDCLK0014','10','图片',NULL,'1-超级管理员','','','',NULL);
insert  into `sys_zdxm`(`ZD_ID`,`ZDLMDM`,`ZDDM`,`ZDMC`,`QZ`,`CJR`,`BY1`,`BY2`,`BY3`,`CJSJ`) values ('ZDCLK00150001','ZDCLK0015','00','正常',NULL,'1-超级管理员','','','',NULL);
insert  into `sys_zdxm`(`ZD_ID`,`ZDLMDM`,`ZDDM`,`ZDMC`,`QZ`,`CJR`,`BY1`,`BY2`,`BY3`,`CJSJ`) values ('ZDCLK00150002','ZDCLK0015','10','停用',NULL,'1-超级管理员','','','',NULL);
insert  into `sys_zdxm`(`ZD_ID`,`ZDLMDM`,`ZDDM`,`ZDMC`,`QZ`,`CJR`,`BY1`,`BY2`,`BY3`,`CJSJ`) values ('ZDCLK00300001','ZDCLK0030','00','视频',NULL,'1-超级管理员','','','',NULL);
insert  into `sys_zdxm`(`ZD_ID`,`ZDLMDM`,`ZDDM`,`ZDMC`,`QZ`,`CJR`,`BY1`,`BY2`,`BY3`,`CJSJ`) values ('ZDCLK00300002','ZDCLK0030','10','图片',NULL,'1-超级管理员','','','',NULL);
insert  into `sys_zdxm`(`ZD_ID`,`ZDLMDM`,`ZDDM`,`ZDMC`,`QZ`,`CJR`,`BY1`,`BY2`,`BY3`,`CJSJ`) values ('ZDCLK00350001','ZDCLK0035','10','正常',NULL,'1-超级管理员','','','',NULL);
insert  into `sys_zdxm`(`ZD_ID`,`ZDLMDM`,`ZDDM`,`ZDMC`,`QZ`,`CJR`,`BY1`,`BY2`,`BY3`,`CJSJ`) values ('ZDCLK00350002','ZDCLK0035','20','放假',NULL,'1-超级管理员','','','',NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
