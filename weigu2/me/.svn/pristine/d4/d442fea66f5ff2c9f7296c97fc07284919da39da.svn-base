package com.me.entity.platform;

import java.io.Serializable;

import com.baomidou.mybatisplus.annotations.IdType;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;

/**
 *
 * 
 *
 */
@TableName("tcategory_has_teacher")
public class TcategoryHasTeacher implements Serializable {

	@TableField(exist = false)
	private static final long serialVersionUID = 1L;

	/**  */
	@TableId(type = IdType.AUTO)
	private Integer id;

	/** 教师ID */
	@TableField(value = "Teacher_id")
	private Integer teacherId;

	/** 教师类别ID */
	@TableField(value = "TeacherCategory_id")
	private Integer teachercategoryId;

	/** 权重排名 */
	private Integer rank;


	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getTeacherId() {
		return this.teacherId;
	}

	public void setTeacherId(Integer teacherId) {
		this.teacherId = teacherId;
	}

	public Integer getTeachercategoryId() {
		return this.teachercategoryId;
	}

	public void setTeachercategoryId(Integer teachercategoryId) {
		this.teachercategoryId = teachercategoryId;
	}

	public Integer getRank() {
		return this.rank;
	}

	public void setRank(Integer rank) {
		this.rank = rank;
	}

}
