function show_seat_selection_dialog(el){

    $('.seat_arr').html('');
    var cinemaName = $(el.target).parents('.cinemas_cell').children('.cinema_info').children('.cinema_name').text().trim();
    var price  = $(el.target).parents('.cinemas_cell').children('.price').children('.price_num').text().trim();
    var movieName = $('.wrapper .movie_brief').children('h3').text().trim();
    //暂时没有影厅，时间，影厅大小
    var hallName='',
        hallSize=64,
        time='';


    $($('.ti_val')[0]).text(cinemaName);/*影院*/
    $($('.ti_val')[1]).text(hallName);/**/
    $($('.ti_val')[2]).text(time);
    $($('.ti_val')[3]).text("￥"+price+"/张");/*价格*/
    // sessionStorage.removeItem(cinemaName);
    if(!sessionStorage.getItem(cinemaName)){
        let toObj = {}
        let  newSeatArr =new Array(Math.sqrt(hallSize))
        for(let i=0;i<newSeatArr.length;i++){
            newSeatArr[i]=new Array(Math.sqrt(hallSize));
            for(let j=0;j<newSeatArr[i].length;j++){
                newSeatArr[i][j]=0;
            }
        }
        toObj[movieName]={
            price:price,
            seatArr:newSeatArr
        }
        sessionStorage.setItem(cinemaName,JSON.stringify(toObj));
    }else {
        let obj = JSON.parse(sessionStorage.getItem(cinemaName));
        if(!obj[movieName]){
            let  newSeatArr =new Array(Math.sqrt(hallSize))
            for(let i=0;i<newSeatArr.length;i++){
                newSeatArr[i]=new Array(Math.sqrt(hallSize));
                for(let j=0;j<newSeatArr[i].length;j++){
                    newSeatArr[i][j]=0;
                }
            }
            obj[movieName]={
                price:price,
                seatArr:newSeatArr
            }
        }
        sessionStorage.setItem(cinemaName,JSON.stringify(obj));
    }
    // console.log(JSON.parse(sessionStorage.getItem(cinemaName))[movieName].seatArr)



    setMovieHall(Math.sqrt(hallSize), Math.sqrt(hallSize));
    setSeatStatus(JSON.parse(sessionStorage.getItem(cinemaName))[movieName].seatArr);
    console.log(JSON.parse(sessionStorage.getItem(cinemaName))[movieName].seatArr)
    $('.seatSection .row .se').click(function () {
        //排除选中的不是数值的部分
        if (!this.id) return;
        //排除已售的座位
        if ($(this).children('i').hasClass('seat_sold')) return;


        if ($(this).children('i').hasClass('seat_selected')) {
            $(this).children('i').removeClass('seat_selected')
            removeArr(this.id)
        } else {
            if($('.seat_arr').children('.seatArr_seatItem').length>=3){
                alert('最多选择3个座位！')
                return;
            }
            $(this).children('i').addClass('seat_selected')
            saveArr(this.id)
        }
    })

}


function saveArr(id) {

    var price =$($('.ti_val')[3]).text().split('/')[0].substr(1)
    var row = id.substr(1)[0];
    var col = id.substr(1)[1];
    $('.seat_arr').append($('<div class="seatArr_seatItem" id="sI'+row+''+col+'">'+row+'排'+col+'座<i class="seatArr_seatItem_close" onclick="seatItemClick(event)">×</i></div>'));
    var num =  $('.seat_arr').children('.seatArr_seatItem').length;
    $($('.ti_val')[4]).text("￥"+(price*num));

}
function removeArr(id) {
    var price =$($('.ti_val')[3]).text().split('/')[0].substr(1)
    var row = id.substr(1)[0];
    var col = id.substr(1)[1];
    $('#sI'+row+col).remove();
    var num =  $('.seat_arr').children('.seatArr_seatItem').length;
    $($('.ti_val')[4]).text("￥"+(price*num));


}

function seatItemClick(event) {
    var row = $(event.target).parents('.seatArr_seatItem')[0].id.substr(2)[0];
    var col = $(event.target).parents('.seatArr_seatItem')[0].id.substr(2)[1];
    $('#sI'+row+col).remove();
    $('#i'+row+col).children('.iconfont').removeClass('seat_selected');
}


//购买按钮
function toBuyToSub() {
    //总价
    var price = $($('.ti_val')[4]).text().substr(1);
    //影院名
    var cinN = $($('.ti_val')[0]).text();
    //电影名
    var movN = $('.wrapper .movie_brief').children('h3').text().trim();
    var obj =JSON.parse(sessionStorage.getItem(cinN))

    //能否购买写这里，不能购买直接return



    //放在最后面，前面有错误就return
    for(let i = 0;i<$('.seat_arr').children('.seatArr_seatItem').length;i++){
        var row = Number($($('.seat_arr').children('.seatArr_seatItem')[i]).text()[0])-1
        var col = Number($($('.seat_arr').children('.seatArr_seatItem')[i]).text()[2])-1
        obj[movN].seatArr[row][col] = 1;
    }
    sessionStorage.setItem(cinN,JSON.stringify(obj));
    $('#seat_selection_dialog').modal('hide');



}