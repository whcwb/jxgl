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

 Date: 08/15/2018 00:18:36 AM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `biz_stock_log`
-- ----------------------------
DROP TABLE IF EXISTS `biz_stock_log`;
CREATE TABLE `biz_stock_log` (
  `id` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'id',
  `stock_id` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '库存id',
  `before_update` int(11) DEFAULT NULL COMMENT '更新之前数量',
  `after_update` int(11) DEFAULT NULL COMMENT '更新之后数量',
  `create_time` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '创建时间',
  `create_user` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `remark` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `product_name` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '商品名称',
  `product_code` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '商品编码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;

SET FOREIGN_KEY_CHECKS = 1;
