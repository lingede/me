package com.me.controller.platform;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.me.common.dto.AjaxResult;
import com.me.entity.platform.Rotator;
import com.me.service.platform.IRotatorService;
import com.me.controller.BaseController;
import com.me.dao.platform.RotatorMapper;

/**
 *
 * Rotator 控制层
 *
 */
@RequestMapping("/platform/rotator")
@Controller
public class RotatorController extends BaseController{
	/*轮播主题列表*/
	private static final String ROTATOR_LIST = getViewPath("platform/rotator/rotator_list");
	/*轮播主题添加*/
	private static final String ROTATOR_ADD = getViewPath("platform/rotator/rotator_add");
	/*轮播主题预览*/
	private static final String ROTATOR_REVIEW = getViewPath("platform/rotator/rotator_review");
	
	@Autowired
	private IRotatorService RotatorService;
	
	@InitBinder("rotator")
	public void initQueryUser(WebDataBinder dinder) {
		dinder.setFieldDefaultPrefix("rotator.");
	}
	
	/**
	 * @Description:根据条件显示所有轮播主题
	 * @Param:model
	 * @return
	  */
	@RequiresPermissions("rotator:list:view")
	@RequestMapping("/list")
	public String list(Model model,@ModelAttribute("rotator") Rotator rotator){
		List<Rotator> RotatorList = RotatorService.selectAllRotator(rotator);
		model.addAttribute("RotatorList", RotatorList);
		return ROTATOR_LIST;
	}
	
	/**
	* @Description: 添加轮播主题
	* @param:model
	* @return
	* @throws 
	*/
	@RequiresPermissions("rotator:list:add")
	@RequestMapping(value = "/list/add", method = RequestMethod.GET)
	public String add(Model model) {
		return ROTATOR_ADD;
	}
	
	/**
	 * 创建或修改轮播主题
	 * @param Team
	 * @return
	 */
	@RequiresPermissions({"rotator:list:add","rotator:list:edit"})
	@RequestMapping(value = "/list/save", method = RequestMethod.POST)
	@ResponseBody
	public AjaxResult update(@ModelAttribute("rotator") Rotator rotator){
		if(rotator.getId() == null && rotator.getTitle().toString().trim() != "" && rotator.getDescription().toString().trim() != ""){
			List<Rotator> list = RotatorService.selectAllRotator(rotator);
			if(list.size()>0){
				return fail(false, "该轮播主题主题名已被使用");
			}
			RotatorService.insertOneRotator(rotator);
			return success(true, "轮播主题创建成功!");
		}
		return fail(false,"轮播主题创建失败!");
	}
	
	/**
	 * 根据ID值删除rotator
	 * @return:json类型数据
	 * */
	@RequiresPermissions("rotator:list:delete")
	@RequestMapping(value="/list/delete")
	@ResponseBody
	public Map<String, Object> deleteRotatorByID(@RequestParam("id") int id){
		Map<String,Object> json = new HashMap<String, Object>();
		try{
			RotatorService.deleteById(id);
			json = this.setJson(true,null,null);
		}catch(Exception ex){
			logger.error("deleteRotatorByID()--error",ex);
		}
		return json;
	}
	
	@RequestMapping(value="/list/{id}/review")
	public String reviewRotator(Model model,@PathVariable("id") int id){
		Rotator rotator = RotatorService.selectById(id);
		model.addAttribute("OneRotator", rotator);
		return ROTATOR_REVIEW;
	}
	
	@RequiresPermissions("rotator:list:edit")
	@RequestMapping("/list/apply")
	@ResponseBody
	public Map<String,Object> applyRotator(@RequestParam("id") int id){
		Map<String,Object> json = new HashMap<String,Object>();
		try{
			RotatorService.applyThisRotator(id);
			RotatorService.resetRotator(id);
			json = this.setJson(true,null,null);
		}catch(Exception e){
			logger.error("applyRotator()--error",e);
			json = this.setJson(false, "出错了!", null);
		}
		return json;
	} 
	
}