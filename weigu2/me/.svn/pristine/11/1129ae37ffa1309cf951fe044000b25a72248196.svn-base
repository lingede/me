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
public class Attachment implements Serializable {

	@TableField(exist = false)
	private static final long serialVersionUID = 1L;

	/** 附件ID */
	@TableId(type = IdType.AUTO)
	private Integer id;

	/** 未知，不用 */
	@TableField(value = "MaintainablePage_id")
	private Integer maintainablepageId;

	/** 栏目ID */
	@TableField(value = "Article_id")
	private Integer articleId;

	/** 路径 */
	private String path;

	/** 标题信息 */
	private String info;

	/** 上传时间 */
	private Date uploadTime;

	/** 下载次数 */
	private Integer numOfDownload;


	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
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

	public Integer getNumOfDownload() {
		return this.numOfDownload;
	}

	public void setNumOfDownload(Integer numOfDownload) {
		this.numOfDownload = numOfDownload;
	}

}
