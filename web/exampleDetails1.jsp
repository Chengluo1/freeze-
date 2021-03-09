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
    <title>案例详情</title>
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
    <script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
    <script type="text/javascript">

        function star() {
            var exampleId=document.getElementById("exampleId").value;
            var userId=document.getElementById("userId").value;
            if(userId=="") {
                alert("登录后可以使用收藏功能！");
                return;
            }
            var path =  $('#staricon').attr('src');
            if(path=="images/star.jpg") {
                $.ajax({
                    type: "post",
                    data:{exampleId:exampleId, userId:userId},
                    url: "unstar",
                    beforeSend: function(XMLHttpRequest){
                    },
                    success: function(data){
                        var x="#staricon";//获取要改变的记录的图标id
                        $(x).attr("src","images/star1.png");
                    },
                    error: function(){
                        //请求出错处理
                        alert("Error!");
                    }
                });
            }
            else {
                $.ajax({
                    type: "post",
                    data:{exampleId:exampleId, userId:userId},
                    url: "star",
                    beforeSend: function(XMLHttpRequest){
                    },
                    success: function(data){
                        var x="#staricon";//获取要改变的记录的图标id
                        $(x).attr("src","images/star.jpg");
                    },
                    error: function(){
                        //请求出错处理
                        alert("Error!");
                    }
                });
            }

        }

        function pr(){
            // var exampleID=$('#exampleId').value;
            var exampleID=document.getElementById("exampleId").value;
            var userId=document.getElementById("userId").value;
            var path =  $('#praiseicon').attr('src');
            if(path=="images/praise2.jpg") {
                alert("已经点过赞了！");
                return;
            }
            if(userId=="") {
                alert("登录后可以使用点赞功能！");
                return;
            }
            $.ajax({
                type: "post",
                data:"exampleId="+exampleID,
                url: "praise",
                beforeSend: function(XMLHttpRequest){},
                success: function(data){
                    var x="#praiseicon";//获取要改变的记录的图标id
                    $(x).attr("src","images/praise2.jpg");
                    var y=document.getElementById("prnum");
                    y.innerText=data;
                },
                error: function(){
                    //请求出错处理
                    alert("Error!");
                }
            });
        }

        function review(){
            var userId=document.getElementById("userId").value;
            if(userId=="") {
                alert("请先登录！");
                return false;
            }
        }

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
                <h1>案例详情</h1>
                <img src="images/s1.jpg" alt="">
            </div>
        </div>
    </div>
</div>


<input type="hidden" id="exampleId" value="${example.exampleId}"/>
<input type="hidden" id="userId" value="<s:property value="#session.id"/>"/>

<!-- banner -->
<div class="reservation-box">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="heading-title text-center">
                    <h2><s:property value="#request.example.name" /></h2>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12 col-sm-12 col-xs-12">
                <div class="contact-block">
                    <table id="contactForm">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label>风格：</label>
                                        <s:property value="#request.example.style" />
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label>场地：</label>
                                        <s:if test="%{#request.example.area==1}">
                                            内景
                                        </s:if>
                                        <s:elseif test="%{#request.example.area==2}">
                                            外景
                                        </s:elseif>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label>上传时间：</label>
                                        <s:property value="#request.example.time" />
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label>描述：</label>
                                        <s:property value="#request.example.description" />
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form-group">
                                        <div class="praise" id="praise" onclick="pr()">
                                            <img src="images/praise.jpg" id="praiseicon" width="25px" />
                                            <p id="prnum"><s:property value="#request.example.praise" /></p>
                                        </div>
                                        <div class="star" onclick="star()">
                                            <s:if test="%{#session.employer!=null}">
                                            <s:iterator value="#session.employer.examples_star"  end="exitId">
                                                <div>
                                                    <s:if test="#request.example.exampleId == exampleId">
                                                        <img src="images/star.jpg" id="staricon" width="25px" />
                                                        <s:set var="exitId" value="0"></s:set>
                                                        <s:set var="flag" value="1" scope="request"></s:set>
                                                    </s:if>
                                                </div>
                                            </s:iterator>
                                            <s:if test="#request.flag != 1">
                                                <img src="images/star1.png" id="staricon" width="25px" />
                                            </s:if>
                                        </div>
                                        </s:if>
                                        <s:else>
                                        </s:else>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </table>
                </div>
            </div>
        </div>
        <div class="blog-comment-box">
            <div class="comment-item">
                <div class="comment-item-left">
                    <img src="photographer/photographer/profilephoto/<s:property value="#request.photographer.profilePhoto"/>" alt="" width="150" height="100"/>
                </div>
                <div class="comment-item-right">
                    <div class="pull-left">
                        <p><s:property value="#request.photographer.account" /></p>
                    </div>
                    <div class="pull-right">
                        <i class="fa fa-clock-o" aria-hidden="true"></i>点赞数 : <s:property value="#request.photographer.praise" />
                    </div>
                    <a href="putPhotographer.action?photographer.photographerId=<s:property value="#request.example.photographerId" />" class="right-btn-re"><i class="fa fa-reply" aria-hidden="true"></i>
                        <input type="button" value="访问摄影师主页"/></a>
                </div>
            </div>
        </div>
        <div class="blog-comment-box">
            <h3>评论区</h3>
            <s:iterator value="#request.displayComs">
                <s:if test="status!=1">
                    <div class="comment-item">
                        <div class="comment-item-left">
                            <s:if test="%{#session.employer!=null}">
                                <img src="photographer/photographer/profilephoto/<s:property value="profilePhoto"/>" alt="" width="50" height="33"/>
                            </s:if>
                            <s:if test="%{#session.photographer!=null}">
                                <img src="photographer/photographer/profilephoto/<s:property value="#request.photographer.profilePhoto"/>" alt="" width="50" height="33"/>
                            </s:if>
                        </div>
                        <div class="comment-item-right">
                            <div class="pull-left">
                                <p>评论昵称：<a href="#"><s:property value="account" /></a></p>
                            </div>
                            <div class="pull-right">
                                <i class="fa fa-clock-o" aria-hidden="true"></i>评论时间 : <span><s:property value="time" /></span>
                            </div>
                            <div class="des-l">
                                <p>评论内容：<s:property value="content" /></p>
                            </div>
                        </div>
                    </div>
                </s:if>
            </s:iterator>
        </div>
        <div class="comment-respond-box">
            <h3>写下评论</h3>
            <div class="comment-respond-form">
                <s:form id="commentrespondform" class="comment-form-respond row" method="post" action="Review">
                    <div class="col-lg-6 col-md-6 col-sm-6">
                        <div class="form-group">
                            <s:hidden name="example.exampleId" value="%{#request.example.exampleId}" />
                            <s:hidden name="photographer.photographerId" value="%{#request.photographer.photographerId}" />
                            <s:hidden name="examplepanorama.photographerId" value="%{#request.photographer.photographerId}" />
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-6">
                        <div class="form-group">
                            <s:textarea name="comments.content" cols="25" rows="5" class="form-control" id="textarea_com"/>
                        </div>
                    </div>
                    <div class="col-lg-12 col-md-12 col-sm-12">
                        <s:submit value="评论" onclick="return review()" class="btn btn-submit"/>
                    </div>
                </s:form>
            </div>
        </div>
    </div>
</div>
<!-- End Reservation -->

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