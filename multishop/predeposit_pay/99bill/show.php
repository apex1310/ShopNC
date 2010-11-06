<?PHP
/*
 * @Description: ��Ǯ�����֧�����ؽӿڷ���
 * @Copyright (c) �Ϻ���Ǯ��Ϣ�������޹�˾
 * @version 2.0
 */

/*
�ڱ��ļ��У��̼�Ӧ�����ݿ��У���ѯ��������״̬��Ϣ�Լ������Ĵ�����������֧������Ӧ����ʾ��

������������򵥵�ģʽ��ֱ�Ӵ�receiveҳ���ȡ֧��״̬��ʾ���û���
*/

//$orderId=trim($_REQUEST['orderId']);
//$orderAmount=trim($_REQUEST['orderAmount']);
//$msg=trim($_REQUEST['msg']);

include("../../global.inc.php");
class kqPayEnd extends CommonFrameWork{
	/**
	 * Ԥ������
	 *
	 * @var obj
	 */
	var $obj_predeposit;
	/**
	 * ��Ա����
	 * 
	 * @var obj
	 */
	var $obj_member;

	function main(){
		/**
		 * ������Ա����
		 */
		if (!is_object($this->obj_member)){
			require_once ("member.class.php");
			$this->obj_member = new MemberClass();
		}
		/**
		 * ��ʼ��Ԥ�����
		 */
		if (!is_object($this->obj_predeposit)){
			require_once("predeposit.class.php");
			$this->obj_predeposit = new PredepositClass();
		}
		/**
		 * ȡ��ֵ��¼
		 */
		$predeposit_r_id = intval($this->_input['orderId']);
		$record_array = $this->obj_predeposit->getOnePredepositRecordById($predeposit_r_id);
		if (is_array($record_array)){
			//���³�ֵ��Ϣ
			$value_array = array();
			$value_array['predeposit_r_id'] = $predeposit_r_id;
			$value_array['payment_trade'] = $this->_input['dealId'];
			$value_array['record_state'] = '1';
			$this->obj_predeposit->updatePredepositRecord($value_array);
			unset($value_array);
			//����Ԥ������ϸ
			$value_array = array();
			$value_array['predeposit_type'] = '0';//��Ա��ֵ
			$value_array['predeposit_state'] = '1';
			$value_array['member_id'] = $record_array['member_id'];
			$value_array['available_amount'] = $record_array['online_amount'];
			$value_array['system_remark'] = $this->_lang['langKqpayOnlinePay'];
			$value_array['create_time'] = time();
			$value_array['update_time'] = time();
			$value_array['payment'] = $record_array['payment'];
			$value_array['predeposit_r_id'] = $predeposit_r_id;
			$this->obj_predeposit->addPredepositDetail($value_array);
			unset($value_array);
			//�Ի�Ա�ʻ������ʽ����
			$value_array = array();
			$value_array['available_predeposit'] = $record_array['online_amount'];
			$this->obj_member->modifyMember($value_array,$record_array['member_id'],'predeposit');
			unset($value_array);
			@header("Location: ../../member/own_predeposit.php?action=record_list");
		}else {
			echo "ID�Ƿ�";exit;
		}
	}
}
$obj_kqpay = new kqPayEnd();
$obj_kqpay->main();
unset($obj_kqpay);
?>