<%--
  Created by IntelliJ IDEA.
  User: 雨海
  Date: 2020/1/22
  Time: 11:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Simple Admin-首页</title>

    <c:set var="APP_PATH" value="${pageContext.request.contextPath}"></c:set>


    <!-- Bootstrap -->
    <link href="${APP_PATH}/static/main/assets/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${APP_PATH}/static/main/assets/bootstrap-daterangepicker/daterangepicker.css">
    <link rel="stylesheet" href="${APP_PATH}/static/main/assets/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="${APP_PATH}/static/main/css/common.css">
    <link rel="stylesheet" href="${APP_PATH}/static/main/css/main.css">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="http://cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="http://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->


    <script src="${APP_PATH}/static/js/myCommon.js"></script>

    <style type="text/css">


    </style>
</head>
<body>
<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
            <span class="navbar-sidebar-toggle" data-toggle="tooltip" data-placement="right" title="菜单栏收缩或展开"><i class="fa fa-bars" aria-hidden="true"></i></span>
            <a class="navbar-brand" href="#">
                <p style="font-size: 20px;color:black">
                    学生信息管理系统
                </p>
            </a>
        </div>

        <div class="navbar-end">
            <div class="nav-notifications">

            </div>

            <div class="dropdown">
                <button class="btn btn-default dropdown-toggle" type="button" id="navbar-dropdownmenu" data-toggle="dropdown">
                    <img src="${APP_PATH}/static/main/images/avatar-mini.jpg" alt="Admin">
                    学生
                    <span class="caret"></span>
                </button>
                <ul class="dropdown-menu dropdown-menu-right" role="menu" aria-labelledby="navbar-dropdownmenu">
                    <li role="presentation"><a role="menuitem" tabindex="-1" href="${APP_PATH}/toStuUserInfo">个人中心</a></li>
                    <li role="presentation"><a role="menuitem" tabindex="-1" href="${APP_PATH}/login.jsp">退出登录</a></li>
                </ul>
            </div
        </div>
    </div>
</nav>
<div class="wrapper">
    <aside class="sidebar-menu">
        <div class="separator-50"></div>

        <ul class="menu-list">
            <li class="menu-item actived">
                <a href="${APP_PATH}/tomain"><i class="fa fa-home" aria-hidden="true"></i>首页</a>
            </li>
            <li class="separator-20"></li>
            <li class="menu-item">
                <a href="javascript:void(0)"><i class="fa fa-cube" aria-hidden="true"></i>用户管理</a>
                <ul class="sub-menu-list">
                    <li class="sub-menu-item"><a href="${APP_PATH}/toStuUserInfo">个人中心</a></li>
                    <li class="sub-menu-item"><a href="${APP_PATH}/toStuAlterPassword">修改密码</a></li>
                </ul>
            </li>
            <li class="menu-item">
                <a href="javascript:void(0)"><i class="fa fa-key" aria-hidden="true"></i>学生管理</a>
                <ul class="sub-menu-list">
                    <li class="sub-menu-item"><a href="${APP_PATH}/toStudentInfo">我的信息</a></li>
                </ul>
            </li>
            <li class="menu-item">
                <a href="javascript:void(0)"><i class="fa fa-book" aria-hidden="true"></i>课程管理</a>
                <ul class="sub-menu-list">
                    <li class="sub-menu-item"><a href="${APP_PATH}/toStuCourseInfo">课程查询</a></li>
                </ul>
            </li>
            <li class="menu-item">
                <a href="javascript:void(0)"><i class="fa fa-tag" aria-hidden="true"></i>成绩管理
                    <%--<span class="badge">4</span>--%>
                </a>
                <ul class="sub-menu-list">
                    <li class="sub-menu-item"><a href="${APP_PATH}/toStuScoreInfo">成绩查询</a></li>
                </ul>
            </li>

            <li class="separator-30"></li>

            <li class="menu-item">
                <a href="${APP_PATH}/login.jsp"><i class="fa fa-sign-out" aria-hidden="true"></i>安全退出</a>
            </li>

        </ul>
    </aside>

    <div class="main-container">
        <div class="padding">
            <ol class="breadcrumb">
                <li><a href="${APP_PATH}/tomain">首页</a></li>
                <li>用户管理</li>
                <li class="active">修改密码</li>
            </ol>
            <div class="box">
                <div class="heading">
                    <p class="title" style="font-size: 25px;font-weight: bold;">
                        密码修改
                    </p>

                </div>

                <div class="box-inner">
                    <div class="col-md-4 col-md-offset-4" style="margin-bottom: 60px">
                        <div class="panel panel-primary">
                            <div class="panel-heading ">
                                <h3 class="panel-title">修改密码</h3>
                            </div>
                            <div class="panel-body">
                                <form id="password_alter_form" class="form-horizontal">
                                    <div class="form-group" style="margin-top: 15px">
                                        <label for="inputPassword1" class="col-sm-3 control-label">原密码</label>
                                        <div class="col-sm-8">
                                            <input type="password" class="form-control" id="inputPassword1">
                                            <span class="help-block"></span>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="inputPassword2" class="col-sm-3 control-label">新密码</label>
                                        <div class="col-sm-8">
                                            <input type="password" class="form-control" id="inputPassword2">
                                            <span class="help-block"></span>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="inputPassword3" class="col-sm-3 control-label">确认密码</label>
                                        <div class="col-sm-8">
                                            <input type="password" class="form-control" id="inputPassword3">
                                            <span class="help-block"></span>
                                        </div>
                                    </div>

                                    <div class="form-group" style="margin-top: 20px;">
                                        <div class="col-sm-offset-3 col-sm-8">
                                            <button id="password_alter_btn" type="button" class="btn btn-primary">修改</button>
                                        </div>
                                    </div>

                                </form>
                            </div>

                        </div>
                    </div>


                </div>
        </div>
    </div>
    </div>

    <footer class="main-footer">
        <p>937921168@qq.com DreamBoy 版权所有</p>
    </footer>
