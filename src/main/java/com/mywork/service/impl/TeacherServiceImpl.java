package com.mywork.service.impl;

import com.mywork.mapper.TeacherMapper;
import com.mywork.pojo.Teacher;
import com.mywork.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TeacherServiceImpl implements TeacherService {

    @Autowired
    private TeacherMapper teacherMapper;

    //按条件查询所有的教师信息
    @Override
    public List<Teacher> selAllTea(String teacherno,String teachername) {
        return teacherMapper.selAllTea(teacherno,teachername);
    }

    //通过教工号查询教师信息
    @Override
    public Teacher selTeaById(int id) {
        return teacherMapper.selTeaById(id);
    }

    //更新教师信息
    @Override
    public int updateTea(Teacher teacher) {
        return teacherMapper.updateTea(teacher);
    }

    //通脱教工号删除教师
    @Override
    public int delTeaById(int id) {
        return teacherMapper.delTeaById(id);
    }

    //插入教师
    @Override
    public int insTea(Teacher teacher) {
        return teacherMapper.insTea(teacher);
    }
}
