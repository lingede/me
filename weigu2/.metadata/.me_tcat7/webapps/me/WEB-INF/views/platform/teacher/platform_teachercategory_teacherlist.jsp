<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/layouts/base.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
   <head>
    <title>教师列表</title>
    <link rel="stylesheet" href="${ctxsta}/common/bootstrap-table-master/bootstrap-table.min.css" />
    <link rel="stylesheet" href="${ctxsta}/common/bootstrap-datepicker-master/css/bootstrap-datepicker.min.css" />
  </head>
  
<body class="gray-bg">
	<div class="wrapper wrapper-content animated fadeInRight">
       <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>${teachercategory.name }</h5>
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
                                            <button type="button" class="btn btn-default"  title="添加教师" onclick="teachercategory_showteacher('添加教师','${ctx}/platform/teachercategory/list','${teachercategory.id }','addteacher','850',null)">
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
                                            
                                            <th data-halign="center" data-align="center" data-sortable="true">教师姓名</th>
                                     
                                            <th data-halign="center" data-align="center" data-sortable="true">排序(双击可以修改排序)</th>
                                            <th data-halign="center" data-align="center" data-sortable="true">删除</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${teacherbycategoryList}" var="teacherbycategory">
                                        
                                        <tr id="${teacherbycategory.id }">
                                           <c:forEach items="${teacherList }" var="teacher">
                                            <c:if test="${teacher.id==teacherbycategory.teacherId }">
                                            <td>${teacher.name}</td>
                                          
                                            <td id="rank">
                                              ${teacherbycategory.rank }
                                            </td>
                                            <td>
                                            <a class="remove m-l-sm text-danger" href="javascript:void(0)" onclick="categoryhasteacher_del(this,${teacherbycategory.id})" title="删除">
                                            <i class="glyphicon glyphicon-remove"></i>
                                            </a>
                                            </td>
                                            </c:if>
                                            </c:forEach>
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
    <script src="${ctxsta}/platform/js/teacher/teachercategory-teacherlist.js"></script>
    </meFooter>

  </body>
</html>
