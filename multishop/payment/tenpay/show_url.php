<?php

//---------------------------------------------------------
//�Ƹ�ͨ�н鵣��֧��Ӧ�𣨴���ص���ʾ�����̻����մ��ĵ����п�������
//---------------------------------------------------------
include("../../global.inc.php");
require_once ("./classes/MediPayResponseHandler.class.php");

class tenpayIndex extends CommonFrameWork{
	
	var $site_url = '';

	function tenpayIndex(){
		parent::CommonFrameWork();
		$this->site_url = $this->_configinfo['websit']['site_url'];
	}

	function main(){
		//�Ƹ�ͨƽ̨ �˺� �ܳ�
		require_once(BasePath."/payment/tenpay/tenpay_config.php");
		$array['key'] = $key;
		$array['chnid'] = $chnid;
		return $array;
	}
}

//���� �̳�֧����ʽ����
$obj_payment = new tenpayIndex();
$payment_array = $obj_payment->main();

/* ƽ̨����Կ */
$key = $payment_array['key'];

/* ����֧��Ӧ����� */
$resHandler = new MediPayResponseHandler();
$resHandler->setKey($key);

//�ж�ǩ��
if($resHandler->isTenpaySign()) {
	
	//�Ƹ�ͨ���׵���
	$cft_tid = $resHandler->getParameter("cft_tid");
	
	//���,�Է�Ϊ��λ
	$total_fee = $resHandler->getParameter("total_fee");
	
	//������
	$retcode = $resHandler->getParameter("retcode");
	
	//״̬
	$status = $resHandler->getParameter("status");	
		
	//------------------------------
	//����ҵ��ʼ
	//------------------------------
	
	//ע�⽻�׵���Ҫ�ظ�����
	//ע���жϷ��ؽ��
	
	$url = $payment_array->site_url.'/member/own_main.php';
	@header("Location: $url");
	exit;

	//�������ж�
	if( "0" == $retcode ) {
		if( "3" == $status ) {
			
			echo "֧���ɹ�";
		}
	} else {
		echo "֧��ʧ��";
	}
	
	//------------------------------
	//����ҵ�����
	//------------------------------	
		
} else {
	echo "<br/>" . "��֤ǩ��ʧ��" . "<br/>";
}

//echo $resHandler->getDebugInfo();

?>