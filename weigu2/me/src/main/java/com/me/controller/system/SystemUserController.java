package com.me.controller.system;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

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
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSON;
import com.me.common.dto.AjaxResult;
import com.me.common.security.SystemAuthorizingUser;
import com.me.common.util.MD5Utils;
import com.me.common.util.ServletUtils;
import com.me.common.util.SingletonLoginUtils;
import com.me.common.util.UploadFileUtils;
import com.me.common.util.toolbox.WebUtil;
import com.me.controller.BaseController;
import com.me.entity.platform.Category;
import com.me.entity.system.QueryUser;
import com.me.entity.system.SystemMenu;
import com.me.entity.system.SystemRole;
import com.me.entity.system.SystemRoleMenu;
import com.me.entity.system.SystemUser;
import com.me.entity.system.SystemUserLoginLog;
import com.me.entity.system.SystemUserRole;
import com.me.entity.system.UserHasCategory;
import com.me.service.platform.IArticleService;
import com.me.service.platform.ICategoryService;
import com.me.service.system.ISystemRoleService;
import com.me.service.system.ISystemUserLoginLogService;
import com.me.service.system.ISystemUserRoleService;
import com.me.service.system.ISystemUserService;
import com.me.service.system.IUserHasCategoryService;

/**
* 项目名称：me Maven Webapp   
* 类名称：SystemUserController   
* 类描述：系统管理员控制器   
* 创建人：zlm   
* 创建时间：2016年11月18日 下午5:00:03      
* @version
 */
@Controller
@RequestMapping("/system/sysuser")
public class SystemUserController extends BaseController {

	/** 系统管理员列表 */
	private static final String SYSTEM_USER_LIST = getViewPath("admin/system/system_user_list");
	/** 用户个人资料 */
	private static final String SYSTEM_USER_MESSAGE = getViewPath("admin/system/system_user_message");
	/** 用户登录日志 */
	private static final String USER_LOGIN_LOG = getViewPath("admin/user/user_login_log");
	/** 管理员分类查看 */
	private static final String SYSTEM_USER_ROLE = getViewPath("admin/system/system_user_role");
	/** 创建或者修改用户界面 */
	private static final String SYSTEM_USER_ADDUSER = getViewPath("admin/system/system_user_add");
	/** 系统管理员信息界面 */
	private static final String SYSTEM_USER_INFO = getViewPath("admin/system/system_user_info");
	/** 系统管理员头像界面 */
	private static final String SYSTEM_USER_AVATAR = getViewPath("admin/system/system_user_avatar");
	
	/** 系统管理员头像界面 */
	private static final String USER_CATEGORY = getViewPath("admin/system/user_category_add");
	

	@Autowired
	private ISystemUserService systemUserService;
	@Autowired
	private ISystemUserLoginLogService systemUserLoginLogService;
	@Autowired
	private ISystemRoleService systemRoleService;
	@Autowired
	private ISystemUserRoleService systemUserRoleService;
	@Autowired
	private IUserHasCategoryService userHasCategoryService;
	@Autowired
	private ICategoryService categoryService ;
	
	@Autowired
	private IArticleService articleService;

	@InitBinder("systemUser")
	public void initBinderSystemUser(WebDataBinder binder) {
		binder.setFieldDefaultPrefix("systemUser.");
	}

	@InitBinder("queryUser")
	public void initQueryUser(WebDataBinder dinder) {
		dinder.setFieldDefaultPrefix("queryUser.");
	}
	
	/**
	 * GET 管理员列表
	 * @param request
	 * @return
	 */
	@RequiresPermissions("sysuser:list:view")
	@RequestMapping(value = "/list")
	public String list(Model model, @ModelAttribute("queryUser") QueryUser queryUser) {
		int sysUserNumber = systemUserService.selectAllSystemUserNumber();
		model.addAttribute("sysUserNumber", sysUserNumber);// 用户总数量
		List<SystemUser> systemUsers = systemUserService.selectAllSystemUser(queryUser);
		model.addAttribute("systemUsers", systemUsers);// 用户列表
		List<SystemRole> systemRoles = systemRoleService.selectRoleAndNumber();
		model.addAttribute("systemRoles", systemRoles);// 权限列表
		return SYSTEM_USER_LIST;
	}
	
