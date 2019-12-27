$(function () {
    var orderValue = $("#orderValue").val();
    if(orderValue == 0){
        $(".orderTable").html("<h2 style='color: red'>您还没有购买过票呢！</h2>")
    }
})