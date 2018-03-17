package com.me.controller.platform;

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
import com.me.entity.platform.Category;
import com.me.service.platform.ICategoryService;
import com.me.vo.platform.CategoryVO;

/**
 *
 * Category 控制层
 *
 */
@Controller
@RequestMapping("/platform/category")
public class CategoryController extends BaseController
{

	private static final String CATEGORY_LIST = getViewPath("/platform/category/category_list");
	private static final String CATEGORY_ADD = getViewPath("/platform/category/category_add");

	@Autowired
	private ICategoryService categoryService;

	/**
	 * 获取所有栏目信息
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	@RequiresPermissions("category:list:view")
	public String selectCategory(Model model)
	{
		List<CategoryVO> list = categoryService.selectCategory(null);
		List<Category> categories = categoryService.selectList(null);
		model.addAttribute("jsonCategory", JSON.toJSON(list));
		model.addAttribute("categorys", categories);
		return CATEGORY_LIST;
	}

	/**
	 * 添加栏目
	 * 
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/list/add", method = RequestMethod.GET)
	@RequiresPermissions("category:list:add")
	public String add(Model model)
	{
		List<Map<String, Object>> list = categoryService.selectCombobox();
		if (list != null)
		{
			model.addAttribute("combobox", list);
		}
		return CATEGORY_ADD;
	}

	/**
	 * 编辑栏目
	 * 
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/list/{id}/edit", method = RequestMethod.GET)
	@RequiresPermissions("category:list:edit")
	public String add(Model model, @PathVariable("id") Integer id)
	{
		List<Map<String, Object>> list = categoryService.selectCombobox();
		if (list != null)
		{
			model.addAttribute("combobox", list);
		}
		Category category = categoryService.selectById(id);
		model.addAttribute("category", category);
		return CATEGORY_ADD;
	}

	/**
	 * 新增or修改栏目
	 * 
	 * @param category
	 * @return
	 */
	@RequestMapping(value = "/list/save", method = RequestMethod.POST)
	@RequiresPermissions({ "category:list:add", "category:list:edit" })
	public @ResponseBody AjaxResult update(Category category)
	{
		if (category.getId() == null)
		{
			category.setCreateTime(new Date());
			category.setEnable(1);
			category.setNumOfPicNews(0);
			category.setNumOfTextNews(0);
			categoryService.insert(category);
			return success(true, "栏目创建成功!");
		} else
		{
			categoryService.updateSelectiveById(category);
			return success(true, "栏目修改成功!");
		}
	}

	/**
	 * 删除栏目信息
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping("/list/{id}/delete")
	@RequiresPermissions("category:list:delete")
	public @ResponseBody Map<String, Object> deleteFunction(@PathVariable("id") Long id)
	{
		Map<String, Object> json = new HashMap<String, Object>();
		try
		{
			Category category = categoryService.selectById(id);
			category.setEnable(0);
			categoryService.updateSelectiveById(category);
			json = this.setJson(true, null, null);
		} catch (Exception e)
		{
			logger.error("deleteFunction()--error", e);
		}
		return json;
	}

}