package com.mywork.service.impl;

import com.mywork.mapper.StuCourseMapper;
import com.mywork.pojo.StuCourse;
import com.mywork.service.StuCourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StuCourseServiceImpl implements StuCourseService {

    @Autowired
    private StuCourseMapper stuCourseMapper;

    @Override
    public List<StuCourse> selStuCourse(int id, String coursename, String teachername, String year) {
        return stuCourseMapper.selAllStuCourseByStudentid(id,coursename,teachername,year);
    }

    @Override
    public List<StuCourse> selStuScore(int id, String coursename, String year) {
        return stuCourseMapper.selAllStuScoreByStudentid(id,coursename,year);
    }

    //按条件分页查询所有学生的课程信息
    @Override
    public List<StuCourse> selAllStuCourse(String studentno, String coursename, Integer grade, Integer majorid, Integer year) {
        return stuCourseMapper.selAllStuCourse(studentno,coursename,grade,majorid,year);
    }

    //插入学生课程信息
    @Override
    public int insStuCourse(StuCourse stuCourse) {
        return stuCourseMapper.insStuCourse(stuCourse);
    }

    @Override
    public int delStuCourse(int id) {
        return stuCourseMapper.delStuCourse(id);
    }

    //按条件分页查询所有学生的成绩信息
    @Override
    public List<StuCourse> selAllScore(String studentno, String coursename, Integer year) {
        return stuCourseMapper.selAllScore(studentno,coursename,year);
    }

    //插入学生成绩信息
    @Override
    public int insScore(StuCourse stuCourse) {
        return stuCourseMapper.insScore(stuCourse);
    }

    //通过学生好号和课程号查询
    @Override
    public StuCourse selStuCourseBySidAndCidAndYear(int studentid, int courseid,String year) {
        return stuCourseMapper.selStuCourseBySidAndCidAndYear(studentid,courseid,year);
    }

    @Override
    public int delScore(int id) {
        return stuCourseMapper.delScore(id);
    }
}
