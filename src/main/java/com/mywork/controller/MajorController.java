package com.mywork.controller;


import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.mywork.pojo.Major;
import com.mywork.pojo.Msg;
import com.mywork.service.MajorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class MajorController {

    @Autowired
    private MajorService majorServiceImpl;

    //获取所有的专业
    @RequestMapping(value = "/get_majors",method = RequestMethod.GET)
    @ResponseBody
    public Msg get_majora(){
        List<Major> majorList = majorServiceImpl.selAllMajor();
        if(majorList != null){
            return Msg.success().add("majorList",majorList);
        }
        return Msg.fail();
    }

    //分页查找所有专业
    @RequestMapping(value = "/get_allMajor",method = RequestMethod.GET)
    @ResponseBody
    public Msg get_allMajor(@RequestParam("pn") Integer pn){
        PageHelper.startPage(pn,5);
        List<Major> list = majorServiceImpl.selAllMajor();
        PageInfo pageInfo = new PageInfo(list,5);
        return Msg.success().add("pageInfo",pageInfo);
    }

    //插入专业信息
    @RequestMapping(value = "/ins_major",method = RequestMethod.GET)
    @ResponseBody
    public Msg ins_major(Major major) {
        //判断学号是否已经存在
        Major ma = majorServiceImpl.selMajorByMajorno(major.getMajorno());
        if(ma != null) {
            return Msg.fail().add("msg","该专业号已经存在");
        } else {
            int index = majorServiceImpl.insMajor(major);
            if(index > 0) {
                 return Msg.success();
            } else {
                return Msg.fail();
            }
        }
    }

    //通过id删除专业
    @RequestMapping(value = "/del_major",method = RequestMethod.GET)
    @ResponseBody
    public Msg del_major(@RequestParam("id") Integer id) {
        int index = majorServiceImpl.delMajorById(id);
        if(index > 0) {
            return Msg.success();
        } else {
            return Msg.fail();
        }
    }
}
