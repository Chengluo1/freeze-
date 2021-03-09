<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: Catherine小天使
  Date: 2020/12/26
  Time: 20:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>其他人主页</title>
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
                <a class="navbar-brand" href="#">TA的个人主页</a>
            </nav>
            <div class="container-fluid">
                <h1 class="h3 mb-3 text-gray-800"><s:property value="#request.photographer.account" /></h1>
                <div>
                    <img src="photographer/photographer/profilephoto/<s:property value='#request.photographer.profilePhoto'/>" width="150" height="100">
                </div>
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <div>
                            <s:if test="%{#request.photographer.sex==0}">
                                <img src="images/boy.png" width="30" height="30" />
                            </s:if>
                            <s:else>
                                <img src="images/girl.png" width="30" height="30" />
                            </s:else>
                        </div>
                        <h5 class="m-0 font-weight-bold text-primary">粉丝数：<s:property value="#request.photographer.fans" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <img src="images/praise.jpg" width="15" height="15" /> <s:property
                                    value="#request.photographer.praise" /></h5>
                    </div>
                    <h3>
                        &nbsp;&nbsp;&nbsp;TA的案例
                    </h3>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table
                                    class="table table-sm table-hover table-align-middle"
                            >
                                <thead>
                                <tr>
                                    <th>封面</th>
                                    <th>名称</th>
                                </tr>
                                </thead>
                                <s:iterator value="#request.photographer.examples_own">
                                    <tr>
                                        <td>
                                            <s:iterator value="pictures" status="st">
                                                <s:if test="%{#st.first==true}">
                                                    <a href="putExample.action?example.exampleId=<s:property value='exampleId'/>">
                                                        <img src="<s:property value='picture1'/>" width="100"
                                                             height="200" />
                                                    </a>
                                                </s:if>
                                                <s:else>
                                                </s:else>
                                            </s:iterator>
                                        </td>
                                        <td>
                                            <h4>
                                                <a href="putExample.action?example.exampleId=<s:property value='exampleId'/>">
                                                    <s:property value="name" />
                                                </a>
                                            </h4>
                                        </td>
                                    </tr>
                                </s:iterator>
                            </table>
                        </div>
                    </div>
                    <h3>
                        &nbsp;&nbsp;&nbsp;联系TA
                    </h3>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table
                                    class="table table-sm table-hover table-align-middle"
                            >
                                <thead>
                                <tr>
                                    <th>所在地</th>
                                    <th>邮箱</th>
                                    <th>微信</th>
                                    <th>QQ</th>
                                    <th>电话</th>
                                </tr>
                                </thead>
                                <tr>
                                    <td>
                                        <h4>
                                            <s:property value="#request.photographer.region" />
                                        </h4>
                                    </td>
                                    <td>
                                        <h4>
                                            <a href="mailto:example@gmail.com"><s:property
                                                    value="#request.photographer.email" /></a>
                                        </h4>
                                    </td>
                                    <td>
                                        <h4>
                                            <s:property value="#request.photographer.wechat" />
                                        </h4>
                                    </td>
                                    <td>
                                        <h4>
                                            <s:property value="#request.photographer.qq" />
                                        </h4>
                                    </td>
                                    <td>
                                        <h4>
                                            <s:property value="#request.photographer.phone" />
                                        </h4>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-primary">个人简介</h6>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <p>
                                <s:property value="#request.photographer.introduction" />
                            </p>
                        </div>
                    </div>
                    <s:if test="%{#session.employer!=null}">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">预约TA</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <p>
                                    <a href="gotoSubscribe?photographerID=<s:property value='#request.photographer.photographerId'/>"><input type="button" value="预约" /></a>
                                </p>
                            </div>
                        </div>
                    </s:if>
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
<!--- Contact Ends Here ---->
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

