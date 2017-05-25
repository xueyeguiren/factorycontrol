/*
Navicat MySQL Data Transfer

Source Server         : aa
Source Server Version : 50635
Source Host           : localhost:3306
Source Database       : factorycontrol

Target Server Type    : MYSQL
Target Server Version : 50635
File Encoding         : 65001

Date: 2017-05-22 09:30:32
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for assemble
-- ----------------------------
DROP TABLE IF EXISTS `assemble`;
CREATE TABLE `assemble` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '此表为工序的加工过程的组合，如激光切，折弯',
  `postarray` varchar(20) NOT NULL COMMENT '工序组合，数字排列,(数字保留以待不时之需)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of assemble
-- ----------------------------
INSERT INTO `assemble` VALUES ('1', 'abcdef');
INSERT INTO `assemble` VALUES ('2', 'abddef');
INSERT INTO `assemble` VALUES ('3', 'abedef');
INSERT INTO `assemble` VALUES ('27', 'a');
INSERT INTO `assemble` VALUES ('28', 'abc');
INSERT INTO `assemble` VALUES ('29', 'accdef');
INSERT INTO `assemble` VALUES ('30', 'bdef');

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `department_name` varchar(40) DEFAULT NULL COMMENT '部门名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES ('1', '机加车间');

-- ----------------------------
-- Table structure for excel
-- ----------------------------
DROP TABLE IF EXISTS `excel`;
CREATE TABLE `excel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `excelname` varchar(40) DEFAULT NULL COMMENT '领料单名称（如568土豆清洗机）',
  `user_id` int(11) DEFAULT NULL COMMENT '设计人员',
  `insertdate` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of excel
-- ----------------------------
INSERT INTO `excel` VALUES ('14', 'K06-ES-645-S05-005', '1', '2017-02-18');
INSERT INTO `excel` VALUES ('16', 'K06-ES-645-S05-007', '1', '2017-02-18');

-- ----------------------------
-- Table structure for flow
-- ----------------------------
DROP TABLE IF EXISTS `flow`;
CREATE TABLE `flow` (
  `id` varchar(100) CHARACTER SET utf8 NOT NULL COMMENT '零件加工工序的id',
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `btime` datetime DEFAULT NULL COMMENT '加工开始时间',
  `etime` datetime DEFAULT NULL,
  `location_id` int(3) DEFAULT NULL COMMENT '位置id',
  `parts_id` int(11) DEFAULT NULL COMMENT '零件id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of flow
-- ----------------------------
INSERT INTO `flow` VALUES ('1', '2', '2017-03-14 09:17:45', null, null, null);
INSERT INTO `flow` VALUES ('2', '1', '2017-03-14 09:28:32', '2017-03-14 09:29:49', null, null);
INSERT INTO `flow` VALUES ('3', '1', '2017-03-14 09:28:32', '2017-03-14 09:29:49', null, null);

-- ----------------------------
-- Table structure for link
-- ----------------------------
DROP TABLE IF EXISTS `link`;
CREATE TABLE `link` (
  `link_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '发送修改密码链接',
  `user_id` int(11) unsigned DEFAULT NULL,
  `url` varchar(200) DEFAULT NULL COMMENT '链接的url',
  `createdate` bigint(20) DEFAULT NULL,
  `status` int(11) DEFAULT '0' COMMENT '是否使用此链接0表示未使用，1表示已使用',
  PRIMARY KEY (`link_id`),
  KEY `fk_link_1_idx` (`user_id`),
  CONSTRAINT `fk_link_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=129 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of link
-- ----------------------------
INSERT INTO `link` VALUES ('127', '30', 'http://192.168.10.158:9099/auto/user/verifyLink/30/755d2c17bac80ea637c462a9aa72925b6724d5030c6ee98ec6ae673c82340b76', '1480919700351', '0');
INSERT INTO `link` VALUES ('128', '30', 'http://192.168.10.158:9099/auto/user/verifyLink/30/a3d6baf019946ee08b97c99159ddffd75bd8747ff730b5b5b461281d51f3a70b', '1480920248063', '0');

-- ----------------------------
-- Table structure for location
-- ----------------------------
DROP TABLE IF EXISTS `location`;
CREATE TABLE `location` (
  `location_id` int(11) NOT NULL,
  `locationname` varchar(255) NOT NULL COMMENT '位置编号(2位数字字母组合)',
  PRIMARY KEY (`location_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of location
-- ----------------------------
INSERT INTO `location` VALUES ('1', 'A1');

-- ----------------------------
-- Table structure for parts
-- ----------------------------
DROP TABLE IF EXISTS `parts`;
CREATE TABLE `parts` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '零件信息表的id',
  `code` varchar(30) CHARACTER SET utf8 NOT NULL COMMENT '物料代码',
  `drawing` varchar(40) CHARACTER SET utf8 DEFAULT NULL COMMENT '图纸编号',
  `name` varchar(40) CHARACTER SET utf8 DEFAULT NULL COMMENT '零件名称',
  `size` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '零件尺寸',
  `material` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '零件材质',
  `pieces` varchar(10) CHARACTER SET utf8 DEFAULT NULL COMMENT '单位：1个/台。。。',
  `amount` int(4) NOT NULL COMMENT '需要数量',
  `assemble_id` int(11) DEFAULT NULL COMMENT '工序组合id',
  `excel_id` int(11) DEFAULT NULL COMMENT '领料单编号（包含有设备编号）',
  `state` int(1) DEFAULT NULL COMMENT '是否完成所有工序,0代表未开始，1代表未完成，2代表完成',
  PRIMARY KEY (`id`),
  KEY `excellist_id` (`excel_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of parts
-- ----------------------------
INSERT INTO `parts` VALUES ('1', '1', 'BDJX049.1001', '柜门', '1.3×347×267×15', '201', '件', '1', '1', '14', null);
INSERT INTO `parts` VALUES ('2', '二维', '呜呜呜呜', '侧板一', '1.3×200×317.5×15', '201', '件', '1', '1', '14', null);
INSERT INTO `parts` VALUES ('3', '08.12.163.0059', 'BDJX049.1002.2', '侧板二', '1.3×320×397.5×200', '201', '件', '1', '2', '14', null);
INSERT INTO `parts` VALUES ('4', '08.12.163.0060', 'BDJX049.1002.3', '侧板三', '1.3×200×317.5×15', '201', '件', '1', '1', '14', null);
INSERT INTO `parts` VALUES ('5', '02.12.001.0007', '', '直角回转锁', '', '复合件', '件', '1', '1', '14', null);
INSERT INTO `parts` VALUES ('6', '02.12.003.0002', '', '高级门窗插', '', '复合件', '件', '2', '1', '14', null);
INSERT INTO `parts` VALUES ('7', '08.12.163.0057', 'BDJX049.1001', '柜门', '1.3×347×267×15', '201', '件', '1', '1', '16', null);
INSERT INTO `parts` VALUES ('8', '08.12.163.0058', 'BDJX049.1002.1', '侧板一', '1.3×200×317.5×15', '201', '件', '1', '1', '16', null);
INSERT INTO `parts` VALUES ('9', '08.12.163.0059', 'BDJX049.1002.2', '侧板二', '1.3×320×397.5×200', '201', '件', '1', '1', '16', null);
INSERT INTO `parts` VALUES ('10', '02.12.001.0007', '', '直角回转锁', '', '复合件', '件', '1', '1', '16', null);
INSERT INTO `parts` VALUES ('13', '08.12.163.0060', 'BDJX049.1002.3', '侧板三', '1.3×200×317.5×15', '201', '件', '1', '1', '16', null);
INSERT INTO `parts` VALUES ('14', '02.12.003.0002', '', '高级门窗插', '', '复合件', '件', '2', '1', '16', null);

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '权限id',
  `permission_name` varchar(32) DEFAULT NULL COMMENT '权限名',
  `permission_sign` varchar(128) DEFAULT NULL COMMENT '权限标识,程序中判断使用,如"user:create"',
  `description` varchar(256) DEFAULT NULL COMMENT '权限描述,UI界面显示使用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='权限表';

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES ('1', '用户新增', 'user:create', null);

-- ----------------------------
-- Table structure for post
-- ----------------------------
DROP TABLE IF EXISTS `post`;
CREATE TABLE `post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) CHARACTER SET utf8 NOT NULL COMMENT '工序名称，以汉字，如激光切',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of post
-- ----------------------------
INSERT INTO `post` VALUES ('1', '切');
INSERT INTO `post` VALUES ('2', '检');
INSERT INTO `post` VALUES ('3', '仓');
INSERT INTO `post` VALUES ('4', '领');
INSERT INTO `post` VALUES ('5', '磨');
INSERT INTO `post` VALUES ('6', '割');
INSERT INTO `post` VALUES ('7', '钳');
INSERT INTO `post` VALUES ('59', 'a');
INSERT INTO `post` VALUES ('60', 'b');
INSERT INTO `post` VALUES ('61', 'c');
INSERT INTO `post` VALUES ('62', '辅导费');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '角色id',
  `role_name` varchar(32) DEFAULT NULL COMMENT '角色名',
  `role_sign` varchar(128) DEFAULT NULL COMMENT '角色标识,程序中判断使用,如"admin"',
  `description` varchar(256) DEFAULT NULL COMMENT '角色描述,UI界面显示使用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='角色表';

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', 'admin', 'admin', '管理员');

-- ----------------------------
-- Table structure for role_permission
-- ----------------------------
DROP TABLE IF EXISTS `role_permission`;
CREATE TABLE `role_permission` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '表id',
  `role_id` bigint(20) unsigned DEFAULT NULL COMMENT '角色id',
  `permission_id` bigint(20) unsigned DEFAULT NULL COMMENT '权限id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='角色与权限关联表';

-- ----------------------------
-- Records of role_permission
-- ----------------------------
INSERT INTO `role_permission` VALUES ('1', '2', '1');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `name` varchar(50) DEFAULT NULL COMMENT '用户姓名',
  `password` char(64) DEFAULT NULL COMMENT '密码',
  `state` varchar(32) DEFAULT NULL COMMENT '状态，是否激活',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `email` varchar(45) DEFAULT NULL COMMENT 'email 也作为登陆',
  `post_id` varchar(255) DEFAULT NULL COMMENT '岗位id',
  `department_id` varchar(20) DEFAULT NULL COMMENT '部门id',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='用户表';

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '毛金龙', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', null, '2014-07-17 12:59:08', 'jxsjb', '1', '机械设计部');
INSERT INTO `user` VALUES ('2', 'hao', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '1', '2017-02-11 15:35:12', 'scglb', '1', ' 生产管理部');
INSERT INTO `user` VALUES ('3', 'aa', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', null, '2016-11-29 14:02:32', 'jjcj', '3', '机加车间');
INSERT INTO `user` VALUES ('25', '111jjajf是是是', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', null, '2016-11-29 14:11:05', '11111111@163.com', null, null);
INSERT INTO `user` VALUES ('29', '123456', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', null, '2016-11-30 16:35:10', '1007200206@qq.com', null, null);
INSERT INTO `user` VALUES ('30', '温守钦', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', null, '2016-12-01 12:45:00', '943545138@qq.com', null, null);
INSERT INTO `user` VALUES ('37', '毛金龙', '15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225', null, '2016-12-09 08:29:43', '894121196@qq.com', null, null);
INSERT INTO `user` VALUES ('38', '毛金龙', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', null, '2016-12-09 15:41:15', '8941211926@qq.com', null, null);
INSERT INTO `user` VALUES ('39', '毛金龙', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', null, '2016-12-09 15:43:10', '8941212196@qq.com', null, null);
INSERT INTO `user` VALUES ('40', '毛金龙', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', null, '2016-12-09 16:10:25', '123456@qq.com', null, null);
INSERT INTO `user` VALUES ('45', 'a', 'ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb', null, '2017-02-20 18:16:55', '15738328757@163.com', null, null);
INSERT INTO `user` VALUES ('46', 'a', 'ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb', null, '2017-02-20 18:23:44', '12@q.com', null, null);
INSERT INTO `user` VALUES ('47', 'a', 'ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb', null, '2017-02-20 18:31:03', '111111111@qq.co', null, null);
INSERT INTO `user` VALUES ('48', 'a', 'ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb', null, '2017-02-20 18:33:54', 'aaa@q.com', null, null);
INSERT INTO `user` VALUES ('49', 'a', 'ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb', null, '2017-02-21 17:04:19', '8941211916@qq.com', null, null);
INSERT INTO `user` VALUES ('50', 'HSL0210', '1064ca11a0e1c2af3a107249cf5a2b92b40f8e2d62d2abe0c9475f4546ae2b8d', null, '2017-02-22 08:04:36', 'liusanhai@bodawb.com', null, null);
INSERT INTO `user` VALUES ('51', '飞鱼', '3e6eff7f69bc06e99d2040f7aa28991d0789b430b95efe2d41cc3e64d2ac4ff8', null, '2017-02-22 10:04:26', '993462509@qq.com', null, null);

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '表id',
  `user_id` bigint(20) unsigned DEFAULT NULL COMMENT '用户id',
  `role_id` bigint(20) unsigned DEFAULT NULL COMMENT '角色id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='用户与角色关联表';

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES ('1', '1', '1');
