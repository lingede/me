package com.me.controller.platform;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.me.common.dto.AjaxResult;
import com.me.controller.BaseController;
import com.me.entity.platform.Maintainablepage;
import com.me.service.platform.ICategoryService;
import com.me.service.platform.IMaintainablepageService;
import com.me.vo.platform.CategoryVO;

@Controller
@RequestMapping("/platform/maintainablepage")
public class MaintainablepageController extends BaseController
{
	private static final String MAINTAINABLEPAGE_LIST = getViewPath("/platform/category/maintainablepage_list");
	private static final String MAINTAINABLEPAGE_ADD = getViewPath("/platform/category/maintainablepage_add");

	@Autowired
	private IMaintainablepageService maintainablepageService;

	@Autowired
	private ICategoryService categoryService;

	/**
	 * 可维护页列表
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	@RequiresPermissions("maintainablepage:list:view")
	public String selectLinkPage(Model model)
	{
		try
		{
			List<Maintainablepage> maintainablepages = maintainablepageService.selectList(null);
			model.addAttribute("maintainablepages", maintainablepages);
		} catch (Exception e)
		{
			logger.error("selectLinkPage()--error", e);
		}
		return MAINTAINABLEPAGE_LIST;
	}

	/**
	 * 添加可维护页
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/list/add", method = RequestMethod.GET)
	@RequiresPermissions("maintainablepage:list:add")
	public String add(Model model)
	{
		List<CategoryVO> list = categoryService.selectCategory(3);
		model.addAttribute("jsoncategory", JSON.toJSON(list));
		return MAINTAINABLEPAGE_ADD;
	}

	/**
	 * 编辑可维护页
	 * 
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/list/{id}/edit", method = RequestMethod.GET)
	@RequiresPermissions("maintainablepage:list:edit")
	public String edit(Model model, @PathVariable("id") Long id)
	{
		Maintainablepage maintainablepage = maintainablepageService.selectById(id);
		List<CategoryVO> list = categoryService.selectCategory(3);
		List<Map<String, Object>> result = new ArrayList<>();
		for (CategoryVO categoryVO : list)
		{
			Map<String, Object> map = new HashMap<>();
			map.put("id", categoryVO.getId());
			map.put("categoryId", categoryVO.getCategoryId());
			map.put("name", categoryVO.getName());
			if (categoryVO.getId() == maintainablepage.getCategoryId())
			{
				map.put("checked", true);
			}
			result.add(map);
		}
		model.addAttribute("jsoncategory", JSON.toJSON(result));
		model.addAttribute("maintainablepage", maintainablepage);
		return MAINTAINABLEPAGE_ADD;
	}

	/**
	 * 新增or修改可维护页信息
	 * 
	 * @param maintainablepage
	 * @return
	 */
	@RequestMapping(value = "/list/save", method = RequestMethod.POST)
	@RequiresPermissions({ "maintainablepage:list:add", "maintainablepage:list:edit" })
	public @ResponseBody AjaxResult update(Maintainablepage maintainablepage)
	{
		Integer count = maintainablepageService.selectBycategory(maintainablepage.getCategoryId());
		if (maintainablepage.getId() == null)
		{
			if (count != 0)
			{
				return fail(false, "可维护页：" + maintainablepage.getTitle() + "已存在");
			}
			maintainablepage.setCreateTime(new Date());
			maintainablepage.setNumOfRead(0);
			maintainablepageService.insert(maintainablepage);
			return success(true, "链接创建成功!");
		} else
		{
			Maintainablepage page = maintainablepageService.selectById(maintainablepage.getId());
			if (count != 0 && maintainablepage.getCategoryId() != page.getCategoryId())
			{
				return fail(false, "可维护页：" + maintainablepage.getTitle() + "已存在");
			}
			maintainablepageService.updateSelectiveById(maintainablepage);
			return success(true, "链接修改成功!");
		}
	}

	/**
	 * 删除可维护页信息
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping("/list/{id}/delete")
	@RequiresPermissions("maintainablepage:list:delete")
	public @ResponseBody Map<String, Object> deleteFunction(@PathVariable("id") Long id)
	{
		Map<String, Object> json = new HashMap<String, Object>();
		try
		{
			maintainablepageService.deleteById(id);
			json = this.setJson(true, null, null);
		} catch (Exception e)
		{
			logger.error("deleteFunction()--error", e);
		}
		return json;
	}
}