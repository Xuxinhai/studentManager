package com.mywork.service;

import com.mywork.pojo.Teacher;

import java.util.List;

public interface TeacherService {

    List<Teacher> selAllTea(String teacherno,String teachername);

    Teacher selTeaById(int id);

    int updateTea(Teacher teacher);

    int delTeaById(int id);

    int insTea(Teacher teacher);
}
