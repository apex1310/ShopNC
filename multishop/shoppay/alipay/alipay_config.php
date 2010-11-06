<?php
/*
	*���ܣ������ʻ��й���Ϣ������·��
	*�汾��2.0
	*���ڣ�2008-08-01
	'˵����
	'���´���ֻ�Ƿ����̻����ԣ��ṩ���������룬�̻����Ը����Լ���վ����Ҫ�����ռ����ĵ���д,����һ��Ҫʹ�øô��롣
	'�ô������ѧϰ���о�֧�����ӿ�ʹ�ã�ֻ���ṩһ���ο���

*/
require ("../../global.inc.php");

class Alipay extends CommonFrameWork{
	/**
	 * ��Ա����
	 *
	 * @var obj
	 */
	var $obj_member;
	/**
	 * �ɷѶ���
	 *
	 * @var obj
	 */
	var $obj_shop_pay;
	
	function main(){
		//�������԰�
		$this->getlang("own_shop_pay");
		
		if($_SESSION['s_login']['id'] == ''){
			$this->redirectPath("error","",$this->_lang['errShopPayMemberIsEmpty']);
		}
		if ($this->_input['pay_detail_id'] == '' && $this->_input['out_trade_no'] == ''){
			$this->redirectPath("error","",$this->_lang['errShopPayDetailInfoIsEmpty']);
		}
		if ($this->_input['pay_detail_id'] != ''){
			$out_trade_no = $this->_input['pay_detail_id'];
		}elseif ($this->_input['out_trade_no'] != ''){
			$out_trade_no = $this->_input['out_trade_no'];
		}
		
		/**
		 * ������Ա����
		 */
		if (!is_object($this->obj_member)){
			require_once ("member.class.php");
			$this->obj_member = new MemberClass();
		}
		/**
		 * ��ʼ���ɷ���
		 */
		if (!is_object($this->obj_shop_pay)){
			require_once("shop_pay.class.php");
			$this->obj_shop_pay = new shopPayClass();
		}
		
		//ȡ�ʺ������ļ���Ϣ
		$account_array = $this->_getconfigini("payment.ini.php");
		
		//��֤��Ϣ�Ƿ����Ա���
		$detail_array = $this->obj_shop_pay->getShopPayDetail($out_trade_no);
		if ($detail_array['member_id'] != $_SESSION['s_login']['id']){
			$this->redirectPath("error","",$this->_lang['errShopPayDetailInfoIsEmpty']);
		}
		$array = array();
		$array['online_amount'] = $detail_array['pay_mode_money'];//���
		$array['pay_detail_id'] = $detail_array['pay_detail_id'];//��ϢID
		$array['url'] = $this->_configinfo['websit']['site_url'].'/member/own_shop_pay.php?action=detail_list';//�鿴����
		$array['email'] = $account_array['online']['alipay'];//ϵͳ����
		$array['payment_trade'] = $detail_array['payment_trade'];//������ˮ��
		$array['site_url'] = $this->_configinfo['websit']['site_url'];//��վ��ַ
		$array['alipay_partner'] = $account_array['online']['alipay_partner'];//�������ID
		$array['alipay_security_code'] = $account_array['online']['alipay_security_code'];//��ȫ������
		$array['_input_charset'] = $this->_configinfo['websit']['ncharset'];
		if (strtoupper($this->_configinfo['websit']['ncharset']) == 'UTF-8'){
			$this->_lang['langShopPayDetailManage'] = Common::nc_change_charset($this->_lang['langShopPayDetailManage'],'utf8_to_gbk');
		}
		$array['subject'] = $this->_lang['langShopPayDetailManage'];//��Ʒ����
		$array['body'] = $this->_lang['langShopPayDetailManage'];//��Ʒ����
		return $array;
	}

	/**
	 * ����֧������֪ͨ
	 */
	 function input_alipay(){
		return $this->_input;
	 }
	
