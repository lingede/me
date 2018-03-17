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
public class Theme implements Serializable {

	@TableField(exist = false)
	private static final long serialVersionUID = 1L;

	/** 模板ID */
	@TableId(type = IdType.AUTO)
	private Integer id;

	/** 模板样式名称 */
	private String name;

	/** 模板样式路径 */
	private String path;

	/** 系统信息ID */
	@TableField(value = "systeminfo_id")
	private Integer systeminfoId;
	
	/**主题是否被采用*/
	private int is_apply;

	public int getIs_apply() {
		return is_apply;
	}

	public void setIs_apply(int is_apply) {
		this.is_apply = is_apply;
	}

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

	public String getPath() {
		return this.path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public Integer getSysteminfoId() {
		return this.systeminfoId;
	}

	public void setSysteminfoId(Integer systeminfoId) {
		this.systeminfoId = systeminfoId;
	}

}
