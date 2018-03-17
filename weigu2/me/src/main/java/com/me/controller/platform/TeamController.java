package com.me.controller.platform;

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

import com.me.common.dto.AjaxResult;
import com.me.common.util.MD5Utils;
import com.me.controller.BaseController;
import com.me.entity.platform.Team;
import com.me.service.platform.ITeamService;

/**
 * 项目名称：me Maven Webapp 类名称：TeamController 类描述：团队控制器 创建人：zlm
 * 
 * @version
 */
@Controller
@RequestMapping("/platform/team")
public class TeamController extends BaseController
{

	/** 系统菜单列表 */
	private static final String TEAM_MENU_LIST = getViewPath("/platform/team/team_list");
	private static final String TEAM_MENU_ADD = getViewPath("/platform/team/team_add");
	private static final String TEAM_MENU_DATA = getViewPath("/platform/team/team_data");

	@Autowired
	private ITeamService teamService;

	@InitBinder("team")
	public void initQueryUser(WebDataBinder dinder)
	{
		dinder.setFieldDefaultPrefix("team.");
	}

	/**
	 * 进入菜单管理页面
	 */
	@RequiresPermissions("team:list:view")
	@RequestMapping(value = "/list")
	public String showMenuList(Model model, @ModelAttribute("team") Team team)
	{
		try
		{
			List<Team> teamList = teamService.selectAllTeam(team);
			model.addAttribute("teamList", teamList);
			model.addAttribute("username", team.getUsername());
		} catch (Exception e)
		{
			logger.error("showteamList()--error", e);
		}
		return TEAM_MENU_LIST;
	}

	/**
	 * @Description: 添加菜团队 @param model @return @throws
	 */
	@RequiresPermissions("team:list:add")
	@RequestMapping(value = "/list/add", method = RequestMethod.GET)
	public String add(Model model)
	{
		return TEAM_MENU_ADD;
	}

	/**
	 * @Description: 编辑团队 @param model @param teamId @return @throws
	 */
	@RequiresPermissions("team:list:edit")
	@RequestMapping(value = "/list/{teamId}/edit", method = RequestMethod.GET)
	public String edit(Model model, @PathVariable Long teamId)
	{
		Team team = teamService.selectById(Long.valueOf(teamId));
		model.addAttribute("team", team);
		return TEAM_MENU_ADD;
	}

	/**
	 * 创建或修改团队
	 * 
	 * @param Team
	 * @return
	 */
	@RequiresPermissions({ "team:list:add", "team:list:edit" })
	@RequestMapping(value = "/list/save", method = RequestMethod.POST)
	@ResponseBody
	public AjaxResult update(@ModelAttribute("team") Team team)
	{
		if (team.getId() == null)
		{
			Map<String, Object> columnMap = new HashMap<String, Object>();
			columnMap.put("username", team.getUsername());
			List<Team> list = teamService.selectByMap(columnMap);
			if (list.size() > 0)
			{
				return fail(false, "该团队用户名已被使用");
			}
			team.setPassword(MD5Utils.getMD5(team.getPassword()));
			teamService.insert(team);// 插入菜单
			return success(true, "团队创建成功!");
		} else
		{
			teamService.updateSelectiveById(team);
			return success(true, "团队修改成功!");
		}
	}

	/**
	 * 删除团队
	 */
	@RequiresPermissions("team:list:delete")
	@RequestMapping("/list/{id}/delete")
	@ResponseBody
	public Map<String, Object> deleteFunction(@PathVariable("id") Long id)
	{
		Map<String, Object> json = new HashMap<String, Object>();
		try
		{
			teamService.deleteById(id);
			json = this.setJson(true, null, null);
		} catch (Exception e)
		{
			logger.error("deleteFunction()--error", e);
		}
		return json;
	}

	/**
	 * 修改密码
	 */
	@RequestMapping("/list/{id}/pwd")
	@ResponseBody
	public Map<String, Object> editPwd(@PathVariable("id") Long id)
	{
		Map<String, Object> json = new HashMap<String, Object>();
		try
		{
			if (id != null)
			{
				Team team = teamService.selectById(id);
				team.setPassword(MD5Utils.getMD5("abcd1234"));
				teamService.updateSelectiveById(team);
				json = this.setJson(true, null, null);
			} else
			{
				json = this.setJson(false, null, null);
			}
		} catch (Exception e)
		{
			logger.error("editPwd()--error", e);
		}
		return json;
	}

	/**
	 * @Description: 编辑团队基础资料 @param model @param teamId @return @throws
	 */
	@RequiresPermissions({ "team:list:add", "team:list:edit" })
	@RequestMapping(value = "/list/{teamId}/{type}/editdata", method = RequestMethod.GET)
	public String editdata(Model model, @PathVariable("teamId") Long teamId, @PathVariable("type") Integer type)
	{
		Team team = teamService.selectById(Long.valueOf(teamId));
		model.addAttribute("team", team);
		model.addAttribute("type", type);
		String content = "";
		switch (type)
		{
		case 1:
			content = team.getResearchField();
			break;
		case 2:
			content = team.getAcademic();
			break;
		case 3:
			content = team.getStudentTraining();
			break;
		case 4:
			content = team.getCooperator();
			break;
		default:
			break;
		}
		model.addAttribute("content", content);
		return TEAM_MENU_DATA;
	}

	/**
	 * 创建或修改团队
	 * 
	 * @param Team
	 * @return
	 */
	@RequiresPermissions({ "team:list:add", "team:list:edit" })
	@RequestMapping(value = "/list/{teamId}/{type}/data", method = RequestMethod.POST)
	@ResponseBody
	public AjaxResult updatedate(@PathVariable("teamId") Long teamId, @PathVariable("type") Integer type, HttpServletRequest request)
	{

		if (teamId != null)
		{
			String data = request.getParameter("data");
			Team team = teamService.selectById(Long.valueOf(teamId));
			switch (type)
			{
			case 1:
				team.setResearchField(data);
				break;
			case 2:
				team.setAcademic(data);
				break;
			case 3:
				team.setStudentTraining(data);
				break;
			case 4:
				team.setCooperator(data);
				break;
			default:
				break;
			}
			teamService.updateSelectiveById(team);// 插入菜单
			return success(true, "资料修改成功!");
		} else
		{
			return success(false, "出错了!");
		}
	}
}