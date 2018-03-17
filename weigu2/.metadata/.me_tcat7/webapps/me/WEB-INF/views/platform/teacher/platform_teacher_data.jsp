<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/layouts/base.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>修改富文本</title>
    <link rel="stylesheet" href="${ctxsta}/common/icheck/flat/green.css" />
     <!-- 配置文件 -->
    <script type="text/javascript" src="${ctxsta}/common/ueditor/ueditor.config.js"></script>
    <!-- 编辑器源码文件 -->
    <script type="text/javascript" src="${ctxsta}/common/ueditor/ueditor.all.js"></script>
  </head>
  
  <body class="gray-bg">
     <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-content">
                            <div class="form-group ">
                                <label class="col-sm-1 control-label">
                                	<c:if test="${type==1}">个人简历</c:if>
                                	<c:if test="${type==2}">研究领域</c:if>
                                	<c:if test="${type==3}">学术成果</c:if>
                                	<c:if test="${type==4}">学生培养</c:if>
                                </label>
								<div class="col-sm-11" onclick="show();">
									<script id="content" name="content" type="text/plain">
										${content}
									</script>
								</div> 
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <div class="col-sm-4 col-sm-offset-4 add-submit">
                                	<input type="hidden" class="form-control" id="teacherid" name="teacher.id" value="${teacher.id}">
                                	<input type="hidden" class="form-control" id="type" name="type" value="${type}">
                                    <button class="btn btn-primary" type="submit" id="submit">提交</button>
                                </div>
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
    <script src="${ctxsta}/platform/js/teacher/teacher-data.js"></script>
	</meFooter>  
</body>
</html>
