<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/layouts/base.jsp"%>
<!DOCTYPE HTML>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>教师主页-微电子与固体电子学院</title>
	<meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="${ctxsta}/front/css/global.css">
	<link rel="stylesheet" type="text/css" href="${ctxsta}/front/teacher/css/teacherMain.css">
	<link rel="stylesheet" type="text/css" href="${ctxsta}/front/css/copyright.css">
	<link rel="stylesheet" type="text/css" href="${ctxsta}/front/teacher/css/teacherCopyright.css">
	<script type="text/javascript" src="${ctxsta}/front/js/jquery-1.11.0-min.js"></script>
	<style type="text/css">
		.tabContent p {line-height:24px;}
	</style>
</head>
<body>
	            	 
         <div id="search">
			<div>
				<a href="/"><img src="${ctxsta}/front/image/teacherLogo.png"></a>
				<form id="searchArea" action="/me/front/search" method="post">
					<input id="text" type="text" name="keyword" placeholder="搜索">
					<input id="submit" type="submit" value="" title="Click to search">
					<a href="${ctx}/front/advanceSearch">高级搜索</a>
				</form>
			</div>
		</div>
		<div id="introduction">
			<img src="${ctxsta}/front/image/indexBck-teacher.png">
			
			<!-- 学者基本信息 Begin -->
			<div>
				<img id="photo" src="${ctx}${teacher.profilePic }">
				<p id="name">${teacher.name }</p>
				<p id="mail"><img src="${ctxsta}/front/image/mail.gif">${teacher.email }</p>
				<p id="position">${teacher.title }</p>
				<p id="phone"><img src="${ctxsta}/front/image/phone.gif">${teacher.tel }</p>
			</div>
			<!-- 学者基本信息 End -->
		</div>

		<div id="content">
			<div>
			
				<!-- 4个Tab  -->
				<div id="nav">
					<h2 class="selected">个人简介</h2>
					<h2>研究领域</h2>
					<h2>学术成果</h2>
					<h2>学生培养</h2>
				</div>
				
				<div class="clear"></div>
				
				<!-- 4个Tab具体内容 Begin -->
				<div id="words" class="tabContent">
				
				 	<div style="display: block;">
						${teacher.biography }
					</div>
					
					<div style="display: none;">
						${teacher.researchField }
					</div>
					
					<div style="display: none;">
						${teacher.academic }
					</div>
					
					<div style="display: none;">
						${teacher.studentTraining }
					</div>
				</div>
				<!-- 4个Tab具体内容 End  -->
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
			
				<p>All Copyrights Reserved  电子科技大学微电子与固体电子学院</p>
				<p><a href="#">技术支持 XXXXX</a></p>
			</div>
		</div>
		
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
		<script type="text/javascript" src="${ctxsta}/front/teacher/js/showIndex.js"></script>
		<script type="text/javascript" src="${ctxsta}/front/js/slideMenu.js"></script>
	</body>
</html>