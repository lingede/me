package com.me.service.platform;

import java.util.List;

import com.baomidou.framework.service.ISuperService;
import com.me.entity.platform.Rotator;

public interface IRotatorService extends ISuperService<Rotator>
{
	/**
	 * 查找所有轮播图片信息
	 * @return List<Rotator> 
	 */
	public List<Rotator> selectAllRotators();
	
	public List<Rotator> selectAllRotator(Rotator rotator);
	
	/**
	 * 插入轮播主题
	 * @param:rotator实体
	 * */
	public void insertOneRotator(Rotator rotator);
	
	/**
	 * 根据ID删除rotator
	 * @param:id
	 * */
	public void deleteRatatorByID(int id);
	
	/**
	 * 根据ID查找rotator
	 * @param:id
	 * */
	public Rotator selectRotatorByID(int id);
	
	/**
	 * 根据ID采用totator
	 * @param:id
	 * */
	public void applyThisRotator(int id);
	
	/**
	 * 将次ID以外的所有行的sequence字段置0
	 * */
	public void resetRotator(int id);
}
