<%--
  Created by IntelliJ IDEA.
  User: 雨海
  Date: 2019/12/16
  Time: 15:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" >
    <title>login</title>
    <c:set var="APP_PATH" value="${pageContext.request.contextPath}"></c:set>

    <script type="text/javascript" src="${APP_PATH}/static/js/jquery-3.4.1.js"></script>

    <link href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">

    <script src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>

    <script src="${APP_PATH}/static/js/myCommon.js"></script>

    <style type="text/css">
        #reg_div{
            margin-top: 30px;padding-top: 10px;
            text-align: center;
            border-radius: 10px;
            background-color: whitesmoke;

            <%--background: url(${APP_PATH}/static/images/2.jpg)--%>

            margin-top:50px;
            padding-top: 30px;
            padding-bottom: 30px;
        }

        #background{
            background-color: lightblue;
            width:100%;
            height: 100%;

        }
    </style>

</head>
<body>
    <%--<nav class="navbar navbar-default" style="height: 10%;margin: 0px;padding: 0px">--%>
    <%--<div class="container-fluid" style="background-color: midnightblue">--%>
        <%--<div class="navbar-header pull-left" >--%>
            <%--<a class="navbar-brand" href="${APP_PATH}/reg.jsp">--%>
                <%--<p style="color: white;">注册</p>--%>
            <%--</a>--%>
        <%--</div>--%>
    <%--</div>--%>
    <%--</nav>--%>
    <div id="background" style="">
        <div class="col-md-4 col-md-offset-4" id="reg_div" style="">
            <div style="">
                <p style="font-size: 30px;color: black">学生注册</p>
            </div>
            <form class="form-horizontal" id="reg_form" style="margin-top: 30px">
                <div class="form-group" style="">
                    <label for="username_reg_input"  class="col-sm-3 control-label">用户名</label>
                    <div class="col-sm-7" style="">
                        <input type="text" class="form-control"id="username_reg_input" name="username">
                        <span class="help-block"></span>
                    </div>
                </div>
                <div class="form-group">
                    <label for="password_reg_input" class="col-sm-3 control-label">密码</label>
                    <div class="col-sm-7">
                        <input type="password" class="form-control" id="password_reg_input" name="password">
                        <span class="help-block"></span>
                    </div>

                </div>

                <div class="form-group">
                    <label for="password2_reg_input" class="col-sm-3 control-label">确认密码</label>
                    <div class="col-sm-7">
                        <input type="password" class="form-control" id="password2_reg_input">
                        <span class="help-block"></span>
                    </div>
                </div>

                <div class="form-group">
                    <label for="studentno_reg_input" class="col-sm-3 control-label">学号</label>
                    <div class="col-sm-7">
                        <input type="text" class="form-control" id="studentno_reg_input" name="sno">
                        <span class="help-block"></span>
                    </div>
                </div>

                <div class="form-group">
                    <label for="age_reg_input" class="col-sm-3 control-label">年龄</label>
                    <div class="col-sm-7">
                        <input type="text" class="form-control"  id="age_reg_input" name="age">
                        <span class="help-block"></span>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-3 control-label">phone</label>
                    <div class="col-sm-7">
                        <input type="text"  class="form-control" id="phone_reg_input" name="phone">
                        <span class="help-block"></span>
                    </div>
                </div>



                <div class="form-group">
                    <label class="col-sm-3 control-label">性别</label>
                    <div class="col-sm-7">
                        <div class="radio" style="float: left;margin-left: 20px">>
                            <input type="radio" name="sex" id="gender1_reg_input" value="1" checked>男
                        </div>
                        <div class="radio" style="float: left;margin-left: 60px">
                            <input type="radio" name="sex" id="gender2_reg_input" value="2">女
                        </div>

                    </div>
                </div>

                <%--<div class="form-group">--%>
                    <%--<label class="col-sm-3 control-label">年级</label>--%>
                    <%--<div class="col-sm-5">--%>
                        <%--<!--提交部门id即可-->--%>
                        <%--<select class="form-control" name="grade">--%>
                                <%--<option value="1">大一</option>--%>
                                <%--<option value="2">大二</option>--%>
                                <%--<option value="3">大三</option>--%>
                                <%--<option value="4">大四</option>--%>
                        <%--</select>--%>
                    <%--</div>--%>
                <%--</div>--%>


                <div class="form-group" style="margin-top: 20px">
                    <div class="">
                        <button type="button" class="btn btn-primary " id="user_reg_btn" style="width: 100px">注册</button>
                    </div>
                </div>
            </form>
        </div>
    </div>


    <script type="text/javascript">
        $(function () {
            //清除表单信息
            reset_form("#reg_form");
        })


        //校验表单数据
        function validate_reg_form(){
            //拿到要校验的数据
            var userName = $("#username_reg_input").val();
            /*帐号是否合法(字母开头，允许6-16字节，允许字母数字下划线)：^[a-zA-Z][a-zA-Z0-9_]{4,15}$  ^[\u4e00-\u9fa5]{0,}*/
            var regName = /(^[a-zA-Z0-9_-]{4,16}$)|(^[\u4e00-\u9fa5]{2,5})/;
            if(!regName.test(userName)) {
                //alert("用户名是2-5位中文或者6-16位英文和数字的组合");
                show_validate_msg("#username_reg_input","error","用户名是2-5位中文或者4-16位英文和数字的组合");
                return false;
            } else {
                show_validate_msg("#username_reg_input","success","");
            }

            //校验密码
            var password = $("#password_reg_input").val();
            var regPassword = /(^[a-zA-Z0-9_-]{6,12}$)/;
            if(!regPassword.test(password)){
                show_validate_msg("#password_reg_input","error","密码为6-12位数字字母组合");
                return false;
            } else {
                show_validate_msg("#password_reg_input","success","");
            }

            var password2 = $("#password2_reg_input").val();
            if(password != password2) {
                show_validate_msg("#password2_reg_input","error","两次输入密码不一致");
                return false;
            } else {
                show_validate_msg("#password2_reg_input","success","");
            }

            //校验学号信息
            var sno = $("#studentno_reg_input").val();
            var regSno = /^[\d]{10}$/;
            if(!regSno.test(sno)){
                show_validate_msg("#studentno_reg_input","error","学号为10位数字");
                return false;
            } else {
                show_validate_msg("#studentno_reg_input","success","");
            }



            //校验年龄信息
            var age = $("#age_reg_input").val();
            var regAge = /^[\d]{1,3}$/;
            if(!regAge.test(age)){
                show_validate_msg("#age_reg_input","error","年龄为1-3位数字");
                return false;
            } else {
                show_validate_msg("#age_reg_input","success","");
            }

            //校验电话信息
            var phone = $("#phone_reg_input").val();
            var regPhone = /^[\d]{11}$/;
            if(!regPhone.test(phone)){
                show_validate_msg("#phone_reg_input","error","电话号码为11位数字");
                return false;
            } else {
                show_validate_msg("#phone_reg_input","success","");
            }


            return true;
        }

        //判断用户名是否重复
        $("#username_reg_input").change(function () {
            // alert("111");
            var username = $(this).val();
            //  alert(username);

            $.ajax({
                url:"${APP_PATH}/checkusername",
                type:"POST",
                data:"username="+username,
                success:function(result){
                    if(result.code == 100) {
                        show_validate_msg("#username_reg_input","success","用户名可用");
                        $("#user_reg_btn").attr("usercheck_msg","success");
                    } else {
                        show_validate_msg("#username_reg_input","error",result.extend.usercheck_msg);
                        $("#user_reg_btn").attr("usercheck_msg","error");
                    }
                }
            })
        })

        //点击提交按钮
        $("#user_reg_btn").click(function () {

            //校验表单信息
            if(!validate_reg_form()){
                return false;
            }

            //判断用户名是否重复
            if($(this).attr("usercheck_user") == "error") {
                return false;
            }

            //检测学号是否存在
            var sno = $("#studentno_reg_input").val();
            var b = true;
            $.ajax({
                url: "${APP_PATH}/checkSno",
                type: "POST",
                data: "sno="+sno,
                success: function (result) {
                    if(result.code == 200) {
                        alert("非本校学生无法注册！请检查学号！");
                        show_validate_msg("#studentno_reg_input","error","学号错误");
                    } else {
                        $.ajax({
                            url: "${APP_PATH}/insUser",
                            type: "POST",
                            data: $("#reg_form").serialize(),
                            success: function (result) {
                                if(result.code == 100) {
                                    alert("注册成功！");
                                    window.location.href = "${APP_PATH}/login.jsp";
                                } else {
                                    alert("该学生已注册！请登录！");
                                    window.location.href = "${APP_PATH}/login.jsp";
                                }
                            }
                        })
                    }
                }
            })









        })






    </script>

</body>
</html>
