<%--
  Created by IntelliJ IDEA.
  User: Eileen
  Date: 2020/12/27
  Time: 11:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sx" uri="/struts-dojo-tags" %>
<%@ taglib prefix="S" uri="/struts-tags" %>
<%@ page import="cn.edu.zjut.po.Photographer" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <title>认证</title>
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
        <a
                href="index.html"
                class="sidebar-brand d-flex align-items-center justify-content-center"
        >
            <div class="sidebar-brand-icon">
                <i class="fas fa-book"></i>
            </div>
            <div class="sidebar-brand-text mx-3">个人中心</div>
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
            推优管理
        </div>
        <!-- Nav Item - Pages Collapse Menu -->
        <dl>
            <div class="nav-item ">
                <dd>
                    <a class="nav-link collapsed" href="./show">
                        <i class="fas fa-fw fa-list"></i>
                        <span>摄影师推优</span>
                    </a>
                </dd>
            </div>
            <!-- Nav Item - Pages Collapse Menu -->
            <div class="nav-item">
                <dd>
                    <a class="nav-link collapsed" href="./show1">
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
            认证中心
        </div>
        <dl>
            <div class="nav-item ">
                <dd>
                    <a class="nav-link collapsed" href="./show2">
                        <i class="fas fa-fw fa-list"></i>
                        <span>待认证</span>
                    </a>
                </dd>
            </div>
            <!-- Nav Item - Pages Collapse Menu -->
            <div class="nav-item">
                <dd>
                    <a class="nav-link collapsed" href="./show3">
                        <i class="fas fa-fw fa-list 1"></i>
                        <span>已认证</span>
                    </a>
                </dd>
            </div>
        </dl>
        <!-- Divider -->
        <hr class="sidebar-divider" />
        <!-- Heading -->
        <div class="sidebar-heading">
            账号管理
        </div>
        <div class="nav-item ">
            <a class="nav-link collapsed" href="logout.jsp">
                <i class="fas fa-fw fa-list"></i>
                <span>账号管理</span>
            </a>
        </div>
        <!-- Divider -->
        <hr class="sidebar-divider" />
        <!-- Heading -->
        <div class="sidebar-heading">
            网站数据
        </div>
        <div class="nav-item ">
            <a class="nav-link collapsed" href="datachart.jsp">
                <i class="fas fa-fw fa-list"></i>
                <span>网站数据</span>
            </a>
        </div>
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
                <a class="navbar-brand" href="#">摄影师认证详情</a>
            </nav>
            <!-- End of Topbar -->

            <!-- Begin Page Content -->
            <div class="container-fluid">
                <h1 class="h3 mb-3 text-gray-800">认证表单及摄影师联系方式</h1>
                <div class="card shadow mb-4">

                    <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-primary">认证表单</h6>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <s:form action="authen" method="post">
                                <div>
                                    <label>姓名：</label>
                                    <div>
                                        <s:textfield name="photographer.name" value="%{#request.photographer.name}" readonly="true"/>
                                    </div>
                                </div>

                                <div>
                                    <label>身份证号码：</label>
                                    <div>
                                        <s:textfield name="photographer.IDNumber" value="%{#request.photographer.IDNumber}" readonly="true"/>
                                    </div>
                                </div>

                                <div>
                                    <label>自我介绍：</label>
                                    <div>
                                        <s:textarea name="photographer.introduction" value="%{#request.photographer.introduction}" readonly="true"/>
                                    </div>
                                </div>
                                <div>
                                    <label>证书与奖项：</label>
                                    <div>
                                        <s:textarea value="%{#request.photographer.prize}" readonly="true"/>
                                    </div>
                                </div>
                                <div>
                                    <label>摄影师资格证：</label>
                                    <div>
                                        <s:hidden name="photographer.certificate" value="%{#request.photographer.certificate}"/>
                                        <img src="photographer/photographer/certificate/<s:property value="#request.photographer.certificate"/>"
                                             heigth="130" width="130" border="0"/>
                                    </div>
                                </div>
                                <div>
                                    <label>摄影师等级：</label>
                                    <div>
                                        <s:textfield name="photographer.title" value="%{#request.photographer.title}"/>
                                    </div>
                                </div>
                                <s:if test="#request.photographer.status != '已审核'">
                                    <div>
                                        <div>
                                            <s:submit value="认证"/>
                                        </div>
                                    </div>
                                </s:if>
                        </div>
                    </div>

                    <div class="wdr_imgBox">
                        <a href="/Userbe95ba3c-7f96-42a7-8adf-a72300e67689" target="_blank">
                            <img src="/photographer/photographer/profilephoto/<s:property value="%{#request.photographer.profilePhoto}"/>"/>
                        </a>
                    </div>
                    <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-primary">部分信息以及联系方式</h6>
                    </div>

                    <div class="card-body">
                        <div class="table-responsive">
<%--                            <table--%>
<%--                                    class="table table-sm table-hover table-align-middle"--%>
<%--                                    id="studentInfo"--%>
<%--                            >--%>
                                <ul>
                                    <li>
                                            <b>编号：<s:hidden name="photographer.photographerId" value="%{#request.photographer.photographerId}"/><s:property
                                                    value="#request.photographer.photographerId"/></b>
                                    </li>
                                    <li>
                                            <b>所处地区：<s:hidden name="photographer.region"
                                                         value="%{#request.photographer.region}"/><s:property
                                                    value="#request.photographer.region"/></b>
                                    </li>
                                    <li>
                                            <b>QQ：<s:hidden name="photographer.qq" value="%{#request.photographer.qq}"/>
                                                <s:property value="#request.photographer.qq"/></b>
                                    </li>
                                    <li>
                                            <b>微信：<s:hidden name="photographer.wechat" value="%{#request.photographer.wechat}"/>
                                                <s:property value="#request.photographer.wechat"/></b>
                                    </li>
                                    <li>
                                            <b>手机：<s:hidden name="photographer.phone"
                                                         value="%{#request.photographer.phone}"/><s:property
                                                    value="#request.photographer.phone"/></b>
                                    </li>
                                    <li>
                                            <b>邮箱：<s:hidden name="photographer.email"
                                                         value="%{#request.photographer.email}"/><s:property
                                                    value="#request.photographer.email"/></b>
                                    </li>
                                </ul>
<%--                            </table>--%>
                        </div>
                    </div>
                </div>
            </div>
            </s:form>

            <a data-toggle="modal" data-target="#myModal" style="cursor: pointer"></a>
            <!-- Enf of Page Context -->
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
</div>
<a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
</a>

<script type="text/javascript">
    var msg = "" + '${request.tipMessage}';
    if (msg != "") {
        alert(msg);
    }
</script>

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