<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="pageContent">
    <form method="post" action="${pageContext.request.contextPath}/manage/news/update.html" class="pageForm required-validate" onsubmit="return iframeCallback(this, navTabAjaxDone);" enctype="multipart/form-data">
        <input type="hidden" name="id" value="${news.id}" />
        <div class="pageFormContent nowrap" layoutH="56">
            <dl>
                <dt>标题：</dt>
                <dd>
                    <input type="text" name="title" class="required" size="70" maxlength="100" value="${news.title}"/>
                </dd>
            </dl>
            <dl>
                <dt>内容：</dt>
                <dd>
                    <textarea class="editor required" name="content" rows="20" cols="100">${news.content}</textarea>
                </dd>
            </dl>
            <dl>
                <dt>类别：</dt>
                <dd>
                    <select class="combox required" name="type">
                        <c:forEach var="type" items="${newsType}">
                            <c:if test="${type ne 'ALL'}">
                                <option value="${type}" ${type eq news.type ? 'selected="selected"' : ''}>${type.name}</option>
                            </c:if>
                        </c:forEach>
                    </select>
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