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
public class Article implements Serializable {

	@TableField(exist = false)
	private static final long serialVersionUID = 1L;

	/** 新闻ID */
	@TableId(type = IdType.AUTO)
	private Integer id;

	/** 新闻标题 */
	private String title;

	/**  */
	private String titleimg;

	/** 新闻正文 */
	private String content;

	/** 创建时间 */
	private Date createTime;

	/** 投稿者 */
	private String author;

	/** 投稿人邮箱 */
	private String email;

	/** 投稿来源 */
	private String source;

	/** 阅读次数 */
	private Integer numOfRead;


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

	public String getTitleimg() {
		return this.titleimg;
	}

	public void setTitleimg(String titleimg) {
		this.titleimg = titleimg;
	}

	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getCreateTime() {
		return this.createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public String getAuthor() {
		return this.author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getSource() {
		return this.source;
	}

	public void setSource(String source) {
		this.source = source;
	}

	public Integer getNumOfRead() {
		return this.numOfRead;
	}

	public void setNumOfRead(Integer numOfRead) {
		this.numOfRead = numOfRead;
	}

}
