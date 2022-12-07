<%--
  Created by IntelliJ IDEA.
  User: Ragna
  Date: 2022/9/3
  Time: 19:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>机诊科</title>
    <link rel="stylesheet" type="text/css" href="./css/homepage.css">
</head>

<body>
<%--导航栏--%>
<div class="nav">

</div>

<%--主视觉界面--%>
<div class="scene main">
<%--    标题文字--%>
    <div class="main_title cross_highlight">
        <div class="main_title_box  text-shadow-pop">
            <ul class="main_title_changing shadow">
                <li class="main_title_changing_item">机</li>
                <li class="main_title_changing_item">急</li>
            </ul>
            <p class="main_title_fixed shadow">
                诊科
            </p>
        </div>
    </div>
<%--    描述文字--%>
    <div class="main_info">
        <div class="main_info_box">
            <p class="main_info_fixed">
                遇到问题的话,
            </p>
            <div class="main_info_changing ">
                <div class="main_info_changing_item">翻翻病例!</div>
                <div class="main_info_changing_item">来挂个号!</div>
            </div>
        </div>
    </div>
</div>

<%--病例子版块--%>
<div class="scene library">
    <div class="library_title">
        找找病历?
    </div>
</div>

<%--预约板块介绍--%>
<div class="scene appointment">
</div>

<%--底部链接--%>
<div class="">

</div>
</body>
</html>
