<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
    <head>
        <title>订单列表</title>
        <!-- Bootstrap -->
        <link href="${pageContext.request.contextPath}/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/orderList.css" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/index.css" />

        <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
        <script src="${pageContext.request.contextPath}/plugins/bootstrap/js/jquery-1.12.4.min.js"></script>
        <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
        <script src="${pageContext.request.contextPath}/plugins/bootstrap/js/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/static/js/orderList.js"></script>
        <!-- easyUI -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/plugins/easyui/themes/default/easyui.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/plugins/easyui/themes/icon.css">
        <script type="text/javascript" src="${pageContext.request.contextPath}/plugins/easyui/jquery.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/plugins/easyui/jquery.easyui.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/plugins/easyui/locale/easyui-lang-zh_CN.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/login.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/orderList.js"></script>
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
                        <li><a href="${pageContext.request.contextPath}/user/userPersonal?uid=${uid}">个人中心</a></li>
                        <li><a href="${pageContext.request.contextPath}/order/selectOrders?uid=${uid}" class="changeColor">我的订单</a></li>
                    </ul>
                </div>
                <div class="col-md-10 body_middle">
                    <br><br><br>
                    <div class="container">
                        <br>
                        <div class="row orderTable">
                            <table class="table table-hover table-bordered">
                                <input type="hidden" value="${pageBean.totalCount}" id="orderValue">
                                <tr class="success">
                                    <td>电影</td>
                                    <td>影院</td>
                                    <td>影厅</td>
                                    <td>价格</td>
                                    <td>播出时间</td>
                                </tr>
                                <c:forEach var="order" items="${pageBean.list}" varStatus="s">
                                    <tr>
                                        <td>${order.mname}</td>
                                        <td>${order.cname}</td>
                                        <td>${order.hname}</td>
                                        <td>${order.price}</td>
                                        <td>${order.playTime}</td>
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
                                        <a href="${pageContext.request.contextPath}/order/selectOrders?uid=${uid}&currentPage=${pageBean.currentPage-1}" aria-label="Previous">
                                            <span aria-hidden="true">&laquo;</span>
                                        </a>
                                    </li>

                                    <c:forEach begin="1" end="${pageBean.totalPage}" var="i">
                                        <c:if test="${pageBean.currentPage == i}">
                                            <li class="active"><a href="${pageContext.request.contextPath}/order/selectOrders?uid=${uid}&currentPage=${i}">${i}</a></li>
                                        </c:if>
                                        <c:if test="${pageBean.currentPage != i}">
                                            <li><a href="${pageContext.request.contextPath}/order/selectOrders?uid=${uid}&currentPage=${i}">${i}</a></li>
                                        </c:if>
                                    </c:forEach>

                                    <c:if test="${pageBean.currentPage == pageBean.totalPage}">
                                    <li class="disabled">
                                        </c:if>
                                        <c:if test="${pageBean.currentPage != pageBean.totalPage}">
                                    <li>
                                        </c:if>
                                        <a href="${pageContext.request.contextPath}/order/selectOrders?uid=${uid}&currentPage=${pageBean.currentPage+1}" aria-label="Next">
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
        </div>
    </body>
</html>
