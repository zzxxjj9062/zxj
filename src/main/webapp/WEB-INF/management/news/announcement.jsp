<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/include.jsp" %>
<div class="pageContent">
    <form method="post" action="${pageContext.request.contextPath}/manage/news/update.html" class="pageForm required-validate" onsubmit="return iframeCallback(this, navTabAjaxDone);" enctype="multipart/form-data">
        <input type="hidden" name="id" value="${news.id}" />
        <div class="pageFormContent nowrap" layoutH="56">
            <dl>
                <dt>更新时间：</dt>
                <dd>
                    <fmt:formatDate value="${news.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
                </dd>
            </dl>
            <dl>
                <dt>内容：</dt>
                <dd>
                    <textarea class="editor required" name="content" rows="25" cols="100">${news.content}</textarea>
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