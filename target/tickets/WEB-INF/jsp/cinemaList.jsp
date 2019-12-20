<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
        <title>电影列表</title>

        <!-- Bootstrap -->
        <link href="${pageContext.request.contextPath}/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/cinemaList.css" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/index.css" />

        <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
        <script src="${pageContext.request.contextPath}/plugins/bootstrap/js/jquery-1.12.4.min.js"></script>
        <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
        <script src="${pageContext.request.contextPath}/plugins/bootstrap/js/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/static/js/cinemaList.js"></script>
        <!-- easyUI -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/plugins/easyui/themes/default/easyui.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/plugins/easyui/themes/icon.css">
        <script type="text/javascript" src="${pageContext.request.contextPath}/plugins/easyui/jquery.easyui.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/plugins/easyui/locale/easyui-lang-zh_CN.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/cinemaList.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/login.js"></script>

    </head>
    <body>
        <div class="container-fluid" id="cinemalist">
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
                        <li><a href="${pageContext.request.contextPath}/cinema/findCinemaByPage" class="changeColor">影院管理</a></li>
                        <li><a href="">订单管理</a></li>
                        <li><a href="${pageContext.request.contextPath}/user/userPersonal?uid=${uid}">个人中心</a></li>
                        <li><a href="">我的订单</a></li>
                    </ul>
                </div>
                <div class="col-md-10 body_middle">
                    <br><br><br>
                    <div class="container">
                        <div class="row">
                            <form class="form-inline" action="${pageContext.request.contextPath}/cinema/findCinemaByPage">
                                <div class="form-group">
                                    <label for="exampleInputName2">影院名</label>
                                    <input type="text" class="form-control" id="exampleInputName2" name="name" value="${selectName}">
                                </div>
                                &nbsp;&nbsp;<button type="submit" class="btn btn-default">查询</button>
                                &nbsp;&nbsp;<a class="btn btn-default" href="${pageContext.request.contextPath}/cinema/findCinemaByPage" role="button" onclick="clearValue()">清空</a>
                            </form>
                            <div style="float: right">
                                <a class="btn btn-primary" href="javascript:showRegister()" role="button">添加影院</a>
                                <a class="btn btn-primary"  role="button" data-toggle="modal" data-target="#myModal" onclick="showAddHall()">添加影厅</a>
                                <%--<div class="btn btn-primary" role="button" @click.native="dialogVisible = true">添加影厅</div>--%>

                            </div>
                        </div>
                        <br>
                        <div class="row">
                            <table class="table table-hover table-bordered">
                                <tr class="success">
                                    <td>编号</td>
                                    <td>影院名</td>
                                    <td>地址</td>
                                    <td>操作</td>
                                </tr>
                                <c:forEach var="cinema" items="${pageBean.list}" varStatus="s">
                                    <tr>
                                        <td>${(pageBean.currentPage-1) * (pageBean.pageCount) + s.count}</td>
                                        <td>${cinema.name}</td>
                                        <td>${cinema.address}</td>
                                        <td>
                                            <a class="btn btn-default" href="#" role="button" onclick="findById(${cinema.cid})">修改</a>
                                            <a class="btn btn-default" href="#" role="button" onclick="del(${cinema.cid})">删除</a>
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
                                        <a href="${pageContext.request.contextPath}/cinema/findCinemaByPage?currentPage=${pageBean.currentPage-1}&name=${selectName}" aria-label="Previous">
                                            <span aria-hidden="true">&laquo;</span>
                                        </a>
                                    </li>

                                    <c:forEach begin="1" end="${pageBean.totalPage}" var="i">
                                        <c:if test="${pageBean.currentPage == i}">
                                            <li class="active"><a href="${pageContext.request.contextPath}/cinema/findCinemaByPage?currentPage=${i}&name=${selectName}">${i}</a></li>
                                        </c:if>
                                        <c:if test="${pageBean.currentPage != i}">
                                            <li><a href="${pageContext.request.contextPath}/cinema/findCinemaByPage?currentPage=${i}&name=${selectName}">${i}</a></li>
                                        </c:if>
                                    </c:forEach>

                                    <c:if test="${pageBean.currentPage == pageBean.totalPage}">
                                    <li class="disabled">
                                        </c:if>
                                        <c:if test="${pageBean.currentPage != pageBean.totalPage}">
                                    <li>
                                        </c:if>
                                        <a href="${pageContext.request.contextPath}/cinema/findCinemaByPage?currentPage=${pageBean.currentPage+1}&name=${selectName}" aria-label="Next">
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
            <div id="winRegister" class="easyui-window" title="添加影院" style="width:518px;height: 368px"
                 data-options="iconCls:'icon-save',modal:true,closed:true">
                <div class="register">
                    <form id="registerForm" method="post" action="${pageContext.request.contextPath}/cinema/cinemaAdd">
                        <div style="margin-bottom:20px">
                            <input class="easyui-textbox" name="name" style="width:300px"
                                   data-options="label:'影院名:',required:true,validType:'nameIsExist'">
                        </div>
                        <div style="margin-bottom:20px">
                            <input class="easyui-textbox" name="address" style="width:300px"
                                   data-options="label:'地址:',required:true">
                        </div>
                        <div class="add_btn">
                            <input type="submit" value="立即添加"/>
                        </div>

                        <%--用于js获取路径--%>
                        <input id="PageContext" type="hidden" value="${pageContext.request.contextPath}" />
                    </form>
                </div>
            </div>

            <%--添加影厅窗口--%>

            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                &times;
                            </button>
                            <h4 class="modal-title" id="myModalLabel">
                                添加影厅
                            </h4>
                        </div>
                        <div class="modal-body">
                            <form class="container-fluid">
                                <div class="row form-group change_cinema">
                                    <label class="col-sm-4">选择影院</label>
                                    <select class="col-sm-8 cinemaId" name="cid">
                                        <option value="">请选择</option>
                                    </select>
                                </div>
                                <div class="row  form-group movie_hall_name">
                                    <label class="col-sm-4">影厅名称</label>
                                    <input type="text" class="col-sm-8 hallName" name="name" onblur="checkHallName()"/>
                                </div>
                                <div class="row form-group people_num">
                                    <label class="col-sm-4 ">可容纳人数</label>
                                    <input type="number" min="1" max="1000" class="col-sm-8" name="capacity" />

                                </div>
                                <div class="row form-group col-sm-12 add_to_movie_hell">
                                    <input type="submit" value="立即添加">
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

            <%--<div id="winUpdate" class="easyui-window" title="添加影厅" style="width:518px;height: 568px"--%>
                 <%--data-options="iconCls:'icon-save',modal:true,closed:true">--%>
                <%--<div class="register">--%>
                    <%--<form id="addForm" method="post" action="${pageContext.request.contextPath}/hall/hallAdd">--%>
                        <%--<div style="margin-bottom:20px">--%>
                            <%--&lt;%&ndash;<select class="easyui-combobox" id="findCinema" name="cid" style="width:300px;"&ndash;%&gt;--%>
                                    <%--&lt;%&ndash;data-options="label:'影院名:',required:true">&ndash;%&gt;--%>
                                <%--&lt;%&ndash;<option value="">请选择</option>&ndash;%&gt;--%>
                            <%--&lt;%&ndash;</select>&ndash;%&gt;--%>
                            <%----%>
                        <%--</div>--%>
                        <%--<div style="margin-bottom:20px">--%>
                            <%--<input class="easyui-textbox" name="name" style="width:300px"--%>
                                   <%--data-options="label:'影厅名:',required:true,validType:'nameIsExist'">--%>
                        <%--</div>--%>
                        <%--<div style="margin-bottom:20px">--%>
                            <%--<input type="text" class="easyui-numberbox" name="capacity" style="width:310px"--%>
                                   <%--data-options="label:'容纳人数:',required:true">--%>
                        <%--</div>--%>
                        <%--<div class="add_btn">--%>
                            <%--<input type="submit" value="立即添加"/>--%>
                        <%--</div>--%>

                    <%--</form>--%>
                <%--</div>--%>
            <%--</div>--%>
        </div>
    </body>
</html>
