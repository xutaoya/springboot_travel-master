/*
SQLyog Ultimate v12.08 (64 bit)
MySQL - 5.5.40 : Database - travel
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`travel` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `travel`;

/*Table structure for table `admin` */

DROP TABLE IF EXISTS `admin`;

CREATE TABLE `admin` (
  `id` varchar(120) COLLATE utf8_bin NOT NULL,
  `name` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '姓名',
  `password` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '密码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `admin` */

insert  into `admin`(`id`,`name`,`password`) values ('1088810619659923456','admin','$2a$10$jpfQMwroY77a9StAG1UvNuvIatWfSzW7nQ5U9zhKnCV7smgNj7T9m');

/*Table structure for table `carousel` */

DROP TABLE IF EXISTS `carousel`;

CREATE TABLE `carousel` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL,
  `title` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '标题',
  `comment` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '内容',
  `scenictime` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `carousel` */

insert  into `carousel`(`id`,`title`,`comment`,`scenictime`) values ('1091587235217711104','欢迎来到立知行旅游','优惠的价格','尽在立知行'),('1091595724371566592','第二天','第二图','第二个'),('1381613192467206144','第三天','第三图','第三个');

/*Table structure for table `food` */

DROP TABLE IF EXISTS `food`;

CREATE TABLE `food` (
  `id` varchar(120) COLLATE utf8_bin NOT NULL,
  `img` varchar(120) COLLATE utf8_bin DEFAULT NULL COMMENT '图片',
  `title` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '标题',
  `comment` varchar(120) COLLATE utf8_bin DEFAULT NULL COMMENT '内容',
  `infosource` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '来源',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `food` */

insert  into `food`(`id`,`img`,`title`,`comment`,`infosource`) values ('1382128991741235200','/images/c3.jpg','饺子','饺子很好吃的！','中国'),('1382129133127028736','/images/c1.jpg','北京烤鸭','北京的烤鸭是真不错！','北京'),('1382129271866216448','/images/c4.jpg','汤圆','吃了汤圆团团圆圆！','中国'),('1382129451084632064','/images/c5.jpg','米粽','糯糯甜甜的粽子是美味！','中国');

/*Table structure for table `gallery` */

DROP TABLE IF EXISTS `gallery`;

CREATE TABLE `gallery` (
  `id` varchar(120) COLLATE utf8_bin NOT NULL,
  `img` varchar(120) COLLATE utf8_bin DEFAULT NULL COMMENT '图片',
  `title` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '标题',
  `comment` varchar(120) COLLATE utf8_bin DEFAULT NULL COMMENT '内容',
  `city` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '城市国家',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `gallery` */

insert  into `gallery`(`id`,`img`,`title`,`comment`,`city`) values ('1382133830655242240','/images/d1.jpg','重庆','小城夜景很美呢！',NULL),('1382134035714764800','/images/d3.jpg','东北','绿油油的油田，心情好！',NULL),('1382134173443125248','/images/d4.jpg','国外','建筑艺术！',NULL),('1382134263490637824','/images/d5.jpg','美国','“女神”',NULL),('1382134469909114880','/images/d2.jpg','山','体验过热气球吗！',NULL),('1382134709038968832','/images/a10.jpg','地球','美丽的星球，我们的家！',NULL),('1382232079491698688','/images/a10.jpg','111','111',NULL);

/*Table structure for table `hotel` */

DROP TABLE IF EXISTS `hotel`;

CREATE TABLE `hotel` (
  `id` varchar(120) COLLATE utf8_bin NOT NULL,
  `img` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '图片',
  `name` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '酒店名称',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `miaoshu` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '描述',
  `bed` int(10) DEFAULT NULL COMMENT '床数',
  `day` int(10) DEFAULT '1' COMMENT '天数',
  `star` int(10) DEFAULT '0' COMMENT '评论星',
  `startdate` datetime DEFAULT NULL COMMENT '入住时间',
  `addr` varchar(120) COLLATE utf8_bin DEFAULT NULL COMMENT '酒店城市',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `hotel` */

insert  into `hotel`(`id`,`img`,`name`,`price`,`miaoshu`,`bed`,`day`,`star`,`startdate`,`addr`) values ('1091','/images/hotels07.jpg','八六','654.00','时候',0,2,4,'2019-03-12 20:41:05','南阳'),('109137','/images/hotels05.jpg','四五','741.00','贵',0,2,5,'2019-03-12 20:40:14','洛阳'),('10913733','/images/hotels02.jpg','海景','321.00','美',0,2,5,'2019-03-12 20:38:48','南阳'),('109137339','/images/hotels03.jpg','好好','963.00','魅力',0,3,5,'2019-03-12 20:39:35','安阳'),('1091373396','/images/hotels06.jpg','四六','753.00','四六八',10,2,3,'2019-03-12 20:40:40','郑州'),('10913734','/images/hotels04.jpg','大陆','258.00','好看',0,3,5,'2019-03-12 20:39:10','郑州'),('10913735','/images/hotels09.jpg','溜吧','951.00','溜吧',2,2,3,'2019-03-12 21:04:01','南阳'),('1102950003585847290','/images/hotels08.jpg','嘿嘿','956.00','哈哈',100,8,5,'2019-03-12 21:04:59','新乡'),('123456789','/images/hotels01.jpg','情侣','123.00','你懂得',1,NULL,6,NULL,NULL);

/*Table structure for table `hotel_orders` */

DROP TABLE IF EXISTS `hotel_orders`;

CREATE TABLE `hotel_orders` (
  `id` varchar(120) COLLATE utf8_bin NOT NULL COMMENT 'id',
  `scenicid` varchar(120) COLLATE utf8_bin DEFAULT NULL COMMENT '商品id',
  `userid` varchar(120) COLLATE utf8_bin DEFAULT NULL COMMENT '用户id',
  `qty` int(11) DEFAULT NULL COMMENT '数量',
  `payment` decimal(10,2) DEFAULT NULL COMMENT '总支付金额',
  `status` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '状态',
  `paytime` datetime DEFAULT NULL COMMENT '支付时间',
  `phone` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '电话',
  `username` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `scenicname` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `begin` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '入住时间',
  `end` varchar(2255) COLLATE utf8_bin DEFAULT NULL COMMENT '离开时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `hotel_orders` */

insert  into `hotel_orders`(`id`,`scenicid`,`userid`,`qty`,`payment`,`status`,`paytime`,`phone`,`username`,`scenicname`,`begin`,`end`) values ('1121588580272168960','109137339','1103622546225336320',1,'963.00','0','2019-04-26 09:35:30','15688198593','tz','好好',NULL,NULL),('1121589539505299456','109137339','1103622546225336320',1,'963.00','0','2019-04-26 09:39:19','15688198593','tz','好好',NULL,NULL),('1121589770657587200','109137339','1103622546225336320',1,'963.00','0','2019-04-26 09:40:14','15688198593','tz','好好',NULL,NULL),('1121590009703555072','109137339','1103622546225336320',1,'963.00','0','2019-04-26 09:41:11','15688198593','tz','好好',NULL,NULL),('1121594259896655872','1091','1103622546225336320',1,'654.00','0','2019-04-26 09:58:04','15688198593','tz','八六','',''),('1121594583441022976','1091','1103622546225336320',1,'654.00','0','2019-04-26 09:59:21','15688198593','tz','八六','',''),('1121594730950500352','1091','1103622546225336320',1,'654.00','0','2019-04-26 09:59:56','15688198593','tz','八六','2019-04-26','2019-04-27'),('1121610508663861248','1091373396','1103622546225336320',1,'753.00','0','2019-04-26 11:02:38','15688198593','tz','四六','2019-04-26','2019-04-27'),('1380806996630032384','1091373396','1103622546225336320',1,'753.00','0','2021-04-10 16:56:56','15688198593','tz','四六','2021-04-10','2021-04-11'),('1380828662613528576','1091','1103622546225336320',1,'654.00','0','2021-04-10 18:23:02','15688198593','tz','八六','2021-04-11','2021-04-11'),('1381785877117702144','10913735','1381607416310792192',2,'1902.00','0','2021-04-13 09:46:40','15612142697','米洛','溜吧','2021-04-14','2021-04-15');

/*Table structure for table `orders` */

DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
  `id` varchar(120) COLLATE utf8_bin NOT NULL COMMENT 'id',
  `scenicid` varchar(120) COLLATE utf8_bin DEFAULT NULL COMMENT '商品id',
  `userid` varchar(120) COLLATE utf8_bin DEFAULT NULL COMMENT '用户id',
  `qty` int(11) DEFAULT NULL COMMENT '数量',
  `payment` decimal(10,2) DEFAULT NULL COMMENT '总支付金额',
  `status` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '状态',
  `paytime` datetime DEFAULT NULL COMMENT '支付时间',
  `phone` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '电话',
  `username` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `scenicname` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `orders` */

insert  into `orders`(`id`,`scenicid`,`userid`,`qty`,`payment`,`status`,`paytime`,`phone`,`username`,`scenicname`) values ('1118095265778114560','1102950003585847299','1103622546225336320',1,'24.00','1','2019-04-16 18:14:19','15688198593','tz','南阳诸葛庐'),('1380801113829265408','1102950003585847251','1103622546225336320',1,'999.00','0','2021-04-10 16:33:34','15688198593','tz','阳阳'),('1381607572754137088','1381607044292804608','1381607416310792192',1,'10000.00','1','2021-04-12 21:58:09','15612142697','米洛','DiQiu'),('1381785702227808256','1102950003585847253','1381607416310792192',1,'123.00','0','2021-04-13 09:45:58','15612142697','米洛','迪斯尼'),('1382231503219494912','1102950003585847251','1381607416310792192',1,'999.00','1','2021-04-14 15:17:25','15612142697','米洛','鼓浪屿'),('1382989267931815936','1102950003585847252','1381607416310792192',2,'246.00','1','2021-04-16 17:28:30','15612142697','米洛','天津之眼');

/*Table structure for table `scenic` */

DROP TABLE IF EXISTS `scenic`;

CREATE TABLE `scenic` (
  `id` varchar(64) CHARACTER SET utf8 NOT NULL COMMENT 'id',
  `name` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '景点名称',
  `img` varchar(120) COLLATE utf8_bin DEFAULT NULL COMMENT '景点图片',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `miaoshu` varchar(120) COLLATE utf8_bin DEFAULT NULL COMMENT '描述',
  `comment` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '详情',
  `stock` int(32) DEFAULT NULL COMMENT '库存',
  `start` int(12) DEFAULT NULL COMMENT '评分',
  `contry` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '国家地区',
  `startdate` datetime DEFAULT NULL COMMENT '出发时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `scenic` */

insert  into `scenic`(`id`,`name`,`img`,`price`,`miaoshu`,`comment`,`stock`,`start`,`contry`,`startdate`) values ('1102950003585847200','郑州','/images/b2.jpg','999.00','你好1','其实我没什么好说的',0,7,'郑州',NULL),('1102950003585847230','洛阳','/images/b3.jpg','888.00','很好','超级好',23,6,'洛阳','2019-02-21 13:30:59'),('1102950003585847250','三亚','/images/b5.jpg','777.00','666','555',17,1,'南阳','2019-02-21 13:31:25'),('1102950003585847251','鼓浪屿','/images/b6.jpg','999.00','999','999',23,4,'南阳','2019-02-25 16:20:04'),('1102950003585847252','天津之眼','/images/b7.jpg','123.00','好地方','好地方',15,4,'南阳','2019-02-12 08:00:00'),('1102950003585847253','迪斯尼','/images/b8.jpg','123.00','好地方','好地方',18,35,'南阳','2019-02-12 08:00:00'),('1102950003585847255','北京','/images/b1.jpg','24.00','这是个好地方不能再好了','其实我没什么好说的',19,10,'南阳','2019-02-02 08:00:00'),('1102950003585847299','南阳诸葛庐','/images/b4.jpg','24.00','这是个好地方不能再好了','其实我没什么好说的',4,5,'南阳','2019-02-02 08:00:00'),('1381773348501053440','西安','/images/b9.jpg','26.00','111','很好玩的地方！',21,7,'西安',NULL);

/*Table structure for table `strategy` */

DROP TABLE IF EXISTS `strategy`;

CREATE TABLE `strategy` (
  `id` varchar(64) CHARACTER SET utf8 NOT NULL COMMENT 'id',
  `name` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '名称',
  `img` varchar(120) COLLATE utf8_bin DEFAULT NULL COMMENT '图片',
  `line` varchar(120) COLLATE utf8_bin DEFAULT NULL COMMENT '线路名称',
  `destination` varchar(120) COLLATE utf8_bin DEFAULT NULL COMMENT '目的地',
  `tool` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '交通工具',
  `startdate` datetime DEFAULT NULL COMMENT '出行时间',
  `publisher` varchar(120) COLLATE utf8_bin DEFAULT NULL COMMENT '发布人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `strategy` */

insert  into `strategy`(`id`,`name`,`img`,`line`,`destination`,`tool`,`startdate`,`publisher`) values ('1381970670124068864','鼓浪屿三日游','/images/b6.jpg','鼓浪屿','鼓浪屿','高铁','2021-04-17 08:00:00','小晚'),('1382130877282209792','三亚','/images/b5.jpg','三亚七日游','三亚','飞机','2021-04-20 08:00:00','小南'),('1382131275330048000','南阳','/images/b4.jpg','南阳一日游','诸葛庐','高铁',NULL,'小王');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` varchar(120) COLLATE utf8_bin NOT NULL COMMENT 'id',
  `name` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '姓名',
  `password` varchar(120) COLLATE utf8_bin DEFAULT NULL COMMENT '密码',
  `mobile` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '手机号码',
  `email` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '邮箱',
  `sex` char(6) COLLATE utf8_bin DEFAULT '1' COMMENT '性别，男1，女0',
  `age` int(16) DEFAULT NULL COMMENT '年龄',
  `salt` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '盐',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `user` */

insert  into `user`(`id`,`name`,`password`,`mobile`,`email`,`sex`,`age`,`salt`) values ('1101416218608295936','网二','$2a$10$y0lFq5OYQhhq771AZMk.ZO6flzLulMp6NUO184xa19Hud4Yo4lx6K','13137795554','767750432@qq.com','男',28,NULL),('1101743125610672128','点点','$2a$10$y0lFq5OYQhhq771AZMk.ZO6flzLulMp6NUO184xa19Hud4Yo4lx6K','13037650251','1289838872@qq.com','女',18,NULL),('1102950003585847296','123tz','$2a$10$bNfTXmgkFwxIGHf4vlXpNunCM0N3isxJ1YvxsbCo90piNOkNoib6e','15688198593','1137854811@qq.com','女',123,NULL),('1103490713909239808','张三','$2a$10$AfKghn4nGydbnMEE1vNIbOOoDICyrKNZDoWuH/spW9y92o7X.iYPi','13937660933','76775042@qq.com','null',21,NULL),('1103622546225336320','tz','$2a$10$bmUc.7yz/CP4XTMrUeoVXOnsYQpuvj5tXFzt5uOFEnjWkp2jrl3WK','15688198593','1137854811q1','男',20,NULL),('1381607416310792192','米洛','$2a$10$DJymKnqOwEJgGHvbYOiETux27RzGCpepHjZYhwp5kTUnPQVMV8FB2','15612142697','13266668888@qq.com','男',21,NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
