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
</head>
<body>
<div>
    <div>
        <div>
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

    <div class="fl">
        <div class="userInfo" id="userInfoBox">
            <div class="wd_whiteBg">
                <div class="wdr_bbt">
                    <div class="wdr_imgBox">
                        <a href="/Userbe95ba3c-7f96-42a7-8adf-a72300e67689" target="_blank">
                            <img src="/photographer/photographer/profilephoto/<s:property value="%{#request.photographer.profilePhoto}"/>"/>
                        </a>
                    </div>
                    <div>
                        <s:hidden name="photographer.photographerId" value="%{#request.photographer.photographerId}"/><s:property
                            value="#request.photographer.photographerId"/>
                    </div>
                    <div>
                        <span class="province"><s:hidden name="photographer.region"
                                                         value="%{#request.photographer.region}"/><s:property
                                value="#request.photographer.region"/></span>
                    </div>
                    <br>
                    <div>
                        <div class="wdr_bbt">
                            <div class="wdr_title"><b>联系方式：</b>
                                <div><b>Q&nbsp;Q：</b><b><s:hidden name="photographer.qq" value="%{#request.photographer.qq}"/>
                                    <s:property value="#request.photographer.qq"/> </b></div>
                                <div><b>微信：</b><b><s:hidden name="photographer.wechat" value="%{#request.photographer.wechat}"/>
                                    <s:property value="#request.photographer.wechat"/></b></div>
                                <div><b>手机：</b><b><s:hidden name="photographer.phone"
                                                            value="%{#request.photographer.phone}"/><s:property
                                        value="#request.photographer.phone"/> </b></div>
                                <div><b>邮箱：</b><b><s:hidden name="photographer.email"
                                                            value="%{#request.photographer.email}"/><s:property
                                        value="#request.photographer.email"/> </b></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </s:form>

    <script type="text/javascript">
        var msg = "" + '${request.tipMessage}';
        if (msg != "") {
            alert(msg);
        }
    </script>
</body>
</html>