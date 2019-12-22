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
    $('.change_cinema select').html('<option value="">请选择</option>')
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
var cinid ;
function checkHallName(event) {
    $(event.target).next().text('');
    if($(event.target).val()==''){
        $(event.target).next().text('影厅名称不能为空')
        return;
    }
    var hallName = $(event.target).val();
    var cinemaId = $(".cinemaId").val();
    if($(event.target).parents('.modal')[0].id == 'update_cinema_hall'){
        cinemaId  = cinid;
    }
    $.post($("#PageContext").val()+"/hall/checkHallName",{"name": hallName, "cinemaId": cinemaId}, function (result) {
        $(event.target).next().text('');
        if($(event.target).parents('.modal')[0].id == 'update_cinema_hall'){
            if(result==1&&$(event.target).parents('.modal-content').children('.modal-header').children('.modal-title').text().split('·')[1].split('|')[0].trim()==$(event.target).val().trim()){
                return
            }
        }
        if(result==1){
            $(event.target).next().text('影厅名称已存在')
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


//影厅管理按钮的点击事件
function show_view_hall(event, cid) {
    $('#view_hall .modal-body table tbody').html('')
    $('#view_hall .modal-body h4').remove('.not_cinema_hall')
    $.post($("#PageContext").val()+"/hall/showHalls", {"cid": cid}, function (result) {
        if(result.length==0){
            $('#view_hall .modal-body').append($('<h4 class="not_cinema_hall">该影院目前没有影厅！</h4>'))
            return
        }
        cinid  =result[0].cid;
        for(let i in result){
            let isTr = $('<tr></tr>')
            isTr.append('<td>'+(Number(i)+1)+'</td>')
            isTr.append('<td>'+result[i].name+'</td>');
            isTr.append('<td>'+result[i].capacity+'</td>');
            isTr.append('<td style="display: none">'+result[i].hid+'</td>')
            isTr.append('<td>' +
                '<a class="btn btn-default" role="button"' +
                'data-toggle="modal" data-target="#update_cinema_hall" onclick="show_update_cinema_hall(event)" style="margin:5px">修改</a>' +
                '<a class="btn btn-default" href="#" role="button"' + 'onclick="del('+result[i].hid+')">删除</a>' + '</td>')
            $('#view_hall .modal-body table tbody').append(isTr)
        }
    });
    var cinemaName = $(event.target).parents('tr').children('td').eq(1).text();
    $('#view_hall_title').text(cinemaName+' | 影院管理');
}
//修改影院按钮的点击事件
function show_update_cinema(event){
    var cinemaName = $(event.target).parents('tr').children('td').eq(1).text();
    var cinemaAddress= $(event.target).parents('tr').children('td').eq(2).text();
    $('#cinemaNameToUpdate').val(cinemaName);
    $('#update_cinema .cinema_address').val(cinemaAddress);
}
//修改影厅按钮的点击事件
function show_update_cinema_hall(event) {
    $('#update_cinema_hall span.col-sm-offset-4.col-sm-8').text('')
    var cinemaName = $('#view_hall_title').text().split('|')[0];
    var cinemaHallName = $(event.target).parents('tr').children('td').eq(1).text();
    var cinemaHallPeople= $(event.target).parents('tr').children('td').eq(2).text();
    var hid = $(event.target).parents('tr').children('td').eq(3).text();
    $('#update_cinema_hall .hallName').val(cinemaHallName);
    $('#update_cinema_hall .hallPeople').val(cinemaHallPeople);
    $('#update_cinema_hall_label').text(cinemaName+' · '+cinemaHallName+' | 影厅管理');
    $('#update_cinema_hall .movie_hall_id').val(hid)
}

function update_cinema_hall_submit() {
    if($('#update_cinema_hall form .form-group span').text()!=''){
        return false
    }
}