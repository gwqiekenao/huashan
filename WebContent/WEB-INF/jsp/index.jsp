<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录</title>

<meta name="viewport" content="width=device-width , initial-scale=1" />
<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/index.css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/html5shiv.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/respond.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery.js"></script>


</head>
<body>
	<div class="wrap">
		<!-- 头部 -->
		<div class="top">
			<div class="logo"></div>
			<div class="login"></div>
			<ul class="loginUl">
				<li><a href="">电子商务服务平台</a></li>
				<li class="userName"><a href=""><b></b>${sessionScope.currentUser.userName}</a></li>

				<li class="quitBtnMy"><c:if test="${currentUser.userName!=null }">
		   		<a href="#">注销</a>
				</c:if>
				</li>  
			</ul>
			<div class="bar">
				<div class="menuBtn open">
					<a class="fold_sider open" id="fold_sider" href="#;"></a>
				</div>
				<div class="bar_item">
					<ul class="tabUl">
					<c:forEach items="${sessionScope.userRole }" var="role">
						<c:if test="${fn:contains(role,'超级管理员')==true}">
									<li>采购管理</li>									 
									<li class="curr">系统管理</li>
						</c:if>
						<c:if test="${fn:contains(role,'采购管理员')==true}">
									<li class="curr">采购管理</li>
						</c:if>
						<c:if test="${fn:contains(role,'采购管理员')==false}">
									<li style="display: none"></li>
						</c:if>
						 
						<c:if test="${fn:contains(role,'系统管理员')==true}">
									<li class="curr">系统管理</li>
						</c:if>
						<c:if test="${fn:contains(role,'系统管理员')==false}">
									<li style="display: none"></li>
						</c:if>
					</c:forEach>
				</ul>
			</div>
		</div>
	</div>
	<!-- 主体 -->
	<div class="main">
		<div class="sider_panel">
			<div class="sider_con">
				<div class="sider_nav_con">
				
				<div class="tabCont" style="display:none";>
					<div class="manage_list">
					    <div class="manage_item curr"><span class="fold_icon"></span><span class="manage_type">项目管理</span></div>
					    <ul class="sub_manage_list">
					        <li class="sub_manage_item active"><a href="${pageContext.request.contextPath}/project/findProject"><b class="subicon xmxx" data-tipso="项目管理"></b><span class="manage_link" >项目管理</span></a></li>
					    </ul>
					</div>
				
					 
				</div>
				<div class="tabCont" style="display:none";>
					<div class="manage_list">
					    <div class="manage_item"><span class="fold_icon"></span><span class="manage_type">组织管理</span></div>
					    <ul class="sub_manage_list">
					        
					        <li class="sub_manage_item "><a href="${pageContext.request.contextPath}/userController/findAllUser"><b class="subicon rywh" data-tipso="人员维护"></b><span class="manage_link" >人员维护</span></a></li>
					        
					        <li class="sub_manage_item "><a href="${pageContext.request.contextPath}/roleController/findAllRole"><b class="subicon jswh" data-tipso="角色维护"></b><span class="manage_link" >角色维护</span></a></li>
					       
					    </ul>
					</div>
					<div class="manage_list">
					    <div class="manage_item"><span class="fold_icon"></span><span class="manage_type">系统配置</span></div>
					    <ul class="sub_manage_list">
					        
					        <li class="sub_manage_item "><a href="${pageContext.request.contextPath}/fastController/findAllFast"><b class="subicon ksbm" data-tipso="快速编码"></b><span class="manage_link" >快速编码</span></a></li>
					        
					    </ul>
					</div>
			
					<div class="manage_list">
					    <div class="manage_item"><span class="fold_icon"></span><span class="manage_type">基础数据</span></div>
					    <ul class="sub_manage_list">
					        <li class="sub_manage_item "><a href="${pageContext.request.contextPath}/xtgl_xtgl/contractList1"><b class="subicon wzsj" data-tipso="物资数据"></b><span class="manage_link" >物资数据</span></a></li>
					        <li class="sub_manage_item "><a href="${pageContext.request.contextPath}/supplier/findSupp"><b class="subicon gyssj" data-tipso="供应商主数据"></b><span class="manage_link" >供应商主数据</span></a></li>
					      
					    </ul>
					</div>
				</div>
					<div class="aside_bg">
						<div class="img"></div>
					</div>
				</div>
			</div>
		</div>
			<div class="main_panel">
				<div class="content">
					<div class="topTitle">
						<span><b></b>常用功能</span>
					</div>
					<ul class="mainMenu">
						<li class="unDone">
							<div class="img">
								<a href="javascript:void()"><img src="images/icon_unDone.png" alt=""></a>
							</div>
							<div class="info">
								<span>待我审批</span>
							</div>
						</li>
						<li class="hasDone">
							<div class="img">
								<a href="javascript:void()"><img src="images/icon_hasDone.png" alt=""></a>
							</div>
							<div class="info">
								<span>我已审批</span>
							</div>
						</li>
						<li class="report">
							<div class="img">
								<a href="javascript:void()"><img src="images/icon_report.png" alt=""></a>
							</div>
							<div class="info">
								<span>我提交的</span>
							</div>
						</li>
						<li class="myInfo">
							<div class="img">
								<a href="javascript:void()"><img src="images/icon_info.png" alt=""></a>
							</div>
							<div class="info">
								<span>个人信息</span>
							</div>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!--注销弹出框-->
<div id="quitBox" class="pop">
	<div class="mt15 mb20 f12">
		<b class="sighicon" ></b>确认注销用户吗?
	</div>
	<script type="text/javascript">
		$(function () {

			var dialog_quitBox=new Dialog({
				target:'#quitBox',
				width:400,
				height:200,
				showYesBtn:true,
				showNoBtn:true,
				title: '提示',
				yesFn:function(){
					location.href = '${pageContext.request.contextPath}';
	 				return;
				},
				noFn:function(){
					return;}
			});
			$('.quitBtnMy').bind('click',function(){
				dialog_quitBox.show();
			});	
			
		});
	</script>
</div>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/js/jquery.easydropdown.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/js/commen.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/js/dialog.js"></script>
	<script type="text/javascript">
		
	</script>
</body>
</html>