	/**
	 * GET 个人资料
	 * @param accountId 用户编号
	 * @return
	 */
	@RequiresPermissions("sysuser:list:view")
	@RequestMapping(value = "/list/{userId}/detail", method = RequestMethod.GET)
	public String detail(Model model, @PathVariable Long userId){
		SystemUser user = systemUserService.selectById(userId);
		model.addAttribute("user", user);//用户信息
		List<SystemUserRole> systemUserRoles = systemUserRoleService.selectRoleListByAccountId(userId);
		StringBuffer userRole = new StringBuffer();
		for(SystemUserRole systemUserRole : systemUserRoles){
			userRole.append(systemUserRole.getRoleName());
			userRole.append("&nbsp");
		}
		model.addAttribute("userRole",userRole);//用户权限
		return SYSTEM_USER_MESSAGE;
	}
	
	/**
	 * Get 用户登录日志
	 * @param accountId
	 * @return
	 */
	@RequiresPermissions("sysuser:list:view")
	@RequestMapping(value = "/list/{accountId}/log", method = RequestMethod.GET)
	public String userLog(Model model, @PathVariable Long accountId){
		List<SystemUserLoginLog> systemUserLoginLogList = systemUserLoginLogService.selectUserLoginLog(accountId);
		model.addAttribute("userLoginLogList", systemUserLoginLogList);
		return USER_LOGIN_LOG;
	}
	
	/**
	 * POST 启用/禁止用户
	 * @param request
	 * @return
	 */
	@RequiresPermissions("sysuser:list:edit")
	@RequestMapping(value = "/list/audit", method = RequestMethod.POST)
	@ResponseBody
	public AjaxResult audit() {
		Long accountId = Long.valueOf(getParameter("accountId"));
		Integer status = Integer.valueOf(getParameter("status"));
		systemUserService.updateUserStatus(accountId, status);
		return success(true);
	}
	
	/**
	 * DELETE 删除用户
	 * @return
	 */
	@RequiresPermissions("sysuser:list:delete")
	@RequestMapping(value = "/list/{accountId}/delete", method = RequestMethod.DELETE)
	@ResponseBody
	public AjaxResult delete(@PathVariable Long accountId) {
		systemUserService.deleteSysUser(accountId);
		return success(true);
	}
	
	/**
	 * GET 角色分类下管理员列表
	 * @param roleId
	 * @return
	 */
	@RequiresPermissions("sysuser:list:view")
	@RequestMapping(value = "/list/{roleId}/role", method = RequestMethod.GET)
	public String listrole(Model model, @PathVariable Long roleId) {
		List<SystemUser> systemUsers = systemUserService.selectSysUserByRoleId(roleId);
		model.addAttribute("systemUsers", systemUsers);
		return SYSTEM_USER_ROLE;
	}

	
	/**
	 * GET 修改用户页面
	 * @return
	 */
	@RequiresPermissions("sysuser:list:edit")
	@RequestMapping(value = "/list/{accountId}/edit", method = RequestMethod.GET)
	public String edit(Model model, @PathVariable Long accountId){
		SystemUser systemUser = systemUserService.selectById(Long.valueOf(accountId));
		model.addAttribute("systemUser", systemUser);//用户信息
		List<SystemRole> systemRoles = systemRoleService.selectRoleList();
		model.addAttribute("systemRoles", systemRoles);//所有角色
		List<SystemUserRole> systemRoleList = systemUserRoleService.selectRoleListByAccountId(accountId);
		model.addAttribute("systemRoleList", systemRoleList);//分配角色
		return SYSTEM_USER_ADDUSER;
	}
	
	/**
	 * GET 创建用户页面
	 * @return
	 */
	@RequiresPermissions("sysuser:list:add")
	@RequestMapping(value = "/list/add", method = RequestMethod.GET)
	public String add(Model model) {
		List<SystemRole> systemRoles = systemRoleService.selectRoleList();
		model.addAttribute("systemRoles", systemRoles);
		return SYSTEM_USER_ADDUSER;
	}
	
