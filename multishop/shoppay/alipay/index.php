<?php
/*
	*���ܣ�������Ʒ�й���Ϣ
	*�汾��2.0
	*���ڣ�2008-08-01
	'˵����
	'���´���ֻ�Ƿ����̻����ԣ��ṩ���������룬�̻����Ը����Լ���վ����Ҫ�����ռ����ĵ���д,����һ��Ҫʹ�øô��롣
	'�ô������ѧϰ���о�֧�����ӿ�ʹ�ã�ֻ���ṩһ���ο���

*/

require_once("alipay_service.php");
require_once("alipay_config.php");
$parameter = array(
	"service"         => "create_direct_pay_by_user",  //��������
	"partner"         => $partner,          //�����̻���
	"return_url"      => $return_url,       //ͬ������
	"notify_url"      => $notify_url,       //�첽����
	"_input_charset"  => $_input_charset,   //�ַ�����Ĭ��ΪGBK
	"subject"         => $array['subject'],        //��Ʒ���ƣ�����
	"body"            => $array['body'],        //��Ʒ����������
	"out_trade_no"    => $array['pay_detail_id'],      //��Ʒ�ⲿ���׺ţ������֤Ψһ�ԣ�
	"total_fee"       => $array['online_amount'],            //��Ʒ���ۣ�����۸���Ϊ0��
	"payment_type"    => "1",               //Ĭ��Ϊ1,����Ҫ�޸�

	"show_url"        => $show_url,         //��Ʒ�����վ
	"seller_email"    => $array['email']      //�������䣬����
);
$alipay = new alipay_service($parameter,$security_code,$sign_type);
$link=$alipay->create_url();
echo "<script>window.location =\"$link\";</script>"; 
?>

