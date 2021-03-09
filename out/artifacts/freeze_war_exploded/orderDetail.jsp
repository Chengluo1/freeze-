<%--
  Created by IntelliJ IDEA.
  User: Catherine小天使
  Date: 2020/12/29
  Time: 14:20
  To change this template use File | Settings | File Templates.
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <sx:head parseContent="true" extraLocales="UTF-8" />
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

<!-- Start All Pages -->
<div class="all-page-title page-breadcrumb">
    <div class="container text-center">
        <div class="row">
            <div class="col-lg-12">
                <h1>订单详情</h1>
            </div>
        </div>
    </div>
</div>
<div class="reservation-box">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="heading-title text-center">
                    <h2>订单详情</h2>
                    <p>在此可以看到完整的订单情况</p>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12 col-sm-12 col-xs-12">
                <div class="contact-block">
                    <table id="contactForm">
                        <div class="row">
                            <div class="col-md-6">
                                <h3>雇主信息</h3>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label>雇主姓名：</label>
                                        <s:property value="#request.orderr.employer.name" />
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label>雇主电话：</label>
                                        <s:property value="#request.orderr.employer.phone" />
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label>雇主QQ：</label>
                                        <s:property value="#request.orderr.employer.qq" />
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <h3>摄影师信息</h3>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label>摄影师姓名：</label>
                                        <s:property value="#request.orderr.photographer.name" />
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label>摄影师电话：</label>
                                        <s:property value="#request.orderr.photographer.phone" />
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label>摄影师QQ：</label>
                                        <s:property value="#request.orderr.photographer.qq" />
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <h3>订单信息</h3>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label>订单编号：</label>
                                        <s:property value="#request.orderr.orderrId" />
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label>订单标题：</label>
                                        <s:property value="#request.orderr.title" />
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label>订单预算：</label>
                                        <s:property value="#request.orderr.money" />
                                        元
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label>订单描述：</label>
                                        <s:property value="#request.orderr.description" />
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label>约拍时间：</label>
                                        <s:date name="#request.orderr.finishTime"
                                                format="yyyy-MM-dd HH:mm:ss" />
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label>订单创建时间：</label>
                                        <s:date name="#request.orderr.beginTime"
                                                format="yyyy-MM-dd HH:mm:ss" />
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label>订单状态：</label>
                                        <s:property value="#request.orderr.state" />
                                    </div>
                                </div>
                                <s:if test='%{#request.orderr.state.equals("已完成")}'>
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label>成交时间：</label>
                                            <s:date name="#request.orderr.finishTime"
                                                    format="yyyy-MM-dd HH:mm:ss" />
                                        </div>
                                    </div>
                                </s:if>
                            </div>
                            <s:if test="%{#session.employer!=null}">
                                <s:if test='%{#request.orderr.state.equals("未付款")}'>
                                    <div class="col-md-12">
                                        <form action="pay" method="post" target="_blank">
                                            <div class="submit-button text-center">
                                                <s:hidden value="%{#request.orderr.orderrId}" name="orderrId"/>
                                                <s:submit class="btn btn-common" value="支付"/>
                                                <div id="msgSubmit" class="h3 text-center hidden"></div>
                                                <div class="clearfix"></div>
                                            </div>
                                        </form>
                                    </div>
                                </s:if>

                            <s:elseif test='%{#request.orderr.state.equals("已付款")}'>

                                <div class="col-md-12">
                                    <form action="refund" method="post" target="_blank">
                                        <div class="submit-button text-center">
                                            <s:hidden value="%{#request.orderr.orderrId}" name="orderrId"/>
                                            <s:submit class="btn btn-common" value="申请退款"/>
                                            <div id="msgSubmit" class="h3 text-center hidden"></div>
                                            <div class="clearfix"></div>
                                        </div>
                                    </form>
                                </div>

                            </s:elseif>
                            </s:if>
                            <s:if test="%{#session.photographer!=null}">
                                <s:if test='%{#request.orderr.state.equals("已付款")}'>
                                    <div class="col-md-12">
                                        <form name="alipayment" action="finish"
                                              method="post">
                                            <div class="submit-button text-center">
                                                <s:hidden value="%{#request.orderr.orderrId}" name="orderrId"/>
                                                <button type="submit" id="cancel" class="btn btn-common">确认完成</button>
                                                <div id="msgSubmit" class="h3 text-center hidden"></div>
                                                <div class="clearfix"></div>
                                            </div>
                                        </form>
                                    </div></s:if></s:if>
                        </div>
                    </table>
                </div>
            </div>
        </div>
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

<script type="text/javascript" charset="UTF-8">
    var msg=""+'${request.tip}';
    if(msg!=""){
        alert(msg);
    }
</script>
</body>
</html>

