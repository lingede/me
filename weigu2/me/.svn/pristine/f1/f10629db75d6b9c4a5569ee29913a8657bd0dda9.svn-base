package com.me.dao.system;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.baomidou.mybatisplus.mapper.AutoMapper;
import com.me.entity.system.SystemRoleMenu;

/**
 * 
* 项目名称：me Maven Webapp   
* 类名称：SystemRoleMenuMapper   
* 类描述：SystemRoleMenu 表数据访问层接口   
* 创建人：zlm   
* 创建时间：2016年11月13日 下午10:40:25   
* 修改人：zlm   
* 修改时间：2016年11月13日 下午10:40:25   
* @version
 */
public interface SystemRoleMenuMapper extends AutoMapper<SystemRoleMenu> {
	

	/**
	 * 通过角色ID查找权限列表
	 * @param roleIdList 角色ID列表
	 * @return List<SystemRoleMenu> 
	 */
	List<SystemRoleMenu> selectMenuListByRoleId(@Param("roleIdList") List<Long> roleIdList);

}