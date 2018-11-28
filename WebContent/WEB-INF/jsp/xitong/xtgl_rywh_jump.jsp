<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>系统管理_人员维护(授权)</title>
<base href="<%=basePath%>" />
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width , initial-scale=1" />
<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
<link rel="stylesheet" type="text/css" href="<%=path%>/css/index.css" />
<script type="text/javascript" src="<%=path%>/js/html5shiv.min.js"></script>
<script type="text/javascript" src="<%=path%>/js/respond.min.js"></script>
<script type="text/javascript" src="<%=path%>/js/jquery.js"></script>
<script type="text/javascript">
 
</script>
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
						<a>注销</a>
					</c:if></li>
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
					<!--面包屑导航-->
					<div class="crumbs">
						<img class="mr5" src="images/icon_loaction.png" alt="">
						我的位置： <a href="index.html">首页</a> <span class="dire_a">></span> <a
							href="">系统管理</a> <span class="dire_a">></span> <a class="curr"
							href="xtgl_rywh.html">人员维护</a>
					</div>
					<table class="table_tree">
						<tr>

							<td class="operateTd">
								<!--操作区域-->
								<div class="operateCont">
					<!--搜索框-->
							<div class="searchCont">
										<center> <label class="mr5">人员编号:  ${user.userCode }</label> 
										<label class="margin10">人员名称:  ${user.userName }</label> </center>
							</div>
						<form action="userAndRoleController/insertPro" method="post"
							name="updateurForm">
							<div class="tableBox">
								<table class="table_1">
								<thead>
									<tr>
									  <th  width="20%">序号</th>
									  <th width="20%">权限</th>
									 
									  <th width="20%">操作</th>
									</tr>
								</thead>
								<tbody>
										<c:forEach items="${requestScope.userNameList }" var="ro" varStatus="status">
										<tr>																			 										 
											<c:set var="isDsing " value="0" />
											<c:if test="${isDsing != '3'}">	
											<td>${status.index+1 }</td>										 										 												 
												<td width="8%">${ro.roleName}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
												<td width="8%">
													<c:if test="${ empty userandroleList }"><!-- 判断为空 -->
														 <a href="userAndRoleController/insertPro?userId=${user.id }&roleId=${ro.id}"
															onclick="if (confirm('确定要授予此权限吗？')) return true; else return false;">
															授予权限 </a>  
													</c:if>
													  
													<c:if test="${not empty userandroleList }"> 
													   <c:set var="isDoing " value="0" />
													        
													 <c:forEach items="${requestScope.userandroleList }" var="ur">														 
													 		<c:if test="${ur.roleId  == ro.id }">
													 			<c:if test="${ur.roleId  == '1'}">
																	<a href="userAndRoleController/deleteUserAndRole?userId=${user.id }&roleId=${ro.id}"
																		onclick="if (confirm('确定要收回此权限吗？')) return true; else return false;">
																		收回权限</a>	   															
																 	<c:set var="isDsing" value="3" />
																  	<c:set var="isDoing" value="1" />	
															   	</c:if>
															   	
													 		 	<c:if test="${ur.roleId  != '1'}">
																	<a href="userAndRoleController/deleteUserAndRole?userId=${user.id }&roleId=${ro.id}"
																		onclick="if (confirm('确定要收回此权限吗？')) return true; else return false;">
																		收回权限</a>	   															
																 <c:set var="isDoing" value="1" />	
															   	</c:if>
															   													 
															</c:if>
													</c:forEach>													 
													<c:if test="${isDoing != '1'}">												      
															<a href="userAndRoleController/insertPro?userId=${user.id }&roleId=${ro.id}"
																onclick="if (confirm('确定要授予此权限吗？')) return true; else return false;">
																授予权限 </a> 																    														   
													   </c:if>
														<c:set var="isDoing" value="0" />    							 													 
													 </c:if>
													   </c:if>
													</td>
													 
												</tr>
												
										</c:forEach>
										 
									</tbody>
									
								</table>
							</div>
						　							 
						</form>		
						</td>
						</tr>
					</table>	 
						<div class="submitCont">
					   　　　　 <a class="returnBtn btn fr mr5" href="userController/findAllUser">返回</a>
				 	　　　</div>
					</div>
					　
				</div>
			</div>
		</div>

	
	<!-- 人员信息查询弹出框ｍ-->
	<div id="ryxxBox" class="pop">
		<!--人员信息表-->
		<div style="height: 300px;" class="tableBox">
			<table class="table_ht">
				<tbody>

				</tbody>
			</table>
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
		src="<%=path%>/js/jquery.easydropdown.js"></script>
	<script type="text/javascript" src="<%=path%>/js/calendar.js"></script>
	<script type="text/javascript" src="<%=path%>/js/dialog.js"></script>
	<script type="text/javascript" src="<%=path%>/js/commen.js"></script>

	<script type="text/javascript">
	 
	$(function () {

		var dialog_ryxx=new Dialog({
			target:'#ryxxBox',
			width:660,
			height:400,
			showYesBtn:true,
			showNoBtn:true,
			title: '查看人员',
			yesFn:function(){ return;},
			noFn:function(){ return;}
		});

		$('.ryxxBtn').bind('click',function(){
			dialog_ryxx.show();
		});
	});
	 
</script>
</body>
</html>