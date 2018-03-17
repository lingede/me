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
public class Rotator implements Serializable {

	@TableField(exist = false)
	private static final long serialVersionUID = 1L;

	/** 轮播图片主题ID */
	@TableId(type = IdType.AUTO)
	private Integer id;

	/** 轮播主题标题 */
	private String title;

	/** 描述 */
	private String description;

	/** URL路径，无作用 */
	private String url;

	/** 排序 */
	private Integer sequence;

	/** 背景颜色，无作用 */
	private Integer backgroundColor;


	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getUrl() {
		return this.url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public Integer getSequence() {
		return this.sequence;
	}

	public void setSequence(Integer sequence) {
		this.sequence = sequence;
	}

	public Integer getBackgroundColor() {
		return this.backgroundColor;
	}

	public void setBackgroundColor(Integer backgroundColor) {
		this.backgroundColor = backgroundColor;
	}

}
