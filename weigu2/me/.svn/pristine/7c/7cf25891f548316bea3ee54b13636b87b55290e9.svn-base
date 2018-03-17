<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/layouts/base.jsp"%>
<!DOCTYPE HTML>
<html>
  <head>
    <title>菜单列表</title>
    <link rel="stylesheet" href="${ctxsta}/common/bootstrap-table-master/bootstrap-table.min.css" />
    <link rel="stylesheet" href="${ctxsta}/common/bootstrap-datepicker-master/css/bootstrap-datepicker.min.css" />
  </head>
  
  <body class="gray-bg">
	<div class="wrapper wrapper-content animated fadeInRight">
       <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>菜单列表</h5>
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
                                            <button type="button" class="btn btn-default"  title="创建菜单" onclick="menu_show('创建菜单','${ctx}/system/sysmenu/list/add',null,null,'900',null)">
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
                                            <th data-halign="center" data-align="center" data-sortable="true">菜单名称</th>
                                            <th data-halign="center" data-align="center" data-sortable="true">链接地址</th>
                                            <th data-halign="center" data-align="center" data-sortable="true">图标</th>
                                            <th data-halign="center" data-align="center" data-sortable="true">权限标识</th>
                                            <th data-halign="center" data-align="center" data-sortable="true">创建时间</th>
                                            <th data-halign="center" data-align="center">状态</th>
                                            <th data-halign="center" data-align="center" data-sortable="true">排序</th>
                                            <th data-halign="center" data-align="center">操作</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${menuList}" var="systemMenu">
                                        <tr>
                                            <td>${systemMenu.menuName}</td>
                                            <td>${systemMenu.href}</td>
                                            <td><i class="fa ${systemMenu.icon}"></i></td>
                                            <td>${systemMenu.permission}</td>
                                            <td><fmt:formatDate value="${systemMenu.createTime}" pattern="yyyy/MM/dd" /></td>
                                            <td class="td-status">
                                            <c:if test="${systemMenu.status==1}"><span class="label label-primary">正常</span></c:if>
                                            <c:if test="${systemMenu.status==0}"><span class="label label-danger">冻结</span></c:if>
                                            </td>
                                            <td>${systemMenu.sort}</td>
                                            <td class="td-manage">  
                                            <c:if test="${systemMenu.status==1}"><a class="like text-info" href="javascript:void(0)" onClick="menu_stop(this,${systemMenu.id})" title="冻结"><i class="glyphicon glyphicon-pause"></i></a></c:if>
                                            <c:if test="${systemMenu.status==0}"><a class="like text-info" href="javascript:void(0)" onClick="menu_start(this,${systemMenu.id})" title="启用"><i class="glyphicon glyphicon-play"></i></a></c:if>
                                            <a class="edit m-l-sm text-warning" href="javascript:void(0)" onclick="menu_show('${systemMenu.menuName}','${ctx}/system/sysmenu/list','${systemMenu.id}','edit','900',null)" title="编辑">
                                            <i class="glyphicon glyphicon-edit"></i>
                                            </a>
                                            <a class="remove m-l-sm text-danger" href="javascript:void(0)" onclick="menu_del(this,${systemMenu.id})" title="删除">
                                            <i class="glyphicon glyphicon-remove"></i>
                                            </a>
                                            </td>
                                        </tr>
                                        	 <c:forEach items="${systemMenu.childMenuList}" var="childSystemMenu">
		                                        <tr>
		                                            <td>
		                                                <a href="javascript:void(0)" onclick="role_show('${childSystemMenu.menuName}','${ctx}/system/sysrole/list','${childSystemMenu.id}','detail','500','400')">${childSystemMenu.menuName}</a>
		                                            </td>
		                                            <td>${childSystemMenu.href}</td>
		                                             <td><i class="fa ${childSystemMenu.icon}"></i></td>
		                                            <td><fmt:formatDate value="${childSystemMenu.createTime}" pattern="yyyy/MM/dd" /></td>
		                                            <td class="td-status">
		                                            <c:if test="${childSystemMenu.status==1}"><span class="label label-primary">正常</span></c:if>
		                                            <c:if test="${childSystemMenu.status==0}"><span class="label label-danger">冻结</span></c:if>
		                                            </td>
		                                            <td>${childSystemMenu.sort}</td>
		                                            <td class="td-manage">  
		                                            <c:if test="${childSystemMenu.status==1}"><a class="like text-info" href="javascript:void(0)" onClick="menu_stop(this,${childSystemMenu.id})" title="冻结"><i class="glyphicon glyphicon-pause"></i></a></c:if>
		                                            <c:if test="${childSystemMenu.status==0}"><a class="like text-info" href="javascript:void(0)" onClick="menu_start(this,${childSystemMenu.id})" title="启用"><i class="glyphicon glyphicon-play"></i></a></c:if>
		                                            <a class="edit m-l-sm text-warning" href="javascript:void(0)" onclick="menu_show('${childSystemMenu.menuName}','${ctx}/system/sysmenu/list','${childSystemMenu.id}','edit','900',null)" title="编辑">
		                                            <i class="glyphicon glyphicon-edit"></i>
		                                            </a>
		                                            <a class="remove m-l-sm text-danger" href="javascript:void(0)" onclick="menu_del(this,${childSystemMenu.id})" title="删除">
		                                            <i class="glyphicon glyphicon-remove"></i>
		                                            </a>
		                                            </td>
		                                        </tr>
                                        	 </c:forEach>
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
    <script src="${ctxsta}/admin/main/js/sysmenu-list.js"></script>
    </meFooter>

  </body>
</html>
