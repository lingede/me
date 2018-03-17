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
public class Teacher implements Serializable {

	@TableField(exist = false)
	private static final long serialVersionUID = 1L;

	/** 教师ID */
	@TableId(type = IdType.AUTO)
	private Integer id;

	/** 用户名 */
	private String username;

	/** 密码 */
	private String password;

	/** 教师姓名 */
	private String name;

	/** 头衔 */
	private String title;

	/** 电话 */
	private String tel;

	/** 邮箱 */
	private String email;

	/** 团队ID */
	@TableField(value = "Team_id")
	private Integer teamId;

	/** 教育背景 */
	private String biography;

	/** 头像图片 */
	private String profilePic;

	/** 研究方向 */
	private String researchField;

	/** 代表论文 */
	private String academic;

	/** 学生指导 */
	private String studentTraining;

	/** 预留1 */
	private String reserve1;

	/** 预留2 */
	private String reserve2;

	/** 排序	 */
	@TableField(exist = false)
	private Integer sortby;
	
	public Integer getSortby() {
		return sortby;
	}

	public void setSortby(Integer sortby) {
		this.sortby = sortby;
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getTel() {
		return this.tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Integer getTeamId() {
		return this.teamId;
	}

	public void setTeamId(Integer teamId) {
		this.teamId = teamId;
	}

	public String getBiography() {
		return this.biography;
	}

	public void setBiography(String biography) {
		this.biography = biography;
	}

	public String getProfilePic() {
		return this.profilePic;
	}

	public void setProfilePic(String profilePic) {
		this.profilePic = profilePic;
	}

	public String getResearchField() {
		return this.researchField;
	}

	public void setResearchField(String researchField) {
		this.researchField = researchField;
	}

	public String getAcademic() {
		return this.academic;
	}

	public void setAcademic(String academic) {
		this.academic = academic;
	}

	public String getStudentTraining() {
		return this.studentTraining;
	}

	public void setStudentTraining(String studentTraining) {
		this.studentTraining = studentTraining;
	}

	public String getReserve1() {
		return this.reserve1;
	}

	public void setReserve1(String reserve1) {
		this.reserve1 = reserve1;
	}

	public String getReserve2() {
		return this.reserve2;
	}

	public void setReserve2(String reserve2) {
		this.reserve2 = reserve2;
	}

}
