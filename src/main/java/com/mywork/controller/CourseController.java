package com.mywork.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.mywork.pojo.Course;
import com.mywork.pojo.Msg;
import com.mywork.pojo.StuCourse;
import com.mywork.service.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class CourseController {
    @Autowired
    private CourseService courseServiceImpl;

    //分页查询获取所有的课程信息
    //查找所有的课程，包括教师信息
    @RequestMapping(value = "/get_allCourse",method = RequestMethod.GET)
    @ResponseBody
    public Msg get_allClass(@RequestParam("pn") Integer pn) {

        PageHelper.startPage(pn,5);
        List<Course> list = courseServiceImpl.selAllCourseWithTea();
        PageInfo pageInfo = new PageInfo(list,5);
        return Msg.success().add("pageInfo",pageInfo);

    }

    //插入课程
    @RequestMapping(value = "/ins_course",method = RequestMethod.GET)
    @ResponseBody
    public Msg ins_course(Course course) {

        //判断该课程号是否存在
        Course c = courseServiceImpl.selCourseByCourseno(course.getCourseno());
        if(c != null) {
            return Msg.fail().add("msg","该课程号号已经存在");
        }

        int index = courseServiceImpl.insCourse(course);
        if(index > 0) {
            return Msg.success();
        } else {
            return Msg.fail();
        }

    }

    //删除课程
    @RequestMapping(value = "/del_course",method = RequestMethod.GET)
    @ResponseBody
    public Msg del_course(@RequestParam("id") Integer id) {
        int index = courseServiceImpl.delCourseById(id);
        if(index > 0) {
            return Msg.success();
        } else {
            return Msg.fail();
        }

    }


    //获取所有的课程信息
    @RequestMapping(value = "/get_courses",method = RequestMethod.GET)
    @ResponseBody
    public Msg get_courses() {
        List<Course> courseList = courseServiceImpl.selAllCourse();
        return Msg.success().add("courseList",courseList);
    }

}
