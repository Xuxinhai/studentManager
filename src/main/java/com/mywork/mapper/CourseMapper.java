package com.mywork.mapper;

import com.mywork.pojo.Course;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

public interface CourseMapper {

    //分页查询所有课程信息，包括教师
    List<Course> selAllCourseWithTea();

    //通过课程号查找课程
    @Select("select * from course where status=1 and courseno=#{param1}")
    Course selCourseByCourseno(String courseno);

    //插入课程
    @Insert("insert into course values(default,#{courseno},#{coursename},#{time},#{teacherid},1)")
    int insCourse(Course course);

    //删除课程
    @Update("update course set status=0 where id=#{param1}")
    int delCourseById(int id);

    //查询所有课程信息
    @Select("select * from course where status=1")
    List<Course> selAllCourse();
}
