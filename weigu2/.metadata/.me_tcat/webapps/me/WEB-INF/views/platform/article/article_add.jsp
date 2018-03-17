<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/layouts/base.jsp"%>
<!DOCTYPE HTML>
<html>
  <head>
    <title>编辑可维护页</title>
    <link rel="stylesheet" href="${ctxsta}/common/icheck/flat/green.css" />
    <link type="text/css" rel="stylesheet" href="${ctxsta}/common/ztree/css/metroStyle/metroStyle.css" />
     <!-- 引入css -->
     <link type="text/css" rel="stylesheet" href="${ctxsta}/common/bootstrap/css/bootstrap.min.css" />
     <link type="text/css" rel="stylesheet" href="${ctxsta}/common/bootstrap-datepicker-master/css/bootstrap-datetimepicker.min.css" />
  </head>
  
  <body class="gray-bg">
    <div class="wrapper add-member-content animated fadeInRight">
        <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>编辑新闻</h5>
                    </div>
                    <div class="ibox-content">
                        <form id="articleaddform" class="form-horizontal">
                  
                     
                             <div class="hr-line-dashed"></div>
                             <div class="form-group">
                                <label class="col-sm-2 control-label">父级栏目：</label>
                                <div class="col-sm-9" >
									<select name="firstLevel1" id="firstLevel1" onchange="refrush();">
											<option value="0">无</option>
										</select>
                                </div>
                            </div>
                             <div class="hr-line-dashed"></div>
                              <div class="form-group">
                                <label class="col-sm-2 control-label">子栏目：</label>
                                <div class="col-sm-9" >
									<select class="secondeLevel1" name="categoryId" id="categoryId" style="display: none">
										</select>  
                                </div>
                            </div>
                             <div class="hr-line-dashed"></div>
                             <div class="form-group">
                              <label class="col-sm-2 control-label">标题：</label>
								 <div class="col-sm-4">
                                
                                	<input type="text"  class="form-control" name="title" value="${article.title}">
                                 </div> 
                                 
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                              <label class="col-sm-2 control-label">创建时间：</label>
								 <div class="col-sm-4">   
								 <fmt:formatDate var="newdate" value="${article.createTime}" pattern="yyyy-MM-dd"/>								                      
                                	<input type="text" id="createTime"  class="form-control" name="createTime" value="${newdate}" data-date-format="yyyy-mm-dd" >
                                 </div> 
                                 
                            </div>
                            <div class="hr-line-dashed"></div>
                              <div class="form-group">
                              <label class="col-sm-2 control-label">标题图片：</label>
								 <div class="col-sm-4">
                                
                                	<input  type="file" class="projectfile" name="titleimg"  value="${article.titleimg}">
                                 </div> 
                                 
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">新闻内容：</label>
                                <div class="col-sm-9" >
									<script id="Content" type="text/plain" style="width:100%;height:400px;" >
										${article.content}
									</script> 
                                </div>
                            </div>
                             <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <div class="col-sm-4 col-sm-offset-4 add-submit">
                                	<input type="hidden" class="form-control" name="id" id="id" value="${article.id}">
                                	<input type="hidden" class="form-control" name="content" id="content">
                                    <button class="btn btn-primary articlesubmit" type="button" id="submit">提交</button>
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
   	<script type="text/javascript">
			$('.dropEffect ul, #choiceList, #announceList>li').hide();
			$('#announceList #0').show();
			$('.dropEffect').hover(
				function(){
					$(this).children('ul').stop().slideDown(200);
				},function(){
					$(this).children('ul').stop().slideUp(200);
				}
			);
		</script>
		<script>
		var fatherCategory;
			function refrush(){
				fatherCategory=$("#firstLevel1").val();
				if($("#firstLevel1").val()!=0){
					$("#categoryId").show();
					$("#categoryId").empty();
					getSecLevel();
				}else{
					$("#categoryId").hide();
					$("#categoryId").empty();
					fatherCategory=null;
				}
				
			}
		
			function getSecLevel(){
				$.ajax({
					data : {
						fatherCategory :fatherCategory
					},
					async: false,
					dataType : 'json',
					type : 'post',
					url : '${ctx}/front/seachcategory',
					success : function(result) {
							$.each(result, function(index, value, array) {   
								$("#categoryId").append("<option value='"+value.id+"'>"+value.name+"</option>");
							}); 
					}
				})
			}
		</script>
		
        <script>
			<c:forEach items="${categoryList}" var="categorytype" varStatus="i">
				$("#firstLevel1").append("<option value='${categorytype.id}'>${categorytype.name }</option>");
			</c:forEach>
			$("#firstLevel1").val('${article.firstCategory}');
		    $("#firstLevel1").trigger("change");  
		    $("#categoryId").val('${article.categoryId}');
		</script>
	<script src="${ctxsta}/common/icheck/icheck.min.js"></script>
	 <!-- bootstrapvalidator-master前端验证框架 -->
	<script src="${ctxsta}/common/bootstrapvalidator-master/js/bootstrapValidator.min.js"></script>
	<!-- layer javascript -->
    <script src="${ctxsta}/common/layer/layer.js"></script>
    <script type="text/javascript" src="${ctxsta}/common/ztree/jquery.ztree.all.min.js"></script>
    <script type="text/javascript" src="${ctxsta}/common/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" src="${ctxsta}/common/ueditor/ueditor.all.js"></script>
    <script type="text/javascript" src="${ctxsta}/platform/js/teacher/fileinput.js"></script>
	<script type="text/javascript" src="${ctxsta}/common/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${ctxsta}/common/bootstrap-datepicker-master/js/bootstrap-datetimepicker.js" charset="UTF-8"></script>
	<script type="text/javascript" src="${ctxsta}/common/bootstrap-datepicker-master/locales/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>
	<!-- 自定义js -->
	<!-- 实例化编辑器 -->
	<script type="text/javascript">
	    var ue = UE.getEditor('Content');
	</script>
    <script type="text/javascript" src="${ctxsta}/platform/js/article/article-add.js"></script>
     <script type="text/javascript" src="${ctxsta}/platform/js/teacher/fileinput.js"></script>
     <script type="text/javascript" src="${ctxsta}/platform/js/teacher/zh.js"></script>
     <script type="text/javascript">
       $( function() {
        $("#createTime").datetimepicker({
        		language: 'zh-CN',
                weekStart: 1,
                todayBtn:  1,
        		autoclose: 1,
        		todayHighlight: 1,
        		startView: 2,
        		minView: 2,
        		forceParse: 0
            })
          });
                             	
      </script>
	</meFooter>  
</body>
</html>
