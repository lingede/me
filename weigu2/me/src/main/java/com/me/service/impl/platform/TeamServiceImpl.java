package com.me.service.impl.platform;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.me.dao.platform.TeamMapper;
import com.me.entity.platform.Team;
import com.me.service.platform.ITeamService;
import com.baomidou.framework.service.impl.SuperServiceImpl;

/**
 *
 * Team 表数据服务层接口实现类
 *
 */
@Service
public class TeamServiceImpl extends SuperServiceImpl<TeamMapper, Team> implements ITeamService {

	@Autowired
	TeamMapper teamMapper;
	
	@Override
	public List<Team> selectAllTeam(Team team) {
		return teamMapper.selectAllTeam(team);
	}


}