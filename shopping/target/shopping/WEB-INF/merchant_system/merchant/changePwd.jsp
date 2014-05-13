<%--
  Created by IntelliJ IDEA.
  User: snow
  Date: 2014/5/9
  Time: 20:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="pageContent">
    <form method="post" action="${pageContext.request.contextPath}/merchant/changePwd.html" class="pageForm required-validate" onsubmit="return validateCallback(this, navTabAjaxDone);">
        <div class="pageFormContent nowrap" layoutH="56">
            <dl>
                <dt>原密码：</dt>
                <dd>
                    <input type="password" name="oldPassword" class="required alphanumeric" minlength="6" maxlength="20"/>
                </dd>
            </dl>
            <dl>
                <dt>新密码：</dt>
                <dd>
                    <input id="w_validation_pwd" type="password" name="newPassword" class="required alphanumeric" minlength="6" maxlength="20"/>
                </dd>
            </dl>
            <dl>
                <dt>确认新密码：</dt>
                <dd>
                    <input type="password" name="rePassword" class="required alphanumeric" minlength="6" maxlength="20" equalto="#w_validation_pwd"/>
                </dd>
            </dl>
        </div>
        <div class="formBar">
            <ul>
                <li><div class="buttonActive"><div class="buttonContent"><button type="submit">确认修改</button></div></div></li>
                <li>
                    <div class="button"><div class="buttonContent"><button type="button" class="close">取消</button></div></div>
                </li>
            </ul>
        </div>
    </form>
</div>
