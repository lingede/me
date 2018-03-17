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
	         <c:if test="${userType!=3}">
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
	                    <form action="${ctx}/platform/team/list" method="post" id="searchForm">
	                        <div class="col-sm-6">
	                            <div class="form-group">
	                                <label class="control-label">团队名称</label>
	                                <div class="input-group">
	                                    <input type="text" class="form-control" name="team.username" > 
	                                    <span class="input-group-btn"><button type="button" class="btn btn-primary" onclick="javascript:$('#searchForm').submit();">搜索</button> </span>
	                                </div>
	                            </div>
	                        </div>
	                    </form>
	                    </div>
	                </div>
	            </div>
	            </c:if>
       </div>
       <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>团队列表</h5>
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
                                    <c:if test="${userType!=3}">
                                        <div id="toolbar" class="btn-group m-t-sm">
                                            <button type="button" class="btn btn-default"  title="创建团队" onclick="member_show('创建团队','${ctx}/platform/team/list/add',null,null,'900',null)">
                                                <i class="glyphicon glyphicon-plus"></i>
                                            </button>
                                        </div>
                                        </c:if>
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
                                            <th data-halign="center" data-align="center" data-sortable="true">团队名称</th>
                                            <th data-halign="center" data-align="center" data-sortable="true">团队用户名</th>
                                            <th data-halign="center" data-align="center" data-sortable="true">地址</th>
                                            <th data-halign="center" data-align="center">操作</th>
                                            <th data-halign="center" data-align="center">详细基础资料操作</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${teamList}" var="team">
                                        <tr>
                                            <td>${team.name}</td>
                                            <td>${team.username}</td>
                                            <td>${team.address}</td>
                                            
                                            <td class="td-manage">  
	                                            <a class="edit m-l-sm text-warning" href="javascript:void(0)" onclick="member_show('${team.name}','${ctx}/platform/team/list','${team.id}','edit','900',null)" title="编辑">
	                                            <i class="glyphicon glyphicon-edit"></i>
	                                            </a>
	                                             <c:if test="${userType!=3}">
	                                            <a class="remove m-l-sm text-danger" href="javascript:void(0)" onclick="member_del(this,${team.id})" title="删除">
	                                            <i class="glyphicon glyphicon-remove"></i>
	                                            </a>
	                                            </c:if>
	                                            <a class="remove m-l-sm text-primary" href="javascript:void(0)" onclick="member_refresh(this,${team.id})" title="重置密码">
	                                            <i class="glyphicon glyphicon-list-alt"></i>
	                                            </a>
	                                            <a class="remove m-l-sm text-primary" href="javascript:void(0)" onclick="member_show('${team.name}','${ctx}/platform/teamteacher/list','${team.id}','list','1500',null)" title="管理团队成员">
	                                            <i class="glyphicon glyphicon-user"></i>
                                            </a>
                                            </td>
                                             <td class="td-manage">  
	                                            <a class="remove m-l-sm text-primary" href="javascript:void(0)" onclick="member_show('${team.name}','${ctx}/platform/team/list','${team.id}/1','editdata','1500',null)" title="管理研究领域">
	                                             <span class="glyphicon glyphicon glyphicon-cog"></span> 领域
	                                            </a>
	                                            
	                                            <a class="remove m-l-sm text-primary" href="javascript:void(0)" onclick="member_show('${team.name}','${ctx}/platform/team/list','${team.id}/2','editdata','1500',null)" title="管理成果">
	                                             <span class="glyphicon glyphicon glyphicon-cog"></span> 学术
	                                            </a>
	                                            
	                                            <a class="remove m-l-sm text-primary" href="javascript:void(0)" onclick="member_show('${team.name}','${ctx}/platform/team/list','${team.id}/3','editdata','1500',null)" title="管理学生培养">
	                                            <span class="glyphicon glyphicon glyphicon-cog"></span> 学生
	                                            </a>
	                                            
	                                            <a class="remove m-l-sm text-primary" href="javascript:void(0)" onclick="member_show('${team.name}','${ctx}/platform/team/list','${team.id}/4','editdata','1500',null)" title="管理合作单位">
	                                            <span class="glyphicon glyphicon glyphicon-cog"></span> 合作
	                                            </a>
	                                            
	                                            <a class="remove m-l-sm text-primary" href="${ctx}/front/viewTeam?id=${team.id}" target="_blank" title="预览">
	                                            <span class="glyphicon glyphicon-eye-open"></span> 预览
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
    <script src="${ctxsta}/platform/js/team/team-list.js"></script>
    </meFooter>

  </body>
</html>
