package com.me.service.impl.platform;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baomidou.framework.service.impl.SuperServiceImpl;
import com.me.dao.platform.CategoryMapper;
import com.me.entity.platform.Category;
import com.me.service.platform.ICategoryService;
import com.me.vo.platform.CategoryVO;

/**
 *
 * Category 表数据服务层接口实现类
 *
 */
@Service
public class CategoryServiceImpl extends SuperServiceImpl<CategoryMapper, Category> implements ICategoryService
{

	@Autowired
	private CategoryMapper categoryMapper;

	@Override
	public List<CategoryVO> selectCategory(Integer typeid)
	{
		return categoryMapper.selectCategory(typeid);
	}

	@Override
	public List<Map<String, Object>> selectCombobox()
	{
		return categoryMapper.selectCombobox();
	}

}