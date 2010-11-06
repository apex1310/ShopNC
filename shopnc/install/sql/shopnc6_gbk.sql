-- phpMyAdmin SQL Dump
-- version 2.9.1.1
-- http://www.phpmyadmin.net
-- 
-- ����: localhost
-- ��������: 2009 �� 03 �� 09 �� 18:14
-- �������汾: 5.2.3
-- PHP �汾: 5.2.3
-- 
-- ���ݿ�: `shopnc60`
-- 

-- --------------------------------------------------------

-- 
-- ��Ľṹ `@shopnc@ad`
-- 

DROP TABLE IF EXISTS `@shopnc@ad`;
CREATE TABLE `@shopnc@ad` (
  `ad_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '���id',
  `ad_title` varchar(50) NOT NULL COMMENT '�������',
  `ad_type` varchar(10) NOT NULL COMMENT '�������id',
  `position_id` int(11) NOT NULL COMMENT '���λ��id',
  `ad_url` varchar(500) DEFAULT NULL COMMENT '���url��ַ',
  `ad_body` varchar(500) NOT NULL COMMENT '�������',
  `ad_state` tinyint(1) NOT NULL COMMENT '���״̬��1������0�ر�',
  `ad_starttime` varchar(20) DEFAULT NULL COMMENT '��濪ʼʱ��',
  `ad_endtime` varchar(20) DEFAULT NULL COMMENT '������ʱ��',
  `ad_user` varchar(50) DEFAULT NULL COMMENT '��ϵ��',
  `ad_email` varchar(100) DEFAULT NULL COMMENT '��ϵ������',
  `ad_call` varchar(100) DEFAULT NULL COMMENT '��ϵ�˵绰',
  `ad_view` int(11) NOT NULL DEFAULT '0' COMMENT '�����',
  PRIMARY KEY (`ad_id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='������ݱ�';

-- --------------------------------------------------------

-- 
-- ��Ľṹ `@shopnc@ad_position`
-- 

DROP TABLE IF EXISTS `@shopnc@ad_position`;
CREATE TABLE `@shopnc@ad_position` (
  `position_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '���λid',
  `position_name` varchar(100) NOT NULL COMMENT '���λ����',
  `position_width` int(11) NOT NULL COMMENT '���λ���',
  `position_height` int(11) NOT NULL COMMENT '���λ�߶�',
  `position_info` varchar(100) NOT NULL COMMENT '���λ����',
  PRIMARY KEY (`position_id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='���λ���ݱ�';

-- --------------------------------------------------------

-- 
-- ��Ľṹ `@shopnc@admin`
-- 

DROP TABLE IF EXISTS `@shopnc@admin`;
CREATE TABLE `@shopnc@admin` (
  `admin_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '����Աid',
  `admin_name` varchar(50) NOT NULL COMMENT '����Ա����',
  `admin_password` varchar(32) NOT NULL COMMENT '����Ա����',
  `admin_email` varchar(100) NOT NULL COMMENT '����Ա����',
  `admin_state` tinyint(1) NOT NULL COMMENT '����Ա״̬',
  `admin_cmpetence` text COMMENT '����ԱȨ��',
  `admin_add_time` varchar(10) NOT NULL COMMENT '����Ա���ʱ��',
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='����Ա��';

-- --------------------------------------------------------

-- 
-- ��Ľṹ `@shopnc@area`
-- 

DROP TABLE IF EXISTS `@shopnc@area`;
CREATE TABLE `@shopnc@area` (
  `area_id` int(8) NOT NULL AUTO_INCREMENT COMMENT '����id',
  `area_top_id` int(8) NOT NULL COMMENT '����id',
  `area_name` varchar(50) NOT NULL COMMENT '��������',
  `area_sort` int(11) DEFAULT '0' COMMENT '��������',
  `area_info` varchar(100) DEFAULT NULL COMMENT '��������',
  PRIMARY KEY (`area_id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='�������ݱ�';

-- --------------------------------------------------------

-- 
-- ��Ľṹ `@shopnc@article`
-- 

DROP TABLE IF EXISTS `@shopnc@article`;
CREATE TABLE `@shopnc@article` (
  `article_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '����id',
  `article_class_id` int(11) NOT NULL COMMENT '�������id',
  `article_title` varchar(100) NOT NULL COMMENT '���±���',
  `article_author` varchar(50) NOT NULL COMMENT '��������',
  `article_keywords` varchar(100) DEFAULT NULL COMMENT '���¹ؼ���',
  `article_description` varchar(200) DEFAULT NULL COMMENT '��������',
  `article_body` text NOT NULL COMMENT '��������',
  `article_hit` int(11) NOT NULL DEFAULT '0' COMMENT '�������',
  `article_sort` int(11) NOT NULL DEFAULT '0' COMMENT '��������',
  `article_state` tinyint(4) NOT NULL DEFAULT '0' COMMENT '����״̬1������0��δ����',
  `article_url` varchar(255) DEFAULT NULL COMMENT '�����ⲿ����',
  `article_type` tinyint(4) NOT NULL COMMENT '�������ͣ�����������',
  `article_commend` enum('0','1') NOT NULL COMMENT '�Ƿ��Ƽ�',
  `article_time` char(10) NOT NULL COMMENT '���·���ʱ��',
  `provider_id` int(8) DEFAULT NULL COMMENT '��Ӧ��id',
  PRIMARY KEY (`article_id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='�������ݱ�';

-- --------------------------------------------------------

-- 
-- ��Ľṹ `@shopnc@article_class`
-- 

DROP TABLE IF EXISTS `@shopnc@article_class`;
CREATE TABLE `@shopnc@article_class` (
  `article_class_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '�������id',
  `article_class_name` varchar(50) NOT NULL COMMENT '�������',
  `article_class_topid` int(11) DEFAULT '0' COMMENT '�������id',
  `article_class_state` tinyint(4) DEFAULT '0' COMMENT '�������״̬1������0��δ����',
  `article_class_keywords` varchar(100) DEFAULT NULL COMMENT '�������ؼ���',
  `article_class_description` varchar(200) DEFAULT NULL COMMENT '�����������',
  `article_class_sort` int(11) DEFAULT '0' COMMENT '�����������',
  `article_class_url` varchar(255) DEFAULT NULL COMMENT '��������ⲿ����',
  `article_class_menu` tinyint(1) NOT NULL DEFAULT '0' COMMENT '��ҳ������ʾ��0����ʾ��1��ʾ',
  PRIMARY KEY (`article_class_id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='����������ݱ�';

-- --------------------------------------------------------

-- 
-- ��Ľṹ `@shopnc@ask`
-- 

DROP TABLE IF EXISTS `@shopnc@ask`;
CREATE TABLE `@shopnc@ask` (
  `ask_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '�ͷ�id',
  `user_id` int(11) NOT NULL COMMENT '�û�id',
  `ac_id` int(11) NOT NULL COMMENT '�������id',
  `user_name` varchar(50) NOT NULL COMMENT '�û���',
  `ask_subject` varchar(100) NOT NULL COMMENT '��������',
  `ask_body` text NOT NULL COMMENT '��������',
  `ask_num` varchar(13) NOT NULL COMMENT '������',
  `ask_reply` text COMMENT '����ظ�',
  `if_reply` enum('0','1') NOT NULL DEFAULT '0' COMMENT '�Ƿ�ظ�0��δ�ظ�1���ѻظ�',
  `ask_time` char(10) NOT NULL COMMENT '����ʱ��',
  PRIMARY KEY (`ask_id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='�ͷ���';

-- --------------------------------------------------------

-- 
-- ��Ľṹ `@shopnc@ask_cate`
-- 

DROP TABLE IF EXISTS `@shopnc@ask_cate`;
CREATE TABLE `@shopnc@ask_cate` (
  `ac_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '�������id',
  `cate_name` varchar(50) NOT NULL COMMENT '�����������',
  `if_issue` enum('0','1') NOT NULL DEFAULT '0' COMMENT '�Ƿ񷢲�0��δ����1���ѷ���',
  `if_marked` enum('0','1') NOT NULL DEFAULT '0' COMMENT '�Ƿ��ڶ�0����1����',
  `reply_body` varchar(500) DEFAULT NULL COMMENT '�ظ�����',
  `create_time` char(10) NOT NULL COMMENT '����ʱ��',
  PRIMARY KEY (`ac_id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='���߿ͷ�-�������';

-- --------------------------------------------------------

-- 
-- ��Ľṹ `@shopnc@brand`
-- 

DROP TABLE IF EXISTS `@shopnc@brand`;
CREATE TABLE `@shopnc@brand` (
  `brand_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '��ƷƷ��id',
  `brand_name` varchar(50) NOT NULL COMMENT 'Ʒ������',
  `brand_image` varchar(100) NOT NULL COMMENT 'Ʒ��ͼƬ',
  `brand_image_width` int(11) DEFAULT '0' COMMENT 'Ʒ��ͼƬ���',
  `brand_image_height` int(11) DEFAULT '0' COMMENT 'Ʒ��ͼƬ�߶�',
  `brand_sort` int(11) DEFAULT '0' COMMENT 'Ʒ������',
  `brand_state` tinyint(4) DEFAULT '0' COMMENT 'Ʒ��״̬1������0��δ����',
  `brand_url` varchar(100) DEFAULT NULL COMMENT 'url����',
  `brand_keywords` varchar(100) DEFAULT NULL COMMENT '�ؼ���',
  `brand_description` varchar(200) DEFAULT NULL COMMENT '����',
  PRIMARY KEY (`brand_id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='��ƷƷ�����ݱ�';

-- --------------------------------------------------------

-- 
-- ��Ľṹ `@shopnc@collection`
-- 

DROP TABLE IF EXISTS `@shopnc@collection`;
CREATE TABLE `@shopnc@collection` (
  `collection_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '�ղ�id',
  `user_id` int(11) NOT NULL COMMENT '��Աid',
  `goods_id` int(11) NOT NULL COMMENT '��Ʒid',
  `collection_time` varchar(10) NOT NULL COMMENT '�ղ�ʱ��',
  PRIMARY KEY (`collection_id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='�ղ����ݱ�';

-- --------------------------------------------------------

-- 
-- ��Ľṹ `@shopnc@comment`
-- 

DROP TABLE IF EXISTS `@shopnc@comment`;
CREATE TABLE `@shopnc@comment` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '��Ʒ����id',
  `user_id` int(11) NOT NULL COMMENT '�û�id',
  `goods_id` int(11) NOT NULL COMMENT '��Ʒid',
  `comment_body` varchar(255) NOT NULL COMMENT '��������',
  `comment_repost` varchar(255) DEFAULT NULL COMMENT '������Ա�ظ�����',
  `comment_view_state` tinyint(1) NOT NULL DEFAULT '0' COMMENT '�鿴״̬��0δ�鿴��1�鿴',
  `comment_repost_state` tinyint(1) NOT NULL DEFAULT '0' COMMENT '�ظ�״̬��0δ�ظ���1�ظ�',
  `comment_time` varchar(10) NOT NULL COMMENT '��Ʒ����ʱ��',
  `repost_time` varchar(10) DEFAULT NULL COMMENT '����Ա�ظ�ʱ��',
  PRIMARY KEY (`comment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='��Ʒ�������ݱ�';

-- --------------------------------------------------------

-- 
-- ��Ľṹ `@shopnc@config`
-- 

DROP TABLE IF EXISTS `@shopnc@config`;
CREATE TABLE `@shopnc@config` (
  `config_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'idֵ',
  `config_valuename` varchar(50) NOT NULL COMMENT 'ֵ������',
  `config_value` varchar(255) NOT NULL COMMENT '����ֵ',
  `config_other` varchar(50) DEFAULT NULL COMMENT '����ֵ',
  `config_type` varchar(20) NOT NULL COMMENT '����',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='ϵͳ�������ݱ�';

-- --------------------------------------------------------

-- 
-- ��Ľṹ `@shopnc@currencies`
-- 

DROP TABLE IF EXISTS `@shopnc@currencies`;
CREATE TABLE `@shopnc@currencies` (
  `currencies_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '����id',
  `currencies_name` varchar(20) NOT NULL COMMENT '��������',
  `currencies_code` varchar(10) DEFAULT NULL COMMENT '���Ҵ���',
  `currencies_symbol` varchar(5) DEFAULT NULL COMMENT '���ҷ���',
  `currencies_units` varchar(10) DEFAULT NULL COMMENT '���ҵ�λ',
  `currencies_rate` varchar(10) DEFAULT NULL COMMENT '���ұ���',
  `currencies_long` tinyint(4) DEFAULT NULL COMMENT '����λ��',
  `currencies_state` tinyint(1) NOT NULL DEFAULT '0' COMMENT '��ǰ״̬��1Ĭ�ϣ�0��Ĭ��',
  `language_id` int(11) NOT NULL COMMENT '��Ӧ����',
  PRIMARY KEY (`currencies_id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='�������ݱ�';

-- --------------------------------------------------------

-- 
-- ��Ľṹ `@shopnc@goods`
-- 

DROP TABLE IF EXISTS `@shopnc@goods`;
CREATE TABLE `@shopnc@goods` (
  `goods_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '��Ʒid',
  `goods_name` varchar(100) NOT NULL COMMENT '��Ʒ����',
  `goods_bn` varchar(20) NOT NULL COMMENT '��Ʒ���',
  `class_id` int(11) NOT NULL COMMENT '��Ʒ���id',
  `brand_id` int(11) DEFAULT NULL COMMENT '��ƷƷ��id',
  `subject_id` int(11) DEFAULT '0' COMMENT '��Ʒ����id',
  `goods_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '�г��۸�',
  `goods_pricedesc` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '����۸�',
  `goods_provider_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '��Ӧ�̹����۸�',
  `goods_storage` int(11) DEFAULT '0' COMMENT '��Ʒ���',
  `goods_alarm_num` int(11) DEFAULT NULL COMMENT '��澯������',
  `goods_alarm_text` varchar(50) DEFAULT NULL COMMENT '��澯������',
  `goods_weight` int(11) DEFAULT NULL COMMENT '��Ʒ����',
  `goods_unit` varchar(10) DEFAULT NULL COMMENT '������λ',
  `goods_color` varchar(255) DEFAULT NULL,
  `goods_size` varchar(255) DEFAULT NULL,
  `goods_click` int(11) DEFAULT '0' COMMENT '��Ʒ�����',
  `provider_id` int(11) NOT NULL DEFAULT '0' COMMENT '��Ӧ��id',
  `goods_image` varchar(100) DEFAULT NULL COMMENT '��ƷͼƬ',
  `goods_small_image` varchar(100) DEFAULT NULL COMMENT '��΢ͼ',
  `goods_keywords` varchar(100) DEFAULT NULL COMMENT '��Ʒ�ؼ���',
  `goods_description` varchar(255) DEFAULT NULL COMMENT '��Ʒ����',
  `goods_body` text COMMENT '��Ʒ��ϸ����',
  `goods_add_time` char(10) DEFAULT NULL COMMENT '��Ʒ���ʱ��',
  `goods_state` tinyint(4) DEFAULT '1' COMMENT '��Ʒ״̬1������0��δ����2��ɾ��',
  `goods_hot` enum('1','0') DEFAULT NULL COMMENT '�Ƿ�����',
  `goods_commend` enum('1','0') DEFAULT NULL COMMENT '�Ƿ��Ƽ�',
  `goods_special` enum('1','0') DEFAULT NULL COMMENT '�Ƿ��ؼ�',
  `goods_attr_body` text COMMENT '������',
  `goods_link_goods` text COMMENT '������Ʒ',
  `goods_link_article` text COMMENT '��������',
  PRIMARY KEY (`goods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='��Ʒ��Ϣ���ݱ�';

-- --------------------------------------------------------

-- 
-- ��Ľṹ `@shopnc@goods_attribute`
-- 

DROP TABLE IF EXISTS `@shopnc@goods_attribute`;
CREATE TABLE `@shopnc@goods_attribute` (
  `attribute_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '����id',
  `attribute_name` varchar(50) NOT NULL COMMENT '��������',
  `goods_type_id` int(11) NOT NULL COMMENT '��Ʒ����',
  `attribute_select` tinyint(1) DEFAULT NULL COMMENT '��Ʒ�Ƿ��ѡ',
  `attribute_type` tinyint(1) NOT NULL COMMENT '¼�뷽ʽ',
  `attribute_select_body` varchar(200) DEFAULT NULL COMMENT '��ѡֵ����',
  `attribute_sort` int(8) DEFAULT '0' COMMENT '��������',
  PRIMARY KEY (`attribute_id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='��Ʒ�������ݱ���Ӧ��Ʒ���ͱ�';

-- --------------------------------------------------------

-- 
-- ��Ľṹ `@shopnc@goods_class`
-- 

DROP TABLE IF EXISTS `@shopnc@goods_class`;
CREATE TABLE `@shopnc@goods_class` (
  `class_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '��Ʒ����id',
  `class_top_id` int(11) NOT NULL DEFAULT '0' COMMENT '��������id',
  `class_name` varchar(50) NOT NULL COMMENT '��������',
  `goods_type_id` int(11) NOT NULL COMMENT '��Ʒ����id',
  `class_state` tinyint(4) NOT NULL DEFAULT '0' COMMENT '����״̬1������0���ر�',
  `class_keywords` varchar(255) DEFAULT NULL COMMENT '����ؼ���',
  `class_description` varchar(255) DEFAULT NULL COMMENT '��������',
  `class_sort` int(11) DEFAULT '0' COMMENT '��������',
  `class_language` int(11) DEFAULT '0' COMMENT '����������ʾ',
  `class_url` varchar(100) DEFAULT NULL COMMENT '����ָ���url����',
  `class_other_attr` text COMMENT '��������',
  `class_menu` enum('1','0') DEFAULT NULL COMMENT '�Ƿ񵼺���ʾ',
  PRIMARY KEY (`class_id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='��Ʒ�������ݱ�';

-- --------------------------------------------------------

-- 
-- ��Ľṹ `@shopnc@goods_image`
-- 

DROP TABLE IF EXISTS `@shopnc@goods_image`;
CREATE TABLE `@shopnc@goods_image` (
  `goods_image_id` int(8) NOT NULL AUTO_INCREMENT COMMENT 'ͼƬid',
  `goods_id` int(8) NOT NULL COMMENT '��Ʒid',
  `goods_image_title` varchar(50) DEFAULT NULL COMMENT 'ͼƬ����',
  `goods_image` varchar(100) NOT NULL COMMENT 'ͼƬ��ַ',
  `goods_image_small` varchar(100) NOT NULL COMMENT '��΢ͼ��ַ',
  PRIMARY KEY (`goods_image_id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='��Ʒ��ͼ��';

-- --------------------------------------------------------

-- 
-- ��Ľṹ `@shopnc@goods_more_class`
-- 

DROP TABLE IF EXISTS `@shopnc@goods_more_class`;
CREATE TABLE `@shopnc@goods_more_class` (
  `goods_id` int(11) DEFAULT NULL,
  `class_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='��Ʒ��չ�������ݱ�';

-- --------------------------------------------------------

-- 
-- ��Ľṹ `@shopnc@goods_type`
-- 

DROP TABLE IF EXISTS `@shopnc@goods_type`;
CREATE TABLE `@shopnc@goods_type` (
  `goods_type_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '����id',
  `goods_type_name` varchar(50) NOT NULL COMMENT '��������',
  `goods_type_state` tinyint(1) NOT NULL COMMENT '����״̬',
  `goods_type_group` varchar(200) DEFAULT NULL COMMENT '���ͷ���',
  PRIMARY KEY (`goods_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='��Ʒ�������ݱ�';

-- --------------------------------------------------------

-- 
-- ��Ľṹ `@shopnc@info`
-- 

DROP TABLE IF EXISTS `@shopnc@info`;
CREATE TABLE `@shopnc@info` (
  `info_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ϵͳ��Ϣid',
  `info_title` varchar(100) NOT NULL COMMENT '��Ϣ����',
  `info_url` varchar(200) DEFAULT NULL COMMENT '�ⲿurl',
  `info_text` text COMMENT 'ϵͳ��Ϣ����',
  PRIMARY KEY (`info_id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='ϵͳ��Ϣ��ǰ̨��ҳ�ײ�������ʾ����';

-- --------------------------------------------------------

-- 
-- ��Ľṹ `@shopnc@language`
-- 

DROP TABLE IF EXISTS `@shopnc@language`;
CREATE TABLE `@shopnc@language` (
  `language_id` int(8) NOT NULL AUTO_INCREMENT COMMENT '����id',
  `language_name` varchar(50) NOT NULL COMMENT '��������',
  `language_directory` varchar(20) NOT NULL COMMENT '�����ļ�Ŀ¼',
  `language_code` varchar(10) NOT NULL COMMENT '���Դ���',
  `language_sort` int(11) DEFAULT '0' COMMENT '��������',
  `language_image` varchar(100) NOT NULL COMMENT '����ͼƬ',
  `language_state` tinyint(1) NOT NULL DEFAULT '1' COMMENT '����״̬',
  PRIMARY KEY (`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- --------------------------------------------------------

-- 
-- ��Ľṹ `@shopnc@link`
-- 

DROP TABLE IF EXISTS `@shopnc@link`;
CREATE TABLE `@shopnc@link` (
  `link_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '��������id',
  `link_url` varchar(100) NOT NULL COMMENT '�������ӵ�ַ',
  `link_web_name` varchar(50) NOT NULL COMMENT '����������վ����',
  `link_logo` varchar(100) DEFAULT NULL COMMENT '��������logo��ַ',
  `link_logo_width` int(11) DEFAULT '0' COMMENT 'logo���',
  `link_logo_height` int(11) DEFAULT '0' COMMENT 'logo�߶�',
  `link_email` varchar(100) DEFAULT NULL COMMENT 'վ������',
  `link_sort` int(11) DEFAULT '0' COMMENT '������������',
  `link_state` tinyint(4) DEFAULT '0' COMMENT '״̬1������0��δ����',
  `link_time` char(10) DEFAULT NULL COMMENT '�����������ʱ��',
  PRIMARY KEY (`link_id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='�����������ݱ�';

-- --------------------------------------------------------

-- 
-- ��Ľṹ `@shopnc@log`
-- 

DROP TABLE IF EXISTS `@shopnc@log`;
CREATE TABLE `@shopnc@log` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '��־id',
  `log_user` varchar(50) NOT NULL COMMENT 'ִ����',
  `admin_group` tinyint(4) NOT NULL COMMENT 'ִ�������ڹ�����',
  `log_ip` varchar(20) NOT NULL COMMENT 'ip��ַ',
  `log_time` varchar(10) NOT NULL COMMENT 'ִ��ʱ��',
  `log_info` varchar(100) NOT NULL COMMENT 'ִ������',
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='��̨������־';

-- --------------------------------------------------------

-- 
-- ��Ľṹ `@shopnc@mail_template`
-- 

DROP TABLE IF EXISTS `@shopnc@mail_template`;
CREATE TABLE `@shopnc@mail_template` (
  `mail_template_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '�ʼ�ģ��id',
  `mail_template_name` varchar(100) NOT NULL COMMENT 'ģ������',
  `mail_template_body` text NOT NULL COMMENT 'ģ������',
  PRIMARY KEY (`mail_template_id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='�ʼ�ģ�����ݱ�';

-- --------------------------------------------------------

-- 
-- ��Ľṹ `@shopnc@order_detail`
-- 

DROP TABLE IF EXISTS `@shopnc@order_detail`;
CREATE TABLE `@shopnc@order_detail` (
  `order_detail_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '������Ʒ��id',
  `order_id` int(11) NOT NULL COMMENT '����id',
  `goods_id` int(11) NOT NULL COMMENT '��Ʒid',
  `goods_name` varchar(50) NOT NULL COMMENT '��Ʒ����',
  `goods_bn` varchar(20) NOT NULL COMMENT '��Ʒ���',
  `goods_unit` varchar(10) DEFAULT NULL COMMENT '��Ʒ��λ',
  `goods_count` int(11) NOT NULL COMMENT '��Ʒ����',
  `goods_size` varchar(10) DEFAULT NULL COMMENT '��Ʒ�ߴ�',
  `goods_color` varchar(10) DEFAULT NULL COMMENT '��Ʒ��ɫ',
  `goods_price` decimal(10,2) NOT NULL COMMENT '�г��۸�',
  `goods_pricedesc` decimal(10,2) NOT NULL COMMENT '��Ʒ�۸�',
  `provider_id` int(11) NOT NULL COMMENT '��Ӧ��id',
  PRIMARY KEY (`order_detail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='������Ʒ���ݱ�';

-- --------------------------------------------------------

-- 
-- ��Ľṹ `@shopnc@order_table`
-- 

DROP TABLE IF EXISTS `@shopnc@order_table`;
CREATE TABLE `@shopnc@order_table` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '����id',
  `user_id` int(11) NOT NULL COMMENT '��Աid',
  `order_serial` varchar(50) NOT NULL COMMENT '�������',
  `receiver_name` varchar(50) NOT NULL COMMENT '�ͻ�������',
  `receiver_address` varchar(200) NOT NULL COMMENT '�ͻ��˵�ַ',
  `receiver_email` varchar(50) NOT NULL COMMENT '�ͻ���email',
  `receiver_post` varchar(20) NOT NULL COMMENT '�ͻ����ʱ�',
  `receiver_tele` varchar(20) NOT NULL COMMENT '�ͻ��˵绰',
  `receiver_mobile` varchar(20) NOT NULL COMMENT '�ͻ����ֻ�',
  `receiver_tele_other` varchar(20) DEFAULT NULL COMMENT '�ͻ���������ϵ��ʽ',
  `transport_id` int(11) NOT NULL COMMENT '����id',
  `transport_name` varchar(50) NOT NULL COMMENT '��������',
  `transport_price` decimal(10,2) NOT NULL COMMENT '���ͼ۸�',
  `transport_content` varchar(200) NOT NULL COMMENT '������������',
  `pay_id` int(11) DEFAULT NULL COMMENT '֧��id',
  `pay_name` varchar(50) NOT NULL COMMENT '֧������',
  `pay_state` tinyint(1) NOT NULL COMMENT '֧��״̬',
  `pay_price` decimal(10,2) NOT NULL DEFAULT '0' COMMENT '֧����������',
  `pay_content` varchar(200) NOT NULL COMMENT '֧������',
  `order_invoice` tinyint(1) NOT NULL COMMENT '�Ƿ���Ҫ��Ʊ��0Ϊ����Ҫ��1Ϊ��Ҫ',
  `order_invoice_top` varchar(255) DEFAULT NULL COMMENT '��Ʊͷ����',
  `order_state` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'ȷ��״̬',
  `order_state1` tinyint(1) NOT NULL DEFAULT '0' COMMENT '����״̬��0δ����1�Ѹ�',
  `order_state2` tinyint(1) NOT NULL DEFAULT '0' COMMENT '����״̬',
  `order_state3` tinyint(1) NOT NULL DEFAULT '0' COMMENT '�鵵״̬',
  `send_time` varchar(10) DEFAULT NULL COMMENT '����ʱ��',
  `create_time` varchar(10) NOT NULL COMMENT '����ʱ��',
  `order_price` decimal(10,2) NOT NULL COMMENT '�����ܼ�',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='�������ݱ�';

-- --------------------------------------------------------

-- 
-- ��Ľṹ `@shopnc@pay`
-- 

DROP TABLE IF EXISTS `@shopnc@pay`;
CREATE TABLE `@shopnc@pay` (
  `pay_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '֧����ʽid',
  `pay_name` varchar(20) NOT NULL COMMENT '֧������',
  `pay_info` varchar(255) NOT NULL COMMENT '֧������',
  `pay_code` varchar(20) NOT NULL COMMENT '֧����ʽ����',
  `pay_content` text NOT NULL COMMENT '��������',
  `pay_type` tinyint(1) NOT NULL COMMENT '֧�����ͣ���������ǻ�������',
  `pay_online` tinyint(1) NOT NULL COMMENT '����֧����1����֧����0������֧��',
  `pay_fee` varchar(10) NOT NULL DEFAULT '0' COMMENT '֧������',
  `pay_state` tinyint(1) NOT NULL COMMENT '״̬��1������0�ر�',
  `pay_selected` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Ĭ��ѡȡ��0Ϊ��ѡȡ��1Ϊѡȡ',
  `pay_sort` int(11) NOT NULL DEFAULT '0' COMMENT '֧����������',
  `pay_area_directory` varchar(50) NOT NULL COMMENT '֧��Ŀ¼',
  PRIMARY KEY (`pay_id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='֧����ʽ���ݱ�';

-- --------------------------------------------------------

-- 
-- ��Ľṹ `@shopnc@pay_area`
-- 

DROP TABLE IF EXISTS `@shopnc@pay_area`;
CREATE TABLE `@shopnc@pay_area` (
  `pay_area_id` int(8) NOT NULL AUTO_INCREMENT COMMENT '֧������id',
  `pay_area_name` varchar(50) NOT NULL COMMENT '֧����������',
  `pay_area_info` varchar(255) DEFAULT NULL COMMENT '֧����������',
  `pay_area_directory` varchar(50) NOT NULL COMMENT '֧��Ŀ¼',
  `pay_area_state` tinyint(1) NOT NULL COMMENT '״̬��0Ϊ�رգ�1Ϊ����',
  `pay_area_sort` int(11) NOT NULL DEFAULT '0' COMMENT '֧����������',
  PRIMARY KEY (`pay_area_id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='֧���������ݱ�';

-- --------------------------------------------------------

-- 
-- ��Ľṹ `@shopnc@provider`
-- 

DROP TABLE IF EXISTS `@shopnc@provider`;
CREATE TABLE `@shopnc@provider` (
  `provider_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '��Ӧ��id',
  `provider_pname` varchar(50) NOT NULL COMMENT '��Ӧ������',
  `provider_name` varchar(50) NOT NULL COMMENT '��Ӧ���ʺ�',
  `provider_passwd` varchar(16) NOT NULL COMMENT '��Ӧ������',
  `provider_contacts` varchar(50) NOT NULL COMMENT '��ϵ��',
  `provider_state` tinyint(1) NOT NULL COMMENT '״̬0Ϊ�رգ�1Ϊ����',
  `provider_call` varchar(30) DEFAULT NULL COMMENT '�绰',
  `provider_address` varchar(100) DEFAULT NULL COMMENT '��ַ',
  `provider_email` varchar(50) DEFAULT NULL COMMENT '�����ʼ�',
  `provider_qq` varchar(50) DEFAULT NULL COMMENT 'qq',
  `provider_msn` varchar(50) DEFAULT NULL COMMENT 'msn',
  `privider_description` varchar(255) DEFAULT NULL COMMENT '����',
  `provider_time` varchar(10) NOT NULL COMMENT '���ʱ��',
  PRIMARY KEY (`provider_id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='��Ӧ�����ݱ�';

-- --------------------------------------------------------

-- 
-- ��Ľṹ `@shopnc@send`
-- 

DROP TABLE IF EXISTS `@shopnc@send`;
CREATE TABLE `@shopnc@send` (
  `send_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '����id',
  `send_name` varchar(50) NOT NULL COMMENT '��������',
  `send_path` int(11) NOT NULL COMMENT '���͵��ļ���·��',
  `send_file` varchar(20) NOT NULL COMMENT '��ص������ļ�',
  `send_pay_type` tinyint(1) NOT NULL COMMENT '�Ƿ�������1�ǣ�0��',
  PRIMARY KEY (`send_id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='���������';

-- --------------------------------------------------------

-- 
-- ��Ľṹ `@shopnc@send_area`
-- 

DROP TABLE IF EXISTS `@shopnc@send_area`;
CREATE TABLE `@shopnc@send_area` (
  `send_area_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '��������id�������Ǵ������',
  `send_area_name` varchar(50) NOT NULL COMMENT '��������',
  `send_area_info` varchar(255) DEFAULT NULL COMMENT '������',
  `send_area_directory` varchar(50) NOT NULL COMMENT '����Ŀ¼',
  `send_area_state` tinyint(1) NOT NULL DEFAULT '1' COMMENT '����״̬��1������0�ر�',
  `send_area_sort` tinyint(4) NOT NULL DEFAULT '0' COMMENT '������������',
  PRIMARY KEY (`send_area_id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='�����������ݱ�';

-- --------------------------------------------------------

-- 
-- ��Ľṹ `@shopnc@send_buy_area`
-- 

DROP TABLE IF EXISTS `@shopnc@send_buy_area`;
CREATE TABLE `@shopnc@send_buy_area` (
  `buy_area_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '��������id',
  `buy_area_name` varchar(50) NOT NULL COMMENT '��������',
  `buy_area` text COMMENT '�������ö��ŷָ�',
  `buy_body` text NOT NULL COMMENT '��ط��ã��������л�',
  `send_id` int(11) NOT NULL COMMENT '�������ͷ�ʽ',
  PRIMARY KEY (`buy_area_id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='���͹�����Ʒ�Ĳ�ͬ����';

-- --------------------------------------------------------

-- 
-- ��Ľṹ `@shopnc@subject`
-- 

DROP TABLE IF EXISTS `@shopnc@subject`;
CREATE TABLE `@shopnc@subject` (
  `subject_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '�������id',
  `subject_name` varchar(50) NOT NULL COMMENT '��������',
  `subject_image` varchar(100) DEFAULT NULL COMMENT '����ͼƬ',
  `subject_image_width` int(11) DEFAULT NULL COMMENT 'ͼƬ��ʾ���',
  `subject_image_height` int(11) DEFAULT NULL COMMENT 'ͼƬ��ʾ�߶�',
  `subject_state` tinyint(4) NOT NULL DEFAULT '0' COMMENT '����״̬1������0��δ����',
  `subject_url` varchar(100) DEFAULT NULL COMMENT '�����ⲿ����',
  `subject_sort` int(11) DEFAULT '0' COMMENT '��������',
  `subject_body` text COMMENT '��������',
  `subject_keywords` varchar(100) DEFAULT NULL COMMENT '����ؼ���',
  `subject_description` varchar(200) DEFAULT NULL COMMENT '��������',
  PRIMARY KEY (`subject_id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='��Ʒ��������';

-- --------------------------------------------------------

-- 
-- ��Ľṹ `@shopnc@user_grade`
-- 

DROP TABLE IF EXISTS `@shopnc@user_grade`;
CREATE TABLE `@shopnc@user_grade` (
  `grade_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '�ȼ�id',
  `grade_name` varchar(50) NOT NULL COMMENT '�ȼ�����',
  `grade_time` int(11) DEFAULT NULL COMMENT '�Ż�ʱ��',
  `grade_discount` varchar(10) DEFAULT NULL COMMENT '�Ż��ۿ�',
  `grade_state` tinyint(1) NOT NULL DEFAULT '1' COMMENT '�ȼ�״̬0Ϊ�رգ�1Ϊ����',
  PRIMARY KEY (`grade_id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='��Ա�ȼ���';

-- --------------------------------------------------------

-- 
-- ��Ľṹ `@shopnc@users`
-- 

DROP TABLE IF EXISTS `@shopnc@users`;
CREATE TABLE `@shopnc@users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '��Աid',
  `user_name` varchar(50) NOT NULL COMMENT '��Ա����',
  `user_sex` tinyint(4) DEFAULT '0' COMMENT '��Ա�Ա� 0����1��Ů',
  `user_true_name` varchar(50) DEFAULT NULL COMMENT '��Ա��ʵ����',
  `user_password` char(16) NOT NULL COMMENT '��Ա����',
  `user_email` varchar(50) NOT NULL COMMENT '��Ա����',
  `user_country` int(11) DEFAULT NULL COMMENT '��Ա��������',
  `user_province` int(11) DEFAULT NULL COMMENT '��Ա����ʡ',
  `user_city` int(11) DEFAULT NULL COMMENT '��Ա������',
  `user_county` int(11) DEFAULT NULL COMMENT '��',
  `user_address` varchar(100) DEFAULT NULL COMMENT '��Ա���ھ������',
  `user_zip` varchar(10) DEFAULT NULL COMMENT '��������',
  `user_phone` varchar(20) DEFAULT NULL COMMENT '�绰��һ��ָ����',
  `user_mobilephone` varchar(20) DEFAULT NULL COMMENT '�ƶ��绰',
  `user_otherphone` varchar(20) DEFAULT NULL COMMENT '�����绰',
  `user_qq` varchar(50) DEFAULT NULL COMMENT '��Աqq��',
  `user_msn` varchar(50) DEFAULT NULL COMMENT '��Աmsn��',
  `grade_id` tinyint(4) DEFAULT NULL COMMENT '��Ա�ȼ�id',
  `user_state` tinyint(4) NOT NULL DEFAULT '0' COMMENT '��Ա״̬1������0���ر�',
  `user_register_time` char(10) NOT NULL COMMENT 'ע��ʱ��',
  `user_login_time` char(10) NOT NULL COMMENT '��¼ʱ��',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='��Ա���ݱ�';

-- --------------------------------------------------------

-- 
-- ��Ľṹ `@shopnc@users_other`
-- 

DROP TABLE IF EXISTS `@shopnc@users_other`;
CREATE TABLE `@shopnc@users_other` (
  `other_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '�ջ�ַid',
  `user_uid` int(11) NOT NULL COMMENT '��Աid',
  `other_true_name` varchar(50) NOT NULL COMMENT '�ջ�����������',
  `other_email` varchar(50) NOT NULL COMMENT '�ջ���email',
  `other_country` int(11) NOT NULL COMMENT '�ջ������ڹ���',
  `other_province` int(11) NOT NULL COMMENT '�ջ�������ʡ',
  `other_city` int(11) DEFAULT NULL COMMENT '�ջ���������',
  `other_county` int(11) DEFAULT NULL COMMENT '��',
  `other_address` varchar(50) NOT NULL COMMENT '�ջ��˾������',
  `other_zip` varchar(10) NOT NULL COMMENT '�ջ����ʱ�',
  `other_phone` varchar(20) DEFAULT NULL COMMENT '�ջ��˹̶��绰',
  `other_mobilephone` varchar(20) DEFAULT NULL COMMENT '�ջ����ƶ��绰',
  `other_otherphone` varchar(20) DEFAULT NULL COMMENT '�ջ��������绰',
  `other_flag` enum('yes','no') DEFAULT NULL COMMENT '�Ƿ���Ĭ���ջ���ַ',
  PRIMARY KEY (`other_id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='�ͻ�Ա��ص��ջ���';

-- --------------------------------------------------------

-- 
-- ��Ľṹ `@shopnc@visit`
-- 

DROP TABLE IF EXISTS `@shopnc@visit`;
CREATE TABLE `@shopnc@visit` (
  `visit_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '����ͳ��id',
  `ip` varchar(500) NOT NULL COMMENT '����ip',
  `ip_area` varchar(100) NOT NULL COMMENT '��Դ����',
  `visit_url` varchar(500) NOT NULL COMMENT '���ʵ�ַ',
  `source_url` varchar(500) NOT NULL COMMENT '��Դ��ַ',
  `visit_time` char(10) NOT NULL COMMENT '����ʱ��',
  `visit_system` varchar(100) NOT NULL COMMENT '����ϵͳ',
  PRIMARY KEY (`visit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='����ͳ�Ʊ�';

-- --------------------------------------------------------

-- 
-- ��Ľṹ `@shopnc@vote`
-- 

DROP TABLE IF EXISTS `@shopnc@vote`;
CREATE TABLE `@shopnc@vote` (
  `vote_id` int(8) NOT NULL AUTO_INCREMENT COMMENT 'ͶƱid',
  `vote_title` varchar(50) NOT NULL COMMENT 'ͶƱ��Ŀ',
  `vote_start_time` varchar(10) DEFAULT NULL COMMENT '��ʼʱ��',
  `vote_end_time` varchar(10) DEFAULT NULL COMMENT '����ʱ��',
  `vote_type` enum('0','1') NOT NULL COMMENT 'ͶƱ����',
  `vote_member` enum('0','1') NOT NULL COMMENT '�Ƿ���Ի�ԱͶƱ',
  `vote_refresh` enum('0','1') NOT NULL COMMENT '�Ƿ�����ظ�ͶƱ',
  `vote_state` enum('0','1') NOT NULL COMMENT '״̬��0�رգ�1����',
  `vote_time` varchar(10) NOT NULL COMMENT '����ʱ��',
  PRIMARY KEY (`vote_id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='ͶƱ���ݱ�';

-- --------------------------------------------------------

-- 
-- ��Ľṹ `@shopnc@vote_option`
-- 

DROP TABLE IF EXISTS `@shopnc@vote_option`;
CREATE TABLE `@shopnc@vote_option` (
  `option_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ͶƱѡ��id',
  `vote_id` int(11) NOT NULL COMMENT 'ͶƱ����id',
  `option_tile` varchar(100) NOT NULL COMMENT 'ͶƱѡ������',
  `option_num` int(11) NOT NULL COMMENT 'ͶƱ��',
  `option_sort` int(11) NOT NULL DEFAULT '0' COMMENT '����',
  PRIMARY KEY (`option_id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='ͶƱѡ�����ݱ�';

-- 
-- �������е����� 'shopnc_ad'
-- 

INSERT INTO @shopnc@ad (`ad_id`, `ad_title`, `ad_type`, `position_id`, `ad_url`, `ad_body`, `ad_state`, `ad_starttime`, `ad_endtime`, `ad_user`, `ad_email`, `ad_call`, `ad_view`) VALUES 
(1, '��ҳ���', 'pic', 1, 'a:5:{i:0;s:21:"http://www.shopnc.net";i:1;s:21:"http://www.shopnc.net";i:2;s:21:"http://www.shopnc.net";i:3;s:21:"http://www.shopnc.net";i:4;s:21:"http://www.shopnc.net";}', 'a:6:{i:0;s:46:"attachments/adfile/123725428749bf008fb34aa.jpg";i:1;s:46:"attachments/adfile/123725428749bf008fc10df.jpg";i:2;s:46:"attachments/adfile/123725424549bf0065632ed.jpg";i:3;s:46:"attachments/adfile/123725424549bf006570b0a.jpg";i:4;s:46:"attachments/adfile/123725430549bf00a1c28cf.jpg";s:7:"ad_info";a:5:{i:0;N;i:1;N;i:2;N;i:3;N;i:4;N;}}', 0, '', '', '', '', '', 0),
(2, '��ҳ���', 'pic', 2, 'http://www.shopnc.net', 'attachments/adfile/123780255949c75e3f29f66.jpg', 1, '2009-3-23', '2009-12-24', '', '', '', 40);

INSERT INTO @shopnc@ad_position (position_id, position_name, position_width, position_height, position_info) VALUES 
(1, '��ҳ���', 500, 180, '��ҳ���'),
(2, '��ҳ������', 670, 90, '��ҳ������');

-- 
-- �������е����� 'shopnc_admin'
-- 

INSERT INTO @shopnc@admin (admin_id, admin_name, admin_password, admin_email, admin_state, admin_cmpetence, admin_add_time) VALUES 
(1, 'admin', '21232f297a57a5a7', 'admin@admin.com', 1, 'system_all', '1236304068');

-- 
-- �������е����� 'shopnc_area'
-- 

INSERT INTO @shopnc@area (area_id, area_top_id, area_name, area_sort, area_info) VALUES 
(1, 0, '�й�', 0, NULL),
(2, 1, '����', 1, NULL),
(3, 1, '���', 1, NULL),
(4, 1, '�ӱ�ʡ', 1, NULL),
(5, 1, 'ɽ��', 1, NULL),
(6, 1, '���ɹ�', 1, NULL),
(7, 1, '����', 1, NULL),
(8, 1, '����', 1, NULL),
(9, 1, '������', 1, NULL),
(10, 1, '�Ϻ�', 1, NULL),
(11, 1, '����', 1, NULL),
(12, 1, '�㽭', 1, NULL),
(13, 1, '����', 1, NULL),
(14, 1, '����', 1, NULL),
(15, 1, '����', 1, NULL),
(16, 1, 'ɽ��', 1, NULL),
(17, 1, '����', 1, NULL),
(18, 1, '����', 1, NULL),
(19, 1, '����', 1, NULL),
(20, 1, '�㶫', 1, NULL),
(21, 1, '����', 1, NULL),
(22, 1, '����', 1, NULL),
(23, 1, '����', 1, NULL),
(24, 1, '�Ĵ�', 1, NULL),
(25, 1, '����', 1, NULL),
(26, 1, '����', 1, NULL),
(27, 1, '����', 1, NULL),
(28, 1, '����', 1, NULL),
(29, 1, '����', 1, NULL),
(30, 1, '�ຣ', 1, NULL),
(31, 1, '����', 1, NULL),
(32, 1, '�½�', 1, NULL),
(33, 1, '���', 1, NULL),
(34, 1, '̨��', 1, NULL),
(35, 2, '����', 2, NULL),
(36, 3, '�����', 2, NULL),
(37, 4, 'ʯ��ׯ', 2, NULL),
(38, 4, '��ɽ', 2, NULL),
(39, 4, '�ػʵ�', 2, NULL),
(40, 4, '����', 2, NULL),
(41, 4, '��̨', 2, NULL),
(42, 4, '����', 2, NULL),
(43, 4, '�żҿ�', 2, NULL),
(44, 4, '�е�', 2, NULL),
(45, 4, '����', 2, NULL),
(46, 4, '�ȷ�', 2, NULL),
(47, 4, '��ˮ', 2, NULL),
(48, 5, '̫ԭ', 2, NULL),
(49, 5, '��ͬ', 2, NULL),
(50, 5, '��Ȫ', 2, NULL),
(51, 5, '����', 2, NULL),
(52, 5, '����', 2, NULL),
(53, 5, '˷��', 2, NULL),
(54, 5, '����', 2, NULL),
(55, 5, '�˳�', 2, NULL),
(56, 5, '����', 2, NULL),
(57, 5, '�ٷ�', 2, NULL),
(58, 5, '����', 2, NULL),
(59, 5, '����', 2, NULL),
(60, 5, '��̨ɽ', 2, NULL),
(61, 5, '��ʯ', 2, NULL),
(62, 6, '���ͺ���', 2, NULL),
(63, 6, '��ͷ', 2, NULL),
(64, 6, '�ں�', 2, NULL),
(65, 6, '���', 2, NULL),
(66, 6, 'ͨ��', 2, NULL),
(67, 6, '������˹', 2, NULL),
(68, 6, '���ױ���', 2, NULL),
(69, 6, '�����׶���', 2, NULL),
(70, 6, '�����첼��', 2, NULL),
(71, 6, '�˰���', 2, NULL),
(72, 6, '���ֹ�����', 2, NULL),
(73, 6, '��������', 2, NULL),
(74, 7, '����', 2, NULL),
(75, 7, '����', 2, NULL),
(76, 7, '��ɽ', 2, NULL),
(77, 7, '��˳', 2, NULL),
(78, 7, '��Ϫ', 2, NULL),
(79, 7, '����', 2, NULL),
(80, 7, '����', 2, NULL),
(81, 7, 'Ӫ��', 2, NULL),
(82, 7, '����', 2, NULL),
(83, 7, '����', 2, NULL),
(84, 7, '�̽�', 2, NULL),
(85, 7, '����', 2, NULL),
(86, 7, '����', 2, NULL),
(87, 7, '��«����', 2, NULL),
(88, 8, '����', 2, NULL),
(89, 8, '����', 2, NULL),
(90, 8, '��ƽ', 2, NULL),
(91, 8, '��Դ', 2, NULL),
(92, 8, 'ͨ��', 2, NULL),
(93, 8, '��ɽ', 2, NULL),
(94, 8, '��ԭ', 2, NULL),
(95, 8, '�׳�', 2, NULL),
(96, 8, '�ӱ�', 2, NULL),
(97, 9, '������', 2, NULL),
(98, 9, '�������', 2, NULL),
(99, 9, '����', 2, NULL),
(100, 9, '�׸�', 2, NULL),
(101, 9, '˫Ѽɽ', 2, NULL),
(102, 9, '����', 2, NULL),
(103, 9, '����', 2, NULL),
(104, 9, '��ľ˹', 2, NULL),
(105, 9, '��̨��', 2, NULL),
(106, 9, 'ĵ����', 2, NULL),
(107, 9, '�ں�', 2, NULL),
(108, 9, '�绯', 2, NULL),
(109, 9, '���˰���', 2, NULL),
(110, 10, '�Ϻ�', 2, NULL),
(111, 11, '�Ͼ�', 2, NULL),
(112, 11, '����', 2, NULL),
(113, 11, '����', 2, NULL),
(114, 11, '����', 2, NULL),
(115, 11, '����', 2, NULL),
(116, 11, '��ͨ', 2, NULL),
(117, 11, '���Ƹ�', 2, NULL),
(118, 11, '����', 2, NULL),
(119, 11, '�γ�', 2, NULL),
(120, 11, '����', 2, NULL),
(121, 11, '��', 2, NULL),
(122, 11, '̩��', 2, NULL),
(123, 11, '��Ǩ', 2, NULL),
(124, 12, '����', 2, NULL),
(125, 12, '����', 2, NULL),
(126, 12, '����', 2, NULL),
(127, 12, '����', 2, NULL),
(128, 12, '����', 2, NULL),
(129, 12, '����', 2, NULL),
(130, 12, '��', 2, NULL),
(131, 12, '����', 2, NULL),
(132, 12, '��ɽ', 2, NULL),
(133, 12, '̨��', 2, NULL),
(134, 12, '��ˮ', 2, NULL),
(135, 13, '�Ϸ�', 2, NULL),
(136, 13, '�ߺ�', 2, NULL),
(137, 13, '����', 2, NULL),
(138, 13, '����', 2, NULL),
(139, 13, '��ɽ', 2, NULL),
(140, 13, '����', 2, NULL),
(141, 13, 'ͭ��', 2, NULL),
(142, 13, '����', 2, NULL),
(143, 13, '��ɽ', 2, NULL),
(144, 13, '����', 2, NULL),
(145, 13, '����', 2, NULL),
(146, 13, '����', 2, NULL),
(147, 13, '����', 2, NULL),
(148, 13, '����', 2, NULL),
(149, 13, '����', 2, NULL),
(150, 13, '����', 2, NULL),
(151, 13, '����', 2, NULL),
(152, 14, '����', 2, NULL),
(153, 14, '����', 2, NULL),
(154, 14, '����', 2, NULL),
(155, 14, '����', 2, NULL),
(156, 14, 'Ȫ��', 2, NULL),
(157, 14, '����', 2, NULL),
(158, 14, '��ƽ', 2, NULL),
(159, 14, '����', 2, NULL),
(160, 14, '����', 2, NULL),
(161, 15, '�ϲ�', 2, NULL),
(162, 15, '������', 2, NULL),
(163, 15, 'Ƽ��', 2, NULL),
(164, 15, '�Ž�', 2, NULL),
(165, 15, '����', 2, NULL),
(166, 15, 'ӥ̶', 2, NULL),
(167, 15, '����', 2, NULL),
(168, 15, '����', 2, NULL),
(169, 15, '�˴�', 2, NULL),
(170, 15, '����', 2, NULL),
(171, 15, '����', 2, NULL),
(172, 16, '����', 2, NULL),
(173, 16, '�ൺ', 2, NULL),
(174, 16, '�Ͳ�', 2, NULL),
(175, 16, '��ׯ', 2, NULL),
(176, 16, '��Ӫ', 2, NULL),
(177, 16, '��̨', 2, NULL),
(178, 16, 'Ϋ��', 2, NULL),
(179, 16, '����', 2, NULL),
(180, 16, '̩��', 2, NULL),
(181, 16, '����', 2, NULL),
(182, 16, '����', 2, NULL),
(183, 16, '����', 2, NULL),
(184, 16, '����', 2, NULL),
(185, 16, '����', 2, NULL),
(186, 16, '�ĳ�', 2, NULL),
(187, 16, '����', 2, NULL),
(188, 16, '����', 2, NULL),
(189, 17, '֣��', 2, NULL),
(190, 17, '����', 2, NULL),
(191, 17, '����', 2, NULL),
(192, 17, 'ƽ��ɽ', 2, NULL),
(193, 17, '����', 2, NULL),
(194, 17, '�ױ�', 2, NULL),
(195, 17, '����', 2, NULL),
(196, 17, '����', 2, NULL),
(197, 17, '���', 2, NULL),
(198, 17, '���', 2, NULL),
(199, 17, '���', 2, NULL),
(200, 17, '����Ͽ', 2, NULL),
(201, 17, '����', 2, NULL),
(202, 17, '����', 2, NULL),
(203, 17, '����', 2, NULL),
(204, 17, '�ܿ�', 2, NULL),
(205, 17, 'פ���', 2, NULL),
(206, 18, '�人', 2, NULL),
(207, 18, '��ʯ', 2, NULL),
(208, 18, '�差', 2, NULL),
(209, 18, 'ʮ��', 2, NULL),
(210, 18, '����', 2, NULL),
(211, 18, '�˲�', 2, NULL),
(212, 18, '����', 2, NULL),
(213, 18, '����', 2, NULL),
(214, 18, 'Т��', 2, NULL),
(215, 18, '�Ƹ�', 2, NULL),
(216, 18, '����', 2, NULL),
(217, 18, '����', 2, NULL),
(218, 18, '��ʩ', 2, NULL),
(219, 19, '��ɳ', 2, NULL),
(220, 19, '����', 2, NULL),
(221, 19, '��̶', 2, NULL),
(222, 19, '����', 2, NULL),
(223, 19, '����', 2, NULL),
(224, 19, '����', 2, NULL),
(225, 19, '����', 2, NULL),
(226, 19, '�żҽ�', 2, NULL),
(227, 19, '����', 2, NULL),
(228, 19, '����', 2, NULL),
(229, 19, '����', 2, NULL),
(230, 19, '����', 2, NULL),
(231, 19, '¦��', 2, NULL),
(232, 19, '����', 2, NULL),
(233, 20, '����', 2, NULL),
(234, 20, '����', 2, NULL),
(235, 20, '�麣', 2, NULL),
(236, 20, '��ͷ', 2, NULL),
(237, 20, '�ع�', 2, NULL),
(238, 20, '��ɽ', 2, NULL),
(239, 20, '����', 2, NULL),
(240, 20, 'տ��', 2, NULL),
(241, 20, 'ï��', 2, NULL),
(242, 20, '����', 2, NULL),
(243, 20, '����', 2, NULL),
(244, 20, '÷��', 2, NULL),
(245, 20, '��β', 2, NULL),
(246, 20, '��Դ', 2, NULL),
(247, 20, '����', 2, NULL),
(248, 20, '��Զ', 2, NULL),
(249, 20, '��ݸ', 2, NULL),
(250, 20, '��ɽ', 2, NULL),
(251, 20, '����', 2, NULL),
(252, 20, '����', 2, NULL),
(253, 20, '�Ƹ�', 2, NULL),
(254, 21, '����', 2, NULL),
(255, 21, '����', 2, NULL),
(256, 21, '����', 2, NULL),
(257, 21, '����', 2, NULL),
(258, 21, '����', 2, NULL),
(259, 21, '���Ǹ�', 2, NULL),
(260, 21, '����', 2, NULL),
(261, 21, '���', 2, NULL),
(262, 21, '����', 2, NULL),
(263, 21, '��ɫ', 2, NULL),
(264, 21, '����', 2, NULL),
(265, 21, '�ӳ�', 2, NULL),
(266, 21, '����', 2, NULL),
(267, 21, '����', 2, NULL),
(268, 22, '����', 2, NULL),
(269, 22, '����', 2, NULL),
(270, 22, '����', 2, NULL),
(271, 23, '����', 2, NULL),
(272, 24, '�ɶ�', 2, NULL),
(273, 24, '�Թ�', 2, NULL),
(274, 24, '��֦��', 2, NULL),
(275, 24, '����', 2, NULL),
(276, 24, '����', 2, NULL),
(277, 24, '����', 2, NULL),
(278, 24, '��Ԫ', 2, NULL),
(279, 24, '����', 2, NULL),
(280, 24, '�ڽ�', 2, NULL),
(281, 24, '��ɽ', 2, NULL),
(282, 24, '�ϳ�', 2, NULL),
(283, 24, '�˱�', 2, NULL),
(284, 24, '�㰲', 2, NULL),
(285, 24, '����', 2, NULL),
(286, 24, 'üɽ', 2, NULL),
(287, 24, '�Ű�', 2, NULL),
(288, 24, '����', 2, NULL),
(289, 24, '����', 2, NULL),
(290, 24, '����', 2, NULL),
(291, 24, '����', 2, NULL),
(292, 24, '��ɽ', 2, NULL),
(293, 25, '����', 2, NULL),
(294, 25, '����ˮ', 2, NULL),
(295, 25, '����', 2, NULL),
(296, 25, '��˳', 2, NULL),
(297, 25, 'ͭ��', 2, NULL),
(298, 25, '�Ͻ�', 2, NULL),
(299, 25, 'ǭ����', 2, NULL),
(300, 25, 'ǭ����', 2, NULL),
(301, 25, 'ǭ��', 2, NULL),
(302, 26, '����', 2, NULL),
(303, 26, '����', 2, NULL),
(304, 26, '��Ϫ', 2, NULL),
(305, 26, '��ɽ', 2, NULL),
(306, 26, '��ͨ', 2, NULL),
(307, 26, '����', 2, NULL),
(308, 26, '˼é', 2, NULL),
(309, 26, '�ٲ�', 2, NULL),
(310, 26, '��ɽ', 2, NULL),
(311, 26, '���', 2, NULL),
(312, 26, '��˫����', 2, NULL),
(313, 26, '����', 2, NULL),
(314, 26, '����', 2, NULL),
(315, 26, '�º�', 2, NULL),
(316, 26, 'ŭ��', 2, NULL),
(317, 26, '����', 2, NULL),
(318, 27, '����', 2, NULL),
(319, 27, '����', 2, NULL),
(320, 27, 'ɽ��', 2, NULL),
(321, 27, '�տ���', 2, NULL),
(322, 27, '����', 2, NULL),
(323, 27, '����', 2, NULL),
(324, 27, '��֥', 2, NULL),
(325, 28, '����', 2, NULL),
(326, 28, 'ͭ��', 2, NULL),
(327, 28, '����', 2, NULL),
(328, 28, '����', 2, NULL),
(329, 28, 'μ��', 2, NULL),
(330, 28, '�Ӱ�', 2, NULL),
(331, 28, '����', 2, NULL),
(332, 28, '����', 2, NULL),
(333, 28, '����', 2, NULL),
(334, 28, '����', 2, NULL),
(335, 29, '����', 2, NULL),
(336, 29, '������', 2, NULL),
(337, 29, '���', 2, NULL),
(338, 29, '����', 2, NULL),
(339, 29, '��ˮ', 2, NULL),
(340, 29, '����', 2, NULL),
(341, 29, '��Ҵ', 2, NULL),
(342, 29, 'ƽ��', 2, NULL),
(343, 29, '��Ȫ', 2, NULL),
(344, 29, '����', 2, NULL),
(345, 29, '����', 2, NULL),
(346, 29, '¤��', 2, NULL),
(347, 29, '����', 2, NULL),
(348, 29, '����', 2, NULL),
(349, 30, '����', 2, NULL),
(350, 30, '����', 2, NULL),
(351, 30, '����', 2, NULL),
(352, 30, '����', 2, NULL),
(353, 30, '����', 2, NULL),
(354, 30, '����', 2, NULL),
(355, 30, '����', 2, NULL),
(356, 30, '����', 2, NULL),
(357, 31, '����', 2, NULL),
(358, 31, 'ʯ��ɽ', 2, NULL),
(359, 31, '����', 2, NULL),
(360, 31, '��ԭ', 2, NULL),
(361, 31, '������', 2, NULL),
(362, 32, '��³ľ��', 2, NULL),
(363, 32, '��������', 2, NULL),
(364, 32, '��¶��', 2, NULL),
(365, 32, '����', 2, NULL),
(366, 32, '����', 2, NULL),
(367, 32, '�����յ���', 2, NULL),
(368, 32, '��ʲ', 2, NULL),
(369, 32, '��������', 2, NULL),
(370, 32, '��������', 2, NULL),
(371, 32, '����', 2, NULL),
(372, 32, '��������', 2, NULL),
(373, 32, '����', 2, NULL),
(374, 32, '����', 2, NULL),
(375, 32, '����̩', 2, NULL),
(376, 33, '������', 2, NULL),
(377, 33, '����', 2, NULL),
(378, 33, '��������', 2, NULL),
(379, 33, '������', 2, NULL),
(380, 33, '����', 2, NULL),
(381, 33, '��ˮ����', 2, NULL),
(382, 33, '�ƴ�����', 2, NULL),
(383, 33, '������', 2, NULL),
(384, 33, '�ͼ�����', 2, NULL),
(385, 33, '�뵺��', 2, NULL),
(386, 33, '������', 2, NULL),
(387, 33, '����', 2, NULL),
(388, 33, '������', 2, NULL),
(389, 33, 'ɳ����', 2, NULL),
(390, 33, '������', 2, NULL),
(391, 33, '������', 2, NULL),
(392, 33, '������', 2, NULL),
(393, 33, 'Ԫ����', 2, NULL),
(394, 34, '̨����', 2, NULL),
(395, 34, '������', 2, NULL),
(396, 34, '��¡��', 2, NULL),
(397, 34, '̨����', 2, NULL),
(398, 34, '̨����', 2, NULL),
(399, 34, '������', 2, NULL),
(400, 34, '������', 2, NULL),
(401, 34, '̨����', 2, NULL),
(402, 34, '������', 2, NULL),
(403, 34, '��԰��', 2, NULL),
(404, 34, '������', 2, NULL),
(405, 34, '������', 2, NULL),
(406, 34, '̨����', 2, NULL),
(407, 34, '�û���', 2, NULL),
(408, 34, '��Ͷ��', 2, NULL),
(409, 34, '������', 2, NULL),
(410, 34, '������', 2, NULL),
(411, 34, '̨����', 2, NULL),
(412, 34, '������', 2, NULL),
(413, 34, '������', 2, NULL),
(414, 34, '�����', 2, NULL),
(415, 34, '̨����', 2, NULL),
(416, 34, '������', 2, NULL),
(417, 35, '�������ڰ������˴�', 3, NULL),
(418, 35, '�������Ļ���', 3, NULL),
(427, 46, '���', 0, NULL);

-- 
-- �������е����� 'shopnc_config'
-- 

INSERT INTO @shopnc@config (config_id, config_valuename, config_value, config_other, config_type) VALUES 
(1, 'site_name', '����', NULL, 'base'),
(2, 'shop_user', '����', NULL, 'base'),
(3, 'admin_language', 'zh_cn', NULL, 'base'),
(4, 'user_sex', '1', NULL, 'base'),
(5, 'versionarea', 'zh_cn', NULL, 'base'),
(6, 'shop_email', 'admin@admin.com', NULL, 'base'),
(7, 'shop_currency', '1', NULL, 'base'),
(8, 'shop_call', '022-27260105', NULL, 'base'),
(9, 'shop_state', '1', NULL, 'base'),
(11, 'time_zone', '', NULL, 'base'),
(14, 'shop_address', '������Ͽ���������', NULL, 'base'),
(15, 'shop_copyright', 'ShopNC&reg;������ǿƼ����޹�˾<br>Copyright&copy; 2007-2009 ShopNC, Powered by <a href=http://www.shopnc.net>ShopNC</a> Team , All Rights Reserved', NULL, 'base'),
(16, 'shop_post', '300120', NULL, 'base'),
(17, 'shop_ipc', '��ICP��0******1��', NULL, 'base'),
(18, 'shop_keywords', '���꣬�̵꣬�̳ǣ������������Ϲ���', NULL, 'base'),
(19, 'shop_description', '���һ�������ͨ��������������ѡ����Ʒ�����㣬ʹ�������㲻�������������Ʒ����Ȥ������ǵ������������̵��������ĺô����������������̵�����������ɣ�         ', NULL, 'base'),
(20, 'index_hot', '1', '8', 'view'),
(21, 'index_commend', '1', '6', 'view'),
(22, 'index_new', '1', '4', 'view'),
(23, 'index_spe', '1', '3', 'view'),
(24, 'index_brand', '1', '4', 'view'),
(25, 'index_vote', '1', '4', 'view'),
(26, 'index_notice', '1', '6', 'view'),
(27, 'index_subject', '1', '6', 'view'),
(28, 'view_language', '1', '6', 'view'),
(29, 'view_state', '1', '6', 'view'),
(30, 'view_price', '1', '6', 'view'),
(31, 'view_than_price', '1', '6', 'view'),
(32, 'view_buy', '0', '6', 'view'),
(33, 'view_collection', '1', '6', 'view'),
(34, 'view_than_goods', '', '6', 'view'),
(35, 'view_remember', '', '6', 'view'),
(36, 'view_goods_num', '', '6', 'view'),
(37, 'other_goods_class', '1', '12', 'view'),
(38, 'other_brand_class', '1', '12', 'view'),
(39, 'other_subject_class', '1', '12', 'view'),
(40, 'site_url', 'http://127.0.0.1/shiyan_shopnc6', NULL, 'base'),
(41, 'templatesname', 'default', NULL, 'base'),
(42, 'currencies', '', NULL, 'base'),
(43, 'shop_fax', '022-27260105', NULL, 'base'),
(44, 'shop_logo_width', '280', NULL, 'base'),
(45, 'shop_logo_height', '100', NULL, 'base'),
(46, 'shop_logo_file', '', NULL, 'base'),
(47, 'nc_charset', 'gbk', NULL, 'base'),
(48, 'view_reg_validate', '1', '12', 'view'),
(49, 'view_login_validate', '1', '12', 'view'),
(50, 'view_provider_validate', '1', '12', 'view'),
(51, 'view_admin_login_validate', '1', '12', 'view'),
(52, 'view_comment_validate', '1', '12', 'view'),
(53, 'shop_qq', '', NULL, 'base'),
(54, 'shop_msn', '', NULL, 'base');
-- 
-- �������е����� 'shopnc_currencies'
-- 

INSERT INTO @shopnc@currencies (currencies_id, currencies_name, currencies_code, currencies_symbol, currencies_units, currencies_rate, currencies_long, currencies_state, language_id) VALUES 
(1, '�����', 'CNY', '��', 'Ԫ', '1.0000', 2, 1, 1);

-- 
-- �������е����� 'shopnc_info'
-- 

INSERT INTO @shopnc@info (info_id, info_title, info_url, info_text) VALUES 
(1, '��������', '', '<p><br />\r\n<table style="width: 500px; height: 92px" cellspacing="0" cellpadding="0" width="500" border="0">\r\n    <tbody>\r\n        <tr>\r\n            <td width="15">&nbsp;</td>\r\n            <td class="word1" width="490">\r\n            <p align="left"><span lang="EN-US" style="mso-fareast-font-family: Times New Roman"><span style="mso-list: Ignore"><font face=" Times New Roman"><font size="3">1.</font><span style="font: 7pt Times New Roman">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; </span></font></span></span><font size="3"><span style="font-family: ��ϸ����; mso-hansi-font-family: Times New Roman; mso-ascii-font: Times New Roman">����һ��Ҫ��Ա�ſ��Թ�����</span><span lang="EN-US"><font face="Times New Roman"> ?</font></span></font></p>\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td width="15">&nbsp;</td>\r\n            <td class="word1" width="490">&nbsp;</td>\r\n        </tr>\r\n        <tr>\r\n            <td>&nbsp;</td>\r\n            <td>\r\n            <p align="left">�����ṩ��Ա�Լ��ǻ�Ա���������Բ���Ҫ�����Ա����Թ��򡣵�Ȼ���ǻ��ڱ��������������������������������ϣ������Է��ļ����Ա�����ǻ���ʱ��������Ա��ֵ���Żݺ͸�����</p>\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td>&nbsp;</td>\r\n            <td><hr />\r\n            </td>\r\n        </tr>\r\n    </tbody>\r\n</table>\r\n<table style="width: 500px; height: 92px" cellspacing="0" cellpadding="0" width="500" border="0">\r\n    <tbody>\r\n        <tr>\r\n            <td width="15">&nbsp;</td>\r\n            <td class="word1" width="490">\r\n            <p align="left"><span lang="EN-US" style="mso-fareast-font-family: Times New Roman"><span style="mso-list: Ignore"><font face=" Times New Roman"><font size="3">2.</font><span style="font: 7pt Times New Roman">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; </span></font></span></span><font size="3"><span style="font-family: ��ϸ����; mso-hansi-font-family: Times New Roman; mso-ascii-font: Times New Roman">�뷢Ʊ̧ͷ������ô��</span><span lang="EN-US"><font face="Times New Roman">? </font></span></font></p>\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td width="15">&nbsp;</td>\r\n            <td class="word1" width="490">&nbsp;</td>\r\n        </tr>\r\n        <tr>\r\n            <td>&nbsp;</td>\r\n            <td>\r\n            <p align="left">������Ϊ������ҵ����ʧ�����������������б�Ǹ����������Ʊ�Ļأ����Ǿ���Ϊ�����������</p>\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td>&nbsp;</td>\r\n            <td><hr />\r\n            </td>\r\n        </tr>\r\n    </tbody>\r\n</table>\r\n<table style="width: 500px; height: 92px" cellspacing="0" cellpadding="0" width="500" border="0">\r\n    <tbody>\r\n        <tr>\r\n            <td width="15">&nbsp;</td>\r\n            <td class="word1" width="490">\r\n            <p align="left"><span lang="EN-US" style="mso-fareast-font-family: Times New Roman"><span style="mso-list: Ignore"><font face=" Times New Roman"><font size="3">3.</font><span style="font: 7pt Times New Roman">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; </span></font></span></span><font size="3"><span style="font-family: ��ϸ����; mso-hansi-font-family: Times New Roman; mso-ascii-font: Times New Roman">���ʹ�վ������Ʒ�۸���ô�����м���ô��</span><span lang="EN-US"><font face="Times New Roman">?�ǿ�Ҫ���ڵ���?</font></span></font></p>\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td width="15">&nbsp;</td>\r\n            <td class="word1" width="490">&nbsp;</td>\r\n        </tr>\r\n        <tr>\r\n            <td>&nbsp;</td>\r\n            <td>\r\n            <p align="left">���ǳ��˾�ʵ������Ⲣ�Լ�������ڸ�����Ʒ������վֱ�����۵�Ȼ���Ի����������������ļ۸񣬾��Բ��ǿ���ڵ���Ʒ���������Ĺ���</p>\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td>&nbsp;</td>\r\n            <td><hr />\r\n            </td>\r\n        </tr>\r\n    </tbody>\r\n</table>\r\n<table style="width: 500px; height: 92px" cellspacing="0" cellpadding="0" width="500" border="0">\r\n    <tbody>\r\n        <tr>\r\n            <td width="15">&nbsp;</td>\r\n            <td class="word1" width="490">\r\n            <p align="left"><span lang="EN-US" style="mso-fareast-font-family: Times New Roman"><span style="mso-list: Ignore"><font face=" Times New Roman"><font size="3">4.</font><span style="font: 7pt Times New Roman">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; </span></font></span></span><font size="3"><span style="font-family: ��ϸ����; mso-hansi-font-family: Times New Roman; mso-ascii-font: Times New Roman">���ʿ����˻�����</span><span lang="EN-US"><font face="Times New Roman">?</font></span></font></p>\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td width="15">&nbsp;</td>\r\n            <td class="word1" width="490">&nbsp;</td>\r\n        </tr>\r\n        <tr>\r\n            <td>&nbsp;</td>\r\n            <td>\r\n            <p align="left">�����������涨����7��֮�����ڣ������ڼ�����������Ʒ����������˻�������ά����Ʒ��װ֮�����ԣ����������޷�Ϊ�������˻���������������Ʒ覴�֮���أ���Ʒ֮�˷ѽ�����֧�������˿�ʱ���ǻ�۳��˷�֮��ʧ��</p>\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td>&nbsp;</td>\r\n            <td><hr />\r\n            </td>\r\n        </tr>\r\n    </tbody>\r\n</table>\r\n</p>\r\n<p>&nbsp;</p>'),
(2, '��ȫ����', '', '<p class="MsoNormal" style="margin: 0cm 0cm 0pt">ShopNC���ֱ������ĸ������ϣ������ϸ������ϱ���������涨��������й¶����ҵ����صĵ����ߡ�</p>\r\n<p class="MsoNormal" style="margin: 0cm 0cm 0pt">&nbsp;</p>\r\n<p class="MsoNormal" style="margin: 0cm 0cm 0pt">�������϶����ֽ׶����ǲ�������ת�ʷ�ʽ�����ڶ���ȷ�Ϻ����ֱ����ATMת�ʣ��������յ����������Ϊ���������������κ���Ҫ���Ƿ���ĵط�����ֱ�Ӻ�������ϵ��</p>'),
(3, '��������', '', '<p>\r\n<table cellspacing="0" cellpadding="0" width="90%" border="0">\r\n    <tbody>\r\n        <tr>\r\n            <td><strong><span style="font-weight: bold; font-size: 14px; color: rgb(255,84,0)"><font color="#ff6600">ѡ����Ʒ</font></span></strong></td>\r\n        </tr>\r\n        <tr>\r\n            <td height="5">&nbsp;</td>\r\n        </tr>\r\n        <tr>\r\n            <td height="5">&nbsp;�����ڱ���ѡ����Ʒʱ�������������Ʒ���Խ���Ʒ���빺�ﳵ���������ǻ�Ա��ֽ�������ȵ��룬�������ʹ���ղع��ܣ�������ʱ��û�о���Ҫ����ʱ�����Խ�������Ʒ�����ղأ����´����߿��Խ����Ա���Ŀ����ҵ����ղص���Ʒ��</td>\r\n        </tr>\r\n        <tr>\r\n            <td>&nbsp;</td>\r\n        </tr>\r\n        <tr>\r\n            <td height="10">&nbsp; <hr />\r\n            </td>\r\n        </tr>\r\n        <tr>\r\n            <td align="right">&nbsp;&nbsp;<a href="#aa1"><font color="#95601e">��TOP</font></a></td>\r\n        </tr>\r\n    </tbody>\r\n</table>\r\n<table cellspacing="0" cellpadding="0" width="90%" border="0">\r\n    <tbody>\r\n        <tr>\r\n            <td><span style="font-weight: bold; font-size: 14px; color: rgb(255,84,0)">���ʲ���</span></td>\r\n        </tr>\r\n        <tr>\r\n            <td height="5">&nbsp;</td>\r\n        </tr>\r\n        <tr>\r\n            <td height="5">1.������Ѷȷ�ϣ�����Ʒ���빺�ﳵʱ����ֹ�����Ʒ���嵥�Լ������˷ѣ���ʱ�������޸���Ʒ������</td>\r\n        </tr>\r\n        <tr>\r\n            <td height="5">&nbsp;</td>\r\n        </tr>\r\n        <tr>\r\n            <td height="5">2.ѡ�񸶿ʽ��Ŀǰ�ṩ���л�</td>\r\n        </tr>\r\n        <tr>\r\n            <td height="5">&nbsp;</td>\r\n        </tr>\r\n        <tr>\r\n            <td height="5">3.ѡ������֣������ѵ����Ա���ֱ�ӽ�����һ���裬������δ������ڴ˲�����룬���������ǻ�Ա��������ѡ��һ��ע���Ա��һ��ѡ��ֱ���Էǻ�Ա��ݹ���</td>\r\n        </tr>\r\n        <tr>\r\n            <td height="5">&nbsp;</td>\r\n        </tr>\r\n        <tr>\r\n            <td height="5">4.�ջ�����Ѷȷ�ϣ���ȷ�ϻ���д�����ջ���Ѷ��ȷ����Ʒ����׼ȷѸ���ʹ������ϡ�</td>\r\n        </tr>\r\n        <tr>\r\n            <td height="5">&nbsp;</td>\r\n        </tr>\r\n        <tr>\r\n            <td height="5">5.������Ѷȷ�ϣ����ٴ�ȷ�����Ķ������ݣ���ѡ��Ʊ��ʽ��</td>\r\n        </tr>\r\n        <tr>\r\n            <td height="5">&nbsp;</td>\r\n        </tr>\r\n        <tr>\r\n            <td height="5">6.������ɣ������ӡ�˶�������������ҳ<a href="../member/NoMember_View.php"><font color="#0000ff"><u>������ѯ</u></font></a>�м���׷�����Ķ��������κ���Ҫ��ֱ��<a href="mailto:service@shopnc.cn"><font color="#0000ff">service@shopnc.cn</font></a>��绰022-27260105��������ϵ!���ǻᾡ��Ϊ��������⡣</td>\r\n        </tr>\r\n        <tr>\r\n            <td height="5">&nbsp;</td>\r\n        </tr>\r\n        <tr>\r\n            <td height="10"><hr />\r\n            &nbsp;</td>\r\n        </tr>\r\n        <tr>\r\n            <td align="right">&nbsp;&nbsp;<a href="#aa1"><font color="#95601e">��TOP</font></a></td>\r\n        </tr>\r\n    </tbody>\r\n</table>\r\n</p>'),
(4, '��θ���', '', '<p>Ϊ�����Ա�Ľɿ�����ṩ���м��ָ��ʽ</p>'),
(5, '��ϵ����', '', '<p style="text-align: left"><br />\r\n<font size="3">������ǿƼ����޹�˾</font></p>\r\n<blockquote dir="ltr" style="margin-right: 0px">\r\n<p style="text-align: left"><br />\r\n�����κ����⻶ӭ����������</p>\r\n<p style="text-align: left">�����ϰ�ʱ�������email������</p>\r\n<p style="text-align: left"><font color="#339966">�绰��022-27260105</font></p>\r\n<p style="text-align: left"><font color="#339966">���䣺</font><a href="mailto:service@shopnc.cn"><font face="Verdana" color="#339966">service@ shopnc.cn</font></a></p>\r\n</blockquote>\r\n<p style="text-align: left">&nbsp;</p>'),
(6, '�����᰸', NULL, NULL),
(7, '��վ��ͼ', '@shopnc_url@/map.html', '');

-- 
-- �������е����� 'shopnc_language'
-- 

INSERT INTO @shopnc@language (language_id, language_name, language_directory, language_code, language_sort, language_image, language_state) VALUES 
(1, '���ģ����壩', 'zh_cn', 'zh', 0, '', 1);

-- 
-- �������е����� 'shopnc_mail_template'
-- 

INSERT INTO @shopnc@mail_template (mail_template_id, mail_template_name, mail_template_body) VALUES 
(1, 'new_user_mail', '<p>�װ���{user_name}���ã�</p>\r\n<p>��л��ע��{shop_name}��Ա</p>\r\n<p>�����ʺţ�{user_name}</p>\r\n<p>�������룺{passwd}</p>'),
(2, 'buy_goods_mail', '<p>�װ���{user_name}��Ա���ã�</p>\r\n<p>��л������{shop_name}����Ʒ</p>\r\n<p>���Ķ�����Ϊ{order_sn},Ŀǰ����������Ʒ������δȷ�ϡ�</p>'),
(3, 'del_goods_mail', '<p>�װ���{user_name}�����ã�</p>\r\n<p>���ı��Ϊ��{order_sn}�Ķ�����ȡ����</p>\r\n<p>{shop_name}</p>\r\n<p>{send_date}</p>'),
(4, 'pay_mail', '<p>�װ���{user_name}��Ա���ã�</p>\r\n<p>�����������ǣ�{order_sn}</p>\r\n<p>Ŀǰ����������Ʒ��������ɸ��</p>\r\n<p>�ͷ�ר�ߣ�04-2381-5417</p>\r\n<p>����绰��04-2381-5410</p>\r\n<p>�ٴθ�л���Ļݹˣ�<a target="_blank" href="{site_url}">{shop_name}</a>�ͷ����ľ���</p>'),
(5, 'send_goods_mail', '<p>�װ���{user_name}��ã�</p>\r\n<p>���Ķ���{order_sn}����{send_time}������Ԥ�������ͷ�ʽ���������ˡ� <br />\r\n<br />\r\n�������û���յ��������ֱ����ϵ���ǵ����߿ͷ���<br />\r\n�ٴθ�л�������ǵ�֧�֡���ӭ�����ٴι��١� <br />\r\n<br />\r\n{shop_name} <br />\r\n{send_date}</p>'),
(6, 'end_goods_mail', '<p>�װ���{user_name}��Ա���ã�</p>\r\n<p>�����������ǣ�{order_sn} ���Ѿ��ɹ���ɱ��ν��׻��<br />\r\nлл����֧�֣���ӭ�ٴι��ٱ��ꡣ<br />\r\n{shop_name} <br />\r\n{send_date}</p>');

INSERT INTO @shopnc@article_class (article_class_id, article_class_name, article_class_topid, article_class_state, article_class_keywords, article_class_description, article_class_sort, article_class_url, article_class_menu) VALUES 
(1, '�̵깫��', 0, 1, 'sdfsd', 'sdfsdf', 0, '', 1);

-- 
-- �������е����� 'shopnc_pay_area'
-- 

INSERT INTO @shopnc@pay_area (`pay_area_id`, `pay_area_name`, `pay_area_info`, `pay_area_directory`, `pay_area_state`, `pay_area_sort`) VALUES 
(1, '�й�', '�������й�������֧���ӿ�', 'zh_cn', 1, 3),
(2, '����֧��', '', 'usa', 1, 0);


-- 
-- �������е����� 'shopnc_send'
-- 

INSERT INTO @shopnc@send (send_id, send_name, send_path, send_file, send_pay_type) VALUES 
(8, 'ems����', 4, 'ems', 0),
(9, '��������', 4, 'hdfk', 0),
(10, '��ͨ����', 4, 'zhongtong', 0),
(11, 'Բͨ����', 4, 'yuantong', 0);

-- 
-- �������е����� 'shopnc_send_area'
-- 

INSERT INTO @shopnc@send_area (send_area_id, send_area_name, send_area_info, send_area_directory, send_area_state, send_area_sort) VALUES 
(4, '�й�', '�й����������ͷ�ʽ', 'zh_cn', 1, 0);
