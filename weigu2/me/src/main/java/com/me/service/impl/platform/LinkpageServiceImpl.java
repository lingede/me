package com.me.service.impl.platform;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baomidou.framework.service.impl.SuperServiceImpl;
import com.me.dao.platform.LinkpageMapper;
import com.me.entity.platform.Linkpage;
import com.me.service.platform.ILinkpageService;

/**
 *
 * Linkpage 表数据服务层接口实现类
 *
 */
@Service
public class LinkpageServiceImpl extends SuperServiceImpl<LinkpageMapper, Linkpage> implements ILinkpageService
{

	@Autowired
	private LinkpageMapper linkpageMapper;

	@Override
	public Integer selectBycategory(int id)
	{
		return linkpageMapper.selectBycategory(id);
	}

}