package com.mywork.service;

import com.mywork.pojo.StuCourse;

import java.util.List;

public interface StuCourseService {

    List<StuCourse> selStuCourse(int id,String coursename,String teachername,String year);

    List<StuCourse> selStuScore(int id,String coursename,String year);

    List<StuCourse> selAllStuCourse(String studentno, String coursename,
                                    Integer grade, Integer majorid,Integer year);

    int insStuCourse(StuCourse stuCourse);

    int delStuCourse(int id);

    List<StuCourse> selAllScore(String studentno, String coursename,Integer year);

    int insScore(StuCourse stuCourse);

    StuCourse selStuCourseBySidAndCidAndYear(int studentid,int courseid,String year);

    int delScore(int id);
}

