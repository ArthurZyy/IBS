/*
Navicat MySQL Data Transfer
Source Host     : localhost:3306
Source Database : db_ibs
Target Host     : localhost:3306
Target Database : db_ibs
Date: 2017-11-08 14:46:15
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for t_book
-- ----------------------------
DROP TABLE IF EXISTS `t_book`;
CREATE TABLE `t_book` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `author` varchar(50) NOT NULL DEFAULT '佚名',
  `unit` varchar(2) NOT NULL DEFAULT '1',
  `genre` varchar(10) NOT NULL DEFAULT '未分类',
  `produce` varchar(10) NOT NULL DEFAULT '未知出版社',
  `price` float NOT NULL DEFAULT '0',
  `produce_at` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of t_book
-- ----------------------------
INSERT INTO `t_book` VALUES ('1', '时间的密码', '佚名', '1', '未分类', '未知出版社', '0', null);
INSERT INTO `t_book` VALUES ('2', '精致的女人', '佚名', '1', '未分类', '未知出版社', '0', null);

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `password` varchar(255) NOT NULL,
  `user_type` int(2) NOT NULL,
  `address` varchar(255) NOT NULL,
  `age` int(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', '郑雅宇', '18814128416', '123456', '0', 'dafds', '20');
