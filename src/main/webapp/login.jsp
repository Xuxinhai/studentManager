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
    <style type="text/css">

        #backgroundDiv{
            background: url(${APP_PATH}/static/images/background.gif);
            /*background-color: cornflowerblue;*/
        }
        #loginDiv{

        }

        #loginRightDiv{
            background-color: white;
            height: 70%;
            padding-top: 25px;
            border-radius: 10px;
            height: 90%;
            width: 20%;
            margin: 0px auto;
            padding: 50px 30px;
        }
        #loginLeftDiv{
            background: url(${APP_PATH}/static/images/loingImage.jpg);
            /*border: solid 1px red;*/
            height: 70%;
            /*border-radius: 10px*/
        }

        #loginRightDiv div{

        }
    </style>

    <script type="text/javascript">
        $(function () {
            // $("#errorMsg").empty();
        })
    </script>
</head>
<body style="min-height: 40%;min-width: 40%">

<nav class="navbar navbar-default" style="background-color: #286090;margin: 0px;height: 10%;width: 100%">
    <div class="container-fluid" >
        <div class="navbar-header" >
            <p class="navbar-text" style="font-size: 20px;color: white">欢迎登陆后台管理界面平台</p>
        </div>
    </div>
</nav>



<div id = backgroundDiv style="margin-top:0px;height: 80%;">
    <%--<div style="padding-top: 30px;text-align: center;;height: 25%">--%>
        <%--<p style="font-size: 35px;color: midnightblue">学生信息管理</p>--%>
    <%--</div>--%>
    <div class="row" id="loginDiv" style="height: 75%;">
        <%--<div id = "loginLeftDiv" class="col-md-2 col-md-offset-5"></div>--%>

        <div id = "loginRightDiv" class="" style="margin-top: 80px;">
            <c:if test="${error != null}">
                <p id="errorMsg" style="font-size: 20px;color: red">
                        ${error}
                </p>
            </c:if>
            <% session.removeAttribute("error");%>

            <form  action="login" method="post">

                <div class="form-group row" style="margin-top: 10px">
                    <%--<label for="username" style="">用户名</label>--%>
                    <div class="col-xs-2">
                        <img src="${APP_PATH}/static/images/username.png" class="img-rounded" >
                    </div>

                    <div class="col-xs-10">
                        <input type="text" name="username" class="form-control" id="username" placeholder="Admin">
                    </div>

                </div>
                <div class="form-group row" style="margin-top: 35px">
                    <%--<label for="password">密码</label>--%>
                    <div class="col-xs-2">
                        <img src="${APP_PATH}/static/images/password.png" class="img-rounded" >
                    </div>
                    <div class="col-xs-10">
                        <input type="password" name="password"class="form-control" id="password" placeholder="Password">
                    </div>


                </div>
                <div class="form-group" style="margin-top: 25px">
                    <label for="password">验证码</label>
                    <input type="text" size="4" name="validcode" />
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <img id = "validImage"  src="get_cpacha?vl=4&type=loginCpacha" width="90" height="40"
                         title="点击切换验证码" style="cursor: pointer" onclick="changeCpacha()"/>


                </div>
                <div class="form-group" style="margin-top: 20px">
                    <button  id="login-btn"  class="btn btn-danger"  type="submit" style="margin-left: 40px">登录</button>
                    <button id="reg-btn" class="btn btn-danger" type="button" style="margin-right: 40px;float: right">注册</button>
                </div>




            </form>
        </div>
    </div>
</div>





<footer style="height: 10%;text-align: center;background-color: black" >
    <br/>
    <p style="color: white;font-size: 15px">webwork 2019 12 17 by 徐昕海</p>
</footer>

<script type="text/javascript">
    $(function () {
        $("#loginRightDiv input:eq(0)").val("");
        $("#loginRightDiv input:eq(1)").val("");
        $("#loginRightDiv input:eq(2)").val("");
    })

    function changeCpacha(){

        $("#validImage").attr("src","get_cpacha?vl=4&type=loginCpacha&t="+new Date().getTime());
    }

    $("#login-btn").click(function () {
        var username = $("#loginRightDiv input:eq(0)").val();
        var password = $("#loginRightDiv input:eq(1)").val();
        var cpacha = $("#loginRightDiv input:eq(2)").val();

        if(username =="" || username == "undefined") {
            alert("请填写用户名！");
            return false;
        }
        if(password =="" || password == "undefined") {
            alert("请填写密码！");
            return false;
        }
        if(cpacha =="" || cpacha == "undefined") {
            alert("请填写验证码！");
            return false;
        }

        <%--$.ajax({--%>
            <%--url:"${APP_PATH}/login",--%>
            <%--type:"POST",--%>
            <%--data: $("#loginRightDiv form").serialize(),--%>

        <%--});--%>
        //alert(username);
    })

    //点击注册跳转
    $("#reg-btn").click(function () {
        window.location.href = "${APP_PATH}/reg.jsp";
        //window.location.href = "${APP_PATH}/index.jsp";
        // alert("reg");
        <%--$.ajax({--%>
        <%--url:"${APP_PATH}/toreg",--%>
        <%--type:"POST",--%>
        <%--success:function(data){--%>
        <%--alert(data);--%>
        <%--}--%>
        <%--})--%>
    })



</script>
</body>
</html>
