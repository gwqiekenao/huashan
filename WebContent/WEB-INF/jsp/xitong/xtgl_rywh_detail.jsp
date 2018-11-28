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
<title>系统管理_人员维护</title>
<base href="<%=basePath%>" />
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width , initial-scale=1" />
<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
<link rel="stylesheet" type="text/css" href="<%=path%>/css/index.css" />
<script type="text/javascript" src="<%=path%>/js/html5shiv.min.js"></script>
<script type="text/javascript" src="<%=path%>/js/respond.min.js"></script>
<script type="text/javascript" src="<%=path%>/js/jquery.js"></script>
<script type="text/javascript">

function userTel1(){	 
	var userTel = $("[name='userTel']").val();	    
	var	regTel=/^[1][3,4,5,7,8][0-9]{9}$/;
	if(userTel != null && userTel !=""){
		 
		if(!regTel.test(userTel)){
			$("#msg1").text("手机号不符合规范");
			
 		}else{
 			$("#msg1").text("");
 			/* $("[name='userTel']").val(""); */			 
			}
		} else{
			$("#msg1").text("手机号不能为空");
		} 
}
 
function userTel2(){	 
	var userCountry = $("[name='userCountry']").val();	    
	var	regTel=/[\u4e00-\u9fa5]/;
	if(userCountry != null && userCountry !=""){
		if(!regTel.test(userCountry)){
			$("#msg4").text("国籍不符合规范");
			
 		}else{
 			$("#msg4").text("");
 			/* $("[name='userTel']").val(""); */			 
			}
		}  
}
 
function userTel3(){
	var userPwd = $("[name='userPwd']").val();
	var userPwd1 = $("[name='userPwd1']").val();
	if(userPwd == null || userPwd == ''){		 
		$("#msg2").text("密码不能为空");
	}else{
		$("#msg2").text("");
	}
	
	if(userPwd1 == null || userPwd1 == ''){
		$("#msg3").text("密码不能为空");
	}else{
		$("#msg3").text("");
	}
	if(userPwd != userPwd1){	 
		$("#msg3").text("两次密码输入不一致");
	}
}
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
						我的位置： <a href="index.html">首页</a> <span class="dire_a">></span> <a
							href="">系统管理</a> <span class="dire_a">></span> <a class="curr"
							href="xtgl_rywh.html">人员维护</a>
					</div>
					<!--搜索框-->
					<div class="searchCont">
						<form action="userController/insertpro" method="post" name="queryUserForm"  id="queryUserForm">
				<div class="tableBox">
					<table class="table_ht">
						<tbody>
						<tr>
							<td width="10%">&nbsp;员工编号：</td>
							<td width="23%">${userCode }
								<input type="hidden" name="userCode" value="${userCode }">
								<input type="hidden" name="createUser" value="超级用户">
							</td>
							<td width="10%"><span class="notice">*</span>名称</td>
							<td width="23%">
								<input type="text" name="userName">
								<label id="msg5" style="color: red"></label>
							</td>
							<td colspan="2"></td>
						</tr>
						
						<tr>
							<td width="10%"><span class="notice">*</span>用户密码</td>
							<td width="23%">
								<input type="password" name="userPwd" >
								<label id="msg2" style="color: red"></label>
							</td>
							<td width="10%"><span class="notice">*</span>确认密码</td>
							<td width="23%">
								<input type="password" name="userPwd1" onkeyup="userTel3()">
								<label id="msg3" style="color: red"></label>
							</td>
							</tr>
						
						<tr>			
							<td width="10%"><span class="notice">*</span>手机号</td>
							<td width="23%">
								<input type="text" name="userTel" onkeyup="userTel1()"/>
								<label id="msg1" style="color: red" ></label>								 
							</td>
						</tr>
						<tr>
							 <td width="10%"><span class="notice" >*</span>国籍</td>
							<td width="23%">
								<input type="text" name="userCountry" onkeyup="userTel2()">
								<label id="msg4" style="color: red"></label>
							</td>							 							  
						</tr>						
						<tr>
							<td><span class="notice">*</span>性别</td>
							<td>
							 
							<input type="radio" name="userSex" checked value='男'/> 男  
							<input type="radio" name="userSex"   value="女"/> 女 	
							<label id="msg5" style="color: red"></label>							 
							</td>							 
						</tr>
						</tbody>
					</table>
				</div>
				<div class="submitCont">
					<a class="returnBtn btn fr mr5" href="userController/findAllUser">返回</a>
					<input class="submitBtn btn fr mr5" type="button" onclick="upperCase()"  value="提交"/>
					<input class="submitBtn btn fr mr5" type="button" onclick="empty()"  value="清空"/>
				</div>
			</form>
					</div>
					</div>
				</div> 
			</div>
		</div>	
	<!-- 人员信息查询弹出框-->
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
		src="<%=path %>/js/jquery.easydropdown.js"></script>
	<script type="text/javascript" src="<%=path %>/js/calendar.js"></script>
	<script type="text/javascript" src="<%=path %>/js/dialog.js"></script>
	<script type="text/javascript" src="<%=path %>/js/commen.js"></script>
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
	
	function empty(){
		$("[name='userName']").val("");
		$("[name='userPwd']").val("");
		$("[name='userPwd1']").val("");
		$("[name='userTel']").val("");
		$("[name='userCountry']").val("");	 
	}
	
	 function upperCase(){	 	    
		var userName = $("[name='userName']").val();
		var userPwd = $("[name='userPwd']").val();
		var userPwd1 = $("[name='userPwd1']").val();
		var userTel = $("[name='userTel']").val();	
		var userCountry = $("[name='userCountry']").val();
		var userSex = $("[name='userSex']").val();		 
		if(userName == null || userName == ""){
			alert("用户名不能有空值")
			return ;
		} 		
		if(userPwd == null || userPwd == ""){
			alert("密码不能有空值")
			return ;
		} 
		if(userPwd1 == null || userPwd1 == ""){
			alert("请确认密码")
			return ;
		} 
		 if(userTel == null || userTel == ""){			 
			alert("手机号不能有空值")
			return ;
		} 
		if(userCountry == null || userCountry == ""){		 
			alert("国籍不能有空值")
			return ;
		} 
		if(userSex == null || userSex == ""){			 
			alert("性别不能空值")
		  return ;
		} 
		alert("添加成功")
	  	$("[name='queryUserForm']").submit();   
	}  
	
</script>
</body>
</html>