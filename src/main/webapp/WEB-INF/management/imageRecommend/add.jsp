<%--
  Created by IntelliJ IDEA.
  User: snow
  Date: 2014/4/23
  Time: 13:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/include.jsp" %>
<div class="pageContent">
    <form method="post" action="${pageContext.request.contextPath}/manage/imageRecommend/add.html" class="pageForm required-validate" onsubmit="return iframeCallback(this, navTabAjaxDone);" enctype="multipart/form-data">
        <div class="pageFormContent nowrap" layoutH="56">
            <dl>
                <dt>URL：</dt>
                <dd>
                    <input type="text" name="url" class="required" />
                </dd>
            </dl>
            <dl>
                <dt>类别：</dt>
                <dd>
                    <select class="combox required" name="type">
                        <c:forEach var="type" items="${imageRecommendType}">
                            <c:if test="${type ne 'ALL'}">
                                <option value="${type}">${type.name}</option>
                            </c:if>
                        </c:forEach>
                    </select>
                </dd>
            </dl>
            <dl>
                <dt>放置时间(天)</dt>
                <dd>
                    <input type="text" name="days" class="required digits" min="0" />
                </dd>
            </dl>
            <dl>
                <dt>位置：</dt>
                <dd>
                    <input type="text" name="position" class="required digits" min="0" />
                </dd>
            </dl>
            <dl>
                <dt>图片：</dt>
                <dd>
                    <input type="file" name="imageFile" class="required"/>
                </dd>
            </dl>
        </div>
        <div class="formBar">
            <ul>
                <li><div class="buttonActive"><div class="buttonContent"><button type="submit">添加</button></div></div></li>
                <li>
                    <div class="button"><div class="buttonContent"><button type="button" class="close">取消</button></div></div>
                </li>
            </ul>
        </div>
    </form>
</div>
