<%--
  Created by IntelliJ IDEA.
  User: han
  Date: 2021/12/19
  Time: 21:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<html>
<head>
    <title>座位预约</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script>

        function toCopy() {
            document.getElementById("ReserveDate2").value = document.getElementById("ReserveDate").value;
            document.getElementById("BeginTime2").value = document.getElementById("BeginTime").value;
            document.getElementById("EndTime2").value = document.getElementById("EndTime").value;
            document.getElementById("ReserveFloor2").value = document.getElementById("ReserveFloor").value;
            return true;
        }

        function toVaild(){
            var ReserveDate = document.getElementById("ReserveDate").value;
            var beginTime = document.getElementById("BeginTime").value;
            var endTime = document.getElementById("EndTime").value;

            var beginDate = new Date(ReserveDate+" "+beginTime);
            var nowDate = new Date();
            var endDate = new Date(ReserveDate+" "+endTime);

            var openDate = new Date(ReserveDate+" "+"08:00:00");
            var closeDate = new Date(ReserveDate+" "+"22:00:00");

            alert("beginDate="+beginDate+"nowDate="+nowDate+"endDate="+endDate);

            if(beginDate <= nowDate)
            {
                alert("输入日期不正确！请重新输入！");
                return false;
            }
            else if(endDate <= beginDate){
                alert("离馆时间不正确！请重新输入！");
                return false;
            }
            else if(beginDate < openDate || endDate > closeDate){
                alert("请在图书馆的开放时间内预定！（8:00-22:00）");
                return false;
            }
            else{
                alert("提交成功！");
                return true;
            }
        }


        window.onload = function addListener(){
            for (let i = 1; i <= 6; i++)
            {
                for(let j = 1; j <= 9; j++)
                {
                    let idA = "A".concat(i,"0",j);
                    let idB = "B".concat(i,"0",j);
                    document.getElementById(idA).onclick=function (){
                        document.getElementById("SeatId").value=idA;
                    }
                    document.getElementById(idB).onclick=function (){
                        document.getElementById("SeatId").value=idB;
                    }
                }
            }
        }
    </script>
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

