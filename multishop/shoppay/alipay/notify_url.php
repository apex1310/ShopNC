<?php
/*
	*���ܣ���������з�����֪ͨҳ��
	*�汾��2.0
	*���ڣ�2008-08-01
	'˵����
	'���´���ֻ�Ƿ����̻����ԣ��ṩ���������룬�̻����Ը����Լ���վ����Ҫ�����ռ����ĵ���д,����һ��Ҫʹ�øô��롣
	'�ô������ѧϰ���о�֧�����ӿ�ʹ�ã�ֻ���ṩһ���ο���

*/

require_once("alipay_notify.php");
require_once("alipay_config.php");
$alipay = new alipay_notify($partner,$security_code,$sign_type,$_input_charset,$transport);
$verify_result = $alipay->notify_verify();
if($verify_result) {   //��֤�ϸ�
 //��ȡ֧�����ķ�������
    $dingdan  = $_POST['out_trade_no'];    //��ȡ֧�������ݹ����Ķ�����
    $total    = $_POST['total_fee'];       //��ȡ֧�������ݹ������ܼ۸�
	
	/*
		��ȡ֧��������������״̬,���ݲ�ͬ��״̬���������ݿ� 
		WAIT_BUYER_PAY(��ʾ�ȴ���Ҹ���);
		TRADE_FINISHED(��ʾ�����Ѿ��ɹ�����);
	*/

	$alipay_manage = new Alipay();
	$input = $_POST;
	if($_POST['trade_status'] == 'WAIT_BUYER_PAY') {         //�ȴ���Ҹ���
		//����������Զ������,������ݲ�ͬ��trade_status���в�ͬ����
		//echo "success";
		//log_result("verify_success");
	}
	else if($_POST['trade_status'] == 'TRADE_FINISHED' ||$_POST['trade_status'] == 'TRADE_SUCCESS') {    //���׳ɹ�����
        //����������Զ������,������ݲ�ͬ��trade_status���в�ͬ����
		//echo "success";
		$alipay_manage->update_record($input);
//�����������֧�����Ĺ�����ܣ����ڷ��ص���Ϣ���治Ҫ�������жϣ���������У��ͨ���������ֵ������������Ҫ��ȡ�����ʹ�ù����Ľ��,
//���ȡ������Ϣ������ֶ�discount��ֵ��ȡ����ֵ��������Ҹ����ŻݵĽ��� ԭ�������ܽ��=��Ҹ���صĽ��total_fee +|discount|.

		//log_result("verify_success");
	}	
	else {
		@header("Location: ../../member/own_main.php");exit;
		//log_result ("verify_failed");
	}
}
else {    //��֤���ϸ�
	@header("Location: ../../member/own_main.php");exit;
	//log_result ("verify_failed");
}
/*  ��־��Ϣ,��֧���������Ĳ�����¼����
function  log_result($word) {
	$fp = fopen("log.txt","a");	
	flock($fp, LOCK_EX) ;
	fwrite($fp,$word."��ִ�����ڣ�".strftime("%Y%m%d%H%I%S",time())."\t\n");
	flock($fp, LOCK_UN); 
	fclose($fp);
}
*/
?>