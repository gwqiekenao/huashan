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
	<title>系统管理_物资主数据(修改)</title>
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
				<div class="topTitle">
					<span><b></b>物资主数据信息</span>
				</div>
				<div class="tableBox">
				<form id="xtgl_append">
					<input type="hidden" name="createUser" value="${sessionScope.currentUser.userName}" />
					<input type="hidden" name="isFlag" value=0>
					<table class="table_ht">
						<tbody>
						<tr>
							<td width="15%"><span class="notice">*</span>物资编号</td>
							<td width="35%">
								${materialCode }
								<input type="hidden" value="${materialCode }" name="materialCode">
							</td>
							<td width="15%"><span class="notice" id="yzwzmc">*</span>物资名称 </td>
							<td width="35%">
								<input id="wzmc" type="text" value="" name="materialName" onblur="yzwzmc()">
							</td>
						</tr>
						<tr>
							<td><span class="notice" id="yzwzdw">*</span>单位</td>
							<td>
								<select class="dropdown htlx" id="wzdw" name="materialUnit" onblur="yzwzdw()">
									<option value="">请选择</option>
									<c:forEach items="${sessionScope.fastAll}" var="fast">
										<c:if test="${fast.fastType == 'materialUnit'}">
										<option value="${fast.code}">${fast.codeName}</option>
										</c:if>
									</c:forEach>
								</select>
							</td>
							<td><span class="notice" id="yzwzxh">*</span>物资类型</td>
							<td>
								<select class="dropdown htlx" id="wzxh" name="materialType" onblur="yzwzxh()">
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
							
							<td><span class="notice" id="yzgsdj">*</span>概算单价(元)</td>
							<td>
								<input id="gsdj" class="field" name="estimateMoney" type="number" value="" onblur="yzgsdj()">
							</td>

							<td><span class="notice" id="yzbzth">*</span>标准/图号</td>
							<td>
								<input id="wzxil" class="field" name="standard" type="text" value="" onblur="yzbzth()">
							</td>	
						</tr>
						
						<tr>
							<td><span class="notice" id="yzwzmz">*</span>毛重</td>
							<td>
								<input style="display:inline-block;width:42%;float:left;" id="mz" name="grossWeight" class="field" type="number" min="0" value="" onblur="yzwzmz()">
							</td>
							<td><span class="notice" id="yzwzjz">*</span>净重</td>
							<td>
								<input style="display:inline-block;width:42%;float:left;" id="jz" name="netWeight" class="field" type="number" min="0" value="" onblur="yzwzjz()">
							</td>
						</tr>
						<tr>
							<td><span class="notice" id="yzwzrq">*</span>物资有效日期</td>
							<td class="qxTd">
								<div class="input_search start">
									<div class="searchForm" action="">
										<input type="text" name="startTime1" class="input_time field wzyxksrq" id="wzyxksrq" >
										<b class="icon icon-date date"></b>
									</div>
								</div>
								<span style="margin-top:8px;">至</span>
								<div class="input_search end">
									<div class="searchForm" action="">
										<input type="text" name="endTime1" class="input_time field wzyxjsrq" id="wzyxjsrq" onblur="yzwzrq()">
										<b class="icon icon-date date"></b>
									</div>
								</div>
							</td>
							<td width="10%"><span class="notice">*</span>是否重要物资：</td>
							<td width="25%">
								<input id="jfdlr" type="radio" name="keyMaterial" value=1>
								<label for="jfdlr" class="mr10" >否</label>
								<input id="jffd" name="keyMaterial" type="radio" value=0 checked>
								<label for="jffd" class="mr10" >是</label>
							</td>
						</tr>
						<tr>
							<td><span class="notice" id="yzwzbz">*</span>备注</td>
							<td colspan="3">
								<textarea name="materialRemark" id="beizhu" cols="30" rows="5" onblur="yzwzbz()"></textarea>
							</td>
						</tr>
						</tbody>
					</table>
					</form>
				</div>
				<div class="submitCont">
					<button class="returnBtn btn fr mr5" type="button" onclick="backWZSJ()">返回</button>
					<button class="saveBtn btn fr mr5" type="button" onclick="appendMaterial()">提交</button>
				</div>
			</div>
		</div>
	</div>
</div>

