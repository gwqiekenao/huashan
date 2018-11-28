<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>采购管理_项目信息</title>
<base href="<%=basePath%>" />
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width , initial-scale=1" />
<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1" />
<link rel="stylesheet" type="text/css" href="<%=path%>/css/index.css" />
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
						我的位置： <a href="">采购信息</a> <span class="dire_a">></span> <a
							class="curr" href="cggl_xmxx.html">项目信息</a>
					</div>
					<table class="table_tree">
						<tr>

							<td class="operateTd">
								<!--操作区域-->
								<div class="operateCont">
									<!--搜索框-->
										<div class="searchCont">
											<label class="mr5" for="xmbh">项目编号</label> <input id="xmNum"
												type="text" 
												> <label
												class="margin10" for="xmmc">项目名称</label> <input id="xmmc"
												class="field" type="text" 
												> <a
												class="btn clearBtn fr mr5" href="javascript:void()"
												id="clearBtn"><b></b>清空</a> <a class="btn queryBtn fr mr5"
												href="javascript:void()" onclick="queryPro()"><b></b>查询</a>
										</div>

										<div class="topTitle">
											<span><b></b>项目信息</span>
											<div class="editCont">
												<ul class="editList">
													<li><a class="delBtn" href="javascript:void()"
														onclick="batchDelete()"><b></b>批量删除</a></li>
													<li><a class="addBtn" href="${pageContext.request.contextPath}/project/insert"><b></b>新增</a></li>
													<li><a class="excelBtn" id="export" onclick="exportExcel()"><b></b>导出EXCEL</a></li>
												</ul>
											</div>
										</div>
										<div class="tableBox">
											<table class="table_1" id="xmtb">
												<thead>
													<tr>
														<th><input type="checkbox" id="selAll"
															onclick="selectAll()" /></th>
														<th>序号</th>
														<th>操作</th>
														<th>项目编号</th>
														<th>项目名称</th>
														<th>项目类型</th>
														<th>项目经理</th>
														<th>项目经理电话</th>
														<th>提交人</th>
														<th>提交日期</th>
													</tr>
												</thead>
												<tbody>
												</tbody>
											</table>
											<!--分页组件 -->
				<div class="pager">
					<ul class="pagerList">
						<li>每页 <input id="eachPageNum" class="dropdown num"
							type="text"> 条
						</li>
						<li><a class="btn firstBtn" href="javascript:void()"
							onclick="firstPage()">首页</a></li>
						<li><a href="javascript:void()" class="btn prevBtn"
							onclick="prevPage()"> 上一页 </a></li>
						<li><span class="nowPage"></span>/ <span class="totalPage"></span></li>
						<li><a href="javascript:void()" class="btn nextBtn"
							onclick="nextPage()"> 下一页 </a></li>
						<li><a href="javascript:void()" class="btn lastBtn"
							onclick="lastPage()"> 尾页 </a></li>
						<li class="m_010">共<span class="totalRecord"></span>条记录
						</li>
						<li>跳转到<input id="nowPageNum" class="dropdown list"
							type="text">页
						</li>
						<li><a class="btn goBtn" href="javascript:void()"
							onclick="goPro()">GO</a></li>
					</ul>
				</div>
								</div>
								</div>
							</td>
						</tr>
					</table>
					<div style="clear: both;"></div>
				</div>
				<div class="footer">
					<a class="mr20" href="#;">Copyright&copy; All Rights Reserved</a> <a
						class="mr20" href="#;">铁建联和（北京）科技有限公司</a>
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
	<span style="display:none" id="msg">${msg}</span>

	<script type="text/javascript"
		src="<%=path%>/js/jquery.easydropdown.js"></script>
	<script type="text/javascript" src="<%=path%>/js/dialog.js"></script>
	<script type="text/javascript" src="<%=path%>/js/jquery.treeview.js"></script>
	<script type="text/javascript" src="<%=path%>/js/commen.js"></script>
	<script>
	
