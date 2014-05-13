<%--
  Created by IntelliJ IDEA.
  User: snow
  Date: 2014/5/11
  Time: 18:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>管理员登录</title>
    <meta name="viewport" content="width=device-width"/>
    <link href="${pageContext.request.contextPath}/styles/css/admin.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/styles/js/admin.js"></script>
</head>
<body>
<div class="login">
    <form action="${pageContext.request.contextPath}/passport/manage_login.html" method="post" id="form" onsubmit="return check();">
        <div class="logo"></div>
        <div id="info">${info}</div>
        <div class="login_form">
            <div class="user">
                <input class="text_value" name="username" type="text" id="username"/>
                <input class="text_value" name="password" type="password" id="password"/>
            </div>
            <button class="button" id="submit" type="submit">登录</button>
        </div>
        <div id="tip"></div>
        <div class="foot">
            Copyright&copy;2014  版权所有
        </div>
    </form>
</div>
<script type="text/javascript">
    document.getElementById("username").focus();
</script>
</body>
</html>
