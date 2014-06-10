<%--
  Created by IntelliJ IDEA.
  User: snow
  Date: 2014/4/22
  Time: 10:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/include.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>外卖联盟后台管理系统</title>

    <link href="${pageContext.request.contextPath}/styles/themes/azure/style.css" rel="stylesheet" type="text/css" media="screen"/>
    <link href="${pageContext.request.contextPath}/styles/themes/css/core.css" rel="stylesheet" type="text/css" media="screen"/>
    <link href="${pageContext.request.contextPath}/styles/themes/css/print.css" rel="stylesheet" type="text/css" media="print"/>
    <link href="${pageContext.request.contextPath}/styles/uploadify/css/uploadify.css" rel="stylesheet" type="text/css" media="screen"/>
    <!--[if IE]>
    <link href="${pageContext.request.contextPath}/styles/themes/css/ieHack.css" rel="stylesheet" type="text/css" media="screen"/>
    <![endif]-->

    <!--[if lte IE 9]>
    <script src="${pageContext.request.contextPath}/styles/js/speedup.js" type="text/javascript"></script>
    <![endif]-->

    <script src="${pageContext.request.contextPath}/styles/js/jquery-1.7.2.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/styles/js/jquery.cookie.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/styles/js/jquery.validate.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/styles/js/jquery.bgiframe.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/styles/xheditor/xheditor-1.2.1.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/styles/xheditor/xheditor_lang/zh-cn.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/styles/uploadify/scripts/jquery.uploadify.js" type="text/javascript"></script>

    <!-- svg图表  supports Firefox 3.0+, Safari 3.0+, Chrome 5.0+, Opera 9.5+ and Internet Explorer 6.0+ -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/styles/chart/raphael.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/styles/chart/g.raphael.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/styles/chart/g.bar.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/styles/chart/g.line.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/styles/chart/g.pie.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/styles/chart/g.dot.js"></script>

    <!-- 可以用dwz.min.js替换前面全部dwz.*.js (注意：替换是下面dwz.regional.zh.js还需要引入) -->
    <script src="${pageContext.request.contextPath}/styles/bin/dwz.min.js" type="text/javascript"></script>

    <script src="${pageContext.request.contextPath}/styles/js/dwz.regional.zh.js" type="text/javascript"></script>
    <!-- 自有 -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/styles/js/dialog.js"></script>
    <script type="text/javascript">
        $(function(){
            DWZ.init("${pageContext.request.contextPath}/styles/dwz.frag.xml", {
                loginUrl:"index.html", loginTitle:"登录",	// 弹出登录对话框
//		loginUrl:"index.html",	// 跳到登录页面
                statusCode:{ok:200, error:300, timeout:301}, //【可选】
                pageInfo:{pageNum:"pageNum", numPerPage:"numPerPage", orderField:"orderField", orderDirection:"orderDirection"}, //【可选】
                keys: {statusCode:"statusCode", message:"message"}, //【可选】
                debug:false,	// 调试模式 【true|false】
                callback:function(){
                    initEnv();
                    $("#themeList").theme({themeBase:"${pageContext.request.contextPath}/styles/themes"}); // themeBase 相对于index页面的主题base路径
                }
            });
        });
        function closedialog() {
            return closeDialog("${pageContext.request.contextPath}/merchant/goodsType/showList");
        }

        function ConfirmClose() {
            $.get('${pageContext.request.contextPath}/passport/manage_logout.html');
        }

        function onPageLoad(){
            try{
                if(!window.onbeforeunload )
                    window.onbeforeunload = ConfirmClose;
            }catch(e){}
        }
    </script>
</head>

<body scroll="no" onload="onPageLoad();">
<div id="layout">
<div id="header">
    <div class="headerNav">
        <%--<a class="logo" href="http://j-ui.com">标志</a>--%>
        <ul class="nav">
            <li><a href="javascript:void(0);" onclick="confirmExit('${pageContext.request.contextPath}/passport/manage_logout.html');">退出</a></li>
        </ul>
        <ul class="themeList" id="themeList">

        </ul>
    </div>

    <!-- navMenu -->

</div>

