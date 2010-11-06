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
 * FILE_NAME : channel.php   FILE_PATH : E:\www\multishop\trunk\home\channel.php
 * ....Ƶ��չʾҳ��
 *
 * @copyright Copyright (c) 2007 - 2010 www.shopnc.net 
 * @author ShopNC Develop Team 
 * @package 
 * @subpackage 
 * @version Thu Dec 18 10:08:14 CST 2008
 */

require ("../global.inc.php");

class ModuleStyle extends ChannelFrameWork {
		/**
	 * ������ק����
	 *
	 * @var obj
	 */
	var $obj_shop_module_style;
	/**
	 * Ƶ����ק����
	 *
	 * @var obj
	 */
	var $obj_channel_drag;


	function main(){
		/**
		 * ʵ�������̷����
		 */
		if (!is_object($this->obj_shop_module_style)){
			require_once("shop_module_style.class.php");
			$this->obj_shop_module_style = new ShopModuleStyle();
		}
		/**
		 * ���԰�
		 */
		$this->getlang("channel");
		$this->getlang("store_style");
		$this->setsubtemplates('store/store_drag');
		
		
		switch ($this->_input['action']){
			case 'control':
				$this->_checkSysMember();
				$this->_control();
				break;
			
			case 'getSysPic':
				$this->_checkSysMember();
				$this->_get_sys_pic();
				break;
			case 'set_default':
				$this->_checkSysMember();
				$this->_set_default();
				break;
			case 'control_ajax':
				$this->_checkSysMember();
				$this->_control_ajax();
				break;
			default:
				$this->_show();
		}
	}
	
	/**
	 * Ƶ��ģ����ק
	 *
	 * @param int $id Ƶ��ID
	 * @return ģ�����
	 */
	function _control(){
		
		//ȡƵ������ģ������
		$this->_get_diy_style($this->_input['id']);
		/**
		 * ҳ�����
		 */
		$this->showpage('channel_control');
	}
	function _control_ajax(){
		
		//ȡƵ������ģ������
		$this->_get_diy_style($this->_input['id']);
		/**
		 * ҳ�����
		 */
		 
		$this->showpage('channel_control_ajax');
	}


	/**
	 * Ƶ��չʾ
	 */
	function _show(){
		if (intval($this->_input['id']) > 0){
			//ȡƵ������ģ������
			$this->_get_diy_style($this->_input['id']);
			//�ж��Ƿ��¼
			if ($_SESSION["s_login"]['login'] == 1){
				$this->output('login_sign',1);
				//�ж��Ƿ��е���
				if ($_SESSION["s_login"]['type'] == '1'){
					$this->output('shop_sign',1);
				}
				//�����Ա��Ϣ
				$this->output('login_name',$_SESSION['s_login']['name']);
				$this->output('login_id',$_SESSION['s_login']['id']);
			}
			//�����е���Ʒ���
			require(BasePath."/cache/ProductClass_show.php");
			if (is_array($node_cache)){
				foreach ($node_cache as $k => $v){
					if ($v[4] == '0') {
						$v['id'] = $v[0];
						$v['name'] = $v[2];
						$SearchProductCateArray[] = $v;
					}
				}
			}
			/**
			 * ҳ�����
			 */
			$this->output('app_list',$this->_menuAppList());
			$this->output('channel_id',$this->_input['id']);
			$this->output('search_cate',$SearchProductCateArray);
			$this->output('forward_url',urlencode($this->cur_url));
			$this->output('site_logo',$this->_configinfo['websit']['logo_url']);
			$this->showpage('channel_index');
		}else {
			$this->redirectPath("error",'../index.php',$this->_lang['langChannelIdNonlicet']);
		}
	}

