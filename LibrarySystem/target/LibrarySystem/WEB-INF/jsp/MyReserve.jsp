<%--
  Created by IntelliJ IDEA.
  User: han
  Date: 2021/12/10
  Time: 15:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %><html>
<head>
    <title>我的预约</title>
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
<div style="padding-top:50px;padding-right: 10%;padding-left: 10%;">
    <table class="table table-hover">
        <caption>我的所有预约订单</caption>
        <thead>
        <tr>
            <td></td>
            <th>预约日期</th>
            <th>入馆时间</th>
            <th>离馆时间</th>
            <th>预约楼层</th>
            <th>座位位置</th>
            <th>预约状态</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="reserve" items="${reserveList}">
            <tr>
                <td>${reserve.reserveId}</td>
                <td>${reserve.reserveDate}</td>
                <td>${reserve.beginTime}</td>
                <td>${reserve.endTime}</td>
                <td>${reserve.seat.seatFloor}</td>
                <td>${reserve.seat.seatPosition}</td>
                <td>${reserve.reserveStatus}</td>
                <td>
                    <a href="${pageContext.request.contextPath}/Reserve/CancelReserve?ReserveId=${reserve.reserveId}" onclick="return confirm('确定取消该预约?');">
                        <button type="button" class="btn btn-default">取消预约</button>
                    </a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

</body>
</html>
