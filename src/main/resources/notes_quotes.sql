/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50022
Source Host           : localhost:3306
Source Database       : notes

Target Server Type    : MYSQL
Target Server Version : 50022
File Encoding         : 65001

Date: 2020-10-22 09:51:14
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for notes_quotes
-- ----------------------------
DROP TABLE IF EXISTS `notes_quotes`;
CREATE TABLE `notes_quotes` (
  `quotesId` int(11) NOT NULL auto_increment,
  `quotesAuthor` varchar(25) NOT NULL,
  `quotesContent` text NOT NULL,
  PRIMARY KEY  (`quotesId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of notes_quotes
-- ----------------------------
INSERT INTO `notes_quotes` VALUES ('1', 'wlv', '任何事情都是这样一个过程，决定去做了，就着手去做，一旦找到了舒适区，你就会乐在其中，或许就发现：“喜欢比努力更重要。”乐在其中地去坚持一件事，总好过天天暗示自己“你必须这么做”要来得容易且长久。永远充满喜悦地唱每一首歌，跳每一段舞，看每一场球赛，过每一段人生。');
INSERT INTO `notes_quotes` VALUES ('2', 'wlv', '十年前你是谁，一年前你是谁，甚至昨天你是谁都不重要。重要的是，今天你是谁，以及明天，未来你将成为谁。');
INSERT INTO `notes_quotes` VALUES ('3', 'wlv', '我能接受黑暗，是因为我从未见过光明，如果有天我看到了光明，我会不顾一切得到它！');
INSERT INTO `notes_quotes` VALUES ('4', '苏格拉底', '最有希望的成功者，并不是才干出众的人而是那些最善利用每一时机去发掘开拓的人。');
INSERT INTO `notes_quotes` VALUES ('5', '鲍勃·迪伦', '白日的时光静寂缓慢，我们注视着前方，努力不使之偏向，就像夏日的红玫瑰逐日盛开，时光静寂流逝，永不复返。');
INSERT INTO `notes_quotes` VALUES ('6', '林徽因', '人说，背上行囊就是过客，放下包袱就找到了故乡，其实每个人都明白，人生没有绝对的安稳，既然我们都是过客，就该携一颗从容淡泊的心，走过山重水复的流年，笑看风尘起落的人间。');
INSERT INTO `notes_quotes` VALUES ('7', '三毛', '我们的父母是恒星，我们回家，他们永远是在的；我们的朋友是恒星，有的时候来，有的时候去，但他们也是天空中的星；那么流星我把它看作为哪一种人呢？我把它看为在我们生命中擦肩而过的，可能你今生再也不会碰到的人，我将他们叫做流星。');
INSERT INTO `notes_quotes` VALUES ('8', '奥德丽·尼芬格', '最近我对时间的感觉有点特别，仿佛时间在我身上走得比别人慢一些，一个下午犹如一整天，一程地铁仿佛一场史诗之旅。');
INSERT INTO `notes_quotes` VALUES ('9', '史铁生', '微笑着，去唱生活的歌谣。不要抱怨生活给予了太多的磨难，不必抱怨生命中有太多的曲折。大海如果失去了巨浪的翻滚，就会失去雄浑，沙漠如果失去了飞沙的狂舞，就会失去壮观，人生如果仅去求得两点一线的一帆风顺，生命也就失去了存在的魅力。');
INSERT INTO `notes_quotes` VALUES ('10', '杰克·凯鲁亚克《在路上》', '我一辈子都喜欢跟着让我有感觉有兴趣的人在一起，因为在我心目中，真正的人都是疯疯癫癫的，他们热爱生活，爱聊天，不露锋芒，希望拥有一切，他们从不疲倦，从不讲些平凡的东西，而是像奇妙的黄色罗马烟火那样不停地喷发火球，火花。');
INSERT INTO `notes_quotes` VALUES ('11', '三毛《温柔的夜》', '黄昏便是不同，它是温柔的夜的前奏，是释放、舒畅，教人享受生命最甜美的一段时光。');
INSERT INTO `notes_quotes` VALUES ('12', '林徽因《你是人间的四月天》', '你是四月早天里的云烟，黄昏吹着风的软，星子在无意中闪，细雨点洒在花前。');
INSERT INTO `notes_quotes` VALUES ('13', '莎士比亚', '不应当急于求成，应当去熟悉自己的研究对象，锲而不舍，时间会成全一切。凡事开始最难，然而更难的是何以善终。');
