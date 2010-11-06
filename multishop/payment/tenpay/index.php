<?php
//---------------------------------------------------------
//�Ƹ�ͨ�н鵣��֧������ʾ�����̻����մ��ĵ����п�������
//---------------------------------------------------------
include("../../global.inc.php");
require_once ("classes/MediPayRequestHandler.class.php");
class tenpayIndex extends CommonFrameWork{
	/**
	 *��Ʒ��������
	 *
	 * @var obj
	 */
	var $obj_product_order;
	/**
	 * ��Ʒ����
	 *
	 * @var obj
	 */
	var $obj_product;
	/**
	 * ��Ա����
	 *
	 * @var obj
	 */
	var $obj_member;

	function main(){
		//�������԰�
		$this->getlang("product");
		
		//������������
		if (!is_object($this->obj_product_order)){
			require_once("order.class.php");
			$this->obj_product_order = new ProductOrderClass();
		}
		/**
		 * ������Ʒ����
		 */
		if (!is_object($this->obj_product)){
			require_once("product.class.php");
			$this->obj_product = new ProductClass();
		}
		/**
		 * ������Ա����
		 */
		if (!is_object($this->obj_member)){
			require_once("member.class.php");
			$this->obj_member = new MemberClass();
		}

		//ȡ������Ϣ
		$order_array = $this->obj_product_order->getOneOrderBySpcode($this->_input["sp_code"]);
		
		//ȡ��Ʒ��Ϣ
		$product_array = $this->obj_product->getProductRow($order_array['p_code']);
		
		//�жϸ��ʽ
		if ($product_array['p_transfee_charge'] == 1){//��ҳе�
			if($order_array['tf_type'] == '1'){//1ƽ��
				$transport_fee = $product_array['p_tf_py']?$product_array['p_tf_py']:'0';
			}else if($order_array['tf_type'] == '2'){//2���
				$transport_fee = $product_array['p_tf_kd']?$product_array['p_tf_kd']:'0';
			}else if($order_array['tf_type'] == '3'){//3EMS
				$transport_fee = $product_array['p_tf_kd']?$product_array['p_tf_kd']:'0';
			}
		}else {
			$transport_fee = 0;
		}
		//ȡ��Ա��Ϣ
		$member_array = $this->obj_member->getMemberInfo(array("id"=>$order_array['seller_id']),'*','more');
		
		//����
		$array = array();
		$order_array['p_name'] = Char_class::cut_str($order_array['p_name'],32,0,$this->_configinfo['websit']['ncharset'],'');
		//�ж�����Ƿ�����������ôֱ����ת���Ƹ�ͨ����վ����Ϊ�����ڱ�վ�㷢�ͷ������󵽲Ƹ�ͨվ��
		if($order_array['sp_state'] != '0'){
			@header('location: http://www.tenpay.com');exit;
		}
		$array['mch_name'] = $order_array['p_name'];//��Ʒ����
		$array['mch_price'] = $order_array['buy_num']*$order_array['unit_price']*100;//��Ʒ�۸�,��λΪ��
		$array['transport_desc'] = $order_array['p_name'];//����˵��
		$array['transport_fee'] = $transport_fee*100;//����Ҫ֧������������
		$array['mch_desc'] = $order_array['p_name'];//����˵��
		$array['mch_vno'] = $this->_input["sp_code"];//������
		$array['cft_tid'] = $order_array['alipay_id'];//�ⲿ������ˮ��
		$array['seller'] = $member_array['tenpay'];//����tenpay�ʺ�
		$array['site_url'] = $this->_configinfo['websit']['site_url'];
		
		//�Ƹ�ͨƽ̨ �˺� �ܳ�
		require_once(BasePath."/payment/tenpay/tenpay_config.php");
		$array['key'] = $key;
		$array['chnid'] = $chnid;
		$array['charset'] = $this->_configinfo['websit']['ncharset'];

		return $array;

	}
}
//���� �̳�֧����ʽ����
$obj_payment = new tenpayIndex();
$payment_array = $obj_payment->main();
//date_default_timezone_set(PRC);
$curDateTime = date("YmdHis");
$randNum = rand(1000, 9999);

/* ƽ̨����Կ */
$key = $payment_array['key'];

/* ƽ̨���ʺ� */
$chnid = $payment_array['chnid'];

/* ���� */
$seller = $payment_array['seller'];

/* ����˵�� */
$mch_desc = $payment_array['mch_name'];

/* ��Ʒ���� */
$mch_name = $payment_array['mch_name'];

/* ��Ʒ�ܼۣ���λΪ�� */
$mch_price = $payment_array['mch_price'];

/* �ص�֪ͨURL */
$mch_returl = $payment_array['site_url']."/payment/tenpay/mch_returl.php";

/* �̼ҵĶ����� */
$mch_vno = $payment_array['mch_vno'];//

/* ֧������̻�֧�����չʾҳ�� */
$show_url = $payment_array['site_url']."/payment/tenpay/mch_returl.php";//$payment_array['site_url']."/payment/tenpay/show_url.php";

/* ������˾��������ʽ˵�� */
$transport_desc = $payment_array['mch_name'];

/* ������֧������������,�Է�Ϊ��λ */
$transport_fee = $payment_array['transport_fee']==0?"":$payment_array['transport_fee'];

/* ����֧��������� */
$reqHandler = new MediPayRequestHandler();
$reqHandler->init();
$reqHandler->setKey($key);

//----------------------------------------
//����֧������
//----------------------------------------
$reqHandler->setParameter("chnid", $chnid);						//ƽ̨���ʺ�
$reqHandler->setParameter("encode_type", strtoupper($payment->charset)=='GBK'?"1":"2");					//�������� 1:gbk 2:utf-8
$reqHandler->setParameter("mch_desc", $mch_desc);				//����˵��
$reqHandler->setParameter("mch_name", $mch_name);				//��Ʒ����
$reqHandler->setParameter("mch_price", $mch_price);				//��Ʒ�ܼۣ���λΪ��
$reqHandler->setParameter("mch_returl", $mch_returl);			//�ص�֪ͨURL
$reqHandler->setParameter("mch_type", "1");						//�������ͣ�1��ʵ�ｻ�ף�2�����⽻��
$reqHandler->setParameter("mch_vno", $mch_vno);					//�̼ҵĶ�����
$reqHandler->setParameter("need_buyerinfo", "2");				//�Ƿ���Ҫ�ڲƸ�ͨ�������Ϣ��1����Ҫ��2������Ҫ��
$reqHandler->setParameter("seller", $seller);					//���ҲƸ�ͨ�ʺ�
$reqHandler->setParameter("show_url",	$show_url);				//֧������̻�֧�����չʾҳ��
$reqHandler->setParameter("transport_desc", $transport_desc);	//������˾��������ʽ˵��
$reqHandler->setParameter("transport_fee", $transport_fee);		//������֧������������

//�����URL
$reqUrl = $reqHandler->getRequestURL();

//debug��Ϣ
//$debugInfo = $reqHandler->getDebugInfo();

//echo "<br/>" . $reqUrl . "<br/>";
//echo "<br/>" . $debugInfo . "<br/>";

//�ض��򵽲Ƹ�֧ͨ��
//$reqHandler->doSend();

@header('Location: '.$reqUrl);exit;
?>
<!--<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=gbk">
	<title>�Ƹ�ͨ�н鵣��������ʾ</title>
</head>
<body>
<br/><a href="<?php echo $reqUrl ?>" target="_blank">�Ƹ�֧ͨ��</a>
</body>
</html>-->