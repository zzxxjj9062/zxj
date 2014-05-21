<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include.jsp"%>
<c:set var="targetType" value="${empty param.targetType ? 'navTab' : param.targetType}"/>
<div class="panelBar">
	<div class="pages">
		<span>每页</span>
		<select name="pageSize" class="combox" onchange="navTabPageBreak({pageSize:this.value})">
            <option value="20">20</option>
		</select>
		<span>　总计: ${vo.totalCount}</span>
	</div>
	
	<div class="pagination" targetType="targetType" totalCount="${vo.totalCount}" numPerPage="${vo.pageSize}" pageNumShown="10" currentPage="${vo.pageNum}"></div>
</div>