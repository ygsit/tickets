//跳转到购票界面
function forwardBuy(name) {
    console.log(name)
    location.href = $("#PageContext").val()+"/sale/showTicketView?name="+name;
}