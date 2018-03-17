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
public class Teamteacher implements Serializable {

	@TableField(exist = false)
	private static final long serialVersionUID = 1L;

	/**  */
	@TableId(type = IdType.AUTO)
	private Integer id;

	/**  */
	private Integer teamid;

	/**  */
	private Integer teacherid;

	/**  */
	private String sortby;


	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getTeamid() {
		return this.teamid;
	}

	public void setTeamid(Integer teamid) {
		this.teamid = teamid;
	}

	public Integer getTeacherid() {
		return this.teacherid;
	}

	public void setTeacherid(Integer teacherid) {
		this.teacherid = teacherid;
	}

	public String getSortby() {
		return this.sortby;
	}

	public void setSortby(String sortby) {
		this.sortby = sortby;
	}

}
