function usernameNoteditor() {
    $('#findUsername').textbox('textbox').attr('readonly',true);
}

function moneyNoteditor() {
    $('#findMoney').textbox('textbox').attr('readonly',true);
}

function show() {
    $("#winRecharge").window("open");
}



function checkMoney(e) {
    $('.checkMoney').removeAttr('name');
    $(e.target).attr('name','money');
}


