<%--
  Created by IntelliJ IDEA.
  User: snow
  Date: 2014/4/25
  Time: 11:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/include.jsp" %>
<script type="text/javascript">
    var flag = true;
</script>
<select class="combox required" name="goodsType">
    <c:forEach var="type" items="${goodsTypeList}">
        <c:choose>
            <c:when test="${fn:contains(ids, type.idStr)}">
                <option value="${type.id}">${type.name}</option>
            </c:when>
            <c:otherwise>
                <option value="${type.id}" selected="selected">${type.name}</option>
                <script type="text/javascript">
                    flag = false;
                </script>
            </c:otherwise>
        </c:choose>
    </c:forEach>
</select>
<script type="text/javascript">
    if (flag) {
        $("select[name=goodsType] option[value=" + ${ids.split(',')[0]} + "]").attr("selected", true);
    }
</script>