</div>





<div class="scroll-to-top"><i class="fa fa-chevron-up fa-lg"></i></div>

<script src="${APP_PATH}/static/main/assets/jquery/jquery-3.1.1.min.js"></script>
<script src="${APP_PATH}/static/main/assets/bootstrap/js/bootstrap.min.js"></script>
<script src="${APP_PATH}/static/main/assets/bootstrap-daterangepicker/moment.min.js"></script>
<script src="${APP_PATH}/static/main/assets/bootstrap-daterangepicker/daterangepicker.js"></script>
<script src="${APP_PATH}/static/main/js/main.js"></script>

<script type="text/javascript">

    $(function () {
        reset_form("#password_alter_form");
    })


    function validate_passwordAlter_form(){
        //校验原密码
        var password1 = $("#inputPassword1").val();
    //    alert(password1+":"+${user.password});

        if(password1 != ${user.password}) {
            show_validate_msg("#inputPassword1","error","原密码输入错误");
            return false;
        } else {
            show_validate_msg("#inputPassword1","success","");
        }

        //检验新密码
        var password2 = $("#inputPassword2").val();
        var regPassword = /(^[a-zA-Z0-9_-]{6,12}$)/;
        if(!regPassword.test(password2)){
            show_validate_msg("#inputPassword2","error","密码为6-12位数字字母组合");
            return false;
        } else {
            show_validate_msg("#inputPassword2","success","");
        }

        var password3 = $("#inputPassword3").val();
        if(password3 != password2) {
            show_validate_msg("#inputPassword3","error","两次密码输入不一致");
            return false;
        } else {
            show_validate_msg("#inputPassword3","success","");
        }

        return true;
    }

    $("#password_alter_btn").click(function () {
        //校验密码信息
        if(!validate_passwordAlter_form()) {
            return false;
        }

        //更新密码
        if(confirm("确认修改密码吗？")) {
            var password = $("#inputPassword2").val();
            $.ajax({
                url: "${APP_PATH}/alterPassword",
                type:"POST",
                data: "password="+password+"&id="+${user.id},
                success:function (result) {
                    if(result.code == 100) {
                        alert("修改密码成功");
                        window.location.href="${APP_PATH}/toStuUserInfo";
                    } else {
                        alter("修改密码失败，请重试！");
                        window.location.href="${APP_PATH}/toAlterPassword";
                    }
                }
            })
        }


    })

</script>
</body>
</html>