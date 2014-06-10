<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include.jsp"%>
<c:import url="../../frag/pager/pagerForm.jsp"></c:import>

<form method="post" rel="pagerForm" action="${pageContext.request.contextPath}/manage/imageRecommend/list.html" onsubmit="return navTabSearch(this);">
    <div class="pageHeader">
        <div class="searchBar">
            <table class="searchContent">
                <tr>
                    <td>
                        类别：
                        <select name="type">
                            <c:forEach var="type" items="${imageRecommendType}">
                                <option value="${type}" ${type eq vo.type ? 'selected="selected"' : ''}>${type.name}</option>
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
            <li><a class="add" target="navTab" href="${pageContext.request.contextPath}/manage/imageRecommend/addView.html" title="添加图片推荐"><span>添加</span></a></li>
            <li><a class="edit" target="navTab" href="${pageContext.request.contextPath}/manage/imageRecommend/edit/{item_id}.html"><span>修改</span></a></li>
            <li><a title="确定要删除这些图片推荐吗?" target="selectedTodo" warn="请至少勾选一项" rel="ids" href="${pageContext.request.contextPath}/manage/imageRecommend/delete.html" class="delete"><span>删除</span></a></li>
        </ul>
    </div>
    <table class="table" width="100%" layoutH="138">
        <thead>
        <tr>
            <th width="22"><input type="checkbox" group="ids" class="checkboxCtrl"></th>
            <th width="80">图片</th>
            <th width="70">URL</th>
            <th width="30">放置时间(天)</th>
            <th width="30">位置</th>
            <th width="30">类别</th>
            <th width="70">添加时间</th>
            <th width="70">更新时间</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="item" items="${imageRecommendList}" varStatus="s">
            <tr target="item_id" rel="${item.id}" style="height: 120px;">
                <td><input name="ids" value="${item.id}_${item.image}" type="checkbox"></td>
                <td class="td_goods_img"><img src="http://wmlm.qiniudn.com/imageRecommend/${item.image}/style300.jpg" style="width: 166px; height: 100px"/></td>
                <td>${item.url}</td>
                <td>${item.days}</td>
                <td>${item.position}</td>
                <td>
                    <c:forEach var="type" items="${imageRecommendType}">
                        <c:if test="${type eq item.type}">
                            ${type.name}
                        </c:if>
                    </c:forEach>
                </td>
                <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${item.insertDate}"/></td>
                <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${item.updateDate}"/></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <c:import url="../../frag/pager/panelBar.jsp"></c:import>
</div>