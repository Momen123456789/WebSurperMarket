/*
 Navicat Premium Data Transfer

 Source Server         : root
 Source Server Type    : MySQL
 Source Server Version : 50722
 Source Host           : localhost:3306
 Source Schema         : smms

 Target Server Type    : MySQL
 Target Server Version : 50722
 File Encoding         : 65001

 Date: 22/03/2022 11:51:15
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `cname` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`cid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, '食品');
INSERT INTO `category` VALUES (2, '药品');
INSERT INTO `category` VALUES (3, '衣服');
INSERT INTO `category` VALUES (4, '饰品');
INSERT INTO `category` VALUES (5, '玩具');
INSERT INTO `category` VALUES (6, 'Java');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `pid` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cid` int(11) NULL DEFAULT NULL,
  `pname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pspec` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `uid` int(11) NULL DEFAULT NULL,
  `pminNumber` int(11) NULL DEFAULT NULL,
  `salePrice` float(12, 2) NULL DEFAULT NULL,
  `vipPrice` float(12, 2) NULL DEFAULT NULL,
  `pamount` int(11) NULL DEFAULT NULL,
  `pic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`pid`) USING BTREE,
  INDEX `fk_cid`(`cid`) USING BTREE,
  INDEX `fk_uid`(`uid`) USING BTREE,
  CONSTRAINT `fk_cid` FOREIGN KEY (`cid`) REFERENCES `category` (`cid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_uid` FOREIGN KEY (`uid`) REFERENCES `unit` (`uid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('00001', 1, '凤爪', 'A', 1, 80, 5.00, 4.00, 6980, '/images/qrcode/2357.png');
INSERT INTO `product` VALUES ('00002', 1, '巧克力', 'A', 1, 100, 60.00, 50.00, 2993, '/images/qrcode/5021.png');
INSERT INTO `product` VALUES ('00003', 2, '阿莫西林', 'A', 1, 82, 20.00, 18.00, 3092, '/images/qrcode/6469.png');
INSERT INTO `product` VALUES ('00004', 3, 'Libetter', 'B', 1, 200, 399.00, 380.00, 2999, '/images/qrcode/5633.png');
INSERT INTO `product` VALUES ('00005', 5, '奥迪双钻', 'B', 1, 2000, 3000.00, 2700.00, 1000, '/images/qrcode/7879.png');
INSERT INTO `product` VALUES ('00006', 1, '蛋卷', 'A', 1, 20, 20.00, 16.00, 87787, '/images/qrcode/0261.png');
INSERT INTO `product` VALUES ('00007', 4, '钻石项链', 'A', 5, 5, 10000.00, 9900.00, 78, '/images/qrcode/8892.png');
INSERT INTO `product` VALUES ('00008', 1, '醇正', 'B', 4, 20, 60.00, 40.00, 7782, '/images/qrcode/8633.png');
INSERT INTO `product` VALUES ('123', 1, '123', '13333', 1, 13333, 34.00, 33.00, 1222222, '/images/qrcode/9195.png');
INSERT INTO `product` VALUES ('1234', 1, 'ces', '11', 1, 123, 12.00, 11.00, 1222222, '/images/qrcode/8341.png');
INSERT INTO `product` VALUES ('12345', 1, '测试', '11', 1, 100, 23.00, 22.00, 1222222, '/images/qrcode/7701.png');

-- ----------------------------
-- Table structure for provider
-- ----------------------------
DROP TABLE IF EXISTS `provider`;
CREATE TABLE `provider`  (
  `pid` int(11) NOT NULL AUTO_INCREMENT,
  `pname` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pphone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `paddress` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `plinkman` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`pid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of provider
-- ----------------------------
INSERT INTO `provider` VALUES (2, '京东', '666666', '广州市天河区', '小刘');
INSERT INTO `provider` VALUES (3, '淘宝', '12323132', '杭州市', '小马');
INSERT INTO `provider` VALUES (4, '腾讯', '1878787', '广东省深圳市', '小马哥');
INSERT INTO `provider` VALUES (5, '茅台厂家', '98787', '贵州市', '小毛');
INSERT INTO `provider` VALUES (6, '周大生', '88888', '香港市', '小发');
INSERT INTO `provider` VALUES (7, '天猫', '372368168', '湖南省邵阳市', '小黑');
INSERT INTO `provider` VALUES (8, '维也纳酒店', '99999', '湖南衡阳市', '小白');
INSERT INTO `provider` VALUES (9, '嘻嘻纺织厂', '17670743903', '广东省f福田市', '12312332');
INSERT INTO `provider` VALUES (10, '东芝源', '17670743904', '湖南省长沙市', '小明');
INSERT INTO `provider` VALUES (11, '123', '13434343232', '124', '134');

-- ----------------------------
-- Table structure for sale
-- ----------------------------
DROP TABLE IF EXISTS `sale`;
CREATE TABLE `sale`  (
  `sid` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `vid` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `stime` datetime(0) NULL DEFAULT NULL,
  `stotal` float(12, 2) NULL DEFAULT NULL,
  `scount` int(11) NULL DEFAULT NULL,
  `uid` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`sid`) USING BTREE,
  INDEX `fk_sale_uid`(`uid`) USING BTREE,
  INDEX `fk_sale_vid`(`vid`) USING BTREE,
  CONSTRAINT `fk_sale_uid` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_sale_vid` FOREIGN KEY (`vid`) REFERENCES `vip` (`vid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sale
-- ----------------------------
INSERT INTO `sale` VALUES ('s20200428085148', NULL, '2020-04-28 08:51:48', 105.00, 1, 'wen');
INSERT INTO `sale` VALUES ('s20200428085224', '000001', '2020-04-28 08:52:24', 84.00, 1, 'wen');
INSERT INTO `sale` VALUES ('s20200525231132', '000001', '2020-05-25 23:11:32', 84.00, 1, 'wen');
INSERT INTO `sale` VALUES ('s20200525231204', NULL, '2020-05-25 23:12:04', 1620.00, 1, 'wen');
INSERT INTO `sale` VALUES ('s20200526085501', '000002', '2020-05-26 08:55:01', 54540.00, 3, 'liu');
INSERT INTO `sale` VALUES ('s20200526085814', NULL, '2020-05-26 08:58:14', 1010.00, 3, 'liu');
INSERT INTO `sale` VALUES ('s20200526093529', '000002', '2020-05-26 09:35:29', 400.00, 1, 'liu');
INSERT INTO `sale` VALUES ('s20220322113915', '00003', '2022-03-22 11:39:15', 150.00, 1, '123');
INSERT INTO `sale` VALUES ('s20220322115012', '00003', '2022-03-22 11:50:12', 350.00, 2, '123');

-- ----------------------------
-- Table structure for saleitem
-- ----------------------------
DROP TABLE IF EXISTS `saleitem`;
CREATE TABLE `saleitem`  (
  `sid` int(11) NOT NULL AUTO_INCREMENT,
  `saleId` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pid` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `scount` int(11) NULL DEFAULT NULL,
  `sprice` float(12, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`sid`) USING BTREE,
  INDEX `fk_saleItem_saleId`(`saleId`) USING BTREE,
  INDEX `fk_saleItem_pid`(`pid`) USING BTREE,
  CONSTRAINT `fk_saleItem_pid` FOREIGN KEY (`pid`) REFERENCES `product` (`pid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_saleItem_saleId` FOREIGN KEY (`saleId`) REFERENCES `sale` (`sid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of saleitem
-- ----------------------------
INSERT INTO `saleitem` VALUES (1, 's20200428085148', '00001', 21, 5.00);
INSERT INTO `saleitem` VALUES (2, 's20200428085224', '00001', 21, 4.00);
INSERT INTO `saleitem` VALUES (3, 's20200525231132', '00001', 21, 4.00);
INSERT INTO `saleitem` VALUES (4, 's20200525231204', '00003', 81, 20.00);
INSERT INTO `saleitem` VALUES (5, 's20200526085501', '00004', 1, 380.00);
INSERT INTO `saleitem` VALUES (6, 's20200526085501', '00005', 20, 2700.00);
INSERT INTO `saleitem` VALUES (7, 's20200526085501', '00001', 40, 4.00);
INSERT INTO `saleitem` VALUES (8, 's20200526085814', '00001', 30, 5.00);
INSERT INTO `saleitem` VALUES (9, 's20200526085814', '00002', 1, 60.00);
INSERT INTO `saleitem` VALUES (10, 's20200526085814', '00003', 40, 20.00);
INSERT INTO `saleitem` VALUES (11, 's20200526093529', '00001', 100, 4.00);
INSERT INTO `saleitem` VALUES (12, 's20220322113915', '00002', 3, 50.00);
INSERT INTO `saleitem` VALUES (13, 's20220322115012', '00002', 3, 50.00);
INSERT INTO `saleitem` VALUES (14, 's20220322115012', '00008', 5, 40.00);

-- ----------------------------
-- Table structure for save
-- ----------------------------
DROP TABLE IF EXISTS `save`;
CREATE TABLE `save`  (
  `sid` int(11) NOT NULL AUTO_INCREMENT,
  `vid` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `stime` date NULL DEFAULT NULL,
  `smoney` float(12, 2) NULL DEFAULT NULL,
  `uid` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`sid`) USING BTREE,
  INDEX `fk_vid`(`vid`) USING BTREE,
  INDEX `fk_user_uid`(`uid`) USING BTREE,
  CONSTRAINT `fk_user_uid` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_vid` FOREIGN KEY (`vid`) REFERENCES `vip` (`vid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of save
-- ----------------------------
INSERT INTO `save` VALUES (3, '000002', '2020-05-26', 20000.00, 'admin');
INSERT INTO `save` VALUES (4, '000002', '2020-05-26', 90000.00, 'admin');
INSERT INTO `save` VALUES (5, '00003', '2022-03-22', 100000.00, 'admin');
INSERT INTO `save` VALUES (6, '00003', '2022-03-22', 100000.00, 'admin');

-- ----------------------------
-- Table structure for stock
-- ----------------------------
DROP TABLE IF EXISTS `stock`;
CREATE TABLE `stock`  (
  `sid` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `productId` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `providerId` int(11) NULL DEFAULT NULL,
  `stime` datetime(0) NULL DEFAULT NULL,
  `samount` int(11) NULL DEFAULT NULL,
  `sprice` float(12, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`sid`) USING BTREE,
  INDEX `fk_product_pid`(`productId`) USING BTREE,
  INDEX `fk_provider_pid`(`providerId`) USING BTREE,
  CONSTRAINT `fk_product_pid` FOREIGN KEY (`productId`) REFERENCES `product` (`pid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_provider_pid` FOREIGN KEY (`providerId`) REFERENCES `provider` (`pid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of stock
-- ----------------------------
INSERT INTO `stock` VALUES ('', '00008', 3, '2020-05-25 11:45:09', 7787, 30.00);
INSERT INTO `stock` VALUES ('002', '00005', 4, '2020-04-28 08:41:18', 1000, 20.00);
INSERT INTO `stock` VALUES ('090', '00007', 6, '2020-05-25 11:44:35', 78, 9999.00);
INSERT INTO `stock` VALUES ('1111', '00005', 2, '2020-05-26 08:52:56', 20, 80.00);
INSERT INTO `stock` VALUES ('123', '123', 2, '2022-03-22 10:56:14', 1222222, 12.00);
INSERT INTO `stock` VALUES ('1234', '1234', 2, '2022-03-22 11:34:14', 1222222, 12.00);
INSERT INTO `stock` VALUES ('12345', '12345', 2, '2022-03-22 11:47:56', 1222222, 12.00);
INSERT INTO `stock` VALUES ('213', '00004', 2, '2020-05-25 11:49:42', 3000, 200.00);
INSERT INTO `stock` VALUES ('2312312', '00002', 3, '2020-05-25 11:43:59', 3000, 40.00);
INSERT INTO `stock` VALUES ('2323', '00003', 4, '2020-05-25 11:47:58', 3213, 15.00);
INSERT INTO `stock` VALUES ('2323231', '00001', 2, '2020-05-25 11:43:28', 3213, 3.00);
INSERT INTO `stock` VALUES ('893', '00001', 2, '2020-04-29 13:37:01', 1000, 20.00);
INSERT INTO `stock` VALUES ('8989', '00001', 2, '2020-04-28 08:40:47', 3000, 3.00);
INSERT INTO `stock` VALUES ('89898', '00006', 4, '2020-05-25 15:05:07', 87787, 30.00);

-- ----------------------------
-- Table structure for unit
-- ----------------------------
DROP TABLE IF EXISTS `unit`;
CREATE TABLE `unit`  (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `uname` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of unit
-- ----------------------------
INSERT INTO `unit` VALUES (1, '包');
INSERT INTO `unit` VALUES (2, '克');
INSERT INTO `unit` VALUES (3, '千克');
INSERT INTO `unit` VALUES (4, '箱');
INSERT INTO `unit` VALUES (5, '个');
INSERT INTO `unit` VALUES (6, '快');
INSERT INTO `unit` VALUES (7, '本');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `uid` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `upassword` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `uname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `urole` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('123', '123456', '张三', 0);
INSERT INTO `user` VALUES ('admin', '123456', '管理员', 1);
INSERT INTO `user` VALUES ('administrator', '123456', '管理员2号', 1);
INSERT INTO `user` VALUES ('liu', '123456', '小刘', 0);
INSERT INTO `user` VALUES ('wen', '123456', '小文', 0);

-- ----------------------------
-- Table structure for vip
-- ----------------------------
DROP TABLE IF EXISTS `vip`;
CREATE TABLE `vip`  (
  `vid` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `vname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `vphone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `vsum` float(12, 2) NULL DEFAULT NULL,
  `vscore` int(11) NULL DEFAULT NULL,
  `vcount` int(11) NULL DEFAULT NULL,
  `vrate` float(12, 2) NULL DEFAULT NULL,
  `vbirthday` date NULL DEFAULT NULL,
  `vbalance` float(12, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`vid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of vip
-- ----------------------------
INSERT INTO `vip` VALUES ('000001', '文文', '47670743909', 168.00, 16, 2, 0.10, '2020-04-07', 9832.00);
INSERT INTO `vip` VALUES ('000002', '小张', '78670743901', 54940.00, 5494, 2, 0.10, '2019-11-26', 75060.00);
INSERT INTO `vip` VALUES ('00003', '张三', '13434344545', 500.00, 50, 2, 0.10, '2022-03-21', 199500.00);

SET FOREIGN_KEY_CHECKS = 1;