	/**
	 * AJAXȡͼƬ����
	 *
	 * @param $this->_input ������
	 * @return string XML��ʽ����
	 */
	function _get_sys_pic(){
		/**
		 * ʵ����Ƶ����ק��
		 */
		if (!is_object($this->obj_channel_drag)){
			require_once("channel_drag.class.php");
			$this->obj_channel_drag = new ChannelDragClass();
		}
		/**
		 * ��ʼ����ҳ��
		 */
		require_once("ajaxcommonpage.class.php");
		$obj_page = new ajaxCommonPage();
		$obj_page->ajax_action_name = 'getpage';
		$obj_page->style = 'last';
		$obj_page->is_drag = true;
		
		//��������
		//��ʽ
		if($this->_input['category'] != ''){//style
			$obj_condition['cd_style'] = $this->_input['category'];
		}
		//��ɫ
		if($this->_input['color'] != ''){//color
			$obj_condition['cd_color'] = $this->_input['category'];
		}
		//��� //Ĭ��ͼ���һ�� (�󱳾������ⱳ����β�� 12��)��ͷ���� 6����
		$this->_input['type'] = $this->_input['type']?$this->_input['type']:'1';
		if($this->_input['type'] == 2){//ͷ��
			$obj_page->pagebarnum(5);
		}else{
			$obj_page->pagebarnum(11);
		}
		$obj_condition['cd_type'] = $this->_input['type'];
		$cd_array = $this->obj_channel_drag->listChannelDragPic($obj_condition,$obj_page);
		$page_list = $obj_page->show(6);
		@header('Content-type: text/xml');
		echo '<?xml version="1.0" encoding="'.$this->_configinfo['websit']['ncharset'].'"?><root><![CDATA[';
		if($this->_input['type'] == 2){
			echo '<ul class="imglist imgmax"><li><a href="javascript:void(0);" ><img src="'.$this->_configinfo['websit']['site_url'].'/templates/channel_drag/default/images/pic_nobgmax.gif" onclick="javascript:changeBackground(this, \'system\', 1);"/></a></li>';
		}else{
			echo '<ul class="imglist"><li><a href="javascript:void(0);" ><img src="'.$this->_configinfo['websit']['site_url'].'/templates/channel_drag/default/images/pic_nobg.gif" onclick="javascript:changeBackground(this, \'system\', 1);"/></a></li>';
		}
		if(is_array($cd_array)){
			foreach($cd_array as $k => $v){
				echo '<li><a href="javascript:void(0);" ><img src="'.$this->_configinfo['websit']['site_url'].'/'.$v['cd_pic'].'" onclick="javascript:changeBackground(this, \'system\');"/></a></li>';
			}
			if(!empty($cd_array)){
				echo '</ul><div class="floatpage"><div class="pages">'.$page_list.'</div></div>';
			}
		}
		echo "]]></root>";
		exit;
	}
	

	/**
	 * �ָ�Ĭ�Ϸ��
	 *
	 * @param $channel_id Ƶ��ID
	 * @return ����bool���͵���ʾ��Ϣ
	 */
	function _set_default(){
		$value_array = array();
		$value_array['channel_id'] = $this->_input['channel_id'];
		$value_array['channel_style'] = '';
		$this->obj_channel->updateChannel($value_array);
		@header('Location: channel.php?action=control&id='.$this->_input['channel_id']);
	}

	//===================================�Զ���ģ������=============================================




	

