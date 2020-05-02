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
        <li>班级管理</li>
        <li class="active">班级列表</li>
    </ol>
    <div class="box">
        <div class="heading">
            <p class="title" style="font-size: 25px;font-weight: bold;">
                班级列表
            </p>

        </div>

        <div class="box-inner">
            <!--按钮-->
            <div >
                <button class="btn btn-primary" id="class_add_modal_btn">新增班级</button>

            </div>
            <div class="table-responsive col-md-8 col-md-offset-1" style="margin-top: 20px;">

                <table id="class_table" class="table table-striped table-bordered table-hover"
                       style="margin-top: 10px">
                   <thead>
                    <tr>
                        <th>#</th>
                        <th>班级号</th>
                        <th>专业</th>
                        <th>班主任</th>
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

    <!--班级添加-->
    <!-- Modal -->
    <div class="modal fade" id="classAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">班级添加</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal">
                        <div class="form-group">
                            <label class="col-sm-3 control-label">班级号</label>
                            <div class="col-sm-6">
                                <input type="text" name="classno" class="form-control" id="classno_add_input">
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">专业</label>
                            <div class="col-sm-6">
                                <select id="add_major_select" class="form-control" name="majorid">

                                </select>
                                <span class="help-block"></span>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">班主任</label>
                            <div class="col-sm-6">

                                <select id="add_teacher_select" class="form-control" name="teacherid">

                                </select>
                                <span class="help-block"></span>
                            </div>
                        </div>

                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" id="class_save_btn">保存</button>
                </div>
            </div>
        </div>
    </div>

    <%--更换班主任--%>
    <div class="modal fade" id="teacherUpdModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">更换班主任</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal">
                        <div class="form-group">
                            <label class="col-sm-3 control-label">班主任</label>
                            <div class="col-sm-6">

                                <select id="upd_teacher_select" class="form-control" name="teacherid">

                                </select>
                                <span class="help-block"></span>
                            </div>
                        </div>

                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" id="class_upd_btn">更新</button>
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

        $.ajax({
            url:"${APP_PATH}/get_allClass",
            data:"pn="+pn,
            type:"GET",
            success:function (result) {
                console.log(result);
                // 1、解析显示员工数据
                build_classList_table(result);
                //2、解析并显示分页信息
                build_page_info(result,"#page_info_area");
                // //3、解析并显示分页条
                build_page_nav(result,"#page_nav_area");
            }
        });
    }

    //1、解析显示数据
    function build_classList_table(result) {
        //清空表格数据
        $("#class_table tbody").empty();

        var majors = result.extend.pageInfo.list;
        $.each(majors,function (index,item) {

            var idTd = $("<td></td>");
            var classnoTd = $("<td></td>").append(item.classno);
            var majornameTd = $("<td></td>").append(item.major.majorname);
            var teachernameTd = $("<td></td>").append(item.teacher.teachername);

            var editBtn = $("<button class='btn btn-primary btn-sm  edit_btn' style='margin-left:30px'></button>")
                .append($("<span class='glyphicon glyphicon-pencil'></span>").append("更换班主任"));
            //为编辑按钮添加自定义的属性，表示当前员工的id
            editBtn.attr("edit-id",item.id);

            var delBtn = $("<button style='margin-left:20px'></button>")
                .addClass("btn btn-danger btn-sm delete_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-trash ").append("删除"));
            delBtn.attr("del-id",item.id);

            var btnTd = $("<td ></td>").append(editBtn).append(delBtn);

            // var editBtn = $("<button class='btn btn-primary btn-sm  edit_btn'></button>")
            //     .append($("<span class='glyphicon glyphicon-pencil'></span>").append("编辑"));


            //append方法返回原来
            $("<tr></tr>")
                .append(idTd)
                .append(classnoTd)
                .append(majornameTd)
                .append(teachernameTd)
                .append(btnTd)

                .appendTo("#class_table tbody");

        })
    }



    //点击新增按钮
    $(document).on("click","#class_add_modal_btn",function () {
        // //清除表单数据（表单重置:表单数据，样式）
        reset_form("#classAddModal form");
        //获取专业信息显示在下拉框中
        get_allMajor("#add_major_select","${APP_PATH}/get_majors")

        //获取教师信息显示在下拉框中
        get_allTeacher("#add_teacher_select","${APP_PATH}/get_teachers");

        //弹出
        $("#classAddModal").modal({
            backdrop:"static"
        });
    })

    //点击保存按钮
    $(document).on("click","#class_save_btn",function () {

        $.confirm({
            title: '确认信息',
            content: '确认添加班级吗？',
            buttons: {
                ok: {
                    text: "确认",
                    btnClass: 'btn-primary',
                    keys: ['enter'],
                    action: function(){
                        save_class();
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




    function validate_add_form() {
        //校验班级号信息
        var classno = $("#classno_add_input").val();
        if(classno=="" || classno==null){
            show_validate_msg("#classno_add_input","error","班级号不能为空");
            return false;
        } else {
            show_validate_msg("#classno_add_input","success","");
        }

        //校验专业名信息
        var major = $("#add_major_select").val();
        if(major == null || major == "") {
            my_alert("error","请选择专业","red");
            return false;
        } else {
            show_validate_msg("#add_major_select","success","");
        }

        //校验教师信息
        var teacher = $("#add_teacher_select").val();
        if(teacher==null || teacher == "") {
            my_alert("error","请选择教师","red");
        } else {
            show_validate_msg("#add_teacher_select","success","");
        }

        return true;
    }

    //添加班级
    function save_class() {

        //校验表单信息
        if(!validate_add_form()){
            return false;
        }

        $.ajax({
            url: "${APP_PATH}/ins_class",
            type:"GET",
            data : $("#classAddModal form").serialize(),
            success: function (result) {
                if(result.code == 100) {
                    $.alert({
                        title: "success",
                        content: "添加班级成功！",
                        type:"green",
                        buttons: {
                            ok: {
                                text: "确认",
                                btnClass: 'btn-primary',
                                action: function(){
                                    window.location.reload();                                }
                            }
                        }
                    })

                } else {
                    my_alert("error",result.extend.msg,"red");
                }
            }
        })
    }



    //点击删除按钮
    $(document).on("click",".delete_btn",function () {
        var id = $(this).attr("del-id");
        $.confirm({
            title: '确认信息',
            content: '确认删除该班级吗？',
            buttons: {
                ok: {
                    text: "确认",
                    btnClass: 'btn-primary',
                    keys: ['enter'],
                    action: function(){
                        del_class(id);
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

    function del_class(id) {
        $.ajax({
            url:"${APP_PATH}/del_class",
            typw:"GET",
            data:"id="+id,
            success: function (result) {
                if(result.code == 100) {
                    $.alert({
                        title:"success",
                        type: "green",
                        content:"删除班级成功",
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

    //点击更换按钮
    $(document).on("click",".edit_btn",function () {
        //alert(1);
        // //清除表单数据（表单重置:表单数据，样式）
        reset_form("#teacherUpdModal form");

        //获取教师信息显示在下拉框中
        get_allTeacher("#upd_teacher_select","${APP_PATH}/get_teachers");

        $("#class_upd_btn").attr("classid",$(this).attr("edit-id"));

        //弹出
        $("#teacherUpdModal").modal({
            backdrop:"static"
        });
    })

    //点击更新按钮
    $(document).on("click","#class_upd_btn",function () {

        var id= $(this).attr("classid");

        $.confirm({
            title: '确认信息',
            content: '确认更新该班级吗？',
            buttons: {
                ok: {
                    text: "确认",
                    btnClass: 'btn-primary',
                    keys: ['enter'],
                    action: function(){
                        upd_class(id);
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

    function upd_class(id) {

        //校验教师信息
        var teacherid = $("#upd_teacher_select").val();
        if(teacherid==null || teacherid == "") {
            my_alert("error","请选择教师","red");
            return false;
        } else {
            show_validate_msg("#add_teacher_select","success","");
        }
        $.ajax({
            url: "${APP_PATH}/upd_class",
            type: "GET",
            data: "id="+id+"&"+"teacherid="+teacherid,
            success:function (result) {
                if(result.code==100) {
                    $.alert({
                        title:"success",
                        type: "green",
                        content:"更新班级信息成功",
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
                    my_alert("error","更新班级信息失败","red");
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