<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include.jsp"%>
<c:import url="../../frag/pager/pagerForm.jsp"></c:import>

<form method="post" rel="pagerForm" action="${pageContext.request.contextPath}/manage/goods/list.html" onsubmit="return navTabSearch(this);">
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
                        菜品类别：
                        <select name="type">
                            <option value="">全部</option>
                            <c:forEach var="type" items="${goodsType}">
                                <option value="${type.id}" ${type.id eq vo.type ? 'selected="selected"' : ''}>${type.name}</option>
                            </c:forEach>
                        </select>
                    </td>
                    <td>
                        状态：
                        <select name="status">
                            <c:forEach var="item" items="${goodsStatus}">
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
            <li><a class="edit" target="navTab" href="${pageContext.request.contextPath}/manage/goods/edit/{goods_id}.html"><span>修改</span></a></li>
            <li><a title="确定要删除这些菜品吗?" target="selectedTodo" warn="您没有选择菜品" rel="ids" href="${pageContext.request.contextPath}/manage/goods/delete.html" class="delete"><span>删除</span></a></li>
            <li class="line">line</li>
            <li><a title="确定要上架这些菜品吗?" target="selectedTodo" warn="您没有选择菜品" rel="ids" href="${pageContext.request.contextPath}/manage/goods/up.html" class="add"><span>上架</span></a></li>
            <li><a title="确定要下架这些菜品吗?" target="selectedTodo" warn="您没有选择菜品" rel="ids" href="${pageContext.request.contextPath}/manage/goods/down.html" class="delete"><span>下架</span></a></li>
        </ul>
    </div>
    <table class="table" width="100%" layoutH="138">
        <thead>
        <tr>
            <th width="22"><input type="checkbox" group="ids" class="checkboxCtrl"></th>
            <th width="110">图片</th>
            <th width="130">名称</th>
            <th width="35">店铺名</th>
            <th width="35">价格(元)</th>
            <th width="30">数量</th>
            <th width="30">销量</th>
            <th width="30">评论数</th>
            <th width="30">收藏数</th>
            <th width="80">描述</th>
            <th width="30">类别</th>
            <th width="30">状态</th>
            <th width="70">添加时间</th>
            <th width="70">更新时间</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="goods" items="${goodsList}" varStatus="s">
            <tr target="goods_id" rel="${goods.id}" style="height: 120px;">
                <td><input name="ids" value="${goods.id}_${goods.status}" type="checkbox"></td>
                <td class="td_goods_img"><img src="http://wmlm.qiniudn.com/goodsImage/${goods.image}/style300.jpg" style="width: 166px; height: 100px"/></td>
                <td>${goods.name}</td>
                <td>${goods.merchant.storeName}</td>
                <td>${goods.price}</td>
                <td>${goods.number}</td>
                <td>${goods.saleCount}</td>
                <td>${goods.remarkCount}</td>
                <td>${goods.collectionCount}</td>
                <td>${goods.description}</td>
                <td>${goods.goodsTypeObj.name}</td>
                <td>
                    <c:forEach var="status" items="${goodsStatus}">
                        <c:if test="${status eq goods.status}">
                            ${status.name}
                        </c:if>
                    </c:forEach>
                </td>
                <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${goods.insertDate}"/></td>
                <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${goods.updateDate}"/></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <c:import url="../../frag/pager/panelBar.jsp"></c:import>
</div>