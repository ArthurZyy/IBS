<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags"   prefix="s"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="zh-CN" class="ax-vertical-centered">
<head>
	<meta charset="UTF-8">
	<title>图书租赁系统</title>
	    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1"> 
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
	    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap-admin-theme.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap-admin-theme.css">
        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/jQuery/jquery-3.1.1.min.js"></script>
            <script src="${pageContext.request.contextPath}/js/bootstrap-dropdown.min.js"></script>
            
            <script src="${pageContext.request.contextPath}/ajax-lib/ajaxutils.js"></script>
            <script src="${pageContext.request.contextPath}/js/adminUpdateInfo.js"></script>
             <script src="${pageContext.request.contextPath}/js/adminUpdatePwd.js"></script>
			<script src="${pageContext.request.contextPath}/js/addReader.js"></script>
			
			<script src="${pageContext.request.contextPath}/js/updateReader.js"></script>
      	 <script src="${pageContext.request.contextPath}/js/deleteReader.js"></script>
      	 <script src="${pageContext.request.contextPath}/js/getAllReaderTypes.js"></script>
      	  <script src="${pageContext.request.contextPath}/js/getReader.js"></script>
      	      <script type="text/javascript" src="${pageContext.request.contextPath}/jQuery/ajaxfileupload.js"></script>
				 <script src="${pageContext.request.contextPath}/js/ajax_upload.js"></script>
				 
				  <script src="${pageContext.request.contextPath}/js/batchAddReader.js"></script>
				  <script src="${pageContext.request.contextPath}/js/exportReader.js"></script>
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

    <div class="container">
        <!-- left, vertical navbar & content -->
        <div class="row">
		  <!-- content -->
		            <div class="col-md-10">
		                <div class="row">
		                    <div class="col-lg-12">
		                        <div class="panel panel-default bootstrap-admin-no-table-panel">
		                            <div class="panel-heading">
		                                <div class="text-muted bootstrap-admin-box-title">读者管理</div>
		                            </div>
		                            <div class="bootstrap-admin-no-table-panel-content bootstrap-admin-panel-content collapse in">
		                                <form class="form-horizontal" action="${pageContext.request.contextPath}/admin/readerManageAction_queryReader.action" method="post">
		                                    <div class="col-lg-12 form-group">
			                                    <label class="col-lg-4 control-label" for="query_ano">
			                                    		<i class="glyphicon glyphicon-check"></i> 添加读者
			                                    </label>
			                                   <div class="col-lg-8 form-group">
			                                   		<button type="button" class="btn btn-default"   data-toggle="modal" data-target="#addModal">单个添加</button>
													<button type="button" class="btn btn-default"   data-toggle="modal" data-target="#batchAddModal">批量添加</button>
													<button type="button" class="btn btn-default" onclick="exportReader()">全部导出</button>
												</div>
											</div>
											<div class="col-lg-12">
													<h3> </h3>
		                                    		<label class="control-label" for="query_ano">
		                                    			<i class="glyphicon glyphicon-check"></i> 读者查询
		                                    		</label>
		                                    </div>
		                                    <div class="col-lg-5 form-group">
		                                        <label class="col-lg-4 control-label" for="query_sno">证件号</label>
		                                        <div class="col-lg-8">
		                                            <input class="form-control" id="readerId" type="text" value="" name="paperNO">
		                                            <label class="control-label" for="readerId" style="display: none;"></label>
		                                        </div>
		                                    </div>
		                                    <div class="col-lg-5 form-group">
		                                        <label class="col-lg-4 control-label" for="query_sname">姓名</label>
		                                        <div class="col-lg-8">
		                                            <input class="form-control" id="readerName" name="name"  type="text" value="">
		                                            <label class="control-label" for="readerName" style="display: none;"></label>
		                                        </div>
		                                    </div>
		                                    
		
		                                  
		                                   
		                                   
		                                   <div class="col-lg-5 form-group">
		                                        <label class="col-lg-4 control-label" for="query_bno11">读者类型</label>
		                                          <div class="col-lg-8">
		                                        <select class="form-control" id="readerType" name="readerType">
		                                            <option value="-1">请选择</option>
		                                            
		                                        </select>
		                                        
		                                    </div>
										</div>
		                                    
		                                     <div class="col-lg-1 form-group"></div>
		                                    
		                                    <div class="col-lg-2 form-group">
		                                        <button type="submit" class="btn btn-default" id="btn_query" onclick="query()">查询</button>
		                                        
		                                    </div>
		                                    
		                                </form>
		                            </div>
		                        </div>
		                    </div>
		                </div>
						               
			<div class="row">
                    <div class="col-lg-12">
                        <table id="data_list" class="table table-striped table-hover" cellspacing="0" width="100%">
                            <thead>
                            <tr>
                                <th>读者证件号</th>
                                <th>读者姓名</th>
                                <th>读者类型</th>
                                <th>联系号码</th>
                                <th>创建时间</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            
                            
                            <!---在此插入信息-->
                            <s:if test="#request.pb.beanList!=null">
                            <s:iterator value="#request.pb.beanList" var="reader">
                             <tbody>
	                         	   <td><s:property value="#reader.paperNO"/></td>
	                                <td><s:property value="#reader.name"/></td>
	                                 <td><s:property value="#reader.readerType.readerTypeName"/></td>
	                                <td><s:property value="#reader.phone"/></td>
	                                 <td><s:date name="#reader.createTime" format="yyyy-MM-dd" /></td>
	                                <td>
	                                  <button type="button" class="btn btn-link" data-toggle="modal" data-target="#findModal" onclick="getReaderInfo(<s:property value="#reader.readerId"/>)" >查看</button>
	                                	<button type="button" class="btn btn-link" data-toggle="modal" data-target="#updateModal" onclick="updateReader(<s:property value="#reader.readerId"/>)">修改</button>
	                                	<button type="button" class="btn btn-link" onclick="deleteReader(<s:property value="#reader.readerId"/>)">删除</button>
	                                		
	                               	</td>                                              
                          	  </tbody>
                            </s:iterator>
                            </s:if>
                            <s:else>
                            	<tbody>
	                         	   	<td>暂无数据</td>
	                                <td>暂无数据</td>
	                                <td>暂无数据</td>
	                                <td>暂无数据</td>
	                                <td>暂无数据</td>    
	                                <td>暂无数据</td>                                           
                          	  </tbody>
                            </s:else>
                            
                        </table>
                        
                        
                    <s:if test="#request.pb!=null">
					                    
					                    		   <%-- 定义页码列表的长度，5个长 --%>
								   <c:choose>
									<%-- 第一条：如果总页数<=5，那么页码列表为1 ~ totaPage 从第一页到总页数--%>
									<%--如果总页数<=5的情况 --%>
									  <c:when test="${pb.totaPage <= 5 }">
									    <c:set var="begin" value="1"/>
									    <c:set var="end" value="${pb.totaPage }"/>
									  </c:when>
									  <%--总页数>5的情况 --%>
									  <c:otherwise>
										  	<%-- 第二条：按公式计算，让列表的头为当前页-2；列表的尾为当前页+2 --%>
										  	<c:set var="begin" value="${pb.pageCode-2 }"/>
										    <c:set var="end" value="${pb.pageCode+2 }"/>
										    
										    <%-- 第三条：第二条只适合在中间，而两端会出问题。这里处理begin出界！ --%>
										    <%-- 如果begin<1，那么让begin=1，相应end=5 --%>
										    <c:if test="${begin<1 }">
										    	<c:set var="begin" value="1"/>
										    	<c:set var="end" value="5"/>
										    </c:if>
										    <%-- 第四条：处理end出界。如果end>tp，那么让end=tp，相应begin=tp-4 --%>
										    <c:if test="${end>pb.totaPage }">
										    	<c:set var="begin" value="${pb.totaPage-4 }"/>
										    	<c:set var="end" value="${pb.totaPage }"/>
										    </c:if>
									  </c:otherwise>
								</c:choose>
                    
                        
                        <div class="pull-right"><!--右对齐--->
                           <ul class="pagination">
                           <li class="disabled"><a href="#">第<s:property value="#request.pb.pageCode"/>页/共<s:property value="#request.pb.totaPage"/>页</a></li>
                           <li><a href="${pageContext.request.contextPath}/admin/readerManageAction_${pb.url }pageCode=1">首页</a></li>
                           <li><a href="${pageContext.request.contextPath}/admin/readerManageAction_${pb.url }pageCode=${pb.pageCode-1 }">&laquo;</a></li><!-- 上一页 -->
                           <%-- 循环显示页码列表 --%>
								<c:forEach begin="${begin }" end="${end }" var="i">
								  <c:choose>
								  <%--如果是当前页则设置无法点击超链接 --%>
								  	<c:when test="${i eq pb.pageCode }">							  	
								  			<li class="active"><a>${i }</a><li>							 
								  	</c:when>
								  	<c:otherwise>
								  		<li><a href="${pageContext.request.contextPath}/admin/readerManageAction_${pb.url }pageCode=${i}">${i}</a></li>
								  	</c:otherwise>
								  </c:choose>
								</c:forEach>
				        	   <%--如果当前页数没到总页数，即没到最后一页,则需要显示下一页 --%>
							  <c:if test="${pb.pageCode < pb.totaPage }">
								  <li><a href="${pageContext.request.contextPath}/admin/readerManageAction_${pb.url }pageCode=${pb.pageCode+1}">&raquo;</a></li>
							</c:if>
							<%--否则显示尾页 --%>
							<li><a href="${pageContext.request.contextPath}/admin/readerManageAction_${pb.url }pageCode=${pb.totaPage}">尾页</a></li>
							</ul>
                           </div>
                    </s:if>           
                    </div>
                </div>

    
    


		            </div>
	
                
                
                
                
                
                   <!-------------------------------------批量添加的模糊框------------------------>  
                                 <form class="form-horizontal">   <!--保证样式水平不混乱-->   
                                        <!-- 模态框（Modal） -->
									<div class="modal fade" id="batchAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
										<div class="modal-dialog">
											<div class="modal-content">
												<div class="modal-header">
													<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
														&times;
													</button>
													<h4 class="modal-title" id="myModalLabel">
														批量添加新读者
													</h4>
												</div>
												<div class="modal-body">
												
										<!---------------------表单-------------------->
										 <div class="form-group">
											<label for="firstname" class="col-sm-3 control-label">下载模板</label>
												<div class="col-sm-7" style="padding-top: 7px">
												  <a href="${pageContext.request.contextPath}/admin/FileDownloadAction.action?fileName=reader.xls">点击下载</a><br/>  
												</div>
										</div>
										
										<div class="form-group">	
											<label for="firstname" class="col-sm-3 control-label">上传文件</label>
											<div class="col-sm-7">
											 <label for="inputfile"></label>
										     <!--为了jquery获得basePath的值，必须写（如果没有更好的办法） -->
											<input type="hidden" value="<%=basePath%>" id="basePath"/>
											<input type="hidden" id="excel"/>
											<!--id是给jquery使用的，name是给后台action使用的，必须和后台的名字相同！！ -->
											<input type="file" id="upload" name="upload"/><br/>
											<label class="control-label" for="upload" style="display: none;"></label>	
										    
											</div>
										</div>
											
					
									
									</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-default" data-dismiss="modal">关闭
													</button>
													<button type="button" class="btn btn-default" id="batchAdd">
														添加
													</button>
												</div>
											</div><!-- /.modal-content -->
										</div><!-- /.modal -->
									</div>

                                 </form>	
 								<!--------------------------------------添加的模糊框------------------------>  
                
  
    
    
    
    
    
    
    
    
     <!--------------------------------------添加的模糊框------------------------>  
                                 <form class="form-horizontal">   <!--保证样式水平不混乱-->   
                                        <!-- 模态框（Modal） -->
									<div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
										<div class="modal-dialog">
											<div class="modal-content">
												<div class="modal-header">
													<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
														&times;
													</button>
													<h4 class="modal-title" id="myModalLabel">
														添加新读者
													</h4>
												</div>
												<div class="modal-body">
												
										<!---------------------表单-------------------->
										 <div class="form-group">
											<label for="firstname" class="col-sm-3 control-label">读者证件号</label>
												<div class="col-sm-7">
													<input type="text" class="form-control" id="addPaperNO"  placeholder="请输入读者证件号">
												 <label class="control-label" for="addPaperNO" style="display: none;"></label>
												</div>
										</div>
											
					
											
										<div class="form-group">	
											<label for="firstname" class="col-sm-3 control-label">真实姓名</label>
												<div class="col-sm-7">
													<input type="text" class="form-control" id="addName"  placeholder="请输入读者真实姓名">
												 <label class="control-label" for="addName" style="display: none;"></label>
												</div>
										</div>
										
										
																	
										<div class="form-group">	
											<label for="firstname" class="col-sm-3 control-label">联系电话</label>
												<div class="col-sm-7">
													<input type="text" class="form-control" id="addPhone"  placeholder="请输入读者联系电话">
												 <label class="control-label" for="addPhone" style="display: none;"></label>
												</div>
										</div>
										
										<div class="form-group">	
											<label for="firstname" class="col-sm-3 control-label">邮箱</label>
												<div class="col-sm-7">
													<input type="text" class="form-control" id="addEmail"  placeholder="请输入读者邮箱">
												 <label class="control-label" for="addEmail" style="display: none;"></label>
												</div>
										</div>
										<div class="form-group">	
											<label for="firstname" class="col-sm-3 control-label">读者类型</label>
												<div class="col-sm-7">
													  <select class="form-control" id="addreaderType">
		                                          		  <option value="-1">请选择</option>
			                                       	 </select>
												 <label class="control-label" for="addreaderType" style="display: none;"></label>
												</div>
										</div>
										
										<!---------------------表单-------------------->
									</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-default" data-dismiss="modal">关闭
													</button>
													<button type="button" class="btn btn-default" id="addReader">
														添加
													</button>
												</div>
											</div><!-- /.modal-content -->
										</div><!-- /.modal -->
									</div>

                                 </form>	
 								<!--------------------------------------添加的模糊框------------------------>  
 
 
 
 
     
                                     <!-- 修改模态框（Modal） -->
                                     <!-------------------------------------------------------------->  
                                
                                        <!-- 修改模态框（Modal） -->
                               <form class="form-horizontal">   <!--保证样式水平不混乱-->   
									<div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="updateModalLabel" aria-hidden="true">
										<div class="modal-dialog">
											<div class="modal-content">
												<div class="modal-header">
													<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
														&times;
													</button>
													<h4 class="modal-title" id="updateModalLabel">
														修改读者信息
													</h4>
												</div>
												<div class="modal-body">
												
										<!---------------------表单-------------------->
											
										<div class="form-group">	
											<label for="firstname" class="col-sm-3 control-label">读者证件号</label>
												<div class="col-sm-7">
													<input type="hidden" id="updateReaderID">
													<input type="text" class="form-control" id="updatePaperNO" placeholder="请输入读者证件号">
												 <label class="control-label" for="updatePaperNO" style="display: none;"></label>
												</div>
										</div>
											
										<div class="form-group">	
											<label for="firstname" class="col-sm-3 control-label">真实姓名</label>
												<div class="col-sm-7">
													<input type="text" class="form-control" id="updateName"  placeholder="请输入读者真实姓名">
												<label class="control-label" for="updateName" style="display: none;"></label>
												</div>
										</div>
										
										
										<div class="form-group">	
											<label for="firstname" class="col-sm-3 control-label">联系电话</label>
												<div class="col-sm-7">
													<input type="text" class="form-control" id="updatePhone"  placeholder="请输入读者联系电话">
												<label class="control-label" for="updatePhone" style="display: none;"></label>
												</div>
										</div>
										<div class="form-group">	
											<label for="firstname" class="col-sm-3 control-label">邮箱</label>
												<div class="col-sm-7">
													<input type="text" class="form-control" id="updateEmail"  placeholder="请输入读者邮箱">
													<label class="control-label" for="updateEmail" style="display: none;"></label>
												</div>
										</div>
										
										
										
										<div class="form-group">	
											<label for="firstname" class="col-sm-3 control-label">读者类型</label>
												<div class="col-sm-7">
													  <select class="form-control" id="updateReaderType">
		                                         	   <option value="-1">请选择</option>
		                                       		 </select>
												<label class="control-label" for="updateReaderType" style="display: none;"></label>
												</div>
										</div>
										
										
										<!---------------------表单-------------------->
															
										</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-default" data-dismiss="modal">关闭
													</button>
													<button type="button" class="btn btn-default" id="updateReader">
														修改
													</button>
												</div>
											</div><!-- /.modal-content -->
										</div><!-- /.modal -->
									</div>
	
                                 </form>
                                   <!-------------------------------------------------------------->
 
    
    
    
    
 
 
 
 
    
    <!------------------------------修改密码模糊框-------------------------------->  
                 
                   <form class="form-horizontal">   <!--保证样式水平不混乱-->                  
                                     <!-- 模态框（Modal） -->
				<div class="modal fade" id="updatepwd" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
									&times;
								</button>
								<h4 class="modal-title" id="myModalLabel">
									修改密码
								</h4>
							</div>
							
							<div class="modal-body">
							 
								<!--正文-->
							<div class="form-group">
								<label for="firstname" class="col-sm-3 control-label">原密码</label>
								<div class="col-sm-7">
									<input type="password" class="form-control" id="oldPwd"  placeholder="请输入原密码">
										<label class="control-label" for="oldPwd" style="display: none;"></label>		
								</div>
							</div>	
							
							<div class="form-group">
								<label for="firstname" class="col-sm-3 control-label">新密码</label>
								<div class="col-sm-7">
									<input type="password" class="form-control" id="newPwd"  placeholder="请输入新密码">
											<label class="control-label" for="newPwd" style="display: none;"></label>				
								</div>
							</div>	
							
							<div class="form-group">
								<label for="firstname" class="col-sm-3 control-label">确认密码</label>
								<div class="col-sm-7">
									<input type="password" class="form-control" id="confirmPwd"  placeholder="请输入确认密码">
												<label class="control-label" for="confirmPwd" style="display: none;"></label>	
								</div>
							</div>	
								<!--正文-->
								
								
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default" data-dismiss="modal">关闭
								</button>
								<button type="button" class="btn btn-default" id="update_adminPwd">
									修改
								</button>
							</div>
						</div><!-- /.modal-content -->
					</div><!-- /.modal -->
				</div>

				</form>	
                                   <!-------------------------------------------------------------->
                                   
                                   
                                   
                                   
                                   
                                   
                                   
                                   
                                   
                                   <!-------------------------个人资料模糊框------------------------------------->  
                 
                   <form class="form-horizontal">   <!--保证样式水平不混乱-->                  
                                     <!-- 模态框（Modal） -->
				<div class="modal fade" id="updateinfo" tabindex="-1" role="dialog" aria-labelledby="ModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
									&times;
								</button>
								<h4 class="modal-title" id="ModalLabel">
									个人资料
								</h4>
							</div>
							
							<div class="modal-body">
							 
								<!--正文-->
							<div class="form-group">
								<label for="firstname" class="col-sm-3 control-label">用户名</label>
								<div class="col-sm-7">
									<input type="text" class="form-control" id="username"  value='<s:property value="#session.admin.username"/>'>
											<label class="control-label" for="username" style="display: none;"></label>	
								</div>
							</div>				
								
								
							<div class="form-group">
								<label for="firstname" class="col-sm-3 control-label">真实姓名</label>
								<div class="col-sm-7">
									<input type="text" class="form-control" id="name"  placeholder="请输入您的真实姓名" value='<s:property value="#session.admin.name"/>'>
													<label class="control-label" for="name" style="display: none;"></label>	
								</div>
							</div>	
							
							<div class="form-group">
								<label for="firstname" class="col-sm-3 control-label">联系号码</label>
								<div class="col-sm-7">
									<input type="text" class="form-control" id="phone"  placeholder="请输入您的联系号码" value='<s:property value="#session.admin.phone"/>'>
												<label class="control-label" for="phone" style="display: none;"></label>	
								</div>
							</div>	
							
								<!--正文-->
								
								
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default" data-dismiss="modal">关闭
								</button>
								<button type="button" class="btn btn-default" id="admin_updateInfo" >
									修改
								</button>
							</div>
						</div><!-- /.modal-content -->
					</div><!-- /.modal -->
				</div>

				</form>	
                                   <!-------------------------------------------------------------->
    
    
    
    
				    <div class="modal fade" id="modal_info" tabindex="-1" role="dialog" aria-labelledby="addModalLabel">
				    <div class="modal-dialog" role="document">
				        <div class="modal-content">
				            <div class="modal-header">
				                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				                <h4 class="modal-title" id="infoModalLabel">提示</h4>
				            </div>
				            <div class="modal-body">
				                <div class="row">
				                    <div class="col-lg-12" id="div_info"></div>
				                </div>
				            </div>
				            <div class="modal-footer">
				                <button type="button" class="btn btn-default" id="btn_info_close" data-dismiss="modal">关闭</button>
				            </div>
				        </div>
				    </div>
				</div>
				    
    
 
    <!--------------------------------------查看的模糊框------------------------>  
                                 <form class="form-horizontal">   <!--保证样式水平不混乱-->   
                                        <!-- 模态框（Modal） -->
									<div class="modal fade" id="findModal" tabindex="-1" role="dialog" aria-labelledby="findModalLabel" aria-hidden="true">
										<div class="modal-dialog">
											<div class="modal-content">
												<div class="modal-header">
													<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
														&times;
													</button>
													<h4 class="modal-title" id="findModalLabel">
														查看读者信息
													</h4>
												</div>
												<div class="modal-body">
												
										<!---------------------表单-------------------->
										<div class="form-group">
											<label for="firstname" class="col-sm-3 control-label">读者证件号</label>
												<div class="col-sm-7">
													<input type="text" class="form-control" id="findPaperNO" readonly="readonly">
												
												</div>
										</div>
										 <div class="form-group">
											<label for="firstname" class="col-sm-3 control-label">读者姓名</label>
												<div class="col-sm-7">
													<input type="text" class="form-control" id="findReaderName"  readonly="readonly">
												
												</div>
										</div>
											
										<div class="form-group">	
											<label for="firstname" class="col-sm-3 control-label">读者类型</label>
											<div class="col-sm-7">
												<input type="text" class="form-control" id="findReaderType"  readonly="readonly">
												
											</div>
										</div>
											
										
										
										<div class="form-group">	
											<label for="firstname" class="col-sm-3 control-label">联系号码</label>
												<div class="col-sm-7">
													<input type="text" class="form-control" id="findPhone"  readonly="readonly">
												
												</div>
										</div>
										
										
										<div class="form-group">	
											<label for="firstname" class="col-sm-3 control-label">邮箱</label>
												<div class="col-sm-7">
													<input type="text" class="form-control" id="findEmail"  readonly="readonly">
												
												</div>
										</div>
										
										<div class="form-group">	
											<label for="firstname" class="col-sm-3 control-label">操作管理员</label>
												<div class="col-sm-7">
													<input type="text" class="form-control" id="findAdmin"  readonly="readonly">
												
												</div>
										</div>
										
										
										<!---------------------表单-------------------->
									</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-default" data-dismiss="modal">关闭
													</button>
												</div>
											</div><!-- /.modal-content -->
										</div><!-- /.modal -->
									</div>

                                 </form>	
 								<!--------------------------------------查看的模糊框------------------------>  
 

 
</body>
</html>
