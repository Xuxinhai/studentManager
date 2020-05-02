package com.mywork.controller;


import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.mywork.pojo.Msg;
import com.mywork.pojo.Student;
import com.mywork.service.StudentService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class StudentController {

    @Autowired
    private StudentService studentServiceImpl;

    //通过id查找学生
    @RequestMapping(value = "/get_stu",method = RequestMethod.GET)
    @ResponseBody
    public Msg get_stuByid(int id) {
        Student stu = studentServiceImpl.selStuById(id);
        if(stu != null) {
            return Msg.success().add("stu",stu);
        } else {
            return Msg.fail();
        }
    }


    //检查学生是否存在
    @RequestMapping(value = "/checkSno",method = RequestMethod.POST)
    @ResponseBody
    public Msg checkUser(@RequestParam("sno") String sno) {
        boolean b = studentServiceImpl.selStu(sno);
        if(b) {
            return Msg.success();
        } else {
            return Msg.fail();
        }
    }


    //通过学号查询学生信息
    @RequestMapping(value = "/getStu",method = RequestMethod.GET)
    @ResponseBody
    public Msg getStudent(String studentno, HttpServletRequest req) {
        Student stu = studentServiceImpl.selStuByStudentno(studentno);
        if(stu != null) {
            return Msg.success().add("stu",stu);
        }

        return Msg.fail();

    }

    //通过学号查询学生信息()
    @RequestMapping(value = "/getStudentInfo",method = RequestMethod.GET)
    @ResponseBody
    public Msg getStudentInfo(String studentno, HttpServletRequest req) {
        Student stu = studentServiceImpl.selStudentBySnoWithClass(studentno);
        if(stu != null) {
            return Msg.success().add("stu",stu);
        }

        return Msg.fail();

    }

    //获取所有的学生信息

    @RequestMapping(value = "/get_allStu",method = RequestMethod.GET)
    @ResponseBody
    public Msg get_allStu(@RequestParam(value = "pn",defaultValue = "1") Integer pn,
                          String studentno,String studentname,Integer grade,
                          Student stu,Integer majorid,Integer classid) {


        PageHelper.startPage(pn,5);
        List<Student> list = studentServiceImpl.selAllStu(studentno,studentname,grade,majorid,classid);
        PageInfo pageInfo = new PageInfo(list,5);

//        System.out.println(list.size());

        return Msg.success().add("pageInfo",pageInfo);
    }

    //插入学生
    @RequestMapping(value = "/ins_stu",method = RequestMethod.GET)
    @ResponseBody
    public Msg ins_stu(Student stu) {

        //检查学号是否已经存在
        boolean exist = studentServiceImpl.selStu(stu.getStudentno());
        if(exist) {
            return Msg.fail().add("msg","学生已存在！");
        }

        int index = studentServiceImpl.insStu(stu);
        if(index > 0) {
            return Msg.success();
        } else {

            return Msg.fail();
        }

    }


    //更新学生
    @RequestMapping(value = "/upd_stu",method = RequestMethod.GET)
    @ResponseBody
    public Msg upd_stu(Student stu) {
        int index = studentServiceImpl.updateStu(stu);
        if(index > 0) {
            return Msg.success();
        } else {
            return Msg.fail();
        }

    }

    //删除学生
    @RequestMapping(value = "/del_stu",method = RequestMethod.GET)
    @ResponseBody
    public Msg del_stu(int id) {
        int index = studentServiceImpl.delStuById(id);
        if(index > 0) {
            return Msg.success();
        } else {
            return Msg.fail();
        }

    }

}
