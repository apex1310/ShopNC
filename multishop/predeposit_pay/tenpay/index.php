<?php
//---------------------------------------------------------
//�Ƹ�ͨ��ʱ����֧������ʾ�����̻����մ��ĵ����п�������
//---------------------------------------------------------

include("../../global.inc.php");
require_once ("classes/PayRequestHandler.class.php");

class tenpayIndex extends CommonFrameWork{
	/**
	 * Ԥ������
	 *
	 */
	var $obj_predeposit;

	function main(){
		if($_SESSION['s_login']['id'] == ''){
			$this->redirectPath("error","",$this->_lang['langCMemberIsEmpty']);
		}
		if ($this->_input['predeposit_r_id'] == ''){
			$this->redirectPath("error","",$this->_lang['langCIdIsIllegal']);
		}
		/**
		 * �������԰�
		 */
		$this->getlang('own_predeposit');
		/**
		 * ��ʼ��Ԥ�����
		 */
		if (!is_object($this->obj_predeposit)){
			require_once("predeposit.class.php");
			$this->obj_predeposit = new PredepositClass();
		}
		//��֤��Ϣ�Ƿ����Ա���
		$record_array = $this->obj_predeposit->getOnePredepositRecordById($this->_input['predeposit_r_id']);
		if ($record_array['member_id'] != $_SESSION['s_login']['id']){
			$this->redirectPath("error","",$this->_lang['langCIdIsIllegal']);
		}
		if (strtoupper($this->_configinfo['websit']['ncharset']) == 'UTF-8'){
			$this->_lang['langPredepositPay'] = Common::nc_change_charset($this->_lang['langPredepositPay'],'utf8_to_gbk');
		}
		//ȡ�ʺ������ļ���Ϣ
		$pay_array = $this->_getconfigini("payment.ini.php");
		//����
		$array = array();
		$array['desc'] = $this->_lang['langPredepositPay'];//��Ʒ����
		$array['sp_billno'] = $record_array['predeposit_r_id'];//������
		$array['total_fee'] = $record_array['online_amount']*100;//��Ʒ�۸�,��λΪ��
		$array['transport_desc'] = $this->_lang['langPredepositPay'];//����˵��
		$array['bargainor_id'] = $pay_array['online']['tenpay'];//�����ʺ�
		$array['key'] = $pay_array['online']['tenpay_key'];//��Կ
		$array['return_url'] = $this->_configinfo['websit']['site_url'];
		return $array;
	}
	

	// ���� Ԥ��� ������ˮ�� $predeposit_r_id Ԥ���ID,$transaction_id ���ɵĽ�����ˮ��
	function updatePredepositTrade($predeposit_r_id,$transaction_id){
		$array = array();
		$array['predeposit_r_id'] = $predeposit_r_id;
		$array['payment_trade'] = $transaction_id;
		require_once("predeposit.class.php");
		$obj_predeposit = new PredepositClass();
		$obj_predeposit->updatePredepositRecord($array);
		unset($obj_predeposit);
	}


}
//���� �̳�֧����ʽ����
$obj_payment = new tenpayIndex();
$payment_array = $obj_payment->main();

/* �̻��� */
$bargainor_id = $payment_array['bargainor_id'];

/* ��Կ */
$key = $payment_array['key'];

/* ���ش����ַ */
$return_url = $payment_array['return_url']."/predeposit_pay/tenpay/return_url.php";

//date_default_timezone_set(PRC);
$strDate = date("Ymd");
$strTime = date("His");

//4λ�����
$randNum = rand(1000, 9999);

//10λ���к�,�������е�����
$strReq = $strTime . $randNum;

/* �̼Ҷ�����,����������32λ��ȡǰ32λ���Ƹ�ֻͨ��¼�̼Ҷ����ţ�����֤Ψһ�� */
$sp_billno = $payment_array['sp_billno'];//$strReq;

/* �Ƹ�ͨ���׵��ţ�����Ϊ��10λ�̻���+8λʱ�䣨YYYYmmdd)+10λ��ˮ�� */
$transaction_id = $bargainor_id . $strDate . $strReq;

// ����Ԥ����ֵ��Ϣ�����Ͻ�����ˮ��
$obj_payment->updatePredepositTrade($payment_array['sp_billno'],$transaction_id);


/* ��Ʒ�۸񣨰����˷ѣ����Է�Ϊ��λ */
$total_fee = $payment_array['total_fee'];//"1";

/* ��Ʒ���� */
$desc = $payment_array['desc'];//"�����ţ�" . $transaction_id;

/* ����֧��������� */
$reqHandler = new PayRequestHandler();
$reqHandler->init();
$reqHandler->setKey($key);

//----------------------------------------
//����֧������
//----------------------------------------
$reqHandler->setParameter("bargainor_id", $bargainor_id);			//�̻���
$reqHandler->setParameter("sp_billno", $sp_billno);					//�̻�������
$reqHandler->setParameter("transaction_id", $transaction_id);		//�Ƹ�ͨ���׵���
$reqHandler->setParameter("total_fee", $total_fee);					//��Ʒ�ܽ��,�Է�Ϊ��λ
$reqHandler->setParameter("return_url", $return_url);				//���ش����ַ
$reqHandler->setParameter("desc", $desc);	//��Ʒ���� "�����ţ�" . $transaction_id

//�û�ip,���Ի���ʱ��Ҫ�����ip��������ʽ�����ټӴ˲���
//$reqHandler->setParameter("spbill_create_ip", $_SERVER['REMOTE_ADDR']);

//�����URL
$reqUrl = $reqHandler->getRequestURL();

//debug��Ϣ
//$debugInfo = $reqHandler->getDebugInfo();

//echo "<br/>" . $reqUrl . "<br/>";
//echo "<br/>" . $debugInfo . "<br/>";

//�ض��򵽲Ƹ�֧ͨ��
//$reqHandler->doSend();

header("location: ".$reqUrl);
?>
<!--<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=gbk">
	<title>�Ƹ�ͨ��ʱ���ʳ�����ʾ</title>
</head>
<body>
<br/><a href="<?php echo $reqUrl ?>" target="_blank">�Ƹ�֧ͨ��</a>
</body>
</html>-->