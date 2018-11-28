<?xml version="1.0" encoding="UTF-8" ?>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>采购管理_项目信息(详情)</title>
	<base href="<%=basePath%>" />
	<meta charset="UTF-8" />
	<meta name="viewport" content="width=device-width , initial-scale=1"/>
	<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1" />
	<link rel="stylesheet" type="text/css" href="<%=path%>/css/index.css"/>
	<script type="text/javascript" src="<%=path%>/js/html5shiv.min.js"></script>
	<script type="text/javascript" src="<%=path%>/js/respond.min.js"></script>
	<script type="text/javascript" src="<%=path%>/js/jquery.js"></script>
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
									<li class="curr">采购管理</li>									 
									<li>系统管理</li>
						</c:if>
						<c:if test="${fn:contains(role,'采购管理员')==true}">
									<li class="curr">采购管理</li>
						</c:if>
						<c:if test="${fn:contains(role,'采购管理员')==false}">
									<li style="display: none"></li>
						</c:if>
						 
						<c:if test="${fn:contains(role,'系统管理员')==true}">
									<li>系统管理</li>
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
					我的位置：
					<a href="">采购信息</a> <span class="dire_a">></span>
					<a class="curr" href="cggl_xmxx_detail.html">项目信息</a>
				</div>
				<div class="topTitle">
					<span><b></b>项目信息</span>
				</div>
				<div class="tableBox">
					<table class="table_ht">
						<tbody>
						<tr>
							<td width="18%" >&nbsp;项目编号：</td>
							<td width="18%" >${project.projectCode }</td>
							<td width="18%" ><span class="notice">*</span>项目名称：</td>
							<td colspan="3">${project.projectName }</td>
						</tr>
						
						
						<tr>
							<td><span class="notice">*</span>项目类型：</td>
							<td><c:forEach items="${sessionScope.fastAll}" var="fast">
							<c:if test="${fast.fastType == 'projectType' }">
																	<c:if test="${fast.code == project.projectType }">${fast.codeName}</c:if>
																	</c:if>
																</c:forEach></td>
							<td width="18%"><span class="notice">*</span>币种：</td>
							<td><c:forEach items="${sessionScope.fastAll}" var="fast">
											<c:if test="${fast.fastType == 'moneyType' }">
																	<c:if test="${fast.code == project.moneyType }">${fast.codeName}</c:if>
																	</c:if>
																</c:forEach></td>
						</tr>
						<tr>
							<td>合同金额(万元)：</td>
							<td>${project.contractMoney }</td>
							<td>概算金额(万元):</td>
							<td>${project.estimateMoney }</td>
						</tr>
						<tr>
							<td>材料限额(万元)：</td>
							<td>${project.materialMoney }</td>
							<td><span class="notice">*</span>项目经理：</td>
							<td>${project.projectManager }</td>
							
						</tr>
						<tr>
							<td><span class="notice">*</span>电话：</td>
							<td>${project.managerTel }</td>
							<td>身份证：</td>
							<td>${project.managerIdCard }</td>
						</tr>
						<tr>
							<td><span class="notice">*</span>项目地址：</td>
							<td colspan="3">${project.projectAddress }</td>
						</tr>
						<tr>
							<td><span class="notice">*</span>项目概述：</td>
							<td colspan="3">${project.projectInfo }</td>
						</tr>
						</tbody>
					</table>
				</div>
				<div class="submitCont">
				<c:if test="${flag == 1 }">
					<a class="returnBtn btn fr mr5" href="${pageContext.request.contextPath}/project/findProject">返回</a>
				</c:if>
				<c:if test="${flag == 2 }">
					<a class="returnBtn btn fr mr5" href="${pageContext.request.contextPath}/purchase/findPurchaseInfo">返回</a>
				</c:if>
				<c:if test="${flag == 3 }">
					<a class="returnBtn btn fr mr5" href="${pageContext.request.contextPath}/purchase/purchaseDetail?id=${id}">返回</a>
				</c:if>
				</div>
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

<script type="text/javascript" src="<%=path%>/js/jquery.easydropdown.js"></script>
<script type="text/javascript" src="<%=path%>/js/dialog.js"></script>
<script type="text/javascript" src="<%=path%>/js/commen.js"></script>
<script>

</script>
</body>
</html>