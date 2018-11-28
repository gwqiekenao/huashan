<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>系统管理_角色维护</title>
<base href="<%=basePath%>" />
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width , initial-scale=1" />
<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
<link rel="stylesheet" type="text/css" href="<%=path%>/css/index.css" />
<script type="text/javascript" src="<%=path%>/js/html5shiv.min.js"></script>
<script type="text/javascript" src="<%=path%>/js/respond.min.js"></script>
<script type="text/javascript" src="<%=path%>/js/jquery.js"></script>
<script type="text/javascript">
function verifyNumber() {
	var nowPageNum = $("[name='nowPageNum']").val();
	var eachPageNum = $("[name='eachPageNum']").val();
	var reg2 = /^[1-9]\d*$/;
	var allPage = $("[name='allPage']").html();
	if (eachPageNum != null && eachPageNum != "") {
		if (!reg2.test(eachPageNum)) {
			alert("每页显示条数必须为正整数");
			return false;
		}
	}
	if (nowPageNum != null && nowPageNum != "") {
		if (!reg2.test(nowPageNum)) {
			alert("跳转页数必须为正整数");
			return false;
		} else {
			 if(nowPageNum - allPage > 0) {
					alert("跳转页数必须小于总页数")
					return false;
				}     
		}
	}
	return true;
}

function verify() {
	if (verifyNumber()) {
		$("[name='queryRoleForm']").submit();
	}
}

function verify1(nowPage) {
	$("[name='nowPageNum']").val(nowPage);
	if (verifyNumber()) {
		$("[name='queryRoleForm']").submit();
	}
}
 

 function userTel1(){	 
	var userTel = $("[name='userTel']").val();	    
	var	regTel=/^[1-9]\d*$/;
	if(userTel != null && userTel !=""){
		if(!regTel.test(userTel)){
			alert("手机号格式输入错误");
			 
 		}else{
			  			 
			}
		}  
 }
	//设置全选或者全不选
	function selectAll() {
		if ($("#selAll").attr("checked")) {
			$("input[name='sel']").prop("checked", true);
		} else {
			$("input[name='sel']").prop("checked", false);
		}
	}
	$(function(){
		$("#clearBtn").click(function(){
			$("[name='roleName']").val("");
			 
		});
	});
	//设置当有一个没选时，全选为没有选中状态；当全部都选中时，全选为选中状态
	function selTr(obj) {
		if ($(obj).attr("checked")) {
			//判断选中的复选框个数与总个数是否相等
			if ($("input[name='sel']:checked").length == $("input[name='sel']").length) {
				$("#selAll").prop("checked", true);
			}
		} else {
			$("#selAll").prop("checked", false);
		}
	}
 	
	//批量删除
	function batchDelete() {
		var checkboxs = $("input[name='sel']:checked");
		if(checkboxs.length == 0) {
			alert("请至少选择一个选项");
			return;
		}
		var ids = "";
		var checkboxs = $("input[name='sel']:checked");
		var flag = confirm("是否要删除选中行数据？");		
		if (flag == true) {			
			for ( var i = 0; i < checkboxs.length; i++) {				
				if (i != checkboxs.length - 1) {
					ids += checkboxs.eq(i).parents("tr").find("td").eq(3)
					.text()
					+ ",";
		     } else {
			ids += checkboxs.eq(i).parents("tr").find("td").eq(3)
					.text();
				}
			}
			 
		alert(ids)
			$("#ids").val(ids);
			$("[name='deleteRoles']").submit();
		}		 
	}
	
	 
</script>
</head>

