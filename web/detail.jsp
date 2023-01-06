<%@ page import="model.UserData" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="./css/fonts.css">
    <link rel="stylesheet" type="text/css" href="./css/animation.css">
    <link rel="stylesheet" type="text/css" href="./css/navigate.css">
    <link rel="stylesheet" type="text/css" href="./css/detail.css">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>机诊科 | 查询</title>
</head>
<body>
<!-- 导航栏  -->
<header class="detail_color">
    <ul class="nav_box">
        <li><a href="index.jsp">首页</a></li>
        <li><a href="#">故障诊断</a></li>
        <li><a href="">维修预约</a></li>
    </ul>
    <%--未登录则显示登录注册栏--%>
    <%
        UserData current_user = (UserData) request.getSession().getAttribute("current_user");
        if (current_user == null) {%>
    <ul class="account_box">
        <li><a href="${pageContext.request.contextPath}/login.jsp">登录</a></li>
        <li><a href="${pageContext.request.contextPath}/login.jsp">注册</a></li>
    </ul>
    <%} else {%>
    <%--已登录则显示欢迎信息--%>
    <div class="account_box">
        <span class="greeting"></span>
        <span class="user_name"><%= current_user.getUsername() %></span>
    </div>
    <%}%>
</header>
<div class="detail">
    <div class="up_detail_box">
        <div class="picture"></div>
        <div class="short_detail_box">
            <div class="small_box">
                <div class="subtitle">日期</div>
                <div class="info"></div>

            </div>
            <div class="small_box">
                <div class="subtitle">机型</div>
                <div class="info"></div>
            </div>
            <div class="small_box">
                <div class="subtitle">系统</div>
                <div class="info"></div>
            </div>
            <div class="small_box">
                <div class="subtitle">提交者</div>
                <div class="info"></div>

            </div>
        </div>
    </div>
    <div class="down_detail_box">
        <div class="big_box">
            <div class="subtitle">问题描述</div>
            <div class="info"></div>
        </div>

        <div class="big_box">
            <div class="subtitle">解决处方</div>
            <div class="info"></div>

        </div>

    </div>
</div>
</body>
</html>
