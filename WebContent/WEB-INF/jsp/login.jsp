<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>登录</title>

	<meta name="viewport" content="width=device-width , initial-scale=1"/>
	<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/login.css"/>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/html5shiv.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/respond.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
	
	
	
</head>
<body>
<div class="bg"></div>
	<div class="box">
		<div class="box_title">
			<h2>用户登录</h2>
		</div>
		<div class="login" id="login">
			<div class="content p_relative">
				<div class="c">
					<form id="loginForm" action="${pageContext.request.contextPath}/login" method="post">
						<ul>
							<input type="text" class="txtin"  name="userCode" placeholder="账号">
							<span class="icon pic1"></span>
							<!--<span class="txt" >账号</span>-->
						</ul>
						<ul>
							<input type="password" class="txtin" id="userPwd" name="userPwd" placeholder="密码">
							<span class="icon pic2"></span>
							<!--<span class="txt" >密码</span>-->
						</ul>
						<center><label style="color:red;font-size:17px">${msg }</label></center>
						<div>
							<input type="submit" name="loginbutton" class="btn_login" value="登录">
							<input type="reset" class="btn_login btn_reset" value="重置">
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript">

	</script>
</body>
</html>