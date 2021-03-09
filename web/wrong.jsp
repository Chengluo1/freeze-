<%--
  Created by IntelliJ IDEA.
  User: Catherine小天使
  Date: 2021/1/4
  Time: 21:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>
<link rel="stylesheet" href="404/css/style.css">
<html>
<head>
    <meta charset="UTF-8">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>404 你要的页面已经找不到了~</title>
</head>
<body class="body">
<section class="wrapper">

    <div class="container">

        <div id="scene" class="scene" data-hover-only="false">


            <div class="circle" data-depth="1.2"></div>

            <div class="one" data-depth="0.9">
                <div class="content">
                    <span class="piece"></span>
                    <span class="piece"></span>
                    <span class="piece"></span>
                </div>
            </div>

            <div class="two" data-depth="0.60">
                <div class="content">
                    <span class="piece"></span>
                    <span class="piece"></span>
                    <span class="piece"></span>
                </div>
            </div>

            <div class="three" data-depth="0.40">
                <div class="content">
                    <span class="piece"></span>
                    <span class="piece"></span>
                    <span class="piece"></span>
                </div>
            </div>

            <p class="p404" data-depth="0.50">404</p>
            <p class="p404" data-depth="0.10">404</p>

        </div>

        <div class="text">
            <article>
                <p>Uh oh! 看来你迷路了。<br>请点击按钮返回首页！</p>
                <button href="index.jsp">返回首页</button>
            </article>
        </div>

    </div>
</section>
<script src='404/js/parallax.min.js'></script>
<script src='404/js/jquery.min.js'></script>
<script src="404/js/script.js"></script>
</body>
</html>