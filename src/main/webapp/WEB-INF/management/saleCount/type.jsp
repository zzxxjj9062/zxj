<%--
  Created by IntelliJ IDEA.
  User: snow
  Date: 2014/5/13
  Time: 10:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/include.jsp" %>
[
    ["", "全部"]
    <c:if test="${not empty goodsList}">
        ,
        <c:forEach var="item" items="${goodsList}" varStatus="s">
            ["${item.id}", "${item.name}"]
            <c:if test="${!s.last}">,</c:if>
        </c:forEach>
    </c:if>
]
