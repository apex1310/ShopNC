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
 * ....���� ϵͳ�Ӽ�
 *
 * @copyright Copyright (c) 2007 - 2010 www.shopnc.net 
 * @author ShopNC Develop Team 
 * @package 
 * @subpackage 
 * @version Thu Dec 18 10:08:14 CST 2008
 */
require ("../global.inc.php");

class ShowUpPrice extends CommonFrameWork {
	/**
	 * ���̶���
	 *
	 * @var obj
	 */
	var $obj_shop;

	function main(){
		/**
		 * �����Ӽ۲�������
		 */
		if (!is_object($this->obj_up_price)){
			require_once("up_price.class.php");
			$this->obj_up_price = new UpPriceClass();
		}
		/**
		 * ����ģ��·��
		 */
		$this->setsubtemplates("home");
		/**
		 * ���԰�
		 */
		$this->getlang("upprice");

		/**
		 * ȡ�üӼ��б�
		 */
		$price_list = $this->obj_up_price->getUpPriceList($page);
		/**
		 * �����ҳ��ģ��
		 */
		$this->output('price_list',$price_list);
		$this->showpage('up_price');
	}
}
$up_price = new ShowUpPrice();
$up_price->main();
unset($up_price);
 ?>