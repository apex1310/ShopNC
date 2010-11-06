<?php
/////////////////////////////////////////////////////////////////////////////
// ���ļ��� ShopNC���û��̳� ��һ����
//
// Copyright (c) 2007 - 2010 www.shopnc.net
//
// Ҫ�鿴�����İ�Ȩ��Ϣ�������Ϣ����鿴Դ�����и����� COPYRIGHT �ļ���
// ���߷��� http://www.shopnc.net/ �����ϸ��Ϣ��
/////////////////////////////////////////////////////////////////////////////

/**
 * FILE_NAME : index.php   FILE_PATH : \multishop\store\index.php
 * ....������ҳ��
 *
 * @copyright Copyright (c) 2007 - 2010 www.shopnc.net 
 * @author ShopNC Develop Team 
 * @package 
 * @subpackage 
 * @version Fri Sep 14 15:21:19 CST 2007
 */

require_once("../global.inc.php");

class Ajaxshow extends StoreFrameWork{

	var $obj_shop_module;
	function main(){
		
		if (!is_object($this->obj_shop_module)){
			require_once("shop_module.class.php");
			$this->obj_shop_module = new ShopModule();
		}
		/**
		 * ���԰�
		 */
		 $this->setsubtemplates('store/store_drag');
		$this->getlang("store,store_control,shop");
		
	
		switch($this->_input['action']){			
			case "getQuickLinks":
				$this->_getQuickLinks();
				break;
			case 'showlistmod':
				$this->_show_list_mod();
				break;
			case "showproductmod":
				$this->_showproductmod();
				break;
			default:
		}


	}
	function _show_list_mod(){
		
		$array=$this->obj_shop_module->listShopModuleorder($this->_input['userid']);
		if($this->_configinfo['websit']['ncharset']=="GBK")
		{
			if(is_array($array))
			{
				for($i=0;$i<count($array);$i++)
				{
					$array[$i]['module_name']=Common::nc_change_charset($array[$i]['module_name'],'gbk_to_utf8');
					$array[$i]['module_body']=Common::nc_change_charset($array[$i]['module_body'],'gbk_to_utf8');
					
				}
			}
		}
		require_once('json.class.php');
		$obj_json = new Services_JSON();
		$return_value= $obj_json->encode($array);
		echo $return_value;
		
	}
	function _showproductmod(){
		$id=$this->_input["mudole_id"];
		$array=$this->obj_shop_module->showproductmod($id);
		
		$this->output('product_array',$array);
		$this->showpage("control_product_module");
		
	}


}
$store = new Ajaxshow();
$store->main();
unset($store);
?>