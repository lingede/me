package com.me.entity.platform;

import java.io.Serializable;
import java.util.Date;

import com.baomidou.mybatisplus.annotations.IdType;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;

/**
 *
 * 
 *
 */
public class Teachercategory implements Serializable {

	@TableField(exist = false)
	private static final long serialVersionUID = 1L;

	/** 教师类别ID */
	@TableId(type = IdType.AUTO)
	private Integer id;

	/** 类别名称 */
	private String name;

	/** 创建时间 */
	private Date createTime;

	/** 教师人数 */
	private Integer numOfTeacher;

	/** 关联栏目ID */
	@TableField(value = "Category_id")
	private Integer categoryId;

	/**  */
	private Integer typdid;

	/**  */
	private Integer sortby;


	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Date getCreateTime() {
		return this.createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Integer getNumOfTeacher() {
		return this.numOfTeacher;
	}

	public void setNumOfTeacher(Integer numOfTeacher) {
		this.numOfTeacher = numOfTeacher;
	}

	public Integer getCategoryId() {
		return this.categoryId;
	}

	public void setCategoryId(Integer categoryId) {
		this.categoryId = categoryId;
	}

	public Integer getTypdid() {
		return this.typdid;
	}

	public void setTypdid(Integer typdid) {
		this.typdid = typdid;
	}

	public Integer getSortby() {
		return this.sortby;
	}

	public void setSortby(Integer sortby) {
		this.sortby = sortby;
	}

}