	/**
	 * ģ������
	 *
	 * @param $this->shop ��������
	 * @return ģ�����
	 */
	function _get_diy_style($style_id){
		
		//ģ������
		$block_list = array();
	$block_list['style_module'] = array('module_new_name'=>$this->_lang['langStoreStyleBlockShopInfo']);
			$block_list['notice'] = array('module_new_name'=>$this->_lang['langStoreStyleBlockNotice']);
/*		$block_list['link'] = array('module_new_name'=>$this->_lang['langStoreStyleBlockLink']);
		$block_list['category'] = array('module_new_name'=>$this->_lang['langStoreStyleBlockCategory']);
		$block_list['message'] =array('module_new_name'=> $this->_lang['langStoreStyleBlockMessage']);
		$block_list['product'] = array('module_new_name'=>$this->_lang['langStoreStyleBlockProduct']);
		$block_list['recommend_product'] = array('module_new_name'=>$this->_lang['langStoreStyleBlockRecommendProduct']);
		$block_list['product_search'] = array('module_new_name'=>$this->_lang['langStoreStyleBlockProductSearch']);*/
		$shop_array=$sd_array = $this->obj_shop_module_style->getOneStyle($style_id);
		//���̷��
		if($shop_array['style_body'] != ''){
			$style_list = unserialize($shop_array['style_body']);
		}
		//print_r($style_list);die();
		//�ж��Ƿ�������ʹ�õķ���ʽ��������ǣ�����Ĭ�ϵ���ʽ����
		if(empty($style_list) || $style_list['frame'] == ''){
			$default_all_frame = array();
			$i=0;
			foreach($block_list as $k => $v){
				if($i< count($block_list)/2){
					$default_all_frame['dleft'][] = $k;
				}else{
					$default_all_frame['dcontent'][] = $k;
				}
				$i++;
			}
			unset($i);
			$style_list = array(
				'frame' => 'LC', 	
				'allFrame' => $default_all_frame,
			);
		}
		//�ж�ģ������
		$control['wrap'] = strlen($style_list['frame']) === 3?'wrap':'wraptwo';
		//ÿ�е�����
		for ($i=0;$i<strlen($style_list['frame']);$i++){
			switch (strtoupper($style_list['frame'][$i])){
				case 'L'://���
					$control['allFrame']['dleft'] = $style_list['allFrame']['dleft'];
					break;
				case 'C'://�м�
					$control['allFrame']['dcontent'] = $style_list['allFrame']['dcontent'];
					break;
				case 'R'://�ұ�
					$control['allFrame']['dright'] = $style_list['allFrame']['dright'];
					break;
			}
		}
		//����ÿ�����ݺ���ʽ���д��ڵ����ݶԱȣ��ж���Щ������Ҫ��ʾ�ģ���Щ�����ص�
		if(!empty($block_list)){
			foreach($style_list['allFrame'] as $k2 =>$v2){
				if(is_array($v2)){
					foreach($v2 as $k3 => $v3){
						foreach($block_list as $k => $v){
							if($k == $v3){
								//��ʾ������
								$block_list[$k]['show'] = '1';
							}
						}
					}
				}
			}
		}
		
		//����Զ����css��ʽ������
		$block_css = '';
		if (is_array($style_list['block'])){
			//ģ���ڲ���ʽ
			$block_css = '';
			foreach ($style_list['block'] as $k => $v){
				foreach($v as $k2 => $v2){
					if($k == 'body'){
						$block_css .= $k.' '.$k2.'{';
					}else{
						$block_css .= '#'.$k.' '.$k2.'{';
					}
					foreach($v2 as $k3 => $v3){
						$block_css .= $v3.';';
					}
					$block_css .= '}'."\n";
				}
			}
		}
	//	print_r($block_css);die();
		//ģ�� ���� �ж� ���õ�Сҳ��
		if(is_array($block_list)){
			foreach($block_list as $k => $v){
				switch($k){
					case 'style_module':
						$block_list[$k]['html'] = 'style_module.html';
						break;
						case 'notice':
						$block_list[$k]['html'] = 'style_module.html';
						break;
				}
			}
		}
	
		//������
		$this->output('block_list',$block_list);
		$this->output('block_css',$block_css);
		$this->output('style_list',$style_list);
		$this->output('frame_length',strlen($style_list['frame']));
		$this->output('control',$control);
		$this->output('shop_style',strlen($shop_array['style_body'])<=2?serialize($style_list):$shop_array['style_body']);
		$this->showpage('style_control');
		//ҳ������ �����ģ��
		/*$this->output('shop_info',$this->_get_shop_info());
		$this->output('shop_category',$this->_get_shop_category());
		$this->output('proclamation',$this->_get_shop_proclamation());
		$this->output('shop_link',$this->_get_shop_link());
		$this->output('shop_product',$this->_get_shop_product());
		$this->output('shop_message',$this->_get_shop_message());
		$this->output('recommended_product',$this->_get_shop_recommended_product());
		$this->output('shop_tag',$this->_get_shop_tag());*/
	}

}
$showchannel = new ModuleStyle();
$showchannel->main();
unset($showchannel);
?>