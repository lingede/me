<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/layouts/base.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>添加教师</title>
    <link rel="stylesheet" href="${ctxsta}/common/icheck/flat/green.css" />
    <!-- 引入css -->
     <link type="text/css" rel="stylesheet" href="${ctxsta}/platform/js/teacher/fileinput.css" />
  </head>
  
  <body class="gray-bg">
    <div class="wrapper add-member-content animated fadeInRight">
        <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5><c:if test="${empty teacher}">创建教师</c:if><c:if test="${!empty teacher}">修改教师信息</c:if></h5>
                        <div class="ibox-tools">
                            <a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                            <a class="close-link"><i class="fa fa-times"></i></a>
                        </div>
                    </div>
                    <div class="ibox-content">
                        <form id="teacherform"  class="form-horizontal"    >
                            
                             
                             <div class="form-group">
                              <label class="col-sm-2 control-label">用户名：</label>
								<div class="col-sm-4">
                                	<input type="text" maxlength="30" class="form-control" name="username" value="${teacher.username}">
                                </div> 
                             </div> 
                            <div class="hr-line-dashed"></div>
                             <div class="form-group">
                              <label class="col-sm-2 control-label">姓名：</label>
								<div class="col-sm-4">
                                	<input type="text" maxlength="60" class="form-control" name="name" value="${teacher.name}">
                                </div> 
                             </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                              <label class="col-sm-2 control-label">头像：</label>
								 <div class="col-sm-4">
                                
                                	<input  type="file" class="projectfile" name="profilePic"  value="${teacher.profilePic }">
                                 </div> 
                                 
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                              <label class="col-sm-2 control-label">头衔：</label>
								<div class="col-sm-4">
                                	<input type="text" maxlength="30" class="form-control" name="title" value="${teacher.title}">
                                </div> 
                             </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                              <label class="col-sm-2 control-label">团队头衔：</label>
								<div class="col-sm-4">
                                	<input type="text" maxlength="30" class="form-control" name="teamTitle" value="${teacher.teamTitle}">
                                </div> 
                             </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                              <label class="col-sm-2 control-label">邮箱：</label>
								<div class="col-sm-4">
                                	<input type="text" maxlength="30" class="form-control" name="email" value="${teacher.email}">
                                </div> 
                             </div>
                              <div class="hr-line-dashed"></div>
                            <div class="form-group">
                              <label class="col-sm-2 control-label">电话：</label>
								<div class="col-sm-4">
                                	<input type="text" maxlength="30" class="form-control" name="tel" value="${teacher.tel}">
                                </div> 
                             </div>
                             <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <div class="col-sm-4 col-sm-offset-4 add-submit">
                                	<input type="hidden" class="form-control" name="id" value="${teacher.id}">
                                    <button class="btn btn-primary teachersubmit" type="button" id="submit">提交</button>
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
	<!-- 引入js -->
	
    <script type="text/javascript" src="${ctxsta}/platform/js/teacher/fileinput.js"></script>
    <script type="text/javascript" src="${ctxsta}/platform/js/teacher/zh.js"></script>
    <script src="${ctxsta}/platform/js/teacher/teacher-add.js"></script>
	</meFooter>  
</body>
</html>
