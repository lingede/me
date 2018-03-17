package com.me.controller.main;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.me.common.security.SystemAuthorizingUser;
import com.me.common.util.SingletonLoginUtils;
import com.me.controller.BaseController;
import com.me.entity.system.SystemMenu;
import com.me.entity.system.SystemUser;
import com.me.entity.system.SystemUserRole;
import com.me.service.system.ISystemMenuService;
import com.me.service.system.ISystemUserRoleService;
import com.me.service.system.ISystemUserService;

/**
 * 
* 项目名称：me Maven Webapp   
* 类名称：MainController   
* 类描述：后台主页面表示层   
* 创建人：zlm   
* 创建时间：2016年11月6日 下午10:26:58    
* @version    
*
 */
@Controller
@RequestMapping("/system")
public class MainController extends BaseController {

    /** 后台管理主界面 */
	private static final String MAIN = getViewPath("admin/main/main");
	/** 后台管理主界面初始化首页 */
	private static final String MAIN_INDEX = getViewPath("admin/main/index");
	
	@Autowired
	private ISystemMenuService systemMenuService;
	@Autowired
	private ISystemUserRoleService systemUserRoleService;
	@Autowired
	private ISystemUserService systemUserService;
	/**
	 * 进入操作中心
	 * @param request
	 * @return
	 */
	@RequiresPermissions("system:view")
	@RequestMapping(value = "/main",method = RequestMethod.GET)
	public String main(Model model) {
		List<SystemMenu> systemMenus = new ArrayList<SystemMenu>();
		SystemAuthorizingUser systemUser = SingletonLoginUtils.getSystemUser();
		//系统管理员具有所有菜单
		if(systemUser.getUserId() == 1){
			systemMenus = systemMenuService.selectSystemMenu();
		}else{
			List<SystemUserRole> userRoleList = systemUserRoleService.selectRoleListByAccountId(systemUser.getUserId());//获取用户角色列表
			if(userRoleList != null && userRoleList.size() > 0){
				List<Long> roleIdList = new ArrayList<Long>();
				for(SystemUserRole  systemUserRole:userRoleList){
					roleIdList.add(systemUserRole.getRoleId());
				}
				systemMenus = systemMenuService.selectSystemMenuByRole(roleIdList);//获取用户拥有的菜单
			}
		}
		
		SystemUser user = systemUserService.selectById(systemUser.getUserId());
    	
		model.addAttribute("systemMenus", systemMenus);
		model.addAttribute("systemUser", user);
		return MAIN;
	}
	
	/**
	 * 后台管理主界面初始化首页
	 * @param request
	 * @return
	 */
	@RequiresPermissions("system:view")
	@RequestMapping(value = "/main/index", method = RequestMethod.GET)
	public String mainIndex(HttpServletRequest request) {
		return MAIN_INDEX;
	}
	
}