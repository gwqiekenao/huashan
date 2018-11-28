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
<title>系统管理_角色维护(修改)</title>
<base href="<%=basePath%>" />
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width , initial-scale=1" />
<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
<link rel="stylesheet" type="text/css" href="<%=path%>/css/index.css" />
<script type="text/javascript" src="<%=path%>/js/html5shiv.min.js"></script>
<script type="text/javascript" src="<%=path%>/js/respond.min.js"></script>
<script type="text/javascript" src="<%=path%>/js/jquery.js"></script>


</head>

<body>
	<div>
		<form action="roleController/deleteUsers?" name="deleteUsers"
			method="post">

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
							href="xtgl_rywh.html">角色维护</a>
					</div>
					<!--搜索框-->
					<div class="searchCont">
						<form action="roleController/updateAllRole" method="post"
							name="updateRoleForm">
							<div class="tableBox">
								<table class="table_ht">
									<tbody>
										<tr>
											<td width="10%">&nbsp;员工编号：</td>
											<td width="23%">${role.id}<input type="hidden"
												name="userCode" value="${role.id }"> <input
												type="hidden" value="${role.id }" name="id"> <input
												type="hidden" name="createUser" value="超级用户">
											</td>
											<td width="10%"><span class="notice">*</span>名称</td>
											<td width="23%"><input type="text"
												value="${role.roleName }" name="roleName"></td>
											<td colspan="2"></td>
										</tr>

									</tbody>
								</table>
							</div>
							<div class="submitCont">
								<a class="returnBtn btn fr mr5"
									href="roleController/findAllRole">返回</a> <input
									class="submitBtn btn fr mr5" type="button"
									onclick="upperCase()" value="提交" />
							</div>
						</form>
					</div>
					<div class="topTitle">
							<span><b></b>上传附件</span>
						</div>
						<form action="${pageContext.request.contextPath}/file/upload"
							method="post" id="uploadForm" enctype="multipart/form-data"> 
							<div class="tableBox">
								<table class="table_ht">
									<tbody>
										<tr>
											<td width="20%">&nbsp;附件：</td>
											<td width="80%"><label class="mr5">选择文件</label> <input
												type='file' class="upLoadBtn" name="file" id="file" /> <input
												id="upAllLoadBtn" type="button" value="上传">
											</td>
										</tr>
									</tbody>
								</table>
								<input type="hidden" value="系统管理_人员维护" name="fileType"> <input
									type="hidden" value="${role.id }" name="objId"> 
							</div>
						</form>
						<div class="topTitle">
							<span><b></b>文件列表</span>
						</div>
						<div class="tableBox">
							<table class="table_ht" id="filetb">
								<thead>
									<tr>
										<th>序号</th>
										<th>文件名称</th>
										<th>附件类型</th>
										<th>上传人</th>
										<th>上传时间</th>
										<th>操作</th>
									</tr>
								</thead>
								<tbody>
								</tbody>
							</table>
							<!--分页组件 -->
							<div class="pager">
								<ul class="pagerList">
									<li>每页 <input id="eachPageNum2" class="dropdown num"
										type="text"> 条
									</li>
									<li><a class="btn firstBtn disable"
										href="javascript:void()" onclick="firstPage2()">首页</a></li>
									<li><a href="javascript:void()" class="btn prevBtn2"
										onclick="prevPage2()"> 上一页 </a></li>
									<li><span class="nowPage2"></span>/ <span
										class="totalPage2"></span></li>
									<li><a href="javascript:void()" class="btn nextBtn2"
										onclick="nextPage2()"> 下一页 </a></li>
									<li><a href="javascript:void()" class="btn lastBtn"
										onclick="lastPage2()"> 尾页 </a></li>
									<li class="m_010">共<span class="totalRecord2"></span>条记录
									</li>
									<li>跳转到<input id="nowPageNum2" class="dropdown list"
										type="text">页
									</li>
									<li><a class="btn goBtn" href="javascript:void()"
										onclick="goFile()">GO</a></li>
									<li><a class="btn freshBtn" href="javascript:void()"><b></b></a></li>
								</ul>
							</div>
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
		src="<%=path%>/js/jquery.easydropdown.js"></script>
	<script type="text/javascript" src="<%=path%>/js/calendar.js"></script>
	<script type="text/javascript" src="<%=path%>/js/dialog.js"></script>
	<script type="text/javascript" src="<%=path%>/js/commen.js"></script>

	<script type="text/javascript">
	
		!(function() {
			$('#xqksrq').click(function(e) {
				e.stopPropagation();
				Calendar.show(this, {
					nextInput : 'xqjsrq'
				});
			});

			$('#xqjsrq').click(function(e) {
				e.stopPropagation();
				Calendar.show(this, {});
			});

			$('.jcsj').click(function(e) {
				e.stopPropagation();
				Calendar.show(this, {});
			});
		})();
		function verifyNumber2() {
			var nowPageNum = $("#nowPageNum2").val();
			var eachPageNum = $("#eachPageNum2").val();
			var reg2 = /^[1-9]\d*$/;
			var allPage = $(".totalPage2").html();
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
					if (nowPageNum - allPage > 0) {
						alert("跳转页数必须小于总页数")
						return false;
					}
				}
			}
			return true;
		}

		function findFile(nowPageNum) {
			var eachPageNum = $("#eachPageNum2").val();
			if (eachPageNum == null || eachPageNum == "") {
				eachPageNum = 5;
				$("#eachPageNum2").val(5);
			}
			$
					.ajax({
						type : 'POST',
						data : {
							eachPageNum : eachPageNum,
							nowPageNum : nowPageNum
						},
						url : '${pageContext.request.contextPath}/file/findFile',
						dataType : "json",
						success : function(result) {
							$(".nowPage2").html(result.pageModel.nowPageNum);
							$(".totalPage2").html(result.pageModel.pageCount);
							$(".totalRecord2").html(result.pageModel.dataNum);
							$("#filetb tr:not(:first)").remove();
							var fileList = result.fileList;
							for (var i = 0; i < fileList.length; i++) {
								var file = fileList[i];
								var $tr = $("<tr></tr>");
								$tr.append("<td>" + (i+1) + "</td>");
								$tr.append("<td>" + file.fileName + "</td>");
								$tr.append("<td>" + file.fileType + "</td>");
								$tr.append("<td>" + file.createUser + "</td>");
								$tr.append("<td>" + file.createTime + "</td>");
								$tr.append("<td><a class='mr5' href='${pageContext.request.contextPath}/file/downLoad?fileName="+file.fileName+"'>下载</a>" 
										+ "<a href='javascript:void(0);' onclick='delFile(this)'>删除</a></td>");
								$tr.append("<td style='display:none;'>" + file.id + "</td>")
								$("#filetb").append($tr);
							}
						}
					});
		}
		
		function delFile(obj) {
			var flag = confirm("确定要删除此文件吗？");
			if(flag == true) {
				var id = $(obj).parent().parent().find("td").eq(6).text();
				$.ajax({
					type : 'post',
					data : {id : id},
					url : "${pageContext.request.contextPath}/file/delFile",
					dataType : "json",
					success : function(result) {
						if(result == 1) {
							alert("删除成功");
							findFile(1);
						} else {
							alert("删除失败");
						}
					}
				})
			}
		}
		
		function firstPage2() {
			var nowPageNum = 1;
			findFile(nowPageNum);
		}

		function prevPage2() {
			var nowPage = $(".nowPage2").html();
			if (nowPage > 1) {
				findFile(nowPage - 1);
			} else {
				$("#prevBtn2").prop("disabled", false);
			}
		}

		function nextPage2() {
			var nowPage = parseInt($(".nowPage2").html());
			var totalPage = $(".totalPage2").html();
			if (nowPage < totalPage) {
				findFile(nowPage + 1);
			} else {
				$("#nextBtn2").prop("disabled", false);
			}
		}

		function lastPage2() {
			var totalPage = $(".totalPage2").html();
			findFile(totalPage);
		}

		function goFile() {
			if (verifyNumber2()) {
				var nowPage = $("#nowPageNum2").val();
				$("#nowPageNum2").val("");
				if (nowPage == null || nowPage == "") {
					nowPage = 1;
				}
				findFile(nowPage);
			}
		}	 
	$(function() {
		$("#upAllLoadBtn").click(function() {
			var file = $("#file").val();
			if(file == null || file == "") {
				alert("请选择您要上传的文件");
				return;
			}
			 var uploadForm = new FormData(document.getElementById("uploadForm"));
				$.ajax({
	           type: "post",
	           data:uploadForm,
	           dataType: "json",
	           url : "${pageContext.request.contextPath}/file/upload",
	           processData:false,
	           contentType:false,
	           success:function(result){
					if(result == 1) {
						alert("上传成功");
						$("#file").val("");
						findFile(1);
					} else {
						alert("上传失败");
					}
				}   
			});  
		});
	});
		$(function() {
			findFile(1);
			var dialog_ryxx = new Dialog({
				target : '#ryxxBox',
				width : 660,
				height : 400,
				showYesBtn : true,
				showNoBtn : true,
				title : '查看人员',
				yesFn : function() {
					return;
				},
				noFn : function() {
					return;
				}
			});

			$('.ryxxBtn').bind('click', function() {
				dialog_ryxx.show();
			});
		});

		function upperCase() {
			var roleName = $("[name='roleName']").val();

			if (roleName == null || roleName == "") {
				alert("权限不能为空值")
				return;
			}
			alert("修改成功")
			$("[name='updateRoleForm']").submit();
		}
	</script>
</body>
</html>