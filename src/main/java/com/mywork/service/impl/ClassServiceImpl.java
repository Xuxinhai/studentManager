package com.mywork.service.impl;

import com.mywork.mapper.ClassMapper;
import com.mywork.pojo.Class;
import com.mywork.service.ClassService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ClassServiceImpl implements ClassService{

    @Autowired
    private ClassMapper classMapper;

    @Override
    public List<Class> selAllClass() {
        return classMapper.selAllClass() ;
    }

    //查找所有的班级，包括专业和教师信息
    @Override
    public List<Class> selAllClassWithMajorAndTeacher() {
        return classMapper.selAllClassWithMajorAndTeacher();
    }

    //插入一个班级
    @Override
    public int insClass(Class cla) {
        return classMapper.insClass(cla);
    }

    //通过班级号查找班级
    @Override
    public Class selClassByClassno(String classno) {
        return classMapper.selClassByClassno(classno);
    }

    //id删除班级
    @Override
    public int delClassById(int id) {
        return classMapper.delClassById(id);
    }

    //更新班级
    @Override
    public int updClassByTeacherid(Integer id,Integer teacherid) {
        return classMapper.updClassByTeacherid(id,teacherid);
    }
}
