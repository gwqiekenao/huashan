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
<title>系统管理_快速编码(新增)</title>
<base href="<%=basePath%>" />
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width , initial-scale=1" />
<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
<link rel="stylesheet" type="text/css" href="<%=path%>/css/index.css" />
<script type="text/javascript" src="<%=path%>/js/html5shiv.min.js"></script>
<script type="text/javascript" src="<%=path%>/js/respond.min.js"></script>
<script type="text/javascript" src="<%=path%>/js/jquery.js"></script>
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
					<img class="mr5" src="images/icon_loaction.png" alt=""> 我的位置：
					<a href="index.html">首页</a> <span class="dire_a">></span> <a
						href="">系统管理</a> <span class="dire_a">></span> <a class="curr"
						href="xtgl_yhwh.html">快速编码</a>
				</div>
				
				<!--快速编码修改-->
				<div class="topTitle">
					<span><b></b>快速编码基本信息</span>
				</div>

				<div class="tableBox">
					<form action="fastController/insertPro" method="post" name="queryUserForm"  id="queryUserForm">
						<div class="tableBox">
							<table class="table_ht">
								<tbody>
									<tr>
										<td width="10%"><span class="notice">*</span>编码</td>
										 <td width="23%">
										 	<input type="text" name="code" value="${fast.code}" id="code">
										     
											<label id="msg2" style="color: red"></label>
										 </td>
										<td colspan="2"></td>
									</tr>
									<tr>
										<td width="10%"><span class="notice">*</span>编码中文名</td>
										  <td width="23%">
											 <input type="text"  value="${fast.codeName}"
												name="codeName" id="codeName">
											<label id="msg3" style="color: red"></label>
												 
										  </td>
										<td colspan="2"></td>
									</tr>
									<tr>
										<td width="10%"><span class="notice">*</span>类型</td>
										 <td width="23%">
											<input type="text" name="fastType" id="fastType">
												
											<label id="msg1" style="color: red"></label>
										 </td>
										<td colspan="2"></td>
									</tr>
									<tr>
										<td width="10%"><span class="notice">*</span>类型中文名</td>
										 <td width="23%">
											<input type="text"  value="${fast.fastTypeName}"
											name="fastTypeName" id="fastTypeName">
										 </td>
										<td colspan="2"></td>
									</tr>
									<tr>
										<td width="10%"><span class="notice">*</span>管理员</td>
								 
										<td width="23%">${sessionScope.currentUser.userName}
								    		<input type="hidden" name="createUser" value="${sessionScope.currentUser.userName}">
										 
										</td>
										 
										<td colspan="2"></td>
									</tr>
									 
								</tbody>
							</table>
						</div>
						<div class="submitCont">
							<a class="returnBtn btn fr mr5" href="fastController/findAllFast">返回</a>
							<input class="submitBtn btn fr mr5" type="botton" value="提交" onclick="upperCase()"/>
							<input class="submitBtn btn fr mr5" type="botton" value="清空" onclick="empty()"/>
						</div>
					</form>
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

	<script type="text/javascript" src="js/jquery.easydropdown.js"></script>
	<script type="text/javascript" src="js/dialog.js"></script>
	<script type="text/javascript" src="js/commen.js"></script>
	<script type="text/javascript">
	
	function empty(){
		 $("[name='code']").val("");
		 $("[name='codeName']").val("");
		 $("[name='fastTypeName']").val("");
		 $("[name='fastType']").val("");	
		 
	}
	
	function upperCase(){	 	    
	var code = $("[name='code']").val();
	var codeName = $("[name='codeName']").val();
	var fastType = $("[name='fastType']").val();	
	var fastTypeName = $("[name='fastTypeName']").val(); 
 	var createUser = $("[name='createUser']").val(); 		  
	if(code == null || code == ""){	 
		alert("编码空值")
		return ;
	}else{
		  $("#msg1").text("");  
	}		
	if(codeName == null || codeName == ""){
		alert("编码中文名有空值")
		return ;
	} 
	 if(fastType == null || fastType == ""){		
		$("#msg3").text("类型不能为空");
		alert("类型不能有空值")
		return ;	 
	} 
	if(createUser == null || createUser == ""){
		$("#msg4").text("创建人不能为空");
		alert("创建人不能有空值")
		return ;
	} 
	 if(fastTypeName == null || fastTypeName == ""){
		$("#msg5").text("类型中文名不能为空");
		alert("类型中文名不能有空值")
		return ;
	} 
	alert("增加成功")
	$("[name='queryUserForm']").submit();   
	}  

	$(function() {
		$("#fastType").blur(function() {
			var fastType = $("[name='fastType']").val();
			if (fastType == null || fastType == '') {
				$("#msg1").text("类型名不能为空")
				return false;
			} else {
				$("#msg1").text("");
				$("#msg2").text("");
				$("#smg3").text("");
				$.ajax({
					type : 'POST',
					url : 'fastController/verifyfastType',
					data : {
						'fastType' : fastType
					},
					dataType : "json",
					success : function(data) {							 
						if (data != null && data != '') {
							for(var i=0;i<data.length;i++){
								 var co = data[i];
								$("[name='fastTypeName']").val(co.fastTypeName) 
							 
							}							 
						} else {
							 
							$("[name='fastTypeName']").val("");
						}
					}
				});
			}
			return true;
		});
	});

	
	$(function() {
		$("#code").blur(function() {
			var code = $("[name='code']").val();
			if (code == null || code == '') {
				$("#msg2").text("编码不能为空")
				return false;
			} else {
				$("#msg1").text("");
				$("#msg2").text("");
				$("#smg3").text("");
				$.ajax({
					type : "POST",
					url : "fastController/verifyYZ",
					data : {
						'code' : code
					},
					dataType : "json",
					success : function(data) {
						if (data != null && data != '') {
						 
							for(var i=0;i<data.length;i++){
								 var cod = data[i];									 
							}
														 
						} else {
							 
							$("[name='codeName']").val("");
						}
					}
				});
			}
			return true;
		});
	});
	$(function() {
		$("#codeName").blur(function() {
			var codeName = $("[name='codeName']").val();
			 
			if (codeName == null || codeName == "") {
				$("#msg3").text("编码中文名不能为空")
				return false;
			}  
			return true;
		});
	});  
	
	$(function() {
		$("#codeName").blur(function() {
			var codeName = $("[name='codeName']").val();
			 
			if (codeName == null || codeName == "") {
				$("#msg3").text("编码中文名不能为空")
				
				return false;
			}  
			return true;
		});
	});  
	
	  $(function() {
			$("#fastType").blur(function() {
				var code = $("[name='code']").val();
				var fastType = $("[name='fastType']").val();
				if (fastType == null || fastType == "") {
					 
					return false;
				} else {
				if (code == null || code == "") {
					 
					return false;
				}
				else {
					$("#msg1").text("");
					$("#msg2").text("");
					$("#msg3").text("");
					$.ajax({
						type : 'POST',
						url : 'fastController/verifyCodeName',
						data : {
							'code' : code,
							'fastType' : fastType
						},
						dataType : "json",
						success : function(data) {
							if (data != null && data != '') {
								$("[name='fastType']").val("");
								$("[name='fastTypeName']").val("");
								$("#msg2").text("编码重复了")
							} else {
								 
							}
						}
					
					});
				}
				}
				return true;
			});
		});  

	</script>
</body>
</html>