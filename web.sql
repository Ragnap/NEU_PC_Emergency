/*
 Navicat MySQL Data Transfer

 Source Server         : PC_Emergency
 Source Server Type    : MySQL
 Source Server Version : 50739 (5.7.39-log)
 Source Host           : localhost:3306
 Source Schema         : web

 Target Server Type    : MySQL
 Target Server Version : 50739 (5.7.39-log)
 File Encoding         : 65001

 Date: 07/01/2023 19:02:44
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for problem
-- ----------------------------
DROP TABLE IF EXISTS `problem`;
CREATE TABLE `problem`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `time` date NOT NULL,
  `describe` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `model` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `system` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `solution` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of problem
-- ----------------------------
INSERT INTO `problem` VALUES (1, 'Ragnap', '2023-01-06', '出现蓝屏', '华硕天选1', 'windows10', '重新安装显卡驱动');
INSERT INTO `problem` VALUES (2, 'admin', '2023-01-07', '电脑无法充电', '联想小新', 'windows11', '断开电源线后长按电源键30s将主板静电去除');
INSERT INTO `problem` VALUES (3, 'Ragnap', '2023-01-07', '玩艾尔登法环的时候出现蓝屏', '华硕天选', 'windows10专业版', '在nvidia控制面板中设置为使用独立显卡，并更新核显驱动');
INSERT INTO `problem` VALUES (4, '热心网友小G', '2023-01-07', '电脑出现蓝屏，报错：igdkmd64lp.sys', '一个比较老的inter核显电脑', 'win10', 'Igdkmd64.sys文件是 Inter 的显卡内核驱动模式 (Intel Graphic Kernel Mode) 相关的驱动程序，请先关闭睡眠模式，并重新安装inter驱动');
INSERT INTO `problem` VALUES (5, '热心网友小G', '2023-01-07', '又双蓝屏了，这次是dxgmms2.sys', '华为matebook14', 'Bug多多的win11', '该文件与DirectX图形API有关，直接 win+R 输入 dxdiag 检查 DirectX 功能是否为已启用，未能正常开启可能驱动和 GPU 存在兼容性问题，建议重新安装 DirectX');
INSERT INTO `problem` VALUES (6, '热心网友小G', '2023-01-07', '弹窗缺少***.dll（没看清）后系统卡死，然后黑屏', '不清楚', 'windows10', '电脑启动时按F11使用安全模式进入系统，到cn.dll-files.com下载缺失的dll文件');
INSERT INTO `problem` VALUES (7, 'user1', '2023-01-07', '出现黑屏', '联想小新', 'windows', '重启');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', 'admin');
INSERT INTO `user` VALUES (2, 'asdasd', 'asd');
INSERT INTO `user` VALUES (3, 'Ragnap', '123');
INSERT INTO `user` VALUES (4, '热心网友小G', 'GGGGGGGG!');
INSERT INTO `user` VALUES (5, 'user1', '123456');

SET FOREIGN_KEY_CHECKS = 1;
