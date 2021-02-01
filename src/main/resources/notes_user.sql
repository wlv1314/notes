/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50022
Source Host           : localhost:3306
Source Database       : notes

Target Server Type    : MYSQL
Target Server Version : 50022
File Encoding         : 65001

Date: 2020-10-22 09:51:20
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for notes_user
-- ----------------------------
DROP TABLE IF EXISTS `notes_user`;
CREATE TABLE `notes_user` (
  `userId` int(11) NOT NULL auto_increment,
  `userName` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `email` varchar(30) NOT NULL,
  PRIMARY KEY  (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of notes_user
-- ----------------------------
INSERT INTO `notes_user` VALUES ('3', 'wl123456', '123456', '1245080925@qq.com');
INSERT INTO `notes_user` VALUES ('4', '1qaz', '123456', '1245080925@qq.com');
INSERT INTO `notes_user` VALUES ('37', '1qaz00', '111111', '1245080925@qq.com');
INSERT INTO `notes_user` VALUES ('38', 'wl1234567', '123456', '123@qq.com');
INSERT INTO `notes_user` VALUES ('39', '123456', '12345', '1921684@163.com');
INSERT INTO `notes_user` VALUES ('40', '123456789', '123456789.', '1429280803@qq.com');
