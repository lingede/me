package com.me.service.impl.system;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSON;
import com.baomidou.framework.service.impl.SuperServiceImpl;
import com.me.dao.system.SystemRoleMenuMapper;
import com.me.entity.system.SystemRoleMenu;
import com.me.service.system.ISystemRoleMenuService;

/**
 * 
* 项目名称：me Maven Webapp   
* 类名称：SystemRoleMenuServiceImpl   
* 类描述：SystemRoleMenu 表业务逻辑层接口实现类   
* 创建人：zlm   
* 创建时间：2016年11月13日 下午10:43:04   
* 修改人：zlm   
* 修改时间：2016年11月13日 下午10:43:04   
* @version
 */
@Service
public class SystemRoleMenuServiceImpl extends SuperServiceImpl<SystemRoleMenuMapper, SystemRoleMenu> implements ISystemRoleMenuService {
	
	@Autowired
	private SystemRoleMenuMapper systemRoleMenuMapper;
	
	@Override
	public List<SystemRoleMenu> selectMenuListByRoleId(List<Long> roleIdList) {
		return systemRoleMenuMapper.selectMenuListByRoleId(roleIdList);
	}


}