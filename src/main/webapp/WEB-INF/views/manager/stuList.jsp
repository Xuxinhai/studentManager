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


    <div class="padding">
    <ol class="breadcrumb">
        <li><a href="javascript:void(0);" id="firstpage_a">首页</a>
        <li>学生管理</li>
        <li class="active">学生列表</li>
    </ol>
    <div class="box">
        <div class="heading">
            <p class="title" style="font-size: 25px;font-weight: bold;">
                学生列表
            </p>

        </div>

        <div class="box-inner">
            <form id="serach_form" class="form-search " role="form">
                <div class="col-md-2 col-sm-4 col-xs-12">
                    <div class="form-group">
                        <label class="sr-only">学号</label>
                        <input type="text" name="studentno" class="form-control" placeholder="按学号搜索">
                    </div>
                </div>
                <div class="col-md-2 col-sm-4 col-xs-12">
                    <div class="form-group">
                        <label class="sr-only">姓名</label>
                        <input type="text" name="studentname" class="form-control" placeholder="按姓名搜索">
                    </div>
                </div>
                <div class="col-md-2 col-sm-4 col-xs-12">
                    <div class="form-group">
                        <label class="sr-only">专业</label>
                        <%--<input type="text" name="grade" class="form-control" placeholder="按专业搜索">--%>
                        <select class="form-control" name="grade" placeholder="按年级搜索">
                                <option value="" hidden>按年级搜索</option>
                                <option value="1">大一</option>
                                <option value="2">大二</option>
                                <option value="3">大三</option>
                                <option value="4">大四</option>
                        </select>
                    </div>
                </div>
                <div class="col-md-2 col-sm-4 col-xs-12">
                    <div class="form-group">
                        <label class="sr-only">专业</label>
                        <%--<input type="text" name="classno" class="form-control input-daterange" placeholder="按班级搜索">--%>
                        <select id="major_select" class="form-control" name="majorid">

                        </select>
                    </div>
                </div>
                <div class="col-md-2 col-sm-4 col-xs-12">
                    <div class="form-group">
                        <label class="sr-only">班级</label>
                        <%--<input type="text" name="classno" class="form-control input-daterange" placeholder="按班级搜索">--%>
                        <select id="class_select" class="form-control" name="classid">

                        </select>
                    </div>
                </div>

                <button id="search_btn" type="button" class="btn btn-primary pull-right btn-search">搜索</button>
            </form>

            <div class="table-responsive" style="margin-top: 20px;">
                <table id="stus_table" class="table table-striped table-bordered table-hover">
                    <thead>
                    <tr>
                        <th>学号</th>
                        <th>姓名</th>
                        <th>性别</th>
                        <th>专业</th>
                        <th>年级</th>
                        <th>班级</th>
                        <th>年龄</th>
                        <th>联系电话</th>
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








<div class="scroll-to-top"><i class="fa fa-chevron-up fa-lg"></i></div>

<%--<script src="${APP_PATH}/static/main/assets/jquery/jquery-3.1.1.min.js"></script>--%>
<%--<script src="${APP_PATH}/static/main/assets/bootstrap/js/bootstrap.min.js"></script>--%>
<%--<script src="${APP_PATH}/static/main/assets/bootstrap-daterangepicker/moment.min.js"></script>--%>
<%--<script src="${APP_PATH}/static/main/assets/bootstrap-daterangepicker/daterangepicker.js"></script>--%>
<%--<script src="${APP_PATH}/static/main/js/main.js"></script>--%>

<script type="text/javascript">
    $(function () {
        //获取所有专业显示在下拉框中
        get_allMajor("#major_select","${APP_PATH}/get_majors");
        ////获取所有班级显示在下拉框中
        get_allClass("#class_select","${APP_PATH}/get_classes");

        to_page(1);
    })


    function to_page(pn) {

        var majorid = $("#major_select").attr("value");
        var data = "pn="+pn+"&"+$("#serach_form").serialize();
        // alert(data);
        $.ajax({
            url:"${APP_PATH}/get_allStu",
            data: data,
            type:"GET",
            success:function (result) {
                // console.log(result);
                // 1、解析显示员工数据
                build_stus_table(result);
                // //2、解析并显示分页信息
                build_page_info(result,"#page_info_area");
                // //3、解析并显示分页条
                build_page_nav(result,"#page_nav_area");
            }
        });
    }

    //1、解析显示学生数据
    function build_stus_table(result) {
        //清空表格数据
        $("#stus_table tbody").empty();

        var courses = result.extend.pageInfo.list;
        $.each(courses,function (index,item) {

            var studentnoTd = $("<td></td>").append(item.studentno);
            var studentname = $("<td></td>").append(item.studentname);
            var sexTd = $("<td></td>").append(item.sex=='1'?'男':'女');
            var majorTd = $("<td></td>").append(item.stuclass.major.majorname);

            var grade = "大一";
            if(item.grade==2) grade = "大二";
            if(item.grade==3) grade = "大三";
            if(item.grade==4) grade = "大四";
            var gradeTd = $("<td></td>").append(grade)

            var classTd = $("<td></td>").append(item.stuclass.classno);
            var ageTd = $("<td></td>").append(item.age);
            var phoneTd = $("<td></td>").append(item.phone);



            //append方法返回原来
            $("<tr></tr>").append(studentnoTd)
                .append(studentname)
                .append(sexTd)
                .append(majorTd)
                .append(gradeTd)
                .append(classTd)
                .append(ageTd)
                .append(phoneTd)
                .appendTo("#stus_table tbody");

        })
    }

    //点击搜索按钮
    $(document).on("click","#search_btn",function () {
        to_page(1);
    })

    //到首页
    $(document).on("click","#firstpage_a",function () {
        to_firstpage($("#content_div"),"${APP_PATH}/toManMain");
    })

</script>
</body>
</html>