<%--
  Created by IntelliJ IDEA.
  User: han
  Date: 2021/12/11
  Time: 17:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %><html>
<head>
    <title>更新座位</title>
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

<div style="padding-top:10%;padding-left: 30%;padding-right: 30%;">
    <form class="form-horizontal" role="form" action="UpdateSeat" onsubmit="alert('提交成功！')">
    <div class="form-group">
            <label for="SeatId" class="col-sm-2 control-label">座位编号：</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="SeatId" name="SeatId" value="${seat.seatId}" readonly>
            </div>
        </div>
        <div class="form-group">
            <label for="seatPosition" class="col-sm-2 control-label">座位位置：</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="seatPosition" name="seatPosition" value="${seat.seatPosition}" required>
            </div>
        </div>

        <div class="form-group">
            <label for="seatFloor" class="col-sm-2 control-label">所在楼层：</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="seatFloor" name="seatFloor" value="${seat.seatFloor}" required>
            </div>
        </div>

        <div class="form-group">
            <label for="seatStatus" class="col-sm-2 control-label">座位状态：</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="seatStatus" name="seatStatus" value="${seat.seatStatus}" required>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <button type="submit" class="btn btn-default" onclick="confirm('成功！');">确认</button>
                <a href="ManageSeat">
                    <button type="button" class="btn btn-default">取消</button>
                </a>
            </div>
        </div>
    </form>
</div>

</body>
</html>
