<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/layouts/base.jsp"%>
<!DOCTYPE HTML>
<html>
  <head>
    <title>编辑栏目</title>
    <link rel="stylesheet" href="${ctxsta}/common/icheck/flat/green.css" />
    <link type="text/css" rel="stylesheet" href="${ctxsta}/common/ztree/css/metroStyle/metroStyle.css" />
  </head>
  
  <body class="gray-bg">
    <div class="wrapper add-member-content animated fadeInRight">
        <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5><c:if test="${empty category}">创建栏目</c:if><c:if test="${!empty category}">修改栏目</c:if></h5>
                    </div>
                    <div class="ibox-content">
                        <form id="categoryaddform" class="form-horizontal">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">栏目名称：</label>
								<div class="col-sm-4">
									<input type="text" class="form-control" name="name" value="${category.name}">
                                </div> 
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">栏目种类：</label>
                                <div class="col-sm-4">
                                	<select class="form-control" id="category_type" name="type">
                                		<option value="1" <c:if test="${category.type == 1}">selected="selected"</c:if>>列表类型</option>
                                		<option value="2" <c:if test="${category.type == 2}">selected="selected"</c:if>>超链接类型</option>
                                		<option value="3" <c:if test="${category.type == 3}">selected="selected"</c:if>>可维护页面类型</option>
                                		<option value="4" <c:if test="${category.type == 4}">selected="selected"</c:if>>静态页面类型</option>
                                	</select>
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">排序：</label>
                                <div class="col-sm-4">
									<input type="text" class="form-control" name="sortby" value="${category.sortby}">
                                </div>
                             </div>
                             <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">父级栏目：</label>
								<div class="col-sm-4">
									<select class="form-control" id="category_parent" name="categoryId">
									  <option value="">无</option>
									  <c:forEach items="${combobox}" var="combobox">
									  		 <option value="${combobox.id }" <c:if test="${category.categoryId == combobox.id}">selected="selected"</c:if>>${combobox.name }</option>
									  </c:forEach>
									</select>
                                </div> 
                            </div>
                             <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">是否允许投稿：</label>
                                <div class="col-sm-4">
									 <label class="radio-inline add-radio">
                                        <input type="radio" name="issubmit" value="1" checked="checked" >是</label>
                                    <label class="radio-inline add-radio">
                                        <input type="radio" name="issubmit" value="2" <c:if test="${category.issubmit==2 }">checked="checked"</c:if> >否</label>
                                </div>
                             </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <div class="col-sm-4 col-sm-offset-4 add-submit">
                                	<input type="hidden" class="form-control" name="id" value="${category.id}">
                                    <button class="btn btn-primary syscategorysubmit" type="button" id="submit">提交</button>
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
    <script src="${ctxsta}/platform/js/category/category-add.js"></script>
	</meFooter>  
</body>
</html>
