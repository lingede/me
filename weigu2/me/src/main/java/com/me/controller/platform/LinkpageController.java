package com.me.controller.platform;

import java.util.ArrayList;
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
import com.me.entity.platform.Linkpage;
import com.me.service.platform.ICategoryService;
import com.me.service.platform.ILinkpageService;
import com.me.vo.platform.CategoryVO;

@Controller
@RequestMapping("/platform/linkpage")
public class LinkpageController extends BaseController
{
	private static final String LINKPAGE_LIST = getViewPath("/platform/category/linkpage_list");
	private static final String LINKPAGE_ADD = getViewPath("/platform/category/linkpage_add");

	@Autowired
	private ILinkpageService linkpageService;

	@Autowired
	private ICategoryService categoryService;

	/**
	 * 链接列表
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	@RequiresPermissions("linkpage:list:view")
	public String selectLinkPage(Model model)
	{
		try
		{
			List<Linkpage> linkpages = linkpageService.selectList(null);
			model.addAttribute("linkpages", linkpages);
		} catch (Exception e)
		{
			logger.error("selectLinkPage()--error", e);
		}
		return LINKPAGE_LIST;
	}

	/**
	 * 添加链接
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/list/add", method = RequestMethod.GET)
	@RequiresPermissions("linkpage:list:add")
	public String add(Model model)
	{
		List<CategoryVO> list = categoryService.selectCategory(2);
		model.addAttribute("jsoncategory", JSON.toJSON(list));
		return LINKPAGE_ADD;
	}

	/**
	 * 编辑链接
	 * 
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/list/{id}/edit", method = RequestMethod.GET)
	@RequiresPermissions("linkpage:list:edit")
	public String edit(Model model, @PathVariable("id") Long id)
	{
		Linkpage linkpage = linkpageService.selectById(id);
		List<CategoryVO> list = categoryService.selectCategory(2);
		List<Map<String, Object>> result = new ArrayList<>();
		for (CategoryVO categoryVO : list)
		{
			Map<String, Object> map = new HashMap<>();
			map.put("id", categoryVO.getId());
			map.put("categoryId", categoryVO.getCategoryId());
			map.put("name", categoryVO.getName());
			if (categoryVO.getId() == linkpage.getCategoryId())
			{
				map.put("checked", true);
			}
			result.add(map);
		}
		model.addAttribute("jsoncategory", JSON.toJSON(result));
		model.addAttribute("linkpage", linkpage);
		return LINKPAGE_ADD;
	}

	/**
	 * 新增or修改链接信息
	 * 
	 * @param linkpage
	 * @return
	 */
	@RequestMapping(value = "/list/save", method = RequestMethod.POST)
	@RequiresPermissions({ "linkpage:list:add", "linkpage:list:edit" })
	public @ResponseBody AjaxResult update(Linkpage linkpage)
	{
		Integer count = linkpageService.selectBycategory(linkpage.getCategoryId());

		if (linkpage.getId() == null)
		{
			if (count != 0)
			{
				return fail(false, "链接：" + linkpage.getName() + "已存在");
			}
			linkpageService.insert(linkpage);
			return success(true, "链接创建成功!");
		} else
		{
			Linkpage page = linkpageService.selectById(linkpage.getId());
			if (count != 0 && page.getCategoryId() != linkpage.getCategoryId())
			{
				return fail(false, "链接：" + linkpage.getName() + "已存在");
			}
			linkpageService.updateSelectiveById(linkpage);
			return success(true, "链接修改成功!");
		}
	}

	/**
	 * 删除链接信息
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping("/list/{id}/delete")
	@RequiresPermissions("linkpage:list:delete")
	public @ResponseBody Map<String, Object> deleteFunction(@PathVariable("id") Long id)
	{
		Map<String, Object> json = new HashMap<String, Object>();
		try
		{
			linkpageService.deleteById(id);
			json = this.setJson(true, null, null);
		} catch (Exception e)
		{
			logger.error("deleteFunction()--error", e);
		}
		return json;
	}
}