<%--
  Created by IntelliJ IDEA.
  User: Eileen
  Date: 2020/12/20
  Time: 15:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>
<html lang="en"><!-- Basic -->
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">

  <!-- Mobile Metas -->
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <!-- Site Metas -->
  <title>首页</title>
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

<!-- Start slides -->
<div id="slides" class="cover-slides">
  <ul class="slides-container">
    <li class="text-left">
      <img src="images/slider-01.jpg" alt="">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <h1 class="m-b-20"><strong>欢迎来到 <br>定格————摄影师约拍平台</strong></h1>
            <p class="m-b-40">请欣赏我们的约拍精美案例，  <br>
              即刻起开始定制属于你的个人美图吧.</p>

          </div>
        </div>
      </div>
    </li>
    <li class="text-left">
      <img src="images/slider-02.jpg" alt="">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <<h1 class="m-b-20"><strong>欢迎来到 <br>定格————摄影师约拍平台</strong></h1>
            <p class="m-b-40">请欣赏我们的约拍精美案例，  <br>
              即刻起开始定制属于你的个人美图吧.</p>

          </div>
        </div>
      </div>
    </li>
    <li class="text-left">
      <img src="images/slider-03.jpg" alt="">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <h1 class="m-b-20"><strong>欢迎来到 <br>定格————摄影师约拍平台</strong></h1>
            <p class="m-b-40">请欣赏我们的约拍精美案例，  <br>
              即刻起开始定制属于你的个人美图吧.</p>

          </div>
        </div>
      </div>
    </li>
  </ul>
  <div class="slides-navigation">
    <a href="#" class="next"><i class="fa fa-angle-right" aria-hidden="true"></i></a>
    <a href="#" class="prev"><i class="fa fa-angle-left" aria-hidden="true"></i></a>
  </div>
</div>
<!-- End slides -->

<!-- Start About -->
<div class="about-section-box">
  <div class="container">
    <div class="row">
      <div class="col-lg-6 col-md-6 col-sm-12 text-center">
        <div class="inner-column">
          <h1>欢迎访问<span>定格————摄影师约拍平台</span></h1>

          <p>约拍，已经成为年轻人之间的一种时尚。而XX服务平台会提供最优质的约拍服务。手艺不错，人格担保，地点你定，风格你定，时间你定。 </p>
          <p>总有一天，我们都会变成他人的回忆，尽力让它美好吧。</p>
        </div>
      </div>
      <div class="col-lg-6 col-md-6 col-sm-12">
        <img src="images/about-img.jpg" alt="" class="img-fluid">
      </div>
    </div>
  </div>
</div>
<!-- End About -->

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

<div class="reservation-box">
  <div class="container">
    <s:if test="%{#session.photographer!=null}">
      <div class="col-lg-12">
        <div class="heading-title text-center">
        <div class="our-team">
          <div class="pic">
            <a class="btn btn-lg btn-circle btn-outline-new-white" href="findneeds">接受项目
            <!--  <input class="button button_border" type="button" value="接受项目" style="margin-top: 4px;"/> -->
            </a>
            <a class="btn btn-lg btn-circle btn-outline-new-white" href="uploadCase.jsp">上传案例
            <!--  <input class="button button_shadow" type="button" value="上传案例" style="margin-top: 4px;"/> -->
            </a>
          </div>
        </div>
      </div>
    </div>
    </s:if>
    <s:else>
        <s:if test="%{#session.employer!=null}">
          <div class="col-lg-12">
            <div class="heading-title text-center">
              <div class="our-team">
                <div class="pic">
                  <a class="btn btn-lg btn-circle btn-outline-new-white" href="needs.jsp">发布需求
                  <!--  <input class="button button_border" type="button" value="发布需求" style="margin-top: 4px;"/> -->
                  </a>
                  <a class="btn btn-lg btn-circle btn-outline-new-white" href="findAllExample">浏览案例
                <!--    <input class="button button_shadow" type="button" value="浏览案例" style="margin-top: 4px;"/> -->
                  </a>
                </div>
              </div>
            </div>
          </div>
        </s:if>
    </s:else>
  </div>
</div>
<!-- End Stuff -->

<!-- Start Gallery -->
<div class="gallery-box">
  <div class="container">
    <div class="row">
      <div class="col-lg-12">
        <div class="heading-title text-center">
          <h2>精美样例</h2>
          <p>在此，欣赏我们摄影师定格的美图与回忆。</p>
        </div>
      </div>
    </div>
    <div class="tz-gallery">
      <div class="row">
        <div class="col-sm-12 col-md-4 col-lg-4">
          <a class="lightbox" href="images/gallery-img-01.jpg">
            <img class="img-fluid" src="images/gallery-img-01.jpg" alt="Gallery Images">
          </a>
        </div>
        <div class="col-sm-6 col-md-4 col-lg-4">
          <a class="lightbox" href="images/gallery-img-02.jpg">
            <img class="img-fluid" src="images/gallery-img-02.jpg" alt="Gallery Images">
          </a>
        </div>
        <div class="col-sm-6 col-md-4 col-lg-4">
          <a class="lightbox" href="images/gallery-img-03.jpg">
            <img class="img-fluid" src="images/gallery-img-03.jpg" alt="Gallery Images">
          </a>
        </div>
        <div class="col-sm-12 col-md-4 col-lg-4">
          <a class="lightbox" href="images/gallery-img-04.jpg">
            <img class="img-fluid" src="images/gallery-img-04.jpg" alt="Gallery Images">
          </a>
        </div>
        <div class="col-sm-6 col-md-4 col-lg-4">
          <a class="lightbox" href="images/gallery-img-05.jpg">
            <img class="img-fluid" src="images/gallery-img-05.jpg" alt="Gallery Images">
          </a>
        </div>
        <div class="col-sm-6 col-md-4 col-lg-4">
          <a class="lightbox" href="images/gallery-img-06.jpg">
            <img class="img-fluid" src="images/gallery-img-06.jpg" alt="Gallery Images">
          </a>
        </div>
      </div>
    </div>
  </div>
</div>
<!-- End Gallery -->

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