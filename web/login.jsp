<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" type="text/css" href="./css/fonts.css">
    <link rel="stylesheet" type="text/css" href="./css/login.css">
    <link rel="stylesheet" type="text/css" href="./css/navigate.css">
    <title>机诊科 | 用户</title>
</head>

<body>
<!-- 导航栏  -->
<header class="login_color">
    <ul class="nav_box">
        <li><a href="index.jsp">首页</a></li>
        <li><a href="search.jsp">故障诊断</a></li>
        <li><a href="">维修预约</a></li>
    </ul>
    <ul class="account_box">
    </ul>
</header>
<div class="background"></div>
<div class="shell">
    <div class="top">
        <span class="off">登录</span>
        <div class="button">
            <div class="ball"></div>
        </div>
        <span class="on">注册</span>
    </div>

    <div class="bottom">
        <div class="sign_in">
            <form method="post" action="./sign_in">
                <span class="subtitle">Sign in</span>
                <input id="sign_in_username" type="text" name="username" placeholder="用户名">
                <input id="sign_in_password" type="password" name="password" placeholder="密码">
                <button id="sign_in_btn">GO</button>
            </form>
        </div>

        <div class="sign_up">
            <form method="post" action="./sign_up">
                <span class="subtitle">Sign up</span>
                <input id="sign_up_username" type="text" name="username" placeholder="用户名">
                <input id="sign_up_password" type="password" name="password" placeholder="密码">
                <input id="sign_up_check_password" type="password" name="check_password" placeholder="确认密码">
                <button id="sign_up_btn">GO</button>
            </form>
        </div>

    </div>
</div>
</body>


<%--弹出servlet对应的反馈信息--%>
<%
    String message = (String) request.getSession().getAttribute("user_message");
    if (message != null) {%>
<script type="text/javascript">
    window.onload = function () {
        alert("<%= message %>");
    }
</script>
<%}%>

<%--背景视差效果--%>
<script>
    let background = document.querySelector('.background')
    // 设置鼠标移动时触发的效果
    document.addEventListener('mousemove', e => {
        // 获取鼠标的位置
        let mouseX = e.clientX
        let mouseY = e.clientY
        let delta_x = (mouseX - background.offsetLeft) / 20
        let delta_y = (mouseY - background.offsetTop) / 20
        background.style.transform = "translate(" + delta_x + "px," + delta_y + "px)";
    })
</script>
<%--旋转动画--%>
<script>
    // 每当点击按钮的时候，index的值就会发生变化，如果index为0的话，那么点击的时候index变为1，反之变为0
    // 当index的值为0时，按钮里的球划到右边，并且将右边字的透明度变为1，下面的登录卡旋转180度，为注册
    // 当index的值为1时，按钮里的球划到左边，并且将右边字的透明度变为0.5，下面的登录卡旋转回0度，为登录
    let button = document.querySelector('.button')
    let ball = document.querySelector('.ball')
    let bottom = document.querySelector('.bottom')
    let off = document.querySelector('.off')
    let on = document.querySelector('.on')
    let index = 0

    button.addEventListener('click', () => {
        if (index === 0) {
            index = 1
            ball.style.left = 61 + '%'
            on.style.opacity = 1
            off.style.opacity = 0.5
            bottom.style.transform = "rotateY(180deg)"
        } else {
            index = 0
            ball.style.left = 0
            on.style.opacity = .5
            off.style.opacity = 1
            bottom.style.transform = "rotateY(0deg)"
        }
    })
</script>

<%--密码验证--%>
<script>
    // 登录验证
    let sign_in_username = document.getElementById("sign_in_username");
    let sign_in_password = document.getElementById("sign_in_password");
    let sign_in = document.getElementById("sign_in_btn");
    sign_in.onclick = function () {
        if (sign_in_username.value === "" || sign_in_username.value === null) {
            alert("用户名不能为空,请输入");
            return false;
        } else if (sign_in_username.value.length > 20) {
            alert("用户名不能超过20字符,请重新输入");
            return false;
        } else if (sign_in_password.value === "" || sign_in_password.value == null) {
            alert("密码不能为空,请输入");
            return false;
        } else if (sign_in_password.value.length > 20) {
            alert("密码不能超过20字符,请重新输入");
            return false;
        } else {
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
</html>