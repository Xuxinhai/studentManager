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
        <li class="active">信息管理</li>
    </ol>
    <div class="box">
        <div class="heading">
            <p class="title" style="font-size: 25px;font-weight: bold;">
                信息管理
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
                <!--按钮-->
                <div >

                        <button class="btn btn-danger" id="stu_delete_all_btn">删除</button>
                        <button class="btn btn-primary" id="stu_add_modal_btn">新增学生</button>

                </div>
                <table id="stus_table" class="table table-striped table-bordered table-hover" style="margin-top: 10px">
                   <thead>
                    <tr>
                        <th>学号</th>
                        <th>姓名</th>
                        <th>专业</th>
                        <th>年级</th>
                        <th>班级</th>
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

    <!--学生添加-->
    <!-- Modal -->
    <div class="modal fade" id="stuAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">学生添加</h4>
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
                            <label class="col-sm-3 control-label">姓名</label>
                            <div class="col-sm-6">
                                <input type="text" name="studentname" class="form-control" id="studentname_add_input">
                                <span class="help-block"></span>
                             </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">年龄</label>
                            <div class="col-sm-6">
                                <input type="text" name="age" class="form-control" id="age_add_input">
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">联系电话</label>
                            <div class="col-sm-6">
                                <input type="text" name="phone" class="form-control" id="phone_add_input">
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">年级</label>
                            <div class="col-sm-6">
                                <!--提交部门id即可-->
                                <select class="form-control" name="grade" id="grade_add_select">
                                    <option value="" hidden>--请选择年级--</option>
                                    <option value="1">大一</option>
                                    <option value="2">大二</option>
                                    <option value="3">大三</option>
                                    <option value="4">大四</option>
                                </select>
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">班级</label>
                            <div class="col-sm-6">

                                <select id="ins_class_select" class="form-control" name="classid">

                                </select>
                                <span class="help-block"></span>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">性别</label>
                            <div class="col-sm-6">
                                <div class="radio" style="float: left;margin-left: 20px">>
                                    <input type="radio" name="sex" id="sex1_add_input" value="1" checked>男
                                </div>
                                <div class="radio" style="float: left;margin-left: 60px">
                                    <input type="radio" name="sex" id="sex2_addd_input" value="2">女
                                </div>

                            </div>
                        </div>


                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" id="stu_save_btn">保存</button>
                </div>
            </div>
        </div>
    </div>


    <!--学生更新-->
    <!-- Modal -->
    <div class="modal fade" id="stuUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" >学生信息更新</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" id="update_form">
                        <div class="form-group">
                            <label class="col-sm-3 control-label">学号</label>
                            <div class="col-sm-6">
                                <p class="form-control-static" id="studentno_update_static"></p>
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">姓名</label>
                            <div class="col-sm-6">
                                <p class="form-control-static" id="studentname_update_static"></p>
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
                            <label class="col-sm-3 control-label">年级</label>
                            <div class="col-sm-6">
                                <!--提交部门id即可-->
                                <select class="form-control" name="grade" id="grade_update_select">
                                    <option value="" hidden>--请选择年级--</option>
                                    <option value="1">大一</option>
                                    <option value="2">大二</option>
                                    <option value="3">大三</option>
                                    <option value="4">大四</option>
                                </select>
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">班级</label>
                            <div class="col-sm-6">

                                <select id="update_class_select" class="form-control" name="classid">

                                </select>
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
                    <button type="button" class="btn btn-primary" id="stu_update_btn">更新</button>
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
        // alert($("#serach_form").serialize());
        var majorid = $("#major_select").attr("value");
        var classid = $("#class_select").attr("value");
        // alert(majorid+":"+classno);
        // var data = "pn="+pn+"&"+$("#serach_form").serialize()+"&"+"majorid="+majorid+"&"+"classid="+classid;
        var data = "pn="+pn+"&"+$("#serach_form").serialize();
        // alert(data);
        $.ajax({
            url:"${APP_PATH}/get_allStu",
            data: data,
            type:"GET",
            success:function (result) {
                // console.log(result);
                // 1、解析显示员工数据
                build_stulist_table(result);
                // //2、解析并显示分页信息
                build_page_info(result,"#page_info_area");
                // //3、解析并显示分页条
                build_page_nav(result,"#page_nav_area");
            }
        });
    }

    //1、解析显示学生数据
    function build_stulist_table(result) {
        //清空表格数据
        $("#stus_table tbody").empty();

        var courses = result.extend.pageInfo.list;
        $.each(courses,function (index,item) {

            var studentnoTd = $("<td></td>").append(item.studentno);
            var studentname = $("<td></td>").append(item.studentname);
            var majorTd = $("<td></td>").append(item.stuclass.major.majorname);

            var grade = "大一";
            if(item.grade==2) grade = "大二";
            if(item.grade==3) grade = "大三";
            if(item.grade==4) grade = "大四";
            var gradeTd = $("<td></td>").append(grade);

            var classTd = $("<td></td>").append(item.stuclass.classno);

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
                .append(studentnoTd)
                .append(studentname)
                .append(majorTd)
                .append(gradeTd)
                .append(classTd)
                .append(btnTd)

                .appendTo("#stus_table tbody");

        })
    }


    //点击新增按钮
    $(document).on("click","#stu_add_modal_btn",function () {
        // //清除表单数据（表单重置:表单数据，样式）
         reset_form("#stuAddModal form");
        // //发送ajax请求，查出部门信息，显示在下拉列表中
        get_allClass("#ins_class_select","${APP_PATH}/get_classes");
        //弹出
        $("#stuAddModal").modal({
            backdrop:"static"
        });
    })

    //点击保存按钮
    $(document).on("click","#stu_save_btn",function () {
        $.confirm({
            title: '确认信息',
            content: '确认添加学生吗？',
            buttons: {
                ok: {
                    text: "确认",
                    btnClass: 'btn-primary',
                    keys: ['enter'],
                    action: function(){
                        save_stu();
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

    //添加学生
    function save_stu() {

        //校验表单信息
        if(!validate_add_form()){
            return false;
        }

        $.ajax({
            url: "${APP_PATH}/ins_stu",
            type:"GET",
            data : $("#stuAddModal form").serialize(),
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


    //点击编辑按钮
    $(document).on("click",".edit_btn",function () {
        // 查出班级信息
        get_allClass("#update_class_select","${APP_PATH}/get_classes");
        //查出学生信息信息
        getStu($(this).attr("edit-id"));


        //将学生id放在更新按钮中
        $("#stu_update_btn").attr("edit-id",$(this).attr("edit-id"));

        //弹出更新模态框
        $("#stuUpdateModal").modal({
            backdrop:"static"
        })
    })

    //获取学生的信息
    function getStu(id) {
        $.ajax({
            url: "${APP_PATH}/get_stu",
            type: "GET",
            async: false,
            data: "id="+id,
            success: function (result) {
                if(result.code == 100) {
                    var stu = result.extend.stu;
                    $("#studentno_update_static").text(stu.studentno);
                    $("#studentname_update_static").text(stu.studentname);
                    $("#phone_update_input").val(stu.phone);
                    $("#age_update_input").val(stu.age);
                    $("#grade_update_select").val(stu.grade);
                    $("#update_class_select").val(stu.classid);
                    $("#stuUpdateModal input[name='sex']").val([stu.sex]);
                } else {
                    my_alert("error","fail!","red");
                }
            }
        })
    }

    //点击更新按钮
    $(document).on("click","#stu_update_btn",function () {
    //    alert(11);

        $.confirm({
            title: '确认信息',
            content: '确认更新学生信息吗？',
            buttons: {
                ok: {
                    text: "确认",
                    btnClass: 'btn-primary',
                    keys: ['enter'],
                    action: function(){
                        update_stu();
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

    function update_stu() {
        $.ajax({
            url:"${APP_PATH}/upd_stu",
            type:"GET",
            data:"id="+$("#stu_update_btn").attr("edit-id")+"&"+ $("#update_form").serialize(),
            success:function (result) {
                if(result.code == 100) {
                    $.alert({
                        title:"success",
                        type: "green",
                        content:"更新学生信息成功",
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
                    my_alert("error","更新学生信息失败！","red");
                }
            }
        })
    }

    //点击删除按钮
    $(document).on("click",".delete_btn",function () {
        var id = $(this).attr("del-id");
        $.confirm({
            title: '确认信息',
            content: '确认删除该学生吗？',
            buttons: {
                ok: {
                    text: "确认",
                    btnClass: 'btn-primary',
                    keys: ['enter'],
                    action: function(){

                        del_stu(id);
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

    function del_stu(id) {
        $.ajax({
            url:"${APP_PATH}/del_stu",
            typw:"GET",
            data:"id="+id,
            success: function (result) {
                if(result.code == 100) {
                    $.alert({
                        title:"success",
                        type: "green",
                        content:"删除学生信息成功",
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