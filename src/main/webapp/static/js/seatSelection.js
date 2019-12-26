//订单信息

  
/**
 * 动态创建座位
 * @param {number} row 
 * @param {number} col 
 */
function setMovieHall(row, col) {
    $('.seatSection').html('');
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
function setSeatStatus(arr){
    console.log("ssss")
   for(let i in arr){
       for(let j in arr[i]){
           if(arr[i][j]==1){
               $('#i'+Number(Number(i)+1)+Number(Number(j)+1)).children('i.iconfont').addClass('seat_sold');
           }
       }
   }



}











