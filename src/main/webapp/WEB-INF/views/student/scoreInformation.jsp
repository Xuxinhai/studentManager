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


    <script src="${APP_PATH}/static/js/myCommon.js" charset="UTF-8" type="text/javascript"></script>

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
                <li>课程管理</li>
                <li class="active">课程查询</li>
            </ol>
            <div class="box">
                <div class="heading">
                    <p class="title" style="font-size: 25px;font-weight: bold;">
                        课程查询
                    </p>

                </div>

                <div class="box-inner">
                    <form id="serach_form" class="form-search " role="form">
                        <div class="col-md-2 col-sm-4 col-xs-12">
                            <div class="form-group">
                                <label class="sr-only">课程名</label>
                                <input type="text" name="coursename" class="form-control" placeholder="按课程名搜索">
                            </div>
                        </div>
                        <div class="col-md-2 col-sm-4 col-xs-12">
                            <div class="form-group">
                                <label class="sr-only">学年</label>
                                <input type="text" name="year" class="form-control input-daterange" placeholder="按学年搜索">
                            </div>
                        </div>

                        <button id="search_btn" type="button" class="btn btn-default pull-right btn-search">搜索</button>
                    </form>

                    <div class="table-responsive" style="margin-top: 20px;">
                        <table id="stuScore_table" class="table table-striped">
                            <thead>
                            <tr>
                                <th>课程号</th>
                                <th>课程名</th>
                                <th>学年</th>
                                <th>平时成绩</th>
                                <th>期末成绩</th>
                                <th>总成绩</th>
                            </tr>
                            </thead>
                            <tbody>

                            </tbody>
                        </table>
                    </div>

                    <div class="row">
                        <div id="page_info_area" style="margin-top: 25px" class="col-md-6">

                        </div>

                        <div id="page_nav_area" style=";" class="col-md-6">

                        </div>

                    </div>


                </div>

                </div>
        </div>
    </div>


    <footer class="main-footer">
        <p>by xxh</p>
    </footer>
</div>





<div class="scroll-to-top"><i class="fa fa-chevron-up fa-lg"></i></div>

<script src="${APP_PATH}/static/main/assets/jquery/jquery-3.1.1.min.js"></script>
<script src="${APP_PATH}/static/main/assets/bootstrap/js/bootstrap.min.js"></script>
<script src="${APP_PATH}/static/main/assets/bootstrap-daterangepicker/moment.min.js"></script>
<script src="${APP_PATH}/static/main/assets/bootstrap-daterangepicker/daterangepicker.js"></script>
<script src="${APP_PATH}/static/main/js/main.js"></script>

<script type="text/javascript">
    var id;
    var totalRecord,currentPage;
    $(function () {

        //获取该学生ID
        get_id();

        //清楚form
        reset_form("#serach_form");

        //开始去第一页
        to_page(1)

    })

    function get_id() {
        $.ajax({
            url: "${APP_PATH}/getStu",
            type: "GET",
            async: false,
            data: "studentno=" + ${user.sno},
            success: function (result) {
                id = result.extend.stu.id;

            }
        })
    }

    function to_page(pn) {


        $.ajax({
            url:"${APP_PATH}/get_stuScore",
            async: false,
            data:"pn=" + pn + "&id="+id+"&"+$("#serach_form").serialize(),
            type:"GET",
            success:function (result) {
                // console.log(result);

                //1、解析显示数据
                 build_course_table(result);
                // //2、解析并显示分页信息
                 build_page_info(result,"#page_info_area");
                // //3、解析并显示分页条
                 build_page_nav(result,"#page_nav_area");
            }
        });
    }
    //1、解析显示学生数据
    function build_course_table(result) {
        //清空表格数据
        $("#stuScore_table tbody").empty();

        var courses = result.extend.pageInfo.list;
        $.each(courses,function (index,item) {

            var coursenoTd = $("<td></td>").append(item.course.courseno);
            var coursenameTd = $("<td></td>").append(item.course.coursename);
            var yearTd = $("<td></td>").append(item.year);
            var usualscoreTd = $("<td></td>").append(item.usualscore);
            var finalscoreTd = $("<td></td>").append(item.finalscore);
            var totalscoreTd = $("<td></td>").append(item.totalscore);


            //append方法返回原来
            $("<tr></tr>")
                .append(coursenoTd)
                .append(coursenameTd)
                .append(yearTd)
                .append(usualscoreTd)
                .append(finalscoreTd)
                .append(totalscoreTd)

                .appendTo("#stuScore_table tbody");

        })
    }

    //点击搜索按钮
    $("#search_btn").click(function () {
        to_page(1);
    })
</script>

</body>
</html>