	/**
	 * POST 创建或修改用户
	 * @return
	 */
	@RequiresPermissions({"sysuser:list:add","sysuser:list:edit"})
	@RequestMapping(value = "/list/save", method = RequestMethod.POST)
	@ResponseBody
	public AjaxResult update(@ModelAttribute("systemUser") SystemUser systemUser){
		String[] roleIds = getParameterValues("roleId");
		if(!WebUtil.isEmail(systemUser.getEmail())){
			return fail(false, "请输入正确的电子邮箱");
		}
		if(!WebUtil.isTelephone(systemUser.getTelephone())){
			return fail(false, "请输入正确的手机号码");
		}
		if(systemUser.getId() == null){
			if(systemUserService.checkLoginName(systemUser.getLoginName())){
				return fail(false, "该用户名已被使用");
			}
			systemUserService.insertSystemUser(systemUser, roleIds);//创建用户及插入角色记录
			return success(true, "用户创建成功!");
		}else{
			systemUserService.updateUserInfoBySystem(systemUser, roleIds);//更新用户及角色记录
			return success(true, "用户信息修改成功!");
		}
	}
	
	/**
	 * GET 管理员个人信息界面
	 * @param request
	 * @return
	 */
	@RequiresPermissions("sysuser:info:view")
	@RequestMapping(value = "/info", method = RequestMethod.GET)
	public String view(Model model) {
		SystemAuthorizingUser sysUser = SingletonLoginUtils.getSystemUser();
		if (sysUser != null) {
			SystemUser systemUser = systemUserService.selectByLoginName(sysUser.getLoginName());
			model.addAttribute("systemUser", systemUser);// 用户信息

			List<SystemUserLoginLog> systemUserLoginLogList = systemUserLoginLogService.selectUserLoginLog(systemUser.getId());
			model.addAttribute("systemUserLoginLogList", systemUserLoginLogList);// 用户日志

			List<SystemUserRole> systemUserRoles = systemUserRoleService.selectRoleListByAccountId(systemUser.getId());
			StringBuffer userRole = new StringBuffer();
			for (SystemUserRole systemUserRole : systemUserRoles) {
				userRole.append(systemUserRole.getRoleName());
				userRole.append("&nbsp");
			}
			model.addAttribute("userRole", userRole);// 用户权限
		}
		return SYSTEM_USER_INFO;
	}
	
	
	/**
	 * POST 更新管理员信息
	 * @param systemUser
	 * @return
	 */
	@RequiresPermissions("sysuser:info:edit")
	@RequestMapping(value = "/info/edit", method = RequestMethod.POST)
	@ResponseBody
	public AjaxResult edit(@ModelAttribute("systemUser") SystemUser systemUser){
		SystemAuthorizingUser sysUser = SingletonLoginUtils.getSystemUser();
		if (sysUser != null) {
			systemUser.setId(sysUser.getUserId());
			systemUserService.updateUserInfo(systemUser);
			return success(true);
		}else{
			return fail(false, "您未登录或者登录已超时,请先登录!");
		}
	}
	
	/**
	 * 修改密码
	 * @param request
	 * @param user
	 * @return
	 */
	@RequiresPermissions("sysuser:info:edit")
	@RequestMapping(value = "/info/edit/psw", method = RequestMethod.POST)
	@ResponseBody
	public AjaxResult editPwd(HttpServletRequest request){
		SystemAuthorizingUser sysUser = SingletonLoginUtils.getSystemUser();
		if (sysUser != null) {
			SystemUser systemUser = systemUserService.selectByLoginName(sysUser.getLoginName());
			// 原密码
			String nowPassword = request.getParameter("nowPassword") == null ? ""
					: request.getParameter("nowPassword");
			// 新密码
			String newPassword = request.getParameter("newPassword") == null ? ""
					: request.getParameter("newPassword");
			// 确认密码
			String confirmPwd = request.getParameter("confirmPwd") == null ? ""
					: request.getParameter("confirmPwd");
			if(!MD5Utils.getMD5(nowPassword).equals(systemUser.getLoginPassword())){
				return fail(false, "原密码不正确!");
			}
			if(!WebUtil.isPassword(newPassword)){
				return fail(false, "密码长度8~16位，其中数字，字母和符号至少包含两种!");
			}
			if(!newPassword.equals(confirmPwd)){
				return fail(false, "两次输入的新密码不一致!");
			}
			systemUserService.updateUserPws(systemUser.getId(), newPassword);
			return success(true, "修改成功!");
		}else{
			return fail(false, "您未登录或者登录已超时,请先登录!");
		}
	}
	
