<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include.jsp"%>
<c:import url="../../frag/pager/pagerForm.jsp"></c:import>

<form method="post" rel="pagerForm" action="${pageContext.request.contextPath}/merchant/saleCount/list.html" onsubmit="return navTabSearch(this);">
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
                        <select name="status">
                            <option value="1" ${vo.status eq '1' ? 'selected="selected"' : ''}>最近一周</option>
                            <option value="2" ${vo.status eq '2' ? 'selected="selected"' : ''}>最近一个月</option>
                            <option value="3" ${vo.status eq '3' ? 'selected="selected"' : ''}>最近一年</option>
                        </select>
                    </td>
                    <td>
                        类别：
                        <select name="keywords">
                            <option value="1" ${vo.keywords eq '1' ? 'selected="selected"' : ''}>销量</option>
                            <option value="2" ${vo.keywords eq '2' ? 'selected="selected"' : ''}>营业额</option>
                        </select>
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

<div class="pageContent" style="height: 600px;">
    <c:choose>
        <c:when test="${vo.keywords ne '2'}">
            <div style="position: relative; left: 400px; top: 10px; font-weight: bold; font-size: 14px;">销量统计</div>
            <div style="position: relative; left: 370px; top: 400px; font-weight: bold; font-size: 14px;">销量前10的菜品</div>
        </c:when>
        <c:otherwise>
            <div style="position: relative; left: 400px; top: 10px; font-weight: bold; font-size: 14px;">营业额统计</div>
        </c:otherwise>
    </c:choose>
    <script type="text/javascript">
        var options = {
            axis: "0 0 1 1", // Where to put the labels (trbl)
            axisxstep: ${saleCountMap.size() - 1}, // How many x interval labels to render (axisystep does the same for the y axis)
            axisxlables: [
                <c:forEach items="${saleCountMap}" var="item" varStatus="s">
                    "${item.key}"
                    <c:if test="${!s.last}">,</c:if>
                </c:forEach>
            ],
            axisystep: 20,
            shade:false, // true, false
            smooth:true, //曲线
            symbol:"circle"
        };

        var options1 = {
            stacked: false,
            gutter: 20,
            axis: "0 0 1 1", // Where to put the labels (trbl)
            axisystep: 10 // How many x interval labels to render (axisystep does the same for the y axis)
        };

        $(function () {

            // Make the raphael object
            var r = Raphael("chartHolder");

            var lines = r.linechart(
                    40, // X start in pixels
                    20, // Y start in pixels
                    700, // Width of chart in pixels
                    340, // Height of chart in pixels
                    [
                        <c:forEach begin="0" end="${saleCountMap.size() - 1}" var="item" varStatus="s">
                            ${item}
                            <c:if test="${!s.last}">,</c:if>
                        </c:forEach>
                    ], // Array of x coordinates equal in length to ycoords
                    [[
                        <c:forEach items="${saleCountMap}" var="item" varStatus="s">
                            ${item.value}
                            <c:if test="${!s.last}">,</c:if>
                        </c:forEach>
                    ]], // Array of y coordinates equal in length to xcoords
                    options // opts object
            ).hoverColumn(function () {
                        this.tags = r.set();

                        var box_x = this.x, box_y = 30,
                                box_w = 40, box_h = 20;
                        if (box_x + box_w > r.width) box_x -= box_w;
                        var box = r.rect(box_x,box_y,box_w,box_h).attr({stroke: "#f00", "stroke-width": 1, r:5});
                        this.tags.push(box);

                        for (var i = 0; i < this.y.length; i++) {
                            var t = r.text(box_x+20, box_y+10 + i*16,this.values[i]).attr({fill: this.symbols[i].attr("fill")})
                            this.tags.push(t);
                        }


                    }, function () {
                        this.tags && this.tags.remove();
                    });

            lines.symbols.attr({ r: 6 });
            <c:if test="${topTenList != null and topTenList.size() > 0}">
                var data = [[
                    <c:forEach items="${topTenList}" var="item" varStatus="s">
                        ${item.number}
                        <c:if test="${!s.last}">,</c:if>
                    </c:forEach>
                ]]

                // stacked: false
                var chart1 = r.hbarchart(50, 400, 500, 250, data, options1).hover(function() {
                    this.flag = r.popup(this.bar.x, this.bar.y, this.bar.value, "right").insertBefore(this);
                }, function() {
                    this.flag.animate({opacity: 0}, 500, ">", function () {this.remove();});
                });
                chart1.label([[
                    <c:forEach items="${topTenList}" var="item" varStatus="s">
                        "${item.name}"
                        <c:if test="${!s.last}">,</c:if>
                    </c:forEach>
                ]],true);
            </c:if>
        });
    </script>
    <div id="chartHolder" style="width: 1000px;height: 800px;"></div>
</div>