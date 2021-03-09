<%--
  Created by IntelliJ IDEA.
  User: Eileen
  Date: 2020/12/20
  Time: 19:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <s:head theme="xhtml" />
    <sx:head parseContent="true" extraLocales="UTF-8" />
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>用户登录界面</title>

    <link rel="stylesheet" href="css/style1.css" type="text/css" media="all" />
    <!-- Style-CSS -->
    <link rel="stylesheet" href="css/fontawesome-all1.css">
    <!-- Font-Awesome-Icons-CSS -->
    <!-- //css files -->
    <!-- web-fonts -->
    <link href="http://maxcdn.bootstrapcdn.com/css?family=Josefin+Sans:100,100i,300,300i,400,400i,600,600i,700,700i" rel="stylesheet">
    <link href="http://maxcdn.bootstrapcdn.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i" rel="stylesheet">
    <!-- //web-fonts -->
    <script language="Javascript" type="text/javascript">
        function custCheck(){
            var pwd=document.getElementById("pwd");
            var repwd=document.getElementById("repwd");
            var acc=document.getElementById("mobile");
            if (acc.value.length==0||acc.value==null||acc.value===''){
                alert("手机号不能为空!");
                return false;
            }
            if (pwd.value.length==0||pwd.value==null||pwd.value===''){
                alert("密码不能为空!");
                return false;
            }
            if(pwd.value!=repwd.value){
                alert("两次密码不一致!");
                return false;
            }
        }
    </script>
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
<h1>用户注册</h1>
<!-- //title -->
<!-- Content -->
<div class="sub-main-w3">
    <div class="form"><s:fielderror/>
        <s:form role="form" action="registerEmp" method="post" class="registration-form" onsubmit="return custCheck()">
            <h2>注册
                <i class="fas fa-level-down-alt"></i>
            </h2>
            <div class="form-style-agile">
                <label>
                    <i class="fas fa-user"></i>
                    手机号
                </label>
                <s:textfield id="mobile" name="employer.phone" />
            </div>
            <div class="form-style-agile">
                <label>
                    <i class="fas fa-unlock-alt"></i>
                    密码
                </label>
                <s:password name="employer.password" id="pwd" />
            </div>
            <div class="form-style-agile">
                <label>
                    <i class="fas fa-unlock-alt"></i>
                    确认密码
                </label>
                <s:password name="repassword" id="repwd" />
            </div>
            <!-- checkbox -->
            <div class="wthree-text">
                <ul>
                    <li>
                        <label class="anim">
                            <span><a href="registerPho.jsp">切换至摄影师注册！！</a></span>
                        </label>
                    </li>
                    <li>
                        <div class="link">
                            已有账号？<a href="login.jsp">去登录</a>
                        </div>
                    </li>
                </ul>
            </div>
            <!-- //checkbox -->
            <input type="submit" value="立即注册">
        </s:form>
    </div>
</div>
<div class="footer">
    <p>Copyright &copy; 2020.<a target="_blank" href="http://sc.chinaz.com/moban/"></a></p>
</div>


<!-- Jquery -->
<script src="js/jquery-3.3.1.min.js"></script>
<!-- //Jquery -->

<!-- effect js -->
<script src="js/canva_moving_effect.js"></script>
<!-- //effect js -->
<script type="text/javascript">
    var msg=""+'${request.tipMessage}';
    if(msg!=""){
        alert(msg);
    }
</script>


</body>
</html>
