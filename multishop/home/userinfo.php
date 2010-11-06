<?php
/////////////////////////////////////////////////////////////////////////////
// ����ļ��� ���Ǵ�����û��̳� ��Ŀ��һ����
//
// Copyright (c) 2007 - 2008 www.shopnc.net 
//
// Ҫ�鿴�����İ�Ȩ��Ϣ�������Ϣ����鿴Դ�����и����� COPYRIGHT �ļ���
// ���߷��� http://www.shopnc.net/ �����ϸ��Ϣ��
/////////////////////////////////////////////////////////////////////////////

/**
 * FILE_NAME : channel.php   FILE_PATH : E:\www\multishop\trunk\home\userinfo.php
 * ....�û���Ϣҳ��
 *
 * @copyright Copyright (c) 2007 - 2010 www.shopnc.net 
 * @author ShopNC Develop Team 
 * @package 
 * @subpackage 
 * @version Thu Dec 18 10:08:14 CST 2008
 */
require ("../global.inc.php");

class ShowUserInfo extends CommonFrameWork {
	/**
	 * ���̶���
	 *
	 * @var obj
	 */
	var $obj_shop;

	function main(){
		if(intval($this->_input['userid']) <= 0){
			@header('Location: '.$this->_configinfo['websit']['site_url']);
			exit;
		}

		/**
		 * ����ģ��·��
		 */
		$this->setsubtemplates("home");
		
		/**
		 * ���԰�
		 */
		$this->getlang("member");

		/**
		 * ����������
		 */
		if (!is_object($this->obj_shop)){
			require_once ("shop.class.php");
			$this->obj_shop = new ShopClass();
		}
		$shop_array = $this->obj_shop->getOneShopByMemeberId($this->_input['userid']);
		/**
		 * ������Ա��
		 */
		if (!is_object($this->obj_member)){
			require_once ("member.class.php");
			$this->obj_member = new MemberClass();
		}
		$member_array = $this->obj_member->getMemberInfo(array('id'=>$this->_input['userid']));
		$member_array['regist_time'] = date('Y-m-d H:i:s',$member_array['regist_time']);
		$member_array['last_login_time'] = date('Y-m-d H:i:s',$member_array['last_login_time']);
		/**
		 * ҳ�����
		 */
		$this->output('shop_array',$shop_array);
		$this->output('member_array',$member_array);
		$this->showpage('userinfo');
	}
}
$userinfo = new ShowUserInfo();
$userinfo->main();
unset($userinfo);
 ?>