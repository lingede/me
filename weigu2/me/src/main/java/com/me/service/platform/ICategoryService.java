package com.me.service.platform;

import java.util.List;
import java.util.Map;

import com.baomidou.framework.service.ISuperService;
import com.me.entity.platform.Category;
import com.me.vo.platform.CategoryVO;

public interface ICategoryService extends ISuperService<Category>
{
	/** 查询enable为1的所有栏目(参数为栏目类型) */
	public List<CategoryVO> selectCategory(Integer typeid);

	/** 查询enable为1的所有一级栏目 */
	public List<Map<String, Object>> selectCombobox();
}
