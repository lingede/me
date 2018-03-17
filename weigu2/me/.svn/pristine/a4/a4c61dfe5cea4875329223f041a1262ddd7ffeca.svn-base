package com.me.dao.system;

import java.util.List;

import com.baomidou.mybatisplus.mapper.AutoMapper;
import com.me.entity.system.SystemRole;

/**
 * 
* 项目名称：me Maven Webapp   
* 类名称：SystemRoleMapper   
* 类描述：SystemRole 表数据访问层接口   
* 创建人：zlm   
* 创建时间：2016年11月13日 下午9:51:45   
* 修改人：zlm   
* 修改时间：2016年11月13日 下午9:51:45   
* @version
 */
public interface SystemRoleMapper extends AutoMapper<SystemRole> {
	
	/**
	 * 查找所有角色
	 * @return
	 */
	public List<SystemRole> selectAllRole();
	/**
	 * 通过角色ID删除角色权限关联
	 * @param roleId
	 */
	public void deleteRoleFunctionByRoleId(int roleId);

	/**
	 * 创建角色权限关联
	 * @param value
	 */
	public void createRoleFunction(String value);
	
	/**
	 * 获取角色对应的权限ID
	 * @param roleId
	 * @return
	 */
	public List<Long> queryRoleFunctionIdByRoleId(Long roleId);


}