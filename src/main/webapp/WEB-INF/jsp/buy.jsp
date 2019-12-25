<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>${movie.name}</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/all.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/buy_index.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/font/iconfont.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/all.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/seatSelection.css">
    <script src="${pageContext.request.contextPath}/plugins/font/jquery-3.4.1.min.js"></script>
</head>

<body>
    <div class="buy">
        <div class="banner">
            <div class="wrapper">
                <div class="wra_cont_left">
                    <div class="ava_shadow">
                        <img class="ava" src="${pageContext.request.contextPath}/static/images/${movie.name}.jpg" alt="">
                        <div class="movie_ver">
                            <i></i>
                        </div>
                    </div>
                </div>
                <div class="wra_cont_right">
                    <div class="movie_brief">
                        <h3 class="name">${movie.name}</h3>
                        <ul>
                            <li>类型：
                                <c:if test="${movie.type == 1}">
                                    科幻
                                </c:if>
                                <c:if test="${movie.type == 2}">
                                    爱情
                                </c:if>
                                <c:if test="${movie.type == 3}">
                                    动作
                                </c:if>
                                <c:if test="${movie.type == 4}">
                                    喜剧
                                </c:if>
                                <c:if test="${movie.type == 5}">
                                    悬疑
                                </c:if>
                                <c:if test="${movie.type == 6}">
                                    剧情
                                </c:if>
                            </li>
                            <li>导演：${movie.director}</li>
                            <li>主演：${movie.actor}</li>
                            <li>时长：${movie.time} 分钟</li>
                            <li>${movie.createTime} 大陆上映</li>
                        </ul>
                        <div class="Introduction">
                            <h3>剧情简介</h3>
                            <p>
                                ${movie.remark}
                            </p>
                        </div>
                    </div>
                </div>

            </div>
        </div>

        <div class="cinemas_list">
            <h3>影院列表</h3>
            <c:forEach var="slice" items="${list}" varStatus="s">
            <div class="cinemas_cell">
                    <div class="cinema_info">
                        <a href="" class="cinema_name">
                            ${slice.cname}
                        </a>
                        <p class="cinema_address">
                            地址：${slice.address}
                        </p>
                    </div>
                    <div class="buy_btn">
                        <a href="">选座购票</a>
                    </div>
                    <div class="price">
                        <span class="rmb">￥</span>
                        <span class="price_num">${slice.price}</span>
                        <span>起</span>
                    </div>
            </div>
            </c:forEach>
            <!-- <div class="cinemas_cell"></div>
            <div class="cinemas_cell"></div>
            <div class="cinemas_cell"></div>
            <div class="cinemas_cell"></div>
            <div class="cinemas_cell"></div>
            <div class="cinemas_cell"></div>
            <div class="cinemas_cell"></div>
            <div class="cinemas_cell"></div>
            <div class="cinemas_cell"></div> -->
        </div>
    </div>

    <div class="seat">
        <div class="title">
            <div>
                <i class="iconfont icon-zuowei seat_optional"></i>
                <span>可选座位</span>
            </div>
            <div>
                <i class="iconfont icon-zuowei seat_selected"></i>
                <span>已售座位</span>
            </div>
            <div>
                <i class="iconfont icon-zuowei seat_sold"></i>
                <span>已选座位</span>
            </div>
        </div>
        <div class="seatSection">
        </div>
    </div>
    <script src="${pageContext.request.contextPath}/static/js/seatSelection.js"></script>
</body>

</html>