package com.me.service.impl.platform;

import org.springframework.stereotype.Service;

import com.baomidou.framework.service.impl.SuperServiceImpl;
import com.me.dao.platform.CategoryHasArticleMapper;
import com.me.entity.platform.CategoryHasArticle;
import com.me.service.platform.ICategoryHasArticleService;

/**
 *
 * HasArticle 表数据服务层接口实现类
 *
 */
@Service
public class CategoryHasArticleServiceImpl extends SuperServiceImpl<CategoryHasArticleMapper, CategoryHasArticle> implements ICategoryHasArticleService {


}