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
                        <button id="alterUserInfo_btn" type="button" class="btn btn-primary"
                                data-toggle="tooltip" data-placement="right"data-toggle="tooltip" data-placement="right"
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

<%--<script src="${APP_PATH}/static/main/assets/jquery/jquery-3.1.1.min.js"></script>--%>
<%--<script src="${APP_PATH}/static/main/assets/bootstrap/js/bootstrap.min.js"></script>--%>
<%--<script src="${APP_PATH}/static/main/assets/bootstrap-daterangepicker/moment.min.js"></script>--%>
<%--<script src="${APP_PATH}/static/main/assets/bootstrap-daterangepicker/daterangepicker.js"></script>--%>
<%--<script src="${APP_PATH}/static/main/js/main.js"></script>--%>

<script type="text/javascript">



    $(document).on("click","#alterUserInfo_btn",function () {
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



    $(document).on("click","#user_update_btn",function () {


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
                    <%--alert($("#content_div").attr("get_page"));--%>
                    $("#content_div").load("${APP_PATH}/toManUserInfo");
                } else {
                    alert("更新失败");
                }
            }

        })
    })

    //到首页
    $(document).on("click","#firstpage_a",function () {
        to_firstpage($("#content_div"),"${APP_PATH}/toManMain");
    })

</script>
</body>
</html>