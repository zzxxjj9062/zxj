<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%--<%@ include file="/include.jsp" %>--%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    ${'admin' eq flag ? '' : '<meta name="description" content="外卖,外卖联盟,高校外卖"/><meta name="author" content="外卖联盟"/>'}
    <title>${'admin' eq flag ? '外卖联盟管理登录' : '外卖联盟'}</title>

    <!-- Bootstrap core CSS
      注意：此文件跟随官网最新版本更新，随时会有改变。建议使用下面v3.0.3版本的CDN链接！
     -->
    <!--<link href="../dist/css/bootstrap.min.css" rel="stylesheet">-->

    <!-- Hi，如果你要在自己的网站上引入bootstrap样式文件的话，请使用当前最新版本v3.0.3的CDN链接，页面加载速度会更快！-->
    <link rel="stylesheet" href="http://cdn.bootcss.com/twitter-bootstrap/3.0.3/css/bootstrap.min.css">


    <!-- Documentation extras -->
    <link href="${pageContext.request.contextPath}/styles/index/docs.css" rel="stylesheet">
    <link href="http://cdn.bootcss.com/highlight.js/7.3/styles/github.min.css" rel="stylesheet">
    <style>
        body {
            font-family: "ff-tisa-web-pro-1", "ff-tisa-web-pro-2", "Lucida Grande", "Helvetica Neue", Helvetica, Arial, "Hiragino Sans GB", "Hiragino Sans GB W3", "WenQuanYi Micro Hei", sans-serif;
        }

        h1, .h1, h2, .h2, h3, .h3, h4, .h4, .lead {
            font-family: "ff-tisa-web-pro-1", "ff-tisa-web-pro-2", "Lucida Grande", "Helvetica Neue", Helvetica, Arial, "Hiragino Sans GB", "Hiragino Sans GB W3", "Microsoft YaHei UI", "Microsoft YaHei", "WenQuanYi Micro Hei", sans-serif;
        }

        pre code {
            background: transparent;
        }

        @media (min-width: 768px) {
            .bs-docs-home .bs-social,
            .bs-docs-home .bs-masthead-links {
                margin-left: 0;
            }
        }

        .bs-docs-section p {
            line-height: 2;
        }

        .bs-docs-section p.lead {
            line-height: 1.4;
        }


    </style>

    <!--[if lt IE 9]>
    <script src="../docs-assets/js/ie8-responsive-file-warning.js"></script><![endif]-->

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="http://cdn.bootcss.com/html5shiv/3.7.0/html5shiv.min.js"></script>
    <script src="http://cdn.bootcss.com/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->

    <!-- Favicons -->
    <link rel="apple-touch-icon-precomposed" sizes="144x144"
          href="../docs-assets/ico/apple-touch-icon-144-precomposed.png">
    <link rel="shortcut icon" href="../docs-assets/ico/favicon.png">

</head>
<body>
<a class="sr-only" href="#content">Skip to main content</a>

<!-- Docs master nav -->
<header class="navbar navbar-inverse navbar-fixed-top bs-docs-nav" role="banner">
    <div class="container">
        <div class="navbar-header">
            <button class="navbar-toggle" type="button" data-toggle="collapse" data-target=".bs-navbar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a href="${pageContext.request.contextPath}/" class="navbar-brand">外卖联盟</a>
        </div>
        <nav class="collapse navbar-collapse bs-navbar-collapse" role="navigation">
            <form class="navbar-form navbar-right" role="form"
                  action="${pageContext.request.contextPath}/passport/${'admin' eq flag ? 'manage_login' : 'merchant_login'}"
                  id="login_form" method="post">
                <div class="form-group">
                    <input type="text" placeholder="用户名" id="username" name="username" class="form-control"/>
                </div>
                <div class="form-group">
                    <input type="password" placeholder="密码" id="password" name="password" class="form-control"/>
                </div>
                <div class="form-group">
                    <input type="text" placeholder="验证码" class="form-control" id="code" name="code"/>
                </div>
                <button type="submit" class="btn btn-danger" id="login">登录</button>
                ${'admin' eq flag ? '' : '<a class="btn btn-warning" href="#">注册</a>'}
            </form>
        </nav>
    </div>
