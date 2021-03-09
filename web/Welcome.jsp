<%--
  Created by IntelliJ IDEA.
  User: Catherine小天使
  Date: 2020/12/27
  Time: 23:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<title>Welcome</title>
</head>
<body>

<div title="欢迎使用">
    <br/>
    <br/>
    <br/>
    <p>约拍交易平台</p>
    <p>
        <s:if test="%{#session.photographer!=null}">
            <s:property value="#session.photographer.name" />
        </s:if>
        <s:elseif test="%{#session.employer!=null}">
            <s:property value="#session.employer.name" />
        </s:elseif>
        欢迎使用!</p>
    <hr />
    <br/>
    <br/>
    <br/>
</div>
</body>
</html>
