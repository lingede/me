<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/layouts/base.jsp"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>教师列表</title>
   
    <link rel="stylesheet" href="${ctxsta}/common/bootstrap-table-master/bootstrap-table.min.css" />
    <link rel="stylesheet" href="${ctxsta}/common/layer/skin/layer.css" />

  </head>
  
  <body>
  
    <div class="wrapper wrapper-content animated fadeInRight">
       <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>教师列表</h5>
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
                                            <button type="button" class="btn btn-default"  title="添加教师" onclick="teacher_show('添加教师','${ctx}/platform/teacher/list/add',null,null,'900',null)">
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
                                            <th data-halign="center" data-align="center" data-sortable="true">用户名</th>
                                            <th data-halign="center" data-align="center" data-sortable="true">姓名</th>
                                            <th data-halign="center" data-align="center" data-sortable="true">头像</th>
                                            
                                            
                                            <th data-halign="center" data-align="center">操作</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${teacherList}" var="teacher">
                                        <tr>
                                            <td>${teacher.username}</td>
                                            <td>${teacher.name}</td>
                                           
                                            <td>
                                            <button type="button" class="btn btn-info"  onclick="showimage('${teacher.name }','${ctx}/platform/teacher/list','${teacher.id}','showimage','600',null)">显示图片</button> 
                                            </td>
                                            <td class="td-manage">  
                                           
                                            <a class="edit m-l-sm text-warning" href="javascript:void(0)" onclick="teacher_show('${teacher.name }','${ctx}/platform/teacher/list','${teacher.id}','edit','900',null)" title="修改教师信息">
                                            <i class="glyphicon glyphicon-edit"></i>
                                            </a>
                                            
                                            <a class="remove m-l-sm text-primary" href="javascript:void(0)" onclick="teacher_show('${team.name}','${ctx}/platform/teacher/list','${teacher.id}/1','editdata','900',null)" title="修改个人简历">
	                                             <span class="glyphicon glyphicon glyphicon-cog"></span> 简历
	                                        </a>
	                                        <a class="remove m-l-sm text-primary" href="javascript:void(0)" onclick="teacher_show('${team.name}','${ctx}/platform/teacher/list','${teacher.id}/2','editdata','900',null)" title="修改研究领域">
	                                             <span class="glyphicon glyphicon glyphicon-cog"></span> 领域
	                                        </a>
	                                        <a class="remove m-l-sm text-primary" href="javascript:void(0)" onclick="teacher_show('${team.name}','${ctx}/platform/teacher/list','${teacher.id}/3','editdata','900',null)" title="修改学术成果">
	                                             <span class="glyphicon glyphicon glyphicon-cog"></span> 成果
	                                        </a>
	                                        <a class="remove m-l-sm text-primary" href="javascript:void(0)" onclick="teacher_show('${team.name}','${ctx}/platform/teacher/list','${teacher.id}/4','editdata','900',null)" title="修改学生培养">
	                                             <span class="glyphicon glyphicon glyphicon-cog"></span> 培养
	                                        </a>
	                                        <a class="remove m-l-sm text-primary"  href="javascript:void(0)"  onclick="teacher_preview('${teacher.id}')" title="教师页面预览">
	                                             <span class="glyphicon glyphicon glyphicon-log-in"></span> 预览
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
    
    <!-- layer javascript -->
    <script src="${ctxsta}/common/layer/layer.js"></script>
    <!-- Bootstrap table -->
    <script src="${ctxsta}/common/bootstrap-table-master/bootstrap-table.min.js"></script>
    <script src="${ctxsta}/common/bootstrap-table-master/extensions/export/bootstrap-table-export.js"></script>
    <script src="${ctxsta}/common/bootstrap-table-master/tableExport.js"></script>
    <script src="${ctxsta}/common/bootstrap-table-master/locale/bootstrap-table-zh-CN.min.js"></script>
   
    
    <!-- 自定义js -->
    <script src="${ctxsta}/platform/js/teacher/teacher-list.js"></script>
    </meFooter>
  </body>
</html>
