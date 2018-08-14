/*
 Navicat Premium Data Transfer

 Source Server         : jxgl-prod
 Source Server Type    : MySQL
 Source Server Version : 50722
 Source Host           : 119.97.172.181
119.97.172.181
119.97.172.181
119.97.172.181
119.97.172.181
 Source Database       : vehcile_platform

 Target Server Type    : MySQL
 Target Server Version : 50722
 File Encoding         : utf-8

 Date: 08/15/2018 00:18:30 AM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `biz_stock`
-- ----------------------------
DROP TABLE IF EXISTS `biz_stock`;
CREATE TABLE `biz_stock` (
  `id` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'id',
  `product_code` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '商品编码',
  `product_name` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '商品名称',
  `number` int(11) DEFAULT NULL COMMENT '剩余数量',
  `position` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '存放位置',
  `create_time` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '创建时间',
  `create_user` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `update_time` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '修改时间',
  `update_user` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;

SET FOREIGN_KEY_CHECKS = 1;
