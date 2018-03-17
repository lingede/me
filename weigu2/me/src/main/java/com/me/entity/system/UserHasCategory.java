package com.me.entity.system;

import java.io.Serializable;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;

/**
 *
 * 
 *
 */
@TableName("system_user_has_category")
public class UserHasCategory implements Serializable {

	@TableField(exist = false)
	private static final long serialVersionUID = 1L;

	/** 用户ID */
	@TableId(value = "Administrator_id")
	private Integer administratorId;

	/** 栏目id */
	@TableField(value = "Category_id")
	private Integer categoryId;


	public Integer getAdministratorId() {
		return this.administratorId;
	}

	public void setAdministratorId(Integer administratorId) {
		this.administratorId = administratorId;
	}

	public Integer getCategoryId() {
		return this.categoryId;
	}

	public void setCategoryId(Integer categoryId) {
		this.categoryId = categoryId;
	}

}
