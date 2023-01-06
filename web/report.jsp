<%@ page import="model.UserData" %>
<%@ page import="model.ProblemData" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="./css/fonts.css">
    <link rel="stylesheet" type="text/css" href="./css/animation.css">
    <link rel="stylesheet" type="text/css" href="./css/navigate.css">
    <link rel="stylesheet" type="text/css" href="./css/report.css">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>机诊科 | 报告</title>
</head>
<body>
<!-- 导航栏  -->
<header class="detail_color">
    <ul class="nav_box">
        <li><a href="${pageContext.request.contextPath}/index.jsp">首页</a></li>
        <li><a href="${pageContext.request.contextPath}/search.jsp">故障诊断</a></li>
        <li><a href="#">提交病历</a></li>
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
<%--必须登录后才可填报--%>
<%
    if (current_user == null) {%>
<div class="no_result">
    <div class="icon"></div>
    <div class="text">抱歉,请登录后进行提交</div>
</div>
<% } else { %>
<!-- 处方详情 -->
<div class="detail">
    <form method="post" action="./report">
        <div class="up_detail_box">
            <div class="big_box">
                <div class="subtitle">问题描述</div>
                <input type="text" name="describe">
            </div>

            <div class="big_box">
                <div class="subtitle">解决处方</div>
                <input type="text" name="solution">
            </div>
        </div>
        <div class="down_detail_box">
            <div class="picture"></div>
            <div class="short_detail_box">

                <div class="small_box">
                    <div class="subtitle">机型</div>
                    <input type="text" name="model">
                </div>
                <div class="small_box">
                    <div class="subtitle">系统</div>
                    <input type="text" name="system">
                </div>
                <button>提交!</button>
            </div>
        </div>
    </form>
</div>
<%}%>
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
</body>

</html>
