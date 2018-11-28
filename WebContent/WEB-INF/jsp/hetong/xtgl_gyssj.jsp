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
	<title>系统管理_供应商主数据</title>

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
				<!--搜索框-->
				<div class="searchCont">
					<label class="margin10" for="gysbm">供应商编码</label>
					<input id="gysbm" class="field" type="text">
					<label class="margin10" for="gysmc">供应商名称</label>
					<input id="gysmc" class="field" type="text">
					<span class="margin10">供应商类型</span>
					<select class="dropdown" id="gyslx" name='suppType'>
						<option value="">请选择</option> 
						<c:forEach items="${sessionScope.fastAll}" var="fast">
							<c:if test="${fast.fastType == 'supplierType'}">
							<option value="${fast.code}">
							${fast.codeName}</option>
							</c:if>
						</c:forEach>
					</select>
					<a class="btn clearBtn fr mr5" id="clearBtn" href="javaScript:void(0);"><b></b>清空</a>
					<a class="btn queryBtn fr mr5" href="javaScript:void(0);" onclick="querySupplier()"><b></b>查询</a>
				</div>
				<div class="topTitle">
											<span><b></b>供应商主数据</span>
											<div class="editCont">
												<ul class="editList">
													<li><a class="delBtn" href="javascript:void()"
														onclick="batchDelete()"><b></b>批量删除</a></li>
													<li><a class="addBtn" href="${pageContext.request.contextPath}/supplier/addSupp"><b></b>新增</a></li>
													<li><a class="excelBtn" id="export" onclick="exportExcel()"><b></b>导出EXCEL</a></li>
												</ul>
											</div>
										</div>
				<div class="tableBox">
					<table class="table_1" id="gystb">
						<thead>
						<tr>
							<th><input type="checkbox" id="selAll"
								onclick="selectAll()" /></th>
							<th>序号</th>
							<th>操作</th>
							<th>供应商编号</th>
							<th>供应商名称</th>
							<th>供应商类型</th>
							<th>营业执照注册号</th>
							<th>组织机构代码</th>
							<th>提交人</th>
							<th>提交时间</th>
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
							onclick="goSupplier()">GO</a></li>
					</ul>
				</div>
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
<span style="display:none" id="msg">${msg}</span>

<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.easydropdown.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/commen.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/dialog.js"></script>
<script type="text/javascript">
function exportExcel() {
	
	var checkboxs = $("input[name='sel']:checked");
	var flag = confirm("确定要导出选中计划吗？");
	if (flag == true) {
		var expSupps = "";
		for (var i = 0; i < checkboxs.length; i++) {
			var curCheck = checkboxs.eq(i).parents("tr").find("td").eq(3).text();
			expSupps += curCheck + ",";
		}
		window.location.href='${pageContext.request.contextPath}/hetong/supplier_ReportExcel?expSupps='+expSupps;
		$("#selAll").prop("checked", false);
	}
}

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

