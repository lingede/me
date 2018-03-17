package com.me.service.system;

import java.util.List;

import com.baomidou.framework.service.ISuperService;
import com.me.entity.system.SystemRole;

/**
 * 
* 项目名称：me Maven Webapp   
* 类名称：ISystemRoleService   
* 类描述：SystemRole 表业务逻辑层接口   
* 创建人：zlm   
* 创建时间：2016年11月13日 下午9:52:50   
* 修改人：zlm   
* 修改时间：2016年11月13日 下午9:52:50   
* @version
 */
public interface ISystemRoleService extends ISuperService<SystemRole> {
	
	/**
	 * 查询角色列表
	 * @return List<SystemRole>
	 */
	List<SystemRole> selectRoleList();
	
	/**
	 * 查询角色列表及数量
	 * @return List<SystemRole>
	 */
	List<SystemRole> selectRoleAndNumber();

}