<%--
  Created by IntelliJ IDEA.
  User: Catherine小天使
  Date: 2020/12/28
  Time: 14:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <title>上传案例</title>
    <!-- custom-theme -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="Upholstery Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template,
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
    function hideURLbar(){ window.scrollTo(0,1); } </script>
    <!-- //custom-theme -->
    <!-- js -->
    <script type="text/javascript" src="js/jquery-2.1.4.min.js"/>

    <!-- //js -->
    <script type="text/javascript">
        //校验
        function check() {
            var fileType = $("#UploadCase_upload").val();
            var fileType2 = $("#UploadCase_upload2").val();

            if (fileType == null || fileType == "")
            {
                alert("请至少上传一张封面！");
                return false;
            }
            if (fileType2 == null || fileType2 == "")
            {
                alert("请至少上传一张展示图片！");
                return false;
            }
            //判断后缀是不是需要的文件类型
            if ((fileType2 != null && fileType2 != "")&& (fileType != null && fileType != "")) {
                var start2 = fileType2.lastIndexOf(".") + 1;
                var start = fileType.lastIndexOf(".") + 1;
                var length2 = fileType2.length;
                var length = fileType.length;
                var finalType2 = fileType2.substring(start2, length2);
                var finalType = fileType.substring(start, length);
                if (finalType != "jpg" || finalType2 != "jpg") {
                    alert("抱歉，当前只支持.jpg格式的图片！");
                    location.reload();
                    return false;
                }
                else {
                    return true;
                }
            }
        }
    </script>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <!-- Mobile Metas -->
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Site Metas -->
    <title></title>
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
                <h1>上传案例</h1>
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
                    <h2>上传案例</h2>
                    <p>在此填写表单来完成上传案例</p>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <span><s:fielderror/></span>
                <s:form action="uploadCase" method="post"
                        enctype="multipart/form-data" theme="simple"
                        onsubmit="return check()">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <div>
                                    <p>案例名称</p><s:textfield name="example.name" class="form-control"/>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <div>
                                    <p>案例描述</p><s:textfield name="example.description" class="form-control"/>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <div>
                                    <p>拍摄风格 </p><s:textfield name="example.style" class="form-control"/>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <div>
                                    <p>拍摄场地</p><s:textfield name="example.area" class="form-control"/>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <div id="mybutton2">
                                    <a href="javascript:;" class="file">上传封面
                                        <s:file id="UploadCase_upload" name="upload" onchange="getPhoto2()" class="form-control"/>
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div></div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <div id="mybutton">
                                    <a href="javascript:;" class="file">上传展示图片
                                        <input type="file" id="UploadCase_upload2" name="upload2" onchange="getPhoto()" multiple class="form-control">
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div></div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <div class="submit-button text-center">
                                    <div>
                                        <s:submit value="立即上传" class="btn btn-common"/>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </s:form>

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
    $('.map-full').mapify({
        points: [
            {
                lat: 40.7143528,
                lng: -74.0059731,
                marker: true,
                title: 'Marker title',
                infoWindow: 'Live Dinner Restaurant'
            }
        ]
    });
</script>
</body>
</html>
