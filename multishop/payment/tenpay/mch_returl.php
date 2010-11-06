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

	//���Ķ���״̬,$status ����״̬,$cft_tid �Ƹ�ͨ������ˮ��
	function updateOrderState($mch_vno,$status,$cft_tid){
		if(!is_object($obj_product_order)){
			require_once("order.class.php");
			$obj_product_order = new ProductOrderClass();
		}
		
		if($status != ''){
			$order_array = $obj_product_order->getOneOrderBySpcode ( $mch_vno );
			switch ($order_array['sell_type']){
				case '0'://����
					require_once('order_process_auction.class.php');
					$obj_order_process = new OrderProcessAuction();
					break;
				case '1'://һ�ڼ�
					require_once('order_process_fixprice.class.php');
					$obj_order_process = new OrderProcessFixprice();
					break;
				case '2'://�Ź�
					require_once('order_process_group.class.php');
					$obj_order_process = new OrderProcessGroup();
					break;
				case '3'://����ʱ����
					require_once('order_process_countdown.class.php');
					$obj_order_process = new OrderProcessCountdown();
					break;
				default:
					exit;
			}
			$obj_order_process->alipay_id = $cft_tid;
			$result = $obj_order_process->changeOrderState($order_array['sp_code'],$status);
			return $result;
		}else{
			return false;
		}
	}
	//���¶������˿�״̬
	function updateOrderRefundState($mch_vno,$status,$cft_tid){
		if(!is_object($obj_product_order)){
			require_once("order.class.php");
			$obj_product_order = new ProductOrderClass();
		}
		
		if($status != ''){
			$order_array = $obj_product_order->getOneOrderBySpcode ( $mch_vno );
			switch ($order_array['sell_type']){
				case '0'://����
					require_once('order_process_auction.class.php');
					$obj_order_process = new OrderProcessAuction();
					break;
				case '1'://һ�ڼ�
					require_once('order_process_fixprice.class.php');
					$obj_order_process = new OrderProcessFixprice();
					break;
				case '2'://�Ź�
					require_once('order_process_group.class.php');
					$obj_order_process = new OrderProcessGroup();
					break;
				case '3'://����ʱ����
					require_once('order_process_countdown.class.php');
					$obj_order_process = new OrderProcessCountdown();
					break;
				default:
					exit;
			}
			$obj_order_process->alipay_id = $cft_tid;
			$obj_order_process->payment_mechod = 'tenpay';
			$result = $obj_order_process->changeOrderRefundState($order_array['sp_code'],$status);
			return $result;
		}else{
			return false;
		}
	}
	

	//�����ⲿ������ˮ�� ȡ��������  $cft_tid �Ƹ�ͨ������ˮ��
	function getOrderInfo($cft_tid){
		if($cft_tid != ''){
			$order_array = $obj_product_order->getOneOrderByAlipayId ( $cft_tid );
			return $order_array;
		}else{
			return false;
		}
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
	
	//�̳Ƕ�����
	$mch_vno = $resHandler->getParameter("mch_vno");	

	//------------------------------
	//����ҵ��ʼ
	//------------------------------
	
	//ע�⽻�׵���Ҫ�ظ�����
	//ע���жϷ��ؽ��
	
	//�������ж�
	if( "0" == $retcode ) {

		switch ($status) {
			case 1: 
				//log_result('���״���'.$cft_tid);
				//���״���
				$obj_payment->updateOrderState($mch_vno,'0',$cft_tid);
				$url =$obj_payment->site_url.'/member/own_main.php';
				@header("Location: $url");
				exit;
				break;
			case 2:
				//�ջ��ַ��д���
				break;
			case 3:
				//log_result('���֧���ɹ�'.$cft_tid);
				//��Ҹ���ɹ���ע���ж϶����Ƿ��ظ����߼�
				$obj_payment->updateOrderState($mch_vno,'1',$cft_tid);
				$url = $obj_payment->site_url.'/member/own_order.php?action=bought';
				@header("Location: $url");
				exit;
				break;
			case 4:
				//���ҷ����ɹ�
				//log_result('���ҷ����ɹ�'.$cft_tid);
				$obj_payment->updateOrderState($mch_vno,'2',$cft_tid);
				//$url = $obj_payment->site_url.'/member/own_main.php';
				//@header("Location: $url");
				exit;
				break;
			case 5:
				//����ջ�ȷ�ϣ����׳ɹ�
				//log_result('���ȷ���ջ�'.$cft_tid);
				$obj_payment->updateOrderState($mch_vno,'3',$cft_tid);
				//��ת���������ҳ��
				//�����״̬3�Ļ�������ת������ҳ��
				$order_array = $obj_payment->getOrderInfo($cft_tid);
				$url = $obj_payment->site_url.'/member/own_score.php?action=add&orderid='.$order_array['sp_id'].'&type=bought';
				@header("Location: $url");
				exit;
				break;
			case 6:
				//���׹رգ�δ��ɳ�ʱ�ر�
				//log_result('���׹ر�'.$cft_tid);
				$obj_payment->updateOrderState($mch_vno,'6',$cft_tid);
				break;
			case 7:
				//�޸Ľ��׼۸�ɹ�
				break;
			case 8:
				//��ҷ����˿�
				$obj_payment->updateOrderRefundState($mch_vno,'1',$cft_tid);
				break;
			case 9:
				//�˿�ɹ�
				$obj_payment->updateOrderRefundState($mch_vno,'2',$cft_tid);
				break;
			case 10:
				//�˿�ر�
				$obj_payment->updateOrderRefundState($mch_vno,'3',$cft_tid);
				break;
			default:
				//error
				break;
		}
		
	} else {
		echo "֧��ʧ��";
	}
	
	//------------------------------
	//����ҵ�����
	//------------------------------	
	
	//����doShow
	$resHandler->doShow();
	
	
} else {
	echo "<br/>" . "��֤ǩ��ʧ��" . "<br/>";
}

function log_result($log){
	$fp = @fopen('log.txt','wb+');
	@fwrite($fp,$log);
	@fclose($fp);
}
//echo $resHandler->getDebugInfo();

?>