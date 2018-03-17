<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/layouts/base.jsp"%>
<!DOCTYPE HTML>
<html>
  <head>
    <title>创建角色</title>
    <link rel="stylesheet" href="${ctxsta}/common/icheck/flat/green.css" />
    <link type="text/css" rel="stylesheet" href="${ctxsta}/common/ztree/css/metroStyle/metroStyle.css" />
  </head>
  
  <body class="gray-bg">
    <div class="wrapper add-member-content animated fadeInRight">
        <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5><c:if test="${empty systemRole}">创建角色</c:if><c:if test="${!empty systemRole}">修改角色信息</c:if></h5>
                        <div class="ibox-tools">
                            <a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                            <a class="close-link"><i class="fa fa-times"></i></a>
                        </div>
                    </div>
                    <div class="ibox-content">
                        <form id="systemRoleform" class="form-horizontal">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">角色名称：</label>
								<div class="col-sm-4">
									<input type="text" class="form-control" name="systemRole.roleName" value="${systemRole.roleName}">
                                </div> 
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">系统数据：</label>
                                <div class="col-sm-4">
                                <c:if test="${empty systemRole}">
                                   <label class="radio-inline add-radio">
                                        <input type="radio" name="systemRole.isSystem" value="1" checked="checked">是</label>
                                </c:if>
                                <c:if test="${!empty systemRole}">
                                <label class="radio-inline add-radio">
                                        <input type="radio"  name="systemRole.isSystem" value="1" <c:if test="${systemRole.isSystem==1 }">checked="checked"</c:if> >是</label>
                                 </c:if>
                                    <label class="radio-inline add-radio">
                                        <input type="radio" name="systemRole.isSystem" value="0" <c:if test="${systemRole.isSystem==0 }">checked="checked"</c:if> >否</label>
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">状态：</label>
                                <div class="col-sm-4">
                                <c:if test="${empty systemRole}">
                                   <label class="radio-inline add-radio">
                                        <input type="radio" name="systemRole.status" value="1" checked="checked">开启</label>
                                </c:if>
                                <c:if test="${!empty systemRole}">
                                   <label class="radio-inline add-radio">
                                        <input type="radio" name="systemRole.status" value="1" <c:if test="${systemRole.status==1 }">checked="checked"</c:if> >  开启</label>
                                </c:if>
                                    <label class="radio-inline add-radio">
                                        <input type="radio" name="systemRole.status" value="0" <c:if test="${systemRole.status==0 }">checked="checked"</c:if> >  关闭</label>
                                </div>                            
                            </div>
                             <div class="hr-line-dashed"></div>
                             <div class="form-group">
                              <label class="col-sm-2 control-label">拥有菜单：</label>
                                <div class="col-sm-6">
									<div id="ztreedemo" class="ztree"></div>
                                </div>
                             </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <div class="col-sm-4 col-sm-offset-4 add-submit">
                                	<input type="hidden" class="form-control" name="systemRole.id" value="${systemRole.id}">
                                    <button class="btn btn-primary sysrolesubmit" type="button" id="submit">提交</button>
                                </div>
                            </div>
                        </form>
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
	<script type="text/javascript" src="${ctxsta}/common/ztree/jquery.ztree.all.min.js"></script>
	<!-- 自定义js -->
	<script type="text/javascript">
		var treedata='${jsonMenu}';
		$(function(){
			initMenuTree(treedata);
		});
	</script>
    <script src="${ctxsta}/admin/main/js/sysrole-add.js"></script>
	</meFooter>  
</body>
</html>
