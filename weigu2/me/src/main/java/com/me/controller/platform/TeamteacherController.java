package com.me.controller.platform;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.me.common.dto.AjaxResult;
import com.me.controller.BaseController;
import com.me.entity.platform.Teacher;
import com.me.entity.platform.Teamteacher;
import com.me.service.platform.ITeacherService;
import com.me.service.platform.ITeamService;
import com.me.service.platform.ITeamteacherService;

/**
* 项目名称：me Maven Webapp   
* 类名称：TeamteacherController   
* 类描述：团队教师控制器  
* 创建人：zlm      
* @version
 */
@Controller
@RequestMapping("/platform/teamteacher")
public class TeamteacherController extends BaseController{
	
	/** 系统菜单列表 */
	private static final String TEAM_TEACHER_LIST = getViewPath("/platform/teamteacher/teamteacher_list");
	private static final String TEAM_TEACHER_ADD = getViewPath("/platform/teamteacher/teamteacher_add");

	@Autowired
	ITeamteacherService teamteacherService;
	
	@Autowired
	ITeamService teamService;
	
	@Autowired
	ITeacherService teacherSerivce;
	
	/**
	 * 进入菜单管理页面
	 */
	@RequiresPermissions("team:list:view")
	@RequestMapping(value="/list/{teamId}/list")
	public String showMenuList(Model model,@PathVariable("teamId") Long teamId){
		try{
			List<Teacher> teacherList =teamteacherService.selectAllTeacherByTeam(teamId);
			model.addAttribute("teacherList", teacherList);
			model.addAttribute("teamId", teamId);
		}catch (Exception e) {
			logger.error("showteamList()--error",e);
		}
		return TEAM_TEACHER_LIST;
	}
	
	/**
	* @Description: 添加菜团队成员
	* @param model
	* @return
	* @throws 
	*/
	@RequiresPermissions("team:list:add")
	@RequestMapping(value = "/list/{teamId}/add", method = RequestMethod.GET)
	public String add(Model model,@PathVariable("teamId") Long teamId) {
		try{
			List<Teacher> teacherList =teacherSerivce.selectList(null);
			model.addAttribute("teacherList", teacherList);
			model.addAttribute("teamId", teamId);
		}catch (Exception e) {
			logger.error("showteamList()--error",e);
		}
		return TEAM_TEACHER_ADD;
	}
	
	/**
	 * 创建或修改团队
	 * @param Team
	 * @return
	 */
	@RequiresPermissions({"team:list:add","team:list:edit"})
	@RequestMapping(value = "/list/save", method = RequestMethod.POST)
	@ResponseBody
	public AjaxResult update(@ModelAttribute("teamteacher") Teamteacher teamteacher){
		if(teamteacher.getTeamid()!=null && teamteacher.getTeacherid()!=null){
			Map<String,Object> columnMap = new HashMap<String,Object>();
			columnMap.put("teamid", teamteacher.getTeamid());
			columnMap.put("teacherid", teamteacher.getTeacherid());
			List<Teamteacher> list =teamteacherService.selectByMap(columnMap);
			if(list.size()>0){
				return success(false, "该团队已有此成员");
			}
			teamteacherService.insert(teamteacher);
			return success(true, "成员增加成功!");
		}else
			return success(false, "请选择一个成员");
	}
	
	/**
	 * 删除团队成员
	 */
	@RequiresPermissions("team:list:delete")
	@RequestMapping("/list/{teacherId}/{teamId}/delete")
	@ResponseBody
	public Map<String,Object> deleteFunction(@PathVariable("teacherId") Long teacherId,@PathVariable("teamId") Long teamId){
		Map<String,Object> json = new HashMap<String,Object>();
		try{
			Map<String,Object> columnMap = new HashMap<String,Object>();
			columnMap.put("teamid", teamId);
			columnMap.put("teacherid", teacherId);
				//删除原有关联的栏目
				teamteacherService.deleteByMap(columnMap);
			json = this.setJson(true, null, null);
		}catch (Exception e) {
			logger.error("deleteFunction()--error",e);
		}
		return json;
	}
}