<%--
  Created by IntelliJ IDEA.
  User: Eileen
  Date: 2020/12/27
  Time: 15:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sx" uri="/struts-dojo-tags" %>
<%@ page import="cn.edu.zjut.po.Photographer" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>案例推优</title>
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
                        <span>案例管理&推优</span>
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
        <dl>
            <div class="nav-item ">
                <dd>
                    <a class="nav-link collapsed" href="./showPho">
                        <i class="fas fa-fw fa-list"></i>
                        <span>摄影师账号管理</span>
                    </a>
                </dd>
            </div>
            <!-- Nav Item - Pages Collapse Menu -->
            <div class="nav-item">
                <dd>
                    <a class="nav-link collapsed" href="./showEmp">
                        <i class="fas fa-fw fa-list 1"></i>
                        <span>用户账号管理</span>
                    </a>
                </dd>
            </div>
        </dl>
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
                <a class="navbar-brand" href="#">案例推优</a>
            </nav>
            <!-- End of Topbar -->

            <!-- Begin Page Content -->
            <div class="container-fluid">
                <h1 class="h3 mb-3 text-gray-800">案例列表</h1>
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-primary">案例推优情况列表</h6>
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
                                    <th>案例名</th>
                                    <th>摄影师编号</th>
                                    <th>案例详情</th>
                                    <th>评论管理</th>
                                    <th>推优管理</th>
                                </tr>
                                </thead>
                                <s:if test="#session.Photographerss.size()!=0">
                                    <s:iterator value="#session.Photographerss" var="photographer">
                                        <s:iterator value="#photographer.examples_own" var="exa">
                                            <s:if test="#exa.status!=null && (#exa.status.intValue()==1 || #exa.status.intValue()==2 )">
                                                <tr>
                                                    <td>
                                                        <h4>
                                                            <b><s:property value="exampleId"/></b>
                                                        </h4>
                                                    </td>
                                                    <td>
                                                        <h4>
                                                            <b><s:property value="name"/></b>
                                                        </h4>
                                                    </td>
                                                    <td>
                                                        <h4>
                                                            <b><s:property value="photographerId"/></b>
                                                        </h4>
                                                    </td>
                                                    <td><a href="putExample.action?example.exampleId=<s:property value='exampleId'/>">查看案例详情</a></td>
                                                    <td><a href="showComments.action?exampleID=<s:property value='exampleId'/>">管理案例评论</a></td>

                                                    <td>
                                                        <s:if test="status.intValue()==1">
                                                        <div><a href="recommendE.action?exampleID=<s:property value='exampleId'/>"><font color="red">立即推优</font></a></div>
                                                        </s:if>
                                                        <s:elseif test="status.intValue()==2">
                                                            <div>
                                                                <font color="red">已推优</font>
                                                            </div>
                                                        </s:elseif>
                                                    </td>
                                                </tr>
                                            </s:if>
                                        </s:iterator>
                                    </s:iterator>
                                </s:if>
                                <s:else>
                                    <tr>
                                        <td><a data-toggle="modal" data-target="#lessonDetailModal" style="cursor: pointer"><h1>当前没有推优预约哦</h1></a></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                </s:else>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <a data-toggle="modal" data-target="#myModal" style="cursor: pointer">
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
<script type="text/javascript">
    var msg=""+'${request.tipMessage}';
    if(msg!=""){
        alert(msg);
    }
</script>