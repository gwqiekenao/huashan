<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!doctype html>
<html lang="en">
<head>
	<title>系统管理_物资主数据</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width , initial-scale=1"/>
	<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
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
						<a >注销</a>
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
					我的位置：
					<a href="index.html">首页</a> <span class="dire_a">></span>
					<a href="">系统管理</a> <span class="dire_a">></span>
					<a class="curr" href="xtgl_wzzsj.html">物资主数据</a>
				</div>
				<!--搜索框-->
				<div class="searchCont">
					<table class="table_search">
						<tbody>
						<tr>
							<td width="80">物资编码</td>
							<td width="200">
								<input id="wzbm" class="field" type="text">
							</td>
							<td width="80">物资名称</td>
							<td width="200">
								<input id="wzmc" type="text" >
							</td>
							<td>物资类型</td>
							<td>
								<select class="dropdown wzlx" id="wzlx">
									<option value="">请选择</option>
									<c:forEach items="${sessionScope.fastAll}" var="fast">
										<c:if test="${fast.fastType == 'materialType'}">
										<option value="${fast.code}">${fast.codeName}</option>
										</c:if>
									</c:forEach>
								</select>
							</td>
							
						</tr>
						<tr>
							<td>关键物资</td>
							<td>
								<input type="checkbox" id="gjwz1" class="check gjOrNot"  onclick="xzgjwz()" checked>
								<input type="hidden" id="xzgjwz" value=0>
							</td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td colspan="2">
								<a class="btn clearBtn fr mr30" href="javascript:void(0)" onclick="empty()"><b></b>清空</a>
								<a class="btn queryBtn fr mr5" href="javascript:void(0)" onclick="query()"><b></b>查询</a>
							</td>
						</tr>
						</tbody>
					</table>
				</div>
				<div class="topTitle">
					<span><b></b>物资主数据</span>
					<div class="editCont">
						<ul class="editList">
							<li><a class="delBtn" href="#;" onclick="dels()"><b></b>批量删除</a></li>
							<li><a class="addBtn" href="${pageContext.request.contextPath }/xtgl_append" ><b></b>新增</a></li>
							<li><a class="excelBtn" id="export" onclick="exportExcel()"><b></b>导出EXCEL</a></li>
						</ul>
					</div>
				</div>
				<div class="tableBox">
					<table class="table_1">
						<thead>
						<tr>
							<th><input type="checkbox" id="selAll" class="allCheck"  onclick="selectAll()" ></th>
							<th>序号</th>
							<th>操作</th>
							<th>物资编码/设备编码</th>
							<th>物资名称/设备名称</th>
							<th>单位</th>
							<th>标准/图号</th>
							<th>概算单价(元)</th>
							<th>最后更新者</th>
							<th>更新日期</th>
							<th></th>
						</tr>
						</thead>
						<tbody id="xtgl_wzxx">
						
						</tbody>
					</table>
					<!--分页组件 -->
					<div class="pager">
						<ul class="pagerList">
							<li class="sel m_010">
								每页
								<select name="" class="dropdown num" id="xtgl_size" onchange="homePage()">
									<option value="5">5</option>
									<option value="10" selected>10</option>
									<option value="15">15</option>
									<option value="20">20</option>
								</select>
								条
							</li>
							<li><a class="btn firstBtn" href="javascript:void(0)" onclick="homePage()">首页</a></li>
							<li><button class="btn prevBtn"  onclick="previousPage()" id="mzsjlPrevious">上一页</button></li>
							<li><a class="btn nowPage" href="javascript:void(0)"><span class="now" id="xtgl_wzPage">1</span>/<span class="total" id="mzsj_totalPage">14</span></a></li>
							<li><button class="btn nextBtn" id="mzsjlNextPage" onclick="nextPage()">下一页</button></li>
							<li><a class="btn lastBtn" href="javascript:void(0)" onclick="backPage()">尾页</a></li>
							<li class="m_010">共<span class="totalRecord" id="xtgl_wzTotalPage">13</span>条记录</li>
							<li class="sel">
								跳转到
								<select name="" class="dropdown list" id="jumpPage" onchange="jumpPages()">
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
									<option value="5">5</option>
								</select>
								页
							</li>
							<!-- <li><a class="btn goBtn" href="#;">GO</a></li>
							<li><a class="btn freshBtn" href="#;"><b></b></a></li> -->
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<!--物资大类查询弹出框-->
<div id="wzdlBox" class="pop">
	<!--查询搜索-->
	<div class="search">
		<div class="topTitle">
			<span><b></b>查询条件</span>
		</div>
		<div class="searchCont">
			<table>
				<tr>
					<td width="90">物资大类编号</td>
					<td>
						<input id="wzdlbh" type="text">
					</td>
					<td width="90">物资大类名称</td>
					<td>
						<input id="wzdlmc" type="text">
					</td>
				</tr>
				<tr>
					<td colspan="4">
						<a class="btn clearSearchBtn fr mr30" href="#;"><b></b>清空</a>
						<a class="btn searchQueryBtn fr mr5" href="#;"><b></b>查询</a>
					</td>
				</tr>
			</table>
		</div>
	</div>
	<div class="result">
		<div class="topTitle">
			<span><b></b>查询结果</span>
		</div>
		<div class="tableBox">
			<table>
				<thead>
				<tr>
					<th><a class="allCheck" href="#;"></a></th>
					<th>序号</th>
					<th>物资大类编号</th>
					<th>物资大类名称</th>
				</tr>
				</thead>
				<tbody>
				<tr>
					<td><a class="check" href="#;"></a></td>
					<td>1</td>
					<td>WA20160927001</td>
					<td>不明物资1</td>
				</tr>
				<tr>
					<td><a class="check" href="#;"></a></td>
					<td>1</td>
					<td>WA20160927001</td>
					<td>不明物资1</td>
				</tr>
				<tr>
					<td><a class="check" href="#;"></a></td>
					<td>1</td>
					<td>WA20160927001</td>
					<td>不明物资1</td>
				</tr>
				<tr>
					<td><a class="check" href="#;"></a></td>
					<td>1</td>
					<td>WA20160927001</td>
					<td>不明物资1</td>
				</tr>
				<tr>
					<td><a class="check" href="#;"></a></td>
					<td>1</td>
					<td>WA20160927001</td>
					<td>不明物资1</td>
				</tr>
				<tr>
					<td><a class="check" href="#;"></a></td>
					<td>1</td>
					<td>WA20160927001</td>
					<td>不明物资1</td>
				</tr>
				<tr>
					<td><a class="check" href="#;"></a></td>
					<td>1</td>
					<td>WA20160927001</td>
					<td>不明物资1</td>
				</tr>
				<tr>
					<td><a class="check" href="#;"></a></td>
					<td>1</td>
					<td>WA20160927001</td>
					<td>不明物资1</td>
				</tr>
				<tr>
					<td><a class="check" href="#;"></a></td>
					<td>1</td>
					<td>WA20160927001</td>
					<td>不明物资1</td>
				</tr>
				</tbody>
			</table>
			<!--分页组件 -->
			<div class="pager">
				<ul class="pagerList">
					<li class="sel m_010">
						每页
						<select name="" class="dropdown num" id="">
							<option value="0">5</option>
							<option value="1">10</option>
							<option value="2">15</option>
							<option value="3">20</option>
						</select>
						条
					</li>
					<li><a class="btn firstBtn disable" href="#;">首页</a></li>
					<li><a class="btn prevBtn" href="#;">上一页</a></li>
					<li><a class="btn nowPage" href="#;"><span class="now">2</span>/<span class="total">14</span></a></li>
					<li><a class="btn nextBtn" href="#;">下一页</a></li>
					<li><a class="btn lastBtn" href="#;">尾页</a></li>
					<li class="m_010">共<span class="totalRecord">131</span>条记录</li>
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

