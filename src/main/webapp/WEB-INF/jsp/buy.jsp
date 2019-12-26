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
    <link href="${pageContext.request.contextPath}/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/all.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/buy_index.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/font/iconfont.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/all.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/seatSelection.css">
    <script src="${pageContext.request.contextPath}/plugins/font/jquery-3.4.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/plugins/bootstrap/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/buy.js"></script>
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
                        <a data-toggle="modal" data-target="#seat_selection_dialog" onclick="show_seat_selection_dialog(event)">选座购票</a>
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

    <div class="modal fade" id="seat_selection_dialog" style="cursor: pointer" tabindex="-1" role="dialog" aria-labelledby="seat_selection_dialog_title"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h4 class="modal-title" id="seat_selection_dialog_title">
                        选座购票
                    </h4>
                </div>
                <div class="modal-body">
                    <div class="seat ">
                        <div class="title">
                            <div>
                                <i class="iconfont icon-zuowei seat_optional"></i>
                                <span>可选座位</span>
                            </div>
                            <div>
                                <i class="iconfont icon-zuowei seat_selected"></i>
                                <span>已选座位</span>
                            </div>
                            <div>
                                <i class="iconfont icon-zuowei seat_sold"></i>
                                <span>已售座位</span>
                            </div>
                        </div>
                        <div class="seatSection">
                        </div>
                    </div>
                    <div class="toBuy" style="background-color: background-color: #f9f9f9;">
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
                                        <li>时长：${movie.time} 分钟</li>
                                    </ul>
                                </div>
                            </div>
                        <div class="ticket_information">
<%--                            <div>${slice}</div>--%>
                            <div><span class="ti_title">影院：</span><span class="ti_val"></span></div>
                            <div><span class="ti_title">影厅：</span><span class="ti_val"></span></div>
                            <div><span class="ti_title">场次：</span><span class="ti_val"></span></div>
                            <div><span class="ti_title">票价：</span><span class="ti_val"></span></div>
                        </div>
                        <div class="seat col-sm-12" >
                            <div><span style="color: #999;font-size: 14px" >座位：（最多选择3个）</span></div>
                            <div class="seat_arr" style="display:inline-block;width: 100%;height: 50px;">

                            </div>
                        </div>
                        <div><span class="ti_title">总价：</span><span class="ti_val">￥0</span></div>
                        <div style="margin-top:10px; ">
                            <input type="button" class="btn_toBuy" onclick="toBuyToSub()" value="立即付款" />
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="${pageContext.request.contextPath}/static/js/seatSelection.js"></script>
</body>

</html>