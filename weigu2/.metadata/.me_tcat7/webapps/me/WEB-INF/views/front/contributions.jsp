<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/layouts/base.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta content="/image/mediaDefault01.png" itemprop="image">

<title>在线投稿-电子科技大学微电子与固体电子学院</title>

<link rel="stylesheet" type="text/css"
	href="${ctxsta}/front/css/index.css">
<link rel="stylesheet" type="text/css"
	href="${ctxsta}/front/css/global.css">
<link rel="stylesheet" type="text/css"
	href="${ctxsta}/front/css/copyright.css">
<link rel="stylesheet" type="text/css"
	href="${ctxsta}/front/css/articleEdit.css">
<link rel="stylesheet" href="${ctxsta}/common/icheck/flat/green.css" />
<link rel="stylesheet" href="${ctxsta}/common/cropper/css/cropper.min.css" />
<script type='text/javascript'
	src='${ctxsta}/front/js/base/jquery-1.9.1.js'></script>
<script src="${ctxsta}/common/cropper/js/cropper.min.js"></script>
<script type='text/javascript'
	src='${ctxsta}/front/js/common/dropMenu.js'></script>
	    <!-- layer javascript -->
    <script src="${ctxsta}/common/layer/layer.js"></script>
<!-- 配置文件 -->
<script type="text/javascript"
	src="${ctxsta}/common/ueditor/ueditor.config.js"></script>
<!-- 编辑器源码文件 -->
<script type="text/javascript"
	src="${ctxsta}/common/ueditor/ueditor.all.js"></script>
