package com.me.service.email;

import java.util.Map;

import com.me.entity.email.UserEmailMsg;

/**
 * 
* 项目名称：me Maven Webapp   
* 类名称：UserEmailMsgService   
* 类描述：用户邮箱业务逻辑层接口   
* 创建人：zlm   
* 创建时间：2016年11月6日 下午10:54:27   
* 修改人：zlm   
* 修改时间：2016年11月6日 下午10:54:27   
* @version
 */
public interface UserEmailMsgService {
	
	/**
	 * 验证邮箱格式 去重
	 * @param emailStr 待验证邮箱
	 * @return Map<String, Object>
	 */
	public Map<String, Object> checkEmail(String emailStr);
	
	/**
	 * 启动线程，发送邮箱
	 * @param userEmailMsg 邮件信息
	 * @param num 线程个数
	 */
    public void batchSendEmail(UserEmailMsg userEmailMsg , int num);

}
