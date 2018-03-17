package com.me.service.impl.system;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.me.dao.system.SystemMenuMapper;
import com.me.entity.system.SystemMenu;
import com.me.entity.system.SystemRoleMenu;
import com.me.service.system.ISystemMenuService;
import com.baomidou.framework.service.impl.SuperServiceImpl;

/**
 * 
* 项目名称：me Maven Webapp   
* 类名称：SystemMenuServiceImpl   
* 类描述：SystemMenu 表业务逻辑层接口实现类   
* 创建人：zlm   
* 创建时间：2016年11月13日 下午10:43:39   
* 修改人：zlm   
* 修改时间：2016年11月13日 下午10:43:39   
* @version
 */
@Service
public class SystemMenuServiceImpl extends SuperServiceImpl<SystemMenuMapper, SystemMenu> implements ISystemMenuService {
	
	@Autowired
	private SystemMenuMapper systemMenuMaper;
	
	@Override
	public List<SystemMenu> selectSystemMenu() {
		List<SystemMenu> systemMenus = new ArrayList<SystemMenu>();
		// 查询一级目录
		List<SystemMenu> parentMenuList = systemMenuMaper.selectSystemMenu(1, 1);
		// 查询二级目录
		List<SystemMenu> childMenuList = systemMenuMaper.selectSystemMenu(1, 2);
		
		// 获取根级权限的子级权限
		for (SystemMenu parentMenu : parentMenuList) {
			recursionMenu(systemMenus, childMenuList, parentMenu);
		}
		return systemMenus;
	}
	@Override
	public List<SystemMenu> selectSystemMenuByRole(List<Long> roleIdList){
		List<SystemMenu> systemMenus = new ArrayList<SystemMenu>();
		// 查询一级目录
		List<SystemMenu> parentMenuList = systemMenuMaper.selectSystemMenuByRole(1, 1,roleIdList);
		// 查询二级目录
		List<SystemMenu> childMenuList = systemMenuMaper.selectSystemMenuByRole(1, 2,roleIdList);
		
		// 获取根级权限的子级权限
		for (SystemMenu parentMenu : parentMenuList) {
			recursionMenu(systemMenus, childMenuList, parentMenu);
		}
		return systemMenus;
	}
	/**
	 * 递归得到每个权限的子级权限
	 * @param systemMenus 处理后的目录列表
	 * @param childMenuList  二级目录列表
	 * @param parentMenu 当前一级目录
	 */
	private void recursionMenu(List<SystemMenu> systemMenus, List<SystemMenu> childMenuList, SystemMenu parentMenu){
		List<SystemMenu> childMenus = new ArrayList<SystemMenu>();
		for(SystemMenu menu : childMenuList){
			if(parentMenu.getId() == menu.getParentId()){
				childMenus.add(menu);
			}
		}
		parentMenu.setChildMenuList(childMenus);
		systemMenus.add(parentMenu);
	}
}