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
                    </div>
                    <div class="ibox-content">
                        <form id="userCategoryform" class="form-horizontal">
                             <div class="form-group">
                              <label class="col-sm-2 control-label">管理栏目：</label>
                                <div class="col-sm-6">
									<div id="ztreedemo" class="ztree"></div>
                                </div>
                             </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <div class="col-sm-4 col-sm-offset-4 add-submit">
                                	<input type="hidden" class="form-control" name="systemUser.id" value="${systemUser.id}">
                                    <button class="btn btn-primary userCategorysubmit" type="button" id="submit">提交</button>
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
    <script src="${ctxsta}/admin/main/js/user_category.js"></script>
	</meFooter>  
</body>
</html>
