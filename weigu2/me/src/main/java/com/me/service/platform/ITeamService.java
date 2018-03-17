package com.me.service.platform;

import java.util.List;

import com.baomidou.framework.service.ISuperService;
import com.me.entity.platform.Team;

public interface ITeamService extends ISuperService<Team>
{

	List<Team> selectAllTeam(Team team);

}
