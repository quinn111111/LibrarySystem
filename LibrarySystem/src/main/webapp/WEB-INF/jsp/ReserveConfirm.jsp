<%--
  Created by IntelliJ IDEA.
  User: han
  Date: 2021/12/10
  Time: 8:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<html>
<head>
    <title>确认预约信息</title>
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
    <form class="form-horizontal" role="form" action="ReserveSeat">
        <div class="form-group">
            <label for="ReserveDate" class="col-sm-2 control-label">预约日期：</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="ReserveDate" name="ReserveDate" value="${reserve.reserveDate}" readonly>
            </div>
        </div>
        <div class="form-group">
            <label for="BeginTime" class="col-sm-2 control-label">入馆时间：</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="BeginTime" name="BeginTime" value="${reserve.beginTime}" readonly>
            </div>
        </div>

        <div class="form-group">
            <label for="EndTime" class="col-sm-2 control-label">离馆时间：</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="EndTime" name="EndTime" value="${reserve.endTime}" readonly>
            </div>
        </div>

        <div class="form-group">
            <label for="ReserveFloor" class="col-sm-2 control-label">预约楼层：</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="ReserveFloor" name="ReserveFloor" value="${reserve.reserveFloor}" readonly>
            </div>
        </div>

        <div class="form-group">
            <label for="SeatId" class="col-sm-2 control-label">座位位置：</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="SeatId" name="SeatId" value="${reserve.seatId}" readonly>
            </div>
        </div>

        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <button type="submit" class="btn btn-default" onclick="alert('预约成功！');">确认</button>
                <a href="SeatShow">
                    <button type="button" class="btn btn-default">取消</button>
                </a>
            </div>
        </div>
    </form>
</div>
</body>
</html>
