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
                    管理员
                    <span class="caret"></span>
                </button>
                <ul class="dropdown-menu dropdown-menu-right" role="menu" aria-labelledby="navbar-dropdownmenu">
                    <li role="presentation"><a role="menuitem" tabindex="-1" href="javascript:void(0);" id="nav_userInfo_a">个人中心</a></li>
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
                <a href="javascript:void(0);" id="menu_first_a"><i class="fa fa-home" aria-hidden="true"></i>首页</a>
            </li>
            <li class="separator-20"></li>
            <li class="menu-item">
                <a href="javascript:void(0)"><i class="fa fa-cube" aria-hidden="true"></i>用户管理</a>
                <ul class="sub-menu-list">
                    <li class="sub-menu-item"><a href="javascript:void(0);" id="userInfo_a">个人中心</a></li>
                    <li class="sub-menu-item"><a href="javascript:void(0);" id="alterPassword_a">修改密码</a></li>
                </ul>
            </li>
            <li class="menu-item">
                <a href="javascript:void(0)"><i class="fa fa-key" aria-hidden="true"></i>学生管理</a>
                <ul class="sub-menu-list">
                    <li class="sub-menu-item"><a href="javascript:void(0);" id="studentList_a">学生列表</a></li>
                    <li class="sub-menu-item"><a href="javascript:void(0);">添加学生</a></li>
                </ul>
            </li>
            <li class="menu-item">
                <a href="javascript:void(0)"><i class="fa fa-book" aria-hidden="true"></i>课程管理</a>
                <ul class="sub-menu-list">
                    <li class="sub-menu-item"><a href="${APP_PATH}/toCourseInfo">课程查询</a></li>
                </ul>
            </li>
            <li class="menu-item">
                <a href="javascript:void(0)"><i class="fa fa-tag" aria-hidden="true"></i>成绩管理
                    <%--<span class="badge">4</span>--%>
                </a>
                <ul class="sub-menu-list">
                    <li class="sub-menu-item"><a href="${APP_PATH}/toScoreInfo">成绩查询</a></li>
                </ul>
            </li>

            <li class="separator-30"></li>

            <li class="menu-item">
                <a href="${APP_PATH}/login.jsp"><i class="fa fa-sign-out" aria-hidden="true"></i>安全退出</a>
            </li>

        </ul>
    </aside>

    <div id = "content_div" class="main-container" get_page="${APP_PATH}/toManMain">



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
    var content_div = $("#content_div");

    $(function () {
        var page = content_div.attr("get_page");
        content_div.empty();
        content_div.load(page);
    })


    //到首页
    $("#menu_first_a").click(function () {
        to_firstpage(content_div,"${APP_PATH}/toManMain");
    })

    $("#nav_userInfo_a").click(function () {
        content_div.empty();
        content_div.load("${APP_PATH}/toManUserInfo");
        content_div.attr("get_page","${APP_PATH}/toManUserInfo");
    })

    //个人中心
    $("#userInfo_a").click(function () {
        content_div.empty();
        content_div.load("${APP_PATH}/toManUserInfo");
        content_div.attr("get_page","${APP_PATH}/toManUserInfo");
    })

    //修改密码
    $("#alterPassword_a").click(function () {
        content_div.empty();
        content_div.load("${APP_PATH}/toManAlterPassword");
        content_div.attr("get_page","${APP_PATH}/toManAlterPassword");
    })


    //学生列表
    $("#studentList_a").click(function () {
        content_div.empty();
        content_div.load("${APP_PATH}/toStuList");
        content_div.attr("get_page","${APP_PATH}/toStuList") ;
    })




</script>


</body>
</html>