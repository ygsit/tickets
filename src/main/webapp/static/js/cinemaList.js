/*删除*/
function del(cid) {
    var flag = confirm("确定要删除吗？");
    if(flag){
        //确认删除
        window.location.href = $("#PageContext").val()+"/cinema/cinemaDel?cid="+cid;
    }
}

/*增加影厅(查询所有影院)*/
function showAddHall() {
    $.post($("#PageContext").val()+"/cinema/findAllCinemas",{},function(result){
        for(var i = 0; i < result.length; i++){
            $('.change_cinema select').append($('<option  value="'+result[i].cid+'">'+result[i].name+'</option>'))
        }
        // for(var i  in  result){
        //     $('.change_cinema select').append($('<option  value="'+result.cid[i]+'">'+result.name[i]+'</option>'))
        // }
    })

}

/*校验影厅名*/
function checkHallName() {
    var hallName = $(".hallName").val();
    var cinemaId = $(".cinemaId").val();
    console.log(cinemaId)
    $.post($("#PageContext").val()+"/hall/checkHallName",{"name": hallName, "cinemaId": cinemaId}, function () {

    })
}