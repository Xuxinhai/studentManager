package com.mywork.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.mywork.pojo.Msg;
import com.mywork.pojo.Teacher;
import com.mywork.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class TeacherController {

    @Autowired
    private TeacherService teacherServiceImpl;

    //查询所有教师信息
    @RequestMapping(value = "/get_allTea",method = RequestMethod.GET)
    @ResponseBody
    public Msg get_allTea(@RequestParam("pn") Integer pn,String teacherno,String teachername) {
        PageHelper.startPage(pn,5);
        List<Teacher> list = teacherServiceImpl.selAllTea(teacherno,teachername);
        PageInfo pageInfo = new PageInfo(list,5);
        return Msg.success().add("pageInfo",pageInfo);
    }

    //通过教工号获取教师信息
    @RequestMapping(value = "/get_tea",method = RequestMethod.GET)
    @ResponseBody
    public Msg get_tea(@RequestParam("id") Integer id) {
        Teacher teacher = teacherServiceImpl.selTeaById(id);
        if(teacher != null) {
            return Msg.success().add("tea",teacher);
        } else {
            return Msg.fail();
        }

    }

    //更新教师信息
    @RequestMapping(value = "/upd_tea",method = RequestMethod.GET)
    @ResponseBody
    public Msg upd_tea(Teacher teacher) {
        int index = teacherServiceImpl.updateTea(teacher);
        if(index > 0) {
            return Msg.success();
        } else {
            return Msg.fail();
        }

    }

    //通脱教工号删除教师
    @RequestMapping(value = "/del_tea",method = RequestMethod.GET)
    @ResponseBody
    public Msg del_tea(int id) {
        int index = teacherServiceImpl.delTeaById(id);
        if(index > 0) {
            return Msg.success();
        } else {
            return Msg.fail();
        }

    }

    //插入教师
    @RequestMapping(value = "/add_tea",method = RequestMethod.GET)
    @ResponseBody
    public  Msg add_tea(Teacher teacher) {
        int index = teacherServiceImpl.insTea(teacher);
        if(index > 0) {
            return Msg.success();
        } else {
            return Msg.fail();
        }
    }

    //获取所有的教师信息
    @RequestMapping(value = "/get_teachers",method = RequestMethod.GET)
    @ResponseBody
    public Msg get_teachers() {
        List<Teacher> teacherList = teacherServiceImpl.selAllTea("","");
        return Msg.success().add("teacherList",teacherList);
    }

}
