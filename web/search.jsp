<%@ page import="model.UserData" %>
<%@ page import="model.UserData" %><%--
  Created by IntelliJ IDEA.
  User: Ragna
  Date: 2023/1/6
  Time: 1:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="./css/fonts.css">
    <link rel="stylesheet" type="text/css" href="./css/animation.css">
    <link rel="stylesheet" type="text/css" href="./css/navigate.css">
    <link rel="stylesheet" type="text/css" href="./css/search.css">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>机诊科 | 查询</title>
</head>
<body>
<!-- 导航栏  -->
<header class="search_color">
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
<!-- 标题部分 -->
<div class="title">
    <!-- 蓝屏字符画 -->
    <div class="char_draw">
        <div class="face">
            <span class="sad_face">:(</span>
            <span class="happy_face">:)</span>
        </div>
        <div class="notice">*************</div>
        <div class="notice">*********</div>
    </div>

    <!-- 子标题 -->
    <div class="library_title">
        找找病历?
    </div>
</div>

<!-- 查询部分 -->
<div class="library_search">
    <div class="library_search_box">
        <div class="library_search_input_box">
            <input type="text" required>
            <span>描述一下症状吧</span>
        </div>
    </div>

</div>

</body>
<!-- 问候语根据时间修改 -->
<script>
    let greeting = document.querySelector('.greeting');
    let hours = new Date().getHours();
    if (hours <= 6) {
        greeting.innerHTML = "晚上好，"
    } else if (hours <= 11) {
        greeting.innerHTML = "早上好，"
    } else if (hours <= 14) {
        greeting.innerHTML = "中午好，"
    } else if (hours <= 16) {
        greeting.innerHTML = "下午好，"
    } else if (hours <= 18) {
        greeting.innerHTML = "傍晚好，"
    } else {
        greeting.innerHTML = "晚上好，"
    }
</script>

</html>
