<%--
  Created by IntelliJ IDEA.
  User: 十田田
  Date: 2020/12/29
  Time: 20:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
<title>找他摄影</title>
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
                    <s:elseif test="%{#session.employer!=null}">
                        <li class="nav-item"><a class="nav-link" href="needs.jsp">免费发布需求</a></li>
                    </s:elseif>
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
                <h1>预约摄影师</h1>
            </div>
        </div>
    </div>
</div>
<!-- Start Contact -->
<div class="contact-box">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <s:form action="subscribe" method="post">
                    <s:hidden name="employerId"  value="%{#session.employer.employerId}" />
                    <s:hidden name="photographerId"  value="%{#request.photographer.photographerId}" />
                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <label>*填写需求标题：</label>
                            <div>
                            <s:textfield  cssClass="layui-input"  maxlength="50" cssStyle="width:250px;" placeholder="请输入标题" autocomplete="off" name="subscribe.title"/>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="form-group">
                            <label>*填写需求描述：</label>
                            <div>
                                <s:textarea name="subscribe.description" cssClass="layui-textarea"  cssStyle="width: 520px; height: 160px; resize: none;  maxlength:4000" placeholder="请输入需求描述(风格、场地、所在地...)"/>
                                <span>需求描述字符不得少于10个字符,最多4000字符</span>
                            </div>
                        <div>
                    </div>
                    <div class="col-md-12">
                        <div class="form-group">
                            <label>*预算金额：</label>
                            <div>
                                <s:textfield name="subscribe.money" cssClass="layui-input" theme="simple"  cssStyle="width:120px;" maxlength="7"/><span>元</span>
                                <span>请输入预算金额</span>
                            </div>
                        </div>
                    <div>
                  <div>
                  <div class="col-md-12">
                     <div class="submit-button text-center">
                         <s:submit class="layui-btn sub-form" value="预约"/>
                         <div id="msgSubmit" class="h3 text-center hidden"></div>
                         <div class="clearfix"></div>
                        </s:form>
                     </div>
                  </div>
       </div>
     </div>

         <div class="fl  ">
             <div class="userInfo" id="userInfoBox">
                 <div class="wd_whiteBg">
                     <div class="wdr_bbt text-center">
                         <div class="smalltitle">
                            ---------------------------------------------------------------------------------------------------
                         </div>
                         <div class="smalltitle">
                         摄影师详情
                         </div>
                         <div class="wdr_imgBox">
                             <img src="photographer/photographer/profilephoto/<s:property value="#request.photographer.profilePhoto"/>" width="300" height="300">
                             </a>
                         </div>
                         <div class="wdr_name">
                             <span class="province"><s:property value="#request.photographer.account" /></span>
                         </div>
                         <div class="ff-c-gray">
                             <span class="province">所在城市：<s:property value="#request.photographer.region" /></span>
                         </div>
                           <br>
                         <div class="wdr_bbt">
                             <div class="wdr_infoBox h-initial font_fal">
                                <div class="wdr_info2">
                                <span class="wdr_infoTitle">粉丝：<s:property value="#request.photographer.fans" /></span>
                                </div>
                                 <span class="wdr_infoTitle">点赞：<s:property value="#request.photographer.praise" /></span>
                             </div>
                             <div class="wdr_info2">
                                 <span class="wdr_infoTitle">评分：<s:property value="#request.photographer.score" /></span>
                            </div>
                          </div>
                     </div>
                     <div class="wdr_title text-center"><b>联系方式：</b></div>
                     <div class="wdr_bbtt">
                        <div class="wdr_line wdr_line_noBlock"><b>&nbsp;&nbsp;&nbsp;Q&nbsp;Q：</b><b class="ff-c-gra"><s:property value="#request.photographer.qq" /></b></div>
                           <div class="wdr_line wdr_line_noBlock"><b>&nbsp;&nbsp;&nbsp;微信：</b><b class="ff-c-gra"><s:property value="#request.photographer.wechat" /></b></div>
                           <div class="wdr_line wdr_line_noBlock"><b>&nbsp;&nbsp;&nbsp;手机：</b><b class="ff-c-gra"><s:property value="#request.photographer.phone" /></b></div>
                           <div class="wdr_line wdr_line_noBlock"><b>&nbsp;&nbsp;&nbsp;邮箱：</b><b class="ff-c-gra"><s:property value="#request.photographer.email" /> </b></div>
                     </div></div></div></div></div></div>


    <script type="text/javascript">
        var msg=""+'${request.tipMessage}'; 
        if(msg!=""){ 
          alert(msg); 
      } 
     </script>
      </body></html>