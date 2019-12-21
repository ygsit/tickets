<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
        <title>影片排期列表</title>

        <!-- Bootstrap -->
        <link href="${pageContext.request.contextPath}/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/sliceList.css" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/index.css" />

        <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
        <script src="${pageContext.request.contextPath}/plugins/bootstrap/js/jquery-1.12.4.min.js"></script>
        <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
        <script src="${pageContext.request.contextPath}/plugins/bootstrap/js/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/static/js/sliceList.js"></script>
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
                    ${name}，欢迎您！ <a href="${pageContext.request.contextPath}/user/toLogin">安全退出</a>
                </div>
            </div>
            <!--正文-->
            <div class="row index_body">
                <div class="col-md-2 body_left">
                    <p>导航菜单</p>
                    <ul class="list-unstyled">
                        <li><a href="${pageContext.request.contextPath}/user/forwardIndex">首页</a></li>
                        <li><a href="${pageContext.request.contextPath}/user/findAllByPage">用户管理</a></li>
                        <li><a href="${pageContext.request.contextPath}/movie/findMovieByPage">电影管理</a></li>
                        <li><a href="${pageContext.request.contextPath}/cinema/findCinemaByPage">影院管理</a></li>
                        <li><a href="${pageContext.request.contextPath}/slice/findSliceByPage" class="changeColor">影片排期管理</a></li>
                        <li><a href="">订单管理</a></li>
                        <li><a href="${pageContext.request.contextPath}/user/userPersonal?uid=${uid}">个人中心</a></li>
                        <li><a href="">我的订单</a></li>
                    </ul>
                </div>
                <div class="col-md-10 body_middle">
                    <br><br><br>
                    <div class="container">
                        <div class="row">
                            <form class="form-inline" action="${pageContext.request.contextPath}/slice/findSliceByPage">
                                <div class="form-group">
                                    <label for="exampleInputName">影院名</label>
                                    <input type="text" class="form-control" id="exampleInputName" name="cname" value="${selectCName}">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputName2">电影名</label>
                                    <input type="text" class="form-control" id="exampleInputName2" name="mname" value="${selectMName}">
                                </div>
                                &nbsp;&nbsp;<button type="submit" class="btn btn-default">查询</button>
                                &nbsp;&nbsp;<a class="btn btn-default" href="${pageContext.request.contextPath}/slice/findSliceByPage" role="button" onclick="clearValue()">清空</a>
                            </form>
                            <div style="float: right">
                                <a class="btn btn-primary" href="javascript:showRegister()" role="button">添加影片排期</a>
                            </div>
                        </div>
                        <br>
                        <div class="row">
                            <table class="table table-hover table-bordered">
                                <tr class="success">
                                    <td>编号</td>
                                    <td>影院名称</td>
                                    <td>影厅名称</td>
                                    <td>电影名称</td>
                                    <td>票价</td>
                                    <td>上映时间</td>
                                    <td>操作</td>
                                </tr>
                                <c:forEach var="slice" items="${pageBean.list}" varStatus="s">
                                    <tr>
                                        <td>${(pageBean.currentPage-1) * (pageBean.pageCount) + s.count}</td>
                                        <td>${slice.cname}</td>
                                        <td>${slice.hname}</td>
                                        <td>${slice.mname}</td>
                                        <td>${slice.price}</td>
                                        <td>${slice.playTime}</td>
                                        <td>
                                            <a class="btn btn-default" href="#" role="button" onclick="findById(${slice.sid})">修改</a>
                                            <a class="btn btn-default" href="#" role="button" onclick="del(${slice.sid})">删除</a>
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
                                        <a href="${pageContext.request.contextPath}/slice/findSliceByPage?currentPage=${pageBean.currentPage-1}&cname=${selectCName}&mname=${selectMName}" aria-label="Previous">
                                            <span aria-hidden="true">&laquo;</span>
                                        </a>
                                    </li>

                                    <c:forEach begin="1" end="${pageBean.totalPage}" var="i">
                                        <c:if test="${pageBean.currentPage == i}">
                                            <li class="active"><a href="${pageContext.request.contextPath}/slice/findSliceByPage?currentPage=${i}&cname=${selectCName}&mname=${selectMName}">${i}</a></li>
                                        </c:if>
                                        <c:if test="${pageBean.currentPage != i}">
                                            <li><a href="${pageContext.request.contextPath}/slice/findSliceByPage?currentPage=${i}&cname=${selectCName}&mname=${selectMName}">${i}</a></li>
                                        </c:if>
                                    </c:forEach>

                                    <c:if test="${pageBean.currentPage == pageBean.totalPage}">
                                    <li class="disabled">
                                        </c:if>
                                        <c:if test="${pageBean.currentPage != pageBean.totalPage}">
                                    <li>
                                        </c:if>
                                        <a href="${pageContext.request.contextPath}/slice/findSliceByPage?currentPage=${pageBean.currentPage+1}&cname=${selectCName}&mname=${selectMName}" aria-label="Next">
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
            <%--电影添加模块窗口--%>
            <div id="winRegister" class="easyui-window" title="添加电影 " style="width:518px;height: 568px"
                 data-options="iconCls:'icon-save',modal:true,closed:true">
                <div class="register">
                    <form id="registerForm" method="post" action="${pageContext.request.contextPath}/movie/movieAdd">
                        <div style="margin-bottom:20px">
                            <input class="easyui-textbox" name="name" style="width:300px"
                                   data-options="label:'电影名:',required:true">
                        </div>
                        <div style="margin-bottom:20px">
                            <input class="easyui-textbox" name="director" style="width:300px"
                                   data-options="label:'导演:',required:true">
                        </div>
                        <div style="margin-bottom:20px">
                            <input class="easyui-textbox" style="width:300px" name="actor"
                                   data-options="label:'主演:',required:true">
                        </div>
                        <div style="margin-bottom:20px">
                            <select class="easyui-combobox" name="type" style="width:300px;"
                                    data-options="label:'类型:',required:true">
                                <option value="1">科幻片</option>
                                <option value="2">爱情片</option>
                                <option value="3">动作片</option>
                                <option value="4">喜剧片</option>
                                <option value="5">悬疑片</option>
                                <option value="6">剧情片</option>
                            </select>
                        </div>
                        <div style="margin-bottom:20px">
                            <input class="easyui-datetimebox" name="createTime" style="width:300px"
                                   data-options="label:'上映时间:',required:true">
                        </div>
                        <div style="margin-bottom:20px">
                            <input class="easyui-textbox" name="time" style="width:300px"
                                   data-options="label:'片长:',required:true">
                        </div>
                        <div style="margin-bottom:20px">
                            <input class="easyui-textbox" name="remark" style="height:100px;width:300px"
                                   data-options="multiline:true,label:'简介:',required:true">
                        </div>
                        <div class="add_btn">
                            <input type="submit" value="立即添加"/>
                        </div>

                        <%--用于js获取路径--%>
                        <input id="PageContext" type="hidden" value="${pageContext.request.contextPath}" />
                    </form>
                </div>
            </div>
            <%--电影修改模块窗口--%>
            <div id="winUpdate" class="easyui-window" title="修改电影信息" style="width:518px;height: 568px"
                 data-options="iconCls:'icon-save',modal:true,closed:true">
                <div class="register">
                    <form id="updateForm" method="post" action="${pageContext.request.contextPath}/movie/movieUpdate">
                        <input type="hidden" id="findMid" name="mid">
                        <div style="margin-bottom:20px">
                            <input class="easyui-textbox" name="name" id="findName" style="width:300px"
                                   data-options="label:'电影名:',required:true">
                        </div>
                        <div style="margin-bottom:20px">
                            <input class="easyui-textbox" name="director" id="findDirector" style="width:300px"
                                   data-options="label:'导演:',required:true">
                        </div>
                        <div style="margin-bottom:20px">
                            <input class="easyui-textbox" style="width:300px" name="actor" id="findActor"
                                   data-options="label:'主演:',required:true">
                        </div>
                        <div style="margin-bottom:20px">
                            <select class="easyui-combobox" name="type" style="width:300px;" id="findType"
                                    data-options="label:'类型:',required:true">
                                <option value="1">科幻片</option>
                                <option value="2">动作片</option>
                                <option value="3">爱情片</option>
                                <option value="4">喜剧片</option>
                                <option value="5">悬疑片</option>
                                <option value="6">剧情片</option>
                            </select>
                        </div>
                        <div style="margin-bottom:20px">
                            <input class="easyui-datetimebox" name="createTime" style="width:300px" id="findCreateTime"
                                   data-options="label:'上映时间:',required:true">
                        </div>
                        <div style="margin-bottom:20px">
                            <input class="easyui-textbox" name="time" style="width:300px" id="findTime"
                                   data-options="label:'片长:',required:true">
                        </div>
                        <div style="margin-bottom:20px">
                            <input class="easyui-textbox" name="remark" style="height:100px;width:300px" id="findRemark"
                                   data-options="multiline:true,label:'简介:',required:true">
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
