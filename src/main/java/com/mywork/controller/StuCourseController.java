package com.mywork.controller;


import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.mywork.pojo.Course;
import com.mywork.pojo.Msg;
import com.mywork.pojo.StuCourse;
import com.mywork.pojo.Student;
import com.mywork.service.StuCourseService;
import com.mywork.service.StudentService;
import com.mywork.service.impl.StudentServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.CoroutinesUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class StuCourseController {

    @Autowired
    private StuCourseService stuCourseServiceImpl;

    @Autowired
    private StudentService studentServiceImpl;

    //获取所有课程信息
    @RequestMapping("/get_stuCourse")
    @ResponseBody
    public Msg getStuCourse(@RequestParam(value = "pn",defaultValue = "1") Integer pn,int id,
                            String coursename,String teachername,String year) {

        PageHelper.startPage(pn,1);
        List<StuCourse> list = stuCourseServiceImpl.selStuCourse(id,coursename,teachername,year);
        PageInfo pageInfo = new PageInfo(list,5);

        return Msg.success().add("pageInfo",pageInfo);
    }


    //获取所有成绩信息
    @RequestMapping("/get_stuScore")
    @ResponseBody
    public Msg getStuScore(@RequestParam(value = "pn",defaultValue = "1") Integer pn,int id,
                            String coursename,String year) {


        PageHelper.startPage(pn,1);
        List<StuCourse> list = stuCourseServiceImpl.selStuScore(id,coursename,year);
        PageInfo pageInfo = new PageInfo(list,5);

        System.out.println(list.size());

        return Msg.success().add("pageInfo",pageInfo);
    }

    //获取所有的学生课程
    @RequestMapping(value = "/get_allStuCourse",method = RequestMethod.GET)
    @ResponseBody
    public Msg get_allStuCourse(@RequestParam(value = "pn",defaultValue = "1") Integer pn,
                                String studentno,String coursename,Integer grade,Integer majorid,Integer year) {

        PageHelper.startPage(pn,5);
        List<StuCourse> list = stuCourseServiceImpl.selAllStuCourse(studentno, coursename,grade,majorid,year);
        PageInfo pageInfo = new PageInfo(list,5);

//        System.out.println(list.size());

        return Msg.success().add("pageInfo",pageInfo);
    }

    //插入学生课程信息
    @RequestMapping(value = "/ins_stuCourse",method = RequestMethod.GET)
    @ResponseBody
    public Msg ins_stuCourse(String studentno,StuCourse stuCourse) {
        //判断学号是否合法
        Student student = studentServiceImpl.selStuByStudentno(studentno);
        if(student == null) {
            return Msg.fail().add("msg","学号输入出错或学生不存在");
        } else {
            //判断课程是否已经存
            StuCourse s = stuCourseServiceImpl.selStuCourseBySidAndCidAndYear(
                    student.getId(),stuCourse.getCourseid(),stuCourse.getYear());
            if(s != null) {
                return Msg.fail().add("msg","学生课程已存在");
            } else {
                stuCourse.setStudentid(student.getId());
                int index = stuCourseServiceImpl.insStuCourse(stuCourse);
                if(index > 0) {
                    return Msg.success();
                } else {
                    return Msg.fail();
                }
            }

        }
    }


    //删除
    @RequestMapping(value = "/del_stuCourse",method = RequestMethod.GET)
    @ResponseBody
    public Msg del_stuCourse(int id) {
        int index = stuCourseServiceImpl.delStuCourse(id);
        if(index > 0) {
            return Msg.success();
        } else {
            return Msg.fail();
        }

    }


    //获取所有的学生成绩
    @RequestMapping(value = "/get_allScore",method = RequestMethod.GET)
    @ResponseBody
    public Msg get_allScore(@RequestParam(value = "pn",defaultValue = "1") Integer pn,
                                String studentno,String coursename,Integer year) {

        PageHelper.startPage(pn,5);
        List<StuCourse> list = stuCourseServiceImpl.selAllScore(studentno,coursename,year);
        PageInfo pageInfo = new PageInfo(list,5);
        return Msg.success().add("pageInfo",pageInfo);
    }

    //插入学生成绩信息
    @RequestMapping(value = "/ins_score",method = RequestMethod.GET)
    @ResponseBody
    public Msg ins_score(String studentno,StuCourse stuCourse) {
        //判断学号是否合法
        Student student = studentServiceImpl.selStuByStudentno(studentno);
        if(student == null) {
            return Msg.fail().add("msg","学号输入出错或学生不存在");
        } else {
            //判断学生课程是否存在
            StuCourse s = stuCourseServiceImpl.selStuCourseBySidAndCidAndYear(
                    student.getId(),stuCourse.getCourseid(),stuCourse.getYear());
            if(s == null) {
                return Msg.fail().add("msg","学生未选择该课程");
            } else{
                stuCourse.setId(s.getId());
                int index = stuCourseServiceImpl.insScore(stuCourse);
                if(index > 0) {

                    return Msg.success();
                } else {

                    return Msg.fail();
                }
            }

        }
    }


    //删除
    @RequestMapping(value = "/del_score",method = RequestMethod.GET)
    @ResponseBody
    public Msg del_score(int id) {
        int index = stuCourseServiceImpl.delScore(id);
        if(index > 0) {
            return Msg.success();
        } else {
            return Msg.fail();
        }

    }


}