</header>


<!-- Docs page layout -->
<div class="bs-header" id="content">
    <div class="container">
        <h1>Android客户端下载</h1>

        <p><a class="btn btn-outline-inverse btn-lg" href="#">下载最新版</a></p>
    </div>
</div>

<!-- Callout for the old docs link -->


<div class="container bs-docs-container">
    <div class="row">
        <div class="col-md-3">
            <div class="bs-sidebar hidden-print" role="complementary">
                <ul class="nav bs-sidenav">
                    <li>
                        <a href="#wmlm">外卖联盟</a>
                    </li>
                    <li>
                        <a href="#announcement">公告</a>
                    </li>
                    <li>
                        <a href="#cooperate">合作</a>
                    </li>
                    <li>
                        <a href="#we">关于我们</a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="col-md-9" role="main">


            <!-- wmlm
              ================================================== -->
            <div class="bs-docs-section">
                <div class="page-header">
                    <h1 id="wmlm">外卖联盟</h1>
                </div>
                <p>我们是一个致力于高校外卖的平台，目前主要是做移动端。</p>
            </div>
            <!-- announcement
            ================================================== -->
            <div class="bs-docs-section">
                <div class="page-header">
                    <h1 id="announcement">公告</h1>
                </div>
                <table class="table table-hover">
                    <tbody id="list-content"></tbody>
                </table>
                <div id="pagination"></div>
            </div>


            <!-- cooperate
            ================================================== -->
            <div class="bs-docs-section">
                <div class="page-header">
                    <h1 id="cooperate">合作</h1>
                </div>
                <p>联系电话：18202877930</p>

                <p>QQ：2210707748</p>

                <p>Email：boss@abovesky.cn</p>
            </div>

            <!-- we
            ================================================== -->
            <div class="bs-docs-section">
                <div class="page-header">
                    <h1 id="we">关于我们</h1>
                </div>
                <p>客户端开发：石昊、王磊</p>

                <p>服务器端开发：宋雪勦</p>

                <p>美工：</p>
            </div>

        </div>
    </div>

</div>
<!-- Footer
    ================================================== -->
<footer class="bs-footer" role="contentinfo">
    <div class="container">
        <p>版权归<a href="#">外卖联盟</a>所有</p>
    </div>
</footer>
<!-- JS and analytics only. -->
<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="http://cdn.bootcss.com/jquery/1.10.2/jquery.min.js"></script>

<!-- Bootstrap core JS file
  注意：此文件跟随官网最新版本更新，随时会有改变。建议使用下面v3.0.3版本的CDN链接！
 -->
<!--<script src="../dist/js/bootstrap.js"></script>-->

<!-- Hi，如果你要在自己的网站上引入bootstrap JS文件的话，请使用当前最新版本v3.0.3的CDN链接，页面加载速度会更快！-->
<script src="http://cdn.bootcss.com/twitter-bootstrap/3.0.3/js/bootstrap.min.js"></script>
<script src="http://cdn.bootcss.com/holder/2.0/holder.min.js"></script>
<script src="http://cdn.bootcss.com/highlight.js/7.3/highlight.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/styles/index/jquery.pagination.js"></script>
<script>hljs.initHighlightingOnLoad();</script>

