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
    <title>更新/增加用户</title>
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
                    action="AddUser"
                </c:when>
                <c:when test="${flag=='update'}">
                    action="UpdateUser"
                </c:when>
            </c:choose>
          onsubmit="alert('提交成功！')">
        <div class="form-group">
            <label for="UserId" class="col-sm-2 control-label">用户编号：</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="UserId" name="UserId" value="${user.userId}"
                <c:choose>
                <c:when test="${flag=='add'}">
                       required
                </c:when>
                <c:when test="${flag=='update'}">
                       readonly
                </c:when>
                </c:choose>
                >
            </div>
        </div>
        <div class="form-group">
            <label for="userName" class="col-sm-2 control-label">用户名：</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="userName" name="userName" value="${user.userName}" required>
            </div>
        </div>

        <div class="form-group">
            <label for="password" class="col-sm-2 control-label">密码：</label>
            <div class="col-sm-10">
                <input type="password" class="form-control" id="password" name="password" value="${user.password}" required>
            </div>
        </div>
        <div class="form-group">
            <label for="permission" class="col-sm-2 control-label">权限：</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="permission" name="permission" value="${user.permission}" required>
            </div>
        </div>
        <div class="form-group">
            <label for="breachNum" class="col-sm-2 control-label">违约次数：</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="breachNum" name="breachNum" value="${user.breachNum}">
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
                <a href="ManageUser">
                    <button type="button" class="btn btn-default">取消</button>
                </a>
            </div>
        </div>
    </form>
</div>

</body>
</html>
