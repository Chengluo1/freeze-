<%--
  Created by IntelliJ IDEA.
  User: 十田田
  Date: 2020/12/29
  Time: 20:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>
<html>
<head>
    <s:head theme="xhtml" />
    <sx:head parseContent="true" extraLocales="UTF-8" />
    <title>摄影案例</title>
    <script type="application/x-javascript">
        addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
        function hideURLbar(){ window.scrollTo(0,1); }
    </script>
    <script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
    <meta name="keywords" content="">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Site Icons -->
    <link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon">
    <link rel="apple-touch-icon" href="images/apple-touch-icon.png">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <!-- Site CSS -->
    <link rel="stylesheet" href="css/style.css">
    <!-- Responsive CSS -->
    <link rel="stylesheet" href="css/responsive.css">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="css/custom.css">

    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>

<header class="top-navbar">
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container">
            <a class="navbar-brand" href="index.jsp">
                <img src="images/logo.png" alt="" />
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbars-rs-food" aria-controls="navbars-rs-food" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbars-rs-food">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item"><a class="nav-link" href="index.jsp">首页</a></li>
                    <li class="nav-item"><a class="nav-link" href="findAllExample">看案例</a></li>
                    <s:if test="%{#session.photographer!=null}">
                        <li class="nav-item"><a class="nav-link" href="findneeds">找需求</a></li>
                    </s:if>
                    <s:if test="%{#session.id==null}">
                        <li class="nav-item">
                            <a class="nav-link" href="login.jsp">
                                登录</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="registerEmp.jsp">
                                注册</a>
                        </li>
                    </s:if>
                    <s:else>
                        <s:if test="%{#session.Photographer!=null}">
                            <li class="nav-item"><a class="nav-link" href="judge.action" target="_Blank">个人主页</a>
                            </li>
                            <li class="nav-item"><a class="nav-link" href="photographerIndex.jsp">个人中心</a></li>
                        </s:if>
                        <s:elseif test="%{#session.employer!=null}">
                            <li class="nav-item"><a class="nav-link" href="judge.action" target="_Blank">个人主页</a>
                            </li>
                            <li class="nav-item"><a class="nav-link" href="employerIndex.jsp">个人中心</a></li>
                        </s:elseif>
                        <s:elseif test="%{#session.admin!=null}">
                            <li class="nav-item"><a class="nav-link" href="adminIndex.jsp">个人中心</a></li>
                        </s:elseif>
                        <li class="nav-item"><a class="nav-link" href="logout.action">退出</a></li>
                    </s:else>
                </ul>
            </div>
        </div>
    </nav>
</header>
<!-- End header -->

<!-- Start All Pages -->
<div class="all-page-title page-breadcrumb">
    <div class="container text-center">
        <div class="row">
            <div class="col-lg-12">
                <h1>查找案例</h1>
            </div>
        </div>
    </div>
</div>
<!-- End All Pages -->

<!-- Start Gallery -->
<div class="stuff-box">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="heading-title text-center">
                    <h2>查找案例</h2>
                    <form action="searchInFramedes" method="post">
                        <input class="searchtext" type="text" name="condition"
                               placeholder="输入条件搜索案例" required="">
                        <input class="btn btn-lg btn-circle btn-outline-new-white" type="submit" value="搜索" >
                    </form>
                    <form action="searchInList" id="list_form" >
                        <div class="oneline">
                            <dl attr="terminal_os_s">
                                <dt class="lefttitle"><p>风格</p></dt>
                                <dd>
                                    <div class="righttitle">
                                        <label>
                                            <input name="radio2" type="radio" value="少年"autocomplete="off" />
                                            <a href="javascript:;">少年</a></label>
                                        <label>
                                            <input name="radio2" type="radio" value="清新" autocomplete="off" />
                                            <a href="javascript:;">清新</a></label>
                                        <label>
                                            <input name="radio2" type="radio" value="日系" autocomplete="off" />
                                            <a href="javascript:;">日系</a></label>
                                    </div>
                                </dd>
                            </dl>
                        </div>
                        <div class="oneline">
                            <dl attr="terminal_os_s">
                                <dt class="lefttitle"><p>场地</p></dt>
                                <dd>
                                    <div class="righttitle">
                                        <label><input name="radio1" type="radio" value="内景" autocomplete="off" />
                                            <a href="javascript:;">内景</a></label>
                                        <label><input name="radio1" type="radio" value="外景" autocomplete="off" />
                                            <a href="javascript:;">外景</a></label>
                                    </div>
                                </dd>
                            </dl>
                        </div>
                        <button class="btn btn-lg btn-circle btn-outline-new-white" name="butt" >【按关键词搜索】</button>
                    </form>
                </div>
                <div class="heading-title text-center">
                    <div class="resultList">
                        <div class="eliminateCriteria">
                            <form action="eliminate" method="post">
                                <button name="butt"  class="btn btn-lg btn-circle btn-outline-new-white">【清空全部】</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="tz-gallery">
            <div class="heading-title text-center">
                <form action="findAllExample" method="post">
                    <button name="butt"  class="btn btn-lg btn-circle btn-outline-new-white">综合排序</button>
                </form>
                <form action="recommendyou" method="post">
                    <button name="butt"  class="btn btn-lg btn-circle btn-outline-new-white">为你推荐</button>
                </form>
            </div>
            <div class="row">
                <s:if test="#request.examples.size()!=0">
                    <s:iterator value="#request.examples">
                        <div class="col-md-4 col-sm-6">
                            <div class="our-team">
                                <a href="putExample.action?example.exampleId=<s:property value='exampleId'/>">
                                   <s:iterator value="panoramas" status="st">
                                        <div class="pic">
                                            <s:if test="%{#st.first==true}"><img src="<s:property value="panorama1"/>" />
                                            </s:if>
                                            <s:else><img src="<s:property value="panorama1"/>" />
                                            </s:else>
                                        </div>
                                    </s:iterator>
                                    <div class="team-content">
                                        <h4 class="title"><s:property value="name" /></h4>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </s:iterator>
                </s:if>
                <s:else>
                    <h1>没有找到哦</h1>
                </s:else>
            </div>
            <div class="row">
                <s:if test="%{#session.employer!=null}" >
                    <s:iterator value="#session.recommendExamples">
                        <div class="col-md-4 col-sm-6">
                            <div class="our-team">
                                <a href="putExample.action?example.exampleId=<s:property value='exampleId'/>">
                                    <s:iterator value="panoramas" status="st">
                                        <div class="pic">
                                            <s:if test="%{#st.first==true}">
                                                <img src="<s:property value="panorama1"/>" />
                                            </s:if>
                                            <s:else>
                                                <img src="<s:property value="panorama1"/>" />
                                            </s:else>
                                        </div>
                                    </s:iterator>
                                    <div class="team-content">
                                        <h4 class="title"><s:property value="name" /></h4>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </s:iterator>
                </s:if>
                <s:else>
                </s:else>
            </div>
        </div>
    </div>
