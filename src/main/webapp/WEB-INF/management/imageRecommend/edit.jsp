<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="pageContent">
    <form method="post" action="${pageContext.request.contextPath}/manage/imageRecommend/update.html" class="pageForm required-validate" onsubmit="return iframeCallback(this, navTabAjaxDone);" enctype="multipart/form-data">
        <input type="hidden" name="id" value="${imageRecommend.id}" />
        <input type="hidden" name="originalImage" value="${imageRecommend.image}"/>
        <div class="pageFormContent nowrap" layoutH="56">
            <dl>
                <dt>URL：</dt>
                <dd>
                    <input type="text" name="url" class="required" value="${imageRecommend.url}"/>
                </dd>
            </dl>
            <dl>
                <dt>类别：</dt>
                <dd>
                    <select class="combox required" name="type">
                        <c:forEach var="type" items="${imageRecommendType}">
                            <c:if test="${type ne 'ALL'}">
                                <option value="${type}" ${type eq imageRecommend.type ? 'selected="selected"' : ''}>${type.name}</option>
                            </c:if>
                        </c:forEach>
                    </select>
                </dd>
            </dl>
            <dl>
                <dt>放置时间(天)</dt>
                <dd>
                    <input type="text" name="days" class="required digits" min="0" value="${imageRecommend.days}"/>
                </dd>
            </dl>
            <dl>
                <dt>位置：</dt>
                <dd>
                    <input type="text" name="position" class="required digits" min="0" value="${imageRecommend.position}"/>
                </dd>
            </dl>
            <dl>
                <dt>图片：</dt>
                <dd>
                    <input type="file" name="imageFile"/>
                    <c:if test="${not empty imageRecommend.image}">
                        <img width="200" src="${pageContext.request.contextPath}/upload/ImageRecommend/${imageRecommend.image}"/>
                    </c:if>
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