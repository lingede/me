package com.me.service.system;

import java.util.List;

import com.baomidou.framework.service.ISuperService;
import com.me.entity.system.SystemUserLoginLog;

/**
 * 
* 项目名称：me Maven Webapp   
* 类名称：ISystemUserLoginLogService   
* 类描述：SystemUserLoginLog 表业务逻辑层接口   
* 创建人：zlm   
* 创建时间：2016年11月12日 下午11:40:30   
* 修改人：zlm   
* 修改时间：2016年11月12日 下午11:40:30   
* @version
 */
public interface ISystemUserLoginLogService extends ISuperService<SystemUserLoginLog> {
	
	/**
	 * 根据用户ID查询用户登录日志
	 * @param userId 用户ID
	 * @return List<SystemUserLoginLog>
	 */
	List<SystemUserLoginLog> selectUserLoginLog(Long userId);


}