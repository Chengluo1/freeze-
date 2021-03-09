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
<input type="hidden" id="exampleId" value="${example.exampleId}"/>
<input type="hidden" id="userId" value="<s:property value="#session.id"/>"/>
<!-- Start All Pages -->
<div class="all-page-title page-breadcrumb">
	<div class="container text-center">
		<div class="row">
			<div class="col-lg-12">
				<h1>案例详情</h1><br>
				<img src="<s:property value="#request.examplePanorama.panorama1"/>"  weight="500" height="700"/>
			</div>
		</div>
	</div>
</div>




<!-- banner -->
<div class="blog-box">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="heading-title text-center">
					<h2><s:property value="#request.example.name" /></h2>
					<a href="putPhotographer.action?photographer.photographerId=<s:property value="#request.example.photographerId" />" class="right-btn-re"><i class="fa fa-reply" aria-hidden="true"></i>
						<input type="button" value="访问摄影师主页"/></a>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-xl-8 col-lg-8 col-12">
				<div class="blog-inner-details-page">
					<div class="blog-inner-box">
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
											<s:property value="#request.example.area" />

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
										</div>
									</div>
								</div>
							</div>
						</table>
					</div>
					<div class="blog-comment-box">
						<h3>评论区</h3>
						<s:iterator value="#request.displayComs" var="com" >
							<s:if test="%{#com.status!=1}">
								<s:property value="com.status"/>
								<div class="comment-item">
									<div class="comment-item-left">
										<s:if test="%{#session.employer!=null}">
											<img src="photographer/employer/profilephoto/<s:property value="profilePhoto"/>" alt="" width="40" height="40"/>
										</s:if>
										<s:if test="%{#session.photographer!=null}">
											<img src="photographer/photographer/profilephoto/<s:property value="#request.photographer.profilePhoto"/>" alt="" width="40" height="40"/>
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
<%--										<s:if test="%{#session.admin!=null }">--%>
<%--											<a href="deleteComments.action?commentsID=<s:property value='commentsID'/>&example=<s:property value='example' />"class="right-btn-re"><font--%>
<%--													color="red">Delete</font></a>--%>
<%--										</s:if>--%>
											<%--									<a href="#" class="right-btn-re"><i class="fa fa-reply" aria-hidden="true"></i> Reply</a>--%>
									</div>
								</div>
							</s:if>
							<s:else>
								123
							</s:else>
						</s:iterator>
					</div>
					<s:if test="%{#session.admin==null}">
						<div class="comment-respond-box">
							<h3>写下评论</h3>
							<div class="comment-respond-form">
								<s:form id="commentrespondform" class="comment-form-respond row" method="post"
										action="Review">
									<s:hidden name="example.exampleId" value="%{#request.example.exampleId}"/>
									<s:hidden name="photographer.photographerId"
											  value="%{#request.photographer.photographerId}"/>
									<s:hidden name="examplepanorama.panorama1"
											  value="%{#request.examplepanorama.panorama1}"/>

									<div class="col-lg-6 col-md-6 col-sm-6">
										<div class="form-group">
											<s:textarea name="comments.content" cols="25" rows="5" class="form-control"
														id="textarea_com"/>
										</div>
									</div>
									<div class="col-lg-12 col-md-12 col-sm-12">
										<s:submit value="评论" onclick="return review()" class="btn btn-submit"/>
									</div>
								</s:form>
							</div>
						</div>
					</s:if>
					<div class="pictures">
						<h3><b>案例详情图</b></h3>
						<table><tr><s:iterator value="#request.example.pictures">
							<div class="onepic">
								<td>
									<img src="<s:property value="picture1" />" style="width: 400px;height: 300px" />
								</td>
							</div>
						</s:iterator></tr></table>
					</div>
				</div>
			</div>
			<div class="col-xl-4 col-lg-4 col-md-6 col-sm-8 col-12 blog-sidebar">
				<div class="right-side-blog">
					<div>
						<img src="photographer/photographer/profilephoto/<s:property value="#request.photographer.profilePhoto"/>" alt="" width="150" height="150"/>
					</div>
					<p><br>
						摄影师：<s:property value="#request.photographer.account" />
						&nbsp;&nbsp;&nbsp;&nbsp;摄影师点赞数：<s:property value="#request.photographer.praise" />
					</p><br><br>
					<s:if test="%{#session.admin==null}">
						<h3>为案例点赞</h3>
						<div class="blog-categories">
							<div class="praise" id="praise" onclick="pr()">
								<img src="images/praise.jpg" id="praiseicon" width="25px"/>
								<p id="prnum"><s:property value="#request.example.praise"/></p>
							</div>
							<div class="star" onclick="star()">
								<s:if test="%{#session.employer!=null}">
								<s:iterator value="#session.employer.examples_star" end="exitId">
									<div>
										<s:if test="#request.example.exampleId == exampleId">
											<img src="images/star.jpg" id="staricon" width="25px"/>
											<s:set var="exitId" value="0"></s:set>
											<s:set var="flag" value="1" scope="request"></s:set>
										</s:if>
									</div>
								</s:iterator>
								<s:if test="#request.flag != 1">
									<img src="images/star1.png" id="staricon" width="25px"/>
								</s:if>
							</div>
							</s:if>
						</div>
					</s:if>
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