<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/layouts/base.jsp"%>
<!DOCTYPE HTML>
<html>
  <head>
    <title>创建菜单</title>
    <link rel="stylesheet" href="${ctxsta}/common/icheck/flat/green.css" />
  </head>
  
  <body class="gray-bg">
    <div class="wrapper add-member-content animated fadeInRight">
        <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5><c:if test="${empty systemMenu}">创建菜单</c:if><c:if test="${!empty systemMenu}">修改菜单</c:if></h5>
                        <div class="ibox-tools">
                            <a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                            <a class="close-link"><i class="fa fa-times"></i></a>
                        </div>
                    </div>
                    <div class="ibox-content">
                        <form id="systemmenuform" class="form-horizontal">
                            <div class="form-group  <c:if test="${!empty systemMenu}">m-t</c:if>">
                                <label class="col-sm-2 control-label">上级菜单：</label>
								<div class="col-sm-4">
									<c:if test="${empty systemMenu }">
										<select class="form-control" id="systemMenuParent">
										  <option data-parent="0">根菜单</option>
										  <c:forEach items="${menuList}" var="systemMenu">
										  		<option data-parent="${systemMenu.id }">${systemMenu.menuName }</option>
										  		<c:forEach items="${systemMenu.childMenuList}" var="childMenu">
										  			<option data-parent="${childMenu.id }">${childMenu.menuName }</option>
										  		</c:forEach>
										  </c:forEach>
										</select>
									</c:if>
									<c:if test="${!empty systemMenu }">
										<select class="form-control" id="systemMenuParent">
										  <option data-parent="0">根菜单</option>
										  <c:forEach items="${menuList}" var="menu">
										  	<c:if test="${menu.id==systemMenu.parentId}">
										  		<option data-parent="${menu.id }" selected="selected" >${menu.menuName }</option>
										  	</c:if>
										  	<c:if test="${menu.id!=systemMenu.parentId}">
										  		<option data-parent="${menu.id }" >${menu.menuName }</option>
										  	</c:if>
										  	<c:forEach items="${menu.childMenuList}" var="childMenu">
										  			<c:if test="${childMenu.id==systemMenu.parentId}">
												  		<option data-parent="${childMenu.id }" selected="selected" >${childMenu.menuName }</option>
												  	</c:if>
												  	<c:if test="${childMenu.id!=systemMenu.parentId}">
												  		<option data-parent="${childMenu.id }" >${childMenu.menuName }</option>
												  	</c:if>
										  		</c:forEach>
										  </c:forEach>
										</select>
									</c:if>
                                </div> 
                            </div>
                             <div class="hr-line-dashed"></div>
                             <div class="form-group">
                              <label class="col-sm-2 control-label">菜单名称：</label>
								<div class="col-sm-4">
                                	<input type="text" maxlength="30" class="form-control" name="systemMenu.menuName" value="${systemMenu.menuName}">
                                </div> 
                             </div>
                            <div class="hr-line-dashed"></div>
                             <div class="form-group">
                              <label class="col-sm-2 control-label">菜单链接：</label>
								<div class="col-sm-4">
                                	<input type="text" maxlength="60" class="form-control" name="systemMenu.href" value="${systemMenu.href}">
                                </div> 
                             </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">菜单类型：</label>
								<div class="col-sm-8">
									 <c:if test="${empty systemMenu}">
                                  <label class="radio-inline">
									  <input type="radio"  value="0" name="systemMenu.menuType" />操作
									</label>
									<label class="radio-inline">
									  <input type="radio"  value="1"name="systemMenu.menuType" checked="checked" /> 菜单
									</label>
									<label class="radio-inline">
									  <input type="radio"  value="2" name="systemMenu.menuType" /> 功能
									</label>
                                </c:if>
                                <c:if test="${!empty systemMenu}">
									<label class="radio-inline">
									  <input type="radio"  value="0" name="systemMenu.menuType" <c:if test="${systemMenu.menuType==0 }">checked="checked"</c:if> />操作
									</label>
									<label class="radio-inline">
									  <input type="radio"  value="1"name="systemMenu.menuType" <c:if test="${systemMenu.menuType==1 }">checked="checked"</c:if> /> 菜单
									</label>
									<label class="radio-inline">
									  <input type="radio"  value="2" name="systemMenu.menuType" <c:if test="${systemMenu.menuType==2 }">checked="checked"</c:if>/> 功能
									</label>
								</c:if>
                                </div> 
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                 <label class="col-sm-2 control-label">授权标识：</label>
								<div class="col-sm-4">
                                	<input type="text" maxlength="60" class="form-control" name="systemMenu.permission" value="${systemMenu.permission}">
                                </div> 
                                 <label class="col-sm-2 control-label">权限代码：</label>
								<div class="col-sm-4">
                                	<input type="text" class="form-control" name="systemMenu.menuCode" value="${systemMenu.menuCode}">
                                </div>
                                
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                            <label class="col-sm-2 control-label">排序：</label>
								<div class="col-sm-4">
                                	<input type="text" class="form-control" name="systemMenu.sort" value="${systemMenu.sort}">
                                </div> 
                                <label class="col-sm-2 control-label">图标：</label>
								<div class="col-sm-4">
									<input type="text" class="form-control" name="systemMenu.icon" value="${systemMenu.icon}">
                                </div> 
                            </div>
                            <div class="hr-line-dashed"></div>
                             <div class="form-group">
                             	<label class="col-sm-2 control-label">状态：</label>
                                <div class="col-sm-4">
                                <c:if test="${empty systemMenu}">
                                   <label class="radio-inline add-radio">
                                        <input type="radio" name="systemMenu.status" value="1" checked="checked">  开启</label>
                                </c:if>
                                <c:if test="${!empty systemMenu}">
                                   <label class="radio-inline add-radio">
                                        <input type="radio" name="systemMenu.status" value="1" <c:if test="${systemMenu.status==1 }">checked="checked"</c:if> >  开启</label>
                                </c:if>
                                    <label class="radio-inline add-radio">
                                        <input type="radio" name="systemMenu.status" value="0" <c:if test="${systemMenu.status==0 }">checked="checked"</c:if> >  关闭</label>
                                </div>
                             </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <div class="col-sm-4 col-sm-offset-4 add-submit">
                                	<input type="hidden" class="form-control" name="systemMenu.id" value="${systemMenu.id}">
                                    <button class="btn btn-primary sysmenusubmit" type="button" id="submit">提交</button>
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
	<!-- 自定义js -->
    <script src="${ctxsta}/admin/main/js/sysmenu-add.js"></script>
	</meFooter>  
</body>
</html>
