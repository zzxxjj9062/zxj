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
    <form method="post" action="${pageContext.request.contextPath}/merchant/update.html" class="pageForm required-validate" onsubmit="return iframeCallback(this, navTabAjaxDone);" enctype="multipart/form-data">
        <input type="hidden" name="id" value="${merchant.id}"/>
        <input type="hidden" name="image" value="${merchant.image}"/>
        <div class="pageFormContent nowrap" layoutH="56">
            <dl>
                <dt>店铺名：</dt>
                <dd>
                    <input type="text" name="storeName" class="required" value="${merchant.storeName}" minlength="2" maxlength="20"/>
                </dd>
            </dl>
            <dl>
                <dt>店铺描述：</dt>
                <dd>
                    <textarea name="description" cols="70" rows="3" class="required">${merchant.description}</textarea>
                </dd>
            </dl>
            <dl>
                <dt>联系电话：</dt>
                <dd>
                    <input type="text" name="phone" class="required phone" value="${merchant.phone}"/>
                </dd>
            </dl>
            <dl>
                <dt>地址：</dt>
                <dd>
                    <input type="text" name="address" class="required" value="${merchant.address}"/>
                </dd>
            </dl>
            <dl>
                <dt>店主姓名：</dt>
                <dd>
                    <input type="text" name="realName" value="${merchant.realName}"/>
                </dd>
            </dl>
            <dl>
                <dt>身份证号：</dt>
                <dd>
                    <input type="text" name="identityCard" value="${merchant.identityCard}"/>
                </dd>
            </dl>
            <dl>
                <dt>店铺图片：</dt>
                <dd>
                    <input type="file" name="imageFile"/>
                    <c:if test="${not empty merchant.image}">
                        <img width="200" src="${pageContext.request.contextPath}/upload/MerchantImages/${merchant.image}"/>
                    </c:if>
                </dd>
            </dl>
        </div>
        <div class="formBar">
            <ul>
                <li><div class="buttonActive"><div class="buttonContent"><button type="submit">保存</button></div></div></li>
                <li>
                    <div class="button"><div class="buttonContent"><button type="button" class="close">关闭</button></div></div>
                </li>
            </ul>
        </div>
    </form>
</div>