<body>
		<div>
			<form action="roleController/deleteRoles?" name="deleteRoles" method="post">
			 
		    <input type="hidden" name="idss" id="ids" />
		     		 
	        </form>
	    </div>	
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
					<div class="crumbs  curr">
						<img class="mr5" src="images/icon_loaction.png" alt="">
						我的位置： <a href="index.html">首页</a> <span class="dire_a">></span> <a
							href="">系统管理</a> <span class="dire_a">></span> <a class="curr"
							href="xtgl_rywh.html">角色维护</a>
					</div>
					
					<!--搜索框-->
					<div class="searchCont">
						<form action="roleController/findAllRole" method="post"
							name="queryRoleForm"  id="queryRoleForm">
							<div class="searchCont">
								<label class="margin10" for="ygbh" >角色权限</label> 
								<input name="roleName"  type="text"
									value="${requestScope.roleName }">
								 								
							      							      
							      <label id="msg" style= "color:red" ></label> 
							      
								  <a class="btn clearBtn fr mr5" href="roleController/findAllRole" id="clearBtn"><b></b>清空</a> 
								<a class="btn queryBtn fr mr5" href="javascript:void()" onclick="verify()" name="chaxun"><b></b>查询 </a> 
							</div>

							<div class="topTitle">
								<span><b></b>人员列表</span>
								<div class="editCont">
									<ul class="editList">
										<li><a class="delBtn" href="javascript:void()" onclick="batchDelete()"><b></b>批量删除</a>
										<li><a class="addBtn" href="roleController/insertRole"><b></b>新增</a></li>
										<li><a class="excelBtn" id="js-export" onclick="exportExcel()"><b></b>导出EXCEL</a></li>
									</ul>
								</div>
							</div>
							 <div class="tableBox">
					             <table class="table_1" id="tab">
						        <thead>
										<tr>
									<th><input type="checkbox" class="allCheck" id="selAll" onclick="selectAll()"/> </th>
									 
									<th>序号</th>
									<th>操作</th>
									<th>角色权限</th>	
									<th>时间</th>								 
								</tr>
							 
									</thead>
									<tbody>
								<c:forEach items="${requestScope.roleList }" var="role" varStatus="status">
								 
									    <tr align="center">
										<td width="2%"><input type="checkbox" class="allCheck" name="sel" onclick="selTr(this)"/></td>
									 
										<td>${status.index+1 }</td>
								 	<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<a href="roleController/updateById?id=${role.id}"><b></b>修改</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<a class="delBtn"
							href="${pageContext.request.contextPath}/roleController/deleteRole?id=${role.id }"
							onclick="if (confirm('确定要删除此项数据吗？')) return true; else return false;">删除</a></td> 
									 
										<td width="8%">${role.roleName }</td>
									 
										<td><fmt:formatDate
										value="${role.createTime }" pattern="yyyy-MM-dd" /></td>
										<td></td>
										</tr>
									 
								</c:forEach>

									</tbody>
								</table>
								<!--分页组件 -->
											<div class="pager">
												<ul class="pagerList">
													<li>每页 <input name="eachPageNum"
														class="dropdown num" type="text"
														value="${requestScope.pageModel.eachPageNum}"> 条
													</li>
													<li><a class="btn firstBtn"
														href="javascript:void()" onclick="verify1(1)">首页</a></li>
													<li><c:choose>
															<c:when test="${requestScope.pageModel.nowPageNum>1}">
																<a href="javascript:void()" class="btn prevBtn"
																	onclick="verify1(${requestScope.pageModel.nowPageNum-1})">
																	上一页 </a>
															</c:when>
															<c:otherwise>
																<a href="javascript:void()" class="btn prevBtn"> 上一页
																</a>
															</c:otherwise>
														</c:choose></li>
													<li><a class="btn nowPage" href="#;"><span
															class="now" name="nowPage">${requestScope.pageModel.nowPageNum}</span>/
															<span class="total" name="allPage">${requestScope.pageModel.pageCount}</span></a></li>
													<li><c:choose>
															<c:when
																test="${requestScope.pageModel.nowPageNum<requestScope.pageModel.pageCount}">
																<a href="javascript:void()" class="btn nextBtn"
																	onclick="verify1(${requestScope.pageModel.nowPageNum+1})">
																	下一页 </a>
															</c:when>
															<c:otherwise>
																<a href="javascript:void()" class="btn nextBtn"> 下一页
																</a>
															</c:otherwise>
														</c:choose></li>
													<li><a href="javascript:void()" class="btn lastBtn"
														onclick="verify1(${requestScope.pageModel.pageCount})">
															尾页 </a></li>
													<li class="m_010">共<span class="totalRecord">${requestScope.pageModel.dataNum}</span>条记录
													</li>
													<li>跳转到<input name="nowPageNum"
														class="dropdown list" type="text">页
													</li>
													<li><a class="btn goBtn" href="javascript:void()"
														onclick="verify()">GO</a></li>
													<li><a class="btn freshBtn" href="javascript:void()"><b></b></a></li>
												</ul></div>
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
		<div style="height:300px;" class="tableBox">
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
	
function exportExcel() {		
		var checkboxs = $("input[name='sel']:checked");
		var flag = confirm("确定要导出选中计划吗？");
		if (flag == true) {
			var expRoles = "";
			for (var i = 0; i < checkboxs.length; i++) {
				var curCheck = checkboxs.eq(i).parents("tr").find("td").eq(3).text();
				expRoles += curCheck + ",";
			}
			window.location.href='${pageContext.request.contextPath}/xitong/role_RoleExcel2?expRoles='+expRoles;
			$("#selAll").prop("checked", false);
		}
		
	} 
</script>
</body>
</html>