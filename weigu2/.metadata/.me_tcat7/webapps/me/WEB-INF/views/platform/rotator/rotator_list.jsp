<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/layouts/base.jsp"%>
<!DOCTYPE HTML>
<html>
  <head>
    <title>轮播主题列表</title>
    <link rel="stylesheet" href="${ctxsta}/common/bootstrap-table-master/bootstrap-table.min.css" />
    <link rel="stylesheet" href="${ctxsta}/common/bootstrap-datepicker-master/css/bootstrap-datepicker.min.css" />
  </head>
  
  <body class="gray-bg">
	<div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>搜索查询</h5>
                        <div class="ibox-tools">
                            <a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                            <a class="close-link"><i class="fa fa-times"></i></a>
                        </div>
                    </div>
                    <div class="ibox-content search-query">
                        <form action="${ctx}/platform/rotator/list" method="post" id="searchForm">
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="control-label">轮播标题</label>
                                <div class="input-group">
                                    <input type="text" class="form-control" name="rotator.title" > 
                                    <span class="input-group-btn"><button type="button" class="btn btn-primary" onclick="javascript:$('#searchForm').submit();">搜索</button> </span>
                                </div>
                            </div>
                        </div>
                       </form>
                    </div>
                </div>
            </div>
       </div>
       <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>轮播主题列表</h5>
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
                                            <button type="button" class="btn btn-default"  title="创建轮播主题" onclick="member_show('创建轮播主题','${ctx}/platform/rotator/list/add',null,null,'900',null)">
                                                <i class="glyphicon glyphicon-plus"></i>
                                            </button>
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
                                            <th data-halign="center" data-align="center" data-sortable="true">轮播主题标题</th>
                                            <th data-halign="center" data-align="center" data-sortable="true">当前使用轮播</th>
                                            <th data-halign="center" data-align="center">操作</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${RotatorList}" var="rotator">
                                        <tr>
                                            <td>${rotator.title}</td>
                                             <td>
                                            	<c:if test="${rotator.sequence == 1 }">
                                            		<span class="glyphicon glyphicon-ok"></span>	
                                            	</c:if>
                                            	<c:if test="${rotator.sequence != 1}">
                                            		<span class="glyphicon glyphicon-remove"></span>	
                                            	</c:if>
                                            </td>
                                            <td class="td-manage">  
                                            <a class="remove m-l-sm text-danger" href="javascript:void(0)" onclick="member_del(this,${rotator.id})" title="删除">
                                            <i class="glyphicon glyphicon-remove"></i>
                                            </a>
                                            <a class="remove m-l-sm text-primary" href="javascript:void(0)" onclick="member_apply(this,${rotator.id})" title="采用">
                                            <i class="glyphicon glyphicon-list-alt"></i>
                                            </a>
                                            <a class="remove m-l-sm text-primary" href="${ctx}/platform/rotator/list/review?id=${rotator.id}" title="预览" target="_blank">
                                            <i class="glyphicon glyphicon-eye-open"></i>
                                            </a>
                                           <a class="remove m-l-sm text-primary" href="javascript:void(0)" onclick="member_show('修改轮播排序','${ctx}/platform/rotator/list','${rotator.id}','sort','1200',null)" title="修改轮播排序">
                                            <i class="glyphicon glyphicon-list-alt"></i>
                                            </a>
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
    <!-- jquery-ui-->
    <script src="${ctxsta}/common/jquery/jquery-ui.min.js"></script>
    <!-- layer javascript -->
    <script src="${ctxsta}/common/layer/layer.js"></script>
    <!-- Bootstrap table -->
    <script src="${ctxsta}/common/bootstrap-table-master/bootstrap-table.min.js"></script>
    <script src="${ctxsta}/common/bootstrap-table-master/extensions/export/bootstrap-table-export.js"></script>
    <script src="${ctxsta}/common/bootstrap-table-master/tableExport.js"></script>
    <script src="${ctxsta}/common/bootstrap-table-master/locale/bootstrap-table-zh-CN.min.js"></script>
    <!-- Data picker -->
    <script src="${ctxsta}/common/bootstrap-datepicker-master/js/bootstrap-datepicker.min.js"></script>
    
    <!-- 自定义js -->
    <script src="${ctxsta}/platform/js/rotator/rotator-list.js"></script>
    </meFooter>

  </body>
</html>
