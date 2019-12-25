<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-CN">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
        <title>用户列表</title>

        <!-- Bootstrap -->
        <link href="${pageContext.request.contextPath}/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/userList.css" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/index.css" />

        <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
        <script src="${pageContext.request.contextPath}/plugins/bootstrap/js/jquery-1.12.4.min.js"></script>
        <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
        <script src="${pageContext.request.contextPath}/plugins/bootstrap/js/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/static/js/userList.js"></script>
        <!-- easyUI -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/plugins/easyui/themes/default/easyui.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/plugins/easyui/themes/icon.css">
        <script type="text/javascript" src="${pageContext.request.contextPath}/plugins/easyui/jquery.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/plugins/easyui/jquery.easyui.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/plugins/easyui/locale/easyui-lang-zh_CN.js"></script>
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
                    ${name}，欢迎您！  <a href="${pageContext.request.contextPath}/user/toLogin">安全退出</a>
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
                            <li><a href="${pageContext.request.contextPath}/user/findAllByPage" class="changeColor">用户管理</a></li>
                            <li><a href="${pageContext.request.contextPath}/movie/findMovieByPage">电影管理</a></li>
                            <li><a href="${pageContext.request.contextPath}/cinema/findCinemaByPage">影院管理</a></li>
                            <li><a href="${pageContext.request.contextPath}/slice/findSliceByPage">影片排期管理</a></li>
                            <li><a href="">订单管理</a></li>
                        </div>
                        <li><a href="${pageContext.request.contextPath}/user/userPersonal?uid=${uid}">个人中心</a></li>
                        <li><a href="">我的订单</a></li>
                    </ul>
                </div>
                <div class="col-md-10 body_middle">
                    <br><br><br>
                    <div class="container">
                        <div class="row">
                            <form class="form-inline" action="${pageContext.request.contextPath}/user/findAllByPage">
                                <div class="form-group">
                                    <label for="exampleInputName2">姓名</label>
                                    <input type="text" class="form-control" id="exampleInputName2" name="name" value="${selectName}">
                                </div>
                                <div class="form-group">
                                    &nbsp;&nbsp;<label>性别</label>
                                    <select class="form-control" name="gender" id="selectGender">
                                        <option value="" <c:if test="${selectGender == null || selectGender == ''}">selected</c:if>>--请选择--</option>
                                        <option value="男" <c:if test="${selectGender == '男'}">selected</c:if>>男</option>
                                        <option value="女" <c:if test="${selectGender == '女'}">selected</c:if>>女</option>
                                    </select>
                                </div>
                                &nbsp;&nbsp;<button type="submit" class="btn btn-default">查询</button>
                                &nbsp;&nbsp;<a class="btn btn-default" href="${pageContext.request.contextPath}/user/findAllByPage" role="button" onclick="clearValue()">清空</a>
                            </form>
                            <div style="float: right">
                                <a class="btn btn-primary" href="javascript:showRegister()" role="button">添加用户</a>
                            </div>
                        </div>
                        <br>
                        <div class="row">
                            <table class="table table-hover table-bordered">
                                <tr class="success">
                                    <td>编号</td>
                                    <td>用户名</td>
                                    <td>密码</td>
                                    <td>姓名</td>
                                    <td>性别</td>
                                    <td>手机号</td>
                                    <td>权限</td>
                                    <td>余额</td>
                                    <td>操作</td>
                                </tr>
                                <c:forEach var="user" items="${pageBean.list}" varStatus="s">
                                    <tr>
                                        <td>${(pageBean.currentPage-1) * (pageBean.pageCount) + s.count}</td>
                                        <td>${user.username}</td>
                                        <td>${user.password}</td>
                                        <td>${user.name}</td>
                                        <td>${user.gender}</td>
                                        <td>${user.phone}</td>
                                        <td>
                                            <c:if test="${user.permission == 1}">
                                                管理员
                                            </c:if>
                                            <c:if test="${user.permission == 0}">
                                                普通用户
                                            </c:if>
                                        </td>
                                        <td>${user.money}</td>
                                        <td>
                                            <a class="btn btn-default" href="#" role="button" onclick="findById(${user.uid})">修改</a>
                                            <a class="btn btn-default" href="#" role="button" onclick="del(${user.uid})">删除</a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </table>

                            <nav aria-label="Page navigation">
                                <ul class="pagination">
                                    <c:if test="${pageBean.currentPage == 1}">
                                    <li class="disabled">
                                        </c:if>
                                        <c:if test="${pageBean.currentPage != 1}">
                                    <li>
                                        </c:if>
                                        <a href="${pageContext.request.contextPath}/user/findAllByPage?currentPage=${pageBean.currentPage-1}&name=${selectName}&gender=${selectGender}" aria-label="Previous">
                                            <span aria-hidden="true">&laquo;</span>
                                        </a>
                                    </li>

                                    <c:forEach begin="1" end="${pageBean.totalPage}" var="i">
                                        <c:if test="${pageBean.currentPage == i}">
                                            <li class="active"><a href="${pageContext.request.contextPath}/user/findAllByPage?currentPage=${i}&name=${selectName}&gender=${selectGender}">${i}</a></li>
                                        </c:if>
                                        <c:if test="${pageBean.currentPage != i}">
                                            <li><a href="${pageContext.request.contextPath}/user/findAllByPage?currentPage=${i}&name=${selectName}&gender=${selectGender}">${i}</a></li>
                                        </c:if>
                                    </c:forEach>

                                    <c:if test="${pageBean.currentPage == pageBean.totalPage}">
                                    <li class="disabled">
                                        </c:if>
                                        <c:if test="${pageBean.currentPage != pageBean.totalPage}">
                                    <li>
                                        </c:if>
                                        <a href="${pageContext.request.contextPath}/user/findAllByPage?currentPage=${pageBean.currentPage+1}&name=${selectName}&gender=${selectGender}" aria-label="Next">
                                            <span aria-hidden="true">&raquo;</span>
                                        </a>
                                    </li>
                                    <span id="span_page">
                                        共${pageBean.totalCount}条记录，共${pageBean.totalPage}页
                                    </span>
                                </ul>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
            <%--用户注册模块窗口--%>
            <div id="winRegister" class="easyui-window" title="添加用户" style="width:500px;height: 518px"
                 data-options="iconCls:'icon-save',modal:true,closed:true">
                <div class="register">
                    <form id="registerForm" method="post" action="${pageContext.request.contextPath}/user/userAdd">
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
                            <input class="easyui-radiobutton" name="gender" value="男" label="男" labelPosition="after">
                            <input class="easyui-radiobutton" name="gender" value="女" label="女" labelPosition="after">
                        </div>
                        <div style="margin-bottom:20px">
                            <input class="easyui-textbox" name="phone" style="width:300px"
                                   data-options="label:'手机号码:',required:true,validType:'mobile'">
                        </div>
                        <div class="add_btn">
                            <input type="submit" value="立即添加"/>
                        </div>

                        <%--用于js获取路径--%>
                        <input id="PageContext" type="hidden" value="${pageContext.request.contextPath}" />
                    </form>
                </div>
            </div>

            <%--用户信息修改模块窗口--%>
            <div id="winUpdate" class="easyui-window" title="用户信息修改" style="width:500px;height: 568px"
                 data-options="iconCls:'icon-save',modal:true,closed:true">
                <div class="register">
                    <form method="post" action="${pageContext.request.contextPath}/user/userUpdate">
                        <input type="hidden" id="findUid" name="uid">
                        <div style="margin-bottom:20px">
                            <input class="easyui-textbox" id="findUsername" name="username" style="width:300px"
                                   data-options="label:'用户名:'">
                        </div>
                        <div style="margin-bottom:20px">
                            <input class="easyui-textbox" id="findPassword" name="password" style="width:300px"
                                   data-options="label:'密码:',required:true,validType:'length[6,16]'">
                        </div>
                        <div style="margin-bottom:20px">
                            <input class="easyui-textbox" name="name" style="width:300px" id="findName"
                                   data-options="label:'真实姓名:',required:true,validType:'trueName'">
                        </div>
                        <div style="margin-bottom:20px">
                            <label>性别:</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input class="easyui-radiobutton man" name="gender" value="男" label="男" labelPosition="after">
                            <input class="easyui-radiobutton woman" name="gender" value="女" label="女" labelPosition="after">
                        </div>
                        <div style="margin-bottom:20px">
                            <input class="easyui-textbox" id="findPhone" name="phone" style="width:300px"
                                   data-options="label:'手机号码:',required:true,validType:'mobile'">
                        </div>
                        <div style="margin-bottom:20px">
                            <select class="easyui-combobox" id="findPermission" name="permission" style="width:300px;"
                                    data-options="label:'权限:',required:true">
                                <option value="0">普通用户</option>
                                <option value="1">管理员</option>
                            </select>
                        </div>
                        <div style="margin-bottom:20px">
                            <input type="text" class="easyui-numberbox" id="findMoney" name="money" style="width:300px"
                                   data-options="label:'余额:',required:true,min:0,max:1000">
                        </div>
                        <div class="add_btn">
                            <input type="submit" value="立即修改"/>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
