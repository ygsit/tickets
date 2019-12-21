/*删除*/
function del(cid) {
    var flag = confirm("确定要删除吗？");
    if(flag){
        //确认删除
        window.location.href = $("#PageContext").val()+"/cinema/cinemaDel?cid="+cid;
    }
}
//添加影院的按钮点击时初始化表单
function showAddCinema() {
    $('#add_cinema_form').children('.form-group').children('span').text('')
    $('#add_cinema_form').children('.form-group').children('input[type="text"]').val('')

}
/*增加影厅(查询所有影院)*/
function showAddHall() {
    $.post($("#PageContext").val()+"/cinema/findAllCinemas",{},function(result){
        for(var i = 0; i < result.length; i++){
            $('.change_cinema select').append($('<option  value="'+result[i].cid+'">'+result[i].name+'</option>'))
        }
    })
    //初始化表单
    $('#addCinemaForm').children('.form-group').children('span').text('')
    $('#addCinemaForm').children('.form-group').children('.cinemaId').val('')
    $('#addCinemaForm').children('.form-group').children('.hallName').val('')
    $('#addCinemaForm').children('.form-group').children('.hallPeople').val('')



}

/*校验影院名*/
function checkCinemaName() {
    $("#cinemaName").next().text('');
    if($("#cinemaName").val()==''){
        $("#cinemaName").next().text('影院名称不能为空');
        return ;
    }
    var name = $("#cinemaName").val();
    $.post($("#PageContext").val()+"/cinema/checkname", {"name": name}, function (result) {
        $("#cinemaName").next().text('')
        if(result==1){
            $("#cinemaName").focus()
            $("#cinemaName").next().text('影院名称已存在')
        }
    })
}
//影院地址校验
function cinema_address_to_check(event) {
    $(event.target).next().text('')
    if($(event.target).val()==''){
        $(event.target).next().text('影院地址不能为空')
    }
}
//影院表单提交
function cinema_form__submit() {
    if($('#cinemaName').val()==''||$('#cinemaName').next().val()!=''){
        $('#cinemaName').focus();
        return false;
    }
    if($('.cinema_address').val()==''||$('.cinema_address').next().val()!=''){
        $('.cinema_address').focus();
        return false;
    }

}

/*校验影厅名*/
function checkHallName(event) {
    $(".hallName").next().text('')
    if($(".hallName").val()==''){
        $(".hallName").next().text('影厅名称不能为空')
        return;
    }
    var hallName = $(".hallName").val();
    var cinemaId = $(".cinemaId").val();
    $.post($("#PageContext").val()+"/hall/checkHallName",{"name": hallName, "cinemaId": cinemaId}, function (result) {
        $(".hallName").next().text('')
        if(result==1){
            $(".hallName").next().text('影厅名称已存在')
        }
    })
}
//添加影厅之前应该先选择影院
function checkHallName1() {
    if($('.cinemaId').val()==''){
        $('.cinemaId').focus();
        $('.cinemaId').next().text('请选择电影院')
        return;
    }
}
// 校验电影院是否选择
function cinemaToCheck(event) {
     $(event.target).next().text('')
    if(event.target.value==''){
        $(event.target).focus();
        $(event.target).next().text('请选择电影院')
    }

}
//影厅人数在1-200，且不能为空
function peopleToCheck(event) {
    if(event.target.value==''){
        $(event.target).next().text('影厅容纳人数不能为空');
    }
    if(event.target.value>200){
        $(event.target).val(200);
    }
    if(event.target.value<1){
        $(event.target).val(1);
    }
}
//选择影厅人数之前应该先选择影厅
function peopleToCheck1() {
    if($('.hallName').val()==''){
        $('.hallName').focus();
        $('.hallName').next().text('请输入影厅名称')
    }
    if($('.hallName').next().text()!=''){
        $('.hallName').focus();
    }
}
//添加影厅的表单的提交
function addMovieHell() {
    if($('.cinemaId').next().text()!=''||$('.hallName').next().text()!=''||$('.hallPeople').next().text()!=''){
        if($('.cinemaId').next().text()!=''){ $('.cinemaId').focus() };
        if($('.hallName').next().text()!='') {$('.hallName').focus()};
        if($('.hallPeople').next().text()!=''){ $('.hallPeople').focus()};
        return  false
    }
}