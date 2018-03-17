package com.me.dao.platform;

import com.me.entity.platform.Team;

import java.util.List;

import com.baomidou.mybatisplus.mapper.AutoMapper;

/**
 *
 * Team 表数据库控制层接口
 *
 */
public interface TeamMapper extends AutoMapper<Team> {

	List<Team> selectAllTeam(Team team);


}