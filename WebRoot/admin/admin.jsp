<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="zh-CN" class="ax-vertical-centered">
<head>
<meta charset="UTF-8">
<title>图书租赁系统</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap-theme.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap-admin-theme.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap-admin-theme.css">
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script
	src="${pageContext.request.contextPath}/jQuery/jquery-3.1.1.min.js"></script>
<script
	src="${pageContext.request.contextPath}/js/bootstrap-dropdown.min.js"></script>

<script src="${pageContext.request.contextPath}/ajax-lib/ajaxutils.js"></script>
<script src="${pageContext.request.contextPath}/js/adminUpdateInfo.js"></script>
<script src="${pageContext.request.contextPath}/js/adminUpdatePwd.js"></script>

</head>



<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>


<body class="bootstrap-admin-with-small-navbar">
	<nav
		class="navbar navbar-inverse navbar-fixed-top bootstrap-admin-navbar bootstrap-admin-navbar-under-small"
		role="navigation">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand"
				href="${pageContext.request.contextPath}/admin/admin.jsp"><i
				class="glyphicon glyphicon-fire"></i> <strong>图书租赁系统</strong></a>
		</div>
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li class="dropdown"><a href="#" role="button"
					class="dropdown-toggle" data-hover="dropdown">图书管理 <span
						class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a
							href="${pageContext.request.contextPath}/admin/bookManageAction_findBookByPage.action">图书管理</a></li>
						<li role="presentation" class="divider"></li>
						<li><a
							href="${pageContext.request.contextPath}/admin/bookTypeManageAction_findBookTypeByPage.action">图书分类管理</a></li>
					</ul></li>
				<li class="dropdown"><a href="#" role="button"
					class="dropdown-toggle" data-hover="dropdown">租赁管理 <span
						class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a
							href="${pageContext.request.contextPath}/admin/borrowManageAction_findBorrowInfoByPage.action">图书租赁</a></li>
						<li role="presentation" class="divider"></li>
						<li><a
							href="${pageContext.request.contextPath}/admin/backManageAction_findBackInfoByPage.action">图书归还</a></li>
						<li role="presentation" class="divider"></li>
						<li><a
							href="${pageContext.request.contextPath}/admin/borrowSearchAction_findBackInfoByPage.action">租赁查询</a></li>
						<li role="presentation" class="divider"></li>
						<li><a
							href="${pageContext.request.contextPath}/admin/forfeitManageAction_findForfeitInfoByPage.action">逾期处理</a></li>
					</ul></li>
				<li class="dropdown"><a href="#" role="button"
					class="dropdown-toggle" data-hover="dropdown">读者管理 <span
						class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a
							href="${pageContext.request.contextPath}/admin/readerManageAction_findReaderByPage.action">读者管理</a></li>
						<li role="presentation" class="divider"></li>
						<li><a
							href="${pageContext.request.contextPath}/admin/readerTypeManageAction_getAllReaderType.action">读者分类管理</a></li>
					</ul></li>
				<s:if test="#session.admin.authorization.superSet==1">
					<!-- 对超级管理员和普通管理员进行权限区分 -->
					<li><a
						href="${pageContext.request.contextPath}/admin/adminManageAction_findAdminByPage.action">管理员管理</a></li>
				</s:if>
				<li class="dropdown"><a href="#" role="button"
					class="dropdown-toggle" data-hover="dropdown"> <i
						class="glyphicon glyphicon-user"></i> <s:property
							value="#session.admin.name" /> <i class="caret"></i></a>
					<ul class="dropdown-menu">
						<li><a href="#updateinfo" data-toggle="modal">个人资料</a></li>
						<li role="presentation" class="divider"></li>
						<li><a href="#updatepwd" data-toggle="modal">修改密码</a></li>
						<li role="presentation" class="divider"></li>
						<!-- href="#identifier"  来指定要切换的特定的模态框（带有 id="identifier"）。-->
						<li><a
							href="${pageContext.request.contextPath}/adminLoginAction_logout.action">退出</a></li>
					</ul></li>
			</ul>
		</div>
	</div>
	</nav>


	<!-- content -->
	<div class="col-md-10">
		<div class="thumbnail">
			<img src="<c:url value="/img/index.jpg"></c:url>" />
			<div class="caption">
				<h3>新的一天开始了，</h3>
				<h5>图书租赁系统竭诚为您服务！</h5>
			</div>
		</div>
	</div>

	</div>
	</div>










	<!------------------------------修改密码模糊框-------------------------------->

	<form class="form-horizontal">
		<!--保证样式水平不混乱-->
		<!-- 模态框（Modal） -->
		<div class="modal fade" id="updatepwd" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title" id="myModalLabel">修改密码</h4>
					</div>

					<div class="modal-body">

						<!--正文-->
						<div class="form-group">
							<label for="firstname" class="col-sm-3 control-label">原密码</label>
							<div class="col-sm-7">
								<input type="password" class="form-control" id="oldPwd"
									placeholder="请输入原密码"> <label class="control-label"
									for="oldPwd" style="display: none;"></label>
							</div>
						</div>

						<div class="form-group">
							<label for="firstname" class="col-sm-3 control-label">新密码</label>
							<div class="col-sm-7">
								<input type="password" class="form-control" id="newPwd"
									placeholder="请输入新密码"> <label class="control-label"
									for="newPwd" style="display: none;"></label>
							</div>
						</div>

						<div class="form-group">
							<label for="firstname" class="col-sm-3 control-label">确认密码</label>
							<div class="col-sm-7">
								<input type="password" class="form-control" id="confirmPwd"
									placeholder="请输入确认密码"> <label class="control-label"
									for="confirmPwd" style="display: none;"></label>
							</div>
						</div>
						<!--正文-->


					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭
						</button>
						<button type="button" class="btn btn-primary" id="update_adminPwd">
							修改</button>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal -->
		</div>

	</form>
	<!-------------------------------------------------------------->









	<!-------------------------个人资料模糊框------------------------------------->

	<form class="form-horizontal">
		<!--保证样式水平不混乱-->
		<!-- 模态框（Modal） -->
		<div class="modal fade" id="updateinfo" tabindex="-1" role="dialog"
			aria-labelledby="ModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title" id="ModalLabel">个人资料</h4>
					</div>

					<div class="modal-body">

						<!--正文-->
						<div class="form-group">
							<label for="firstname" class="col-sm-3 control-label">用户名</label>
							<div class="col-sm-7">

								<input type="text" class="form-control" id="username"
									value='<s:property value="#session.admin.username"/>'>
								<label class="control-label" for="username"
									style="display: none;"></label>
							</div>
						</div>


						<div class="form-group">
							<label for="firstname" class="col-sm-3 control-label">真实姓名</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" id="name"
									placeholder="请输入您的真实姓名"
									value='<s:property value="#session.admin.name"/>'> <label
									class="control-label" for="name" style="display: none;"></label>
							</div>
						</div>

						<div class="form-group">
							<label for="firstname" class="col-sm-3 control-label">联系号码</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" id="phone"
									placeholder="请输入您的联系号码"
									value='<s:property value="#session.admin.phone"/>'> <label
									class="control-label" for="phone" style="display: none;"></label>
							</div>
						</div>

						<!--正文-->


					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭
						</button>
						<button type="button" class="btn btn-primary"
							id="admin_updateInfo">修改</button>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal -->
		</div>

	</form>
	<!-------------------------------------------------------------->




	<div class="modal fade" id="modal_info" tabindex="-1" role="dialog"
		aria-labelledby="addModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="infoModalLabel">提示</h4>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col-lg-12" id="div_info"></div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" id="btn_info_close"
						data-dismiss="modal">关闭</button>
				</div>
			</div>
		</div>
	</div>





</body>
</html>