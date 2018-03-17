package com.me.entity.platform;

import java.io.Serializable;
import java.util.Date;

import com.baomidou.mybatisplus.annotations.IdType;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;

/**
 *
 * 
 *
 */
@TableName("category_has_article")
public class CategoryHasArticle implements Serializable {

	@TableField(exist = false)
	private static final long serialVersionUID = 1L;

	/** 新闻ID */
	@TableField(value = "Article_id")
	private Integer articleId;

	/** 栏目ID */
	@TableField(value = "Category_id")
	private Integer categoryId;

	/** ID */
	@TableId(type = IdType.AUTO)
	private Integer id;

	/** 状态 */
	private Integer state;

	/** 是否置顶 */
	private Boolean isTop;

	/** 不管 */
	private String topDeadline;

	/** 发布时间 */
	private Date publishTime;


	public Integer getArticleId() {
		return this.articleId;
	}

	public void setArticleId(Integer articleId) {
		this.articleId = articleId;
	}

	public Integer getCategoryId() {
		return this.categoryId;
	}

	public void setCategoryId(Integer categoryId) {
		this.categoryId = categoryId;
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getState() {
		return this.state;
	}

	public void setState(Integer state) {
		this.state = state;
	}

	public Boolean getIsTop() {
		return this.isTop;
	}

	public void setIsTop(Boolean isTop) {
		this.isTop = isTop;
	}

	public String getTopDeadline() {
		return this.topDeadline;
	}

	public void setTopDeadline(String topDeadline) {
		this.topDeadline = topDeadline;
	}

	public Date getPublishTime() {
		return this.publishTime;
	}

	public void setPublishTime(Date publishTime) {
		this.publishTime = publishTime;
	}

}
