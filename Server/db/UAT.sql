/*
Navicat MySQL Data Transfer

Source Server         : 192.168.51.111
Source Server Version : 50633
Source Host           : 192.168.51.111:3306
Source Database       : uat

Target Server Type    : MYSQL
Target Server Version : 50633
File Encoding         : 65001

Date: 2019-11-27 14:53:11
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for uat_case
-- ----------------------------
DROP TABLE IF EXISTS `uat_case`;
CREATE TABLE `uat_case` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT NULL,
  `name` varchar(500) DEFAULT NULL,
  `add_time` timestamp NULL DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `type` smallint(6) DEFAULT NULL COMMENT '1.case 2.keyword',
  `params` varchar(1000) DEFAULT NULL,
  `doc` varchar(4000) DEFAULT NULL,
  `return_values` varchar(1000) DEFAULT NULL,
  `set_up` varchar(1000) DEFAULT NULL,
  `tear_down` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pidIndex` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=242 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for uat_case_project_setting
-- ----------------------------
DROP TABLE IF EXISTS `uat_case_project_setting`;
CREATE TABLE `uat_case_project_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT NULL,
  `libs` varchar(1000) DEFAULT NULL,
  `add_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for uat_case_step
-- ----------------------------
DROP TABLE IF EXISTS `uat_case_step`;
CREATE TABLE `uat_case_step` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `case_id` int(11) DEFAULT NULL,
  `indexId` float DEFAULT NULL,
  `values` varchar(4000) DEFAULT NULL,
  `add_time` timestamp NULL DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  `version_id` int(11) DEFAULT NULL,
  `delete_flag` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2774 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for uat_fail_case
-- ----------------------------
DROP TABLE IF EXISTS `uat_fail_case`;
CREATE TABLE `uat_fail_case` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `case_id` int(11) DEFAULT NULL,
  `add_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1498 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for uat_global_values
-- ----------------------------
DROP TABLE IF EXISTS `uat_global_values`;
CREATE TABLE `uat_global_values` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key_name` varchar(500) DEFAULT NULL,
  `key_value` varchar(4000) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  `add_time` timestamp NULL DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `value_type` smallint(6) DEFAULT NULL COMMENT '1.正式环境 2.测试环境',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for uat_homebackground
-- ----------------------------
DROP TABLE IF EXISTS `uat_homebackground`;
CREATE TABLE `uat_homebackground` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(1000) DEFAULT NULL,
  `add_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for uat_home_day_excute_count
-- ----------------------------
DROP TABLE IF EXISTS `uat_home_day_excute_count`;
CREATE TABLE `uat_home_day_excute_count` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `total_count` int(11) DEFAULT NULL,
  `fail_count` int(11) DEFAULT NULL,
  `add_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=403 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for uat_home_day_excute_count_copy
-- ----------------------------
DROP TABLE IF EXISTS `uat_home_day_excute_count_copy`;
CREATE TABLE `uat_home_day_excute_count_copy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `total_count` int(11) DEFAULT NULL,
  `fail_count` int(11) DEFAULT NULL,
  `add_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=313 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for uat_keywords
-- ----------------------------
DROP TABLE IF EXISTS `uat_keywords`;
CREATE TABLE `uat_keywords` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lib_id` int(11) DEFAULT NULL,
  `word_type` int(11) DEFAULT NULL,
  `name_en` varchar(500) DEFAULT NULL,
  `name_zh` varchar(500) DEFAULT NULL,
  `shortdoc` varchar(1000) DEFAULT NULL,
  `doc` varchar(4000) DEFAULT NULL,
  `args` varchar(1000) DEFAULT NULL,
  `tags` varchar(1000) DEFAULT NULL,
  `add_time` timestamp NULL DEFAULT NULL,
  `update_user` int(11) DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=523 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for uat_libs
-- ----------------------------
DROP TABLE IF EXISTS `uat_libs`;
CREATE TABLE `uat_libs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(500) DEFAULT NULL,
  `add_time` timestamp NULL DEFAULT NULL,
  `status` smallint(6) DEFAULT NULL,
  `lib_type` smallint(6) DEFAULT NULL COMMENT '1.默认库 2.自定义库',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for uat_project
-- ----------------------------
DROP TABLE IF EXISTS `uat_project`;
CREATE TABLE `uat_project` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(500) DEFAULT NULL,
  `add_time` timestamp NULL DEFAULT NULL,
  `status` smallint(6) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for uat_project_file
-- ----------------------------
DROP TABLE IF EXISTS `uat_project_file`;
CREATE TABLE `uat_project_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key_name` varchar(500) DEFAULT NULL,
  `key_value` varchar(1000) DEFAULT NULL,
  `file_name` varchar(500) DEFAULT NULL,
  `file_path` varchar(1000) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  `add_time` timestamp NULL DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for uat_project_version
-- ----------------------------
DROP TABLE IF EXISTS `uat_project_version`;
CREATE TABLE `uat_project_version` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(500) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  `status` smallint(6) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `add_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for uat_proxy
-- ----------------------------
DROP TABLE IF EXISTS `uat_proxy`;
CREATE TABLE `uat_proxy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(500) DEFAULT NULL,
  `path` varchar(1000) DEFAULT NULL,
  `add_time` timestamp NULL DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `browser_type` smallint(6) DEFAULT NULL COMMENT '1.火狐 2.chrome 3.其它',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for uat_step_index_desc
-- ----------------------------
DROP TABLE IF EXISTS `uat_step_index_desc`;
CREATE TABLE `uat_step_index_desc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `step_id` int(11) DEFAULT NULL,
  `step_index` int(11) DEFAULT NULL,
  `index_type` smallint(6) DEFAULT NULL COMMENT '1.普通关键词 2.捕捉到的元素 3.自定义关键词',
  `link_id` int(11) DEFAULT NULL,
  `add_time` timestamp NULL DEFAULT NULL,
  `link_img` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2175 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for uat_task
-- ----------------------------
DROP TABLE IF EXISTS `uat_task`;
CREATE TABLE `uat_task` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task_type` smallint(6) DEFAULT NULL COMMENT '1.调试任务 2.即时任务 3.定时任务',
  `name` varchar(500) DEFAULT NULL,
  `status` smallint(6) DEFAULT NULL COMMENT '0:新建任务、1：任务进行中、2：正在执行 、3：任务完成 、4：任务失败',
  `case_id` varchar(4000) DEFAULT NULL,
  `add_time` timestamp NULL DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT NULL,
  `run_time` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  `value_type` smallint(6) DEFAULT NULL COMMENT '1.正式版 2.测试版',
  `browser_type` smallint(6) DEFAULT NULL COMMENT '1.firefox 2.chrome',
  `proxy_type` int(11) DEFAULT NULL,
  `task_log` longtext,
  `version_id` int(11) DEFAULT NULL,
  `host` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1946 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for uat_tim_task_log
-- ----------------------------
DROP TABLE IF EXISTS `uat_tim_task_log`;
CREATE TABLE `uat_tim_task_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task_id` int(11) DEFAULT NULL,
  `task_log` longtext,
  `excute_date` varchar(500) DEFAULT NULL,
  `add_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for uat_tree
-- ----------------------------
DROP TABLE IF EXISTS `uat_tree`;
CREATE TABLE `uat_tree` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  `name` varchar(500) DEFAULT NULL,
  `type` smallint(6) DEFAULT NULL COMMENT '1.目录 2.用例 3.关键词目录 4.自定义关键词',
  `add_time` timestamp NULL DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `index_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `indexId` (`id`,`project_id`)
) ENGINE=InnoDB AUTO_INCREMENT=274 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(40) DEFAULT NULL,
  `hash_password` varchar(80) DEFAULT NULL,
  `salt` varchar(80) DEFAULT NULL,
  `email` varchar(40) DEFAULT NULL,
  `status` smallint(6) unsigned zerofill DEFAULT NULL,
  `phoneNumber` varchar(255) DEFAULT NULL,
  `account_type` int(10) unsigned zerofill DEFAULT NULL,
  `szwego_url` varchar(255) DEFAULT NULL,
  `szwego_token` varchar(500) DEFAULT NULL,
  `get_status` smallint(5) unsigned zerofill DEFAULT NULL,
  `add_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8;
