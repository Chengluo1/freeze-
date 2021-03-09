/*
Navicat MySQL Data Transfer

Source Server         : freeze112
Source Server Version : 50720
Source Host           : localhost:3306
Source Database       : freeze112

Target Server Type    : MYSQL
Target Server Version : 50720
File Encoding         : 65001

Date: 2021-01-24 21:42:03
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `adminID` varchar(10) NOT NULL,
  `name` varchar(10) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `profilePhoto` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`adminID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('01', '范怡玲', '1', '19858128166', null);

-- ----------------------------
-- Table structure for apprise
-- ----------------------------
DROP TABLE IF EXISTS `apprise`;
CREATE TABLE `apprise` (
  `appriseID` int(11) NOT NULL,
  `employerID` varchar(10) DEFAULT NULL,
  `photographerID` varchar(10) DEFAULT NULL,
  `content` varchar(500) NOT NULL,
  `score` int(11) DEFAULT NULL,
  PRIMARY KEY (`appriseID`) USING BTREE,
  KEY `employerID` (`employerID`) USING BTREE,
  KEY `designerID` (`photographerID`) USING BTREE,
  CONSTRAINT `apprise_ibfk_1` FOREIGN KEY (`employerID`) REFERENCES `employer` (`employerID`),
  CONSTRAINT `apprise_ibfk_2` FOREIGN KEY (`photographerID`) REFERENCES `photographer` (`photographerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of apprise
-- ----------------------------
INSERT INTO `apprise` VALUES ('1', '1000000001', '01111111', '很不错的小姐姐！拍得很好！', '10');

-- ----------------------------
-- Table structure for comments
-- ----------------------------
DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments` (
  `commentsID` int(11) NOT NULL,
  `exampleID` int(11) DEFAULT NULL,
  `content` varchar(100) NOT NULL,
  `reviewer` varchar(20) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`commentsID`) USING BTREE,
  KEY `exampleID` (`exampleID`) USING BTREE,
  CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`exampleID`) REFERENCES `example` (`exampleID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of comments
-- ----------------------------
INSERT INTO `comments` VALUES ('1', '1', '好看！', '1000000001', '2021-01-08 04:38:01', '0');
INSERT INTO `comments` VALUES ('2', '3', '好看！！！喜欢！', '1000000001', '2021-01-08 05:21:48', null);
INSERT INTO `comments` VALUES ('3', '2', '好看好看', '1000000001', '2021-01-08 05:27:58', null);
INSERT INTO `comments` VALUES ('4', '2', '真好看真好看', '1000000001', '2021-01-08 05:31:02', null);
INSERT INTO `comments` VALUES ('5', '2', '真好看真好看', '1000000001', '2021-01-08 05:33:18', null);
INSERT INTO `comments` VALUES ('6', '1', '！不错！！！', '1000000001', '2021-01-12 16:19:03', null);
INSERT INTO `comments` VALUES ('7', '1', '我觉得这个摄影师技术不怎么样，不好看。快点退圈吧。', '1000000001', '2021-01-12 16:19:37', '1');
INSERT INTO `comments` VALUES ('8', '3', '111', '01111111', '2021-01-13 10:23:32', null);
INSERT INTO `comments` VALUES ('9', '2', '111', '1000000001', '2021-01-13 15:10:41', null);

-- ----------------------------
-- Table structure for employer
-- ----------------------------
DROP TABLE IF EXISTS `employer`;
CREATE TABLE `employer` (
  `employerID` varchar(10) NOT NULL,
  `account` varchar(20) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `password` varchar(20) NOT NULL,
  `IDNumber` varchar(18) DEFAULT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `sex` tinyint(4) DEFAULT NULL,
  `region` varchar(20) DEFAULT NULL,
  `wechat` varchar(20) DEFAULT NULL,
  `qq` varchar(20) DEFAULT NULL,
  `profilePhoto` varchar(180) DEFAULT NULL,
  `hmpgbkg` varchar(180) DEFAULT NULL,
  PRIMARY KEY (`employerID`) USING BTREE,
  UNIQUE KEY `account` (`account`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of employer
-- ----------------------------
INSERT INTO `employer` VALUES ('1000000001', '谌惠', '谌惠', '1', '331023200005216654', '14536277722', '7657635265@qq.com', '0', '杭州', '1223133', '1223133', '4.jpg', null);
INSERT INTO `employer` VALUES ('1000000002', '胡皓睿', '胡皓睿', '1', '331023200005216698', '18368523651', '7454265@qq.com', '1', '杭州', '1223133', '1223133', '5.jpg', null);
INSERT INTO `employer` VALUES ('1000000003', '王程飞', '王程飞', '1', '331023200005216690', '18368523653', '64335265@qq.com', '1', '杭州', '1223133', '1223133', '6.jpg', null);
INSERT INTO `employer` VALUES ('1000000004', '19858123458', null, '1', null, '19858123458', null, null, null, null, null, null, null);
INSERT INTO `employer` VALUES ('1000000005', '1985718588', null, '1', null, '1985718588', null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for example
-- ----------------------------
DROP TABLE IF EXISTS `example`;
CREATE TABLE `example` (
  `exampleID` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  `photographerID` varchar(10) DEFAULT NULL,
  `style` varchar(20) DEFAULT NULL,
  `praise` int(11) DEFAULT NULL,
  `area` varchar(10) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `visits` int(11) DEFAULT NULL,
  `status` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`exampleID`) USING BTREE,
  KEY `designerID` (`photographerID`) USING BTREE,
  CONSTRAINT `example_ibfk_1` FOREIGN KEY (`photographerID`) REFERENCES `photographer` (`photographerID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of example
-- ----------------------------
INSERT INTO `example` VALUES ('1', '案例1', '描述1', '01111111', '少年', '2', '内景', '2021-01-08 03:42:27', '2', '2');
INSERT INTO `example` VALUES ('2', '案例2', '描述2', '01111111', '日系', '2', '外景', '2021-01-08 03:43:32', '4', null);
INSERT INTO `example` VALUES ('3', '案例3', '描述3', '01111112', '日系', '1', '外景', '2021-01-08 03:46:12', '2', '2');
INSERT INTO `example` VALUES ('4', '案例4', '描述4', '01111112', '清新', '0', '外景', '2021-01-08 03:47:07', '0', null);

-- ----------------------------
-- Table structure for examplepanorama
-- ----------------------------
DROP TABLE IF EXISTS `examplepanorama`;
CREATE TABLE `examplepanorama` (
  `exampleID` int(11) DEFAULT NULL,
  `panorama` varchar(180) NOT NULL,
  PRIMARY KEY (`panorama`) USING BTREE,
  KEY `exampleID` (`exampleID`) USING BTREE,
  CONSTRAINT `examplepanorama_ibfk_1` FOREIGN KEY (`exampleID`) REFERENCES `example` (`exampleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of examplepanorama
-- ----------------------------
INSERT INTO `examplepanorama` VALUES (null, 'file/01111111/1/panoramas/0.jpg');
INSERT INTO `examplepanorama` VALUES ('1', 'file/01111111/案例1/panoramas/0.jpg');
INSERT INTO `examplepanorama` VALUES ('2', 'file/01111111/案例2/panoramas/0.jpg');
INSERT INTO `examplepanorama` VALUES ('3', 'file/01111112/案例3/panoramas/0.jpg');
INSERT INTO `examplepanorama` VALUES ('4', 'file/01111112/案例4/panoramas/0.jpg');

-- ----------------------------
-- Table structure for examplepicture
-- ----------------------------
DROP TABLE IF EXISTS `examplepicture`;
CREATE TABLE `examplepicture` (
  `exampleID` int(11) DEFAULT NULL,
  `picture` varchar(180) NOT NULL,
  PRIMARY KEY (`picture`) USING BTREE,
  KEY `exampleID` (`exampleID`) USING BTREE,
  CONSTRAINT `examplepicture_ibfk_1` FOREIGN KEY (`exampleID`) REFERENCES `example` (`exampleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of examplepicture
-- ----------------------------
INSERT INTO `examplepicture` VALUES (null, 'file/01111111/1/pictures/0.jpg');
INSERT INTO `examplepicture` VALUES ('1', 'file/01111111/案例1/pictures/0.jpg');
INSERT INTO `examplepicture` VALUES ('1', 'file/01111111/案例1/pictures/1.jpg');
INSERT INTO `examplepicture` VALUES ('2', 'file/01111111/案例2/pictures/0.jpg');
INSERT INTO `examplepicture` VALUES ('3', 'file/01111112/案例3/pictures/0.jpg');
INSERT INTO `examplepicture` VALUES ('3', 'file/01111112/案例3/pictures/1.jpg');
INSERT INTO `examplepicture` VALUES ('4', 'file/01111112/案例4/pictures/0.jpg');
INSERT INTO `examplepicture` VALUES ('4', 'file/01111112/案例4/pictures/1.jpg');

-- ----------------------------
-- Table structure for follow
-- ----------------------------
DROP TABLE IF EXISTS `follow`;
CREATE TABLE `follow` (
  `photographerID` varchar(10) DEFAULT NULL,
  `follower` varchar(10) DEFAULT NULL,
  KEY `designerID` (`photographerID`) USING BTREE,
  CONSTRAINT `follow_ibfk_1` FOREIGN KEY (`photographerID`) REFERENCES `photographer` (`photographerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of follow
-- ----------------------------

-- ----------------------------
-- Table structure for needs
-- ----------------------------
DROP TABLE IF EXISTS `needs`;
CREATE TABLE `needs` (
  `needsID` int(11) NOT NULL,
  `title` varchar(20) NOT NULL,
  `description` varchar(500) NOT NULL,
  `employerID` varchar(10) DEFAULT NULL,
  `style` varchar(20) DEFAULT NULL,
  `time1` datetime DEFAULT NULL,
  `time2` date DEFAULT NULL,
  `time3` date DEFAULT NULL,
  `money` float DEFAULT NULL,
  `enrollment` int(11) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `area` int(11) DEFAULT NULL,
  PRIMARY KEY (`needsID`) USING BTREE,
  KEY `employerID` (`employerID`) USING BTREE,
  CONSTRAINT `needs_ibfk_1` FOREIGN KEY (`employerID`) REFERENCES `employer` (`employerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of needs
-- ----------------------------
INSERT INTO `needs` VALUES ('1', '想要找一个经验十足的摄影师，风格要轻熟的', '想要找一个经验十足的摄影师，风格要轻熟的', '1000000001', '轻熟', '2021-01-08 03:15:04', '2021-01-15', '2021-02-05', '600', '2', '杭州', '1');
INSERT INTO `needs` VALUES ('2', '私房写真', '想记录下身体最迷人的时刻，但是没有拍摄私房照的经验，所以动作可能会比较僵硬，且本人性格腼腆，希望摄影师可以多加指点！', '1000000002', '私房', '2021-01-08 03:25:27', '2021-01-17', '2021-02-06', '666', '2', '杭州', '1');

-- ----------------------------
-- Table structure for orderr
-- ----------------------------
DROP TABLE IF EXISTS `orderr`;
CREATE TABLE `orderr` (
  `orderrID` varchar(40) NOT NULL,
  `title` varchar(20) NOT NULL,
  `employerID` varchar(10) DEFAULT NULL,
  `photographerID` varchar(10) DEFAULT NULL,
  `beginTime` datetime DEFAULT NULL,
  `money` float NOT NULL,
  `state` varchar(5) DEFAULT NULL,
  `finishTime` datetime DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`orderrID`) USING BTREE,
  KEY `employerID` (`employerID`) USING BTREE,
  KEY `designerID` (`photographerID`) USING BTREE,
  CONSTRAINT `orderr_ibfk_1` FOREIGN KEY (`employerID`) REFERENCES `employer` (`employerID`),
  CONSTRAINT `orderr_ibfk_2` FOREIGN KEY (`photographerID`) REFERENCES `photographer` (`photographerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of orderr
-- ----------------------------
INSERT INTO `orderr` VALUES ('20210108033136654', '少女写真', '1000000001', '01111111', '2021-01-08 03:31:36', '500', '已完成', '2021-02-01 00:00:00', '想要拍的活泼阳光，充满朝气，宛如十八岁少女！');

-- ----------------------------
-- Table structure for photographer
-- ----------------------------
DROP TABLE IF EXISTS `photographer`;
CREATE TABLE `photographer` (
  `photographerID` varchar(10) NOT NULL,
  `account` varchar(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `IDNumber` varchar(18) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `sex` tinyint(4) DEFAULT NULL,
  `region` varchar(20) DEFAULT NULL,
  `wechat` varchar(20) DEFAULT NULL,
  `qq` varchar(20) DEFAULT NULL,
  `score` tinyint(4) DEFAULT NULL,
  `profilePhoto` varchar(180) DEFAULT NULL,
  `introduction` varchar(500) DEFAULT NULL,
  `fans` int(11) DEFAULT NULL,
  `praise` int(11) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `title` varchar(10) DEFAULT NULL,
  `prize` varchar(200) DEFAULT NULL,
  `certificate` varchar(100) DEFAULT NULL,
  `message` varchar(500) DEFAULT NULL,
  `status1` int(11) DEFAULT NULL,
  `visits` int(11) DEFAULT NULL,
  `money1` int(11) DEFAULT NULL,
  PRIMARY KEY (`photographerID`) USING BTREE,
  UNIQUE KEY `account` (`account`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of photographer
-- ----------------------------
INSERT INTO `photographer` VALUES ('01111111', '戴卓燃', '戴卓燃', '1', '330621199712215926', '19857185754', '598916534@qq.com', '0', '杭州', 'dzr23333', '598916534', '4', '1.jpg', '照片风格时尚大气，具有强烈的视觉冲击力。作品曾刊登在《今日人像》、《人像摄影》、《摄影之友》、《影像视觉》等专业摄影杂志，以及《1626》、《新潮》、《读成》、《HIG-LIVE》、《印象》等时尚杂志，擅长用对比的手法来表现作品。90后新生代代表，国内崛起的第一个90后签约女摄影师。', '251', '56', '已审核', '高级摄影师', '牛皮奖', 'z3.jpg', '', '2', '200', '0');
INSERT INTO `photographer` VALUES ('01111112', '郑楚阳', '郑楚阳', '1', '331081199910183712', '18658667609', '652832560@qq.com', '1', '金华', 'chuya652832560', '652832560', '3', '2.jpg', '西安摄影网、西安摄影论坛、长安摄影网的创始人兼 CEO。尼克尔特约讲师、神牛签约摄影师、曾担任过第一届中国首席模特大赛评委、摄影总导演、第六十二届、六十三届世界小姐选美比赛评委、摄影总导演、第六十八届世界小姐.陕西赛区首届真人秀《真善美之光》特邀评审导师、西安职业技术学院聘请侯伟为我院动漫设计与制作专业客座教授等。', '20', '21', '审核中', '', '白莲花奖', 'z2.jpg', '', '2', '13', null);
INSERT INTO `photographer` VALUES ('01111113', '陈漫', '陈漫', '1', '0000000', '13858688888', '123456789@qq.com', '0', '北京', '123456789', '123456789', '5', '3.jpg', '中国时尚摄影师、视觉艺术家，毕业于中央美术学院。2003年，陈漫开始为《青年视觉》杂志拍摄封面；之后，凭借一系列为《青年视觉》拍摄的作品，在时尚圈崭露头角。', '300', '28', '已审核', '高级设计师', '金牛摄影一等奖', 'z1.jpg', null, '2', '510', '0');
INSERT INTO `photographer` VALUES ('01111114', '17777777777', '', '1', '', '17777777777', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for signup
-- ----------------------------
DROP TABLE IF EXISTS `signup`;
CREATE TABLE `signup` (
  `needsID` int(11) NOT NULL,
  `photographerID` varchar(10) NOT NULL,
  PRIMARY KEY (`needsID`,`photographerID`) USING BTREE,
  KEY `designerID` (`photographerID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of signup
-- ----------------------------
INSERT INTO `signup` VALUES ('1', '01111111');
INSERT INTO `signup` VALUES ('2', '01111111');
INSERT INTO `signup` VALUES ('1', '01111112');
INSERT INTO `signup` VALUES ('2', '01111112');

-- ----------------------------
-- Table structure for star
-- ----------------------------
DROP TABLE IF EXISTS `star`;
CREATE TABLE `star` (
  `exampleID` int(11) NOT NULL,
  `collecter` varchar(10) NOT NULL,
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`exampleID`,`collecter`) USING BTREE,
  CONSTRAINT `star_ibfk_1` FOREIGN KEY (`exampleID`) REFERENCES `example` (`exampleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of star
-- ----------------------------
INSERT INTO `star` VALUES ('1', '1000000001', null);
INSERT INTO `star` VALUES ('2', '1000000001', null);

-- ----------------------------
-- Table structure for subscribe
-- ----------------------------
DROP TABLE IF EXISTS `subscribe`;
CREATE TABLE `subscribe` (
  `subscribeID` int(11) NOT NULL DEFAULT '0',
  `title` varchar(20) NOT NULL,
  `description` varchar(500) NOT NULL,
  `subscriber` varchar(10) DEFAULT NULL,
  `scriber` varchar(10) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `money` float DEFAULT NULL,
  `status` int(10) DEFAULT NULL,
  PRIMARY KEY (`subscribeID`) USING BTREE,
  KEY `scriber` (`scriber`) USING BTREE,
  KEY `subscriber` (`subscriber`) USING BTREE,
  CONSTRAINT `subscribe_ibfk_1` FOREIGN KEY (`scriber`) REFERENCES `photographer` (`photographerID`),
  CONSTRAINT `subscribe_ibfk_2` FOREIGN KEY (`subscriber`) REFERENCES `employer` (`employerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of subscribe
-- ----------------------------
INSERT INTO `subscribe` VALUES ('1', '日杂风格人像摄影', '拍摄对象是女孩子，没有约拍经验，可能会比较生疏，动作比较僵硬，需要摄影师引导！', '1000000001', '01111112', '2021-01-08 03:16:45', '400', '4');
INSERT INTO `subscribe` VALUES ('2', '少女写真', '想要拍的活泼阳光，充满朝气，宛如十八岁少女！', '1000000001', '01111111', '2021-01-08 03:22:57', '500', '2');
INSERT INTO `subscribe` VALUES ('3', '新年合家欢', '想要拍一份全家福作为纪念珍藏起来，希望照片里的大家都是元气满满的样子！', '1000000002', '01111111', '2021-01-08 03:27:00', '888', '1');
INSERT INTO `subscribe` VALUES ('4', '1', '1', '1000000001', '01111112', '2021-01-13 10:25:14', '100', '1');

-- ----------------------------
-- Table structure for webdata
-- ----------------------------
DROP TABLE IF EXISTS `webdata`;
CREATE TABLE `webdata` (
  `dataid` int(11) NOT NULL AUTO_INCREMENT,
  `visit` int(11) DEFAULT NULL,
  `examplenum` int(11) DEFAULT NULL,
  `photographernum` int(11) DEFAULT NULL,
  `employernum` int(11) DEFAULT NULL,
  `ordernum` int(11) DEFAULT NULL,
  `data` datetime DEFAULT NULL,
  PRIMARY KEY (`dataid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of webdata
-- ----------------------------
INSERT INTO `webdata` VALUES ('1', '10', '3', '3', '5', '7', null);
INSERT INTO `webdata` VALUES ('2', '7', '7', '2', '8', '1', null);
INSERT INTO `webdata` VALUES ('3', '4', '3', '6', '5', '2', '2019-12-10 11:15:18');
INSERT INTO `webdata` VALUES ('4', '5', '7', '8', '2', '2', null);
INSERT INTO `webdata` VALUES ('5', '5', '3', '5', '5', '6', null);
