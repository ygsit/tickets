//当前日期之前的日期不能选择
function  movie_release_date() {
    var this_date = new Date();
    var time = this_date.getFullYear()+'-'+(this_date.getMonth()+1)+"-"+this_date.getDate();
    $('#movie_schedules_increase .release_time').attr('min',time);
}


//获得影院相关的影厅
function getHalls(event) {
    $('#movie_schedules_increase .changeHall').html('<option value="">请选择</option>')
    var cid = $('#add_movie_schedules_increase_form .cinemaId').val();
    if(cid==''){
        $('#add_movie_schedules_increase_form .cinemaId').focus();
        $('#add_movie_schedules_increase_form .cinemaId').next().text('请选择影院')
        return
    }
    $.post($("#PageContext").val()+"/hall/showHalls", {"cid": cid}, function (result) {
        for(var i = 0; i < result.length; i++){
            $('#movie_schedules_increase .changeHall').append($('<option  value="'+result[i].hid+'">'+result[i].name+'</option>'))
        }
    })
}
function movie_cc() {
    if($('#add_movie_schedules_increase_form .cinemaId').val()!=""){
        $('#add_movie_schedules_increase_form .cinemaId').next().text('')
    }
}
//添加影片排期按钮的点击事件
function view_movie_release() {
    $('#movie_schedules_increase .cinemaId').val('')
    $('#movie_schedules_increase .changeHall').val('')
    $('#movie_schedules_increase .movie_name').val('')
    $('#movie_schedules_increase .release_time').val('')
    $('#movie_schedules_increase .price').val('')
    $('#movie_schedules_increase').children('.form-group').children('span').text('')
    $('#movie_schedules_increase cinemaId').html('<option value="">请选择</option>')
    movie_release_date();

    $.post($("#PageContext").val()+"/cinema/findAllCinemas",{}, function (result) {
        for(var i = 0; i < result.length; i++){
            $('#movie_schedules_increase .cinemaId').append($('<option  value="'+result[i].cid+'">'+result[i].name+'</option>'))
        }
    })
}
//
// function () {
//
// }
//修改影院排片的点击事件


function view_update_movie_schedules(event) {

    $('#update_movie_schedules_increase_title').val('影院排期 | 修改');
    var cinName = $(event.target).parents('tr').children('td').eq(1).text();
    var hallName = $(event.target).parents('tr').children('td').eq(2).text();
    var movName = $(event.target).parents('tr').children('td').eq(3).text();
    var price = $(event.target).parents('tr').children('td').eq(4).text();
    var time  =$(event.target).parents('tr').children('td').eq(5).text();
    var sid =$(event.target).parents('tr').children('td').eq(6).text();
    $('#update_movie_schedules_increase_form .cinemaId').html('<option value="">请选择</option>')
    $('#update_movie_schedules_increase_form .changeHall').html('<option value="">请选择</option>')
    $.post($("#PageContext").val()+"/cinema/findAllCinemas",{}, function (result) {
        for(var i = 0; i < result.length; i++){
            if(cinName == result[i].name){
                sessionStorage.setItem(result[i].name, result[i].cid)
                $('#update_movie_schedules_increase_form .cinemaId').append($('<option  value="'+result[i].cid+'" selected>'+result[i].name+'</option>'))
            }else{
                $('#update_movie_schedules_increase_form .cinemaId').append($('<option  value="'+result[i].cid+'">'+result[i].name+'</option>'))
            }
        }
    })


    $.post($("#PageContext").val()+"/hall/showHalls", {"cid": sessionStorage.getItem(cinName)}, function (result) {
        for(var i = 0; i < result.length; i++){
            if(hallName == result[i].name){
                sessionStorage.setItem(result[i].name, result[i].hid)
                $('#update_movie_schedules_increase_form .changeHall').append($('<option  value="'+result[i].hid+'" selected>'+result[i].name+'</option>'))
            }else {
                $('#update_movie_schedules_increase_form .changeHall').append($('<option  value="'+result[i].hid+'">'+result[i].name+'</option>'))
            }
        }
    })
    // console.log(time.split(' ')[0])
    $('#update_movie_schedules_increase_form .movie_name').val(movName);
    $('#update_movie_schedules_increase_form .release_time_date').val(time.split(' ')[0]);
    $('#update_movie_schedules_increase_form .release_time_time').val(time.split(' ')[1]);
    $('#update_movie_schedules_increase_form .price').val(price);
    $('#update_movie_schedules_increase_form .update_mov_sch_sid').val(sid);
}

