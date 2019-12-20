/*清空查询的值*/
function clearValue() {
    document.getElementById("exampleInputName2").value = "";
}

/*删除*/
function del(mid) {
    var flag = confirm("确定要删除吗？");
    if(flag){
        //确认删除
        window.location.href = $("#PageContext").val()+"/movie/movieDel?mid="+mid;
    }
}

/*根据id查找用于修改回显*/
function findById(mid) {
    $.post($("#PageContext").val()+"/movie/findByIdForUpdate",{mid:mid},function(result){
        if(result != null){
            $("#findMid").val(result.mid);
            $("#findName").textbox('setValue',result.name);
            $('#findName').textbox('textbox').attr('readonly',true);
            $("#findDirector").textbox('setValue',result.director);
            $("#findActor").textbox('setValue',result.actor);
            $("#findType").textbox('setValue',result.type);
            if(result.type == 1 ){
                $("#findType").textbox('setText',"科幻片");
            }
            if(result.type == 2 ){
                $("#findType").textbox('setText',"爱情片");
            }
            if(result.type == 3 ){
                $("#findType").textbox('setText',"动作片");
            }
            if(result.type == 4 ){
                $("#findType").textbox('setText',"喜剧片");
            }
            if(result.type == 5 ){
                $("#findType").textbox('setText',"惊悚片");
            }
            if(result.type == 6 ){
                $("#findType").textbox('setText',"剧情片");
            }
            $("#findTime").textbox('setValue',result.time);
            $("#findCreateTime").textbox('setValue',result.createTime);
            $("#findRemark").textbox('setValue',result.remark);
            $("#winUpdate").window("open");
        }
    });
}
