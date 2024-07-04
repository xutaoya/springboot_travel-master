/*
 Navicat Premium Data Transfer

 Source Server         : 0127
 Source Server Type    : MySQL
 Source Server Version : 80035
 Source Host           : localhost:3306
 Source Schema         : travel

 Target Server Type    : MySQL
 Target Server Version : 80035
 File Encoding         : 65001

 Date: 04/07/2024 12:19:49
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `id` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '姓名',
  `password` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '密码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1088810619659923456', 'admin', '$2a$10$zKm5mDVj3iUs70Jwr50af.J7vqp4UdtjwGpqY22LnyWLLbY30DnT6');
INSERT INTO `admin` VALUES ('15031399692', 'haoruina', '123456');
INSERT INTO `admin` VALUES ('1808356034986364928', 'ruina', '$2a$10$1iv5g419opwxjWWIUIEh7uvYGgXhb8cDiEs6W7EWqMeS3EO77sZ4u');
INSERT INTO `admin` VALUES ('1808356171812950016', 'ruina', '$2a$10$0xKvP0yMo8faJfXbJCInJeEu63BKIYAnbzEhvzW.YJu5hI3txHb3e');
INSERT INTO `admin` VALUES ('1808383846929649664', 'ruina', '$2a$10$xi1L/nYTIsR/m.amgJ2efuVsQxwXgvwrbfqZpE/Yl7dEEr/TTq662');
INSERT INTO `admin` VALUES ('1808429922252476416', 'admin2', '$2a$10$.GsK7K04tshYsWott9DqgOPEfuH77pj/jl/DgP2DZpgvgopv8XmQe');

-- ----------------------------
-- Table structure for carousel
-- ----------------------------
DROP TABLE IF EXISTS `carousel`;
CREATE TABLE `carousel`  (
  `id` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `title` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '标题',
  `comment` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '内容',
  `scenictime` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of carousel
-- ----------------------------
INSERT INTO `carousel` VALUES ('1091595724371566592', '金牌好价', '划算一夏', '暑假爆款产品Go');
INSERT INTO `carousel` VALUES ('1381613192467206144', '海滨风光', '夏日必去清单', '科罗娜夏日特选');
INSERT INTO `carousel` VALUES ('1808330232865480704', '暑期旅行', '享受低价', '就来打败携程');

-- ----------------------------
-- Table structure for food
-- ----------------------------
DROP TABLE IF EXISTS `food`;
CREATE TABLE `food`  (
  `id` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `img` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '图片',
  `title` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '标题',
  `comment` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '内容',
  `infosource` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '来源',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of food
-- ----------------------------
INSERT INTO `food` VALUES ('1382129133127028736', '/images/c1.jpg', '北京烤鸭', '北京的烤鸭是真不错！', '北京');
INSERT INTO `food` VALUES ('1382129271866216448', '/images/c4.jpg', '汤圆', '吃了汤圆团团圆圆！', '中国');
INSERT INTO `food` VALUES ('1382129451084632064', '/images/c5.jpg', '米粽', '糯糯甜甜的粽子是美味！', '中国');

-- ----------------------------
-- Table structure for gallery
-- ----------------------------
DROP TABLE IF EXISTS `gallery`;
CREATE TABLE `gallery`  (
  `id` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `img` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '图片',
  `title` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '标题',
  `comment` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '内容',
  `city` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '城市国家',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gallery
-- ----------------------------
INSERT INTO `gallery` VALUES ('1808384646942806016', '/images/chengdu.jpg', '成都', '“和我，在成都的街头走一走”', NULL);
INSERT INTO `gallery` VALUES ('1808385692729593856', '/images/1.jpg', '北京环球影城', '', NULL);

-- ----------------------------
-- Table structure for hotel
-- ----------------------------
DROP TABLE IF EXISTS `hotel`;
CREATE TABLE `hotel`  (
  `id` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `img` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '图片',
  `name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '酒店名称',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '价格',
  `miaoshu` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '描述',
  `bed` int NULL DEFAULT NULL COMMENT '床数',
  `day` int NULL DEFAULT 1 COMMENT '天数',
  `star` int NULL DEFAULT 0 COMMENT '评论星',
  `startdate` datetime NULL DEFAULT NULL COMMENT '入住时间',
  `addr` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '酒店城市',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hotel
-- ----------------------------
INSERT INTO `hotel` VALUES ('10913733', NULL, '海景', 321.00, '美', 0, NULL, 5, NULL, NULL);
INSERT INTO `hotel` VALUES ('109137339', '/images/hotels03.jpg', '好好', 963.00, '魅力', 0, 3, 5, '2019-03-12 20:39:35', '安阳');
INSERT INTO `hotel` VALUES ('1091373396', '/images/hotels06.jpg', '四六', 753.00, '四六八', 8, 2, 3, '2019-03-12 20:40:40', '郑州');
INSERT INTO `hotel` VALUES ('10913734', '/images/hotels04.jpg', '大陆', 258.00, '好看', 0, 3, 5, '2019-03-12 20:39:10', '郑州');
INSERT INTO `hotel` VALUES ('10913735', '/images/hotels09.jpg', '溜吧', 951.00, '溜吧', 2, 2, 3, '2019-03-12 21:04:01', '南阳');
INSERT INTO `hotel` VALUES ('1102950003585847290', '/images/hotels08.jpg', '嘿嘿', 956.00, '哈哈', 100, 8, 5, '2019-03-12 21:04:59', '新乡');
INSERT INTO `hotel` VALUES ('123456789', '/images/hotels01.jpg', '情侣', 123.00, '你懂得', 1, NULL, 6, NULL, NULL);
INSERT INTO `hotel` VALUES ('1808145581672636416', '/images/hotels01.jpg', '如家酒店', 210.00, '给你回家的感觉', 9, NULL, NULL, NULL, 'Handan City, Hebei province, Congtai district');
INSERT INTO `hotel` VALUES ('1808331278539022336', '/images/hotels06.jpg', '汉庭酒店', 210.00, '轻奢', 9, NULL, NULL, NULL, 'Handan City, Hebei province, Congtai district');

-- ----------------------------
-- Table structure for hotel_orders
-- ----------------------------
DROP TABLE IF EXISTS `hotel_orders`;
CREATE TABLE `hotel_orders`  (
  `id` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'id',
  `scenicid` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '商品id',
  `userid` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '用户id',
  `qty` int NULL DEFAULT NULL COMMENT '数量',
  `payment` decimal(10, 2) NULL DEFAULT NULL COMMENT '总支付金额',
  `status` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '状态',
  `paytime` datetime NULL DEFAULT NULL COMMENT '支付时间',
  `phone` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '电话',
  `username` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `scenicname` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `begin` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '入住时间',
  `end` varchar(2255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '离开时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hotel_orders
-- ----------------------------
INSERT INTO `hotel_orders` VALUES ('1121588580272168960', '109137339', '1103622546225336320', 1, 963.00, '0', '2019-04-26 09:35:30', '15688198593', 'tz', '好好', NULL, NULL);
INSERT INTO `hotel_orders` VALUES ('1121589539505299456', '109137339', '1103622546225336320', 1, 963.00, '0', '2019-04-26 09:39:19', '15688198593', 'tz', '好好', NULL, NULL);
INSERT INTO `hotel_orders` VALUES ('1121589770657587200', '109137339', '1103622546225336320', 1, 963.00, '0', '2019-04-26 09:40:14', '15688198593', 'tz', '好好', NULL, NULL);
INSERT INTO `hotel_orders` VALUES ('1121590009703555072', '109137339', '1103622546225336320', 1, 963.00, '0', '2019-04-26 09:41:11', '15688198593', 'tz', '好好', NULL, NULL);
INSERT INTO `hotel_orders` VALUES ('1121594259896655872', '1091', '1103622546225336320', 1, 654.00, '0', '2019-04-26 09:58:04', '15688198593', 'tz', '八六', '', '');
INSERT INTO `hotel_orders` VALUES ('1121594583441022976', '1091', '1103622546225336320', 1, 654.00, '0', '2019-04-26 09:59:21', '15688198593', 'tz', '八六', '', '');
INSERT INTO `hotel_orders` VALUES ('1121594730950500352', '1091', '1103622546225336320', 1, 654.00, '0', '2019-04-26 09:59:56', '15688198593', 'tz', '八六', '2019-04-26', '2019-04-27');
INSERT INTO `hotel_orders` VALUES ('1121610508663861248', '1091373396', '1103622546225336320', 1, 753.00, '0', '2019-04-26 11:02:38', '15688198593', 'tz', '四六', '2019-04-26', '2019-04-27');
INSERT INTO `hotel_orders` VALUES ('1380806996630032384', '1091373396', '1103622546225336320', 1, 753.00, '0', '2021-04-10 16:56:56', '15688198593', 'tz', '四六', '2021-04-10', '2021-04-11');
INSERT INTO `hotel_orders` VALUES ('1380828662613528576', '1091', '1103622546225336320', 1, 654.00, '0', '2021-04-10 18:23:02', '15688198593', 'tz', '八六', '2021-04-11', '2021-04-11');
INSERT INTO `hotel_orders` VALUES ('1381785877117702144', '10913735', '1381607416310792192', 2, 1902.00, '0', '2021-04-13 09:46:40', '15612142697', '米洛', '溜吧', '2021-04-14', '2021-04-15');
INSERT INTO `hotel_orders` VALUES ('1807590608916439040', '1091373396', '1806514973158547456', 1, 753.00, '0', '2024-07-01 09:42:39', '15031399692', '郝瑞娜', '四六', '2024-07-08', '2024-07-09');
INSERT INTO `hotel_orders` VALUES ('1807685680479567872', '1091373396', '1806514973158547456', 1, 753.00, '0', '2024-07-01 16:00:26', '15031399692', '郝瑞娜', '四六', '2024-07-01', '2024-07-02');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'id',
  `scenicid` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '商品id',
  `userid` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '用户id',
  `qty` int NULL DEFAULT NULL COMMENT '数量',
  `payment` decimal(10, 2) NULL DEFAULT NULL COMMENT '总支付金额',
  `status` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '状态',
  `paytime` datetime NULL DEFAULT NULL COMMENT '支付时间',
  `phone` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '电话',
  `username` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `scenicname` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('1118095265778114560', '1102950003585847299', '1103622546225336320', 1, 24.00, '1', '2019-04-16 18:14:19', '15688198593', 'tz', '南阳诸葛庐');
INSERT INTO `orders` VALUES ('1380801113829265408', '1102950003585847251', '1103622546225336320', 1, 999.00, '1', '2021-04-10 16:33:34', '15688198593', 'tz', '阳阳');
INSERT INTO `orders` VALUES ('1381607572754137088', '1381607044292804608', '1381607416310792192', 1, 10000.00, '1', '2021-04-12 21:58:09', '15612142697', '米洛', 'DiQiu');
INSERT INTO `orders` VALUES ('1381785702227808256', '1102950003585847253', '1381607416310792192', 1, 123.00, '1', '2021-04-13 09:45:58', '15612142697', '米洛', '迪斯尼');
INSERT INTO `orders` VALUES ('1382231503219494912', '1102950003585847251', '1381607416310792192', 1, 999.00, '1', '2021-04-14 15:17:25', '15612142697', '米洛', '鼓浪屿');
INSERT INTO `orders` VALUES ('1382989267931815936', '1102950003585847252', '1381607416310792192', 2, 246.00, '1', '2021-04-16 17:28:30', '15612142697', '米洛', '天津之眼');
INSERT INTO `orders` VALUES ('1808430344715358208', '1102950003585847253', '1806514973158547456', 1, 123.00, '1', '2024-07-03 17:19:27', '15031399692', '郝瑞娜', '迪斯尼');
INSERT INTO `orders` VALUES ('1808436833228148736', '1102950003585847252', '1806514973158547456', 1, 123.00, '1', '2024-07-03 17:45:14', '15031399692', '郝瑞娜', '天津之眼');
INSERT INTO `orders` VALUES ('1808436923468599296', '1102950003585847252', '1806514973158547456', 1, 123.00, '0', '2024-07-03 17:45:36', '15031399692', '郝瑞娜', '天津之眼');

-- ----------------------------
-- Table structure for scenic
-- ----------------------------
DROP TABLE IF EXISTS `scenic`;
CREATE TABLE `scenic`  (
  `id` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'id',
  `name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '景点名称',
  `img` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '景点图片',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '价格',
  `miaoshu` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '描述',
  `comment` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '详情',
  `stock` int NULL DEFAULT NULL COMMENT '库存',
  `start` int NULL DEFAULT NULL COMMENT '评分',
  `contry` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '国家地区',
  `startdate` datetime NULL DEFAULT NULL COMMENT '出发时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of scenic
-- ----------------------------
INSERT INTO `scenic` VALUES ('1102950003585847252', '天津之眼', '/images/b7.jpg', 123.00, '好地方', '好地方', 13, 4, '南阳', '2019-02-12 08:00:00');
INSERT INTO `scenic` VALUES ('1102950003585847253', '迪斯尼', '/images/b8.jpg', 123.00, '好地方', '好地方', 17, 12, '南阳', '2019-02-12 08:00:00');
INSERT INTO `scenic` VALUES ('1102950003585847255', '北京', '/images/b1.jpg', 24.00, '这是个好地方不能再好了', '其实我没什么好说的', 19, 10, '南阳', '2019-02-02 08:00:00');
INSERT INTO `scenic` VALUES ('1102950003585847299', '南阳诸葛庐', '/images/b4.jpg', 24.00, '这是个好地方不能再好了', '其实我没什么好说的', 4, 5, '南阳', '2019-02-02 08:00:00');
INSERT INTO `scenic` VALUES ('1381773348501053440', '西安', '/images/b9.jpg', 26.00, '111', '很好玩的地方！', 21, 7, '西安', NULL);
INSERT INTO `scenic` VALUES ('1808131391364931584', '太舞小镇', '/images/zhangjiakou.jpg', 99.00, '张家口', '河北自己的阿勒泰', 99, NULL, NULL, '2024-07-25 08:00:00');
INSERT INTO `scenic` VALUES ('1808436205462474752', '太舞小镇', '/images/1.jpg', 420.00, '', '', 50, NULL, NULL, '2024-07-03 08:00:00');

-- ----------------------------
-- Table structure for strategy
-- ----------------------------
DROP TABLE IF EXISTS `strategy`;
CREATE TABLE `strategy`  (
  `id` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'id',
  `name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '名称',
  `img` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '图片',
  `line` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '线路名称',
  `destination` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '目的地',
  `tool` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '交通工具',
  `startdate` datetime NULL DEFAULT NULL COMMENT '出行时间',
  `publisher` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '发布人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of strategy
-- ----------------------------
INSERT INTO `strategy` VALUES ('1382131275330048000', '南阳', '/images/b4.jpg', '南阳一日游', '诸葛庐', '高铁', NULL, '小王');
INSERT INTO `strategy` VALUES ('1808151774772207616', '亚特兰蒂斯', '/images/image3.jpg', '三亚站>亚特兰蒂斯', '海堂区', '11路功能公交车', '2024-07-02 08:00:00', '小郝');
INSERT INTO `strategy` VALUES ('1808332074601144320', '太舞小镇', '/images/zhangjiakou.jpg', '张家口站>崇礼', '太子镇', '自驾', '2024-07-03 08:00:00', '小瑞');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'id',
  `name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '姓名',
  `password` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '密码',
  `mobile` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '手机号码',
  `email` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '邮箱',
  `sex` char(6) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '1' COMMENT '性别，男1，女0',
  `age` int NULL DEFAULT NULL COMMENT '年龄',
  `salt` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '盐',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1103622546225336320', 'tz', '$2a$10$bmUc.7yz/CP4XTMrUeoVXOnsYQpuvj5tXFzt5uOFEnjWkp2jrl3WK', '15688198593', '1137854811q1', '男', 20, NULL);
INSERT INTO `user` VALUES ('1381607416310792192', '米洛', '$2a$10$DJymKnqOwEJgGHvbYOiETux27RzGCpepHjZYhwp5kTUnPQVMV8FB2', '15612142697', '13266668888@qq.com', '男', 21, NULL);
INSERT INTO `user` VALUES ('1806514973158547456', '郝瑞娜', '$2a$10$3o4DFpcIhPbLeRE/bHFQ3OOGRpM6daHHu3GYh91dt74Zo5tc7c4nS', '15031399692', '1797387020@qq.com', NULL, NULL, NULL);
INSERT INTO `user` VALUES ('1807702245577031680', '柴钰莹', '$2a$10$9zCYwyUJkg2KHPMS0I/F/eNH1OpEzP4aHPdilQ8W5ZupGedXds51e', '15031399693', '1797397020@qq.com', NULL, NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
