//权限判断
$(function () {
    var permisson = $("#ifHidden").val();
    if(permisson == 0){
        $(".ifHidden").addClass("toHidden")
    }
})

//切换验证码
function refreshCode() {
    //1.获取验证码图片对象
    var vcode = document.getElementById("vcode");

    //2.设置其src属性，加时间戳
    vcode.src = $("#PageContext").val() + "/checkCode/check?time=" + new Date().getTime();
}

function showView() {
    $("#winReset").window('open')
}

function showRegister() {
    $("#winRegister").window('open')
}

//重置功能实现
function userReset() {
    $("#resetForm").form('submit', {
        url:$("#PageContext").val() + "/user/userReset",
        success:function (data) {
            $.messager.show({
                title:'提示消息',
                msg:"密码重置成功",
                timeout:3000,
                showType:'slide'
            });
            // 关闭窗口
            $("#winRegister").window("close");
            $("#winReset").window('close');
            //表单数据重置
            $("#resetForm").form('reset');
        }
    })
}

//注册功能实现
function userRegister() {
    $("#registerForm").form('submit', {
        url:$("#PageContext").val() + "/user/userRegister",
        success:function (data) {
            $.messager.show({
                title:'提示消息',
                msg:"注册成功",
                timeout:3000,
                showType:'slide'
            });
            // 关闭窗口
            $("#winRegister").window("close");
            $("#winReset").window('close');
            //表单数据重置
            $("#registerForm").form('reset');
        }
    })
}

//表单验证
$.extend($.fn.validatebox.defaults.rules,
    {

        // 移动手机号码验证
        mobile : {// value值为文本框中的值
            validator : function(value) {
                var reg = /^1[3|4|5|6|7|8|9]\d{9}$/;
                return reg.test(value);
            },
            message : '输入手机号码格式不准确.'
        },

        // 非空验证
        combo : {
            validator : function(value) {
                if (value != null && value.length > 0) {
                    return true;
                } else {
                    return false;
                }
            },
            message : '不能为空'
        },

        // 用户账号验证(只能包括 _ 数字 字母)
        username : {
            validator : function(value) {
                return /^[a-zA-Z][a-zA-Z0-9_]{5,15}$/i.test(value);
            },
            message : '用户名不合法（字母开头，允许6-16字符，允许字母数字下划线）'
        },

        // 真实姓名验证
        trueName : {
            validator : function(value) {
                return /^[\u4e00-\u9fa5]{2,4}$/.test(value);
            },
            message : '名字不符合规范'
        },

        //确认密码验证
        equals: {
            validator: function(value,param){
                return value == $(param[0]).val();
            },
            message: '两次密码不一致'
        },

        //验证用户名是否存在
        usernameIsExist:{
            validator : function(value, param) {
                var flag = false;
                $.ajax({
                    async : false,
                    type:'get',
                    dataType:"json",
                    url:$("#PageContext").val()+"/user/checkUsername?username="+value,
                    success : function(data) {
                        flag = data;
                    }
                });
                if(flag){
                    return true
                }else{
                    return false
                }
            },
            message : '用户名不存在'
        },

        //验证影院名是否存在
        nameIsExist:{
            validator : function(value, param) {
                var flag = false;
                $.ajax({
                    async : false,
                    type:'get',
                    dataType:"json",
                    url:$("#PageContext").val()+"/cinema/checkname?name="+value,
                    success : function(data) {
                        flag = data;
                    }
                });
                if(!flag){
                    return true
                }else{
                    return false
                }
            },
            message : '电影名已存在'
        },

        //验证用户名格式和唯一性
        usernameOnlyOne:{
            validator:function(value){
                var rules = $.fn.validatebox.defaults.rules;
                var reg = /^[a-zA-Z][a-zA-Z0-9_]{4,15}$/;
                var flag = false;
                //先验证格式是否正确
                if(!reg.test(value)){
                    rules.usernameOnlyOne.message = "用户名不合法（字母开头，允许5-16字符，允许字母数字下划线）"
                    return false
                }
                //通过ajax请求是否存在相同的用户名
                $.ajax({
                    async : false,//此处是一个坑   ajax默认异步请求，导致没有返回结果就执行后面的  所以改成false
                    type:'get',
                    dataType:"json",
                    url:$("#PageContext").val()+"/user/checkUsername?username="+value,
                    success:function(data){
                        flag = data;
                    }
                })
                if(flag){
                    rules.usernameOnlyOne.message = "用户名已存在"
                    return false
                }
                return true
            },
            message:""
        }
    });
