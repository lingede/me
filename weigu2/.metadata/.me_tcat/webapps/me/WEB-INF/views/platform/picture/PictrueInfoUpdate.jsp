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
                        <h5>修改图片描述</h5>
                        <div class="ibox-tools">
                            <a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                            <a class="close-link"><i class="fa fa-times"></i></a>
                        </div>
                    </div>
                    <div class="ibox-content">
                        <form id="Pictureform" class="form-horizontal">
                           <div class="form-group">
                                <label class="col-sm-2 control-label">图片描述：</label>
								<div class="col-sm-4">
									<textarea style="width: 400px;height: 250px;" class="form-control" name="picture.info">${picture.info}</textarea>
                                </div> 
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <div class="col-sm-4 col-sm-offset-4 add-submit">
                                	<input type="hidden" class="form-control" name="picture.id" value="${picture.id}">
                                    <button class="btn btn-primary Picturesubmit" type="submit" id="submit">提交</button>
                                   <!-- <input type="submit" value="提交"/> -->
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
    <script src="${ctxsta}/platform/js/picture/picture-update.js"></script>
	</meFooter>  
</body>
</html>