	/**
	 * ���³�ֵ��¼����״̬
	 * $out_trade_no ���ױ��
	 * $trade_status ����״̬,$out_trade_no,$trade_status
	 */
	function update_record($input){
		/**
		 * ������Ա����
		 */
		if (!is_object($this->obj_member)){
			require_once ("member.class.php");
			$this->obj_member = new MemberClass();
		}
		/**
		 * ��ʼ���ɷ���
		 */
		if (!is_object($this->obj_shop_pay)){
			require_once("shop_pay.class.php");
			$this->obj_shop_pay = new shopPayClass();
		}
		
		//��ֵ��¼
		$detail_array = $this->obj_shop_pay->getShopPayDetail($input['out_trade_no']);
		if (is_array($detail_array)){
			//���³�ֵ��Ϣ
			$value_array = array();
			$value_array['pay_detail_id'] = $input['out_trade_no'];
			$value_array['payment_trade'] = $input['trade_no'];
			$value_array['pay_sign'] = '2';
			$this->obj_shop_pay->updateShopPayDetail($value_array);
			unset($value_array);
			//���»�Ա��Ϣ
			//ȡ��Ա��Ϣ
			$condition_member['id'] = $detail_array['member_id'];
			$member_array = $this->obj_member->getMemberInfo($condition_member,'*','more');
			$value_array = array();
			//�жϽɷ�����
			switch ($detail_array['pay_mode_type']){
				case '0'://���յ���ʹ��ʱ��ɷ�
					/**
					 * �����Ա�����еĵ��̵���ʱ��С�ڵ�ǰʱ�䣬���յ�ǰʱ�����
					 * ���ʱ����ڵ�ǰʱ�䣬���ۼӻ�Ա�����еĵ���ʱ��
					 */
					if (time() >= $member_array['shop_availability_time']){
						$value_array['shop_availability_time'] = mktime(23,59,59,date('m'),date('d'),date('Y'))+24*60*60*$detail_array['pay_mode_shop_show_time'];
					}else {
						$pay_time = mktime(23,59,59,date('m',$member_array['shop_availability_time']),date('d',$member_array['shop_availability_time']),date('Y',$member_array['shop_availability_time']));//ʱ��Ϊ�������������һ��
						$value_array['shop_availability_time'] = $pay_time+24*60*60*$detail_array['pay_mode_shop_show_time'];
					}
					break;
				case '1'://���շ�����Ʒ�����ɷ�
					$value_array['product_number'] = $member_array['product_number']+$detail_array['pay_mode_product_number'];
					break;
				case '2'://����ͬʱ�ɷ�
					/**
					 * �����Ա�����еĵ��̵���ʱ��С�ڵ�ǰʱ�䣬���յ�ǰʱ�����
					 * ���ʱ����ڵ�ǰʱ�䣬���ۼӻ�Ա�����еĵ���ʱ��
					 */
					if (time() >= $member_array['shop_availability_time']){
						$value_array['shop_availability_time'] = mktime(23,59,59,date('m'),date('d'),date('Y'))+24*60*60*$detail_array['pay_mode_shop_show_time'];
					}else {
						$pay_time = mktime(23,59,59,date('m',$member_array['shop_availability_time']),date('d',$member_array['shop_availability_time']),date('Y',$member_array['shop_availability_time']));//ʱ��Ϊ�������������һ��
						$value_array['shop_availability_time'] = $pay_time+24*60*60*$detail_array['pay_mode_shop_show_time'];
					}
					$value_array['product_number'] = $member_array['product_number']+$detail_array['pay_mode_product_number'];
					break;
			}
			$this->obj_member->modifyMember($value_array,$detail_array['member_id'],"shoppay");
			unset($value_array);
			return true;
		}else {
			echo "ID is void";exit;
		}
	}
}

$alipay_manage = new Alipay();
$array = $alipay_manage->main();

$partner         = $array["alipay_partner"];        //�������ID
$security_code   = $array["alipay_security_code"];        //��ȫ������
$seller_email    = $array['email'];        //����֧�����ʻ�
$_input_charset  = $array['_input_charset'];   //�ַ������ʽ Ŀǰ֧�� GBK �� utf-8
$sign_type       = "MD5";     //���ܷ�ʽ ϵͳĬ��(��Ҫ�޸�)
$transport       = "https";   //����ģʽ,����Ը����Լ��ķ������Ƿ�֧��ssl���ʶ�ѡ��http�Լ�https����ģʽ(ϵͳĬ��,��Ҫ�޸�)
$notify_url      = $array['site_url']."/predeposit_pay/alipay/notify_url.php"; //���׹����з�����֪ͨ��ҳ�� Ҫ�� http://��ʽ������·��
$return_url      = $array['site_url']."/predeposit_pay/alipay/return_url.php"; //��������ת��ҳ�� Ҫ�� http://��ʽ������·��
$show_url        = $array['site_url']; //����վ��Ʒ��չʾ��ַ

/** ��ʾ����λ�ȡ��ȫУ����ͺ���ID
1.���� www.alipay.com��Ȼ���½�����ʻ�($seller_email).
2.���̼ҷ���.��������������Կ���
*/
?>