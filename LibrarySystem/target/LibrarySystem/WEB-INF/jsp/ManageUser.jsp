<%--
  Created by IntelliJ IDEA.
  User: han
  Date: 2021/12/10
  Time: 23:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.pojo.User"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %><html>
<head>
    <title>用户管理</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script>
        function Warning(){
            var x;
            var r=confirm("用户一经删除所有信息均会被删除，且不可恢复，请谨慎删除该用户！");
            if (r==true){
                return true;
            }
            else{
                return false;
            }
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
                            <li class="divider"></li>
                            <li><a href="${pageContext.request.contextPath}/userInLib/ManageUserInLib">管理在馆人员</a></li>
                            <li class="divider"></li>
                            <li><a href="${pageContext.request.contextPath}/user/ManageUser">管理用户</a></li>
                            <li class="divider"></li>
                            <li><a href="${pageContext.request.contextPath}/seat/ManageSeat">管理座位</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
</div>


<div style="padding-top:50px;padding-right: 10%;padding-left: 10%;">
    <table class="table table-hover">
        <caption>用户信息</caption>
        <thead>
        <tr>
            <th>用户编号</th>
            <th>用户名</th>
            <th>密码</th>
            <th>权限</th>
            <th>余额</th>
            <th>违约次数</th>
            <th>操作
                <a href="AddUserPage">
                    <button type="button" class="btn btn-default">添加</button>
                </a>
            </th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="user" items="${userList}">
            <tr>
                <td>${user.userId}</td>
                <td>${user.userName}</td>
                <td>${user.password}</td>
                <td>${user.permission}</td>
                <td>${user.balance}</td>
                <td>${user.breachNum}</td>
                <td>
                    <a href="UpdateUserPage?UserId=${user.userId}">
                        <button type="button" class="btn btn-default">修改</button>
                    </a>
                    <a href="DeleteUser?UserId=${user.userId}" onsubmit="Warning()">
                        <button type="button" class="btn btn-default">删除</button>
                    </a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>