<style type="text/css">
#preview_box {
	width: 543px;
	height: 350px;
	overflow: hidden;
}
</style>
</head>
<body>
	<input type="hidden" id="articleId" name="articleId" value="${articleId }">
	<div id="header">
		<div id="search">
			<div>
				<ul id="service">
					<li><a href="http://www.uestc.edu.cn/?ch/70">&nbsp;&nbsp;学生</a></li>
					<li><a href="http://www.uestc.edu.cn/?ch/76">&nbsp;&nbsp;教职工</a></li>
					<li><a href="http://www.uestc.edu.cn/?ch/79">&nbsp;&nbsp;校友</a></li>
					<li><a href="http://www.uestc.edu.cn/?ch/75">&nbsp;&nbsp;考生及访客</a></li>
				</ul>
				<form id="searchArea" action="" method="post">
					<input id="text" type="text" name="searchKeyVo.keyword"
						placeholder="搜索"> <input id="submit" type="submit"
						value="" title="Click to search"> <a
						href="advancedSearch.html">高级搜索</a>
				</form>
			</div>
		</div>
		<img src="${ctxsta}/front/image/advSBg.jpg" alt="indexBck"
			id="advSHeadBg">

		<div id="hMiddle">
			<div id="logo">
				<a href="http://www.me.uestc.edu.cn/"><img
					src="${ctxsta}/front/image/logo.png"></a>
			</div>

			<div id="navBar">
				<ul>
					<li class="dropEffect"><a href="${ctx}/front/index">首页</a></li>
					<c:forEach items="${menu}" var="menu">
						<li class="dropEffect" style="background: white;"><a
							href="${ctx}/front/list?type=${menu.childCategory[0].id }"><span>${menu.name }</span></a>
							<ul class="submenu"
								style="display: block; padding-top: 0px; margin-top: 0px; padding-bottom: 0px; margin-bottom: 0px; height: 0px;">
								<c:forEach items="${menu.childCategory}" var="child">
									<li><a href="${ctx}/front/list?type=${child.id }">${child.name }</a></li>
								</c:forEach>
							</ul></li>
					</c:forEach>
				</ul>
			</div>
		</div>
	</div>

	<div id="articleEdit">
		<div id="editHeader" class="boxShadow">
			<img src="${ctxsta}/front/image/title_tip.jpg" /><span
				id="categoryName">在线投稿</span> <span id="position">当前位置：网站首页 >
				<span>在线投稿</span>
			</span>
		</div>


		<form id="poste">
			<div id="newsInfo">
				<div id="basicInfo">
					<table>
						<tr>
							<td class="label">标题：</td>
							<td colspan="5"><input id="title" type="text" name="title"
								style="maxLength: 200;" /><span>*一百字以内</span></td>
						</tr>
						<tr>
							<td class="label">作者：</td>
							<td id="authorTd"><input id="author" type="text"
								name="author" /><span>*</span></td>
							<td class="label">来源：</td>
							<td id="sourceTd"><input id="source" type="text"
								name="source" /><span>*</span></td>
							<td class="label">邮箱：</td>
							<td id="emailTd"><input id="email" type="email" name="email" /><span>*</span></td>
						</tr>

						<tr class="table-select">
							<td class="label">新闻分类：</td>
							<td colspan="5"><select name="firstLevel1" id="firstLevel1"
								onchange="refrush();">
									<option value="0">无</option>
							</select> <select class="secondeLevel1" name="categoryId" id="categoryId"
								style="display: none">
							</select></td>
						</tr>
						<!-- 级联 select End-->
					</table>
				</div>
			</div>

			<!-- 内容编辑空间 Begin -->
			<div id="editArea">
				<script id="content" name="content" type="text/plain">
										
				</script>
			</div>
			<!-- 内容编辑空间 End -->
		</form>

		<div class="imgMain" id="imgUploadArea" style="margin-top: 30%;">
			<div class="preview">				
				<img src="${ctxsta}/front/image/noImg.png" id="theirimage"> 
			</div>
			<div class="preview" style="width: 250px;margin-left: 10px;">				
				<img src="" id="myimage"> 
			</div>
			<div class="controlArea" style="width: 100px;float: right">
				<div class="file-box">
						<div id="loading_img" style="display: none;">正在上传...</div>
						<div>
							<input id="upload_btn" type="button" class="btn" value='选择图片' />
						</div>
						<input id="btn1" type="file" accept="image/*,camera" name="filetoupload" capture="camera" style="opacity: 0;"/>
						<p>
							<input id="deleteImg" type="button" value="删除" class="btn" />
						</p>
						<p>
							<input id="info" type="text" placeholder="请输入图片描述" style="height:24px;border:1px #494949 solid;display: none"/>
						</p>
				</div>
			</div>
		</div>
		<!-- 图片区域 End -->

		<div id="submitArea">
			<a class="btn submitButton" id="submitArticle">提交</a>
			<a class="btn submitButton" href="" id="previewArticle">预览</a>
		</div>
	</div>

	<div id="footer">
		<div>
			<ul>
				<li><a href="http://www.me.uestc.edu.cn/old">旧版网站</a></li>
					<li><a href="${ctx}/front/tocontributions">我要投稿</a></li>
					<li><a href="http://www.uestc.edu.cn/?ch/70">公共服务</a></li>
					<li><a href="${ctx}/system/main">管理登陆</a></li>
			</ul>
			<div class="clear"></div>

			<p>All Copyrights Reserved 电子科技大学微电子与固体电子学院</p>
			<p>
				<a href="#">技术支持 XXXXX</a>
			</p>
			</div>
		</div>

		<script>
			var ue = UE.getEditor('content');
			var ctx='${ctx}';
			var ctxsta='${ctxsta}';
			$(function(){
				
			});
		</script>

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
					dataType : 'json',
					type : 'post',
					url : '${ctx}/front/contributionscategory',
					success : function(result) {
							$.each(result, function(index, value, array) {   
								$("#categoryId").append("<option value='"+value.id+"'>"+value.name+"</option>");
							}); 
					}
				})
			}
		</script>
		<script>
			<c:forEach items="${categories}" var="cat" varStatus="i">
				$("#firstLevel1").append("<option value='${cat.id}'>${cat.name }</option>");
			</c:forEach>
		</script>
		<script type="text/javascript" src="${ctxsta}/front/js/page/contributions.js"></script>
		<script type="text/javascript" src="${ctxsta}/front/js/slideMenu.js"></script>
</body>
</html>


