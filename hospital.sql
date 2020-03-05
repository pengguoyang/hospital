/*
SQLyog 企业版 - MySQL GUI v8.14 
MySQL - 5.6.23-log : Database - hospital
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`hospital` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `hospital`;

/*Table structure for table `bed` */

DROP TABLE IF EXISTS `bed`;

CREATE TABLE `bed` (
  `bedid` int(10) NOT NULL AUTO_INCREMENT,
  `wardid` int(10) DEFAULT NULL,
  `bednumber` int(10) DEFAULT NULL,
  `patid` int(10) DEFAULT NULL,
  `inputtime` date DEFAULT NULL,
  `state` tinyint(1) DEFAULT '1' COMMENT '1代表可用，0代表已被占用',
  PRIMARY KEY (`bedid`),
  KEY `FK_bed_ward` (`wardid`),
  KEY `FK_bed_pat` (`patid`),
  CONSTRAINT `FK_bed_pat` FOREIGN KEY (`patid`) REFERENCES `patient` (`patid`),
  CONSTRAINT `FK_bed_ward` FOREIGN KEY (`wardid`) REFERENCES `ward` (`wardid`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

/*Data for the table `bed` */

insert  into `bed`(`bedid`,`wardid`,`bednumber`,`patid`,`inputtime`,`state`) values (1,1,1001,NULL,NULL,1),(2,1,1002,NULL,NULL,1),(3,2,1003,9,'2020-01-16',0),(4,2,1004,NULL,NULL,1),(5,2,1005,NULL,NULL,1),(6,2,1006,NULL,NULL,1),(7,3,1007,NULL,NULL,1),(8,4,1008,NULL,NULL,1),(9,4,1009,NULL,NULL,1),(10,5,1010,NULL,NULL,1),(11,5,1011,NULL,NULL,1),(12,5,1012,NULL,NULL,1),(13,5,1013,NULL,NULL,1),(14,6,2014,NULL,NULL,1),(15,7,2015,NULL,NULL,1),(16,7,2016,NULL,NULL,1),(17,8,2017,NULL,NULL,1),(18,8,2018,NULL,NULL,1),(19,8,2019,NULL,NULL,1),(20,8,2020,NULL,NULL,1),(21,9,2021,NULL,NULL,1),(23,10,3001,NULL,NULL,1),(24,10,3002,NULL,NULL,1);

/*Table structure for table `department` */

DROP TABLE IF EXISTS `department`;

CREATE TABLE `department` (
  `depid` int(10) NOT NULL AUTO_INCREMENT,
  `depname` varchar(20) DEFAULT NULL,
  `deppaper` varchar(100) DEFAULT NULL COMMENT '科室简述',
  PRIMARY KEY (`depid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

/*Data for the table `department` */

insert  into `department`(`depid`,`depname`,`deppaper`) values (1,'儿科','治疗儿童病情'),(2,'急诊','处理紧急病情'),(3,'骨科','治疗骨科相关疾病');

/*Table structure for table `drug` */

DROP TABLE IF EXISTS `drug`;

CREATE TABLE `drug` (
  `drugid` int(10) NOT NULL AUTO_INCREMENT,
  `drugname` varchar(20) DEFAULT NULL,
  `drugbrand` varchar(20) DEFAULT NULL,
  `drugnote` varchar(100) DEFAULT NULL COMMENT '备注',
  `drugtype` varchar(10) DEFAULT NULL COMMENT '药品类型',
  `drugpay` int(10) DEFAULT NULL COMMENT '药品售价',
  PRIMARY KEY (`drugid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

/*Data for the table `drug` */

insert  into `drug`(`drugid`,`drugname`,`drugbrand`,`drugnote`,`drugtype`,`drugpay`) values (1,'青霉素','万邦医药','肾功能损害者慎用','抗菌素',20),(2,'三九感冒灵','三九医药',NULL,'感冒药',30),(3,'布洛芬','益佰医药','不能用量过多','止痛药',40),(4,'氨基糖苷类','广东医药','仅用于口服和局部外用','抗生素',50),(5,'利多卡因','广东医药','运动员慎用','麻醉药',40),(6,'伊宁曼','广州医药','每日3次','减肥药',40);

/*Table structure for table `live` */

DROP TABLE IF EXISTS `live`;

CREATE TABLE `live` (
  `liveid` int(10) NOT NULL AUTO_INCREMENT,
  `bedid` int(10) DEFAULT NULL,
  `patid` int(10) DEFAULT NULL,
  `inputtime` date DEFAULT NULL,
  `outtime` date DEFAULT NULL,
  `pay` int(10) DEFAULT NULL COMMENT '住院总金额',
  PRIMARY KEY (`liveid`),
  KEY `FK_live_bed` (`bedid`),
  KEY `FK_live_pat` (`patid`),
  CONSTRAINT `FK_live_bed` FOREIGN KEY (`bedid`) REFERENCES `bed` (`bedid`),
  CONSTRAINT `FK_live_pat` FOREIGN KEY (`patid`) REFERENCES `patient` (`patid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

/*Data for the table `live` */

insert  into `live`(`liveid`,`bedid`,`patid`,`inputtime`,`outtime`,`pay`) values (1,4,2,'2020-01-13','2020-01-16',120),(2,2,9,'2020-01-15','2020-01-16',100),(3,3,9,'2020-01-16',NULL,NULL),(4,1,2,'2020-01-16','2020-01-16',100);

/*Table structure for table `patient` */

DROP TABLE IF EXISTS `patient`;

CREATE TABLE `patient` (
  `patid` int(10) NOT NULL AUTO_INCREMENT,
  `patname` varchar(20) DEFAULT NULL,
  `patsex` varchar(5) DEFAULT NULL,
  `patage` int(5) DEFAULT NULL,
  `patphone` varchar(11) DEFAULT NULL,
  `patcard` varchar(18) DEFAULT NULL,
  `familyname` varchar(10) DEFAULT NULL,
  `familyphone` varchar(11) DEFAULT NULL,
  `patbirth` date DEFAULT NULL,
  PRIMARY KEY (`patid`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

/*Data for the table `patient` */

insert  into `patient`(`patid`,`patname`,`patsex`,`patage`,`patphone`,`patcard`,`familyname`,`familyphone`,`patbirth`) values (1,'小白','男',19,'17875306029','452306132562347895',NULL,NULL,'2001-04-01'),(2,'陈生','男',10,'17875306021','452306132562347896','陈先生','17894264242','2010-06-09'),(7,'小黄','男',22,'17875306256','452556562525725727',NULL,NULL,'1998-04-06'),(9,'陈小黑','男',18,'17875306029','452306132562456121','陈大黑','17856320007','2019-12-30'),(10,'李华','男',18,'17875306029','452306132561234567',NULL,NULL,'2002-07-17'),(11,'大白','男',12,'17875463985','452306132562347953',NULL,NULL,'2008-07-15'),(12,'江建','男',20,'17812346532','440583199803269456',NULL,NULL,'2000-05-15'),(13,'余甜','女',32,'17872828282','153168494666666623',NULL,NULL,'1988-02-18'),(14,'余显','男',26,'15675306029','455436232562456121',NULL,NULL,'1994-07-19');

/*Table structure for table `prescription` */

DROP TABLE IF EXISTS `prescription`;

CREATE TABLE `prescription` (
  `preid` int(10) NOT NULL AUTO_INCREMENT,
  `predate` date DEFAULT NULL,
  `recid` int(10) DEFAULT NULL COMMENT '病历编号',
  `isget` tinyint(1) DEFAULT '0' COMMENT '1表示已取，0表示未取',
  PRIMARY KEY (`preid`),
  KEY `FK_prescription_rec` (`recid`),
  CONSTRAINT `FK_prescription_rec` FOREIGN KEY (`recid`) REFERENCES `record` (`recid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

/*Data for the table `prescription` */

insert  into `prescription`(`preid`,`predate`,`recid`,`isget`) values (7,'2020-01-13',7,1),(8,'2020-01-15',8,0),(9,'2020-01-15',9,0),(10,'2020-01-28',10,0);

/*Table structure for table `prescriptiondetail` */

DROP TABLE IF EXISTS `prescriptiondetail`;

CREATE TABLE `prescriptiondetail` (
  `detid` int(10) NOT NULL AUTO_INCREMENT,
  `drugid` int(10) DEFAULT NULL,
  `drugnumber` int(10) DEFAULT NULL,
  `preid` int(10) DEFAULT NULL,
  `detprice` int(10) DEFAULT NULL COMMENT '单项药品总价格',
  `stoid` int(10) DEFAULT NULL COMMENT '对应库存id',
  PRIMARY KEY (`detid`),
  KEY `FK_prescriptiondetail_drug` (`drugid`),
  KEY `FK_prescriptiondetail_pre` (`preid`),
  KEY `FK_prescriptiondetail_stoid` (`stoid`),
  CONSTRAINT `FK_prescriptiondetail_drug` FOREIGN KEY (`drugid`) REFERENCES `drug` (`drugid`),
  CONSTRAINT `FK_prescriptiondetail_pre` FOREIGN KEY (`preid`) REFERENCES `prescription` (`preid`),
  CONSTRAINT `FK_prescriptiondetail_stoid` FOREIGN KEY (`stoid`) REFERENCES `stock` (`stoid`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

/*Data for the table `prescriptiondetail` */

insert  into `prescriptiondetail`(`detid`,`drugid`,`drugnumber`,`preid`,`detprice`,`stoid`) values (16,3,1,7,40,3),(17,2,1,7,30,2),(18,4,1,8,50,4),(19,1,1,8,20,1),(20,4,1,9,50,4),(21,3,1,9,40,3),(22,2,1,9,30,2),(23,5,1,10,40,6),(24,1,1,10,20,5);

/*Table structure for table `record` */

DROP TABLE IF EXISTS `record`;

CREATE TABLE `record` (
  `recid` int(10) NOT NULL AUTO_INCREMENT,
  `pastdisease` varchar(200) DEFAULT NULL COMMENT '过往病史',
  `reccontent` varchar(200) DEFAULT NULL COMMENT '医生诊断',
  `staid` int(10) DEFAULT NULL,
  `patid` int(10) DEFAULT NULL,
  `rectime` date DEFAULT NULL COMMENT '开设时间',
  PRIMARY KEY (`recid`),
  KEY `FK_record_sta` (`staid`),
  KEY `FK_record_pat` (`patid`),
  CONSTRAINT `FK_record_pat` FOREIGN KEY (`patid`) REFERENCES `patient` (`patid`),
  CONSTRAINT `FK_record_sta` FOREIGN KEY (`staid`) REFERENCES `staff` (`staid`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

/*Data for the table `record` */

insert  into `record`(`recid`,`pastdisease`,`reccontent`,`staid`,`patid`,`rectime`) values (7,'无','头疼',5,1,'2020-01-13'),(8,'头晕','可适当多锻炼',11,2,'2020-01-15'),(9,'无','头晕，需要多休息',2,9,'2020-01-15'),(10,'脑部曾撞伤','建议留院观察',11,13,'2020-01-28'),(11,'无','在家静养',11,14,'2020-01-28');

/*Table structure for table `registration` */

DROP TABLE IF EXISTS `registration`;

CREATE TABLE `registration` (
  `regid` int(10) NOT NULL AUTO_INCREMENT,
  `depid` int(10) DEFAULT NULL,
  `regdate` date DEFAULT NULL,
  `isbreak` tinyint(1) DEFAULT '0' COMMENT '0表示正常使用,1表示已退号',
  `patid` int(10) DEFAULT NULL,
  `staid` int(10) DEFAULT NULL,
  PRIMARY KEY (`regid`),
  KEY `FK_registration_dep` (`depid`),
  KEY `FK_registration_sta` (`staid`),
  KEY `FK_registration_pat` (`patid`),
  CONSTRAINT `FK_registration_dep` FOREIGN KEY (`depid`) REFERENCES `department` (`depid`),
  CONSTRAINT `FK_registration_pat` FOREIGN KEY (`patid`) REFERENCES `patient` (`patid`),
  CONSTRAINT `FK_registration_sta` FOREIGN KEY (`staid`) REFERENCES `staff` (`staid`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

/*Data for the table `registration` */

insert  into `registration`(`regid`,`depid`,`regdate`,`isbreak`,`patid`,`staid`) values (4,2,'2020-01-01',1,1,5),(5,3,'2020-01-01',1,1,8),(6,1,'2020-01-01',1,2,11),(7,1,'2020-01-15',1,9,2),(8,3,'2020-01-27',0,10,13),(9,1,'2020-01-27',0,11,11),(10,2,'2020-01-27',0,12,5),(11,1,'2020-01-28',1,13,11),(12,1,'2020-01-28',1,14,11);

/*Table structure for table `role` */

DROP TABLE IF EXISTS `role`;

CREATE TABLE `role` (
  `roleid` int(10) NOT NULL AUTO_INCREMENT,
  `rolename` varchar(10) DEFAULT NULL,
  `rolesal` int(10) DEFAULT NULL COMMENT '工资',
  PRIMARY KEY (`roleid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

/*Data for the table `role` */

insert  into `role`(`roleid`,`rolename`,`rolesal`) values (1,'院长',30000),(2,'医生',8000),(3,'护士',6000),(4,'药师',6500);

/*Table structure for table `scheduling` */

DROP TABLE IF EXISTS `scheduling`;

CREATE TABLE `scheduling` (
  `schid` int(10) NOT NULL AUTO_INCREMENT,
  `staid` int(10) DEFAULT NULL,
  `schweek` int(5) DEFAULT NULL,
  `schtime` int(5) DEFAULT NULL,
  PRIMARY KEY (`schid`),
  KEY `FK_scheduling_sta` (`staid`),
  CONSTRAINT `FK_scheduling_sta` FOREIGN KEY (`staid`) REFERENCES `staff` (`staid`)
) ENGINE=InnoDB AUTO_INCREMENT=313 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

/*Data for the table `scheduling` */

insert  into `scheduling`(`schid`,`staid`,`schweek`,`schtime`) values (43,6,1,1),(44,16,2,1),(45,18,1,1),(61,10,1,1),(141,8,1,1),(142,13,2,1),(143,13,3,1),(144,13,4,1),(145,8,5,1),(146,8,1,2),(147,13,1,2),(148,8,2,2),(149,13,2,2),(150,8,3,2),(151,13,3,2),(152,8,4,2),(153,13,4,2),(154,8,5,2),(155,13,5,2),(156,13,1,3),(157,8,2,3),(158,8,3,3),(159,13,4,3),(160,8,5,3),(161,7,3,1),(245,12,1,1),(246,5,2,1),(247,12,3,1),(248,5,4,1),(249,5,5,1),(250,12,6,1),(251,12,2,2),(252,12,5,2),(269,2,1,1),(270,2,2,1),(271,11,3,1),(272,11,4,1),(273,11,5,1),(274,11,2,2),(275,2,3,2),(280,3,1,1),(281,14,1,1),(282,3,2,1),(283,3,3,1),(284,14,4,1),(285,14,5,1),(286,3,6,1),(287,14,6,1),(288,3,7,1),(289,3,1,2),(290,14,2,2),(291,3,2,2),(292,3,3,2),(293,14,3,2),(294,3,4,2),(295,3,5,2),(296,3,6,2),(297,14,7,2),(298,14,1,3),(299,14,2,3),(300,14,3,3),(301,3,4,3),(302,14,4,3),(303,3,5,3),(304,14,5,3),(305,14,6,3),(306,14,7,3),(307,4,1,1),(308,15,2,1),(309,15,3,1),(310,15,4,1),(311,4,4,1),(312,15,5,1);

/*Table structure for table `staff` */

DROP TABLE IF EXISTS `staff`;

CREATE TABLE `staff` (
  `staid` int(10) NOT NULL AUTO_INCREMENT,
  `staname` varchar(10) DEFAULT NULL,
  `stasex` varchar(5) DEFAULT NULL,
  `staphone` varchar(11) DEFAULT NULL,
  `roleid` int(10) DEFAULT NULL,
  `staentrydate` date DEFAULT NULL,
  `isincumbency` tinyint(1) DEFAULT '1' COMMENT '1表示在职，0表示离职',
  `depid` int(10) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`staid`),
  KEY `FK_staff_role` (`roleid`),
  KEY `FK_staff` (`depid`),
  CONSTRAINT `FK_staff` FOREIGN KEY (`depid`) REFERENCES `department` (`depid`),
  CONSTRAINT `FK_staff_role` FOREIGN KEY (`roleid`) REFERENCES `role` (`roleid`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

/*Data for the table `staff` */

insert  into `staff`(`staid`,`staname`,`stasex`,`staphone`,`roleid`,`staentrydate`,`isincumbency`,`depid`,`password`) values (1,'王刚','男','17875312345',1,'2000-03-06',1,NULL,'18f747ae2ad1e7fdf0533bd2dea4e3d1'),(2,'李晓','男','17875312346',2,'2006-03-04',1,1,'18f747ae2ad1e7fdf0533bd2dea4e3d1'),(3,'张晓','女','17875312666',3,'2006-09-30',1,1,'18f747ae2ad1e7fdf0533bd2dea4e3d1'),(4,'王丽','女','17875312348',4,'2008-09-19',1,1,'18f747ae2ad1e7fdf0533bd2dea4e3d1'),(5,'张琪','女','17875463052',2,'2013-01-30',1,2,'18f747ae2ad1e7fdf0533bd2dea4e3d1'),(6,'王莉','女','15963054357',3,'2013-04-09',1,2,'18f747ae2ad1e7fdf0533bd2dea4e3d1'),(7,'陈小七','女','17853055448',4,'2009-06-29',1,2,'18f747ae2ad1e7fdf0533bd2dea4e3d1'),(8,'陈彬','男','17875304246',2,'2018-06-06',1,3,'18f747ae2ad1e7fdf0533bd2dea4e3d1'),(9,'李娟','女','17875344628',3,'2017-06-01',1,3,'18f747ae2ad1e7fdf0533bd2dea4e3d1'),(10,'陈小华','女','17845354458',4,'2009-09-24',1,3,'18f747ae2ad1e7fdf0533bd2dea4e3d1'),(11,'王九','男','17875326340',2,'2008-09-19',1,1,'18f747ae2ad1e7fdf0533bd2dea4e3d1'),(12,'陈白','男','17875304625',2,'2014-05-19',1,2,'18f747ae2ad1e7fdf0533bd2dea4e3d1'),(13,'张七七','女','17872435255',2,'2014-11-09',1,3,'18f747ae2ad1e7fdf0533bd2dea4e3d1'),(14,'李华','女','17563562069',3,'2016-01-09',1,1,'18f747ae2ad1e7fdf0533bd2dea4e3d1'),(15,'张思思','女','17496259254',4,'2011-06-26',1,1,'18f747ae2ad1e7fdf0533bd2dea4e3d1'),(16,'王燕','女','17342659245',3,'2013-06-30',1,2,'18f747ae2ad1e7fdf0533bd2dea4e3d1'),(17,'陈小欧','女','17264395357',4,'2009-03-18',1,2,'18f747ae2ad1e7fdf0533bd2dea4e3d1'),(18,'萧月','女','16425389756',3,'2011-09-26',1,3,'18f747ae2ad1e7fdf0533bd2dea4e3d1'),(19,'习洋','男','17853459685',4,'2013-07-24',1,3,'18f747ae2ad1e7fdf0533bd2dea4e3d1'),(20,'张达','男','17823945666',2,'2020-01-31',1,3,'18f747ae2ad1e7fdf0533bd2dea4e3d1');

/*Table structure for table `stock` */

DROP TABLE IF EXISTS `stock`;

CREATE TABLE `stock` (
  `stoid` int(10) NOT NULL AUTO_INCREMENT,
  `drugid` int(10) DEFAULT NULL,
  `drugnum` int(10) DEFAULT NULL,
  `stoinputtime` date DEFAULT NULL,
  `stouserdate` date DEFAULT NULL,
  `stoprice` int(10) DEFAULT NULL,
  `stosavenum` int(10) DEFAULT NULL COMMENT '进货数量',
  PRIMARY KEY (`stoid`),
  KEY `FK_stock_drug` (`drugid`),
  CONSTRAINT `FK_stock_drug` FOREIGN KEY (`drugid`) REFERENCES `drug` (`drugid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

/*Data for the table `stock` */

insert  into `stock`(`stoid`,`drugid`,`drugnum`,`stoinputtime`,`stouserdate`,`stoprice`,`stosavenum`) values (1,1,119,'2020-01-22','2022-04-03',10,120),(2,2,98,'2019-09-16','2022-09-16',20,100),(3,3,98,'2019-06-06','2023-06-06',30,100),(4,4,198,'2017-09-09','2021-09-09',40,200),(5,1,149,'2020-01-22','2023-09-29',10,150),(6,5,99,'2020-01-19','2023-01-19',20,100),(7,6,50,'2020-01-19','2023-01-19',20,50);

/*Table structure for table `ward` */

DROP TABLE IF EXISTS `ward`;

CREATE TABLE `ward` (
  `wardid` int(10) NOT NULL AUTO_INCREMENT,
  `wardtype` varchar(10) DEFAULT NULL,
  `wardprice` int(5) DEFAULT NULL COMMENT '病房价格',
  `depid` int(10) DEFAULT NULL,
  PRIMARY KEY (`wardid`),
  KEY `FK_ward` (`depid`),
  CONSTRAINT `FK_ward` FOREIGN KEY (`depid`) REFERENCES `department` (`depid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

/*Data for the table `ward` */

insert  into `ward`(`wardid`,`wardtype`,`wardprice`,`depid`) values (1,'双人间',100,1),(2,'四人间',40,1),(3,'单人间',150,1),(4,'双人间',100,2),(5,'四人间',40,2),(6,'单人间',150,2),(7,'双人间',100,3),(8,'四人间',40,3),(9,'单人间',150,3),(10,'双人间',100,1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
