<%--
  Created by IntelliJ IDEA.
  User: Catherine小天使
  Date: 2020/12/27
  Time: 23:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>
<html>
<head>
    <title>个人资料</title>
    <script type="text/javascript" src="js/jquery-1.11.0.min.js"></script>
    <script type="text/javascript">
        $(function(){
            $("#inFile").on("change",function () {
                var $file = $(this);
                var fileObj = $file[0];
                var windowURL = window.URL || window.webkitURL;
                var dataURL;
                var $img = $("img");
                if (fileObj && fileObj.files && fileObj.files[0]) {
                    dataURL = windowURL.createObjectURL(fileObj.files[0]);
                    $img.attr('src', dataURL);
                } else {
                    dataURL = $file.val();
                    var imgObj = document.getElementById("preview");
                    imgObj.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)";
                    alert(dataURL);
                    imgObj.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = dataURL;
                }
            });
        });
    </script>
    <!-- Bootstrap -->
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link href="css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link href="css/fontawesome-all.min.css" rel="stylesheet" type="text/css" />
    <link
            href="css/dataTables.bootstrap4.min.css"
            rel="stylesheet"
            type="text/css"
    />
    <link href="css/sb-admin-2.min.css" rel="stylesheet" />

    <link href="css/docs.css" rel="stylesheet">
    <link href="css/prettify.css" rel="stylesheet">
    <link href="css/bootstrap-responsive.min.css" rel="stylesheet">
    <link href="css/bootstrap2.min.css" rel="stylesheet">

    <link href="https://v2.bootcss.com/assets/css/docs.css" rel="stylesheet">
    <link href="https://v2.bootcss.com/assets/js/google-code-prettify/prettify.css" rel="stylesheet">
    <link href="https://cdn.bootcss.com/bootstrap/2.3.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.bootcss.com/bootstrap/2.3.2/css/bootstrap-responsive.min.css" rel="stylesheet">
</head>
<body id="page-top">

