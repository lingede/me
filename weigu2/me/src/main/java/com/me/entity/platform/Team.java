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
public class Team implements Serializable {

	@TableField(exist = false)
	private static final long serialVersionUID = 1L;

	/** 团队ID */
	@TableId(type = IdType.AUTO)
	private Integer id;

	/** 团队用户名 */
	private String username;

	/** 密码 */
	private String password;

	/** 团队名称 */
	private String name;

	/** 团队简介 */
	private String researchDirection;

	/** 团队成员 */
	private String teamMember;

	/** 研究领域 */
	private String researchField;

	/** 学术成果 */
	private String academic;

	/** 学生培养 */
	private String studentTraining;

	/** 合作单位 */
	private String cooperator;

	/** 地址 */
	private String address;

	/** 备用1 */
	private String reserve1;

	/** 备用2 */
	private String reserve2;

	/** 成员数量 */
	private Integer numOfMember;

	/**  */
	private Integer sortby;


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

	public String getResearchDirection() {
		return this.researchDirection;
	}

	public void setResearchDirection(String researchDirection) {
		this.researchDirection = researchDirection;
	}

	public String getTeamMember() {
		return this.teamMember;
	}

	public void setTeamMember(String teamMember) {
		this.teamMember = teamMember;
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

	public String getCooperator() {
		return this.cooperator;
	}

	public void setCooperator(String cooperator) {
		this.cooperator = cooperator;
	}

	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
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

	public Integer getNumOfMember() {
		return this.numOfMember;
	}

	public void setNumOfMember(Integer numOfMember) {
		this.numOfMember = numOfMember;
	}

	public Integer getSortby() {
		return this.sortby;
	}

	public void setSortby(Integer sortby) {
		this.sortby = sortby;
	}

}
