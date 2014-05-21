<%--
  Created by IntelliJ IDEA.
  User: snow
  Date: 2014/5/9
  Time: 20:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/include.jsp" %>
<div class="pageContent">
    <form method="post" action="${pageContext.request.contextPath}/manage/admin/update.html" class="pageForm required-validate" onsubmit="return iframeCallback(this, navTabAjaxDone);" enctype="multipart/form-data">
        <input type="hidden" name="id" value="${admin.id}"/>
        <div class="pageFormContent nowrap" layoutH="56">
            <dl>
                <dt>昵称：</dt>
                <dd>
                    <input type="text" name="nickname" class="required" value="${admin.nickname}" minlength="2" maxlength="20"/>
                </dd>
            </dl>
            <dl>
                <dt>性别：</dt>
                <dd>
                    <select name="gender" class="combox">
                        <c:forEach items="${gender}" var="item">
                            <option value="${item}" ${item eq admin.gender ? 'selected="selected"' : ''}>${item.name}</option>
                        </c:forEach>
                    </select>
                </dd>
            </dl>
            <dl>
                <dt>联系电话：</dt>
                <dd>
                    <input type="text" name="phone" value="${admin.phone}" class="phone"/>
                </dd>
            </dl>
            <dl>
                <dt>生日：</dt>
                <dd>
                    <input type="text" name="birthday" class="date textInput readonly" readonly="true" value="<fmt:formatDate pattern="yyyy-MM-dd" value="${admin.birthday}"/>"/>
                    <a class="inputDateButton" href="javascript:;">选择</a>
                </dd>
            </dl>
            <dl>
                <dt>邮箱：</dt>
                <dd>
                    <input type="text" name="email" value="${admin.email}" class="email"/>
                </dd>
            </dl>
            <dl>
                <dt>地址：</dt>
                <dd>
                    <input type="text" name="address" value="${admin.address}"/>
                </dd>
            </dl>
        </div>
        <div class="formBar">
            <ul>
                <li><div class="buttonActive"><div class="buttonContent"><button type="submit">确认修改</button></div></div></li>
                <li>
                    <div class="button"><div class="buttonContent"><button type="button" class="close">关闭</button></div></div>
                </li>
            </ul>
        </div>
    </form>
</div>
