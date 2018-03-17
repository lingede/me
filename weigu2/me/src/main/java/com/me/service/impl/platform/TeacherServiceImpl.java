package com.me.service.impl.platform;

import org.springframework.stereotype.Service;

import com.me.dao.platform.TeacherMapper;
import com.me.entity.platform.Teacher;
import com.me.service.platform.ITeacherService;
import com.baomidou.framework.service.impl.SuperServiceImpl;

/**
 *
 * Teacher 表数据服务层接口实现类
 *
 */
@Service
public class TeacherServiceImpl extends SuperServiceImpl<TeacherMapper, Teacher> implements ITeacherService {


}