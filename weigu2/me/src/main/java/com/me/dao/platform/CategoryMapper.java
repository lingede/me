package com.me.dao.platform;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.baomidou.mybatisplus.mapper.AutoMapper;
import com.me.entity.platform.Category;
import com.me.vo.platform.CategoryVO;

/**
 *
 * Category 表数据库控制层接口
 *
 */
public interface CategoryMapper extends AutoMapper<Category>
{

	public List<CategoryVO> selectCategory(@Param("typeid") Integer typeid);

	public List<Map<String, Object>> selectCombobox();
}