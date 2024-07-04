/*
Navicat MySQL Data Transfer

Source Server         : chaoke
Source Server Version : 50711
Source Host           : localhost:3306
Source Database       : tijian

Target Server Type    : MYSQL
Target Server Version : 50711
File Encoding         : 65001

Date: 2024-06-30 23:20:10
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `checkitem`
-- ----------------------------
DROP TABLE IF EXISTS `checkitem`;
CREATE TABLE `checkitem` (
  `ciId` int(11) NOT NULL AUTO_INCREMENT COMMENT '检查项编号',
  `ciName` varchar(30) DEFAULT NULL COMMENT '检查项名称',
  `ciContent` varchar(200) DEFAULT NULL COMMENT '检查项内容',
  `meaning` varchar(200) DEFAULT NULL COMMENT '检查项意义',
  `remarks` varchar(50) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`ciId`)
) ENGINE=InnoDB AUTO_INCREMENT=1005 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of checkitem
-- ----------------------------
INSERT INTO `checkitem` VALUES ('1001', '血液化验', '转胺酶检查', '肝病提前预警', 'mark血常规检查项');
INSERT INTO `checkitem` VALUES ('1002', 'bbbb', 'content bbbb my bbb', 'meanbbbb', 'markbbbd');
INSERT INTO `checkitem` VALUES ('1003', 'cccc', 'content ccc my ccc', 'meancccc', 'markcccd');
INSERT INTO `checkitem` VALUES ('1004', 'dddd', 'content ddd myddd', 'meandddd', 'markdddd');

-- ----------------------------
-- Table structure for `checkitemdetailed`
-- ----------------------------
DROP TABLE IF EXISTS `checkitemdetailed`;
CREATE TABLE `checkitemdetailed` (
  `cdId` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) DEFAULT NULL COMMENT '检查项明细名称',
  `unit` varchar(20) DEFAULT NULL COMMENT '检查项明细单位',
  `minrange` double(8,1) DEFAULT NULL COMMENT '检查项明细正常值范围中的最小值',
  `maxrange` double(8,1) DEFAULT NULL COMMENT '检查项明细正常值范围中的最大值',
  `normalValue` varchar(20) DEFAULT NULL COMMENT '检查项明细正常值(非数字型)',
  `normalValueString` varchar(20) DEFAULT NULL COMMENT '检查项验证范围说明文字',
  `type` int(1) DEFAULT NULL COMMENT '检查项明细类型1数值范围验证型2数值相等验证型3无需验证4描述型5其它',
  `ciId` int(11) DEFAULT NULL COMMENT '所属检查项编号',
  `remarks` varchar(100) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`cdId`)
) ENGINE=InnoDB AUTO_INCREMENT=2002 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of checkitemdetailed
-- ----------------------------
INSERT INTO `checkitemdetailed` VALUES ('2001', '转胺酶检查', '检查项单位转胺001', '1000.0', '2000.0', 'cc2000', 'cc1000至cc5000', '1', '1001', 'remark转胺酶检查');

-- ----------------------------
-- Table structure for `cidetailedreport`
-- ----------------------------
DROP TABLE IF EXISTS `cidetailedreport`;
CREATE TABLE `cidetailedreport` (
  `cidrId` int(11) NOT NULL AUTO_INCREMENT COMMENT '检查项明细报告编号',
  `name` varchar(40) DEFAULT NULL COMMENT '检查项明细名称',
  `unit` varchar(20) DEFAULT NULL COMMENT '检查项明细单位',
  `minrange` double(8,1) DEFAULT NULL COMMENT '检查项明细正常值范围中的最小值',
  `maxrange` double(8,1) DEFAULT NULL COMMENT '检查项明细正常值范围中的最大值',
  `normalValue` varchar(20) DEFAULT NULL COMMENT '检查项明细正常值(非数字型)',
  `normalValueString` varchar(20) DEFAULT NULL COMMENT '检查项验证范围说明文字',
  `type` int(1) DEFAULT NULL COMMENT '检查项明细类型1数值范围验证型2数值相等验证型3无需验证4描述型5其它',
  `value` varchar(100) DEFAULT NULL COMMENT '检查项目明细值',
  `isError` int(1) DEFAULT NULL COMMENT '此项是否异常0无异常1异常',
  `ciId` int(11) DEFAULT NULL COMMENT '所属检查项报告编号',
  `orderId` int(11) DEFAULT NULL COMMENT '所属预约编号',
  PRIMARY KEY (`cidrId`)
) ENGINE=InnoDB AUTO_INCREMENT=300002 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cidetailedreport
-- ----------------------------
INSERT INTO `cidetailedreport` VALUES ('300001', '转胺酶检查', '检查项单位转胺001', '1000.0', '2000.0', 'cc2000', 'cc1000至cc5000', '1', '血小板红细胞10+', '1', '1001', '300001');

-- ----------------------------
-- Table structure for `cireport`
-- ----------------------------
DROP TABLE IF EXISTS `cireport`;
CREATE TABLE `cireport` (
  `cirId` int(11) NOT NULL AUTO_INCREMENT COMMENT '检查项报告id',
  `ciId` int(11) DEFAULT NULL COMMENT '检查项编号',
  `ciName` varchar(30) DEFAULT NULL COMMENT '检查项名称',
  `orderId` int(11) DEFAULT NULL COMMENT '所属预约编号',
  PRIMARY KEY (`cirId`)
) ENGINE=InnoDB AUTO_INCREMENT=200003 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cireport
-- ----------------------------
INSERT INTO `cireport` VALUES ('200001', '1001', '血液化验', '300001');
INSERT INTO `cireport` VALUES ('200002', '1002', 'bbbb', '300002');

-- ----------------------------
-- Table structure for `doctor`
-- ----------------------------
DROP TABLE IF EXISTS `doctor`;
CREATE TABLE `doctor` (
  `docId` int(11) NOT NULL AUTO_INCREMENT COMMENT '医生编号',
  `docCode` varchar(20) DEFAULT NULL COMMENT '医生编号(登录用)',
  `realName` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `gender` int(1) DEFAULT NULL COMMENT '女0男1',
  `deptno` int(2) DEFAULT NULL COMMENT '所属科室1检验科2内科3外科',
  PRIMARY KEY (`docId`)
) ENGINE=InnoDB AUTO_INCREMENT=20004 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of doctor
-- ----------------------------
INSERT INTO `doctor` VALUES ('20001', '200001', '张大伟', '1234', '1', '3');
INSERT INTO `doctor` VALUES ('20002', '200002', '李静', '1234', '0', '1');
INSERT INTO `doctor` VALUES ('20003', '200003', '高美婷', '1234', '0', '1');

-- ----------------------------
-- Table structure for `hospital`
-- ----------------------------
DROP TABLE IF EXISTS `hospital`;
CREATE TABLE `hospital` (
  `hpId` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL COMMENT '医院名称',
  `picture` mediumtext COMMENT '医院图片',
  `address` varchar(255) DEFAULT NULL,
  `telephone` varchar(20) DEFAULT NULL COMMENT '医院电话',
  `businessHours` varchar(100) DEFAULT NULL COMMENT '营业时间',
  `deadline` varchar(30) DEFAULT NULL COMMENT '采血截止时间',
  `rule` varchar(30) DEFAULT NULL COMMENT '预约人数规则',
  `state` int(1) DEFAULT NULL COMMENT '医院状态1正常2其他',
  PRIMARY KEY (`hpId`)
) ENGINE=InnoDB AUTO_INCREMENT=30004 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hospital
-- ----------------------------
INSERT INTO `hospital` VALUES ('30001', '宝山中西医院', 'baoshan.jpg', '宝山区美兰湖路98号', '40068189999', '周一至周五7:30-17:30(周六截止到12:00)', '10:00', '每天预约人数不超过20人', '1');
INSERT INTO `hospital` VALUES ('30002', '佳美医院', 'jiamei.jpg', '静安区青年南路118号', '40062189999', '周一至周五7:30-14:30(周六截止到11:00)', '11:00', '每天预约人数不超过25人', '1');
INSERT INTO `hospital` VALUES ('30003', '上海人民医院', 'renmin.jpg', '浦东区工商路18号人民广场(世茂大厦)东楼C区', '40051689999', '周一至周五7:30-17:00(周六截止到12:00)', '10:30', '每天预约人数不超过30人', '1');

-- ----------------------------
-- Table structure for `orders`
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `orderId` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单编号',
  `orderDate` date DEFAULT NULL COMMENT '预约日期',
  `userId` varchar(11) DEFAULT NULL COMMENT '客户编号',
  `hpId` int(11) DEFAULT NULL COMMENT '所属医院编号',
  `smId` int(11) DEFAULT NULL COMMENT '所属套餐编号',
  `state` int(11) DEFAULT NULL COMMENT '订单状态1未归档2已归档',
  PRIMARY KEY (`orderId`)
) ENGINE=InnoDB AUTO_INCREMENT=300003 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('300001', '2024-06-28', '10000', '30001', '1001', '1');
INSERT INTO `orders` VALUES ('300002', '2024-06-29', '10001', '30001', '1002', '1');

-- ----------------------------
-- Table structure for `overallresult`
-- ----------------------------
DROP TABLE IF EXISTS `overallresult`;
CREATE TABLE `overallresult` (
  `orId` int(11) NOT NULL AUTO_INCREMENT COMMENT '总检结论项编号',
  `title` varchar(40) DEFAULT NULL COMMENT '总检结论项标题',
  `content` varchar(40) DEFAULT NULL COMMENT '总检结论项内容',
  `orderId` int(11) DEFAULT NULL COMMENT '所属预约编号',
  PRIMARY KEY (`orId`)
) ENGINE=InnoDB AUTO_INCREMENT=100003 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of overallresult
-- ----------------------------
INSERT INTO `overallresult` VALUES ('100001', '入职体检报告', '血压正常，左心房无疑似情况', '300001');
INSERT INTO `overallresult` VALUES ('100002', '入职体检报告', '血压正常，心律正常，无高血脂，血常规正常范围', '300002');

-- ----------------------------
-- Table structure for `setmeal`
-- ----------------------------
DROP TABLE IF EXISTS `setmeal`;
CREATE TABLE `setmeal` (
  `smId` int(11) NOT NULL AUTO_INCREMENT COMMENT '体检套餐编号',
  `name` varchar(225) DEFAULT NULL COMMENT '体检套餐名称',
  `type` int(1) DEFAULT NULL COMMENT '体检套餐类型1男士0女士套餐',
  `price` int(6) DEFAULT NULL COMMENT '体检套餐价格',
  PRIMARY KEY (`smId`)
) ENGINE=InnoDB AUTO_INCREMENT=1005 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of setmeal
-- ----------------------------
INSERT INTO `setmeal` VALUES ('1001', '入职体检', '1', '120');
INSERT INTO `setmeal` VALUES ('1002', '入职体检', '0', '150');
INSERT INTO `setmeal` VALUES ('1003', '血常规体检', '1', '160');
INSERT INTO `setmeal` VALUES ('1004', '血常规体检', '0', '180');

-- ----------------------------
-- Table structure for `setmealdetailed`
-- ----------------------------
DROP TABLE IF EXISTS `setmealdetailed`;
CREATE TABLE `setmealdetailed` (
  `sdId` int(11) NOT NULL AUTO_INCREMENT COMMENT '体检套餐项目明细编号',
  `smId` int(11) DEFAULT NULL COMMENT '体检套餐编号',
  `ciId` int(11) DEFAULT NULL COMMENT '体检检查项编号',
  PRIMARY KEY (`sdId`)
) ENGINE=InnoDB AUTO_INCREMENT=2005 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of setmealdetailed
-- ----------------------------
INSERT INTO `setmealdetailed` VALUES ('2001', '1001', '1001');
INSERT INTO `setmealdetailed` VALUES ('2002', '1002', '1001');
INSERT INTO `setmealdetailed` VALUES ('2003', '1003', '1001');
INSERT INTO `setmealdetailed` VALUES ('2004', '1004', '1001');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userId` varchar(11) NOT NULL COMMENT '用户编号',
  `password` varchar(20) NOT NULL COMMENT '密码',
  `realName` varchar(20) DEFAULT NULL COMMENT '真实姓名',
  `gender` int(1) DEFAULT NULL COMMENT '性别',
  `identityCard` varchar(18) DEFAULT NULL COMMENT '身份证号',
  `birthday` date DEFAULT NULL COMMENT '出生日期',
  `userType` int(1) DEFAULT NULL COMMENT '用户类型：1普通用户2内部员工3其他',
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('10000', '1234', 'test', '1', '110101199012081859', '1990-12-08', '1');
INSERT INTO `user` VALUES ('10001', '1234', 'tom', '1', '110101199508121831', '1995-05-16', '2');
INSERT INTO `user` VALUES ('10002', '1234', 'mary', '0', '110101200511221865', '2005-11-22', '2');
