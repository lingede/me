package com.me.service.impl.platform;

import java.io.IOException;
import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.me.dao.platform.RotatorMapper;
import com.me.entity.platform.Rotator;
import com.me.service.platform.IRotatorService;
import com.baomidou.framework.service.impl.SuperServiceImpl;

/**
 *
 * Rotator 表数据服务层接口实现类
 *
 */
@Service
public class RotatorServiceImpl extends SuperServiceImpl<RotatorMapper, Rotator> implements IRotatorService {
	
	@Autowired
	private RotatorMapper rotatorMapper;
	
	@Override
	public List<Rotator> selectAllRotators() {
		return rotatorMapper.selectAllRotators();
	}

	@Override
	public List<Rotator> selectAllRotator(Rotator rotator) {
		return rotatorMapper.selectAllRotator(rotator);
	}

	@Override
	public void insertOneRotator(Rotator rotator) {
		rotatorMapper.insertOneRotator(rotator);
	}

	@Override
	public void deleteRatatorByID(int id) {
		rotatorMapper.deleteById(id);
		
	}

	@Override
	public Rotator selectRotatorByID(int id) {
		return rotatorMapper.selectById(id);
	}

	@Override
	public void applyThisRotator(int id) {
		rotatorMapper.applyThisRotator(id);
		
	}

	@Override
	public void resetRotator(int id) {
		rotatorMapper.resetRotator(id);
	}

}