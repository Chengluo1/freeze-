<%--
  Created by IntelliJ IDEA.
  User: Catherine小天使
  Date: 2020/12/27
  Time: 13:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
    <title>需求列表</title>
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
    <script type="text/javascript" src="https://stc.shejiben.com/gb_js/sea.js"></script>
    <script type="text/javascript">
        seajs.config({
            alias: {
                'jquery': 'js/jquery_module.js',  //jquery version must be 1.7x
                'common': 'js/main.js',
                'form': 'js/module.form.js',
                'ui': 'js/module.ui.js',
                'colorbox': 'js/jquery.colorbox.min.js',
                'newHeader': 'js/userCenter.js'
            },
            preload: ['jquery', 'common']  //预加载jquery和main.js
        });
    </script>

    <script src="js/jquery-1.11.0.min.js" type="text/javascript"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/distpicker.data.js"></script>
    <script src="js/distpicker.js"></script>
    <script>
        $(document).ready(function () {
            $('#ecityName').change(function () {
                var provinceId = $("#distpicker").find('option:selected').eq(0).attr('data-code');
                var provinceName = $("#eprovinceName").val();
                var cityId = $("#distpicker").find('option:selected').eq(1).attr('data-code');
                var cityName = $("#ecityName").val();
                var city = cityName;
                var myform = $('#form1'); //得到form对象
                document.getElementById("city").value = city;
                myform.submit();
            })
        })
    </script>
    <script>
        $(function () {
            $("#distpicker").distpicker('destroy');
            $("#distpicker").distpicker({
                autoSelect: false,
                placeholder: false,
                province: '----请选择省----',
                city: '----请选择市----',
            });
        });
    </script>
</head>

<body>
<!-- Start header -->
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
                    <li class="nav-item"><a class="nav-link" href="findneeds">找需求</a></li>

                    <s:if test="%{#session.id==null}">
                        <li class="nav-item">
                            <a class="nav-link" href="login.jsp">
                                登录</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="registerPho.jsp">
                                注册</a>
                        </li>
                    </s:if>
                    <s:else>
                        <li class="nav-item"><a class="nav-link" href="judge.action" target="_Blank">个人主页</a></li>
                    </s:else>
                </ul>
            </div>
        </div>
    </nav>
</header>

<br>

<!-- Start All Pages -->
<div class="all-page-title page-breadcrumb">
    <div class="container text-center">
        <div class="row">
            <div class="col-lg-12">
                <h1>需求列表</h1>
            </div>
        </div>
    </div>
</div>
<!-- End All Pages -->

<!-- Start Menu -->
<div class="menu-box">
    <script type="text/javascript">
        seajs.use(['newHeader', 'common'], function (Header, common) {
            $(document).ready(function () {
                Header.init();
                common.initHeader();
            });
        });
    </script>
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="heading-title text-center">
                    <h2>需求列表</h2>
                    <p>在此观看已有的项目需求。</p>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12 col-sm-12 col-xs-12">
                <div class="contact-block">
                    <form action="./findneeds" id="form1">
                        <div class="col">
                            <div>
                                <label>拍摄场地：</label>
                                <div class="row">
                                    <s:if test="#request.area==0">
                                        <a class="btn btn-lg btn-circle btn-outline-new-white" href="./findneeds?area=0&money=${money}&order=${order}&city=${city}">不限</a>
                                    </s:if>
                                    <s:else>
                                        <a class="btn btn-lg btn-circle btn-outline-new-white" href="./findneeds?area=0&money=${money}&order=${order}&city=${city}">不限</a>
                                    </s:else>
                                    <s:iterator value="#session.areaList" var="a" status="st">
                                        <s:if test="#st.index>0">
                                            <s:if test="#request.area==#st.index">
                                                <a class="btn btn-lg btn-circle btn-outline-new-white" href="./findneeds?area=${st.index}&money=${money}&order=${order}">${a }</a>
                                            </s:if>
                                            <s:else>
                                                <a class="btn btn-lg btn-circle btn-outline-new-white" href="./findneeds?area=${st.index}&money=${money}&order=${order}">${a }</a>
                                            </s:else>
                                        </s:if>
                                    </s:iterator>
                                </div>
                            </div>

                            <div>
                                <label>预算金额：</label>
                                <div class="row">
                                    <s:if test="#request.money==0">
                                        <a class="btn btn-lg btn-circle btn-outline-new-white" href="./findneeds?money=0&area=${area}&order=${order}">不限</a>
                                    </s:if>
                                    <s:else>
                                        <a class="btn btn-lg btn-circle btn-outline-new-white" href="./findneeds?money=0&area=${area}&order=${order}">不限</a>
                                    </s:else>
                                    <s:iterator value="#session.moneyList" var="a" status="st">
                                        <s:if test="#st.index>0">
                                            <s:if test="#request.money==#st.index">
                                                <a class="btn btn-lg btn-circle btn-outline-new-white" href="./findneeds?money=${st.index}&area=${area}&order=${order}">${a }元</a>
                                            </s:if>
                                            <s:else>
                                                <a class="btn btn-lg btn-circle btn-outline-new-white" href="./findneeds?money=${st.index}&area=${area}&order=${order}">${a }元</a>
                                            </s:else>
                                        </s:if>
                                    </s:iterator>
                                </div>
                            </div>

                            <div>
                                <label>所在城市：</label>
                                <div class="row">
                                    <div class="form-group">
                                        <div data-toggle="distpicker" id="distpicker1">
                                            <select class="custom-select d-block form-control" id="eprovinceName" name="provinceName"></select>
                                            <select class="custom-select d-block form-control" id="ecityName" name="cityName"></select>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div>
                                <label>当前选择：${city }</label>
                                <input type="hidden" value="${area }" name="area" id="area">
                                <input type="hidden" value="${money }" name="money" id="money">
                                <input type="hidden" value="${order }" name="order" id="order">
                                <input type="hidden" name="city" id="city" value="${city }"/>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <div>
                <s:if test="#request.order==1">
                    <a href="./findneeds?order=1&money=${money}&area=${area}">约拍时间<span></span></a>
                </s:if>
                <s:else>
                    <a href="./findneeds?order=1&money=${money}&area=${area}">约拍时间<span></span></a>
                </s:else>
            </div>
            <div class="blog-box">
                <div class="container">
                    <div class="row">
                        <s:iterator value="#request.needs">
                            <div class="col-lg-4 col-md-6 col-12">
                                <div class="blog-box-inner">
                                    <div class="blog-img-box">
                                        <img class="img-fluid" src="images/blog-img.jpg" alt="">
                                    </div>
                                    <div>
                                        <div class="blog-detail">
                                            <div>
                                                <h4><a href="./needsByID?needsId=${needsId}" target="_blank">
                                                    <s:property value="title"/>
                                                </a></h4>
                                                <span class="price"><s:property value="money"/></span>
                                            </div>
                                            <div>
                                                <ul>
                                                    <li><span><s:property value="city"/></span></li>
                                                    <li>|</li>
                                                    <li> <span>
                                        <s:if test="%{area==1}">
                                            外景
                                        </s:if>
                                        <s:elseif test="%{area==2}">
                                            内景
                                        </s:elseif>
                                        </span></li>
                                                </ul>
                                                <p><span>${style }</span></p>
                                                <p><span><s:date name="%{time1}" format="yyyy-MM-dd HH:mm:ss"/></span></p>
                                            </div>
                                            <a class="btn btn-lg btn-circle btn-outline-new-white" href="./needsByID?needsId=${needsId}">查看详情</a></li>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </s:iterator>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
