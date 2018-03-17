package com.me.controller.system;

import java.util.ArrayList;
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

import com.alibaba.fastjson.JSON;
import com.me.common.dto.AjaxResult;
import com.me.common.security.SystemAuthorizingUser;
import com.me.common.util.ServletUtils;
import com.me.common.util.SingletonLoginUtils;
import com.me.controller.BaseController;
import com.me.entity.system.SystemMenu;
import com.me.entity.system.SystemRole;
import com.me.entity.system.SystemRoleMenu;
import com.me.service.system.ISystemMenuService;
import com.me.service.system.ISystemRoleMenuService;
import com.me.service.system.ISystemRoleService;
/**
* 项目名称：me Maven Webapp   
* 类名称：SystemRoleController   
* 类描述：角色控制器  
* 创建人：zlm   
* 创建时间：2016年11月18日 下午5:00:03      
* @version
 */
@Controller
@RequestMapping("/system/sysrole")
public class SystemRoleController extends BaseController {
	@Autowired
	private ISystemRoleService systemRoleService;
	@Autowired
	private ISystemRoleMenuService systemRoleMenuService;
	@Autowired
	private ISystemMenuService systemMenuService;
	/** 角色管理页面 */
	private static final String SYSTEM_ROLE_LIST = getViewPath("/admin/system/system_role_list");
	private static final String SYSTEM_ROLE_ADD = getViewPath("/admin/system/system_role_add");
	@InitBinder("systemRole")
	public void initBinderSysBole(WebDataBinder binder){
		binder.setFieldDefaultPrefix("systemRole.");
	}
	/**
	 * 进入角色管理页面
	 * @return ModelAndView
	 */
	@RequiresPermissions("sysuser:role:view")
	@RequestMapping("/list")
	public String showRoleList(Model model){
		try{
			//查询所有的角色
			List<SystemRole> roleList = systemRoleService.selectRoleList();
			model.addAttribute("roleList", roleList);
			List<SystemRole> systemRoles = systemRoleService.selectRoleAndNumber();
			model.addAttribute("systemRoles", systemRoles);
		}catch (Exception e) {
			logger.error("showRoleList()--error",e);
		}
		return SYSTEM_ROLE_LIST;
	}
	/**
	* @Description: 添加角色
	* @param model
	* @return
	* @throws 
	*/
	@RequiresPermissions("sysuser:role:add")
	@RequestMapping(value = "/list/add", method = RequestMethod.GET)
	public String add(Model model) {	
		List<SystemMenu> menuList = systemMenuService.selectList(null);//所有菜单
		if(menuList!=null){
			model.addAttribute("jsonMenu", JSON.toJSON(menuList));
			logger.info(JSON.toJSON(menuList).toString());
		}
		return SYSTEM_ROLE_ADD;
	}
	/**
	* @Description: 编辑角色
	* @param model
	* @param accountId
	* @return
	* @throws 
	*/
	@RequiresPermissions("sysuser:role:edit")
	@RequestMapping(value = "/list/{roleId}/edit", method = RequestMethod.GET)
	public String edit(Model model, @PathVariable Long roleId){
		SystemRole systemRole = systemRoleService.selectById(Long.valueOf(roleId));
		model.addAttribute("systemRole", systemRole);//角色信息
		List<SystemMenu> menuList = systemMenuService.selectList(null);//所有菜单
		if(menuList!=null){
			//根据角色，选出已经勾选的菜单
			Map<String,Object> columnMap = new HashMap<String,Object>();
			columnMap.put("ROLE_ID", roleId);
			List<SystemRoleMenu> roleMenuList = systemRoleMenuService.selectByMap(columnMap);//角色拥有的菜单
			for(SystemMenu systemMenu:menuList){
				for(SystemRoleMenu systemRoleMenu:roleMenuList){
					if(systemRoleMenu.getMenuId() == systemMenu.getId()){
						systemMenu.setChecked(true);
					}
				}
			}
			model.addAttribute("jsonMenu", JSON.toJSON(menuList));
			logger.info(JSON.toJSON(menuList).toString());
		}
		return SYSTEM_ROLE_ADD;
	}
	
