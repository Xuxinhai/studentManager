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
        <li class="active">学生课程成绩记录</li>
    </ol>
    <div class="box">
        <div class="heading">
            <p class="title" style="font-size: 25px;font-weight: bold;">
                学生课程成绩记录
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
                        <label class="sr-only">课程名</label>
                        <input type="text" name="coursename" class="form-control" placeholder="按课程名搜索">
                    </div>
                </div>

                <div class="col-md-2 col-sm-4 col-xs-12">
                    <div class="form-group">
                        <label class="sr-only">学年</label>
                        <input type="text" name="year" class="form-control" placeholder="按学年搜索">
                    </div>
                </div>


                <button id="search_btn" type="button" class="btn btn-primary pull-right btn-search">搜索</button>
            </form>

            <div class="table-responsive" style="margin-top: 20px;">
                <!--按钮-->
                <div >

                        <button class="btn btn-primary" id="score_add_modal_btn">新增学生成绩</button>

                </div>
                <table id="scores_table" class="table table-striped table-bordered table-hover" style="margin-top: 10px">
                   <thead>
                    <tr>
                        <th>学号</th>
                        <th>姓名</th>
                        <th>课程号</th>
                        <th>课程名</th>
                        <th>平时成绩</th>
                        <th>期末成绩</th>
                        <th>总成绩</th>
                        <th>学年</th>
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

    <!--学生课程添加-->
    <!-- Modal -->
    <div class="modal fade" id="scoreAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">学生成绩信息添加</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal">
                        <div class="form-group">
                            <label class="col-sm-3 control-label">学号</label>
                            <div class="col-sm-6">
                                <input type="text" name="studentno" class="form-control" id="studentno_add_input">
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">学年</label>
                            <div class="col-sm-6">
                                <input type="text" name="year" class="form-control" id="year_add_input">
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">平时成绩</label>
                            <div class="col-sm-6">
                                <input type="text" name="usualscore" class="form-control" id="usual_add_input">
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">期末成绩</label>
                            <div class="col-sm-6">
                                <input type="text" name="finalscore" class="form-control" id="fianl_add_input">
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">总成绩</label>
                            <div class="col-sm-6">
                                <input type="text" name="totalscore" class="form-control" id="total_add_input">
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">课程名</label>
                            <div class="col-sm-6">
                                <select id="ins_course_select" class="form-control" name="courseid">

                                </select>
                                <span class="help-block"></span>
                            </div>
                        </div>


                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" id="score_save_btn">保存</button>
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
            url:"${APP_PATH}/get_allScore",
            data: data,
            type:"GET",
            success:function (result) {
               //  console.log(result);
                // 1、解析显示员工数据
                build_Scorelist_table(result);
                // //2、解析并显示分页信息
                build_page_info(result,"#page_info_area");
                // //3、解析并显示分页条
                build_page_nav(result,"#page_nav_area");
            }
        });
    }

    //1、解析显示数据
    function build_Scorelist_table(result) {
        //清空表格数据
        $("#scores_table tbody").empty();

        var courses = result.extend.pageInfo.list;
        $.each(courses,function (index,item) {

            var studentnoTd = $("<td></td>").append(item.student.studentno);
            var studentnameTd = $("<td></td>").append(item.student.studentname);
            var coursenoTd = $("<td></td>").append(item.course.courseno);
            var coursenameTd = $("<td></td>").append(item.course.coursename);
            var usualscroreTd = $("<td></td>").append(item.usualscore);
            var finalscoreTd = $("<td></td>").append(item.finalscore);
            var totalscoreTd = $("<td></td>").append(item.totalscore);

            var yearTd = $("<td></td>").append(item.year);

            // var editBtn = $("<button class='btn btn-primary btn-sm  edit_btn' style='margin-left:30px'></button>")
            //     .append($("<span class='glyphicon glyphicon-pencil'></span>").append("编辑"));
            // //为编辑按钮添加自定义的属性，表示当前员工的id
            // editBtn.attr("edit-id",item.id);

            var delBtn = $("<button style='margin-left:20px'></button>")
                .addClass("btn btn-danger btn-sm delete_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-trash ").append("删除"));
            delBtn.attr("del-id",item.id);

            var btnTd = $("<td ></td>").append(delBtn);

            // var editBtn = $("<button class='btn btn-primary btn-sm  edit_btn'></button>")
            //     .append($("<span class='glyphicon glyphicon-pencil'></span>").append("编辑"));


            //append方法返回原来
            $("<tr></tr>")
                .append(studentnoTd)
                .append(studentnameTd)
                .append(coursenoTd)
                .append(coursenameTd)
                .append(usualscroreTd)
                .append(finalscoreTd)
                .append(totalscoreTd)
                .append(yearTd)
                .append(btnTd)
                .appendTo("#scores_table tbody");

        })
    }


    //点击新增按钮
    $(document).on("click","#score_add_modal_btn",function () {
        // //清除表单数据（表单重置:表单数据，样式）
         reset_form("#scoreAddModal form");
        // //发送ajax请求，查出课程信息，显示在下拉列表中
        get_allCourse("#ins_course_select","${APP_PATH}/get_courses");
        //弹出
        $("#scoreAddModal").modal({
            backdrop:"static"
        });
    })

    //点击保存按钮
    $(document).on("click","#score_save_btn",function () {
        $.confirm({
            title: '确认信息',
            content: '确认添加学生成绩信息吗？',
            buttons: {
                ok: {
                    text: "确认",
                    btnClass: 'btn-primary',
                    keys: ['enter'],
                    action: function(){
                        save_score();
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

        //校验姓名信息
        var studentno = $("#studentno_add_input").val();
        if(studentno == null || studentno == "") {
            show_validate_msg("#studentno_add_input","error","姓名不能为空");
            return false;
        } else {
            show_validate_msg("#studentno_add_input","success","");
        }

        var course = $("#ins_course_select").val();
        if(course == null || course == "") {
            my_alert("error","请选择课程","red");
            return false;
        } else {

        }

        return true;
    }

    //添加学生
    function save_score() {

        //校验表单信息
        if(!validate_add_form()){
            return false;
        }

        $.ajax({
            url: "${APP_PATH}/ins_score",
            type:"GET",
            data : $("#scoreAddModal form").serialize(),
            success: function (result) {
                if(result.code == 100) {
                    $.alert({
                        title: "success",
                        content: "添加成功！",
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
            content: '确认删除该成绩信息吗？',
            buttons: {
                ok: {
                    text: "确认",
                    btnClass: 'btn-primary',
                    keys: ['enter'],
                    action: function(){

                        del_score(id);
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

    function del_score(id) {
        $.ajax({
            url:"${APP_PATH}/del_score",
            typw:"GET",
            data:"id="+id,
            success: function (result) {
                if(result.code == 100) {
                    $.alert({
                        title:"success",
                        type: "green",
                        content:"删除学生成绩信息成功",
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