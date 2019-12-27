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
                        <input id="ifHidden" type="hidden" value="${permission}"/>
                        <div class="ifHidden">
                            <li><a href="${pageContext.request.contextPath}/user/findAllByPage">用户管理</a></li>
                            <li><a href="${pageContext.request.contextPath}/movie/findMovieByPage">电影管理</a></li>
                            <li><a href="${pageContext.request.contextPath}/cinema/findCinemaByPage">影院管理</a></li>
                            <li><a href="${pageContext.request.contextPath}/slice/findSliceByPage" class="changeColor">影片排期管理</a></li>
                        </div>
                        <li><a href="${pageContext.request.contextPath}/user/userPersonal?uid=${uid}">个人中心</a></li>
                        <li><a href="${pageContext.request.contextPath}/order/selectOrders?uid=${uid}">我的订单</a></li>
                    </ul>
                </div>
                <div class="col-md-10 body_middle">
                    <br><br><br>
                    <div class="container">
                        <div class="row">
                            <form class="form-inline" action="${pageContext.request.contextPath}/slice/findSliceByPage">
                                <%--用于js获取路径--%>
                                <input id="PageContext" type="hidden" value="${pageContext.request.contextPath}" />
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
                                <a class="btn btn-primary" role="button"  data-toggle="modal" data-target="#movie_schedules_increase" onclick="view_movie_release()">添加影片排期</a>
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
                                        <td style="display: none">${slice.sid}</td>
                                        <td>
                                            <a class="btn btn-default"  role="button" data-toggle="modal" data-target="#update_movie_schedules_increase" onclick="view_update_movie_schedules(event)">修改</a>
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
            <div class="modal fade" id="movie_schedules_increase" tabindex="-1" role="dialog" aria-labelledby="movie_schedules_increase_title"
                 aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                &times;
                            </button>
                            <h4 class="modal-title" id="movie_schedules_increase_title">
                                影片排期
                            </h4>
                        </div>
                        <div class="modal-body">
                            <form id="add_movie_schedules_increase_form" class="container-fluid" method="post"
                                  action="${pageContext.request.contextPath}/slice/sliceAdd"
                                  onsubmit="">
                                <div class="row form-group change_cinema">
                                    <label class="col-sm-4">选择影院</label>
                                    <select class="col-sm-8 cinemaId" name="cname" onblur="movie_cc()">
                                        <option value="">请选择</option>
                                    </select>
                                    <span class="col-sm-offset-4 col-sm-8"></span>
                                </div>

                                <div class="row  form-group ">
                                    <label class="col-sm-4">选择放映厅</label>
                                    <select class="col-sm-8 changeHall" name="hname" onfocus="getHalls(event)">
                                        <option value="">请选择</option>
                                    </select>
                                    <span class="col-sm-offset-4 col-sm-8"></span>
                                </div>

                                <div class="row  form-group ">
                                    <label class="col-sm-4">电影名称</label>
                                    <input type="text" class="col-sm-8 movie_name" name="mname"
                                           placeholder="请输入电影名称" onblur="" required/>
                                    <span class="col-sm-offset-4 col-sm-8"></span>
                                </div>

                                <div class="row  form-group ">
                                    <label class="col-sm-4">排期上映时间</label>
                                    <input type="date" class="col-sm-4 release_time_date" name="yearMonth"
                                           placeholder="请输入日期" min="" onblur="" required/>
                                    <input type="time" class="col-sm-4 release_time_time" name="dayMinutes"
                                           placeholder="请输入时间" min="" onblur="" required/>
                                    <span class="col-sm-offset-4 col-sm-8"></span>
                                </div>

                                <div class="row  form-group ">
                                    <label class="col-sm-4">票价</label>
                                    <input type="text" class="col-sm-8 price" name="price"
                                           placeholder="请输入票价"  onblur="" required/>
                                    <span class="col-sm-offset-4 col-sm-8"></span>
                                </div>

                                <div class="add_btn row form-group col-sm-12 ">
                                    <input type="submit" value="立即添加">
                                </div>

                                <%--用于js获取路径--%>
                                <input id="PageContext" type="hidden" value="${pageContext.request.contextPath}"/>
                            </form>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

            <%--电影修改模块窗口--%>
            <div class="modal fade" id="update_movie_schedules_increase" tabindex="-1" role="dialog" aria-labelledby="update_movie_schedules_increase_title"
                 aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                &times;
                            </button>
                            <h4 class="modal-title" id="update_movie_schedules_increase_title">
                                影片排期
                            </h4>
                        </div>
                        <div class="modal-body">
                            <form id="update_movie_schedules_increase_form" class="container-fluid" method="post"
                                  action="${pageContext.request.contextPath}/slice/sliceUpdate"
                                  onsubmit="">
                                <div class="row form-group change_cinema">
                                    <label class="col-sm-4">选择影院</label>
                                    <select class="col-sm-8 cinemaId" name="cname" onblur="movie_cc()">
                                        <option value="">请选择</option>
                                    </select>
                                    <span class="col-sm-offset-4 col-sm-8"></span>
                                </div>

                                <div class="row  form-group ">
                                    <label class="col-sm-4">选择放映厅</label>
                                    <select class="col-sm-8 changeHall" name="hname" onfocus="getHalls(event)">
                                        <option value="">请选择</option>
                                    </select>
                                    <span class="col-sm-offset-4 col-sm-8"></span>
                                </div>

                                <div class="row  form-group ">
                                    <label class="col-sm-4">电影名称</label>
                                    <input type="text" class="col-sm-8 movie_name" name="mname"
                                           placeholder="请输入电影名称" onblur="" required/>
                                    <span class="col-sm-offset-4 col-sm-8"></span>
                                </div>


                                <div class="row  form-group ">
                                    <label class="col-sm-4">排期上映时间</label>
                                    <input type="date" class="col-sm-4 release_time_date" name="yearMonth"
                                           placeholder="请输入日期" min="" onblur="" required/>
                                    <input type="time" class="col-sm-4 release_time_time" name="dayMinutes"
                                           placeholder="请输入时间" min="" onblur="" required/>
                                    <span class="col-sm-offset-4 col-sm-8"></span>
                                </div>

                                <div class="row  form-group ">
                                    <label class="col-sm-4">票价</label>
                                    <input type="text" class="col-sm-8 price" name="price"
                                           placeholder="请输入票价"  onblur="" required/>
                                    <span class="col-sm-offset-4 col-sm-8"></span>
                                </div>
                                <input type="hidden" class="update_mov_sch_sid" name="sid" >

                                <div class="add_btn row form-group col-sm-12 ">
                                    <input type="submit" value="立即修改">
                                </div>

                            </form>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
