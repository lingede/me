package com.me.entity.platform;

import java.io.Serializable;

import com.baomidou.mybatisplus.annotations.IdType;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;

/**
 *
 * 
 *
 */
public class Linkpage implements Serializable {

	@TableField(exist = false)
	private static final long serialVersionUID = 1L;

	/** 链接ID */
	@TableId(type = IdType.AUTO)
	private Integer id;

	/** 链接关联栏目 */
	@TableField(value = "Category_id")
	private Integer categoryId;

	/** 关联名称 */
	private String name;

	/** 关联url */
	private String url;


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

	public String getUrl() {
		return this.url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

}
