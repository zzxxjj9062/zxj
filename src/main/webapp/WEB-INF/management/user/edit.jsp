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
    <form method="post" action="${pageContext.request.contextPath}/manage/user/update.html" class="pageForm required-validate" onsubmit="return iframeCallback(this, navTabAjaxDone);" enctype="multipart/form-data">
        <input type="hidden" name="id" value="${user.id}"/>
        <div class="pageFormContent nowrap" layoutH="56">
            <dl>
                <dt>昵称：</dt>
                <dd>
                    <input type="text" name="nickname" class="required" value="${user.nickname}" minlength="2" maxlength="20"/>
                </dd>
            </dl>
            <dl>
                <dt>性别：</dt>
                <dd>
                    <select name="gender" class="combox">
                        <c:forEach items="${gender}" var="item">
                            <option value="${item}" ${item eq user.gender ? 'selected="selected"' : ''}>${item.name}</option>
                        </c:forEach>
                    </select>
                </dd>
            </dl>
            <dl>
                <dt>生日：</dt>
                <dd>
                    <input type="text" name="birthday" class="date textInput readonly" readonly="true" value="<fmt:formatDate pattern="yyyy-MM-dd" value="${user.birthday}"/>"/>
                    <a class="inputDateButton" href="javascript:;">选择</a>
                </dd>
            </dl>
            <dl>
                <dt>学校：</dt>
                <dd>
                    <select name="schoolId" class="combox">
                        <c:forEach items="${school}" var="item">
                            <option value="${item.id}" ${item.id eq user.schoolId ? 'selected="selected"' : ''}>${item.name}</option>
                        </c:forEach>
                    </select>
                </dd>
            </dl>
            <dl>
                <dt>区域：</dt>
                <dd>
                    <select name="areaId" class="combox">
                        <c:forEach items="${area}" var="item">
                            <option value="${item.id}" ${item.id eq user.areaId ? 'selected="selected"' : ''}>${item.name}</option>
                        </c:forEach>
                    </select>
                </dd>
            </dl>
            <dl>
                <dt>栋：</dt>
                <dd>
                    <input type="text" name="block" value="${user.block}"/>
                </dd>
            </dl>
            <dl>
                <dt>房间：</dt>
                <dd>
                    <input type="text" name="room" value="${user.room}"/>
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
