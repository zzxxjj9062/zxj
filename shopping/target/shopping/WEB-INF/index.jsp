<%--
  Created by IntelliJ IDEA.
  User: snow
  Date: 2014/4/22
  Time: 9:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>西华外卖</title>
    </head>
    <body>
        <h3>商家登录</h3>
        ${error}<br/>
        <form action="${pageContext.request.contextPath}/passport/merchant_login" method="post">
            <label>用户名:</label><input type="text" name="username" required="true"/><br/>
            <label>密　码:</label><input type="password" name="password" required="true"/><br/>
            <input type="submit" value="登录"/><input type="reset" value="重置"/>
        </form>
    </body>
</html>