	/**
	 * 设置头像页面
	 */
	@RequestMapping(value = "/upload", method = RequestMethod.GET)
	public String setAvatar() {
		return SYSTEM_USER_AVATAR;
	}
    @RequestMapping(value = "/upload",method = RequestMethod.POST, produces="application/json;charset=utf-8")  
	@ResponseBody
	public Map<String, Object> uploadHeadPortrait(MultipartFile avatar_file,String avatar_src,String avatar_data, HttpServletRequest request){
		Map<String, Object> json = new HashMap<String, Object>();
		if (!avatar_file.isEmpty()) {
			try{
		        //判断文件的MIMEtype
		        String type = avatar_file.getContentType();
		        if(type == null || !type.toLowerCase().startsWith("image/")){
		        	json = this.setJson(false, "不支持的文件类型，仅支持图片!", null);
		        	return  json;
		        }
				//头像存放文件
				String dir = "icon";
				Map<String, Object> returnMap = UploadFileUtils.Upload(request,avatar_file,avatar_data,dir);
				//返回的布尔型参数的值为true，如果字符串参数不为null，是相等的，忽略大小写字符串“true”。
				if (Boolean.parseBoolean(returnMap.get("flag").toString()) == true) {
                    SystemAuthorizingUser sysUser = SingletonLoginUtils.getSystemUser();
    				if (sysUser != null) {
						SystemUser systemUser = systemUserService.selectByLoginName(sysUser.getLoginName());
						systemUser.setPicImg(returnMap.get("savaPath").toString());
						systemUserService.insertOrUpdate(systemUser);
					}
					json = this.setJson(true, "上传成功!", returnMap.get("savaPath").toString());
					return json;
				} 
			}catch(Exception e){
				logger.error("ImageUploadController.uploadHeadPortrait", e);
				json = this.setJson(false, "上传失败，出现异常："+e.getMessage(), null);
				return json;
			}
		}
    	json = this.setJson(false, "不支持的文件类型，仅支持图片!", null);
    	return  json;
	}
    
    
    /**
	* @Description: 编辑管理栏目
	* @param model
	* @param accountId
	* @return
	* @throws 
	*/
	@RequiresPermissions("sysuser:list:edit")
	@RequestMapping(value = "/list/{userId}/editCategory", method = RequestMethod.GET)
	public String editCategory(Model model,@PathVariable Long userId){
		model.addAttribute("systemUser", systemUserService.selectById(userId));//用户信息
				
		List<Category> allList = categoryService.selectList(null);//查询所有的栏目
		if(allList!=null){
			//根据用户ID查询已经有的栏目权限，勾选出来
			Map<String,Object> columnMap = new HashMap<String,Object>();
			columnMap.put("Administrator_id", userId);
			List<UserHasCategory> categoryList = userHasCategoryService.selectByMap(columnMap);//查询已经有的栏目
			for(Category category:allList){
				for(UserHasCategory usercategory:categoryList){
					if(category.getId()==usercategory.getCategoryId()){
						category.setChecked(true);
					}
				}
			}
			model.addAttribute("jsonMenu", JSON.toJSON(allList));
		}
		return USER_CATEGORY;
	}
	
	/**
	* @Description: 创建或修改角色 
	* @param systemRole
	* @return
	* @throws 
	*/
	@RequiresPermissions({"sysuser:list:add","sysuser:list:edit"})
	@RequestMapping(value = "/listCategory/save", method = RequestMethod.POST)
	@ResponseBody
	public AjaxResult save(@ModelAttribute("systemUser") SystemUser systemUser){
//		SystemAuthorizingUser sysUser = SingletonLoginUtils.getSystemUser();
		String result = "";
		try{
			Map<String,Object> columnMap = new HashMap<String,Object>();
			columnMap.put("Administrator_id", systemUser.getId());
				//删除原有关联的栏目
				userHasCategoryService.deleteByMap(columnMap);
				//得到栏目ID串
				String categoryIds = ServletUtils.getRequest().getParameter("menuIds");
				if(categoryIds!=null && categoryIds.trim().length()>0){
					List<UserHasCategory> userCategoryList = new ArrayList<UserHasCategory>();
					String[] funArr = categoryIds.split(",");
					if(funArr.length>0){
						for(String categoryId : funArr){
							UserHasCategory userHasCategory=new UserHasCategory();
							userHasCategory.setAdministratorId(Integer.parseInt(systemUser.getId()+""));
							userHasCategory.setCategoryId(Integer.parseInt(categoryId));
							userCategoryList.add(userHasCategory);
						}
						userHasCategoryService.insertBatch(userCategoryList);
					}
				}
				result = "管理栏目修改成功!";
		}catch (Exception e) {
			logger.error("save()--error",e);
		}
		return success(true, result);
	}
}