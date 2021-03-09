<%--
  Created by IntelliJ IDEA.
  User: 十田田
  Date: 2020/12/30
  Time: 0:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>
<html>
<head>
    <s:head theme="xhtml"/>
    <sx:head parseContent="true" extraLocales="UTF-8"/>
    <title>发布需求</title>
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
                <h1>提交需求</h1>
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
                    <h2>免费发布需求，挑选高效的摄影服务</h2>
                    <p>1<span>发布需求</span></p>
                    <p>2<span>摄影师报名</span></p>
                    <p>3<span>挑选摄影师</span></p>
                    <p>4<span>托管资金</span></p>
                    <p>5<span>摄影师摄影</span></p>
                    <p>6<span>验收付款</span></p>
                    <h4>为了尽快能够帮您完成需求，请尽可能详细的描述您的需求！
                        <a href="findneeds">逛需求大厅看看别人怎么写</a></h4>
                    <s:property value="#request.tip"/>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <s:form id="contactForm" action="order" method="post">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label>*选择需求风格：</label>
                                <s:textfield  name="need.style" cssClass="layui-input"  maxlength="10" placeholder="请输入风格" autocomplete="off" class="form-control"/>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label>*填写需求标题：</label>
                                <div>
                                    <s:textfield   cssClass="layui-input"  maxlength="50" placeholder="请输入标题（不能超过50个字符）" autocomplete="off" name="need.title" class="form-control"/>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label>*填写需求描述：</label>
                                <div>
                                    <s:textarea name="need.description" cssClass="layui-textarea"   maxlength="4000" placeholder="请输入需求描述（不得少于10个字符,最多4000字符）" class="form-control"/>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label>*填写需求城市：</label>
                                <div>
                                    <s:textfield   cssClass="layui-input"  placeholder="请输入所在地"  name="need.city" class="form-control"/>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label>*填写需求场地：（内景/外景）</label>
                                <div>
                                    <s:textfield name="need.area"  theme="simple"  cssStyle="width:120px;" maxlength="7" placeholder="请输入需求场地(内景请输入1，外景请输入2）" class="form-control"/>

                                </div>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label>*报名截止时间：</label>
                                <div>
                                    <sx:datetimepicker name="need.time2" displayFormat="yyyy-MM-dd"   cssClass="layui-input" />
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label>*预算金额：</label>
                                <div>
                                    <s:textfield name="need.money" cssClass="layui-input fl"  maxlength="7" lay-verify="required|money"/><span>元</span>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label>*拍摄完成日期：</label>
                                <div>
                                    <sx:datetimepicker name="need.time3" displayFormat="yyyy-MM-dd"   cssClass="layui-input"/>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="submit-button text-center">
                                <s:submit class="btn btn-common" value="立即发布"/>
                                <div id="msgSubmit" class="h3 text-center hidden"></div>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                    </div>
                </s:form>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="heading-title text-center">
                    <h2>如不清楚怎么填写你的需求，请参照模板填写！</h2>
                    <p>1、需求风格:<span>风格可以根据自己的喜好选择，如不确定，请选择其他；</span></p>
                    <p>2、需求标题:<span>标题尽量用简单、明了的语言来描述自己的需求。如：地中海小户设计；</span></p>
                    <p>3、需求描述:<span>好的需求描述，能够让摄影师更容易理解您，尽快的帮您完成需求；</span></p>
                    <h4 style="font-size: 14px;margin-top: 0;">您可要参考下列描述，根据自己的需求选择填写：</h4>
                    <p>(1).拍摄对象介绍：如情侣或是全家福......</p>
                    <p>(2).拍摄风格：如简洁、小清新、要有亲和力......</p>
                    <p>(3).拍摄色调：如蓝色、红色、黄色......</p>
                    <p>(4).拍摄场地：如内景或外景</p>
                    <p>(5).设计具体要求：如对妆容、服装等的具体要求......</p>
                    <p>4、需求所在地:<span>拍摄所在城市</span></p>
                    <p>5、需求场地:<span>拍摄的场地要求</span></p>
                    <p>6、报名截止时间:<span>报名截止时间后不允许再报名</span></p>
                    <p>7、预算金额:<span>支付给摄影师金额。预算后期无法修改。为了减少沟通，增大报名率，建议根据自己的预算填写</span></p>
                    <p>8、设计截止时间:<span>期望照片交付的时间</span></p>
                </div>
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

    <script type="text/javascript" charset="UTF-8">
        var msg=""+'${request.tip}';
        if(msg!=""){
            alert(msg);
        }
    </script>
</body>
</html>