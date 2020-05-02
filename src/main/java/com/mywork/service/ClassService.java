package com.mywork.service;

import com.mywork.pojo.Class;

import java.util.List;

public interface ClassService {

    List<Class> selAllClass();

    List<Class> selAllClassWithMajorAndTeacher();

    int insClass(Class cla);

    Class selClassByClassno(String classno);

    int delClassById(int id);

    int updClassByTeacherid(Integer id,Integer teacherid);
}
