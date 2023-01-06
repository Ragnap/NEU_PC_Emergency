<%@ page import="model.UserData" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.ProblemData" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="./css/fonts.css">
    <link rel="stylesheet" type="text/css" href="./css/animation.css">
    <link rel="stylesheet" type="text/css" href="./css/navigate.css">
    <link rel="stylesheet" type="text/css" href="./css/result.css">
    <title>机诊科 | 查询</title>
</head>
<body>
<!-- 导航栏  -->
<header class="search_color">
    <ul class="nav_box">
        <li><a href="${pageContext.request.contextPath}/index.jsp">首页</a></li>
        <li><a href="#">故障诊断</a></li>
        <li><a href="">提交病历</a></li>
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
<!-- 查询框 -->
<%
    String keyword;
    if (request.getSession().getAttribute("keyword") == null)
        keyword = "";
    else
        keyword = (String) request.getSession().getAttribute("keyword");
%>
<div class="library_search">
    <div class="library_search_box">
        <div class="library_search_input_box">
            <form method="post" action="./search">
                <input type="text" name="keyword" placeholder="<%=keyword%>" required>
                <span>描述一下症状吧</span>
            </form>
        </div>
    </div>
</div>
<!-- 结果展示 -->
<%
    ArrayList<ProblemData> problems = (ArrayList<ProblemData>) request.getSession().getAttribute("problems");
    request.setAttribute("problems",problems);
    if (problems == null || problems.size() == 0) {
%>
<%--没有搜索结果--%>
<div class="search_result">
    <div class="no_result">
        <div class="icon"></div>
        <div class="text">抱歉,<br>暂时没有相关记录</div>
    </div>
</div>
<%} else {%>
<%--有搜索记录--%>
<div class="search_result">
    <div class="search_result_box">
        <div class="subtitle">
            <ul>
                <li class="problem_describe">问题描述</li>
                <li class="problem_model">电脑型号</li>
                <li class="problem_system">系统版本</li>
            </ul>
        </div>
        <c:forEach items="${requestScope.problems}" var="now">
        <div class="signal">
            <ul>
                <li class="problem_describe"><a
                        href="./getProblem?problem=${now.getId()}" target="_blank">${now.getDescribe()}</a>
                </li>
                <li class="problem_model"><a
                        href="./getProblem?problem=${now.getId()}" target="_blank">${now.getModel()}</a>
                </li>
                <li class="problem_system"><a
                        href="./getProblem?problem=${now.getId()}" target="_blank">${now.getSystem()}</a>
                </li>
            </ul>
        </div>
        </c:forEach>
    </div>
</div>
<% } %>
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
