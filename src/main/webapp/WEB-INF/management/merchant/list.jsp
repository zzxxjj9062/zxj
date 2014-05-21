<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include.jsp"%>
<c:import url="../../frag/pager/pagerForm.jsp"></c:import>

<form method="post" rel="pagerForm" action="${pageContext.request.contextPath}/manage/merchant/list.html" onsubmit="return navTabSearch(this);">
    <div class="pageHeader">
        <div class="searchBar">
            <table class="searchContent">
                <tr>
                    <td>
                        店铺名：
                        <input type="text" name="keywords" value="${vo.keywords}"/>
                    </td>
                    <td>
                        用户名：
                        <input type="text" name="keywords2" value="${vo.keywords2}"/>
                    </td>
                    <td>
                        状态：
                        <select name="status">
                            <c:forEach var="item" items="${merchantStatus}">
                                <c:if test="${item ne 'DELETED'}">
                                    <option value="${item}" ${item eq vo.status ? 'selected="selected"' : ''}>${item.name}</option>
                                </c:if>
                            </c:forEach>
                        </select>
                    </td>
                    <td>
                        日期：
                        <input type="text" name="startDate" class="date" readonly="true" value="<fmt:formatDate pattern="yyyy-MM-dd" value="${vo.startDate}"/>"/>
                        至
                        <input type="text" name="endDate" class="date" readonly="true" value="<fmt:formatDate pattern="yyyy-MM-dd" value="${vo.endDate}"/>"/>
                    </td>
                </tr>
            </table>
            <div class="subBar">
                <ul>
                    <li><div class="buttonActive"><div class="buttonContent"><button type="submit">查询</button></div></div></li>
                </ul>
            </div>
        </div>
    </div>
</form>

<div class="pageContent">

    <div class="panelBar">
        <ul class="toolBar">
            <li><a class="edit" target="navTab" href="${pageContext.request.contextPath}/manage/merchant/edit/{item_id}.html"><span>修改</span></a></li>
            <li><a title="确定重置这些商家的密码吗?" target="selectedTodo" warn="您没有选择商家" rel="ids" href="${pageContext.request.contextPath}/manage/merchant/resetPwd.html" class="edit"><span>重置密码</span></a></li>
            <li class="line">line</li>
            <li><a title="确定要让这些商家正常使用吗?" target="selectedTodo" warn="您没有选择商家" rel="ids" href="${pageContext.request.contextPath}/manage/merchant/active.html" class="add"><span>正常使用</span></a></li>
            <li><a title="确定要禁用这些商家吗?" target="selectedTodo" warn="您没有选择商家" rel="ids" href="${pageContext.request.contextPath}/manage/merchant/inactive.html" class="delete"><span>禁用</span></a></li>
        </ul>
    </div>
    <table class="table" width="100%" layoutH="138">
        <thead>
        <tr>
            <th width="22"><input type="checkbox" group="ids" class="checkboxCtrl"></th>
            <th width="90">图片</th>
            <th width="35">用户名</th>
            <th width="35">店铺名</th>
            <th width="30">销量</th>
            <th width="30">收藏数</th>
            <th width="80">描述</th>
            <th width="30">联系电话</th>
            <th width="30">地址</th>
            <th width="70">添加时间</th>
            <th width="70">更新时间</th>
            <th width="30">状态</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="item" items="${merchantList}" varStatus="s">
            <tr target="item_id" rel="${item.id}" style="height: 120px;">
                <td><input name="ids" value="${item.id}_${item.status}" type="checkbox"></td>
                <td class="td_goods_img">
                    <c:if test="${not empty item.image}">
                        <img src="${pageContext.request.contextPath}/upload/MerchantImages/${item.image}" style="width: 166px; height: 100px"/>
                    </c:if>
                </td>
                <td>${item.username}</td>
                <td>${item.storeName}</td>
                <td>${item.saleCount}</td>
                <td>${item.collectionCount}</td>
                <td>${item.description}</td>
                <td>${item.phone}</td>
                <td>${item.address}</td>
                <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${item.insertDate}"/></td>
                <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${item.updateDate}"/></td>
                <td>
                    <c:forEach var="status" items="${merchantStatus}">
                        <c:if test="${status eq item.status}">
                            ${status.name}
                        </c:if>
                    </c:forEach>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <c:import url="../../frag/pager/panelBar.jsp"></c:import>
</div>