function exportExcel() {
		
		var checkboxs = $("input[name='sel']:checked");
		var flag = confirm("确定要导出选中计划吗？");
		if (flag == true) {
			var expPros = "";
			for (var i = 0; i < checkboxs.length; i++) {
				var curCheck = checkboxs.eq(i).parents("tr").find("td").eq(3).text();
				expPros += curCheck + ",";
			}
			window.location.href='${pageContext.request.contextPath}/caigou/project_ReportExcel?expPros='+expPros;
			$("#selAll").prop("checked", false);
		}
		
	} 
		!(function() {
			$("#xmxxTree").treeview();
		})();
		function verifyNumber() {
			var nowPageNum = $("#nowPageNum").val();
			var eachPageNum = $("#eachPageNum").val();
			var reg2 = /^[1-9]\d*$/;
			var allPage = $(".totalPage").html();
			if (eachPageNum != null && eachPageNum != "") {
				if (!reg2.test(eachPageNum)) {
					alert("每页显示条数必须为正整数");
					$("#eachPageNum").val("");
					return false;
				}
			}
			if (nowPageNum != null && nowPageNum != "") {
				if (!reg2.test(nowPageNum)) {
					alert("跳转页数必须为正整数");
					$("#nowPageNum").val("");
					return false;
				} else {
					if (nowPageNum - allPage > 0) {
						alert("跳转页数必须小于总页数");
						$("#nowPageNum").val("");
						return false;
					}
				}
			}
			return true;
		}

		function findPro(nowPageNum) {
			var projectCode = $("#xmNum").val();
			var projectName = $("#xmmc").val();
			var eachPageNum = $("#eachPageNum").val();
			if (eachPageNum == null || eachPageNum == "") {
				eachPageNum = 10;
				$("#eachPageNum").val(10);
			}
			$
					.ajax({
						type : 'POST',
						data : {
							projectCode : projectCode,
							projectName : projectName,
							eachPageNum : eachPageNum,
							nowPageNum : nowPageNum
						},
						url : '${pageContext.request.contextPath}/project/findPro',
						dataType : "json",
						success : function(result) {
							$(".nowPage").html(result.pageModel.nowPageNum);
							$(".totalPage").html(result.pageModel.pageCount);
							$(".totalRecord").html(result.pageModel.dataNum);
							$("#xmtb tr:not(:first)").remove();
							var projectList = result.projectList;
							var fastList = result.fastList;
							for (var i = 0; i < projectList.length; i++) {
								var pro = projectList[i];
								var proType;
								for(var j = 0; j < fastList.length; j++) {
									if(fastList[j].fastType == "projectType") {
										if(fastList[j].code == pro.projectType) {
											proType = fastList[j].codeName;
										}
									}
								}
								var $tr = $("<tr></tr>");
								$tr.append("<td>" +
								"<input type='checkbox' name='sel' onclick='selTr(this)'/>" + "</td>");
								$tr.append("<td>" + (i+1) + "</td>");
								$tr.append("<td><a class='mr5' href='${pageContext.request.contextPath}/project/proDetail?projectCode=" + pro.projectCode +"&flag=1'>查看</a>" 
											+ "<a class='mr5' href='${pageContext.request.contextPath}/project/update?id=" + pro.id +"'>修改</a>" 
											+ "<a class='delBtn' href='javascript:void(0);' onclick='del(this)'>删除</a></td>");
								$tr.append("<td>" + pro.projectCode + "</td>");
								$tr.append("<td>" + pro.projectName + "</td>");
								$tr.append("<td>" + proType + "</td>");
								$tr.append("<td>" + pro.projectManager + "</td>");
								$tr.append("<td>" + pro.managerTel + "</td>");
								$tr.append("<td>" + pro.createUser + "</td>");
								$tr.append("<td>" + pro.createTime + "</td>");
								$("#xmtb").append($tr);
										
							}
						}
					});
		}
		
		
		$(function(){
			findPro(1);
			var msg = $("#msg").html();
			if(msg != null && msg != "") {
				alert(msg);
			}
		})
		
		function firstPage() {
			var nowPageNum = 1;
			findPro(nowPageNum);
		}

		function prevPage() {
			var nowPage = $(".nowPage").html();
			if (nowPage > 1) {
				findPro(nowPage - 1);
			} else {
				$("#prevBtn").prop("disabled", false);
			}
		}

		function nextPage() {
			var nowPage = parseInt($(".nowPage").html());
			var totalPage = $(".totalPage").html();
			if (nowPage < totalPage) {
				findPro(nowPage + 1);
			} else {
				$("#nextBtn").prop("disabled", false);
			}
		}

		function lastPage() {
			var totalPage = $(".totalPage").html();
			findPro(totalPage);
		}

		function queryPro() {
			if (verifyNumber()) {
				var nowPage = 1;
				findPro(nowPage);
			}
		}

		function goPro() {
			if (verifyNumber()) {
				var nowPage = $("#nowPageNum").val();
				$("#nowPageNum").val("");
				if (nowPage == null || nowPage == "") {
					nowPage = 1;
				}
				findPro(nowPage);
			}
		}
		
		$(function(){
			$("#clearBtn").click(function(){
				$("#xmNum").val("");
				$("#xmmc").val("");
				findPro(1);
			});
		});

		function del(obj) {
			var code = $(obj).parent().parent().find("td").eq(3).text();
			var flag = confirm("确定要删除此项目吗？");
			if(flag == true) {
				deletePro(code);
			}
		}
		
		//批量删除
		function batchDelete() {
			var checkboxs = $("input[name='sel']:checked");
			if(checkboxs.length == 0) {
				alert("请至少选择一个项目");
				return;
			}
			var codes = "";
			var flag = confirm("确定要删除选中项目吗？");
			if (flag == true) {
				for ( var i = 0; i < checkboxs.length; i++) {
						codes += checkboxs.eq(i).parents("tr").find("td").eq(3)
								.text()+ ",";
				}
				deletePro(codes);
			}
		}
		
		function deletePro(projectCodes) {
			$.ajax({
				type : 'post',
				data : {projectCodes : projectCodes},
				url : '${pageContext.request.contextPath}/project/deletePros',
				dataType : 'json',
				success : function(result) {
					if(result == 1) {
						alert("删除成功");
						findPro(1);
					} else {
						alert("删除失败");
					}
					$("#selAll").prop("checked", false);
				}
			});
		}
		
		//设置全选或者全不选
		function selectAll() {
			if ($("#selAll").attr("checked")) {
				$("input[name='sel']").prop("checked", true);
			} else {
				$("input[name='sel']").prop("checked", false);
			}
		}

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
	</script>
</body>

</html>