	/**
	* @Description: 创建或修改角色 
	* @param systemRole
	* @return
	* @throws 
	*/
	@RequiresPermissions({"sysuser:role:add","sysuser:role:edit"})
	@RequestMapping(value = "/list/save", method = RequestMethod.POST)
	@ResponseBody
	public AjaxResult save(@ModelAttribute("systemRole") SystemRole systemRole){
		SystemAuthorizingUser sysUser = SingletonLoginUtils.getSystemUser();
		String result = "";
		try{
			if(systemRole.getId() == null){
				systemRole.setCreateTime(new Date());
				systemRole.setCreateBy(sysUser.getUserName());
				systemRoleService.insert(systemRole);//插入菜单
				//得到菜单ID串
				String menuIds = ServletUtils.getRequest().getParameter("menuIds");
				if(menuIds!=null && menuIds.trim().length()>0){
					List<SystemRoleMenu> systemRoleMenuList = new ArrayList<SystemRoleMenu>();
					String[] funArr = menuIds.split(",");
					if(funArr.length>0){
						for(String menuId : funArr){
							SystemRoleMenu roleMenu = new SystemRoleMenu();
							roleMenu.setMenuId(Long.valueOf(menuId));
							roleMenu.setRoleId(systemRole.getId());
							systemRoleMenuList.add(roleMenu);
						}
						systemRoleMenuService.insertBatch(systemRoleMenuList);
					}
				}
				result = "角色创建成功!";
			}else{
				systemRole.setUpdateTime(new Date());
				systemRole.setUpdateBy(sysUser.getUserName());
				systemRoleService.updateSelectiveById(systemRole);//更新角色
				//删除原有的角色菜单关联记录
				SystemRoleMenu systemRoleMenu = new SystemRoleMenu();
				systemRoleMenu.setRoleId(systemRole.getId());
				systemRoleMenuService.deleteSelective(systemRoleMenu);
				//得到菜单ID串
				String menuIds = ServletUtils.getRequest().getParameter("menuIds");
				if(menuIds!=null && menuIds.trim().length()>0){
					List<SystemRoleMenu> systemRoleMenuList = new ArrayList<SystemRoleMenu>();
					String[] funArr = menuIds.split(",");
					if(funArr.length>0){
						for(String menuId : funArr){
							SystemRoleMenu roleMenu = new SystemRoleMenu();
							roleMenu.setMenuId(Long.valueOf(menuId));
							roleMenu.setRoleId(systemRole.getId());
							systemRoleMenuList.add(roleMenu);
						}
						systemRoleMenuService.insertBatch(systemRoleMenuList);
					}
				}
				result = "角色修改成功!";
			}
		}catch (Exception e) {
			logger.error("save()--error",e);
		}
		return success(true, result);
	}

	/**
	 * 删除角色
	 * @param roleId 角色ID
	 * @return Map<String,Object>
	 */
	@RequiresPermissions("sysuser:role:delete")
	@RequestMapping("/list/{roleId}/delete")
	@ResponseBody
	public Map<String,Object> deleteRole(@PathVariable("roleId") Long roleId){
		Map<String,Object> json = new HashMap<String,Object>();
		try{
			if(roleId>0){
				systemRoleService.deleteById(roleId);
				SystemRoleMenu systemRoleMenu = new SystemRoleMenu();
				systemRoleMenu.setRoleId(roleId);
				systemRoleMenuService.deleteSelective(systemRoleMenu);
				json = this.setJson(true, "角色删除成功", null);
			}else{
				json = this.setJson(false, "请选择要删除的角色!", null);
			}
		}catch (Exception e) {
			logger.error("deleteRole()--error");
		}
		return json;
	}

	/**
	 * POST 启用/禁止
	 * @param request
	 * @return
	 */
	@RequiresPermissions("sysuser:role:edit")
	@RequestMapping(value = "/list/audit", method = RequestMethod.POST)
	@ResponseBody
	public AjaxResult audit() {
		Long roleId = Long.valueOf(getParameter("roleId"));
		Integer status = Integer.valueOf(getParameter("status"));
		SystemRole systemRole = new SystemRole();
		systemRole.setId(Long.valueOf(roleId));
		systemRole.setStatus(status);
		systemRoleService.updateSelectiveById(systemRole);
		return success(true);
	}
	
}
