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
                    <div class="ibox-title">
                        <h5>搜索查询</h5>
                        <div class="ibox-tools">
                            <a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                            <a class="close-link"><i class="fa fa-times"></i></a>
                        </div>
                    </div>
                    <div class="ibox-content search-query">
                    <form action="${ctx}/system/sysuser/list" method="post" id="searchForm">
                        <div class="col-sm-6">
                            <div class="form-group" id="data_5">
                                <label class="control-label">添加时间</label>
                                <div class="input-daterange input-group" id="datepicker">
                                    <input type="text" class="form-control" name="queryUser.beginCreateTime" value="" />
                                    <span class="input-group-addon">到</span>
                                    <input type="text" class="form-control" name="queryUser.endCreateTime" value="" />
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="control-label">会员名称</label>
                                <div class="input-group">
                                    <input type="text" class="form-control" name="queryUser.searchContent"> 
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
                        <h5>管理员列表</h5>
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
                                            <button type="button" class="btn btn-default"  title="创建用户" onclick="member_show('创建用户','${ctx}/system/sysuser/list/add',null,null,'900',null)">
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
                                            <th data-halign="center" data-align="center" data-sortable="true">昵称</th>
                                            <th data-halign="center" data-align="center" data-sortable="true">姓名</th>
                                            <th data-halign="center" data-align="center" data-sortable="true">手机</th>
                                            <th data-halign="center" data-align="center" data-sortable="true">邮箱</th>
                                            <th data-halign="center" data-align="center" data-sortable="true">注册时间</th>
                                            <th data-halign="center" data-align="center" data-sortable="true">最后登录时间</th>
                                            <th data-halign="center" data-align="center" data-sortable="true">登录IP</th>
                                            <th data-halign="center" data-align="center">状态</th>
                                            <th data-halign="center" data-align="center">操作</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${systemUsers}" var="systemUsers">
                                        <tr>
                                            <td>
                                                <a href="javascript:void(0)" onclick="member_show('${systemUsers.userName}','${ctx}/system/sysuser/list','${systemUsers.id}','detail','900',null)">${systemUsers.userName}</a>
                                            </td>
                                            <td>${systemUsers.realName}</td>
                                            <td>${systemUsers.telephone}</td>
                                            <td>${systemUsers.email}</td>
                                            <td><fmt:formatDate value="${systemUsers.createTime}" pattern="yyyy/MM/dd" /></td>
                                            <td><fmt:formatDate value="${systemUsers.lastLoginTime}" pattern="yyyy/MM/dd HH:mm" /></td>
                                            <td>${systemUsers.lastLoginIp}</td>
                                            <td class="td-status">
                                            <c:if test="${systemUsers.status==1}"><span class="label label-primary">正常</span></c:if>
                                            <c:if test="${systemUsers.status==0}"><span class="label label-danger">冻结</span></c:if>
                                            </td>
                                            <td class="td-manage">  
                                            <c:if test="${systemUsers.status==1}"><a class="like text-info" href="javascript:void(0)" onClick="member_stop(this,${systemUsers.id})" title="冻结"><i class="glyphicon glyphicon-pause"></i></a></c:if>
                                            <c:if test="${systemUsers.status==0}"><a class="like text-info" href="javascript:void(0)" onClick="member_start(this,${systemUsers.id})" title="启用"><i class="glyphicon glyphicon-play"></i></a></c:if>
                                            <a class="edit m-l-sm text-warning" href="javascript:void(0)" onclick="member_show('${systemUsers.userName}','${ctx}/system/sysuser/list','${systemUsers.id}','edit','900',null)" title="编辑">
                                            <i class="glyphicon glyphicon-edit"></i>
                                            </a>
                                            <a class="remove m-l-sm text-danger" href="javascript:void(0)" onclick="member_del(this,${systemUsers.id})" title="删除">
                                            <i class="glyphicon glyphicon-remove"></i>
                                            </a>
                                            <a class="remove m-l-sm text-primary" href="javascript:void(0)" onclick="member_show('${systemUsers.userName}','${ctx}/system/sysuser/list','${systemUsers.id}','log','900',null)" title="日志">
                                            <i class="glyphicon glyphicon-list-alt"></i>
                                            </a>
                                            <a class="remove m-l-sm text-primary" href="javascript:void(0)" onclick="member_show('${systemUsers.userName}','${ctx}/system/sysuser/list','${systemUsers.id}','editCategory','900',null)" title="管理栏目">
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
    <script src="${ctxsta}/admin/main/js/sysuser-list.js"></script>
    </meFooter>

  </body>
</html>
