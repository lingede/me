<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/layouts/base.jsp"%>
<!DOCTYPE HTML>
<html>
  <head>
    <title>超链接列表</title>
    <link rel="stylesheet" href="${ctxsta}/common/bootstrap-table-master/bootstrap-table.min.css" />
    <link rel="stylesheet" href="${ctxsta}/common/bootstrap-datepicker-master/css/bootstrap-datepicker.min.css" />
    <link rel="stylesheet" href="${ctxsta}/common/icheck/flat/green.css" />
  </head>
  
  <body class="system-message gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight system-message">
        <div class="row">
            <div class="col-sm-13">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <div class="ibox-tools">
                            <a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                            <a class="close-link"><i class="fa fa-times"></i></a>
                        </div>
                    </div>
                    <div class="ibox-content">
                        <div class="row row-lg">
                            <div class="col-sm-12">
                                <div class="example-wrap">
                                    <div class="example">
                                    	<div id="toolbar" class="btn-group m-t-sm">
                                            <button type="button" class="btn btn-default"  title="添加链接" onclick="linkpage_show('创建链接','${ctx}/platform/linkpage/list/add',null,null,'900',null)">
                                                <i class="glyphicon glyphicon-plus"></i>
                                            </button>
                                        </div>
                                        <table id="table"
                                           data-toggle="table"
                                           data-height="380"
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
                                            <th data-halign="center" data-align="center">关联名称</th>
                                            <th data-halign="center" data-align="center">关联URL</th>
                                            <th data-halign="center" data-align="center">关联栏目</th>
                                            <th data-halign="center" data-align="center">操作</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        	<c:forEach items="${linkpages}" var="linkpage">
                                        		<tr>
		                                            <td>${linkpage.name}</td>
		                                            <td>${linkpage.url}</td>
		                                            <td>${linkpage.categoryId}</td>
		                                            <td class="td-manage">
		                                            	<a class="edit m-l-sm text-warning" href="javascript:void(0)" onclick="linkpage_show('编辑链接','${ctx}/platform/linkpage/list','${linkpage.id}','edit','900',null)" title='编辑'>
		                                            	<i class="glyphicon glyphicon-edit"></i></a>
		                                            	<a class="remove m-l-sm text-danger" href="javascript:void(0)" onclick="linkpage_del(this,${linkpage.id})" title="删除">
		                                            	<i class="glyphicon glyphicon-remove"></i></a>
		                                            </td>
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
    <!-- layer javascript -->
    <script src="${ctxsta}/common/layer/layer.js"></script>
    <!-- bootstrapvalidator-master前端验证框架 -->
	<script src="${ctxsta}/common/bootstrapvalidator-master/js/bootstrapValidator.min.js"></script>
    <!-- Bootstrap table -->
    <script src="${ctxsta}/common/bootstrap-table-master/bootstrap-table.min.js"></script>
    <script src="${ctxsta}/common/bootstrap-table-master/extensions/export/bootstrap-table-export.js"></script>
    <script src="${ctxsta}/common/bootstrap-table-master/tableExport.js"></script>
    <script src="${ctxsta}/common/bootstrap-table-master/locale/bootstrap-table-zh-CN.min.js"></script>
    <!-- Data picker -->
    <script src="${ctxsta}/common/bootstrap-datepicker-master/js/bootstrap-datepicker.min.js"></script>
    <!-- iCheck -->
	<script src="${ctxsta}/common/icheck/icheck.min.js"></script>
	<!-- 自定义js -->
    <script src="${ctxsta}/platform/js/category/linkpage-list.js"></script>
    </meFooter>
  </body>
</html>