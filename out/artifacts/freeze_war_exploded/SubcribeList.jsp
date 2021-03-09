<%--
  Created by IntelliJ IDEA.
  User: Catherine小天使
  Date: 2020/12/28
  Time: 20:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>
<html>
<head>
    <title>我的历史订单</title>
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
                <a class="navbar-brand" href="#">交易管理</a>
            </nav>
            <div class="container-fluid">
                <h1 class="h3 mb-3 text-gray-800">我的预约</h1>
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-primary">预约列表</h6>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table
                                    class="table table-sm table-hover table-align-middle"
                                    id="studentInfo"
                            >
                                <s:if test="%{#session.photographer!=null}">
                                    <thead>
                                    <tr>
                                        <th>预约项目名称</th>
                                        <th>预约者姓名</th>
                                        <th>预约状态</th>
                                        <th>预约时间</th>
                                        <th>操作</th>
                                    </tr>
                                    </thead>
                                    <s:iterator value="#session.photographer.subscribe">
                                        <tr>
                                            <td>
                                                <h4>
                                                    <b><s:property value="title"/></b>
                                                </h4>
                                            </td>
                                            <td>
                                                <h4>
                                                    <b><s:property value="subscriber.name"/></b>
                                                </h4>
                                            </td>
                                            <td>
                                                <h4>
                                                    <b><s:if test="status == 1">待确认</s:if>
                                                        <s:elseif test="status == 2">已接受</s:elseif>
                                                        <s:elseif test="status == 4">已取消</s:elseif>
                                                        <s:else>已拒绝</s:else></b>
                                                </h4>
                                            </td>
                                            <td>
                                                <h4>
                                                    <b><s:date name="time" format="yyyy-MM-dd HH:mm:ss"/></b>
                                                </h4>
                                            </td>
                                            <td>
                                                <h4>
                                                    <b><a href="putSubscribe.action?subscribe.subscribeID=<s:property value='subscribeID'/>"  target="_blank">查看详情</a></b>
                                                </h4>
                                            </td>
                                        </tr>
                                    </s:iterator>
                                </s:if>
                                <s:else>
                                    <thead>
                                    <tr>
                                        <th>预约项目名称</th>
                                        <th>摄影师姓名</th>
                                        <th>预约状态</th>
                                        <th>预约时间</th>
                                        <th>操作</th>
                                    </tr>
                                    </thead>
                                    <s:iterator value="#session.employer.subscribe">
                                        <tr>
                                            <td>
                                                <h4>
                                                    <b><s:property value="title"/></b>
                                                </h4>
                                            </td>
                                            <td>
                                                <h4>
                                                    <b><s:property value="scriber.name"/></b>
                                                </h4>
                                            </td>
                                            <td>
                                                <h4>
                                                    <b><s:if test="status == 1">待确认</s:if>
                                                        <s:elseif test="status == 2">已接受</s:elseif>
                                                        <s:elseif test="status == 4">已取消</s:elseif>
                                                        <s:else>已拒绝</s:else></b>
                                                </h4>
                                            </td>
                                            <td>
                                                <h4>
                                                    <b><s:date name="time" format="yyyy-MM-dd HH:mm:ss"/></b>
                                                </h4>
                                            </td>
                                            <td>
                                                <h4>
                                                    <b><a href="putSubscribe.action?subscribe.subscribeID=<s:property value='subscribeID'/>"  target="_blank" class="layui-btn layui-btn-mini layui-btn-normal">查看详情</a></b>
                                                </h4>
                                            </td>
                                        </tr>
                                    </s:iterator>
                                </s:else>
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
