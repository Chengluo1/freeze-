<%--
  Created by IntelliJ IDEA.
  User: Eileen
  Date: 2020/12/20
  Time: 19:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <s:head theme="xhtml" />
    <sx:head parseContent="true" extraLocales="UTF-8" />
    <!-- Meta tag Keywords -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>登录</title>
    <meta name="keywords" content=""
    />
    <script>
        addEventListener("load", function () {
            setTimeout(hideURLbar, 0);
        }, false);

        function hideURLbar() {
            window.scrollTo(0, 1);
        }
    </script>
    <!-- Meta tag Keywords -->
    <!-- css files -->
    <link rel="stylesheet" href="css/style1.css" type="text/css" media="all" />
    <!-- Style-CSS -->
    <link rel="stylesheet" href="css/fontawesome-all1.css">
    <!-- Font-Awesome-Icons-CSS -->
    <!-- //css files -->
    <!-- web-fonts -->
    <link href="http://maxcdn.bootstrapcdn.com/css?family=Josefin+Sans:100,100i,300,300i,400,400i,600,600i,700,700i" rel="stylesheet">
    <link href="http://maxcdn.bootstrapcdn.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i" rel="stylesheet">
    <!-- //web-fonts -->
</head>

<body>
<!-- bg effect -->
<div id="bg">
    <canvas></canvas>
    <canvas></canvas>
    <canvas></canvas>
</div>
<!-- //bg effect -->
<!-- title -->
<h1>登录</h1>
<!-- //title -->
<!-- content -->
<div class="sub-main-w3">
    <div class="form"><s:fielderror/>
        <form action="login" method="post">
            <h2>现在登录
                <i class="fas fa-level-down-alt"></i>
            </h2>
            <div class="form-style-agile">
                <label>
                    <i class="fas fa-user"></i>
                    手机号
                </label>
                <s:textfield name="photographer.phone" placeholder="手机号"/>
            </div>
            <div class="form-style-agile">
                <label>
                    <i class="fas fa-unlock-alt"></i>
                    密码
                </label>
                <s:password name="photographer.password" placeholder="密码"/>
            </div>
            <!-- checkbox -->
            <div class="wthree-text">
                <ul>
                    <li>
                        <label class="anim">
                            <input type="checkbox" class="checkbox" required="">
                            <span>保持登录</span>
                        </label>
                    </li>
                    <li>
                        <div class="link">
                            没有账号？<a href="registerEmp.jsp">注册</a>
                        </div>
                    </li>
                </ul>
            </div>
            <!-- //checkbox -->
            <input type="submit" value="登录">
        </form>
    </div>
</div>
<script type="text/javascript">
    var msg=""+'${request.tip}';
    if(msg!=""){
        alert(msg);
    }
</script>
<!-- //content -->

<!-- copyright -->
<div class="footer">
    <p>Copyright &copy; 2020.<a target="_blank" href="http://sc.chinaz.com/moban/"></a></p>
</div>
<!-- //copyright -->

<!-- Jquery -->
<script src="js/jquery-3.3.1.min.js"></script>
<!-- //Jquery -->

<!-- effect js -->
<script src="js/canva_moving_effect.js"></script>
<!-- //effect js -->

</body>

</html>
