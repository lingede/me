package com.me.dao.system;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.baomidou.mybatisplus.mapper.AutoMapper;
import com.me.entity.system.SystemMenu;

/**
 * 
* 项目名称：me Maven Webapp   
* 类名称：SystemMenuMapper   
* 类描述：SystemMenu 表数据访问层接口  
* 创建人：zlm   
* 创建时间：2016年11月13日 下午10:39:53   
* 修改人：zlm   
* 修改时间：2016年11月13日 下午10:39:53   
* @version
 */
public interface SystemMenuMapper extends AutoMapper<SystemMenu> {
	
	/**
	 * 查询系统目录
	 * @param status 状态
	 * @param menuType 权限类型
	 * @return List<SystemMenu>
	 */
	List<SystemMenu> selectSystemMenu(@Param("status") Integer status, @Param("menuType") Integer menuType);
	
	/**
	 * 根据角色查询系统目录
	 * @param status 状态
	 * @param menuType 权限类型
	 * @return List<SystemMenu>
	 */
	List<SystemMenu> selectSystemMenuByRole(@Param("status") Integer status, @Param("menuType") Integer menuType,@Param("roleIdList") List<Long> roleIdList);

}