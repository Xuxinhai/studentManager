package com.mywork.service.impl;

import com.mywork.mapper.CourseMapper;
import com.mywork.pojo.Course;
import com.mywork.service.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CourseServiceImpl implements CourseService {

    @Autowired
    private CourseMapper courseMapper;

    //分页查询所有课程信息，包括教师
    @Override
    public List<Course> selAllCourseWithTea() {
        return courseMapper.selAllCourseWithTea();
    }

    //通过课程号查找课程
    @Override
    public Course selCourseByCourseno(String courseno) {
        return courseMapper.selCourseByCourseno(courseno);
    }

    //插入课程
    @Override
    public int insCourse(Course course) {
        return courseMapper.insCourse(course);
    }

    //删除课程
    @Override
    public int delCourseById(int id) {
        return courseMapper.delCourseById(id);
    }

    @Override
    public List<Course> selAllCourse() {
        return courseMapper.selAllCourse();
    }
}
