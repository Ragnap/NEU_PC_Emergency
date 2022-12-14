<%@ page import="model.UserData" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>

<head>
    <link rel="stylesheet" type="text/css" href="./css/fonts.css">
    <link rel="stylesheet" type="text/css" href="./css/index.css">
    <link rel="stylesheet" type="text/css" href="./css/animation.css">
    <link rel="stylesheet" type="text/css" href="./css/navigate.css">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>机诊科</title>
</head>

<body>
<!-- 导航栏  -->
<header class="default">
    <ul class="nav_box">
        <li><a href="#">首页</a></li>
        <li><a href="${pageContext.request.contextPath}/search.jsp">故障诊断</a></li>
        <li><a href="${pageContext.request.contextPath}/report.jsp">提交病历</a></li>
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
<!-- 页面 -->
<div class="page">
    <!-- 主界面 -->
    <div class="main_background background"></div>
    <!-- 标题文字 -->
    <div class="main_title">
        <div class="main_title_box text-shadow-pop cross_highlight">
            <div class="main_title_changing shadow">
                <div class="main_title_changing_item">机</div>
                <div class="main_title_changing_item">急</div>
            </div>
            <div class="main_title_fixed shadow">
                诊科
            </div>
        </div>
    </div>
    <!-- 描述文字 -->
    <div class="main_info">
        <div class="main_info_box">
            <p class="main_info_fixed">
                遇到问题的话,
            </p>
            <div class="main_info_changing">
                <div class="main_info_changing_item">翻翻病例!</div>
                <div class="main_info_changing_item">来挂个号!</div>
            </div>
        </div>
    </div>


    <!-- 病例版块 -->
    <div class="library_background background"></div>
    <!-- 病例子标题 -->
    <div class="library_title">
        找找病历?
    </div>
    <!-- 查询部分 -->
    <div class="library_search">
        <div class="library_search_box">
            <div class="library_search_info">
                请各位有
                <span class="hover_recolor_light_blue"> 蓝屏症状</span>、
                <span class="hover_recolor_black"> 黑屏症状</span>、
                <span class="hover_flicker"> 闪烁症状</span>
                等常见病的患机先进行自我诊断
            </div>
            <div class="library_search_input_box">
                <form method="post" action="./search">
                    <input type="text" name="keyword" required>
                    <span>症状是……</span>
                </form>
            </div>
        </div>
    </div>

    <!-- 提交板块 -->
    <div class="appointment_background background"></div>
    <div class="appointment_book">
        <!-- 提交子标题 -->
        <div class="appointment_title">
            <span class="shake">提供</span>经验！
        </div>
        <!-- 提交按钮 -->
        <div class="appointment_book_info_box">
            <div class="appointment_book_info">问题百出？</div>
            <div class="appointment_book_info">药到病除！</div>
        </div>
        <div class="appointment_book_button_box">
            <button class="appointment_book_button" onclick="location.href='report.jsp'">提交病历</button>
            <span class="appointment_book_button_pointer"></span>
        </div>
    </div>
</div>


</div>
</div>

<!-- 导航栏变色效果 -->
<script type="text/javascript">
    let page = document.querySelector(".page")
    page.onscroll = function () {
        let header = document.querySelector("header");

        let main_background = document.querySelector(".main_background");
        let library_background = document.querySelector(".library_background");
        let appointment_background = document.querySelector(".appointment_background");
        // console.log(main_background.getBoundingClientRect().top,library_background.getBoundingClientRect().top,appointment_background.getBoundingClientRect().top);
        header.classList.toggle("default", main_background.getBoundingClientRect().top > -50);
        header.classList.toggle("main_color", main_background.getBoundingClientRect().top < -50 && main_background.getBoundingClientRect().bottom > 20);
        header.classList.toggle("library_color", library_background.getBoundingClientRect().top < 0 && library_background.getBoundingClientRect().bottom > 20);
        header.classList.toggle("appointment_color", appointment_background.getBoundingClientRect().top < 0 && appointment_background.getBoundingClientRect().bottom > 10);
    }
</script>
<!-- 问候语根据时间修改 -->
<script>
    // 1.获取元素
    let greeting = document.querySelector('.greeting');
    // 2. 得到当前的小时数
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