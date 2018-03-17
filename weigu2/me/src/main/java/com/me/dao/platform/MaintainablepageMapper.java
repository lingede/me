package com.me.dao.platform;

import org.apache.ibatis.annotations.Param;

import com.baomidou.mybatisplus.mapper.AutoMapper;
import com.me.entity.platform.Maintainablepage;

/**
 *
 * Maintainablepage 表数据库控制层接口
 *
 */
public interface MaintainablepageMapper extends AutoMapper<Maintainablepage>
{

	public Integer selectBycategory(@Param("categoryid") int id);
}