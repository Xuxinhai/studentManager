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
            <li><a href="javascript:void(0);" id="firstpage_a">首页</a></li>
            <%--<li>导航2</li>--%>
            <%--<li class="active">导航3</li>--%>
        </ol>
        <div class="box">
            <div class="heading">
                <p class="title" style="font-size: 25px;font-weight: bolder;color: cornflowerblue">
                    欢迎用户&nbsp; ${user.username}&nbsp;登录系统
                </p>

            </div>

            <div class="box-inner">
                <div  class="col-md-6" style="margin-top: 30px;margin-bottom: 100px">
                    <table id="userinfo_table" class="table table-hover table-bordered table-striped" style="font-size: 15px;font-weight: bold">
                        <tr>
                            <td style="width: 30%">开发人员</td>
                            <td>徐昕海</td>
                        </tr>
                        <tr>
                            <td style="width: 30%">开发时间</td>
                            <td>2020.2.12</td>
                        </tr>
                        <tr>
                            <td style="width: 30%">开发工具</td>
                            <td>intellij idea </td>
                        </tr>
                        <tr>
                            <td style="width: 30%">系统环境</td>
                            <td>windows10</td>
                        </tr>
                        <tr>
                            <td style="width: 30%">java版本</td>
                            <td>jdk11</td>
                        </tr>
                        <tr>
                            <td style="width: 30%">服务器</td>
                            <td>tomcat8.5.3</td>
                        </tr>
                        <tr>
                            <td style="width: 30%">数据库</td>
                            <td>mysql+navicat</td>
                        </tr>
                        <tr>
                            <td style="width: 30%">系统采用技术</td>
                            <td>bootstrap+jquery+ssm</td>
                        </tr>
                    </table>
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
    $(document).on("click","#firstpage_a",function () {
        to_firstpage($("#content_div"),"${APP_PATH}/toManMain");
    })

</script>


</body>
</html>