<!--单位查询弹出框-->
<div id="dwBox" class="pop">
	<!--查询搜索-->
	<div class="search">
		<div class="topTitle">
			<span><b></b>查询条件</span>
		</div>
		<div class="searchCont">
			<table>
				<tr>
					<td width="80">值代码</td>
					<td>
						<input id="zdm" type="text">
					</td>
					<td width="80">含义</td>
					<td>
						<input id="meaning" type="text">
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
					<th>值代码</th>
					<th>含义</th>
				</tr>
				</thead>
				<tbody>
				<tr>
					<td><a class="check" href="#;"></a></td>
					<td>1</td>
					<td>ML</td>
					<td>毫升</td>
				</tr>
				<tr>
					<td><a class="check" href="#;"></a></td>
					<td>1</td>
					<td>ML</td>
					<td>毫升</td>
				</tr>
				<tr>
					<td><a class="check" href="#;"></a></td>
					<td>1</td>
					<td>ML</td>
					<td>毫升</td>
				</tr>
				<tr>
					<td><a class="check" href="#;"></a></td>
					<td>1</td>
					<td>ML</td>
					<td>毫升</td>
				</tr>
				<tr>
					<td><a class="check" href="#;"></a></td>
					<td>1</td>
					<td>ML</td>
					<td>毫升</td>
				</tr>
				<tr>
					<td><a class="check" href="#;"></a></td>
					<td>1</td>
					<td>ML</td>
					<td>毫升</td>
				</tr>
				<tr>
					<td><a class="check" href="#;"></a></td>
					<td>1</td>
					<td>ML</td>
					<td>毫升</td>
				</tr>
				<tr>
					<td><a class="check" href="#;"></a></td>
					<td>1</td>
					<td>ML</td>
					<td>毫升</td>
				</tr>
				<tr>
					<td><a class="check" href="#;"></a></td>
					<td>1</td>
					<td>ML</td>
					<td>毫升</td>
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
					<td width="80">编码</td>
					<td>
						<input id="bm" type="text">
					</td>
					<td width="80">名称</td>
					<td>
						<input id="mc" type="text">
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
					<th>编码</th>
					<th>名称</th>
				</tr>
				</thead>
				<tbody>
				<tr>
					<td><a class="check" href="#;"></a></td>
					<td>1</td>
					<td>140301</td>
					<td>主要材料</td>
				</tr>
				<tr>
					<td><a class="check" href="#;"></a></td>
					<td>1</td>
					<td>140301</td>
					<td>主要材料</td>
				</tr>
				<tr>
					<td><a class="check" href="#;"></a></td>
					<td>1</td>
					<td>140301</td>
					<td>主要材料</td>
				</tr>
				<tr>
					<td><a class="check" href="#;"></a></td>
					<td>1</td>
					<td>140301</td>
					<td>主要材料</td>
				</tr>
				<tr>
					<td><a class="check" href="#;"></a></td>
					<td>1</td>
					<td>140301</td>
					<td>主要材料</td>
				</tr>
				<tr>
					<td><a class="check" href="#;"></a></td>
					<td>1</td>
					<td>140301</td>
					<td>主要材料</td>
				</tr>
				<tr>
					<td><a class="check" href="#;"></a></td>
					<td>1</td>
					<td>140301</td>
					<td>主要材料</td>
				</tr>
				<tr>
					<td><a class="check" href="#;"></a></td>
					<td>1</td>
					<td>140301</td>
					<td>主要材料</td>
				</tr>
				<tr>
					<td><a class="check" href="#;"></a></td>
					<td>1</td>
					<td>140301</td>
					<td>主要材料</td>
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

<!--物资小类查询弹出框-->
<div id="wzxlBox" class="pop">
	<!--查询搜索-->
	<div class="search">
		<div class="topTitle">
			<span><b></b>查询条件</span>
		</div>
		<div class="searchCont">
			<table>
				<tr>
					<td width="80">编码</td>
					<td>
						<input id="bm" type="text">
					</td>
					<td width="80">名称</td>
					<td>
						<input id="mc" type="text">
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
					<th>编码</th>
					<th>名称</th>
				</tr>
				</thead>
				<tbody>
				<tr>
					<td><a class="check" href="#;"></a></td>
					<td>1</td>
					<td>140301</td>
					<td>主要材料</td>
				</tr>
				<tr>
					<td><a class="check" href="#;"></a></td>
					<td>1</td>
					<td>140301</td>
					<td>主要材料</td>
				</tr>
				<tr>
					<td><a class="check" href="#;"></a></td>
					<td>1</td>
					<td>140301</td>
					<td>主要材料</td>
				</tr>
				<tr>
					<td><a class="check" href="#;"></a></td>
					<td>1</td>
					<td>140301</td>
					<td>主要材料</td>
				</tr>
				<tr>
					<td><a class="check" href="#;"></a></td>
					<td>1</td>
					<td>140301</td>
					<td>主要材料</td>
				</tr>
				<tr>
					<td><a class="check" href="#;"></a></td>
					<td>1</td>
					<td>140301</td>
					<td>主要材料</td>
				</tr>
				<tr>
					<td><a class="check" href="#;"></a></td>
					<td>1</td>
					<td>140301</td>
					<td>主要材料</td>
				</tr>
				<tr>
					<td><a class="check" href="#;"></a></td>
					<td>1</td>
					<td>140301</td>
					<td>主要材料</td>
				</tr>
				<tr>
					<td><a class="check" href="#;"></a></td>
					<td>1</td>
					<td>140301</td>
					<td>主要材料</td>
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

