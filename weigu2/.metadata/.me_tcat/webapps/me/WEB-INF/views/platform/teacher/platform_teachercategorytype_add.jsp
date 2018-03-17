<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/layouts/base.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>添加教师职称类型</title>
    <link rel="stylesheet" href="${ctxsta}/common/icheck/flat/green.css" />

  </head>
  
  <body class="gray-bg">
    <div class="wrapper add-member-content animated fadeInRight">
        <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5><c:if test="${empty teachercategorytype}">创建教师职称类型</c:if><c:if test="${!empty teachercategorytype}">修改教师职称类型</c:if></h5>
                        <div class="ibox-tools">
                            <a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                            <a class="close-link"><i class="fa fa-times"></i></a>
                        </div>
                    </div>
                    <div class="ibox-content">
                        <form id="teachercategorytypeform" class="form-horizontal" >
                            
                             
                             <div class="form-group">
                              <label class="col-sm-2 control-label">名称：</label>
								<div class="col-sm-4">
                                	<input type="text" maxlength="30" class="form-control" name="teachercategorytype.name" value="${teachercategorytype.name}">
                                </div> 
                             </div> 
                            <div class="hr-line-dashed"></div>
                             <div class="form-group">
                              <label class="col-sm-2 control-label">排序：</label>
								<div class="col-sm-4">
                                	<input type="text" maxlength="60" class="form-control" name="teachercategorytype.fsort" value="${teachercategorytype.fsort}">
                                </div> 
                             </div>
                           
                             <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <div class="col-sm-4 col-sm-offset-4 add-submit">
                                	<input type="hidden" class="form-control" name="teachercategorytype.id" value="${teachercategorytype.id}">
                                    <button class="btn btn-primary teachercategorytypesubmit" type="button" id="submit">提交</button>
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
    <script src="${ctxsta}/platform/js/teacher/teachercategorytype-add.js"></script>
	</meFooter>  
</body>
</html>
