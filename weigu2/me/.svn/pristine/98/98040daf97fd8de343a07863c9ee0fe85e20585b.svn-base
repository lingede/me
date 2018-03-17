package com.me.service.impl.system;

import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baomidou.framework.service.impl.SuperServiceImpl;
import com.me.dao.system.SystemRoleMapper;
import com.me.dao.system.SystemUserRoleMapper;
import com.me.entity.system.SystemRole;
import com.me.entity.system.SystemUserRole;
import com.me.service.system.ISystemRoleService;

/**
 * 
* 项目名称：me Maven Webapp   
* 类名称：SystemRoleServiceImpl   
* 类描述：SystemRole 表业务逻辑层接口实现类   
* 创建人：zlm   
* 创建时间：2016年11月13日 下午9:53:15   
* 修改人：zlm   
* 修改时间：2016年11月13日 下午9:53:15   
* @version
 */
@Service
public class SystemRoleServiceImpl extends SuperServiceImpl<SystemRoleMapper, SystemRole> implements ISystemRoleService {

	@Autowired
	private SystemRoleMapper systemRoleMapper;
	@Autowired
	private SystemUserRoleMapper systemUserRoleMapper;
	/**
	 * 查询角色列表
	 * @return List<SystemRole>
	 */
	@Override
	public List<SystemRole> selectRoleList() {
		return systemRoleMapper.selectAllRole();
	}
	/**
	 * 查询角色列表及数量
	 * @return List<SystemRole>
	 */
	@Override
	public List<SystemRole> selectRoleAndNumber() {
		List<SystemRole> systemRoles = systemRoleMapper.selectAllRole();
		SystemUserRole systemUserRole = new SystemUserRole();
		for(int i = 0;i<systemRoles.size();i++){
			systemUserRole.setRoleId(systemRoles.get(i).getId());
			int number = systemUserRoleMapper.selectCount(systemUserRole);
			systemRoles.get(i).setNumber(number);
		}
		return systemRoles;
	}
}