package com.me.service.system;

import java.util.List;

import com.baomidou.framework.service.ISuperService;
import com.me.entity.system.SystemMenu;
import com.me.entity.system.SystemRoleMenu;

/**
 * 
* 项目名称：me Maven Webapp   
* 类名称：ISystemMenuService   
* 类描述：SystemMenu 表业务逻辑层接口   
* 创建人：zlm   
* 创建时间：2016年11月13日 下午10:42:22   
* 修改人：zlm   
* 修改时间：2016年11月13日 下午10:42:22   
* @version
 */
public interface ISystemMenuService extends ISuperService<SystemMenu> {

	/**
	 * 查询系统目录,网站目录列表
	 * @return List<SystemMenu>
	 */
	List<SystemMenu> selectSystemMenu();
	/**根据角色获取系统目录
	 * @return List<SystemMenu>
	 */
	List<SystemMenu> selectSystemMenuByRole(List<Long> roleIdList);

}