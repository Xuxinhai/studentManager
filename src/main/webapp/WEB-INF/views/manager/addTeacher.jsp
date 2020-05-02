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

    <link href="https://cdn.bootcss.com/jquery-confirm/3.3.4/jquery-confirm.min.css" rel="stylesheet">
    <script src="https://cdn.bootcss.com/jquery-confirm/3.3.4/jquery-confirm.min.js"></script

    <style type="text/css">


    </style>
</head>
<body>


    <div class="padding">
            <ol class="breadcrumb">
                <li><a href="javascript:void(0);" id="firstpage_a">首页</a>
                <li>教师管理</li>
                <li class="active">添加教师</li>
            </ol>
            <div class="box">
                <div class="heading">
                    <p class="title" style="font-size: 25px;font-weight: bold;">
                        添加教师
                    </p>

                </div>

                <div class="box-inner">
                    <div class="col-md-6 col-md-offset-3" style="margin-bottom: 60px">
                        <div class="panel panel-primary">
                            <div class="panel-heading ">
                                <h3 class="panel-title">添加教师</h3>
                            </div>
                            <div class="panel-body">
                                <form id="addTeacher_form" class="form-horizontal">
                                    <div class="form-group" style="margin-top: 15px">
                                        <label class="col-sm-3 control-label">教工号</label>
                                        <div class="col-sm-6">
                                            <input type="text" name="teacherno" class="form-control" id="teacherno_input">
                                            <span class="help-block"></span>
                                        </div>
                                    </div>
                                    <div class="form-group" style="margin-top: 15px">
                                        <label class="col-sm-3 control-label">教师姓名</label>
                                        <div class="col-sm-6">
                                            <input type="text" name="teachername" class="form-control" id="teachername_input">
                                            <span class="help-block"></span>
                                        </div>
                                    </div>

                                    <div class="form-group" style="margin-top: 15px">
                                        <label class="col-sm-3 control-label">年龄</label>
                                        <div class="col-sm-6">
                                            <input type="text" name="age" class="form-control" id="age_input">
                                            <span class="help-block"></span>
                                        </div>
                                    </div>

                                    <div class="form-group" style="margin-top: 15px">
                                        <label class="col-sm-3 control-label">联系方式</label>
                                        <div class="col-sm-6">
                                            <input type="text" name="phone" class="form-control" id="phone_input">
                                            <span class="help-block"></span>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">性别</label>
                                        <div class="col-sm-6">
                                            <div class="radio" style="float: left;margin-left: 20px">>
                                                <input type="radio" name="sex" id="sex1_update_input" value="1" checked>男
                                            </div>
                                            <div class="radio" style="float: left;margin-left: 60px">
                                                <input type="radio" name="sex" id="sex2_update_input" value="2">女
                                            </div>

                                        </div>
                                    </div>


                                    <div class="form-group" style="margin-top: 20px;">
                                        <div class="col-sm-offset-3 col-sm-8">
                                            <button id="addTeacher_btn" type="button" class="btn btn-primary">提交</button>
                                        </div>
                                    </div>

                                </form>
                            </div>

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
        reset_form("#addTeacher_form");
    })


    function validate_addTeacher_form(){

        //校验教工号
        var teacherno = $("#teacherno_input").val();

        if(teacherno==""||teacherno==null) {

            my_alert("error","教工号不能为空","red");
            return false;
        } else {
            show_validate_msg("#teacherno_input","success","");
        }

        //检验姓名
        var teachername = $("#teachername_input").val();
    //    alert(teachername);
        if(teachername==""||teachername==null){

            my_alert("error","姓名不能为空","red");
            return false;
        } else {
            show_validate_msg("#teachername_input","success","");
        }

        return true;
    }

    //点击提交按钮
    $(document).on("click","#addTeacher_btn",function () {

        //校验密码信息
        if (!validate_addTeacher_form()) {
            return false;
        }
    //    alert(1);

        //
        $.confirm({
            title: '确认信息',
            content: '确认添加教师吗？',
            buttons: {
                ok: {
                    text: "确认",
                    btnClass: 'btn-primary',
                    keys: ['enter'],
                    action: function () {
                        add_tea();
                    }
                },
                cancel: {
                    text: "取消",
                    action: function () {
                    }
                }
            }


        })
    })

    function add_tea() {
        $.ajax({
            url:"${APP_PATH}/add_tea",
            type:"GET",
            data:$("#addTeacher_form").serialize(),
            success:function (result) {
                if(result.code==100){
                    $.alert({
                        title:"success",
                        content:"添加教师信息成功",
                        type:"green",
                        buttons:{
                            ok:{
                                text:"确认",
                                action: function () {
                                    window.location.reload();
                                }

                            }
                        }
                    })
                }
            }
        })
    }

    //到首页
    $(document).on("click","#firstpage_a",function () {
        to_firstpage($("#content_div"),"${APP_PATH}/toManMain");
    })

</script>
</body>
</html>