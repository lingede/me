package com.me.dao.platform;

import com.me.entity.platform.Rotator;

import java.util.List;

import com.baomidou.mybatisplus.mapper.AutoMapper;

/**
 *
 * Rotator 表数据库控制层接口
 *
 */
public interface RotatorMapper extends AutoMapper<Rotator> {
	List<Rotator> selectAllRotator(Rotator rotator);
	
	List<Rotator> selectAllRotators();
	
	void insertOneRotator(Rotator rotator);
	
	void deleteRatatorByID(int id);
	
	Rotator selectRotatorByID(int id);
	
	void applyThisRotator(int id);
	
	void resetRotator(int id);
}