/*清空查询的值*/
function clearValue() {
    document.getElementById("exampleInputName2").value = "";
    document.getElementById("selectGender").value = "";
}

/*添加用户*/
function userAdd() {
    window.location.href = $("#PageContext").val()+"/user/userAdd";
}

/*删除*/
function del(uid) {
    var flag = confirm("确定要删除吗？");
    if(flag){
        //确认删除
        window.location.href = $("#PageContext").val()+"/user/userDel?uid="+uid;
    }
}

/*根据id查找用于修改回显*/
function findById(uid) {
    $.post($("#PageContext").val()+"/user/findByIdForUpdate",{uid:uid},function(result){
        if(result != null){
            $("#findUid").val(result.uid);
            $("#findUsername").textbox('setValue',result.username);
            $('#findUsername').textbox('textbox').attr('readonly',true);
            $("#findPassword").textbox('setValue',result.password);
            $("#findReqPassword").textbox('setValue',result.password);
            $("#findName").textbox('setValue',result.name);
            if (result.gender=="男") {
                $(".man").attr("checked",'true').next().children('.radiobutton-inner').css('display','block');
            }
            if(result.gender=="女"){
                $(".woman").attr("checked",'true').next().children('.radiobutton-inner').css('display','block');
            }
            $("#findPhone").textbox('setValue',result.phone);
            $("#findPermission").textbox('setValue',result.permission);
            if(result.permission == 0 ){
                $("#findPermission").textbox('setText',"普通用户");
            }
            if(result.permission == 1 ){
                $("#findPermission").textbox('setText',"管理员");
            }
            $("#findMoney").textbox('setValue',result.money);
            $("#winUpdate").window("open");
        }
    });
}

