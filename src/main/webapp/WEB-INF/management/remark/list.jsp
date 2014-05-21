<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include.jsp"%>
<c:import url="../../frag/pager/pagerForm.jsp"></c:import>

<form method="post" rel="pagerForm" action="${pageContext.request.contextPath}/manage/remark/list.html" onsubmit="return navTabSearch(this);">
    <div class="pageHeader">
        <div class="searchBar">
            <table class="searchContent">
                <tr>
                    <td>
                        菜品名：
                        <input type="text" name="keywords" value="${vo.keywords}"/>
                    </td>
                    <td>
                        店铺名：
                        <input type="text" name="keywords2" value="${vo.keywords2}"/>
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
            <li><a title="确定要删除这些评价吗?" target="selectedTodo" warn="请至少选择一个评价" rel="ids" href="${pageContext.request.contextPath}/manage/remark/delete.html" class="delete"><span>删除</span></a></li>
        </ul>
    </div>
    <table class="table" width="100%" layoutH="138">
        <thead>
        <tr>
            <th width="22"><input type="checkbox" group="ids" class="checkboxCtrl"></th>
            <th width="30">买家昵称</th>
            <th width="40">菜品名</th>
            <th width="40">店铺名</th>
            <th width="30">配送速度</th>
            <th width="35">味道</th>
            <th width="30">平均分</th>
            <th width="70">评价内容</th>
            <th width="50">评价时间</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="item" items="${remarkList}" varStatus="s">
            <tr target="item_id" rel="${item.id}">
                <td><input name="ids" value="${item.id}_${item.goodsId}" type="checkbox"></td>
                <td>${item.user.nickname}</td>
                <td>${item.goods.name}</td>
                <td>${item.goods.merchant.storeName}</td>
                <td>${item.speed}</td>
                <td>${item.quality}</td>
                <td>${item.avgGrade}</td>
                <td>${item.content}</td>
                <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${item.date}"/></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <c:import url="../../frag/pager/panelBar.jsp"></c:import>
</div>