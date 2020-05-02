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











<div class="scroll-to-top"><i class="fa fa-chevron-up fa-lg"></i></div>

<%--<script src="${APP_PATH}/static/main/assets/jquery/jquery-3.1.1.min.js"></script>--%>
<%--<script src="${APP_PATH}/static/main/assets/bootstrap/js/bootstrap.min.js"></script>--%>
<%--<script src="${APP_PATH}/static/main/assets/bootstrap-daterangepicker/moment.min.js"></script>--%>
<%--<script src="${APP_PATH}/static/main/assets/bootstrap-daterangepicker/daterangepicker.js"></script>--%>
<%--<script src="${APP_PATH}/static/main/js/main.js"></script>--%>

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

    $(document).on("click","#password_alter_btn",function () {
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
                        $("#content_div").load("${APP_PATH}/toManUserInfo");
                    } else {
                        alter("修改密码失败，请重试！");
                        window.location.href="${APP_PATH}/toAlterPassword";
                    }
                }
            })
        }


    })

    //到首页
    $(document).on("click","#firstpage_a",function () {
        to_firstpage($("#content_div"),"${APP_PATH}/toManMain");
    })

</script>
</body>
</html>