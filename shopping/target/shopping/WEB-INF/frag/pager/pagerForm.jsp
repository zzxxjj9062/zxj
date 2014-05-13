<%@ include file="/include.jsp"%>

<form id="pagerForm" method="post" action="#rel#">
    <input type="hidden" name="pageNum" value="${vo.pageNum}" />
    <input type="hidden" name="pageSize" value="${vo.pageSize}" />
    <input type="hidden" name="orderField" value="${vo.orderField}" />
    <input type="hidden" name="orderDirection" value="${vo.orderDirection}" />
    <input type="hidden" name="keywords" value="${vo.keywords}" />
    <input type="hidden" name="keywords2" value="${vo.keywords2}" />
    <input type="hidden" name="status" value="${vo.status}" />
    <input type="hidden" name="type" value="${vo.type}" />
    <input type="hidden" name="startDate" value="${vo.startDate}" />
    <input type="hidden" name="endDate" value="${vo.endDate}" />
    <input type="hidden" name="merchantId" value="${vo.merchantId}" />
</form>