<div id="wrapper">
    <!-- Sidebar -->
    <div
            class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
            id="accordionSidebar"
    >
        <!-- Sidebar - Brand -->
        <s:if test="%{#session.photographer!=null}">
            <a
                    href="index.html"
                    class="sidebar-brand d-flex align-items-center justify-content-center"
            >
                <div class="sidebar-brand-icon">
                    <i class="fas fa-book"></i>
                </div>
                <div class="sidebar-brand-text mx-3">摄影师个人中心</div>
            </a>
            <!-- Divider -->
            <hr class="sidebar-divider" />
            <!-- Heading -->
            <div class="sidebar-heading">
                基础操作
            </div>
            <!-- Nav Item - Pages Collapse Menu -->
            <dl>
                <div class="nav-item ">
                    <dd>
                        <a class="nav-link collapsed" href="index.jsp">
                            <i class="fas fa-fw fa-list"></i>
                            <span>首页</span>
                        </a>
                    </dd>
                </div>
                <!-- Nav Item - Pages Collapse Menu -->
                <div class="nav-item">
                    <dd>
                        <a class="nav-link collapsed" href="logout.action">
                            <i class="fas fa-fw fa-list 1"></i>
                            <span>退出</span>
                        </a>
                    </dd>
                </div>
            </dl>
            <!-- Divider -->
            <hr class="sidebar-divider" />
            <!-- Heading -->
            <div class="sidebar-heading">
                我的账号
            </div>
            <dl>
                <div class="nav-item ">
                    <dd>
                        <a class="nav-link collapsed" href="Ppersonal.jsp">
                            <i class="fas fa-fw fa-list"></i>
                            <span>个人资料</span>
                        </a>
                    </dd>
                </div>
                <!-- Nav Item - Pages Collapse Menu -->
                <div class="nav-item">
                    <dd>
                        <a class="nav-link collapsed" href="Pcertificate.jsp">
                            <i class="fas fa-fw fa-list 1"></i>
                            <span>摄影师认证</span>
                        </a>
                    </dd>
                </div>
            </dl>
            <!-- Divider -->
            <hr class="sidebar-divider" />
            <!-- Heading -->
            <div class="sidebar-heading">
                申请推优
            </div>
            <dl>
                <div class="nav-item ">
                    <dd>
                        <a class="nav-link collapsed" href="recommend.jsp">
                            <i class="fas fa-fw fa-list"></i>
                            <span>摄影师推优</span>
                        </a>
                    </dd>
                </div>
                <!-- Nav Item - Pages Collapse Menu -->
                <div class="nav-item">
                    <dd>
                        <a class="nav-link collapsed" href="Erecommend.jsp">
                            <i class="fas fa-fw fa-list 1"></i>
                            <span>案例推优</span>
                        </a>
                    </dd>
                </div>
            </dl>
            <!-- Divider -->
            <hr class="sidebar-divider" />
            <!-- Heading -->
            <div class="sidebar-heading">
                交易管理
            </div>
            <dl>
                <div class="nav-item ">
                    <dd>
                        <a class="nav-link collapsed" href="SubcribeList.jsp">
                            <i class="fas fa-fw fa-list"></i>
                            <span>我收到的预约</span>
                        </a>
                    </dd>
                </div>
                <!-- Nav Item - Pages Collapse Menu -->
                <div class="nav-item">
                    <dd>
                        <a class="nav-link collapsed" href="OrderrList.jsp">
                            <i class="fas fa-fw fa-list 1"></i>
                            <span>我的签单项目</span>
                        </a>
                    </dd>
                </div>
            </dl>
        </s:if>
        <s:elseif test="%{#session.employer!=null}">
            <a
                    href="index.html"
                    class="sidebar-brand d-flex align-items-center justify-content-center"
            >
                <div class="sidebar-brand-icon">
                    <i class="fas fa-book"></i>
                </div>
                <div class="sidebar-brand-text mx-3">用户个人中心</div>
            </a>
            <!-- Divider -->
            <hr class="sidebar-divider" />
            <!-- Heading -->
            <div class="sidebar-heading">
                基础操作
            </div>
            <!-- Nav Item - Pages Collapse Menu -->
            <dl>
                <div class="nav-item ">
                    <dd>
                        <a class="nav-link collapsed" href="index.jsp">
                            <i class="fas fa-fw fa-list"></i>
                            <span>首页</span>
                        </a>
                    </dd>
                </div>
                <!-- Nav Item - Pages Collapse Menu -->
                <div class="nav-item">
                    <dd>
                        <a class="nav-link collapsed" href="logout.action">
                            <i class="fas fa-fw fa-list 1"></i>
                            <span>退出</span>
                        </a>
                    </dd>
                </div>
            </dl>
            <!-- Divider -->
            <hr class="sidebar-divider" />
            <!-- Heading -->
            <div class="sidebar-heading">
                我的账号
            </div>
            <dl>
                <div class="nav-item ">
                    <dd>
                        <a class="nav-link collapsed" href="Ppersonal.jsp">
                            <i class="fas fa-fw fa-list"></i>
                            <span>个人资料</span>
                        </a>
                    </dd>
                </div>
                <!-- Nav Item - Pages Collapse Menu -->
                <div class="nav-item">
                    <dd>
                        <a class="nav-link collapsed" href="starExample.jsp">
                            <i class="fas fa-fw fa-list 1"></i>
                            <span>收藏案例</span>
                        </a>
                    </dd>
                </div>
            </dl>
            <!-- Divider -->
            <hr class="sidebar-divider" />
            <!-- Heading -->
            <div class="sidebar-heading">
                交易管理
            </div>
            <dl>
                <div class="nav-item ">
                    <dd>
                        <a class="nav-link collapsed" href="MyNeedsList.jsp">
                            <i class="fas fa-fw fa-list"></i>
                            <span>我发布的需求</span>
                        </a>
                    </dd>
                </div>
                <!-- Nav Item - Pages Collapse Menu -->
                <div class="nav-item">
                    <dd>
                        <a class="nav-link collapsed" href="SubcribeList.jsp">
                            <i class="fas fa-fw fa-list 1"></i>
                            <span>我申请的预约</span>
                        </a>
                    </dd>
                </div>
                <div class="nav-item">
                    <dd>
                        <a class="nav-link collapsed" href="OrderrList.jsp">
                            <i class="fas fa-fw fa-list 1"></i>
                            <span>我的签单项目</span>
                        </a>
                    </dd>
                </div>
            </dl>
        </s:elseif>
        <!-- Divider -->
        <hr class="sidebar-divider d-none d-md-block" />
        <!-- Sidebar Toggler (Sidebar) -->
        <div class="text-center d-none d-md-inline">
            <button class="rounded-circle border-0" id="sidebarToggle"></button>
        </div>
    </div>
    <!-- End of Sidebar -->
    <!-- Button to trigger modal -->

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">
        <!-- Main Content -->
        <div id="content">
            <!-- Topbar -->
            <nav
                    class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow"
            >
                <!-- Sidebar Toggle (Topbar) -->
                <button
                        id="sidebarToggleTop"
                        class="btn btn-link d-md-none rounded-circle mr-3"
                >
                    <i class="fa fa-bars"></i>
                </button>
                <a class="navbar-brand" href="#">个人页面</a>
            </nav>

            <div class="container-fluid">
                <h1 class="h3 mb-3 text-gray-800">个人信息修改</h1>
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-primary">认证表单</h6>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <s:if test="%{#session.photographer!=null}">
                                <form action="update" method="post" enctype="multipart/form-data" onSubmit="return check()">
                                    <div>
                                        <label>身份类型：</label>
                                        <div>
                                            <input type="text" name="identype"  autocomplete="off" value="摄影师" disabled="disabled">
                                        </div>
                                    </div>
                                    <div>
                                        <label>用户名：</label>
                                        <div>
                                            <input type="text" name="photographer.account" id="photographer.account" value="${session.photographer.account}" autocomplete="off" >
                                        </div>
                                    </div>
                                    <div>
                                        <label>密码：</label>
                                        <div>
                                            <input type="password" name="photographer.password" id="password" value="${session.photographer.password}" autocomplete="off">
                                        </div>
                                    </div>
                                    <div>
                                        <label>确认密码：</label>
                                        <div>
                                            <input type="password" name="repassword" id="repassword" value="${session.photographer.password}" autocomplete="off">
                                        </div>
                                    </div>
                                    <div>
                                        <label>修改头像：</label>
                                        <div>
                                            <input type="hidden" name="photographer.profilePhoto" value="${session.photographer.profilePhoto}" autocomplete="off">
                                            <input id="inFile"  name="profile" type="file">
                                            <br>
                                            <img src="photographer/photographer/profilephoto/${session.photographer.profilePhoto}" style="width: 100px;height: 100px">
                                        </div>
                                    </div>
                                    <div>
                                        <label>真实姓名：</label>
                                        <div>
                                            <input type="text" name="photographer.name"  autocomplete="off"  value="${session.photographer.name}" placeholder="在此输入你的真实姓名哟">
                                        </div>
                                    </div>
                                    <div>
                                        <label>身份证号：</label>
                                        <div>
                                            <input type="text" name="photographer.IDNumber"  autocomplete="off"  value="${session.photographer.IDNumber}" placeholder="在此输入你的身份证号哟">
                                        </div>
                                    </div>
                                    <div>
                                        <label>性别：</label>
                                        <div class="row">
                                            <s:if test="%{#session.photographer.sex==0}">
                                                <input type="radio" name="photographer.sex" value="0" title="男" checked=""><div ><span>男</span></div>
                                                <input type="radio" name="photographer.sex" value="1" title="女"><div ><span>女</span></div>
                                            </s:if>
                                            <s:else>
                                                <input type="radio" name="photographer.sex" value="0" title="男"><div ><span>男</span></div>
                                                <input type="radio" name="photographer.sex" value="1" title="女" checked=""><div ><span>女</span></div>
                                            </s:else>
                                        </div>
                                    </div>
                                    <div>
                                        <label>所在地：</label>
                                        <div>
                                            <input type="text" name="photographer.region"  autocomplete="off"  value="${session.photographer.region}" placeholder="在此输入你的地址哟">
                                        </div>
                                    </div>
                                    <div>
                                        <label>手机号码：</label>
                                        <div>
                                            <input type="text" name="photographer.phone"  autocomplete="off"  value="${session.photographer.phone}" placeholder="在此输入你的手机号哟">
                                        </div>
                                    </div>
                                    <div>
                                        <label>邮箱：</label>
                                        <div>
                                            <input type="text" name="photographer.email"  autocomplete="off"  value="${session.photographer.email}" placeholder="在此输入你的邮箱哟">
                                        </div>
                                    </div>
                                    <div>
                                        <label>QQ：</label>
                                        <div>
                                            <input type="text" name="photographer.qq"  autocomplete="off"  value="${session.photographer.qq}" placeholder="在此输入你的qq号哟">
                                        </div>
                                    </div>
                                    <div>
                                        <label>微信：</label>
                                        <div>
                                            <input type="text" name="photographer.wechat"  autocomplete="off" value="${session.photographer.wechat}" placeholder="在此输入你的微信号哟">
                                        </div>
                                    </div>
                                    <div>
                                        <label>个人简介：</label>
                                        <div>
                                            <textarea name="photographer.introduction" placeholder="这个人很懒，什么都没有写呢" >${session.photographer.introduction}</textarea>
                                        </div>
                                    </div>
                                    <div>
                                        <div>
                                            <button  lay-submit="" lay-filter="demo1">保存修改</button>
                                        </div>
                                    </div>
                                    <div>
                                        <input type="hidden" name="photographer.photographerId" value="${session.photographer.photographerId}">
                                        <input type="hidden" name="photographer.score" value="${session.photographer.score}">
                                        <input type="hidden" name="photographer.fans" value="${session.photographer.fans}">
                                        <input type="hidden" name="photographer.praise" value="${session.photographer.praise}">
                                        <input type="hidden" name="photographer.profound" value="${session.photographer.profound}">
                                        <input type="hidden" name="photographer.prize" value="${session.photographer.prize}">
                                        <input type="hidden" name="photographer.status" value="${session.photographer.status}">
                                        <input type="hidden" name="photographer.certificate" value="${session.photographer.certificate}">
                                        <input type="hidden" name="photographer.message" value="${session.photographer.message}">
                                        <input type="hidden" name="photographer.status1" value="${session.photographer.status1}">
                                        <input type="hidden" name="photographer.money1" value="${session.photographer.money1}">
                                    </div>
                                </form>
                            </s:if>
                            <s:else>
                                <form action="update3" method="post" enctype="multipart/form-data" onSubmit="return check()">
                                    <div>
                                        <label>身份类型：</label>
                                        <div>
                                            <input type="text" name="identype"  autocomplete="off"  value="用户" disabled="disabled">
                                        </div>
                                    </div>

                                    <div>
                                        <label>用户名：</label>
                                        <div>
                                            <input type="text" name="employer.account"  value="${session.employer.account}" autocomplete="off"  >
                                        </div>
                                    </div>

                                    <div>
                                        <label>密码：</label>
                                        <div>
                                            <input type="password" name="employer.password"  value="${session.employer.password}" autocomplete="off" >
                                        </div>
                                    </div>
                                    <div>
                                        <label>确认密码：</label>
                                        <div>
                                            <input type="password" name="repassword"  value="${session.employer.password}" autocomplete="off" >
                                        </div>
                                    </div>
                                    <div>
                                        <label>修改头像：</label>
                                        <div>
                                            <input type="hidden" name="employer.profilePhoto" value="${session.employer.profilePhoto}" autocomplete="off" >
                                            <img src="photographer/employer/profilephoto/${session.employer.profilePhoto}" style="width: 200px;height: 200px"/>
                                            <input type="file" name="uprofile"/>
                                        </div>
                                    </div>
                                    <div>
                                        <label>真实姓名：</label>
                                        <div>
                                            <input type="text" name="employer.name"  autocomplete="off" value="${session.employer.name}" placeholder="在此输入你的真实姓名哟">
                                        </div>
                                    </div>
                                    <div>
                                        <label>身份证号：</label>
                                        <div>
                                            <input type="text" name="employer.IDNumber"  autocomplete="off" value="${session.employer.IDNumber}" placeholder="在此输入你的身份证号哟">
                                        </div>
                                    </div>
                                    <div>
                                        <label>性别：</label>
                                        <div class="row">
                                            <s:if test="%{#session.employer.sex==0}">
                                                <input type="radio" name="employer.sex" value="男" title="男" checked=""><div ><span>男</span></div>
                                                <input type="radio" name="employer.sex" value="女" title="女"><div ><span>女</span></div>
                                            </s:if>
                                            <s:else>
                                                <input type="radio" name="employer.sex" value="0" title="男"><div><span>男</span></div>
                                                <input type="radio" name="employer.sex" value="1" title="女" checked=""><div><span>女</span></div>
                                            </s:else>
                                        </div>
                                    </div>
                                    <div>
                                        <label>所在地：</label>
                                        <div>
                                            <input type="text" name="employer.region"  autocomplete="off" value="${session.employer.region}" placeholder="在此输入你的地址哟">
                                        </div>
                                    </div>
                                    <div>
                                        <label>手机号码：</label>
                                        <div>
                                            <input type="text" name="employer.phone"  autocomplete="off" value="${session.employer.phone}" placeholder="在此输入你的手机号哟">
                                        </div>
                                    </div>
                                    <div>
                                        <label>邮箱：</label>
                                        <div>
                                            <input type="text" name="employer.email"  autocomplete="off" value="${session.employer.email}" placeholder="在此输入你的邮箱哟">
                                        </div>
                                    </div>
                                    <div>
                                        <label>QQ：</label>
                                        <div>
                                            <input type="text" name="employer.qq"  autocomplete="off" value="${session.employer.qq}" placeholder="在此输入你的qq号哟">
                                        </div>
                                    </div>
                                    <div>
                                        <label>微信：</label>
                                        <div>
                                            <input type="text" name="employer.wechat"  autocomplete="off"  value="${session.employer.wechat}" placeholder="在此输入你的微信号哟">
                                        </div>
                                    </div>
                                    <div>
                                        <div>
                                            <button lay-submit="" lay-filter="demo1">保存修改</button>
                                        </div>
                                    </div>
                                    <div>
                                        <input type="hidden" name="employer.employerId" value="${session.employer.employerId}">
                                        <input type="hidden" name="employer.hmpgbkg" value="${session.employer.hmpgbkg}">
                                    </div>
                                </form>
                            </s:else>
                        </div>
                    </div>
                </div>
            </div>
            <a data-toggle="modal" data-target="#myModal" style="cursor: pointer"></a>

            <!-- End of Topbar -->
        </div>
        <!-- End of Main Content -->
        <!--////footer////////////////////////////////////////////////////////////////-->
        <footer class="sticky-footer bg-white">
            <div class="container my-auto">
                <div class="copyright text-center my-auto">
                    <span>Copyright &copy;2020</span>
                </div>
            </div>
        </footer>
        <!--/////////////////////////////////////////////////////////////////////////////////-->
    </div>
    <!-- End of Content Wrapper -->
</div>

<a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
</a>



<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>
<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>

<script src="js/jquery.easing.min.js"></script>
<script src="js/sb-admin-2.min.js"></script>
<script src="js/jquery.dataTables.min.js"></script>
<script src="js/dataTables.bootstrap4.min.js"></script>
<script src="js/datatables.js"></script>
<script src="js/myJSL.js"></script>
<script src="js/holder.min.js"></script>
<script src="js/student-add.js"></script>
<script src="js/bootstrap2.min.js"></script>
</body>
</html>