<!-- End Menu -->

<!-- Start QT -->
<div class="qt-box qt-background">
    <div class="container">
        <div class="row">
            <div class="col-md-8 ml-auto mr-auto text-center">
                <p class="lead ">
                    " 我渴望捕捉我眼前所有的美，经过长期的努力，终于如愿以偿。 "
                </p>
                <span class="lead">朱莉娅·玛格丽特·卡梅伦</span>
            </div>
        </div>
    </div>
</div>
<!-- End QT -->

<!-- Start Customer Reviews -->
<div class="customer-reviews-box">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="heading-title text-center">
                    <h2>用户评价</h2>
                    <p>在这里，您可以看到之前用户对我们服务的评价</p>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-8 mr-auto ml-auto text-center">
                <div id="reviews" class="carousel slide" data-ride="carousel">
                    <div class="carousel-inner mt-4">
                        <div class="carousel-item text-center active">
                            <div class="img-box p-1 border rounded-circle m-auto">
                                <img class="d-block w-100 rounded-circle" src="images/quotations-button.png" alt="">
                            </div>
                            <h5 class="mt-4 mb-0"><strong class="text-warning text-uppercase">快乐哥</strong></h5>

                            <p class="m-0 pt-3">个人很满意，摄影师小姐姐很好看。</p>
                        </div>
                        <div class="carousel-item text-center">
                            <div class="img-box p-1 border rounded-circle m-auto">
                                <img class="d-block w-100 rounded-circle" src="images/quotations-button.png" alt="">
                            </div>
                            <h5 class="mt-4 mb-0"><strong class="text-warning text-uppercase">小楚</strong></h5>

                            <p class="m-0 pt-3">服务态度很好，摄影技术很棒。</p>
                        </div>
                        <div class="carousel-item text-center">
                            <div class="img-box p-1 border rounded-circle m-auto">
                                <img class="d-block w-100 rounded-circle" src="images/quotations-button.png" alt="">
                            </div>
                            <h5 class="mt-4 mb-0"><strong class="text-warning text-uppercase">李明峰</strong></h5>

                            <p class="m-0 pt-3">专业知识充足，拍摄效果良好。</p>
                        </div>
                    </div>
                    <a class="carousel-control-prev" href="#reviews" role="button" data-slide="prev">
                        <i class="fa fa-angle-left" aria-hidden="true"></i>
                        <span class="sr-only">上一条</span>
                    </a>
                    <a class="carousel-control-next" href="#reviews" role="button" data-slide="next">
                        <i class="fa fa-angle-right" aria-hidden="true"></i>
                        <span class="sr-only">下一条</span>
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- End Customer Reviews -->

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
