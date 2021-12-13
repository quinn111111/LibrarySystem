<%--
  Created by IntelliJ IDEA.
  User: han
  Date: 2021/12/11
  Time: 20:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %><html><html>
<head>
    <title>更新/添加在馆用户</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script>
        function toVaild() {
            alert("提交成功！");
        }
    </script>
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

<div style="padding-top:10%;padding-left: 30%;padding-right: 30%;">
    <form class="form-horizontal" role="form"
            <c:choose>
                <c:when test="${flag=='add'}">
                    action="AddUserInLib"
                </c:when>
                <c:when test="${flag=='update'}">
                    action="UpdateUserInLib"
                </c:when>
            </c:choose>
          onsubmit="toVaild()">
        <div class="form-group">
            <label for="UserId" class="col-sm-2 control-label">用户编号：</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="UserId" name="UserId" value="${userInLib.userId}"
                       <c:if test="${flag=='update'}">required</c:if>>
            </div>
        </div>
        <div class="form-group">
            <label for="timeInLib" class="col-sm-2 control-label">入馆时间：</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="timeInLib" name="timeInLib" value="${userInLib.timeInLib}" required>
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
                <a href="ManageUserInLib">
                    <button type="button" class="btn btn-default">取消</button>
                </a>
            </div>
        </div>
    </form>
</div>
</body>
</html>
