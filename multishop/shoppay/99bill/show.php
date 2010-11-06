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
	 * �ɷѶ���
	 *
	 * @var obj
	 */
	var $obj_shop_pay;
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
		 * ��ʼ���ɷ���
		 */
		if (!is_object($this->obj_shop_pay)){
			require_once("shop_pay.class.php");
			$this->obj_shop_pay = new shopPayClass();
		}
		/**
		 * ȡ��¼����
		 */
		$pay_detail_id = intval($this->_input['orderId']);
		$detail_array = $this->obj_shop_pay->getShopPayDetail($pay_detail_id);
		if($detail_array['pay_sign'] == '0'){//�ж��Ƿ��Ѿ������
			//���¼�¼״̬
			$value_array = array();
			$value_array['pay_detail_id'] = $detail_array['pay_detail_id'];
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
			@header("Location: ../../member/own_shop_pay.php?action=detail_list");
		}else {
			echo "֧��ʧ��,��¼��Ϊ��";
		}
	}
}
$obj_kqpay = new kqPayEnd();
$obj_kqpay->main();
unset($obj_kqpay);
?>