<!--物资细类查询弹出框-->
<div id="wzxilBox" class="pop">
	<!--查询搜索-->
	<div class="search">
		<div class="topTitle">
			<span><b></b>查询条件</span>
		</div>
		<div class="searchCont">
			<table>
				<tr>
					<td width="80">编码</td>
					<td>
						<input id="bm" type="text">
					</td>
					<td width="80">名称</td>
					<td>
						<input id="mc" type="text">
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
					<th>编码</th>
					<th>名称</th>
				</tr>
				</thead>
				<tbody>
				<tr>
					<td><a class="check" href="#;"></a></td>
					<td>1</td>
					<td>140301</td>
					<td>主要材料</td>
				</tr>
				<tr>
					<td><a class="check" href="#;"></a></td>
					<td>1</td>
					<td>140301</td>
					<td>主要材料</td>
				</tr>
				<tr>
					<td><a class="check" href="#;"></a></td>
					<td>1</td>
					<td>140301</td>
					<td>主要材料</td>
				</tr>
				<tr>
					<td><a class="check" href="#;"></a></td>
					<td>1</td>
					<td>140301</td>
					<td>主要材料</td>
				</tr>
				<tr>
					<td><a class="check" href="#;"></a></td>
					<td>1</td>
					<td>140301</td>
					<td>主要材料</td>
				</tr>
				<tr>
					<td><a class="check" href="#;"></a></td>
					<td>1</td>
					<td>140301</td>
					<td>主要材料</td>
				</tr>
				<tr>
					<td><a class="check" href="#;"></a></td>
					<td>1</td>
					<td>140301</td>
					<td>主要材料</td>
				</tr>
				<tr>
					<td><a class="check" href="#;"></a></td>
					<td>1</td>
					<td>140301</td>
					<td>主要材料</td>
				</tr>
				<tr>
					<td><a class="check" href="#;"></a></td>
					<td>1</td>
					<td>140301</td>
					<td>主要材料</td>
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
<script type="text/javascript" src="<%=path%>/js/calendar.js"></script>
<script type="text/javascript" src="<%=path%>/js/dialog.js"></script>
<script type="text/javascript" src="<%=path%>/js/commen.js"></script>
<script type="text/javascript">

	!(function () {
		$('#wzyxksrq').click(function(e){
			e.stopPropagation();
			Calendar.show(this,{nextInput:'wzyxjsrq'});
		});

		$('#wzyxjsrq').click(function(e){
			e.stopPropagation();
			Calendar.show(this,{});
		});
	})();

	$(function () {

		var dialog_dw=new Dialog({
			target:'#dwBox',
			width:660,
			height:620,
			showYesBtn:true,
			showNoBtn:true,
			title: '请选择',
			yesFn:function(){ return;},
			noFn:function(){ return;}
		});

		$('.dwBtn').bind('click',function(){
			dialog_dw.show();
		});

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

		var dialog_wzxl=new Dialog({
			target:'#wzxlBox',
			width:660,
			height:620,
			showYesBtn:true,
			showNoBtn:true,
			title: '请选择',
			yesFn:function(){ return;},
			noFn:function(){ return;}
		});

		$('.wzxlBtn').bind('click',function(){
			dialog_wzxl.show();
		});

		var dialog_wzxil=new Dialog({
			target:'#wzxilBox',
			width:660,
			height:620,
			showYesBtn:true,
			showNoBtn:true,
			title: '请选择',
			yesFn:function(){ return;},
			noFn:function(){ return;}
		});

		$('.wzxilBtn').bind('click',function(){
			dialog_wzxil.show();
		});
	});
	
	//新增物资
	function appendMaterial(){
		var yzwzmc = $.trim($("#wzmc").val());
		var yzwzdw = $.trim($("#wzdw").val());
		var yzwzxh = $.trim($("#wzxh").val());
		var yzgsdj = $.trim($("#gsdj").val());
		var yzbzth = $.trim($("#wzxil").val());
		var yzwzmz = $.trim($("#mz").val());
		var yzwzjz = $.trim($("#jz").val());
		var wzyxksrq = $.trim($("#wzyxksrq").val());
		var wzyxjsrq = $.trim($("#wzyxjsrq").val());
		var yzwzbz = $.trim($("#beizhu").val());
		var sd = Date.parse(wzyxksrq);
		var ed = Date.parse(wzyxjsrq);
		if(yzwzmc == null || yzwzmc == ""){
			$("#yzwzmc").text("不能为空");
		}if(yzwzdw == null || yzwzdw == ""){
			$("#yzwzdw").text("不能为空");
		}if(yzwzxh == null || yzwzxh == ""){
			$("#yzwzxh").text("不能为空");
		}if(yzgsdj == null || yzgsdj == ""){
			$("#yzgsdj").text("不能为空");
		}if(yzbzth == null || yzbzth == ""){
			$("#yzbzth").text("不能为空");
		}if(yzwzmz == null || yzwzmz == ""){
			$("#yzwzmz").text("不能为空");
		}if(yzwzjz == null || yzwzjz == ""){
			$("#yzwzjz").text("不能为空");
		}if(yzwzbz == null || yzwzbz == ""){
			$("#yzwzbz").text("不能为空");
		}if(wzyxksrq == null || wzyxksrq == "" || wzyxjsrq == null || wzyxjsrq == ""){
			$("#yzwzrq").text("不能为空");
		}if(sd > ed){
			$("#yzwzrq").text("日期有误");
		}
		if(yzwzmc != null && yzwzmc != "" && yzwzdw != null && yzwzdw != "" && yzwzxh != null && yzwzxh != "" && yzgsdj != null && yzgsdj != "" && yzbzth != null && yzbzth != "" && yzwzmz != null && yzwzmz != "" && yzwzjz != null && yzwzjz != "" && wzyxksrq != null && wzyxksrq != "" && wzyxjsrq != null && wzyxjsrq != "" && sd < ed){
			$.post("${pageContext.request.contextPath}/xtgl_appendMaterial",$("#xtgl_append").serialize(),function(data){
			alert("物质新增成功！");
			window.location.href = "${pageContext.request.contextPath}/xtgl_xtgl/contractList1";
		});
		}	
	}
	
	//返回
	function backWZSJ(){
		window.location.href = "${pageContext.request.contextPath}/xtgl_xtgl/contractList1";
	}
	//---表单验证-----
	function yzwzmc(){
		var yzwzmc = $.trim($("#wzmc").val());
		if(yzwzmc == null || yzwzmc == ""){
			$("#yzwzmc").text("不能为空");
		}else{
			$("#yzwzmc").text("*");
		}
	}
	function yzwzdw(){
		var yzwzdw = $.trim($("#wzdw").val());
		if(yzwzdw == null || yzwzdw == ""){
			$("#yzwzdw").text("不能为空");
		}else{
			$("#yzwzdw").text("*");
		}
	}
	function yzwzxh(){
		var yzwzxh = $.trim($("#wzxh").val());
		if(yzwzxh == null || yzwzxh == ""){
			$("#yzwzxh").text("不能为空");
		}else{
			$("#yzwzxh").text("*");
		}
	}
	function yzgsdj(){
		var yzgsdj = $.trim($("#gsdj").val());
		if(yzgsdj == null || yzgsdj == ""){
			$("#yzgsdj").text("不能为空");
		}else{
			$("#yzgsdj").text("*");
		}
	}
	function yzbzth(){
		var yzbzth = $.trim($("#wzxil").val());
		if(yzbzth == null || yzbzth == ""){
			$("#yzbzth").text("不能为空");
		}else{
			$("#yzbzth").text("*");
		}
	}
	function yzwzmz(){
		var yzwzmz = $.trim($("#mz").val());
		if(yzwzmz == null || yzwzmz == ""){
			$("#yzwzmz").text("不能为空");
		}else{
			$("#yzwzmz").text("*");
		}
	}
	function yzwzjz(){
		var yzwzjz = $.trim($("#jz").val());
		if(yzwzjz == null || yzwzjz == ""){
			$("#yzwzjz").text("不能为空");
		}else{
			$("#yzwzjz").text("*");
		}
	}
	function yzwzbz(){
		var yzwzbz = $.trim($("#beizhu").val());
		if(yzwzbz == null || yzwzbz == ""){
			$("#yzwzbz").text("不能为空");
		}else{
			$("#yzwzbz").text("*");
		}
	}
	function yzwzrq(){
		var wzyxksrq = $.trim($("#wzyxksrq").val());
		var wzyxjsrq = $.trim($("#wzyxjsrq").val());
		var sd = Date.parse(wzyxksrq);
		var ed = Date.parse(wzyxjsrq);
		if(wzyxksrq == null || wzyxksrq == "" || wzyxjsrq == null || wzyxjsrq == ""){
			$("#yzwzrq").text("不能为空");
		}else if(sd > ed){
			$("#yzwzrq").text("日期有误");
		}else{
			$("#yzwzrq").text("*");
		}
	}
</script>
</body>
</html>