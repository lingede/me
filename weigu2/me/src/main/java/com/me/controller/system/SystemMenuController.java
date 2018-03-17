package com.me.controller.system;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.me.common.dto.AjaxResult;
import com.me.common.security.SystemAuthorizingUser;
import com.me.common.util.SingletonLoginUtils;
import com.me.controller.BaseController;
import com.me.entity.system.SystemMenu;
import com.me.service.system.ISystemMenuService;


/**
* 项目名称：me Maven Webapp   
* 类名称：SystemRoleController   
* 类描述：菜单控制器  
* 创建人：zlm   
* 创建时间：2016年11月18日 下午5:00:03      
* @version
 */
@Controller
@RequestMapping("/system/sysmenu")
public class SystemMenuController extends BaseController{

	/** 系统菜单列表 */
	private static final String SYSTEM_MENU_LIST = getViewPath("/admin/system/system_menu_list");
	private static final String SYSTEM_MENU_ADD = getViewPath("/admin/system/system_menu_add");
	@InitBinder({"systemMenu"})
	public void initBinderSystemMenu(WebDataBinder binder) {
		binder.setFieldDefaultPrefix("systemMenu.");
	}
	
	@Autowired
	private ISystemMenuService systemMenuService;
	
	/**
	 * 进入菜单管理页面
	 */
	@RequiresPermissions("sysuser:menu:view")
	@RequestMapping("/list")
	public String showMenuList(Model model){
		try{
			//查询所有的菜单
			List<SystemMenu> menuList = systemMenuService.selectList(null);
			model.addAttribute("menuList", menuList);
		}catch (Exception e) {
			logger.error("showMenuList()--error",e);
		}
		return SYSTEM_MENU_LIST;
	}
	
	/**
	* @Description: 添加菜单 
	* @param model
	* @return
	* @throws 
	*/
	@RequiresPermissions("sysuser:menu:add")
	@RequestMapping(value = "/list/add", method = RequestMethod.GET)
	public String add(Model model) {
		List<SystemMenu> menuList = systemMenuService.selectSystemMenu();//查询所有的菜单
		model.addAttribute("menuList", menuList);//所有菜单
		return SYSTEM_MENU_ADD;
	}
	
	/**
	* @Description: 编辑菜单 
	* @param model
	* @param accountId
	* @return
	* @throws 
	*/
	@RequiresPermissions("sysuser:menu:edit")
	@RequestMapping(value = "/list/{menuId}/edit", method = RequestMethod.GET)
	public String edit(Model model, @PathVariable Long menuId){
		SystemMenu systemMenu = systemMenuService.selectById(Long.valueOf(menuId));
		model.addAttribute("systemMenu", systemMenu);//菜单信息
		List<SystemMenu> menuList = systemMenuService.selectSystemMenu();//查询所有的菜单
		model.addAttribute("menuList", menuList);//所有菜单
		return SYSTEM_MENU_ADD;
	}
	
	/**
	 * 创建或修改菜单
	 * @param systemMenu
	 * @return
	 */
	@RequiresPermissions({"sysuser:menu:add","sysuser:menu:edit"})
	@RequestMapping(value = "/list/save", method = RequestMethod.POST)
	@ResponseBody
	public AjaxResult update(@ModelAttribute("systemMenu") SystemMenu systemMenu){
		SystemAuthorizingUser sysUser = SingletonLoginUtils.getSystemUser();
		if(systemMenu.getId() == null){
			Map<String,Object> columnMap = new HashMap<String,Object>();
			columnMap.put("MENU_NAME", systemMenu.getMenuName());
			List<SystemMenu> list =systemMenuService.selectByMap(columnMap);
			if(list.size()>0){
				return fail(false, "该菜单名已被使用");
			}
			systemMenu.setCreateTime(new Date());
			systemMenu.setCreateBy(sysUser.getUserName());
			systemMenuService.insert(systemMenu);//插入菜单
			return success(true, "菜单创建成功!");
		}else{
			systemMenu.setUpdateTime(new Date());
			systemMenu.setUpdateBy(sysUser.getUserName());
			systemMenuService.updateSelectiveById(systemMenu);//更新菜单
			return success(true, "菜单修改成功!");
		}
	}
	
	/**
	 * 删除菜单功能
	 */
	@RequiresPermissions("sysuser:menu:delete")
	@RequestMapping("/list/{id}/delete")
	@ResponseBody
	public Map<String,Object> deleteFunction(@PathVariable("id") Long id){
		Map<String,Object> json = new HashMap<String,Object>();
		try{
			systemMenuService.deleteById(id);
			json = this.setJson(true, null, null);
		}catch (Exception e) {
			logger.error("deleteFunction()--error",e);
		}
		return json;
	}
	/**
	 * POST 启用/禁止
	 * @param request
	 * @return
	 */
	@RequiresPermissions("sysuser:menu:edit")
	@RequestMapping(value = "/list/audit", method = RequestMethod.POST)
	@ResponseBody
	public AjaxResult audit() {
		Long menuId = Long.valueOf(getParameter("menuId"));
		Integer status = Integer.valueOf(getParameter("status"));
		SystemMenu systemMenu = new SystemMenu();
		systemMenu.setId(Long.valueOf(menuId));
		systemMenu.setStatus(status);
		systemMenuService.updateSelectiveById(systemMenu);
		return success(true);
	}
}
