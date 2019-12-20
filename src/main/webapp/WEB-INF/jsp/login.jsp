<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>登录主页</title>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/login.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/plugins/easyui/themes/default/easyui.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/plugins/easyui/themes/icon.css">
        <script type="text/javascript" src="${pageContext.request.contextPath}/plugins/easyui/jquery.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/plugins/easyui/jquery.easyui.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/plugins/easyui/locale/easyui-lang-zh_CN.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/login.js"></script>
    </head>
    <body>
        <div class="content">
            <p>影院售票系统</p>
            <div class="split">
                <form action="${pageContext.request.contextPath}/user/userLogin" method="post">
                    <br>
                    <table width="250px">
                        <tr>
                            <td><label for="loginUsername">用户名：</label></td>
                            <td align="right"><input type="text" id="loginUsername" name="username"></td>
                        </tr>
                        <tr>
                            <td><label for="password">密码：</label></td>
                            <td align="right"><input type="password" id="password" name="password"></td>
                        </tr>
                        <tr>
                            <td><label for="checkCode">验证码：</label></td>
                            <td align="right">
                                <input type="text" id="checkCode" name="checkCode">
                                <a href="javascript:refreshCode();">
                                    <img src="${pageContext.request.contextPath}/checkCode/check"  id="vcode">
                                </a>
                            </td>
                        </tr>
                        <tr style="height: 20px">
                            <td><a href="javascript:showView()" class="forgetPassword">忘记密码</a></td>
                            <td align="right"></a><a href="javascript:refreshCode();" class="check">看不清?换一张</a></td>
                        </tr>
                    </table>
                    <div class="bottom">
                        <div class="error_msg">${error_message}</div>
                        <input type="submit" id="sub" value="登录">
                    </div>
                </form>
                <%--密码重置窗口--%>
                <div id="winReset" class="easyui-window" title="密码重置" style="width:320px;height:300px"
                     data-options="iconCls:'icon-save',modal:true,closed:true">
                    <div class="resetPassword">
                        <form id="resetForm" method="post">
                            <input class="easyui-textbox textbox" prompt="请输入用户名" id="resetUsername" name="username"
                                   data-options="required:true, validType:'usernameIsExist'">
                            <div class="hrLine"></div>
                            <input class="easyui-passwordbox textbox" prompt="请输入密码" iconWidth="28" id="resetPassword" name="password"
                                   data-options="required:true,validType:'length[6,16]'">
                            <div class="hrLine"></div>
                            <input class="easyui-passwordbox textbox" prompt="请再次输入密码" iconWidth="28"
                                   data-options="required:true" validType="equals['#resetPassword']"><br>
                            <div class="hrLine"></div>
                            还没有账号？<a href="javascript:showRegister()">立即注册</a>
                            <br><br><br>
                            <a href="javascript:userReset()" class="easyui-linkbutton">立即重置</a>
                        </form>
                    </div>
                </div>
                <%--用户注册模块窗口--%>
                <div id="winRegister" class="easyui-window" title="用户注册" style="width:500px;height: 505px"
                     data-options="iconCls:'icon-save',modal:true,closed:true">
                    <div class="register">
                        <form id="registerForm" method="post">
                            <div style="margin-bottom:20px">
                                <input class="easyui-textbox" id="registerUsername" name="username" style="width:300px"
                                       data-options="label:'用户名:',required:true,validType:'usernameOnlyOne'">
                            </div>
                            <div style="margin-bottom:20px">
                                <input class="easyui-passwordbox" name="password" style="width:300px" id="registerPassword"
                                       data-options="label:'密码:',required:true,validType:'length[6,16]'">
                            </div>
                            <div style="margin-bottom:20px">
                                <input class="easyui-passwordbox" style="width:300px"
                                       data-options="label:'确认密码:',required:true" validType="equals['#registerPassword']">
                            </div>
                            <div style="margin-bottom:20px">
                                <input class="easyui-textbox" name="name" style="width:300px"
                                       data-options="label:'真实姓名:',required:true,validType:'trueName'">
                            </div>
                            <div style="margin-bottom:20px">
                                <label>性别:</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <input class="easyui-radiobutton" name="gender" value="男" label="男" labelPosition="after" checked>
                                <input class="easyui-radiobutton" name="gender" value="女" label="女" labelPosition="after">
                            </div>
                            <div style="margin-bottom:20px">
                                <input class="easyui-textbox" name="phone" style="width:300px"
                                       data-options="label:'手机号码:',required:true,validType:'mobile'">
                            </div>
                            <div class="btn">
                                <a href="javascript:void(0)" class="easyui-linkbutton" onclick="userRegister()"
                                   style="width:100px">立即注册</a>
                            </div>

                            <%--用于js获取路径--%>
                            <input id="PageContext" type="hidden" value="${pageContext.request.contextPath}" />
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>