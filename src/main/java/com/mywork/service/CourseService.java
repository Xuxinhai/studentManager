package com.mywork.service;

import com.mywork.pojo.Course;

import java.util.List;

public interface CourseService {

    List<Course> selAllCourseWithTea();

    Course selCourseByCourseno(String courseno);

    int insCourse(Course course);

    int delCourseById(int id);

    List<Course> selAllCourse();
}