</div>
<!-- End Gallery -->

<div class="map-full"></div>
<!-- End Stuff -->

<!-- Start Contact info -->
<div class="contact-imfo-box">
    <div class="container">
        <div class="row">
            <div class="col-md-4 arrow-right">
                <i class="fa fa-volume-control-phone"></i>
                <div class="overflow-hidden">
                    <h4>Phone</h4>
                    <p class="lead">
                        +01 123-456-4590
                    </p>
                </div>
            </div>
            <div class="col-md-4 arrow-right">
                <i class="fa fa-envelope"></i>
                <div class="overflow-hidden">
                    <h4>Email</h4>
                    <p class="lead">
                        188888@admin.com
                    </p>
                </div>
            </div>
            <div class="col-md-4">
                <i class="fa fa-map-marker"></i>
                <div class="overflow-hidden">
                    <h4>Location</h4>
                    <p class="lead">
                        800, Lorem Street, US
                    </p>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- End Contact info -->

<!-- Start Footer -->
<footer class="footer-area bg-f">
    <div class="container">
        <div class="row">
            <div class="col-lg-3 col-md-6">
                <h3>关于我们</h3>
                <p>XX约拍平台是由fyl，ch，dzr共同开发的约拍平台。</p>
            </div>
            <div class="col-lg-3 col-md-6">
                <h3>Subscribe</h3>
                <div class="subscribe_form">
                    <form class="subscribe_form">
                        <input name="EMAIL" id="subs-email" class="form_input" placeholder="邮箱地址..." type="email">
                        <button type="submit" class="submit">捐赠</button>
                        <div class="clearfix"></div>
                    </form>
                </div>
                <ul class="list-inline f-social">
                    <li class="list-inline-item"><a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
                    <li class="list-inline-item"><a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
                    <li class="list-inline-item"><a href="#"><i class="fa fa-linkedin" aria-hidden="true"></i></a></li>
                    <li class="list-inline-item"><a href="#"><i class="fa fa-google-plus" aria-hidden="true"></i></a></li>
                    <li class="list-inline-item"><a href="#"><i class="fa fa-instagram" aria-hidden="true"></i></a></li>
                </ul>
            </div>
            <div class="col-lg-3 col-md-6">
                <h3>Contact information</h3>
                <p class="lead">杭州市,西湖区,288号,浙江工业大学</p>
                <p class="lead"><a href="#">+01 2000 800 9999</a></p>
                <p><a href="#"> 188888@admin.com</a></p>
            </div>
            <div class="col-lg-3 col-md-6">
                <h3>摄影师工作时间</h3>
                <p><span class="text-color">工作日: </span>9:Am - 10PM</p>
                <p><span class="text-color">周末 :</span> 8:Am - 11PM</p>
            </div>
        </div>
    </div>

    <div class="copyright">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <p class="company-name">Copyright &copy; 2020.<a target="_blank" href="https://sc.chinaz.com/moban/">&#x7F51;&#x9875;&#x6A21;&#x677F;</a></p>
                </div>
            </div>
        </div>
    </div>

</footer>
<!-- End Footer -->

<a href="#" id="back-to-top" title="Back to top" style="display: none;"><i class="fa fa-paper-plane-o" aria-hidden="true"></i></a>

<!-- ALL JS FILES -->
<script src="js/jquery-3.2.1.min.js"></script>
<script src="js/popper.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<!-- ALL PLUGINS -->
<script src="js/jquery.superslides.min.js"></script>
<script src="js/images-loded.min.js"></script>
<script src="js/isotope.min.js"></script>
<script src="js/baguetteBox.min.js"></script>
<script src="js/form-validator.min.js"></script>
<script src="js/contact-form-script.js"></script>
<script src="js/custom.js"></script>

</body>
</html>