<div style="margin-left: 10%;margin-right: 10%">
    <div style="width: 100%;"><!--整体-->
        <div style="padding: 50px">
            <form class="form-inline" role="form" action="SeatShow" method="post" onsubmit="toVaild()">
                <div class="form-group">
                    <label for="ReserveDate">预约日期：</label>
                    <input type="date" class="form-control" id="ReserveDate" name="ReserveDate"
                    <c:if test="${reserve.reserveDate!=null}">
                           value="${reserve.reserveDate}"
                    </c:if>
                    >
                </div>
                <div class="form-group">
                    <label for="BeginTime">到馆时间：</label>
                    <input type="time" class="form-control" id="BeginTime" name="BeginTime"
                    <c:if test="${reserve.beginTime!=null}">
                           value="${reserve.beginTime}"
                    </c:if>
                    >
                </div>
                <div class="form-group">
                    <label for="EndTime">离馆时间：</label>
                    <input type="time" class="form-control" id="EndTime" name="EndTime"
                    <c:if test="${reserve.endTime!=null}">
                           value="${reserve.endTime}"
                    </c:if>>
                </div>
                <div class="form-group">
                    <label for="ReserveFloor">选择楼层：</label>
                    <select class="form-control" name="ReserveFloor" id="ReserveFloor"
                            <c:if test="${reserve.reserveFloor!=null}">
                                value="${reserve.reserveFloor}"
                            </c:if>>
                        >
                        <option>1</option>
                        <option>2</option>
                        <option>3</option>
                        <option>4</option>
                    </select>
                </div>
                <button type="submit" class="btn btn-default">点击查看空闲座位</button>
            </form>
        </div>
        <table style="width: 100%;text-align: center;">
            <thead>
            <tr>
                <td>A区</td>
                <td>B区</td>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>
                    <div style="width: 100%;padding-left: 5%;">
                        <table>
                            <tbody>
                            <tr>
                                <td><button type="button" class="btn btn-default" style="height: 50px;width: 50px" id="A101" ${SeatIdMap.get("A101")}>座位</button></td>
                                <td><button type="button" class="btn btn-default" style="height: 50px;width: 50px" id="A102" ${SeatIdMap.get("A102")}>座位</button></td>
                                <td><button type="button" class="btn btn-default" style="height: 50px;width: 50px" id="A103" ${SeatIdMap.get("A103")}>座位</button></td>
                                <td><div style="width: 10px"></div></td>
                                <td><button type="button" class="btn btn-default" style="height: 50px;width: 50px" id="A104" ${SeatIdMap.get("A104")}>座位</button></td>
                                <td><button type="button" class="btn btn-default" style="height: 50px;width: 50px" id="A105" ${SeatIdMap.get("A105")}>座位</button></td>
                                <td><button type="button" class="btn btn-default" style="height: 50px;width: 50px" id="A106" ${SeatIdMap.get("A106")}>座位</button></td>
                                <td><div style="width: 10px"></div></td>
                                <td><button type="button" class="btn btn-default" style="height: 50px;width: 50px" id="A107" ${SeatIdMap.get("A107")}>座位</button></td>
                                <td><button type="button" class="btn btn-default" style="height: 50px;width: 50px" id="A108" ${SeatIdMap.get("A108")}>座位</button></td>
                                <td><button type="button" class="btn btn-default" style="height: 50px;width: 50px" id="A109" ${SeatIdMap.get("A109")}>座位</button></td>
                            </tr>
                            <tr>
                                <td><button type="button" class="btn btn-default" style="height: 50px;width: 50px" id="A201" ${SeatIdMap.get("A201")}>座位</button></td>
                                <td><button type="button" class="btn btn-default" style="height: 50px;width: 50px" id="A202" ${SeatIdMap.get("A202")}>座位</button></td>
                                <td><button type="button" class="btn btn-default" style="height: 50px;width: 50px" id="A203" ${SeatIdMap.get("A203")}>座位</button></td>
                                <td><div style="width: 10px"></div></td>
                                <td><button type="button" class="btn btn-default" style="height: 50px;width: 50px" id="A204" ${SeatIdMap.get("A204")}>座位</button></td>
                                <td><button type="button" class="btn btn-default" style="height: 50px;width: 50px" id="A205" ${SeatIdMap.get("A205")}>座位</button></td>
                                <td><button type="button" class="btn btn-default" style="height: 50px;width: 50px" id="A206" ${SeatIdMap.get("A206")}>座位</button></td>
                                <td><div style="width: 10px"></div></td>
                                <td><button type="button" class="btn btn-default" style="height: 50px;width: 50px" id="A207" ${SeatIdMap.get("A207")}>座位</button></td>
                                <td><button type="button" class="btn btn-default" style="height: 50px;width: 50px" id="A208" ${SeatIdMap.get("A208")}>座位</button></td>
                                <td><button type="button" class="btn btn-default" style="height: 50px;width: 50px" id="A209" ${SeatIdMap.get("A209")}>座位</button></td>
                            </tr>
                            <tr>
                                <td colspan="10">
                                    <div style="height: 30px;text-align: center;">过道</div>
                                </td>
                            </tr>
                            <tr>
                                <td><button type="button" class="btn btn-default" style="height: 50px;width: 50px" id="A301" ${SeatIdMap.get("A301")}>座位</button></td>
                                <td><button type="button" class="btn btn-default" style="height: 50px;width: 50px" id="A302" ${SeatIdMap.get("A302")}>座位</button></td>
                                <td><button type="button" class="btn btn-default" style="height: 50px;width: 50px" id="A303" ${SeatIdMap.get("A303")}>座位</button></td>
                                <td><div style="width: 10px"></div></td>
                                <td><button type="button" class="btn btn-default" style="height: 50px;width: 50px" id="A304" ${SeatIdMap.get("A304")}>座位</button></td>
                                <td><button type="button" class="btn btn-default" style="height: 50px;width: 50px" id="A305" ${SeatIdMap.get("A305")}>座位</button></td>
                                <td><button type="button" class="btn btn-default" style="height: 50px;width: 50px" id="A306" ${SeatIdMap.get("A306")}>座位</button></td>
                                <td><div style="width: 10px"></div></td>
                                <td><button type="button" class="btn btn-default" style="height: 50px;width: 50px" id="A307" ${SeatIdMap.get("A307")}>座位</button></td>
                                <td><button type="button" class="btn btn-default" style="height: 50px;width: 50px" id="A308" ${SeatIdMap.get("A308")}>座位</button></td>
                                <td><button type="button" class="btn btn-default" style="height: 50px;width: 50px" id="A309" ${SeatIdMap.get("A309")}>座位</button></td>
                            </tr>
                            <tr>
                                <td><button type="button" class="btn btn-default" style="height: 50px;width: 50px" id="A401" ${SeatIdMap.get("A401")}>座位</button></td>
                                <td><button type="button" class="btn btn-default" style="height: 50px;width: 50px" id="A402" ${SeatIdMap.get("A402")}>座位</button></td>
                                <td><button type="button" class="btn btn-default" style="height: 50px;width: 50px" id="A403" ${SeatIdMap.get("A403")}>座位</button></td>
                                <td><div style="width: 10px"></div></td>
                                <td><button type="button" class="btn btn-default" style="height: 50px;width: 50px" id="A404" ${SeatIdMap.get("A404")}>座位</button></td>
                                <td><button type="button" class="btn btn-default" style="height: 50px;width: 50px" id="A405" ${SeatIdMap.get("A405")}>座位</button></td>
                                <td><button type="button" class="btn btn-default" style="height: 50px;width: 50px" id="A406" ${SeatIdMap.get("A406")}>座位</button></td>
                                <td><div style="width: 10px"></div></td>
                                <td><button type="button" class="btn btn-default" style="height: 50px;width: 50px" id="A407" ${SeatIdMap.get("A407")}>座位</button></td>
                                <td><button type="button" class="btn btn-default" style="height: 50px;width: 50px" id="A408" ${SeatIdMap.get("A408")}>座位</button></td>
                                <td><button type="button" class="btn btn-default" style="height: 50px;width: 50px" id="A409" ${SeatIdMap.get("A409")}>座位</button></td>
                            </tr>
                            <tr>
                                <td colspan="10">
                                    <div style="height: 30px;text-align: center;">过道</div>
                                </td>
                            </tr>
                            <tr>
                                <td><button type="button" class="btn btn-default" style="height: 50px;width: 50px" id="A501" ${SeatIdMap.get("A501")}>座位</button></td>
                                <td><button type="button" class="btn btn-default" style="height: 50px;width: 50px" id="A502" ${SeatIdMap.get("A502")}>座位</button></td>
                                <td><button type="button" class="btn btn-default" style="height: 50px;width: 50px" id="A503" ${SeatIdMap.get("A503")}>座位</button></td>
                                <td><div style="width: 10px"></div></td>
                                <td><button type="button" class="btn btn-default" style="height: 50px;width: 50px" id="A504" ${SeatIdMap.get("A504")}>座位</button></td>
                                <td><button type="button" class="btn btn-default" style="height: 50px;width: 50px" id="A505" ${SeatIdMap.get("A505")}>座位</button></td>
                                <td><button type="button" class="btn btn-default" style="height: 50px;width: 50px" id="A506" ${SeatIdMap.get("A506")}>座位</button></td>
                                <td><div style="width: 10px"></div></td>
                                <td><button type="button" class="btn btn-default" style="height: 50px;width: 50px" id="A507" ${SeatIdMap.get("A507")}>座位</button></td>
                                <td><button type="button" class="btn btn-default" style="height: 50px;width: 50px" id="A508" ${SeatIdMap.get("A508")}>座位</button></td>
                                <td><button type="button" class="btn btn-default" style="height: 50px;width: 50px" id="A509" ${SeatIdMap.get("A509")}>座位</button></td>
                            </tr>
                            <tr>
                                <td><button type="button" class="btn btn-default" style="height: 50px;width: 50px" id="A601" ${SeatIdMap.get("A601")}>座位</button></td>
                                <td><button type="button" class="btn btn-default" style="height: 50px;width: 50px" id="A602" ${SeatIdMap.get("A602")}>座位</button></td>
                                <td><button type="button" class="btn btn-default" style="height: 50px;width: 50px" id="A603" ${SeatIdMap.get("A603")}>座位</button></td>
                                <td><div style="width: 10px"></div></td>
                                <td><button type="button" class="btn btn-default" style="height: 50px;width: 50px" id="A604" ${SeatIdMap.get("A604")}>座位</button></td>
                                <td><button type="button" class="btn btn-default" style="height: 50px;width: 50px" id="A605" ${SeatIdMap.get("A605")}>座位</button></td>
                                <td><button type="button" class="btn btn-default" style="height: 50px;width: 50px" id="A606" ${SeatIdMap.get("A209")}>座位</button></td>
                                <td><div style="width: 10px"></div></td>
                                <td><button type="button" class="btn btn-default" style="height: 50px;width: 50px" id="A607" ${SeatIdMap.get("A607")}>座位</button></td>
                                <td><button type="button" class="btn btn-default" style="height: 50px;width: 50px" id="A608" ${SeatIdMap.get("A608")}>座位</button></td>
                                <td><button type="button" class="btn btn-default" style="height: 50px;width: 50px" id="A609" ${SeatIdMap.get("A609")}>座位</button></td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </td>
                <td>
                    <div style="width: 100%;padding-left: 5%;">
                        <table>
                            <tbody>
                            <tr>
                                <td><button type="button" class="btn btn-default" style="height: 50px;width: 50px" id="B101" ${SeatIdMap.get("B101")}>座位</button></td>
                                <td><button type="button" class="btn btn-default" style="height: 50px;width: 50px" id="B102" ${SeatIdMap.get("B102")}>座位</button></td>
                                <td><button type="button" class="btn btn-default" style="height: 50px;width: 50px" id="B103" ${SeatIdMap.get("B103")}>座位</button></td>
                                <td><div style="width: 10px"></div></td>
                                <td><button type="button" class="btn btn-default" style="height: 50px;width: 50px" id="B104" ${SeatIdMap.get("B104")}>座位</button></td>
                                <td><button type="button" class="btn btn-default" style="height: 50px;width: 50px" id="B105" ${SeatIdMap.get("B105")}>座位</button></td>
                                <td><button type="button" class="btn btn-default" style="height: 50px;width: 50px" id="B106" ${SeatIdMap.get("B106")}>座位</button></td>
                                <td><div style="width: 10px"></div></td>
                                <td><button type="button" class="btn btn-default" style="height: 50px;width: 50px" id="B107" ${SeatIdMap.get("B107")}>座位</button></td>
                                <td><button type="button" class="btn btn-default" style="height: 50px;width: 50px" id="B108" ${SeatIdMap.get("B108")}>座位</button></td>
                                <td><button type="button" class="btn btn-default" style="height: 50px;width: 50px" id="B109" ${SeatIdMap.get("B109")}>座位</button></td>
                            </tr>
                            <tr>
                                <td><button type="button" class="btn btn-default" style="height: 50px;width: 50px" id="B201" ${SeatIdMap.get("B201")}>座位</button></td>
                                <td><button type="button" class="btn btn-default" style="height: 50px;width: 50px" id="B202" ${SeatIdMap.get("B202")}>座位</button></td>
                                <td><button type="button" class="btn btn-default" style="height: 50px;width: 50px" id="B203" ${SeatIdMap.get("B203")}>座位</button></td>
                                <td><div style="width: 10px"></div></td>
                                <td><button type="button" class="btn btn-default" style="height: 50px;width: 50px" id="B204" ${SeatIdMap.get("B204")}>座位</button></td>
                                <td><button type="button" class="btn btn-default" style="height: 50px;width: 50px" id="B205" ${SeatIdMap.get("B205")}>座位</button></td>
                                <td><button type="button" class="btn btn-default" style="height: 50px;width: 50px" id="B206" ${SeatIdMap.get("B206")}>座位</button></td>
                                <td><div style="width: 10px"></div></td>
                                <td><button type="button" class="btn btn-default" style="height: 50px;width: 50px" id="B207" ${SeatIdMap.get("B207")}>座位</button></td>
                                <td><button type="button" class="btn btn-default" style="height: 50px;width: 50px" id="B208" ${SeatIdMap.get("B208")}>座位</button></td>
                                <td><button type="button" class="btn btn-default" style="height: 50px;width: 50px" id="B209" ${SeatIdMap.get("B209")}>座位</button></td>
                            </tr>
                            <tr>
                                <td colspan="10">
                                    <div style="height: 30px;text-align: center;">过道</div>
                                </td>
                            </tr>
                            <tr>
                                <td><button type="button" class="btn btn-default" style="height: 50px;width: 50px" id="B301" ${SeatIdMap.get("B301")}>座位</button></td>
                                <td><button type="button" class="btn btn-default" style="height: 50px;width: 50px" id="B302" ${SeatIdMap.get("B302")}>座位</button></td>
                                <td><button type="button" class="btn btn-default" style="height: 50px;width: 50px" id="B303" ${SeatIdMap.get("B303")}>座位</button></td>
                                <td><div style="width: 10px"></div></td>
                                <td><button type="button" class="btn btn-default" style="height: 50px;width: 50px" id="B304" ${SeatIdMap.get("B304")}>座位</button></td>
                                <td><button type="button" class="btn btn-default" style="height: 50px;width: 50px" id="B305" ${SeatIdMap.get("B305")}>座位</button></td>
                                <td><button type="button" class="btn btn-default" style="height: 50px;width: 50px" id="B306" ${SeatIdMap.get("B306")}>座位</button></td>
                                <td><div style="width: 10px"></div></td>
                                <td><button type="button" class="btn btn-default" style="height: 50px;width: 50px" id="B307" ${SeatIdMap.get("B307")}>座位</button></td>
                                <td><button type="button" class="btn btn-default" style="height: 50px;width: 50px" id="B308" ${SeatIdMap.get("B308")}>座位</button></td>
                                <td><button type="button" class="btn btn-default" style="height: 50px;width: 50px" id="B309" ${SeatIdMap.get("B309")}>座位</button></td>
                            </tr>
                            <tr>
                                <td><button type="button" class="btn btn-default" style="height: 50px;width: 50px" id="B401" ${SeatIdMap.get("B401")}>座位</button></td>
                                <td><button type="button" class="btn btn-default" style="height: 50px;width: 50px" id="B402" ${SeatIdMap.get("B402")}>座位</button></td>
                                <td><button type="button" class="btn btn-default" style="height: 50px;width: 50px" id="B403" ${SeatIdMap.get("B403")}>座位</button></td>
                                <td><div style="width: 10px"></div></td>
                                <td><button type="button" class="btn btn-default" style="height: 50px;width: 50px" id="B404" ${SeatIdMap.get("B404")}>座位</button></td>
                                <td><button type="button" class="btn btn-default" style="height: 50px;width: 50px" id="B405" ${SeatIdMap.get("B405")}>座位</button></td>
                                <td><button type="button" class="btn btn-default" style="height: 50px;width: 50px" id="B406" ${SeatIdMap.get("B406")}>座位</button></td>
                                <td><div style="width: 10px"></div></td>
                                <td><button type="button" class="btn btn-default" style="height: 50px;width: 50px" id="B407" ${SeatIdMap.get("B407")}>座位</button></td>
                                <td><button type="button" class="btn btn-default" style="height: 50px;width: 50px" id="B408" ${SeatIdMap.get("B408")}>座位</button></td>
                                <td><button type="button" class="btn btn-default" style="height: 50px;width: 50px" id="B409" ${SeatIdMap.get("B409")}>座位</button></td>
                            </tr>
                            <tr>
                                <td colspan="10">
                                    <div style="height: 30px;text-align: center;">过道</div>
                                </td>
                            </tr>
                            <tr>
                                <td><button type="button" class="btn btn-default" style="height: 50px;width: 50px" id="B501" ${SeatIdMap.get("B501")}>座位</button></td>
                                <td><button type="button" class="btn btn-default" style="height: 50px;width: 50px" id="B502" ${SeatIdMap.get("B502")}>座位</button></td>
                                <td><button type="button" class="btn btn-default" style="height: 50px;width: 50px" id="B503" ${SeatIdMap.get("B503")}>座位</button></td>
                                <td><div style="width: 10px"></div></td>
                                <td><button type="button" class="btn btn-default" style="height: 50px;width: 50px" id="B504" ${SeatIdMap.get("B504")}>座位</button></td>
                                <td><button type="button" class="btn btn-default" style="height: 50px;width: 50px" id="B505" ${SeatIdMap.get("B505")}>座位</button></td>
                                <td><button type="button" class="btn btn-default" style="height: 50px;width: 50px" id="B506" ${SeatIdMap.get("B506")}>座位</button></td>
                                <td><div style="width: 10px"></div></td>
                                <td><button type="button" class="btn btn-default" style="height: 50px;width: 50px" id="B507" ${SeatIdMap.get("B507")}>座位</button></td>
                                <td><button type="button" class="btn btn-default" style="height: 50px;width: 50px" id="B508" ${SeatIdMap.get("B508")}>座位</button></td>
                                <td><button type="button" class="btn btn-default" style="height: 50px;width: 50px" id="B509" ${SeatIdMap.get("B509")}>座位</button></td>
                            </tr>
                            <tr>
                                <td><button type="button" class="btn btn-default" style="height: 50px;width: 50px" id="B601" ${SeatIdMap.get("B601")}>座位</button></td>
                                <td><button type="button" class="btn btn-default" style="height: 50px;width: 50px" id="B602" ${SeatIdMap.get("B602")}>座位</button></td>
                                <td><button type="button" class="btn btn-default" style="height: 50px;width: 50px" id="B603" ${SeatIdMap.get("B603")}>座位</button></td>
                                <td><div style="width: 10px"></div></td>
                                <td><button type="button" class="btn btn-default" style="height: 50px;width: 50px" id="B604" ${SeatIdMap.get("B604")}>座位</button></td>
                                <td><button type="button" class="btn btn-default" style="height: 50px;width: 50px" id="B605" ${SeatIdMap.get("B605")}>座位</button></td>
                                <td><button type="button" class="btn btn-default" style="height: 50px;width: 50px" id="B606" ${SeatIdMap.get("B606")}>座位</button></td>
                                <td><div style="width: 10px"></div></td>
                                <td><button type="button" class="btn btn-default" style="height: 50px;width: 50px" id="B607" ${SeatIdMap.get("B607")}>座位</button></td>
                                <td><button type="button" class="btn btn-default" style="height: 50px;width: 50px" id="B608" ${SeatIdMap.get("B608")}>座位</button></td>
                                <td><button type="button" class="btn btn-default" style="height: 50px;width: 50px" id="B609" ${SeatIdMap.get("B609")}>座位</button></td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </td>
            </tr>
            </tbody>
        </table>
        <div style="width: 100%;padding: 50px">

            <form class="form-inline" role="form" action="ReserveConfirm" onsubmit="toCopy()">
                <div class="form-group">
                    <label class="sr-only" for="SeatId">座位位置：</label>
                    <input type="text" class="form-control" id="SeatId" name="SeatId"
                           placeholder="请输入座位位置：">
                </div>
                <input type="hidden" name="ReserveDate" id="ReserveDate2">
                <input type="hidden" name="BeginTime" id="BeginTime2">
                <input type="hidden" name="EndTime" id="EndTime2">
                <input type="hidden" name="ReserveFloor" id="ReserveFloor2">
                <div class="form-group">
                    <button type="submit" class="btn btn-default">点击预约</button>
                </div>
            </form>

        </div>
    </div>
</div>
</body>
</html>
