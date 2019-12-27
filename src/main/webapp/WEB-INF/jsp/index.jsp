<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="zh-CN">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
        <title>首页</title>

        <!-- Bootstrap -->
        <link href="${pageContext.request.contextPath}/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/index.css" />

        <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
        <script src="${pageContext.request.contextPath}/plugins/bootstrap/js/jquery-1.12.4.min.js"></script>
        <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
        <script src="${pageContext.request.contextPath}/plugins/bootstrap/js/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/static/js/index.js"></script>
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
                        <li><a href="" class="changeColor">首页</a></li>
                        <input id="ifHidden" type="hidden" value="${permission}"/>
                        <div class="ifHidden">
                            <li><a href="${pageContext.request.contextPath}/user/findAllByPage">用户管理</a></li>
                            <li><a href="${pageContext.request.contextPath}/movie/findMovieByPage">电影管理</a></li>
                            <li><a href="${pageContext.request.contextPath}/cinema/findCinemaByPage">影院管理</a></li>
                            <li><a href="${pageContext.request.contextPath}/slice/findSliceByPage">影片排期管理</a></li>
                            <li><a href="">订单管理</a></li>
                        </div>
                        <li><a href="${pageContext.request.contextPath}/user/userPersonal?uid=${uid}">个人中心</a></li>
                        <li><a href="${pageContext.request.contextPath}/order/selectOrders?uid=${uid}">我的订单</a></li>
                    </ul>
                </div>

                <div class="col-md-6 body_middle">
                    <p>正在热映</p>
                    <table class="table">
                        <tr>
                            <td>
                                <img src="${pageContext.request.contextPath}/static/images/吹哨人.jpg">
                                <div class="goupiao" onclick="forwardBuy('吹哨人')">购票</div>
                            </td>
                            <td>
                                <img src="${pageContext.request.contextPath}/static/images/好莱坞往事.jpg">
                                <div class="goupiao" onclick="forwardBuy('好莱坞往事')">购票</div>
                            </td>
                            <td>
                                <img src="${pageContext.request.contextPath}/static/images/中国机长.jpg">
                                <div class="goupiao" onclick="forwardBuy('中国机长')">购票</div>
                            </td>
                            <td>
                                <img src="${pageContext.request.contextPath}/static/images/南方车站的聚会.jpg">
                                <div class="goupiao" onclick="forwardBuy('南方车站的聚会')">购票</div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <img src="${pageContext.request.contextPath}/static/images/冰雪奇缘.jpg">
                                <div class="goupiao" onclick="forwardBuy('冰雪奇缘')">购票</div>
                            </td>
                            <td>
                                <img src="${pageContext.request.contextPath}/static/images/勇敢者游戏.jpg">
                                <div class="goupiao" onclick="forwardBuy('勇敢者游戏')">购票</div>
                            </td>
                            <td>
                                <img src="${pageContext.request.contextPath}/static/images/我和我的祖国.jpg">
                                <div class="goupiao" onclick="forwardBuy('我和我的祖国')">购票</div>
                            </td>
                            <td>
                                <img src="${pageContext.request.contextPath}/static/images/少年的你.jpg">
                                <div class="goupiao" onclick="forwardBuy('少年的你')">购票</div>
                            </td>
                        </tr>
                    </table>
                </div>

                <div class="col-md-4 body_right">
                    <p>即将上映</p>
                    <table class="table table_right" >
                        <tr>
                            <td>
                                <img src="${pageContext.request.contextPath}/static/images/唐人街探案.jpg">
                                <div class="goupiao" onclick="forwardBuy('唐人街探案')">立即预售</div>
                            </td>
                            <td>
                                <img src="${pageContext.request.contextPath}/static/images/中国女排.jpg">
                                <div class="goupiao" onclick="forwardBuy('中国女排')">立即预售</div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <img src="${pageContext.request.contextPath}/static/images/姜子牙.jpg">
                                <div class="goupiao" onclick="forwardBuy('姜子牙')">立即预售</div>
                            </td>
                            <td>
                                <img src="${pageContext.request.contextPath}/static/images/星球大战.jpg">
                                <div class="goupiao" onclick="forwardBuy('星球大战')">立即预售</div>
                            </td>
                        </tr>
                    </table>

                </div>
            </div>
        </div>
        <%--用于js获取路径--%>
        <input id="PageContext" type="hidden" value="${pageContext.request.contextPath}" />
    </body>

</html>
