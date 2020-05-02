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
        <li>课程管理</li>
        <li class="active">学生课程列表</li>
    </ol>
    <div class="box">
        <div class="heading">
            <p class="title" style="font-size: 25px;font-weight: bold;">
                学生课程列表
            </p>

        </div>

        <div class="box-inner">
            <!--按钮-->
            <div >
                <button class="btn btn-primary" id="course_add_modal_btn">新增课程</button>

            </div>
            <div class="table-responsive col-md-8 col-md-offset-1" style="margin-top: 20px;">

                <table id="courses_table" class="table table-striped table-bordered table-hover"
                       style="margin-top: 10px">
                   <thead>
                    <tr>
                        <th>#</th>
                        <th>课程号</th>
                        <th>课程名</th>
                        <th>学时</th>
                        <th>任课教师</th>
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

    <!--专业添加-->
    <!-- Modal -->
    <div class="modal fade" id="courseAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" >课程添加</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal">
                        <div class="form-group">
                            <label class="col-sm-3 control-label">课程号</label>
                            <div class="col-sm-6">
                                <input type="text" name="courseno" class="form-control" id="courseno_add_input">
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">课程名</label>
                            <div class="col-sm-6">
                                <input type="text" name="coursename" class="form-control" id="coursename_add_input">
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">学时</label>
                            <div class="col-sm-6">
                                <input type="text" name="time" class="form-control" id="time_add_input">
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">任课教师</label>
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
                    <button type="button" class="btn btn-primary" id="course_save_btn">保存</button>
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
            url:"${APP_PATH}/get_allCourse",
            data:"pn="+pn,
            type:"GET",
            success:function (result) {
                console.log(result);
                // 1、解析显示员工数据
                build_courseList_table(result);
                //2、解析并显示分页信息
                build_page_info(result,"#page_info_area");
                // //3、解析并显示分页条
                build_page_nav(result,"#page_nav_area");
            }
        });
    }

    //1、解析显示数据
    function build_courseList_table(result) {
        //清空表格数据
        $("#courses_table tbody").empty();

        var courses = result.extend.pageInfo.list;
        $.each(courses,function (index,item) {

            var idTd = $("<td></td>");
            var coursenoTd = $("<td></td>").append(item.courseno);
            var coursenameTd = $("<td></td>").append(item.coursename);
            var timeTd = $("<td></td>").append(item.time);
            var teacherTd = $("<td></td>").append(item.teacher.teachername);


            var delBtn = $("<button style='margin-left:20px'></button>")
                .addClass("btn btn-danger btn-sm course_delete_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-trash ").append("删除"));
            delBtn.attr("del-id",item.id);

            var btnTd = $("<td ></td>").append(delBtn);

            // var editBtn = $("<button class='btn btn-primary btn-sm  edit_btn'></button>")
            //     .append($("<span class='glyphicon glyphicon-pencil'></span>").append("编辑"));


            //append方法返回原来
            $("<tr></tr>")
                .append(idTd)
                .append(coursenoTd)
                .append(coursenameTd)
                .append(timeTd)
                .append(teacherTd)
                .append(btnTd)

                .appendTo("#courses_table tbody");

        })
    }



    //点击新增按钮
    $(document).on("click","#course_add_modal_btn",function () {
        // //清除表单数据（表单重置:表单数据，样式）
        reset_form("#courseAddModal form");

        //教师下拉框
        get_allTeacher("#add_teacher_select","${APP_PATH}/get_teachers");

        //弹出
        $("#courseAddModal").modal({
            backdrop:"static"
        });
    })

    //点击保存按钮
    $(document).on("click","#course_save_btn",function () {

        $.confirm({
            title: '确认信息',
            content: '确认添加课程吗？',
            buttons: {
                ok: {
                    text: "确认",
                    btnClass: 'btn-primary',
                    keys: ['enter'],
                    action: function(){
                        save_course();
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
        var courseno = $("#courseno_add_input").val();
        if(courseno=="" || courseno==null){
            show_validate_msg("#courseno_add_input","error","课程号不能为空");
            return false;
        } else {
            show_validate_msg("#courseno_add_input","success","");
        }

        var coursename = $("#coursename_add_input").val();
        if(coursename == null || coursename == "") {
            show_validate_msg("#coursename_add_input","error","课程名不能为空");
            return false;
        } else {
            show_validate_msg("#coursename_add_input","success","");
        }

        var time = $("#time_add_input").val();
        if(time == null || time == "") {
            show_validate_msg("#time_add_input","error","课程学时不能为空");
            return false;
        } else {
            show_validate_msg("#time_add_input","success","");
        }

        var teacherid = $("#courseAddModal select").val();
        if(teacherid == null || teacherid == "") {
            my_alert("error","请选择任课教师","red");
            return false;
        } else {

        }
        return true;
    }

    //添加学生
    function save_course() {

        //校验表单信息
        if(!validate_add_form()){
            return false;
        }

        $.ajax({
            url: "${APP_PATH}/ins_course",
            type:"GET",
            data : $("#courseAddModal form").serialize(),
            success: function (result) {
                if(result.code == 100) {
                    $.alert({
                        title: "success",
                        content: "添加成功！",
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
    $(document).on("click",".course_delete_btn",function () {
        var id = $(this).attr("del-id");
        $.confirm({
            title: '确认信息',
            content: '确认删除该课程吗？',
            buttons: {
                ok: {
                    text: "确认",
                    btnClass: 'btn-primary',
                    keys: ['enter'],
                    action: function(){
                        del_course(id);
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

    function del_course(id) {
        $.ajax({
            url:"${APP_PATH}/del_course",
            typw:"GET",
            data:"id="+id,
            success: function (result) {
                if(result.code == 100) {
                    $.alert({
                        title:"success",
                        type: "green",
                        content:"删除课程成功",
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


    //到首页
    $(document).on("click","#firstpage_a",function () {
        to_firstpage($("#content_div"),"${APP_PATH}/toManMain");
    })



</script>
</body>
</html>