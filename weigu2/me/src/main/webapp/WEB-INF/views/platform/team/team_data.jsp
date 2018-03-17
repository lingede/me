<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/layouts/base.jsp"%>
<!DOCTYPE HTML>
<html>
  <head>
    <title>创建用户</title>
    <link rel="stylesheet" href="${ctxsta}/common/icheck/flat/green.css" />
    <!-- 配置文件 -->
    <script type="text/javascript" src="${ctxsta}/common/ueditor/ueditor.config.js"></script>
    <!-- 编辑器源码文件 -->
    <script type="text/javascript" src="${ctxsta}/common/ueditor/ueditor.all.js"></script>
  </head>
  
  <body class="gray-bg">
    <div class="wrapper add-member-content animated fadeInRight">
        <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-content">
                            <div class="form-group ">
                                <label class="col-sm-1 control-label">
                                	<c:if test="${type==1}">研究领域</c:if>
                                	<c:if test="${type==2}">学术成果</c:if>
                                	<c:if test="${type==3}">学生毕业</c:if>
                                	<c:if test="${type==4}">合作单位</c:if>
                                </label>
								<div class="col-sm-11">
									<script id="content" name="content" type="text/plain">
										${content}
									</script>
								</div> 
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <div class="col-sm-4 col-sm-offset-4 add-submit">
                                	<input type="hidden" class="form-control" id="teamid" name="team.id" value="${team.id}">
                                	<input type="hidden" class="form-control" id="type" name="type" value="${type}">
                                    <button class="btn btn-primary" type="submit" id="submit">提交</button>
                                </div>
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
    <script src="${ctxsta}/platform/js/team/team-data.js"></script>
	</meFooter>  
</body>
</html>
