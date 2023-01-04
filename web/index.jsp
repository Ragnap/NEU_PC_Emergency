<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>

<head>
    <link rel="stylesheet" type="text/css" href="./css/index.css">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>机诊科</title>
</head>

<body>
    <!-- 导航栏  -->
    <header class="default">
        <ul class="nav_box">
            <li><a href="">首页</a></li>
            <li><a href="">故障诊断</a></li>
            <li><a href="">维修预约</a></li>
        </ul>
        <ul class="account_box">
            <li><a href="${pageContext.request.contextPath}/login.jsp">登录</a></li>
            <li><a href="${pageContext.request.contextPath}/login.jsp">注册</a></li>
        </ul>
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
                    <input type="text" required>
                    <span>症状是……</span>
                </div>
            </div>
        </div>

        <!-- 预约板块 -->
        <div class="appointment_background background"></div>
        <div class="appointment_book">
            <!-- 预约子标题 -->
            <div class="appointment_title">
                需要<span class="shake">帮助！</span>
            </div>
            <!-- 预约按钮 -->
            <div class="appointment_book_info_box">
                <div class="appointment_book_info">问题百出？</div>
                <div class="appointment_book_info">药到病除！</div>
            </div>
            <div class="appointment_book_button_box">
                <button class="appointment_book_button">现在挂号</button>
                <span class="appointment_book_button_pointer"></span>
            </div>
        </div>
    </div>


    </div>
    </div>
    <!-- 底部链接 -->
    <!-- <div class="">

    </div> -->
</body>
<!-- 导航栏变色效果 -->
<script type="text/javascript">
    let page=document.querySelector(".page")
    page.onscroll= function(){
        let header = document.querySelector("header");
        
        let main_background = document.querySelector(".main_background");
        let library_background = document.querySelector(".library_background");
        let appointment_background = document.querySelector(".appointment_background");
        // console.log(main_background.getBoundingClientRect().top,library_background.getBoundingClientRect().top,appointment_background.getBoundingClientRect().top);
        header.classList.toggle("default",main_background.getBoundingClientRect().top>-50);
        header.classList.toggle("main_color",main_background.getBoundingClientRect().top<-50&&main_background.getBoundingClientRect().bottom>20);
        header.classList.toggle("library_color",library_background.getBoundingClientRect().top<0&&library_background.getBoundingClientRect().bottom>20);
        header.classList.toggle("appointment_color",appointment_background.getBoundingClientRect().top<0&&appointment_background.getBoundingClientRect().bottom>10);
    }
</script>
</html>