package com.me.service.impl.platform;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.me.dao.platform.ThemeMapper;
import com.me.entity.platform.Theme;
import com.me.service.platform.IThemeService;
import com.baomidou.framework.service.impl.SuperServiceImpl;

/**
 *
 * Theme 表数据服务层接口实现类
 *
 */
@Service
public class ThemeServiceImpl extends SuperServiceImpl<ThemeMapper, Theme> implements IThemeService {
	
	@Autowired
	private ThemeMapper themeMapper;
	
	@Override
	public List<Theme> selectAllTheme(Theme theme) {
		return themeMapper.selectAllTheme(theme);
	}

	@Override
	public void applyThisTheme(int id) {
		themeMapper.applyThisTheme(id);
		
	}

	@Override
	public void resetTheme(int id) {
		themeMapper.resetTheme(id);
	}


}