<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include.jsp"%>
<c:import url="../../frag/pager/pagerForm.jsp"></c:import>

<form method="post" rel="pagerForm" action="${pageContext.request.contextPath}/merchant/remark/list.html" onsubmit="return navTabSearch(this);">
    <div class="pageHeader">
        <div class="searchBar">
            <table class="searchContent">
                <tr>
                    <td>
                        菜品：
                        <select name="type">
                            <option value="">全部</option>
                            <c:forEach var="item" items="${goodsList}">
                                <option value="${item.id}" ${vo.type eq item.id ? 'selected="selected"' : ''}>${item.name}</option>
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
        </ul>
    </div>
    <table class="table" width="100%" layoutH="138">
        <thead>
        <tr>
            <th width="30">买家昵称</th>
            <th width="40">菜品名</th>
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
                <td>${item.user.nickname}</td>
                <td>${item.goods.name}</td>
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