//订单信息
let order = {
    movie: '',//电影名称
    cinema: '',//影院名称
    time: '',//时间段
    seat: ''//座位号
    
}
  
/**
 * 动态创建座位
 * @param {number} row 
 * @param {number} col 
 */
function setMovieHall(row, col) {
    //创建数组，保存座位的选中状态
    let seatSection = new Array(row);
    for (let i in seatSection) {
        seatSection[i] = new Array(col);
    }
    $('.seatSection').append($('<div class="row row0"></div>'));
    $('.row0').append($('<div class="se"><span></span></div>'))
    for (let i = 0; i < row; i++) {
        $('.seatSection').append($('<div class="row row' + (i + 1) + '"></div>'))
        $('.row' + (i + 1)).append($('<div class="se"><span>' + (i + 1) + '</span></div>'))
        for (let j = 0; j < col; j++) {
            $('.row' + (i + 1)).append($('<div class="se" id="i' + (i + 1) + '' + (j + 1) + '"> <i class="iconfont icon-zuowei seat_optional"></i></div>'))
        }
    }

    for (let i = 0; i < col; i++) {
        $('.row0').append($('<div class="se"><span>' + (i + 1) + '</span></div>'))
    }
}

/**
 * 获取座位的状态
 * @param {obj} data 
 */
function getSeatStatus(data){
    $.$.ajax({
        type: "post",
        url: "url",
        data: "data",
        dataType: "json",
        success: function (response) {
            
        },
        error:function(err){
         console.log(err)   
        }
        
    });
}

/**
 * 提交订单
 */
function submitOrder(){

}


//立即执行函数
(function(){
    setMovieHall(8, 8);//要放在前面
    getSeatStatus(order);
    $('.seatSection .row .se').click(function () {
        //排除选中的不是数值的部分
        if (!this.id) return;
        //排除已售的座位
        if ($(this).children('i').hasClass('seat_sold')) return;

        if ($(this).children('i').hasClass('seat_selected')) {
            $(this).children('i').removeClass('seat_selected')
        } else {
            $(this).children('i').addClass('seat_selected')
        }
    })
}())







