package com.me.service.impl.system;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baomidou.framework.service.impl.SuperServiceImpl;
import com.me.dao.system.SystemUserLoginLogMapper;
import com.me.entity.system.SystemUserLoginLog;
import com.me.service.system.ISystemUserLoginLogService;

/**
 * 
* 项目名称：me Maven Webapp   
* 类名称：SystemUserLoginLogServiceImpl   
* 类描述：SystemUserLoginLog 表业务逻辑层接口实现类   
* 创建人：zlm   
* 创建时间：2016年11月12日 下午11:40:57   
* 修改人：zlm   
* 修改时间：2016年11月12日 下午11:40:57   
* @version
 */
@Service
public class SystemUserLoginLogServiceImpl extends SuperServiceImpl<SystemUserLoginLogMapper, SystemUserLoginLog> implements ISystemUserLoginLogService {
	
	@Autowired
	private SystemUserLoginLogMapper systemUserLoginLogMapper;
	
	@Override
	public List<SystemUserLoginLog> selectUserLoginLog(Long userId) {
		return systemUserLoginLogMapper.selectUserLoginLog(userId);
	}


}