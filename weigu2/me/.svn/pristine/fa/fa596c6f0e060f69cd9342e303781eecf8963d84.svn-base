package com.me.controller.platform;

import java.util.HashMap;
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
import org.springframework.web.bind.annotation.ResponseBody;

import com.me.controller.BaseController;
import com.me.entity.platform.Theme;
import com.me.service.platform.IThemeService;

/**
 *
 * Theme 控制层
 *
 */
@RequestMapping("/platform/theme")
@Controller
public class ThemeController extends BaseController{
	/*主题列表地址*/
	private final static String THEME_LIST = getViewPath("/platform/theme/theme_list");
	
	@Autowired
	private IThemeService themeService;
	
	@InitBinder("theme")
	public void initQueryUser(WebDataBinder dinder) {
		dinder.setFieldDefaultPrefix("theme.");
	}
	
	@RequiresPermissions("theme:list:view")
	@RequestMapping("/list")
	public String List(Model model,@ModelAttribute("theme") Theme theme){
		java.util.List<Theme> list = themeService.selectAllTheme(theme);
		model.addAttribute("themeList",list);
		return THEME_LIST;
	}
	
	@RequiresPermissions("theme:list:edit")
	@RequestMapping("/list/{id}/apply")
	@ResponseBody
	public Map<String,Object> apply(@PathVariable("id") int id){
		Map<String,Object> json = new HashMap<String, Object>();
		try{
			themeService.applyThisTheme(id);
			themeService.resetTheme(id);
			json = this.setJson(true, null, null);
		}catch(Exception e){
			logger.error("apply()--error",e);
			json = this.setJson(false, "出错了!", null);
		}
		return json;
	}

}