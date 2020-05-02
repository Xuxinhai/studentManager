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
    <script src="https://cdn.bootcss.com/jquery-confirm/3.3.4/jquery-confirm.min.js"></script>

    <style type="text/css">


    </style>
</head>
<body>

    <div class="padding">
    <ol class="breadcrumb">
        <li><a href="javascript:void(0);" id="firstpage_a">首页</a>
        <li>学生管理</li>
        <li class="active">教师列表</li>
    </ol>
    <div class="box">
        <div class="heading">
            <p class="title" style="font-size: 25px;font-weight: bold;">
                教师列表
            </p>

        </div>

        <div class="box-inner">
            <form id="serach_form" class="form-search " role="form">
                <div class="col-md-2 col-sm-4 col-xs-12">
                    <div class="form-group">
                        <label class="sr-only">教工号</label>
                        <input type="text" name="teacherno" class="form-control" placeholder="按教工号搜索">
                    </div>
                </div>
                <div class="col-md-2 col-sm-4 col-xs-12">
                    <div class="form-group">
                        <label class="sr-only">教师姓名</label>
                        <input type="text" name="teachername" class="form-control" placeholder="按教师姓名搜索">
                    </div>
                </div>
                <button id="search_btn" type="button" class="btn btn-primary pull-right btn-search">搜索</button>
            </form>

            <div class="table-responsive" style="margin-top: 20px;">
                <table id="teas_table" class="table table-striped table-bordered table-hover" style="margin-top: 10px">
                   <thead>
                    <tr>
                        <th>教工号</th>
                        <th>姓名</th>
                        <th>性别</th>
                        <th>年龄</th>
                        <th>联系方式</th>
                        <th>操作</th>
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




    <!--教师更新-->
    <!-- Modal -->
    <div class="modal fade" id="teaUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" >教师信息更新</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" id="update_form">
                        <div class="form-group">
                            <label class="col-sm-3 control-label">教工号</label>
                            <div class="col-sm-6">
                                <p class="form-control-static" id="teacherno_update_static"></p>
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">姓名</label>
                            <div class="col-sm-6">
                                <p class="form-control-static" id="teachername_update_static"></p>
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">年龄</label>
                            <div class="col-sm-6">
                                <input type="text" name="age" class="form-control" id="age_update_input">
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">联系电话</label>
                            <div class="col-sm-6">
                                <input type="text" name="phone" class="form-control" id="phone_update_input">
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


                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" id="tea_update_btn">更新</button>
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
        to_page(1);
    })



    function to_page(pn) {

        var data = "pn="+pn+"&"+$("#serach_form").serialize();
        // alert(data);
        $.ajax({
            url:"${APP_PATH}/get_allTea",
            data: data,
            type:"GET",
            success:function (result) {
                //console.log(result);
                // 1、解析显示员工数据
                build_tealist_table(result);
                // //2、解析并显示分页信息
                build_page_info(result,"#page_info_area");
                // //3、解析并显示分页条
                build_page_nav(result,"#page_nav_area");
            }
        });
    }

    //1、解析显示学生数据
    function build_tealist_table(result) {
        //清空表格数据
        $("#teas_table tbody").empty();

        var teas = result.extend.pageInfo.list;
        $.each(teas,function (index,item) {

            var teachernoTd = $("<td></td>").append(item.teacherno);
            var teachername = $("<td></td>").append(item.teachername);
            var sexTd = $("<td></td>").append(item.sex=='1'?'男':'女');
            var ageTd = $("<td></td>").append(item.age);
            var phoneTd = $("<td></td>").append(item.phone);

            var editBtn = $("<button class='btn btn-primary btn-sm  edit_btn' style='margin-left:30px'></button>")
                .append($("<span class='glyphicon glyphicon-pencil'></span>").append("编辑"));
            //为编辑按钮添加自定义的属性，表示当前员工的id
            editBtn.attr("edit-id",item.id);

            var delBtn = $("<button style='margin-left:20px'></button>")
                .addClass("btn btn-danger btn-sm delete_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-trash ").append("删除"));
            delBtn.attr("del-id",item.id);

            var btnTd = $("<td ></td>").append(editBtn).append("").append(delBtn);

            // var editBtn = $("<button class='btn btn-primary btn-sm  edit_btn'></button>")
            //     .append($("<span class='glyphicon glyphicon-pencil'></span>").append("编辑"));


            //append方法返回原来
            $("<tr></tr>")
                .append(teachernoTd)
                .append(teachername)
                .append(sexTd)
                .append(ageTd)
                .append(phoneTd)
                .append(btnTd)

                .appendTo("#teas_table tbody");

        })
    }





    function validate_add_form() {
        //校验学号信息
        var sno = $("#studentno_add_input").val();
        var regSno = /^[\d]{10}$/;
        if(!regSno.test(sno)){
            show_validate_msg("#studentno_add_input","error","学号为10位数字");
            return false;
        } else {
            show_validate_msg("#studentno_add_input","success","");
        }

        //校验姓名信息
        var studentname = $("#studentname_add_input").val();
        if(studentname == null || studentname == "") {
            show_validate_msg("#studentname_add_input","error","姓名不能为空");
            return false;
        } else {
            show_validate_msg("#studentname_add_input","success","");
        }

        //校验年级
        var grade = $("#grade_add_select").val();
        if(grade == null || grade == "") {
            my_alert("error","请选择年级","red");
            return false;
        } else {

        }

        //校验班级
        var stuclass = $("#ins_class_select").val();
        if(stuclass == null || stuclass == "") {
            my_alert("error","请选择班级","red");
            return false;
        } else {

        }

        return true;
    }



    //点击编辑按钮
    $(document).on("click",".edit_btn",function () {

        //查出学生信息信息
        getTea($(this).attr("edit-id"));


        //将学生id放在更新按钮中
        $("#tea_update_btn").attr("edit-id",$(this).attr("edit-id"));

        //弹出更新模态框
        $("#teaUpdateModal").modal({
            backdrop:"static"
        })
    })

    //获取学生的信息
    function getTea(id) {
        $.ajax({
            url: "${APP_PATH}/get_tea",
            type: "GET",
            async: false,
            data: "id="+id,
            success: function (result) {
                if(result.code == 100) {
                    var tea = result.extend.tea;
                    $("#teacherno_update_static").text(tea.teacherno);
                    $("#teachername_update_static").text(tea.teachername);
                    $("#phone_update_input").val(tea.phone);
                    $("#age_update_input").val(tea.age);
                    $("#teaUpdateModal input[name='sex']").val([tea.sex]);
                } else {
                    my_alert("error","fail!","red");
                }
            }
        })
    }

    //点击更新按钮
    $(document).on("click","#tea_update_btn",function () {
        var id = $(this).attr("edit-id");

        $.confirm({
            title: '确认信息',
            content: '确认更新教师信息吗？',
            buttons: {
                ok: {
                    text: "确认",
                    btnClass: 'btn-primary',
                    keys: ['enter'],
                    action: function(){
                        update_tea(id);
                    }
                },
                cancel: {
                    text:"取消",
                    action: function(){
                    }
                }
            }
        });
    })

    function update_tea(id) {
        $.ajax({
            url:"${APP_PATH}/upd_tea",
            type:"GET",
            data:"id="+id+"&"+ $("#update_form").serialize(),
            success:function (result) {
                if(result.code == 100) {
                    $.alert({
                        title:"success",
                        type: "green",
                        content:"更新教师信息成功",
                        buttons:{
                            ok:{
                                text: "确认",
                                action: function () {
                                    window.location.reload();
                                }
                            }
                        }
                    })

                } else {
                    my_alert("error","更新教师信息失败！","red");
                }
            }
        })
    }


    //点击删除按钮
    $(document).on("click",".delete_btn",function () {
        var id = $(this).attr("del-id");
        $.confirm({
            title: '确认信息',
            content: '确认删除该教师吗？',
            buttons: {
                ok: {
                    text: "确认",
                    btnClass: 'btn-primary',
                    keys: ['enter'],
                    action: function(){

                        del_tea(id);
                    }
                },
                cancel: {
                    text:"取消",
                    action: function(){
                    }
                }
            }
        });
    })

    function del_tea(id) {
        $.ajax({
            url:"${APP_PATH}/del_tea",
            typw:"GET",
            data:"id="+id,
            success: function (result) {
                if(result.code == 100) {
                    $.alert({
                        title:"success",
                        type: "green",
                        content:"删除教师信息成功",
                        buttons:{
                            ok:{
                                text: "确认",
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