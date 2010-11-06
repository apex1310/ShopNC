<?php

//---------------------------------------------------------
//�Ƹ�ͨ��ʱ����֧��Ӧ�𣨴���ص���ʾ�����̻����մ��ĵ����п�������
//---------------------------------------------------------
include("../../global.inc.php");
require_once ("./classes/PayResponseHandler.class.php");

class tenpayIndex extends CommonFrameWork{
	function main(){
		//ȡ�ʺ������ļ���Ϣ
		$pay_array = $this->_getconfigini("payment.ini.php");
		//����
		$array = array();
		$array['key'] = $pay_array['online']['tenpay_key'];//��Կ
		return $array;
	}

	//����ɹ����֧����Ϣ
	// $transaction_id ���׵���ˮ��,$total_fee ���,�Է�Ϊ��λ
	function succPay($transaction_id,$total_fee){
		$this->getlang("own_predeposit");
		//ȡ��ֵ��¼
		require_once("predeposit.class.php");
		$obj_predeposit = new PredepositClass();
		require_once ("member.class.php");
		$obj_member = new MemberClass();
		//ȡ��¼����
		$record_array = $obj_predeposit->getOnePredepositRecordByTrade($transaction_id);
		if($record_array['record_state'] == '0'){//�ж��Ƿ��Ѿ������
			//���¼�¼״̬
			$value_array = array();
			$value_array['predeposit_r_id'] = $record_array['predeposit_r_id'];
			$value_array['record_state'] = '1';
			$value_array['system_remark'] = $this->_lang['langTenpayOnlinePay'];
			$value_array['online_amount'] = $total_fee/100;
			$obj_predeposit->updatePredepositRecord($value_array);
			unset($value_array);
			//����Ԥ������ϸ
			$value_array = array();
			$value_array['predeposit_type'] = '0';//��Ա��ֵ
			$value_array['predeposit_state'] = '1';
			$value_array['member_id'] = $record_array['member_id'];
			$value_array['available_amount'] = $total_fee/100;
			$value_array['system_remark'] = $this->_lang['langTenpayOnlinePay'];
			$value_array['create_time'] = time();
			$value_array['update_time'] = time();
			$value_array['payment'] = $record_array['payment'];
			$value_array['predeposit_r_id'] = $record_array['predeposit_r_id'];
			$obj_predeposit->addPredepositDetail($value_array);
			unset($value_array);
			//�Ի�Ա�ʻ������ʽ����
			$value_array = array();
			$value_array['available_predeposit'] = $total_fee/100;
			$obj_member->modifyMember($value_array,$record_array['member_id'],'predeposit');
			unset($value_array);
		}
		unset($obj_predeposit,$obj_member);

		//��ת
		$this->redirectPath("error","../member/own_predeposit.php?action=list",$this->_lang['langPreDetailStateOne']);
	}
}

//���� �̳�֧����ʽ����
$obj_payment = new tenpayIndex();
$payment_array = $obj_payment->main();

/* ��Կ */
$key = $payment_array['key'];

/* ����֧��Ӧ����� */
$resHandler = new PayResponseHandler();
$resHandler->setKey($key);

//�ж�ǩ��
if($resHandler->isTenpaySign()) {
	
	//���׵���
	$transaction_id = $resHandler->getParameter("transaction_id");
	
	//���,�Է�Ϊ��λ
	$total_fee = $resHandler->getParameter("total_fee");
	
	//֧�����
	$pay_result = $resHandler->getParameter("pay_result");
	
	if( "0" == $pay_result ) {
		//------------------------------
		//����ҵ��ʼ
		//------------------------------
		
		$obj_payment->succPay($transaction_id,$total_fee);

		//ע�⽻�׵���Ҫ�ظ�����
		//ע���жϷ��ؽ��
		
		//------------------------------
		//����ҵ�����
		//------------------------------	
		
		//����doShow, ��ӡmetaֵ��js����,���߲Ƹ�ͨ����ɹ�,�����û��������ʾ$showҳ��.
		//$show = "http://localhost/tenpay/show.php";
		//$resHandler->doShow($show);
	
	} else {
		//�������ɹ�����
		echo "<br/>" . "֧��ʧ��" . "<br/>";exit;
	}
	
} else {
	echo "<br/>" . "��֤ǩ��ʧ��" . "<br/>";exit;
}

//echo $resHandler->getDebugInfo();

?>