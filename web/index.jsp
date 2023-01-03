<%--
  Created by IntelliJ IDEA.
  User: Ragna
  Date: 2023/1/3
  Time: 23:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<html lang="en">

<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" type="text/css" href="./css/login.css">
    <title>机诊室|用户</title>
</head>

<body>
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
            <h2>Sign in</h2>
            <input type="text" placeholder="用户名">
            <input type="text" placeholder="密码">
            <button>GO</button>
        </div>
        <div class="sign_up">
            <h2>Sign up</h2>
            <input type="text" placeholder="用户名">
            <input type="text" placeholder="密码">
            <input type="text" placeholder="确认密码">
            <button>GO</button>
        </div>
    </div>
</div>

<script>
    let button = document.querySelector('.button')
    let ball = document.querySelector('.ball')
    let bottom = document.querySelector('.bottom')
    let off = document.querySelector('.off')
    let on = document.querySelector('.on')
    let index = 0
    button.addEventListener('click', () => {
        if (index == 0) {
            index = 1
            ball.style.left = 61 + '%'
            on.style.opacity = 1
            off.style.opacity = .5
            bottom.style.transform = "rotateY(180deg)"
        } else {
            index = 0
            ball.style.left = 0
            on.style.opacity = .5
            off.style.opacity = 1
            bottom.style.transform = "rotateY(0deg)"
        }
    })
    // 每当点击按钮的时候，index的值就会发生变化，如果index为0的话，那么点击的时候index变为1，反之变为0
    // 当index的值为0时，按钮里的球划到右边，并且将右边字的透明度变为1，下面的登录卡旋转180度，为注册
    // 当index的值为1时，按钮里的球划到左边，并且将右边字的透明度变为0.5，下面的登录卡旋转回0度，为登录
</script>
</body>

</html>