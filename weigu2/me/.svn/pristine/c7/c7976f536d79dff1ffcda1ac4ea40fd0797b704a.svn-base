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
public class Maintainablepage implements Serializable {

	@TableField(exist = false)
	private static final long serialVersionUID = 1L;

	/** 静态页面ID */
	@TableId(type = IdType.AUTO)
	private Integer id;

	/** 关联栏目ID */
	@TableField(value = "Category_id")
	private Integer categoryId;

	/** 标题 */
	private String title;

	/** 正文 */
	private String content;

	/** 阅读次数 */
	private Integer numOfRead;

	/** 创建时间 */
	private Date createTime;


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

	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Integer getNumOfRead() {
		return this.numOfRead;
	}

	public void setNumOfRead(Integer numOfRead) {
		this.numOfRead = numOfRead;
	}

	public Date getCreateTime() {
		return this.createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

}
