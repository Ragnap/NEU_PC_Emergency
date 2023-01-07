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
                <input id="input_describe" type="text" name="describe">
            </div>

            <div class="big_box">
                <div class="subtitle">解决处方</div>
                <input id="input_solution" type="text" name="solution">
            </div>
        </div>
        <div class="down_detail_box">
            <div class="picture"></div>
            <div class="short_detail_box">

                <div class="small_box">
                    <div class="subtitle">机型</div>
                    <input id="input_model" type="text" name="model">
                </div>
                <div class="small_box">
                    <div class="subtitle">系统</div>
                    <input id="input_system" type="text" name="system">
                </div>
                <button id="submit">提交!</button>
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

<!-- 输入验证 -->
<script>
    // 登录验证
    let describe = document.getElementById("input_describe");
    let solution = document.getElementById("input_solution");
    let model = document.getElementById("input_model");
    let system = document.getElementById("input_system");

    let submit = document.getElementById("submit");
    submit.onclick = function () {
        if (describe.value === "" || describe.value === null) {
            alert("请输入故障的具体表现");
            return false;
        } else if (solution.value === "" || solution.value == null) {
            alert("请输入故障的处理方式");
            return false;
        } else if (model.value === "" || model.value == null) {
            alert("请输入出现故障的电脑的型号");
            return false;
        } else if (system.value === "" || system.value == null) {
            alert("请输入出现故障的电脑的系统");
            return false;
        } else {
            alert("感谢您的提交！");
            return true;
        }
    }
    // 注册验证
    let sign_up_username = document.getElementById("sign_up_username");
    let sign_up_password = document.getElementById("sign_up_password");
    let check_password = document.getElementById("sign_up_check_password");
    let sign_up = document.getElementById("sign_up_btn");
    sign_up.onclick = function () {
        if (sign_up_username.value === "" || sign_up_username.value === null) {
            alert("用户名不能为空,请输入");
            return false;
        } else if (sign_up_username.value.length > 20) {
            alert("用户名不能超过20字符,请重新输入");
            return false;
        } else if (sign_up_password.value === "" || sign_up_password.value === null) {
            alert("密码不能为空,请输入");
            return false;
        } else if (check_password.value === "" || check_password.value === null) {
            alert("请再次输入密码进行确认");
            return false;
        } else if (sign_up_password.value !== check_password.value) {
            alert("两次输入的密码不一致，请重新输入");
            return false;
        } else if (sign_up_password.value.length > 20) {
            alert("密码不能超过20字符,请重新输入");
            return false;
        } else {
            return true;
        }
    }
</script>
</body>

</html>
