<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/layouts/base.jsp"%>
<!DOCTYPE HTML>
<html>
  <head>
    <title>编辑链接</title>
    <link rel="stylesheet" href="${ctxsta}/common/icheck/flat/green.css" />
    <link type="text/css" rel="stylesheet" href="${ctxsta}/common/ztree/css/metroStyle/metroStyle.css" />
  </head>
  
  <body class="gray-bg">
    <div class="wrapper add-member-content animated fadeInRight">
        <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5><c:if test="${empty linkpage}">创建链接</c:if><c:if test="${!empty linkpage}">修改链接</c:if></h5>
                    </div>
                    <div class="ibox-content">
                        <form id="linkpageaddform" class="form-horizontal">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">关联栏目：</label>
								<div class="col-sm-4">
									<div id="ztreedemo" class="ztree"></div>
                                </div> 
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">关联URL：</label>
                                <div class="col-sm-4">
									<input type="text" class="form-control" name="url" id="url" value="${linkpage.url}">
                                </div>
                            </div>
                             <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <div class="col-sm-4 col-sm-offset-4 add-submit">
                                	<input type="hidden" class="form-control" name="id" id="linkpageid" value="${linkpage.id}">
                                    <button class="btn btn-primary linkpagesubmit" type="button" id="submit">提交</button>
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
    <script type="text/javascript" src="${ctxsta}/common/ztree/jquery.ztree.all.min.js"></script>
	<!-- 自定义js -->
	<script type="text/javascript">
		var treedata='${jsoncategory}';
		$(function(){
			initMenuTree(treedata);
		});
	</script>
    <script src="${ctxsta}/platform/js/category/linkpage-add.js"></script>
	</meFooter>  
</body>
</html>