function findSupplier(nowPageNum) {
	var supplierCode = $("#gysbm").val();
	var supplierName = $("#gysmc").val();
	var supplierType = $("#gyslx").val();
	var eachPageNum = $("#eachPageNum").val();
	if (eachPageNum == null || eachPageNum == "") {
		eachPageNum = 10;
		$("#eachPageNum").val(10);
	}
	$.ajax({
				type : 'POST',
				data : {
					supplierCode :supplierCode,
					supplierName : supplierName,
					supplierType : supplierType,
					eachPageNum : eachPageNum,
					nowPageNum : nowPageNum
				},
				url : '${pageContext.request.contextPath}/supplier/findSupplier',
				dataType : "json",
				success : function(result) {
					$(".nowPage").html(result.pageModel.nowPageNum);
					$(".totalPage").html(result.pageModel.pageCount);
					$(".totalRecord").html(result.pageModel.dataNum);
					$("#gystb tr:not(:first)").remove();
					var supplierList = result.supplierList;
					var fastList = result.fastList;
					for (var i = 0; i < supplierList.length; i++) {
						var sup = supplierList[i];
						var supType;
						for(var j = 0; j < fastList.length; j++) {
							if(fastList[j].fastType == "supplierType") {
								if(fastList[j].code == sup.supplierType) {
									supType = fastList[j].codeName;
								}
							}
						}
						var $tr = $("<tr></tr>");
						$tr.append("<td>" +
								"<input type='checkbox' name='sel' onclick='selTr(this)'/>" + "</td>");
						$tr.append("<td>" + (i+1) + "</td>");
						$tr.append("<td><a class='mr5' href='${pageContext.request.contextPath}/supplier/supplierDetail?supplierCode=" + sup.supplierCode +"'>查看</a>" 
								+ "<a class='mr5' href='${pageContext.request.contextPath}/supplier/updateSupp?supplierCode=" + sup.supplierCode +"'>修改</a>" 
								+ "<a class='delBtn' href='javascript:void(0);' onclick='del(this)'>删除</a></td>");
						$tr.append("<td>" + sup.supplierCode +"</td>");
						$tr.append("<td>" + sup.supplieName + "</td>");
						$tr.append("<td>" + supType + "</td>");
						$tr.append("<td>" + sup.license + "</td>");
						$tr.append("<td>" + sup.organiztion + "</td>");
						$tr.append("<td>" + sup.createUser + "</td>");
						$tr.append("<td>" + sup.createTime + "</td>");
						$("#gystb").append($tr);
					}
				}
			});
}


$(function(){
	findSupplier(1);
	var msg = $("#msg").html();
	if(msg != null && msg != "") {
		alert(msg);
	}
});

function firstPage() {
	findSupplier(1);
}

function prevPage() {
	var nowPage = $(".nowPage").html();
	if (nowPage > 1) {
		findSupplier(nowPage - 1);
	} else {
		$("#prevBtn").prop("disabled", false);
	}
}

function nextPage() {
	var nowPage = parseInt($(".nowPage").html());
	var totalPage = $(".totalPage").html();
	if (nowPage < totalPage) {
		findSupplier(nowPage + 1);
	} else {
		$("#nextBtn").prop("disabled", false);
	}
}

function lastPage() {
	var totalPage = $(".totalPage").html();
	findSupplier(totalPage);
}

function querySupplier() {
	if (verifyNumber()) {
		findSupplier(1);
	}
}

function goSupplier() {
	if (verifyNumber()) {
		var nowPage = $("#nowPageNum").val();
		$("#nowPageNum").val("");
		if (nowPage == null || nowPage == "") {
			nowPage = 1;
		}
		findSupplier(nowPage);
	}
}

$(function(){
	$("#clearBtn").click(function(){
		$("#gysbm").val("");
		$("#gysmc").val("");
		var currentSelect=$("select[name='suppType']");
		currentSelect.val('请选择');
		var tmpObj=currentSelect.parent().parent().find("span.selected");
		tmpObj.text('请选择');
		findSupplier(1);
	});
});

function del(obj) {
	var code = $(obj).parent().parent().find("td").eq(3).text();
	var flag = confirm("确定要删除此供应商吗？");
	if(flag == true) {
		deleteSupp(code);
	}
}

//批量删除
function batchDelete() {
	var checkboxs = $("input[name='sel']:checked");
	if(checkboxs.length == 0) {
		alert("请至少选择一个供应商");
		return;
	}
	var codes = "";
	var flag = confirm("确定要删除选中供应商吗？");
	if (flag == true) {
		for ( var i = 0; i < checkboxs.length; i++) {
			codes += checkboxs.eq(i).parents("tr").find("td").eq(3)
					.text() + ",";
		}
		deleteSupp(codes);
	}
}


function deleteSupp(supplierCodes) {
	$.ajax({
		type : 'post',
		data : {supplierCodes : supplierCodes},
		url : '${pageContext.request.contextPath}/supplier/deleteSupp',
		dataType : 'json',
		success : function(result) {
			if(result == 1) {
				alert("删除成功");
				findSupplier(1);
			} else {
				alert("删除失败");
			}
			$("#selAll").prop("checked", false);
			$("input[name='sel']").prop("checked", false);
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