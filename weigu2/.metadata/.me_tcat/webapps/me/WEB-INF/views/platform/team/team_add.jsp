<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/layouts/base.jsp"%>
<!DOCTYPE HTML>
<html>
  <head>
    <title>创建用户</title>
    <link rel="stylesheet" href="${ctxsta}/common/icheck/flat/green.css" />
  </head>
  
  <body class="gray-bg">
    <div class="wrapper add-member-content animated fadeInRight">
        <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5><c:if test="${empty team}">创建团队</c:if><c:if test="${!empty team}">团队信息</c:if></h5>
                        <div class="ibox-tools">
                            <a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                            <a class="close-link"><i class="fa fa-times"></i></a>
                        </div>
                    </div>
                    <div class="ibox-content">
                        <form id="teamform" class="form-horizontal">
                        	<c:if test="${empty team}">
                            <div class="form-group m-t">
                            	<label class="col-sm-2 control-label">用户名：</label>
								<div class="col-sm-4">
                                	<input type="text" maxlength="10" class="form-control" name="team.username">
                                </div>
								<label class="col-sm-2 control-label">密码：</label>
								<div class="col-sm-4">
                                	<input type="password" maxlength="18" class="form-control" name="team.password">
                                </div>  
								
                            </div>
                            <div class="hr-line-dashed"></div>
                            </c:if>
                            <div class="form-group  <c:if test="${!empty team}">m-t	</c:if>">
                                <label class="col-sm-2 control-label">名称：</label>
								<div class="col-sm-4">
									<input type="text" class="form-control" name="team.name" value="${team.name}">
                                </div> 
                                <label class="col-sm-2 control-label">地址：</label>
								<div class="col-sm-4">
                                	<input type="text" maxlength="11" class="form-control" name="team.address" value="${team.address}">
                                </div>                                
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group" <c:if test="${!empty team}">m-t	</c:if>">
                                <label class="col-sm-2 control-label">排序：</label>
								<div class="col-sm-4">
									<input type="text" class="form-control" name="team.sortby" value="${team.sortby}">
                                </div> 
                            </div>
                            
                            <div class="hr-line-dashed"></div>
                            <div class="form-group" <c:if test="${!empty team}">m-t	</c:if>">
                                <label class="col-sm-2 control-label">简介：</label>
								<div class="col-sm-4">
									<textarea style="width: 400px;height: 250px;" class="form-control" name="team.researchDirection">${team.researchDirection}</textarea>
                                </div> 
                            </div>
                            
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <div class="col-sm-4 col-sm-offset-4 add-submit">
                                	<input type="hidden" class="form-control" name="team.id" value="${team.id}">
                                    <button class="btn btn-primary teamsubmit" type="submit" id="submit">提交</button>
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
    <script src="${ctxsta}/platform/js/team/team-add.js"></script>
	</meFooter>  
</body>
</html>
