//
// $("#alterUserInfo_btn").click(function () {
//
//     reset_form("#update_modal_form");
//     //弹出
//     $("#userUpdate_modal").modal({
//
//         backdrop:"static"
//     });
// })


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

// $("#user_update_btn").click(function () {
//
//
//     //校验表单信息
//     if(!validate_updateUser_form()) {
//         return false;
//     }
//
//     // //更新信息
//     // $.ajax({
//     //     url: "${APP_PATH}/updateUser",
//     //     type: "POST",
//     //     data: $("#update_modal_form").serialize()+"&id="+${user.id},
//     //     success: function (result) {
//     //         if(result.code == 100) {
//     //
//     //             window.location.href="${APP_PATH}/toUserInfo"
//     //         } else {
//     //             alert("更新失败");
//     //         }
//     //     }
//     //
//     // })
// })