<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/layouts/base.jsp"%>
<!DOCTYPE HTML>
<html>
  <head>
    <title>用户列表</title>
    <link rel="stylesheet" href="${ctxsta}/common/bootstrap-table-master/bootstrap-table.min.css" />
    <link rel="stylesheet" href="${ctxsta}/common/bootstrap-datepicker-master/css/bootstrap-datepicker.min.css" />
  </head>
  
  <body class="gray-bg">
	<div class="wrapper wrapper-content animated fadeInRight">
       <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-content">
                            <div class="form-group m-t">
                            	<label class="col-sm-2 control-label">已选择：</label>
								<div class="col-sm-2">
                                	<input type="text" class="form-control" id="pictureinfo">
                                	<input type="hidden" class="form-control" name="picture.id" id="pictureid">
	                                <input type="hidden" class="form-control" name="rotator.id" id="rotatorid" value="${rotatorID}">
                                </div>
								<label class="col-sm-2 control-label">排序：</label>
								<div class="col-sm-2">
                                	<input type="text" class="form-control" id="sortby" name="picture.sortby">
                                </div>  
								<div class="col-sm-4">
                                	<button class="btn btn-primary" type="button" id="submit">提交</button>
	                                <button class="btn btn-primary" type="button" onclick="reset()">重置</button>
                                </div>  
                            </div>
                            </div>
                    </div>
                    <div class="ibox-content">
                        <div class="row row-lg">
                            <div class="col-sm-12">
                                <div class="example-wrap">
                                    <div class="example">
                                        <div id="toolbar" class="btn-group m-t-sm">
                                            <input type="hidden" id="teamId" value="${teamId }">
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
                                            <th>新闻标题</th>
                                            <th data-halign="center" data-align="center" data-sortable="true">图片描述</th>
                                            <th data-halign="center" data-align="center" data-sortable="true">图片</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${pictureList}" var="picture">
                                        <tr>
                                            <td>${picture.article.title }</td>
                                            <td><a href="javascript:void(0)" onclick="chose('${picture.info}','${picture.id }')">${picture.info}</a></td>
                                            <td><a href="javascript:void(0)" onclick="member_show('图片显示','${ctx}/platform/picture/list','${picture.id }','pictureShow','600','600')">显示图片</a></td>
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
     <script src="${ctxsta}/platform/js/picture/picture-list.js"></script>
    </meFooter>

  </body>
</html>
