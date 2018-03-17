<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/layouts/base.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>添加教师</title>
    <link rel="stylesheet" href="${ctxsta}/common/bootstrap-table-master/bootstrap-table.min.css" />

  </head>
  
  <body class="gray-bg">
    <div class="wrapper add-member-content animated fadeInRight" style="width:800px;" >
        <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-content">
                        <form id="categoryhasteacherform" class="form-horizontal" >
                            <div class="form-group m-t">
                            	<label class="col-sm-2 control-label">已选择：</label>
								<div class="col-sm-2">
                                	<input type="text" class="form-control" id="teacherName" readonly="readonly" name="teacherName">
                                	<input type="hidden" class="form-control" name="categoryhasteacher.teacherId" id="teacherid">
	                                <input type="hidden" class="form-control" name="categoryhasteacher.teachercategoryId" id="teachercategoryid" value="${teachercategory.id }">
                                </div>
								<label class="col-sm-2 control-label">排序：</label>
								<div class="col-sm-2">
                                	<input type="text" class="form-control" id="rank" name="categoryhasteacher.rank">
                                </div>  
								<div class="col-sm-4">
                                	<button class="btn btn-primary" type="button" id="submit">提交</button>
	                                <button class="btn btn-primary" type="button" onclick="reset1()">重置</button>
                                </div>  
                            </div>
                            </form>
                     </div>
                        
                    </div>
                    <div class="ibox-content">
                        <div class="row row-lg">
                            <div class="col-sm-12">
                                <div class="example-wrap">
                                    <div class="example">
                                        <div id="toolbar" class="btn-group m-t-sm">
                                            
                                        </div>
                                        <table id="table"
                                           data-toggle="table"
                                           data-height="500"
                                           data-search="true"
                                           data-show-refresh="true"
                                           data-show-toggle="true"
                                           data-show-export="true"
                                           data-show-pagination-switch="true"
                                           data-show-columns="true"
                                           data-striped="true"
                                           data-pagination="true"
                                           data-sort-name="stargazers_count"
                                           data-sort-order="desc"
                                           data-toolbar="#toolbar">
                                        <thead>
                                        <tr>
                                            <th data-halign="center" data-align="center" data-sortable="true">用户名</th>
                                            <th data-halign="center" data-align="center" data-sortable="true">教师姓名</th>
                                            <th data-halign="center" data-align="center" data-sortable="true">头衔</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${teacherList}" var="teacher">
                                        <tr>
                                            <td>${teacher.username}</td>
                                            <td><a onclick="choose('${teacher.id}','${teacher.name}');">${teacher.name}</a></td>
                                            <td>${teacher.title}</td>
                                        </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                    </div>
                                </div>
                        	</div>
                    	</div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <meFooter>  
       	<!-- iCheck -->
	<script src="${ctxsta}/common/icheck/icheck.min.js"></script>
	 <!-- bootstrapvalidator-master前端验证框架 -->
	<script src="${ctxsta}/common/bootstrapvalidator-master/js/bootstrapValidator.min.js"></script>
  
    <!-- layer javascript -->
    <script src="${ctxsta}/common/layer/layer.js"></script>
    <!-- Bootstrap table -->
    <script src="${ctxsta}/common/bootstrap-table-master/bootstrap-table.min.js"></script>
    <script src="${ctxsta}/common/bootstrap-table-master/extensions/export/bootstrap-table-export.js"></script>
    <script src="${ctxsta}/common/bootstrap-table-master/tableExport.js"></script>
    <script src="${ctxsta}/common/bootstrap-table-master/locale/bootstrap-table-zh-CN.min.js"></script>
    
	<!-- 自定义js --> 
    <script src="${ctxsta}/platform/js/teacher/teachercategory-addteacher.js"></script>
	</meFooter>  
</body>
</html>