<script src="${pageContext.request.contextPath}/styles/index/application.js"></script>
<script type="text/javascript">
    //login fail
    var error_id = '${error['id']}';
    if (error_id != '') {
        $('${error['id']}').popover({placement: 'bottom', content: '${error['message']}'});
        $('${error['id']}').popover('show');
    }

    //validation
    $('#login_form').submit(function () {
        if (!isSecret('#username', 2, 20)) {
            return false;
        }
        if (!isSecret('#password', 6, 20)) {
            return false;
        }
        if (!isSecret('#code', 4, 4)) {
            return false;
        }
    });

    //validation funtion
    function isSecret(id, min_length, max_length) {
        var check = /^[A-Za-z0-9_]+$/;
        if ($(id).val() == '') {
            $(id).popover({placement: 'bottom', content: '输入不能为空'});
            $(id).popover('show');
            return false;
        } else if (!($(id).val().length >= min_length && $(id).val().length <= max_length)) {
            if (min_length == max_length) {
                $(id).popover({placement: 'bottom', content: '长度为' + min_length});
            } else {
                $(id).popover({placement: 'bottom', content: '长度为' + min_length + '到' + max_length});
            }
            $(id).popover('show');
            return false;
        } else {
            if (!check.test($(id).val())) {
                $(id).popover({placement: 'bottom', content: '输入格式有误'});
                $(id).popover('show');
                return false;
            }
        }
        return true;
    }

    $('#username').focus(function () {
        $('#username').popover('destroy');
    });

    $('#password').focus(function () {
        $('#password').popover('destroy');
    });

    //validation code
    var codeImageFlag = true;
    $('#code').focus(function () {
        $('#code').popover('destroy');
        if (codeImageFlag) {
            $('#code').parent().after('<img src="${pageContext.request.contextPath}/image.jsp" alt="验证码" title="点击更换" id="codeImage"/>');
            $('#codeImage').attr('style', 'cursor: pointer;')
            $('#codeImage').click(function () {
                $('#codeImage').attr('src', '${pageContext.request.contextPath}/image.jsp?timestamp=' + new Date().getTime());
            });
            codeImageFlag = false;
        }
    });
</script>
<script type="text/javascript">
    $(function () {
        //渲染分页
        $('#pagination').pagination(${totalCount}, {
            current_page: 0,
            items_per_page: 5,
            num_display_entries: 3,
            callback: function (page_id) {
                $('#list-content').html('');
                $.getJSON('${pageContext.request.contextPath}/news?pageNum=' + page_id, function (data) {
                    for (var i = 0; i < data['newsList'].length; i++) {
                        var title;
                        var less_title;
                        var insert_date;
                        var date;
                        var id;
                        var content;
                        $.each(data['newsList'][i], function (key, val) {
                            if (key == 'title') {
                                title = val;
                                if (title.length > 15) {
                                    less_title = title.substr(0, 15) + '..';
                                } else {
                                    less_title = title;
                                }
                            } else if (key == 'insertDate') {
                                insert_date = new Date(val);
                            } else if (key == 'id') {
                                id = val;
                            } else if (key == 'content') {
                                content = val;
                            } else if (key == 'updateDate') {
                                date = new Date(val);
                            }
                        });
                        $('#list-content').append('<tr><td><a title="' + title + '" data-toggle="modal" data-target="#myModal' + i + '">' + less_title + '</a><div class="modal fade" id="myModal' + i + '" tabindex="-1" role="dialog" aria-labelledby="myModalLabel' + i + '" aria-hidden="true"><div class="modal-dialog"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button><h4 class="modal-title" id="myModalLabel' + i + '">' + title + '<br/><small>更新时间：' + date.getFullYear() + '-' + (date.getMonth() + 1) + '-' + date.getDate() + ' ' + date.getHours() + ':' + date.getMinutes() + '</small></h4></div><div class="modal-body">' + content + '</div><div class="modal-footer"><button type="button" class="btn btn-default" data-dismiss="modal">关闭</button></div></div></div></div></td><td>' + (insert_date.getMonth() + 1) + '-' + insert_date.getDate() + '</td></tr>');
                    }
                });
                $('#pagination>ul').eq(0).attr('class', 'pagination');
            },
            load_first_page: true,
            prev_text: '上一页',
            next_text: '下一页'
        });
        $('#pagination>ul').eq(0).attr('class', 'pagination');
    });

</script>
</body>
</html>
