package com.me.entity.platform;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import com.baomidou.mybatisplus.annotations.IdType;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.me.entity.system.SystemMenu;

/**
 *
 * 
 *
 */
public class Category implements Serializable {

	@TableField(exist = false)
	private static final long serialVersionUID = 1L;

	/** 栏目id */
	@TableId(type = IdType.AUTO)
	private Integer id;

	/** 父级栏目id */
	@TableField(value = "Category_id")
	private Integer categoryId;

	/** 栏目名称 */
	private String name;

	/** 图片新闻个数 */
	private Integer numOfPicNews;

	/** 文字新闻个数 */
	private Integer numOfTextNews;

	/** 创建时间 */
	private Date createTime;

	/**  */
	private Integer sortby;

	/**  */
	private Integer type;

	/**  */
	private Integer enable;

	/**  */
	private Integer issubmit;

	
	/**子级权限List*/
	@TableField(exist = false)
	private List<Category> childCategoryList;
	/**是否选中*/
	@TableField(exist = false)
	private boolean checked;

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getCategoryId() {
		return this.categoryId;
	}

	public void setCategoryId(Integer categoryId) {
		this.categoryId = categoryId;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getNumOfPicNews() {
		return this.numOfPicNews;
	}

	public void setNumOfPicNews(Integer numOfPicNews) {
		this.numOfPicNews = numOfPicNews;
	}

	public Integer getNumOfTextNews() {
		return this.numOfTextNews;
	}

	public void setNumOfTextNews(Integer numOfTextNews) {
		this.numOfTextNews = numOfTextNews;
	}

	public Date getCreateTime() {
		return this.createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Integer getSortby() {
		return this.sortby;
	}

	public void setSortby(Integer sortby) {
		this.sortby = sortby;
	}

	public Integer getType() {
		return this.type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public Integer getEnable() {
		return this.enable;
	}

	public void setEnable(Integer enable) {
		this.enable = enable;
	}

	public Integer getIssubmit() {
		return this.issubmit;
	}

	public void setIssubmit(Integer issubmit) {
		this.issubmit = issubmit;
	}

	public List<Category> getChildCategoryList() {
		return childCategoryList;
	}

	public void setChildCategoryList(List<Category> childCategoryList) {
		this.childCategoryList = childCategoryList;
	}

	public boolean isChecked() {
		return checked;
	}

	public void setChecked(boolean checked) {
		this.checked = checked;
	}
}
