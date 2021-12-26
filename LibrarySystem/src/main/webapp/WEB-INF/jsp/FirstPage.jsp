<%--
  Created by IntelliJ IDEA.
  User: han
  Date: 2021/12/9
  Time: 21:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<html>
<head>
    <title>首页</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>
<body>

<div>
    <nav class="navbar navbar-default navbar-static-top" role="navigation">
        <div class="container-fluid">
            <div class="navbar-header">
                <a class="navbar-brand" href="${pageContext.request.contextPath}/Reserve/FirstPage">座位预约</a>
            </div>
            <div>
                <ul class="nav navbar-nav">
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            个人中心 <b class="caret"></b>
                        </a>
                        <ul class="dropdown-menu">
                            <li><a href="#">个人信息</a></li>
                            <li class="divider"></li>
                            <li><a href="${pageContext.request.contextPath}/Reserve/MyReserve">我的预约</a></li>
                            <li class="divider"></li>
                            <li><a href="${pageContext.request.contextPath}/LibUser/ManageLibUser">管理在馆人员</a></li>
                            <li class="divider"></li>
                            <li><a href="${pageContext.request.contextPath}/User/ManageUser">管理用户</a></li>
                            <li class="divider"></li>
                            <li><a href="${pageContext.request.contextPath}/Seat/ManageSeat">管理座位</a></li>
                            <li class="divider"></li>
                            <li><a href="${pageContext.request.contextPath}/Reserve/ManageReserve">管理预约</a></li>
                            <li class="divider"></li>
                            <li><a href="#">退出登录</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
</div>
<div style="padding-left: 250px;padding-right: 250px">
    <ul class="nav nav-tabs">
        <li class="active"><a href="${pageContext.request.contextPath}/">预约中心</a></li>
        <li style="float:right;"><a href="${pageContext.request.contextPath}/">使用规则</a></li>
    </ul>
    <c:choose>
        <c:when test="${flag=='NoReserve'}">
            <div align="center" style="padding: 50px">
                <p style="font-size: 40px;font-family:'楷体';">图书馆</p>
                <p style="font-size: 20px;color: gray;font-family:'楷体';">（开放时间：8:00-22:00）</p>
                <p style="font-size: 30px;color: royalblue;font-family:'楷体';">你还没有任何预约哦</p>
                <p style="font-size: 20px;color: gray;font-family:'楷体';">快去图书馆学习叭</p>
            </div>
        </c:when>
        <c:otherwise>
            <div align="center" style="padding: 50px">
                <p style="font-size: 40px;font-family:'楷体';">图书馆</p>
                <p style="font-size: 20px;color: gray;font-family:'楷体';">（开放时间：8:00-22:00）</p>
                <p style="font-size: 30px;color: royalblue;font-family: '楷体';">你最近一次的预约：</p>
                <p style="font-size: 25px;font-family:'楷体';">预定日期：${reserve.reserveDate}</p>
                <p style="font-size: 25px;font-family:'楷体';">预约时间：${reserve.beginTime}</p>
                <p style="font-size: 25px;font-family:'楷体';">预约位置：${reserve.seat.seatFloor}${reserve.seat.seatPosition}</p>
                <p style="font-size: 25px;color: royalblue;font-family:'楷体';">状态：${reserve.reserveStatus}</p>
            </div>
        </c:otherwise>
    </c:choose>
    <div>
        <c:choose>
            <c:when test="${flag=='NoReserve'}">
                <div style="display: inline;width: 100%;padding-left: 40%;padding-right: 40%;"><!-- 标准的按钮 -->
                    <a href="${pageContext.request.contextPath}/Reserve/SeatShow">
                        <button type="button" class="btn btn-default" style="height: 50px;width:200px;background-color: cornflowerblue;">座位预约</button>
                    </a>
                </div>
            </c:when>
            <c:otherwise>
                <div style="display: inline;width: 45%;float: left;padding-left: 25%;"><!-- 标准的按钮 -->
                    <a href="${pageContext.request.contextPath}/Reserve/SeatShow">
                        <button type="button" class="btn btn-default" style="height: 50px;width:200px;background-color: cornflowerblue;">座位预约</button>
                    </a>
                </div>
                <div style="display: inline;width: 45%;float: right;padding-right: 25%">
                    <a href="${pageContext.request.contextPath}/Reserve/CancelFirstReserve?ReserveId=${reserve.reserveId}" onclick="return confirm('确定取消该预约?');">
                        <button type="button" class="btn btn-default" style="float: right;height: 50px;width:200px;background-color: cornflowerblue;">取消预约</button>
                    </a>
                </div>
            </c:otherwise>
        </c:choose>
    </div>
</div>
</body>
</html>
