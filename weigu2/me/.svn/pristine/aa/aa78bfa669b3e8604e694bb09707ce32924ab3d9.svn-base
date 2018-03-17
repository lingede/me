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
public class Staticpage implements Serializable {

	@TableField(exist = false)
	private static final long serialVersionUID = 1L;

	/** 静态页面ID */
	@TableId(type = IdType.AUTO)
	private Integer id;

	/** 栏目ID */
	@TableField(value = "Category_id")
	private Integer categoryId;

	/** 静态页面标题 */
	private String name;

	/** 静态页面路径 */
	private String path;


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

	public String getPath() {
		return this.path;
	}

	public void setPath(String path) {
		this.path = path;
	}

}
