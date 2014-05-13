<%--
  Created by IntelliJ IDEA.
  User: snow
  Date: 2014/4/23
  Time: 13:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/include.jsp" %>
<div class="pageContent" id="goodsType1">
    <form method="post" action="${pageContext.request.contextPath}/merchant/goods/add.html" class="pageForm required-validate" onsubmit="return iframeCallback(this, navTabAjaxDone);" enctype="multipart/form-data">
        <div class="pageFormContent nowrap" layoutH="56">
            <dl>
                <dt>名称：</dt>
                <dd>
                    <input type="text" name="name" class="required" />
                </dd>
            </dl>
            <dl>
                <dt>类别：</dt>
                <dd>
                    <div id="goodsType">
                        <select class="combox required" name="goodsType">
                            <c:forEach var="type" items="${goodsType}">
                                <option value="${type.id}">${type.name}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <a class="button" href="${pageContext.request.contextPath}/addGoodsType.jsp" target="dialog" rel="add_goods_type" mask="true" maxable="false" resizable="false" width="520" height="150" close="closedialog"><span>添加类别</span></a>
                </dd>
            </dl>
            <dl>
                <dt>单价(元)：</dt>
                <dd>
                    <input type="text" name="price" class="required number" min="0" />
                </dd>
            </dl>
            <dl>
                <dt>数量：</dt>
                <dd>
                    <input type="text" name="number" class="required digits" min="0" />
                </dd>
            </dl>
            <dl>
                <dt>描述：</dt>
                <dd>
                    <textarea name="description" cols="70" rows="3"></textarea>
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