<script type="text/javascript" src="<%=path%>/js/jquery.easydropdown.js"></script>
<script type="text/javascript" src="<%=path%>/js/dialog.js"></script>
<script type="text/javascript" src="<%=path%>/js/commen.js"></script>
<script type="text/javascript">
	$(function () {

		var dialog_wzdl=new Dialog({
			target:'#wzdlBox',
			width:660,
			height:620,
			showYesBtn:true,
			showNoBtn:true,
			title: '请选择',
			yesFn:function(){ return;},
			noFn:function(){ return;}
		});

		
		$('.wzdlBtn').bind('click',function(){
			dialog_wzdl.show();
		});
	});
	
	//设置当有一个没选时，全选为没有选中状态；当全部都选中时，全选为选中状态
	function selTr(obj) {
		if ($(obj).attr("checked")) {
			//判断选中的复选框个数与总个数是否相等
			if ($("input[name='material']:checked").length == $("input[name='material']").length) {
				$("#selAll").prop("checked", true);
			}
		} else {
			$("#selAll").prop("checked", false);
		}
	}
	
function exportExcel() {
		var checkboxs = $("input[name='material']:checked");
		var flag = confirm("确定要导出选中计划吗？");
		if (flag == true) {
			var expPurs = new Array();
			for (var i = 0; i < checkboxs.length; i++) {
				var curCheck = checkboxs.eq(i).parents("tr").find("td").eq(0).text();
				expPurs.push(curCheck);
			}
			if(expPurs != ""){
				window.location.href='${pageContext.request.contextPath}/xtgl/material_ReportExcel?expPurs='+expPurs;
			}else{
				window.location.href='${pageContext.request.contextPath}/xtgl/material_ReportExcel?expPurs=' + 0;
			}
			$("#selAll").prop("checked", false);
		}
	} 

	Date.prototype.Format = function (fmt) { //author: meizz 
	    var o = {
	        "M+": this.getMonth() + 1, //月份 
	        "d+": this.getDate(), //日 
	        "H+": this.getHours(), //小时 
	        "m+": this.getMinutes(), //分 
	        "s+": this.getSeconds(), //秒 
	        "q+": Math.floor((this.getMonth() + 3) / 3), 
	        "S": this.getMilliseconds()
	    };
	    if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
	    for (var k in o)
	    if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
	    return fmt;
	}

	//选择关键物资
	function xzgjwz(){
		if($("#xzgjwz").val() == 1){
			$("#xzgjwz").val(0);
		}else{
			$("#xzgjwz").val(1);
		}
	}
	
	function pagexx(){
		var keyMaterial = $("#xzgjwz").val();
		var materialCode = $("#wzbm").val();
		var materialName = $("#wzmc").val();
		var materialType = $("#wzlx").val();
		var size = parseInt($("#xtgl_size").val());
		var page = parseInt($("#xtgl_wzPage").text());
		var vo = {keyMaterial:keyMaterial,materialCode:materialCode,materialName:materialName,materialType:materialType,size:size,page:page};
		$('.wzRows').remove();
		$.ajax({
			type:'post',
			url:'${pageContext.request.contextPath}/xtgl_wzzsj',
			data:vo,
			success:function(data){
				//设置总页,总条数
			 	$("#xtgl_wzTotalPage").text(data.materialList.total);
				var totalPage = 0;
            	if(data.materialList.total % data.materialList.size != 0){
            		$("#mzsj_totalPage").text(Math.ceil(data.materialList.total / data.materialList.size));
            		totalPage = Math.ceil(data.materialList.total / data.materialList.size);
            	}else{
            		$("#mzsj_totalPage").text(data.materialList.total / data.materialList.size);
            		totalPage = data.materialList.total / data.materialList.size;
            	}
            	//判断上一页,下一页是否可用
            	if(totalPage == 1 || totalPage == 0){
            		$("#mzsjlNextPage").attr('disabled',"true");
            		$("#mzsjlPrevious").attr('disabled',"true");
            	}else if(data.materialList.page - totalPage >= 0){
            		$("#mzsjlNextPage").attr('disabled',"true");
            		$("#mzsjlPrevious").removeAttr("disabled");
            	}else if(data.materialList.page - 1 <= 0){
            		$("#mzsjlPrevious").attr('disabled',"true");
            		$("#mzsjlNextPage").removeAttr("disabled"); 
            	}else{
            		$("#mzsjlNextPage").removeAttr("disabled"); 
            		$("#mzsjlPrevious").removeAttr("disabled");
            		}  
            	var rows = data.materialList.rows;
            	var fast = data.fastAll;
            	var materialUnit = "";
            	for(var i = 0; i < rows.length; i++){
            		
            		for(var j = 0; j < fast.length; j++){
            			if(fast[j].code == rows[i].materialUnit){
            				materialUnit = fast[j].codeName;
            			}
            		}
            		//var newTime = new Date(rows[i].createTime);
            		var createDate = new Date(rows[i].createTime).Format("yyyy-MM-dd HH:mm:ss");
            		var cow = '<tr class="wzRows">';
            		cow += '<td style="display:none;">'+ rows[i].id +'</td>';
            		cow += '<td><input type="checkbox" name="material" onclick="selTr(this)"/></td>';
            		cow += '<input type="hidden" value='+ rows[i].id +'>';
            		cow += '<td>'+ parseInt(i+1) +'</td>';
            		cow += '<td>';
            		cow += '<a href="${pageContext.request.contextPath}/xtgl_wzzsj/materialModify?id='+ rows[i].id +'">修改</a>&nbsp';
            		cow += '<a class="delBtn" href="#;" onclick="del('+ rows[i].id +')">删除</a>';
            		cow += '</td>';
            		cow += '<td><a href="${pageContext.request.contextPath}/xtgl_wzzsj/materialView?id='+ rows[i].id +'">'+ rows[i].materialCode +'</a></td>';
            		cow += '<td>'+ rows[i].materialName +'</td>';
            		cow += '<td>'+ materialUnit +'</td>';
            		cow += '<td>'+ rows[i].standard +'</td>';
            		cow += '<td>'+ rows[i].estimateMoney +'</td>';
            		cow += '<td>'+ rows[i].createUser +'</td>';
            		cow += '<td>'+ createDate +'</td>';
            		cow += '<td></td>';
            		cow += '</tr>';
            		$("#xtgl_wzxx").append(cow);
            	} 
			}
		});
	}	
	
	//总查询
	function query(){
		$("#xtgl_wzPage").text(1);
		pagexx();
		$("#selAll").prop("checked", false);
	}
	
	//首页
	function homePage(){
		$("#xtgl_wzPage").text(1);
		pagexx();
		$("#selAll").prop("checked", false);
	}
	
	//跳转
	function jumpPages(){
		if($("#jumpPage").val() - $("#mzsj_totalPage").text() > 0){
			alert("没有此页");
		}else{
			$("#xtgl_wzPage").text(parseInt($("#jumpPage").val()));
			pagexx();
		}
		$("#selAll").prop("checked", false);
	}
	
	//尾页
	function backPage(){
		$("#xtgl_wzPage").text(parseInt($("#mzsj_totalPage").text()));
		pagexx();
		$("#selAll").prop("checked", false);
	}
	
	//上一页
	function previousPage(){
		$("#xtgl_wzPage").text(parseInt($("#xtgl_wzPage").text()) - 1);
		pagexx();
		$("#selAll").prop("checked", false);
	}
	
	//下一页
	function nextPage(){
		$("#xtgl_wzPage").text(parseInt($("#xtgl_wzPage").text()) + 1);
		pagexx();
		$("#selAll").prop("checked", false);
	}
	
	//清空
	function empty(){
		$("#wzbm").val("");
		$("#wzmc").val("");
		//$("#gjwz1").removeAttr("checked");
		//$("#xzgjwz").val(1);
		var currentSelect=$("#wzlx");
		currentSelect.val('');
		var tmpObj=currentSelect.parent().parent().find("span.selected");
		tmpObj.text('请选择');
	}
	
	//单个删除
	function del(id){		 
		var msg = "您真的确定要删除吗？\n\n请确认！";
		if (confirm(msg)==true){
			$.post("${pageContext.request.contextPath}/materialDel",{id:id},function(data){
				window.location.href = "${pageContext.request.contextPath}/xtgl_xtgl/contractList1";
			});
		}else{
		return false;
		}
	}
	
	//批量删除
	function dels(){
		var msg = "您真的确定要删除吗？\n\n请确认！";
		if (confirm(msg)==true){
			var ids = [];
			$('input:checkbox[name=material]:checked').each(function(k){
				var val = parseInt($(this).parent().next().val());
				ids.push(val);
			});
			if (ids.length > 0) {
				$.ajax({
					type:"post",
					url:"${pageContext.request.contextPath}/materialDels",
					traditional:true,
					//contentType: "application/json",
					data:{aa:ids},
					//dataType:"json",
					success:function(data){		 	 
					   	//var json = eval('(' + data + ')');
						window.location.href = "${pageContext.request.contextPath}/xtgl_xtgl/contractList1";
					},
					 error: function(XMLHttpRequest, textStatus, errorThrown){ alert(XMLHttpRequest.readyState + XMLHttpRequest.status + XMLHttpRequest.responseText); } 
				
				});
            }
		}else{
			return false;
			}
	}
	
	//设置全选或者全不选
	function selectAll() {
		if ($("#selAll").attr("checked")) {
			$("input[name='material']").prop("checked", true);
		} else {
			$("input[name='material']").prop("checked", false);
		}
	}
	
	window.onload = function(){
		pagexx();
	} 
	
</script>
</body>
</html>