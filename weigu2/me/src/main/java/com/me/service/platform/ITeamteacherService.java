package com.me.service.platform;

import com.me.entity.platform.Teacher;
import com.me.entity.platform.Teamteacher;

import java.util.List;

import com.baomidou.framework.service.ISuperService;

/**
 *
 * Teamteacher 表数据服务层接口
 *
 */
public interface ITeamteacherService extends ISuperService<Teamteacher> {

	/**
	 * 根据团队ID获得所有的教师
	 * @param teamId
	 * @return
	 */
	List<Teacher> selectAllTeacherByTeam(Long teamId);


}