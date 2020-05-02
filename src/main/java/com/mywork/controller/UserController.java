package com.mywork.controller;


import com.mywork.pojo.Msg;
import com.mywork.pojo.User;
import com.mywork.service.UserService;
import com.mywork.util.CpachaUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.image.BufferedImage;
import java.io.IOException;

@Controller
public class UserController {

    @Autowired
    private UserService userServiceImpl;

    @RequestMapping(value="/get_cpacha",method = RequestMethod.GET)
    public void generateCpacha(
            @RequestParam(name="vl",required = false,defaultValue = "4") Integer vcodeLen,
            @RequestParam(name="w",required = false,defaultValue = "100") Integer width,
            @RequestParam(name="h",required = false,defaultValue = "30") Integer height,
            @RequestParam(name="type",required = true,defaultValue = "loginCpacha") String cpachaType,
            HttpServletRequest request,
            HttpServletResponse response) {
        CpachaUtil cpachaUtil = new CpachaUtil(vcodeLen,width,height);
        String generatorVCode = cpachaUtil.generatorVCode();
        request.getSession().setAttribute("code",generatorVCode);

        BufferedImage generatorRotateVCodeImage = cpachaUtil.generatorRotateVCodeImage(generatorVCode, true);
        try {
            ImageIO.write(generatorRotateVCodeImage,"gif",response.getOutputStream());
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @RequestMapping("/login")
    
    public String login(User user, String validcode, HttpServletRequest req) {

        //检测验证码
        String code = req.getSession().getAttribute("code").toString();
    //    System.out.println(validcode+":"+code);


        if(!validcode.toUpperCase().equals(code.toUpperCase())) {
            req.getSession().setAttribute("error", "验证码错误");
            return "redirect:/login.jsp";

        }

       // User uu = (User) req.getSession().getAttribute("user");


            //查询用户
            User u = userServiceImpl.userLogin(user);

      //      System.out.println(u);


            if(u == null){
                req.getSession().setAttribute("error", "用户名密码错误");
                return "redirect:/login.jsp";
            }
            //   System.out.println("sucess");
            //   System.out.println(u.getUsername()+":"+u.getPassword());
            req.getSession().setAttribute("user",u);
            if(u.getIdentity() == 1) {
                req.getSession().setAttribute("page","/toManMain");
                return "redirect:/managerMain.jsp";
            } else {
                return "student/main";
            }



    }


    @RequestMapping(value = "/checkusername",method = RequestMethod.POST)
    @ResponseBody
    public Msg check(String username) {
        //判断用户名是否合法
        String regx = "(^[a-zA-Z0-9_-]{4,16}$)";
        if(!username.matches(regx)){
            return Msg.fail().add("usercheck_msg","用户名必须是4-16位数字或字母组合或者2-5位中文");
        }

        boolean b = userServiceImpl.selUsername(username);
        if(b) {

            return Msg.success();
        } else {
            System.out.println("fail!");
            return Msg.fail().add("usercheck_msg","用户名重复,不可用");
        }
    }


    @RequestMapping(value = "/insUser",method = RequestMethod.POST)
    @ResponseBody
    public Msg insUser(User user) {
        //检查用户是否存在；
        boolean exist = userServiceImpl.selBySno(user.getSno());
        if(exist) {
            //用户存在，返回错误
            return Msg.fail();
        } else {

            //用户不存在，插入数据
            int index = userServiceImpl.insUser(user);
            if(index == 0) {
                return Msg.fail().add("ins_msg","注册失败！");
            } else {
                return Msg.success().add("ins_msg","注册成功！");
            }

        }
    }

    /*
    * 学生操作
    *
    *
    * */
    //回到首页
    @RequestMapping("/tomain")
    public String toStuMain() {
        return "student/main";
    }

    //个人信息
    @RequestMapping("/toStuUserInfo")
    public String stuUserInfo() {
        return "student/userInformation";
    }

    //更新个人信息
    @RequestMapping("/updateUser")
    @ResponseBody
    public Msg updateUser(User user,HttpServletRequest req) {
        int index = userServiceImpl.updateUser(user);
        if (index > 0) {
            User u = userServiceImpl.selUserById(user.getId());
            req.getSession().setAttribute("user",u);
            return Msg.success();
        } else {
            return Msg.fail();
        }
    }


    //修改密码界面
    @RequestMapping("/toStuAlterPassword")
    public String stuAlterPassword(){
        return "student/alterPassword";
    }

    //更新密码
    @RequestMapping(value = "/alterPassword",method = RequestMethod.POST)
    @ResponseBody
    public Msg StuAlterPass(String password,int id,HttpServletRequest req) {
        int index = userServiceImpl.updatePassword(password,id);
        if(index > 0) {
            User u = (User) req.getSession().getAttribute("user");
            if(u != null) {
                u.setPassword(password);
                req.getSession().setAttribute("user",u);
            }
            return Msg.success();
        } else {
            return Msg.fail();
        }
    }


    //我的信息（学生)
    @RequestMapping("/toStudentInfo")
    public String toStudentInfo(){
        return "student/studentInformation";
    }


    //课程查询
    @RequestMapping("/toStuCourseInfo")
    public String toStuCourseInfo(){
        return "student/courseInformation";
    }

    //成绩查询
    @RequestMapping("/toStuScoreInfo")
    public String toStuScoreInfo(){
        return "student/scoreInformation";
    }


    /*
    * 管理员管理
    *
    *
    * */

    //回到首页
    @RequestMapping("/toManMain")
    public String toMangerMain(HttpServletRequest request) {
        request.getSession().setAttribute("page","/toManMain");
        return "/manager/manMain";
    }

    //个人信息
    @RequestMapping("/toManUserInfo")
    public String ManagerUserInfo(HttpServletRequest request) {

        request.getSession().setAttribute("page","/toManUserInfo");
        return "manager/userInformation";
    }

    //修改密码界面
    @RequestMapping("/toManAlterPassword")
    public String ManagerAlterPassword(HttpServletRequest request){
        request.getSession().setAttribute("page","/toManAlterPassword");
        return "manager/alterPassword";
    }

    //更新密码
    @RequestMapping(value = "/ManAlterPassword",method = RequestMethod.POST)
    @ResponseBody
    public Msg ManagerAlterPass(String password,int id,HttpServletRequest req) {
        int index = userServiceImpl.updatePassword(password,id);
        if(index > 0) {
            User u = (User) req.getSession().getAttribute("user");
            if(u != null) {
                u.setPassword(password);
                req.getSession().setAttribute("user",u);
            }
            return Msg.success();
        } else {
            return Msg.fail();
        }
    }


    //获取所有的学生信息
    @RequestMapping("/toStuList")
    public String toMan_stuList(HttpServletRequest request) {
        request.getSession().setAttribute("page","/toStuList");
        return "manager/stuList";
    }

    //获取所有的学生信息(学生信息管理
    @RequestMapping("/toStuManagerList")
    public String toStuMangerList(HttpServletRequest request) {
        request.getSession().setAttribute("page","/toStuManagerList");
        return "manager/stuManagerList";
    }

    //教师列表
    @RequestMapping("/toTeaList")
    public String toTeacherList(HttpServletRequest request) {
        request.getSession().setAttribute("page","/toTeaList");
        return "manager/teacherList";
    }

    //添加教师
    @RequestMapping("/toAddTea")
    public String toAddTea(HttpServletRequest request) {
        request.getSession().setAttribute("page","/toAddTea");
        return "manager/addTeacher";
    }

    //专业列表
    @RequestMapping("/toMajorList")
    public String toMajorList(HttpServletRequest request) {
        request.getSession().setAttribute("page","/toMajorList");
        return "manager/majorList";
    }

    //班级列表
    @RequestMapping("/toClassList")
    public String toClassList(HttpServletRequest request) {
        request.getSession().setAttribute("page","/toClassList");
        return "manager/classList";
    }

    //课程列表
    @RequestMapping("/toCourseList")
    public String toCourseList(HttpServletRequest request) {
        request.getSession().setAttribute("page","/toCourseList");
        return "manager/courseList";
    }

    //学生课表
    @RequestMapping("/toStuCourseList")
    public String toStuCourseList(HttpServletRequest request) {
        request.getSession().setAttribute("page","/toStuCourseList");
        return "manager/stuCourseList";
    }

    //成绩
    @RequestMapping("/toScoreList")
    public String toScoreList(HttpServletRequest request) {
        request.getSession().setAttribute("page","/toScoreList");
        return "manager/scoreList";
    }

}



