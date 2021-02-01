/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50022
Source Host           : localhost:3306
Source Database       : notes

Target Server Type    : MYSQL
Target Server Version : 50022
File Encoding         : 65001

Date: 2020-10-22 09:50:58
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for notes_comment
-- ----------------------------
DROP TABLE IF EXISTS `notes_comment`;
CREATE TABLE `notes_comment` (
  `commentId` int(11) NOT NULL auto_increment,
  `currUserId` int(11) NOT NULL COMMENT '当前用户id',
  `commentUserId` int(11) NOT NULL COMMENT '被评论的用户id',
  `essaysId` int(11) NOT NULL COMMENT '被评论的文字id',
  `comment` text NOT NULL COMMENT '评论的内容',
  `createTime` varchar(30) NOT NULL,
  PRIMARY KEY  (`commentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of notes_comment
-- ----------------------------
INSERT INTO `notes_comment` VALUES ('1', '3', '4', '16', '好', '2020-06-03T10:00:01');
INSERT INTO `notes_comment` VALUES ('2', '3', '3', '16', '这是测试啊', '2020-06-04T11:37:45');
INSERT INTO `notes_comment` VALUES ('3', '3', '3', '16', '又来了一波测试', '2020-06-04T11:38:16');
INSERT INTO `notes_comment` VALUES ('4', '3', '3', '16', '还来测试', '2020-06-04T11:39:06');
INSERT INTO `notes_comment` VALUES ('5', '3', '3', '16', '这测试挺多', '2020-06-04T11:39:25');
INSERT INTO `notes_comment` VALUES ('7', '3', '3', '47', '和明白人说话，和踏实人做事，和厚道人谈情', '2020-06-04T15:11:01');
INSERT INTO `notes_comment` VALUES ('8', '3', '3', '18', '写的很好，学习了', '2020-06-04T15:23:10');
INSERT INTO `notes_comment` VALUES ('9', '3', '3', '23', '真的好用...', '2020-06-04T15:24:39');
INSERT INTO `notes_comment` VALUES ('10', '3', '3', '24', '分页工具类，很实用...', '2020-06-04T15:25:32');
INSERT INTO `notes_comment` VALUES ('11', '3', '3', '25', '金额转换，厉害', '2020-06-04T15:28:51');
INSERT INTO `notes_comment` VALUES ('12', '3', '3', '32', '修养很重要', '2020-06-04T15:29:56');
INSERT INTO `notes_comment` VALUES ('14', '4', '3', '47', '在手机上看到的，说的很好！', '2020-06-04T16:56:40');
INSERT INTO `notes_comment` VALUES ('15', '4', '3', '47', '真的好用...', '2020-06-04T17:14:41');
INSERT INTO `notes_comment` VALUES ('16', '4', '4', '40', '自由自在', '2020-06-04T17:32:51');
INSERT INTO `notes_comment` VALUES ('17', '4', '3', '47', '每次阅读都是对心灵的一次洗礼', '2020-06-05T09:59:08');
INSERT INTO `notes_comment` VALUES ('18', '3', '3', '47', '非常感谢大家的关注!', '2020-06-05T09:59:52');
INSERT INTO `notes_comment` VALUES ('19', '4', '3', '47', '良心作品', '2020-06-05T10:07:05');
INSERT INTO `notes_comment` VALUES ('20', '4', '3', '47', '写的很好', '2020-06-05T10:07:39');
INSERT INTO `notes_comment` VALUES ('21', '4', '3', '47', '百看不厌', '2020-06-05T10:07:59');
INSERT INTO `notes_comment` VALUES ('22', '3', '3', '47', '能收到如何高的评价，心里很激动！', '2020-06-05T10:10:46');
INSERT INTO `notes_comment` VALUES ('23', '3', '4', '40', '云淡风轻', '2020-06-08T16:34:14');
INSERT INTO `notes_comment` VALUES ('24', '3', '3', '51', '愿这个夏天，生如夏花，心如莲。', '2020-06-19T12:11:49');
INSERT INTO `notes_comment` VALUES ('25', '4', '3', '51', '清凉一夏', '2020-06-19T12:58:27');
