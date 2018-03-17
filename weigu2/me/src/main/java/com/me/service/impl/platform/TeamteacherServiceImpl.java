package com.me.service.impl.platform;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.me.dao.platform.TeamteacherMapper;
import com.me.entity.platform.Teacher;
import com.me.entity.platform.Teamteacher;
import com.me.service.platform.ITeamteacherService;
import com.baomidou.framework.service.impl.SuperServiceImpl;

/**
 *
 * Teamteacher 表数据服务层接口实现类
 *
 */
@Service
public class TeamteacherServiceImpl extends SuperServiceImpl<TeamteacherMapper, Teamteacher> implements ITeamteacherService {

	@Autowired
	TeamteacherMapper teamteacherMapper;
	
	@Override
	public List<Teacher> selectAllTeacherByTeam(Long teamId) {
		return teamteacherMapper.selectAllTeacherByTeam(teamId);
	}


}