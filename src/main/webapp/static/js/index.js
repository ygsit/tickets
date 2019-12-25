//跳转到购票界面
function forwardBuy(name) {
    console.log(name)
    location.href = $("#PageContext").val()+"/sale/showTicketView?name="+name;
}

//权限判断
$(function () {
    var permisson = $("#ifHidden").val();
    if(permisson == 0){
        $(".ifHidden").addClass("toHidden")
    }
})