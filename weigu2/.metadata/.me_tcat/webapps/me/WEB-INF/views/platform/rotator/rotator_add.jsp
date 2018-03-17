<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/layouts/base.jsp"%>
<!DOCTYPE HTML>
<html>
  <head>
    <title>创建轮播主题</title>
    <link rel="stylesheet" href="${ctxsta}/common/icheck/flat/green.css" />
  </head>
  
  <body class="gray-bg">
    <div class="wrapper add-member-content animated fadeInRight">
        <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5><c:if test="${empty rotator}">创建轮播主题</c:if><c:if test="${!empty rotator}">修改轮播主题信息</c:if></h5>
                        <div class="ibox-tools">
                            <a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                            <a class="close-link"><i class="fa fa-times"></i></a>
                        </div>
                    </div>
                    <div class="ibox-content">
                        <form id="rotatorform" class="form-horizontal">
                        	<c:if test="${empty rotator}">
                            <div class="form-group m-t">
                            	<label class="col-sm-2 control-label">轮播主题标题：</label>
								<div class="col-sm-4">
                                	<input type="text" maxlength="10" class="form-control" name="rotator.title">
                                </div>
								<label class="col-sm-2 control-label">描述：</label>
								<div class="col-sm-4">
                                	<input type="text" maxlength="18" class="form-control" name="rotator.description">
                                </div>  
                            </div>
                            </c:if>
                          <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <div class="col-sm-4 col-sm-offset-4 add-submit">
                                	<input type="hidden" class="form-control" name="rotator.id" value="${rotator.id}">
                                    <button class="btn btn-primary Rotatorsubmit" type="submit" id="submit">提交</button>
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
    <script src="${ctxsta}/platform/js/rotator/rotator-add.js"></script>
	</meFooter>  
</body>
</html>
