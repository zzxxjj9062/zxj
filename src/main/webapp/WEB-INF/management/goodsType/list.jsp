<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include.jsp"%>
<c:import url="../../frag/pager/pagerForm.jsp"></c:import>

<form method="post" rel="pagerForm" action="${pageContext.request.contextPath}/manage/goodsType/list.html" onsubmit="return navTabSearch(this);">
    <div class="pageHeader">
        <div class="searchBar">
            <table class="searchContent">
                <tr>
                    <td>
                        关健字：
                        <input type="text" name="keywords" value="${vo.keywords}"/>
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
            <li><a class="add" target="navTab" href="${pageContext.request.contextPath}/manage/goodsType/addView.html" title="添加菜品类别"><span>添加</span></a></li>
            <li><a class="edit" target="navTab" href="${pageContext.request.contextPath}/manage/goodsType/edit/{item_id}.html"><span>修改</span></a></li>
            <li><a title="确定要删除这些菜品类别吗?" target="selectedTodo" warn="请至少选择一个项" rel="ids" href="${pageContext.request.contextPath}/manage/goodsType/delete.html" class="delete"><span>删除</span></a></li>
        </ul>
    </div>
    <table class="table" width="100%" layoutH="138">
        <thead>
        <tr>
            <th width="1"><input type="checkbox" group="ids" class="checkboxCtrl"></th>
            <th width="600">名称</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="item" items="${goodsTypeList}" varStatus="s">
            <tr target="item_id" rel="${item.id}">
                <td><input name="ids" value="${item.id}" type="checkbox"></td>
                <td>${item.name}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <c:import url="../../frag/pager/panelBar.jsp"></c:import>
</div>