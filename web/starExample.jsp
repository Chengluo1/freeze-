<%--
  Created by IntelliJ IDEA.
  User: 十田田
  Date: 2020/12/29
  Time: 20:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
    <title>我收藏的案例</title>
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
                <a class="navbar-brand" href="#">我的账号</a>
            </nav>
            <div class="container-fluid">
                <h1 class="h3 mb-3 text-gray-800">收藏案例</h1>
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-primary">收藏案例列表</h6>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table
                                    class="table table-sm table-hover table-align-middle"
                                    id="studentInfo"
                            >
                                <thead>
                                <tr>
                                    <th>案例编号</th>
                                    <th>案例封面</th>
                                    <th>案例名称</th>
                                    <th>操作</th>
                                </tr>
                                </thead>
                                    <s:iterator value="#session.employer.examples_star">
                                        <tr>
                                            <td>
                                                <h4>
                                                    <b><a href="putExample.action?example.exampleId=<s:property value='exampleId'/>"><s:property value='exampleId'/></a></b>
                                                </h4>
                                            </td>
                                            <td>
                                                <h4>
                                                    <b><s:iterator value="pictures" status="st">
                                                        <s:if test="%{#st.first==true}">
                                                            <img src=<s:property value="picture1"/>  width="300px"/>
                                                        </s:if>
                                                    </s:iterator></b>
                                                </h4>
                                            </td>
                                            <td>
                                                <h4>
                                                    <b><s:property value="name" /></b>
                                                </h4>
                                            </td>
                                            <td>
                                                <h4>
                                                    <b><a href="./unstarInList.action?exampleId=<s:property value='exampleId'/>"><button type="button">取消收藏</button></a></b>
                                                </h4>
                                            </td>
                                        </tr>
                                    </s:iterator>
                            </table>
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
