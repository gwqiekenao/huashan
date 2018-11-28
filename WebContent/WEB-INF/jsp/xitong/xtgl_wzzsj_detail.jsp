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
	<title>系统管理_物资主数据(详情)</title>
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
					<table class="table_ht">
						<tbody>
						<tr>
							<td width="15%"><span class="notice">*</span>物资编号</td>
							<td width="35%">${materialInfo.materialCode }</td>
							<td width="15%"><span class="notice">*</span>物资名称 </td>
							<td width="35%">${materialInfo.materialName }</td>
						</tr>
						<tr>
							<td><span class="notice">*</span>单位</td>
							<td>
							<c:forEach items="${sessionScope.fastAll}" var="fast">
								<c:if test="${fast.code == materialInfo.materialUnit }">
									${fast.codeName}
								</c:if>
							</c:forEach>
							</td>
							<td><span class="notice">*</span>物资类型</td>
							<td>
							<c:forEach items="${sessionScope.fastAll}" var="fast">
								<c:if test="${fast.code == materialInfo.materialType }">
									${fast.codeName}
								</c:if>
							</c:forEach>
							</td>
						</tr>
						
						<tr>							
							<td>&nbsp;概算单价(元)</td>
							<td>${materialInfo.estimateMoney }</td>				
							<td>&nbsp;标准/图号</td>
							<td>${materialInfo.standard }</td>
							<td colspan="2"></td>
						</tr>
						<tr>
							<td>&nbsp;毛重</td>
								<td style="display:inline-block;width:42%;float:left;" id="mz" class="field" >${materialInfo.grossWeight }</td>
								<td style="display:inline-block;margin:0 10px;float:left;">单位</td>
								<c:forEach items="${sessionScope.fastAll}" var="fast">
								<c:if test="${fast.code == materialInfo.materialUnit }">
									<td style="display:inline-block;width:42%;float:left;" class="dw field" >${fast.codeName}</td>
								</c:if>
							</c:forEach>
							<td>&nbsp;净重</td>
								<td style="display:inline-block;width:42%;float:left;" id="jz" class="field">${materialInfo.netWeight }</td>
								<td style="display:inline-block;margin:0 10px;float:left;">单位</td>
								<c:forEach items="${sessionScope.fastAll}" var="fast">
									<c:if test="${fast.code == materialInfo.materialUnit }">
										<td style="display:inline-block;width:42%;float:left;" class="dw field" >${fast.codeName}</td>
									</c:if>
								</c:forEach>
						</tr>
						<tr>
							<td>&nbsp;物资有效日期</td>
							<td class="qxTd">
								<div class="input_search start">
									<form class="searchForm" action="">
										<input type="text" class="input_time field wzyxksrq" id="wzyxksrq" placeholder="${stratTime}" disabled>
										<b class="icon icon-date date"></b>
									</form>
								</div>
								<span style="margin-top:8px;">至</span>
								<div class="input_search end">
									<form class="searchForm" action="">
										<input type="text" class="input_time field wzyxjsrq" id="wzyxjsrq" placeholder="${endTime}" disabled>
										<b class="icon icon-date date"></b>
									</form>
								</div>
							</td>
							<td width="10%"><span class="notice">*</span>是否重要物资：</td>
							<td width="25%">
								<c:if test="${materialInfo.keyMaterial == 1 }">
									<input id="jfdlr" type="radio" name="keyMaterial" value=1 disabled="">
								<label for="jfdlr" class="mr10" >否</label>
								</c:if>
								<c:if test="${materialInfo.keyMaterial == 0 }">
									<input id="jffd" name="keyMaterial" type="radio" value=0 disabled="">
									<label for="jffd" class="mr10" >是</label>
								</c:if>
							</td>
						</tr>
						<tr>
							<td>&nbsp;备注</td>
							<td colspan="3">
								<span  id="beizhu"  >${materialInfo.materialRemark }</span>
							</td>
						</tr>
						</tbody>
					</table>
				</div>
				<div class="submitCont">
					<button class="returnBtn btn fr mr5" onclick="backWZSJ()">返回</button>
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
	
	function backWZSJ(){
		window.location.href = "${pageContext.request.contextPath}/xtgl_xtgl/contractList1"; 
	}
</script>
</body>
</html>