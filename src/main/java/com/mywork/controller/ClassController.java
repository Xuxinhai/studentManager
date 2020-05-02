package com.mywork.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.mywork.pojo.Class;
import com.mywork.pojo.Msg;
import com.mywork.service.ClassService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class ClassController {

    @Autowired
    private ClassService classServiceImpl;

    //获取所有的班级信息
    @RequestMapping(value = "/get_classes",method = RequestMethod.GET)
    @ResponseBody
    public Msg get_allClasses() {

        List<Class> classList = classServiceImpl.selAllClass();
        if(classList != null) {
            return Msg.success().add("classList",classList);
        } else {
            return Msg.fail();
        }


    }


    //分页查询获取所有的班级信息
    //查找所有的班级，包括专业和教师信息
    @RequestMapping(value = "/get_allClass",method = RequestMethod.GET)
    @ResponseBody
    public Msg get_allClass(@RequestParam("pn") Integer pn) {

        PageHelper.startPage(pn,5);
        List<Class> list = classServiceImpl.selAllClassWithMajorAndTeacher();
        PageInfo pageInfo = new PageInfo(list,5);
        return Msg.success().add("pageInfo",pageInfo);

    }

    //插入班级
    @RequestMapping(value = "/ins_class",method = RequestMethod.GET)
    @ResponseBody
    public Msg ins_class(Class cla) {

        //判断该班级号是否存在
        Class c = classServiceImpl.selClassByClassno(cla.getClassno());
        if(c != null) {
            return Msg.fail().add("msg","该班级号已经存在");
        }

        int index = classServiceImpl.insClass(cla);
        if(index > 0) {
            return Msg.success();
        } else {
            return Msg.fail();
        }

    }


    //删除班级
    @RequestMapping(value = "/del_class",method = RequestMethod.GET)
    @ResponseBody
    public Msg del_class(@RequestParam("id") Integer id) {
        int index = classServiceImpl.delClassById(id);
        if(index > 0) {
            return Msg.success();
        } else {
            return Msg.fail();
        }

    }

    //更新班级
    @RequestMapping(value = "/upd_class",method = RequestMethod.GET)
    @ResponseBody
    public Msg upd_class(@RequestParam("id") Integer id,@RequestParam("teacherid") Integer teacherid) {
        System.out.println(teacherid);
        int index = classServiceImpl.updClassByTeacherid(id,teacherid);
        if(index > 0) {
            return Msg.success();
        } else {
            return Msg.fail();
        }

    }
}