<div id="leftside">
    <div id="sidebar_s">
        <div class="collapse">
            <div class="toggleCollapse"><div></div></div>
        </div>
    </div>
    <div id="sidebar">
        <div class="toggleCollapse"><h2>主菜单</h2><div>收缩</div></div>

        <div class="accordion" fillSpace="sidebar">
            <div class="accordionHeader">
                <h2>店铺管理</h2>
            </div>
            <div class="accordionContent">
                <ul class="tree">
                    <li><a href="${pageContext.request.contextPath}/manage/goods/list.html" target="navTab" rel="goods_list">菜品管理</a></li>
                    <li><a href="${pageContext.request.contextPath}/manage/order/list.html" target="navTab" rel="order_list">订单管理</a></li>
                    <li><a href="${pageContext.request.contextPath}/manage/remark/list.html" target="navTab" rel="remark_list">评价管理</a></li>
                    <li><a href="${pageContext.request.contextPath}/manage/goodsType/list.html" target="navTab" rel="goodsType_list">菜品类别</a></li>
                    <li><a href="${pageContext.request.contextPath}/manage/saleCount/list.html" target="navTab" rel="sale_count_list">店铺统计</a></li>
                </ul>
            </div>
            <div class="accordionHeader">
                <h2>平台管理</h2>
            </div>
            <div class="accordionContent">
                <ul class="tree">
                    <li><a href="${pageContext.request.contextPath}/manage/imageRecommend/list.html" target="navTab" rel="imageRecommend_list">图片推荐</a></li>
                    <li><a href="${pageContext.request.contextPath}/manage/news/list.html" target="navTab" rel="news_list">新闻管理</a></li>
                    <li><a href="${pageContext.request.contextPath}/manage/news/announcement.html" target="navTab">公告管理</a></li>
                    <li><a href="${pageContext.request.contextPath}/manage/app/list.html" target="navTab" rel="app_list">应用管理</a></li>
                </ul>
            </div>
            <div class="accordionHeader">
                <h2>账户管理</h2>
            </div>
            <div class="accordionContent">
                <ul class="tree">
                    <li><a href="${pageContext.request.contextPath}/manage/merchant/list.html" target="navTab" rel="merchant_list">商家账户</a></li>
                    <li><a href="${pageContext.request.contextPath}/manage/user/list.html" target="navTab" rel="user_list">买家账户</a></li>
                    <li><a href="${pageContext.request.contextPath}/manage/admin/list.html" target="navTab" rel="admin_list">管理员账户</a></li>
                </ul>
            </div>
            <div class="accordionHeader">
                <h2>个人管理</h2>
            </div>
            <div class="accordionContent">
                <ul class="tree">
                    <li><a href="${pageContext.request.contextPath}/manage/changePwdView.html" target="navTab">修改密码</a></li>
                    <li><a href="${pageContext.request.contextPath}/manage/admin/edit/${login_admin.id}.html" target="navTab">个人信息</a></li>
                </ul>
            </div>
        </div>
    </div>
</div>
<div id="container">
    <div id="navTab" class="tabsPage">
        <div class="tabsPageHeader">
            <div class="tabsPageHeaderContent"><!-- 显示左右控制时添加 class="tabsPageHeaderMargin" -->
                <ul class="navTab-tab">
                    <li tabid="main" class="main"><a href="javascript:;"><span><span class="home_icon">我的主页</span></span></a></li>
                </ul>
            </div>
            <div class="tabsLeft">left</div><!-- 禁用只需要添加一个样式 class="tabsLeft tabsLeftDisabled" -->
            <div class="tabsRight">right</div><!-- 禁用只需要添加一个样式 class="tabsRight tabsRightDisabled" -->
            <div class="tabsMore">more</div>
        </div>
        <ul class="tabsMoreList">
            <li><a href="javascript:;">我的主页</a></li>
        </ul>
        <div class="navTab-panel tabsPageContent layoutBox">
            <div class="page unitBox">
                <div class="accountInfo">
                    <div class="alertInfo">
                        <p><a href="#" style="line-height:19px"><span>Android客户端下载</span></a></p>
                    </div>
                    <div class="right">
                    </div>
                    <p><span>欢迎您：${login_admin.nickname}</span></p>
                    <p></p>
                </div>
                <div class="pageFormContent" layoutH="80" style="margin-right:230px">${news.content}</div>
                <div style="width:230px;position: absolute;top:60px;right:0" layoutH="80">
                    <iframe width="100%" height="430" class="share_self"  frameborder="0" scrolling="no" src="http://widget.weibo.com/weiboshow/index.php?language=&width=0&height=430&fansRow=2&ptype=1&speed=0&skin=1&isTitle=0&noborder=1&isWeibo=1&isFans=0&uid=2584274882&verifier=1d07a1a0"></iframe>
                </div>
            </div>

        </div>
    </div>
</div>

</div>

<div id="footer">Copyright &copy; 2014　外卖联盟</div>
<script type="text/javascript">
    function confirmExit(url) {
        alertMsg.confirm("确定要退出吗?", {
            okCall: function() {
                window.location.href = url;
            }
        });
    }
</script>
</body>
</html>
