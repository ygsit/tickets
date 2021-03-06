<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
        <title>个人中心</title>

        <!-- Bootstrap -->
        <link href="${pageContext.request.contextPath}/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/userPersonal.css"/>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/index.css"/>

        <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
        <script src="${pageContext.request.contextPath}/plugins/bootstrap/js/jquery-1.12.4.min.js"></script>
        <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
        <script src="${pageContext.request.contextPath}/plugins/bootstrap/js/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/static/js/userPersonal.js"></script>
        <!-- easyUI -->
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/plugins/easyui/themes/default/easyui.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/plugins/easyui/themes/icon.css">
        <script type="text/javascript" src="${pageContext.request.contextPath}/plugins/easyui/jquery.min.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath}/plugins/easyui/jquery.easyui.min.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath}/plugins/easyui/locale/easyui-lang-zh_CN.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/login.js"></script>
    </head>
    <body>
        <div class="container-fluid">
            <!--首页头部-->
            <div class="row index_header">
                <div class="header_left">
                    电影售票管理系统
                </div>
                <div class="header_right">
                    ${name}，欢迎您！ <a href="${pageContext.request.contextPath}/user/toLogin">安全退出</a>
                </div>
            </div>
            <!--正文-->
            <div class="row index_body">
                <div class="col-md-2 body_left">
                    <p>导航菜单</p>
                    <ul class="list-unstyled">
                        <li><a href="${pageContext.request.contextPath}/user/forwardIndex">首页</a></li>
                        <input id="ifHidden" type="hidden" value="${permission}"/>
                        <div class="ifHidden">
                            <li><a href="${pageContext.request.contextPath}/user/findAllByPage">用户管理</a></li>
                            <li><a href="${pageContext.request.contextPath}/movie/findMovieByPage">电影管理</a></li>
                            <li><a href="${pageContext.request.contextPath}/cinema/findCinemaByPage">影院管理</a></li>
                            <li><a href="${pageContext.request.contextPath}/slice/findSliceByPage">影片排期管理</a></li>
                        </div>
                        <li><a href="${pageContext.request.contextPath}/user/userPersonal?uid=${uid}" class="changeColor">个人中心</a></li>
                        <li><a href="${pageContext.request.contextPath}/order/selectOrders?uid=${uid}">我的订单</a></li>
                    </ul>
                </div>
                <div class="col-md-10 body_middle">
                    <br><br><br>
                    <div class="container">
                        <p class="user_info">基本信息</p>
                        <hr>
                        <form class="user_form" method="post" action="${pageContext.request.contextPath}/user/userPersonalUpdate?uid=${uid}">
                            <div style="margin-bottom:20px">
                                <input class="easyui-textbox" id="findUsername" value="${findUser.username}" name="username" style="width:400px"
                                       data-options="label:'用户名:',events:{focus:usernameNoteditor}">
                            </div>
                            <div style="margin-bottom:20px">
                                <input class="easyui-textbox" id="findPassword" value="${findUser.password}" name="password" style="width:400px"
                                       data-options="label:'密码:',required:true,validType:'length[6,16]'">
                            </div>
                            <div style="margin-bottom:20px">
                                <input class="easyui-textbox" name="name" value="${findUser.name}" style="width:400px" id="findName"
                                       data-options="label:'真实姓名:',required:true,validType:'trueName'">
                            </div>
                            <div style="margin-bottom:20px">
                                <label>性别:</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <input class="easyui-radiobutton man" name="gender" value="男" label="男" labelPosition="after" <c:if test="${findUser.gender == '男'}">checked</c:if>>
                                <input class="easyui-radiobutton woman" name="gender" value="女" label="女" labelPosition="after"<c:if test="${findUser.gender == '女'}">checked</c:if>>
                            </div>
                            <div style="margin-bottom:20px">
                                <input class="easyui-textbox" id="findPhone" value="${findUser.phone}" name="phone" style="width:400px"
                                       data-options="label:'手机号码:',required:true,validType:'mobile'">
                            </div>

                            <div style="margin-bottom:20px">
                                <input type="text" class="easyui-numberbox" id="findMoney" value="${findUser.money}" name="money" style="width:310px"
                                       data-options="label:'余额:',events:{focus:moneyNoteditor},required:true" precision="1"><a id="btn" href="javascript:show()" class="easyui-linkbutton" data-options="iconCls:'icon-add'">立即充值</a>
                            </div>
                            <br>
                            <div class="add_btn">
                                <input type="submit" value="立即修改"/>
                            </div>
                        </form>

                        <%-- 充值窗口--%>
                        <div id="winRecharge" class="easyui-window" title="余额充值" style="width:410px;height: 330px"
                             data-options="iconCls:'icon-save',modal:true,closed:true">
                            <div><span >充值账号：${findUser.username}</span></div>
                            <div><span >请选择充值金额:</span></div>
                            <form method="post" action="${pageContext.request.contextPath}/user/userMoneyUpdate?uid=${uid}">
                                <div class="amount">
                                    <input type="text" value="10" class="checkMoney" onclick="checkMoney(event)" readonly>
                                    <input type="text" value="30" class="checkMoney" onclick="checkMoney(event)" readonly>
                                    <input type="text" value="50" class="checkMoney" onclick="checkMoney(event)" readonly>
                                    <input type="text" value="100" class="checkMoney" onclick="checkMoney(event)" readonly>
                                    <input type="text" class="checkMoney"  onclick="checkMoney(event)" placeholder="自定义"><br>
                                </div>
                                <input type="submit" value="立即充值" >
                            </form>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
