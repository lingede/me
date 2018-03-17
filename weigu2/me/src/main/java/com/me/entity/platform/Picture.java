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
public class Picture implements Serializable {

	@TableField(exist = false)
	private static final long serialVersionUID = 1L;

	/** 图片ID */
	@TableId(type = IdType.AUTO)
	private Integer id;

	/** 图片主题ID */
	@TableField(value = "Rotator_id")
	private Integer rotatorId;

	/** 关联静态页面ID */
	@TableField(value = "MaintainablePage_id")
	private Integer maintainablepageId;

	/** 关联新闻ID */
	@TableField(value = "Article_id")
	private Integer articleId;

	/** 图片路径 */
	private String path;

	/** 图片描述 */
	private String info;

	/** 上传时间 */
	private Date uploadTime;

	/**  */
	private String sortby;


	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getRotatorId() {
		return this.rotatorId;
	}

	public void setRotatorId(Integer rotatorId) {
		this.rotatorId = rotatorId;
	}

	public Integer getMaintainablepageId() {
		return this.maintainablepageId;
	}

	public void setMaintainablepageId(Integer maintainablepageId) {
		this.maintainablepageId = maintainablepageId;
	}

	public Integer getArticleId() {
		return this.articleId;
	}

	public void setArticleId(Integer articleId) {
		this.articleId = articleId;
	}

	public String getPath() {
		return this.path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public String getInfo() {
		return this.info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	public Date getUploadTime() {
		return this.uploadTime;
	}

	public void setUploadTime(Date uploadTime) {
		this.uploadTime = uploadTime;
	}

	public String getSortby() {
		return this.sortby;
	}

	public void setSortby(String sortby) {
		this.sortby = sortby;
	}

}
