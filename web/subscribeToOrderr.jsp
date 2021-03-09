<%--
  Created by IntelliJ IDEA.
  User: Catherine小天使
  Date: 2020/12/28
  Time: 21:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>
<html>
<title>创建订单</title>
<sx:head parseContent="true" extraLocales="UTF-8"/>
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

<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
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
                    <li class="nav-item"><a class="nav-link" href="findAllExample">看案例</a></li>
                    <s:if test="%{#session.photographer!=null}">
                        <li class="nav-item"><a class="nav-link" href="findneeds">找需求</a></li>
                    </s:if>
                    <li class="nav-item"><a class="nav-link" href="selectPhotographer.jsp" target="_blank">查找摄影师</a></li>
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
                            <li class="nav-item"><a class="nav-link" href="logout.action">退出</a></li>
                        </s:if>
                        <s:elseif test="%{#session.employer!=null}">
                            <li class="nav-item"><a class="nav-link" href="judge.action" target="_Blank">个人主页</a>
                            </li>
                            <li class="nav-item"><a class="nav-link" href="employerIndex.jsp">个人中心</a></li>
                            <li class="nav-item"><a class="nav-link" href="logout.action">退出</a></li>
                        </s:elseif>
                        <s:elseif test="%{#session.admin!=null}">
                            <li class="nav-item"><a class="nav-link" href="adminIndex.jsp">个人中心</a></li>
                            <li class="nav-item"><a class="nav-link" href="logout.action">退出</a></li>
                        </s:elseif>
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
                <h1>创建订单</h1>
            </div>
        </div>
    </div>
</div>
<!-- End All Pages -->

<!-- Start Contact -->
<div class="contact-box">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="heading-title text-center">
                    <h2>创建订单</h2>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <form id="contactForm" action="SubmitOrderr" method="post">
                    <input type="hidden" name="photographer.photographerId" value="<s:property value='#request.scriber.photographerId' />"/>
                    <input type="hidden" name="employer.employerId"  value="<s:property value='#request.subscriber.employerId' />"/>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="layui-form-label">摄影师</label>
                                <div class="layui-input-block" >
                                    <a href="putPhotographer.action?photographer.photographerId=<s:property value='#request.scriber.photographerId'/>"  target="_blank"> <s:property value="#request.scriber.name"/></a>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label>雇主</label>
                                <div>
                                    <s:property value="#request.subscriber.name"/>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label>联系方式</label>
                                <div>
                                    <s:property value="#request.subscriber.phone"/>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label>订单标题</label>
                                <div>
                                    <input type="text" name="orderr.title" readonly="true" value="<s:property value="#request.subscribe.title"/>"   lay-verify="required|title"  maxlength="100" autocomplete="off">
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label>订单描述</label>
                                <div>
                                    <textarea name="orderr.description" readonly="true" lay-verify="required|desc" maxlength="500"><s:property value="#request.subscribe.description"/></textarea>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label></label>
                                <div>
                                    <p>填写预计完成时间时请与用户联系！</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label>完成时间</label>
                                <div>
                                    <input type="text" name="orderr.finishTime" id="date" lay-verify="date" placeholder="yyyy-MM-dd" autocomplete="off">
                                </div>
                                <div><i>*</i>注：和雇主约定完成时间</div>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label>总金额</label>
                                <div>
                                    <input type="text" name="orderr.money" value="<s:property value="#request.subscribe.money"/>"  lay-verify="<s:property value="#request.subscribe.money"/>"  autocomplete="off">
                                </div>
                                <div ><i>*</i>注：和雇主谈好酬金</div>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="submit-button text-center">
                                <!--    <button lay-submit="" lay-filter="demo1">提交订单</button>-->
                                    <button class="btn btn-common" id="submit"  type="submit" lay-submit="" lay-filter="demo1">提交订单</button>
                                <div id="msgSubmit" class="h3 text-center hidden"></div>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- End Contact -->

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

<script>
    layui.use(['form', 'layedit', 'laydate'], function(){
        var form = layui.form
            ,layer = layui.layer
            ,layedit = layui.layedit
            ,laydate = layui.laydate;
        //日期
        laydate.render({
            elem: '#date'
        });

    });
</script>
</body>
</html>
