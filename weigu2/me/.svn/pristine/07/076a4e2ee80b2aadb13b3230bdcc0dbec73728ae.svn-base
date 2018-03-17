package com.me.service.impl.platform;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baomidou.framework.service.impl.SuperServiceImpl;
import com.me.dao.platform.MaintainablepageMapper;
import com.me.entity.platform.Maintainablepage;
import com.me.service.platform.IMaintainablepageService;

/**
 *
 * Maintainablepage 表数据服务层接口实现类
 *
 */
@Service
public class MaintainablepageServiceImpl extends SuperServiceImpl<MaintainablepageMapper, Maintainablepage> implements IMaintainablepageService
{

	@Autowired
	private MaintainablepageMapper maintainablepageMapper;

	@Override
	public Integer selectBycategory(int id)
	{
		return maintainablepageMapper.selectBycategory(id);
	}

}