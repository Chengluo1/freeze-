<%--
  Created by IntelliJ IDEA.
  User: Catherine小天使
  Date: 2020/12/27
  Time: 14:02
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
    <title>需求详情</title>
    <script type="text/javascript">
        function signup(NeedsID)
        {
            if(confirm("确认申请？")){
                $.post(
                    "SignUp.action",
                    {needsId:NeedsID},
                    function(result){
                        location.reload();
                        /*    var ret = $.parseJSON(result);
                            if(ret.success){
                                alert("申请成功");
                                location.reload();
                            }
                            else{
                                alert("申请失败");
                            }*/
                    }
                );
            }
        }
    </script>
    <script type="text/javascript">
        function cancelSignup(NeedsID)
        {
            if(confirm("确认取消？")){
                $.post(
                    "cancelSignUp.action",
                    {needsId:NeedsID},
                    function(result){
                        location.reload();
                        /*    var ret = $.parseJSON(result);
                            if(ret.success){
                                alert("取消成功");
                                location.reload();
                            }
                            else{
                                alert("取消失败");
                            }*/
                    }
                );
            }
        }
    </script>
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
                            <a class="nav-link" href="registerEmp.jsp">
                                注册</a>
                        </li>
                    </s:if>
                    <s:else>
                        <s:if test="%{#session.photographer!=null}">
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
                    </s:else>
                </ul>
            </div>
        </div>
    </nav>
</header>
<!-- End header -->

<div class="all-page-title page-breadcrumb">
    <div class="container text-center">
        <div class="row">
            <div class="col-lg-12">
                <h1>需求详情</h1>
            </div>
        </div>
    </div>
</div>

<div class="reservation-box">
<div class="container">
<div class="row">
    <div class="col-lg-12">
        <div class="heading-title text-center">
            <h2><s:property value="#request.needs.title"/></h2>
            <p><span><s:date name="#request.needs.time1" format="yyyy-MM-dd HH:mm:ss"/>发布</span>
                <span>发布者：<s:property value="#request.needs.employer.account"/></span></p>
        </div>
    </div>
</div>
<div class="row">
<div class="col-lg-12 col-sm-12 col-xs-12">
<div class="contact-block">
<s:if test="%{#session.photographer!=null}">
    <div>
        <div class="submit-button text-center">
            <s:if test="%{#request.hasSignup}">
                <button class="btn btn-common" onclick="cancelSignup(${needs.needsId})">取消接单</button>
            </s:if>
            <s:else>
                <button class="btn btn-common" onclick="signup(${needs.needsId})">申请接单</button>
            </s:else>
            <div id="msgSubmit" class="h3 text-center hidden"></div>
            <div class="clearfix"></div>
        </div>
        <div class="submit-button text-center">已有<span id="number"><s:property value="#request.needs.enrollment"/></span>位摄影师报名</div>
<br><br>
    </div>
</s:if>
<table id="contactForm">
<div class="row">
<div class="col-md-6">
<h3>项目需求信息</h3>
<div class="col-md-12">
    <div class="form-group">
        <label>项目地点：</label><s:property value="#request.needs.city"/>
    </div>
</div>
<div class="col-md-12">
    <div class="form-group">
        <label>项目风格：</label><s:property value="#request.needs.style"/>
    </div>
</div>
<div class="col-md-12">
<div class="form-group">
    <label>项目场地：</label>
    <s:if test="%{#request.needs.area==1}">內景</s:if>
    <s:elseif test="%{#request.needs.area==2}">外景</s:elseif>
    </div>
    </div>
    </div>
    <div class="col-md-6">
    <div class="col-md-12">
    <div class="form-group">
    <label>拍摄预算：</label><em><s:property value="#request.needs.money"/></em>
    </div>
    </div>
    <div class="col-md-12">
    <div class="form-group">
    <label>拍摄截止时间：</label><s:date name="#request.needs.time3" format="yyyy-MM-dd"/>
    </div>
    </div>
    <div class="col-md-12">
    <div class="form-group">
    <label>报名截止时间：</label><s:date name="#request.needs.time2" format="yyyy-MM-dd"/>
    </div>
    </div>
    <div class="col-md-12">
    <div class="form-group">
    <div>拍摄要求</div>
    <div><s:property value="#request.needs.description"/></div>
    </div>
    </div>
    </div>
    </div>
    </table>
    </div>
    </div>
    </div>

    <s:if test="%{#session.employer.employerId.equals(#request.needs.employer.employerId)}">

        <div class="row">
            <div class="col-lg-12">
                <div class="smalltitle text-center">
                ------------------------------------------------------------------------------------------------------------------
                </div>
                <div class="heading-title text-center">
                    <h2>已报名的摄影师</h2>

                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12 col-sm-12 col-xs-12">
                <div class="contact-block">
                    <table id="contactForm1">
                        <div class="row">
                            <s:iterator value="#request.needs.photographers">
                                <div class="col-md-6">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <img src="photographer/photographer/profilephoto/<s:property value="profilePhoto"/>" weight="200px" height="200px"/>
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label>摄影师昵称：</label><s:property value="account" />
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label>联系方式：</label><s:property value="phone" />
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label>所在地：</label><s:property value="region" />
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label>赞数：</label><s:property value="praise" />
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <a href="putPhotographer.action?photographer.photographerId=<s:property value='photographerId'/>">查看摄影师主页</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="submit-button text-center">
                                        <form action="SelectPho" method="post">
                                            <input type="hidden" name="needs.needsId"  value="<s:property value="#request.needs.needsId"/>" />
                                            <input type="hidden" name="photographer.photographerId"  value="<s:property value='photographerId'/>" />
                                            <input type="hidden" name="employer.employerId"  value="<s:property value="#request.needs.employer.employerId" />" />
                                            <button class="btn btn-common" id="select"  type="submit" >挑选</button>
                                            <div id="msgSubmit1" class="h3 text-center hidden"></div>
                                            <div class="clearfix"></div>
                                        </form>
                                    </div>
                                </div>
                            </s:iterator>
                        </div>
                    </table>
                </div>
            </div>
        </div>
    </s:if>
    </div>
    </div>
    <!-- End Reservation -->


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
