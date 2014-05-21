<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include.jsp"%>
<c:import url="../../frag/pager/pagerForm.jsp"></c:import>

<form method="post" rel="pagerForm" action="${pageContext.request.contextPath}/manage/admin/list.html" onsubmit="return navTabSearch(this);">
    <div class="pageHeader">
        <div class="searchBar">
            <table class="searchContent">
                <tr>
                    <td>
                        用户名：
                        <input type="text" name="keywords" value="${vo.keywords}"/>
                    </td>
                    <td>
                        昵称：
                        <input type="text" name="keywords2" value="${vo.keywords2}"/>
                    </td>
                    <td>
                        状态：
                        <select name="status">
                            <c:forEach var="item" items="${adminStatus}">
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
            <li><a class="add" target="navTab" href="${pageContext.request.contextPath}/manage/admin/addView.html" title="添加管理员"><span>添加</span></a></li>
            <li><a class="edit" target="navTab" href="${pageContext.request.contextPath}/manage/admin/edit/{item_id}.html"><span>修改</span></a></li>
            <li><a title="确定重置这些用户的密码吗?" target="selectedTodo" warn="您没有选择用户" rel="ids" href="${pageContext.request.contextPath}/manage/admin/resetPwd.html" class="edit"><span>重置密码</span></a></li>
            <li class="line">line</li>
            <li><a title="确定要让这些用户正常使用吗?" target="selectedTodo" warn="您没有选择用户" rel="ids" href="${pageContext.request.contextPath}/manage/admin/active.html" class="add"><span>正常使用</span></a></li>
            <li><a title="确定要禁用这些用户吗?" target="selectedTodo" warn="您没有选择用户" rel="ids" href="${pageContext.request.contextPath}/manage/admin/inactive.html" class="delete"><span>禁用</span></a></li>
        </ul>
    </div>
    <table class="table" width="100%" layoutH="138">
        <thead>
        <tr>
            <th width="5"><input type="checkbox" group="ids" class="checkboxCtrl"></th>
            <th width="35">用户名</th>
            <th width="35">昵称</th>
            <th width="30">性别</th>
            <th width="30">生日</th>
            <th width="30">联系电话</th>
            <th width="30">邮箱</th>
            <th width="70">地址</th>
            <th width="70">添加时间</th>
            <th width="70">更新时间</th>
            <th width="30">状态</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="item" items="${adminList}" varStatus="s">
            <c:if test="${item.id ne login_admin.id}">
                <tr target="item_id" rel="${item.id}">
                    <td><input name="ids" value="${item.id}_${item.status}" type="checkbox"></td>
                    <td>${item.username}</td>
                    <td>${item.nickname}</td>
                    <td>
                        <c:forEach items="${gender}" var="g">
                            <c:if test="${g eq item.gender}">
                                ${g.name}
                            </c:if>
                        </c:forEach>
                    </td>
                    <td><fmt:formatDate pattern="yyyy-MM-dd" value="${item.birthday}"/></td>
                    <td>${item.phone}</td>
                    <td>${item.email}</td>
                    <td>${item.address}</td>
                    <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${item.insertDate}"/></td>
                    <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${item.updateDate}"/></td>
                    <td>
                        <c:forEach var="status" items="${adminStatus}">
                            <c:if test="${status eq item.status}">
                                ${status.name}
                            </c:if>
                        </c:forEach>
                    </td>
                </tr>
            </c:if>
        </c:forEach>
        </tbody>
    </table>
    <c:import url="../../frag/pager/panelBar.jsp"></c:import>
</div>