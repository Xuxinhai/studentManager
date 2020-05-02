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
            </div>
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
                <li class="active">个人中心</li>
            </ol>
            <div class="box">
                <div class="heading">
                    <p class="title" style="font-size: 25px;font-weight: bold;">
                        个人信息
                    </p>

                </div>

                <div class="box-inner">
                    <div>
                        <button id="alterUserInfo_btn" type="button" class="btn btn-default"
                                data-toggle="tooltip" data-placement="right"
                                title="修改信息" style="font-size:15px;border: solid 1px">
                            <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                            修改信息
                        </button>
                    </div>

                    <div  class="col-md-8 col-md-offset-2" style="margin-top: 30px;margin-bottom: 100px">
                        <table id="userinfo_table" class="table table-hover table-bordered" style="font-size: 15px;">
                            <tr>
                                <td style="width: 30%">用户名</td>
                                <td>${user.username}</td>
                            </tr>
                            <tr>
                                <td style="width: 30%">用户权限</td>
                                <td>
                                    <c:if test="${user.identity==1}">管理员</c:if>
                                    <c:if test="${user.identity==0}">学生</c:if>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 30%">学号</td>
                                <td>${user.sno}</td>
                            </tr>
                            <tr>
                                <td style="width: 30%">年龄</td>
                                <td>${user.age}</td>
                            </tr>
                            <tr>
                                <td style="width: 30%">性别</td>
                                <td>
                                    <c:if test="${user.sex==1}">男</c:if>
                                    <c:if test="${user.sex==2}">女</c:if>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 30%">联系电话</td>
                                <td>${user.phone}</td>
                            </tr>
                            <tr>
                                <td style="width: 30%">头像</td>
                                <td></td>
                            </tr>

                        </table>
                    </div>


                </div>
            </div>
         </div>


    <footer class="main-footer">
        <p>937921168@qq.com DreamBoy 版权所有</p>
    </footer>
</div>

    <div class="modal fade" id="userUpdate_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">学生信息修改</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" id="update_modal_form" style="font-weight: bold">
                        <div class="form-group">
                            <label class="col-sm-3 control-label">用户名</label>
                            <div class="col-sm-6">
                                <p class="form-control-static" id="username_update_static" >
                                    ${user.username}
                                </p>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">用户权限</label>
                            <div class="col-sm-6">
                                <p class="form-control-static" id="identity_update_static" >
                                    <c:if test="${user.identity==1}">管理员</c:if>
                                    <c:if test="${user.identity==0}">学生</c:if>
                                </p>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">学号</label>
                            <div class="col-sm-6">
                                <p class="form-control-static" id="sno_update_static" >
                                    ${user.sno}
                                </p>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">性别</label>
                            <div class="col-sm-6">
                                <div class="radio" style="float: left;margin-left: 20px">>
                                    <input type="radio" name="sex" id="gender1_reg_input" value="1" checked>男
                                </div>
                                <div class="radio" style="float: left;margin-left: 60px">
                                    <input type="radio" name="sex" id="gender2_reg_input" value="2">女
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">年龄</label>
                            <div class="col-sm-6">
                                <input type="text" name="age" class="form-control" id="age_update_input" placeholder="">
                                <span class="help-block"></span>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">联系电话</label>
                            <div class="col-sm-6">
                                <input type="text" name="phone" class="form-control" id="phone_update_input" placeholder="">
                                <span class="help-block"></span>
                            </div>
                        </div>


                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" id="user_update_btn">更新</button>
                </div>
            </div>
        </div>
    </div>



<div class="scroll-to-top"><i class="fa fa-chevron-up fa-lg"></i></div>

<script src="${APP_PATH}/static/main/assets/jquery/jquery-3.1.1.min.js"></script>
<script src="${APP_PATH}/static/main/assets/bootstrap/js/bootstrap.min.js"></script>
<script src="${APP_PATH}/static/main/assets/bootstrap-daterangepicker/moment.min.js"></script>
<script src="${APP_PATH}/static/main/assets/bootstrap-daterangepicker/daterangepicker.js"></script>
<script src="${APP_PATH}/static/main/js/main.js"></script>

<script type="text/javascript">
    $("#alterUserInfo_btn").click(function () {

        reset_form("#update_modal_form");
        //弹出
        $("#userUpdate_modal").modal({

            backdrop:"static"
        });
    })
    
    function validate_updateUser_form(){
        //校验年龄信息
        var age = $("#age_update_input").val();
        var regAge = /^[\d]{1,3}$/;
        if(!regAge.test(age)){
            show_validate_msg("#age_update_input","error","年龄为1-3位数字");
            return false;
        } else {
            show_validate_msg("#age_update_input","success","");
        }

        //校验电话信息
        var phone = $("#phone_update_input").val();
        var regPhone = /^[\d]{11}$/;
        if(!regPhone.test(phone)){
            show_validate_msg("#phone_update_input","error","电话号码为11位数字");
            return false;
        } else {
            show_validate_msg("#phone_update_input","success","");
        }

        return true;
    }

    $("#user_update_btn").click(function () {


        //校验表单信息
        if(!validate_updateUser_form()) {
            return false;
        }

        //更新信息
        $.ajax({
            url: "${APP_PATH}/updateUser",
            type: "POST",
            data: $("#update_modal_form").serialize()+"&id="+${user.id},
            success: function (result) {
                if(result.code == 100) {

                    window.location.href="${APP_PATH}/toStuUserInfo"
                } else {
                    alert("更新失败");
                }
            }

        })
    })
</script>
</body>
</html>