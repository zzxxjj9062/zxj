<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include.jsp"%>
<c:import url="../../frag/pager/pagerForm.jsp"></c:import>

<form method="post" rel="pagerForm" action="${pageContext.request.contextPath}/manage/order/list.html" onsubmit="return navTabSearch(this);">
    <div class="pageHeader">
        <div class="searchBar">
            <table class="searchContent">
                <tr>
                    <td>
                        买家用户名：
                        <input type="text" name="keywords" value="${vo.keywords}"/>
                    </td>
                    <td>
                        订单号：
                        <input type="text" name="keywords2" value="${vo.keywords2}"/>
                    </td>
                    <td>
                        状态：
                        <select name="status">
                            <c:forEach var="item" items="${orderStatus}">
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
                <span style="line-height: 25px; float: left">
                    今日卖出：<strong>${todayNumber}</strong>份　　
                    今日营业额：<strong>${todayTotalPrice}</strong>元　　
                    最近一周营业额：<strong>${weekTotalPrice}</strong>元　　
                    最近一个月营业额：<strong>${monthTotalPrice}</strong>元　　
                    最近一年营业额：<strong>${yearTotalPrice}</strong>元　　
                </span>
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
            <li><a title="确定要取消这些订单吗?" target="selectedTodo" warn="您没有选择订单" rel="ids" href="${pageContext.request.contextPath}/manage/order/cancel.html" class="delete"><span>取消订单</span></a></li>
        </ul>
    </div>
    <table class="table" width="100%" layoutH="138">
        <thead>
        <tr>
            <th width="22"><input type="checkbox" group="ids" class="checkboxCtrl"></th>
            <th width="70">订单号</th>
            <th width="70">买家用户名</th>
            <th width="70">店铺名</th>
            <th width="130">菜品名</th>
            <th width="30">数量</th>
            <th width="35">总价(元)</th>
            <th width="30">配送地址</th>
            <th width="30">下单时间</th>
            <th width="30">状态</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="item" items="${orderList}" varStatus="s">
            <tr target="item_id" rel="${item.id}">
                <td><input name="ids" value="${item.id}_${item.status}_${item.order.user.id}_${item.goods.id}_${item.totalPrice}_${item.number}_${item.merchant.id}" type="checkbox"></td>
                <td>${item.order.orderNumber}</td>
                <td>${item.order.user.username}</td>
                <td>${item.merchant.storeName}</td>
                <td>${item.goods.name}</td>
                <td>${item.number}</td>
                <td>${item.totalPrice}</td>
                <td>${item.order.address}</td>
                <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${item.order.date}"/></td>
                <td>
                    <c:forEach var="status" items="${orderStatus}">
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