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
    <title>更新预约</title>
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
    <form class="form-horizontal" role="form"
            <c:choose>
                <c:when test="${flag=='add'}">
                    action="AddReserve"
                </c:when>
                <c:when test="${flag=='update'}">
                    action="UpdateReserve"
                </c:when>
            </c:choose>
          onsubmit="alert('提交成功！')">
        <div class="form-group">
            <label for="ReserveId" class="col-sm-2 control-label">预约编号：</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="ReserveId" name="ReserveId" value="${reserve.reserveId}"
                       <c:if test="${flag=='update'}">readonly</c:if>>
            </div>
        </div>
        <div class="form-group">
            <label for="ReserveDate" class="col-sm-2 control-label">预约日期：</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="ReserveDate" name="ReserveDate" value="${reserve.reserveDate}" required>
            </div>
        </div>

        <div class="form-group">
            <label for="beginTime" class="col-sm-2 control-label">预约时间：</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="beginTime" name="beginTime" value="${reserve.beginTime}" required>
            </div>
        </div>

        <div class="form-group">
            <label for="EndTime" class="col-sm-2 control-label">离馆时间：</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="EndTime" name="EndTime" value="${reserve.endTime}" required>
            </div>
        </div>
        <div class="form-group">
            <label for="VerifyCode" class="col-sm-2 control-label">验证码：</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="VerifyCode" name="VerifyCode" value="${reserve.verifyCode}" required>
            </div>
        </div>
        <div class="form-group">
            <label for="ReserveStatus" class="col-sm-2 control-label">状态：</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="ReserveStatus" name="ReserveStatus" value="${reserve.reserveStatus}" required>
            </div>

        </div>
        <div class="form-group">
            <label for="SeatId" class="col-sm-2 control-label">座位编号：</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="SeatId" name="SeatId" value="${reserve.seatId}" required>
            </div>
        </div>
        <div class="form-group">
            <label for="UserId" class="col-sm-2 control-label">用户编号：</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="UserId" name="UserId" value="${reserve.userId}" required>
            </div>
        </div>

        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <button type="submit" class="btn btn-default">
                    <c:choose>
                        <c:when test="${flag=='add'}">
                            增加
                        </c:when>
                        <c:when test="${flag=='update'}">
                            更新
                        </c:when>
                    </c:choose>
                </button>
                <a href="ManageReserve">
                    <button type="button" class="btn btn-default">取消</button>
                </a>
            </div>
        </div>
    </form>
</div>

</body>
</html>
