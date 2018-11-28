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
	<title>系统管理_供应商主数据(修改)</title>

	<meta name="viewport" content="width=device-width , initial-scale=1"/>
	<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/index.css"/>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/html5shiv.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/respond.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>


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
					我的位置：
					<a href="index.html">首页</a> <span class="dire_a">></span>
					<a href="">系统管理</a> <span class="dire_a">></span>
					<a class="curr" href="xtgl_gyssj.html">供应商主数据</a>
				</div>
				<!--供应商主数据-->
				<div class="topTitle">
					<span><b></b>供应商信息</span>
				</div>
				<form action="${pageContext.request.contextPath}/supplier/updateSupplier" method="post"
					name="updateSuppForm">
				<div class="tableBox">
					<table class="table_ht">
						<tbody>
						<tr>
							<td width="15%" >供应商编号：</td>
							<td width="35%">${supplier.supplierCode}
								<input type="hidden" name="id" value="${supplier.id }">
							</td>
							<td width="15%" >供应商名称：</td>
							<td width="35%">
								<input type="text" name="supplieName" value="${supplier.supplieName}">
							</td>
						</tr>
						<tr>
							<td>供应商类型：</td>
							<td><select name="supplierType"
											class="dropdown bz">
												<c:forEach items="${sessionScope.fastAll}" var="fast">
													<c:if test="${fast.fastType == 'supplierType'}">
														<c:choose>
															<c:when
																test="${fast.code == supplier.supplierType }">
																<option value="${fast.code}" selected>${fast.codeName}</option>
															</c:when>
															<c:otherwise>
																<option value="${fast.code}">${fast.codeName}</option>
															</c:otherwise>
														</c:choose>
													</c:if>
												</c:forEach>

										</select></td>
							<td>营业执照注册号：</td>
							<td>
							<input type="text" name="license" value="${supplier.license}">
							</td>
						</tr>
						<tr>
							<td>组织机构代码：</td>
							<td>
							<input type="text" name="organiztion" value="${supplier.organiztion}">
							</td>
							<td>税务登记证(国税)：</td>
							<td>
							<input type="text" name="stateTax" value="${supplier.stateTax}">
							</td>
						</tr>
						<tr>
							<td>税务登记证(地税)：</td>
							<td>
							<input type="text" name="landTax" value="${supplier.landTax}">
							</td>
						</tr>
						</tbody>
					</table>
				</div>
				</form>
				<div class="submitCont">
					<a class="returnBtn btn fr mr5" href="${pageContext.request.contextPath}/supplier/findSupp">返回</a>
					<input class="submitBtn btn fr mr5" type="button" onclick="submitSupp()" value="提交"/>
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

<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.easydropdown.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/commen.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/dialog.js"></script>
<script type="text/javascript">
	function submitSupp() {
		$("[name='updateSuppForm']").submit();
	}
</script>
</body>
</html>