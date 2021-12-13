<%--
  Created by IntelliJ IDEA.
  User: han
  Date: 2021/12/10
  Time: 23:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %><html>
<head>
    <title>座位管理</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>


<div>
    <nav class="navbar navbar-default navbar-static-top" role="navigation">
        <div class="container-fluid">
            <div class="navbar-header">
                <a class="navbar-brand" href="FirstPage">座位预约</a>
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
                            <li><a href="MyOrder">我的预约</a></li>
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
        <caption>座位信息</caption>
        <thead>
        <tr>
            <th>座位编号</th>
            <th>所在楼层</th>
            <th>座位位置</th>
            <th>座位状态</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="seat" items="${seatList}">
            <tr>
                <td>${seat.seatId}</td>
                <td>${seat.floor}</td>
                <td>${seat.seatPosition}</td>
                <td>${seat.seatStatus}</td>
                <td>
                    <a href="UpdateSeatPage?SeatId=${seat.seatId}">
                        <button type="button" class="btn btn-default">修改</button>
                    </a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>
