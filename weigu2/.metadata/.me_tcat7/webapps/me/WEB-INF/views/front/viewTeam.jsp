<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/layouts/base.jsp"%>
<!DOCTYPE HTML>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>团队主页-教师社区</title>
	<meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="${ctxsta}/front/css/copyright.css">
	<link rel="stylesheet" type="text/css" href="${ctxsta}/front/team/css/global.css">
	<link rel="stylesheet" type="text/css" href="${ctxsta}/front/team/css/teamPage.css">
	
	<script type="text/javascript" src="${ctxsta}/front/js/jquery-1.11.0-min.js"></script>
</head>
<body>
	<div>
		<div id="header">
			<div id="teamName">
				<h1>${team.name }</h1>
			</div>
			<div id="introduction">
				<div>
					<p>科研方向: ${team.researchDirection }</p>
				</div>
			</div>
		</div>

		<div id="position">
			<p>
				<a href="${ctx}/front/index">首页</a> &gt; <a href="${ctx}/front/list?type=12">科研学术</a> &gt; <a href="${ctx}/front/list?type=13">科研团队</a>
			</p>
		</div>

		<div id="content">
			<ul id="contentList">
				<li class="selected"><h2>团队成员</h2></li>
				<li><h2>研究领域</h2></li>
				<li><h2>学术成果</h2></li>
				<li><h2>学生培养</h2></li>
			</ul>
			<span class="contentArea" style="display: block;">
				<table align="center">
				<tbody>
				<c:forEach varStatus="i" var="teamteacher" items="${teamteachers}">
					<c:if test="${i.index%4=='0'  }"><tr></c:if>
						<td width="25%" height="220">
						<p style="text-align:center"><img alt="" height="722" src="${ctx}${teamteacher.profilePic}" width="480"></p>
						<p style="text-align:center;font-size: 17px;"><a href="${ctx}/front/teacherMain?id=${teamteacher.id}">${teamteacher.name}</a></p>
						<div style="width: 480;"><p style="font-size: 10px;text-align:center;word-break:break-all; word-wrap:break-word ;"><a href="${ctx}/front/teacherMain?id=${teamteacher.id}">${teamteacher.teamTitle}</a></p></div>
						</td>
					<c:if test="${i.index%4=='3'  }"></tr></c:if>
				</c:forEach>
				</tbody>
				</table>
			</span>
			<span class="contentArea" style="display: none;">
				${team.researchField }
			</span>
			<span class="contentArea" style="display: none;">
				${team.academic }
			</span>
			<span class="contentArea" style="display: none;">
				${team.studentTraining }
			</span>

		</div>
		<div class="clear"></div>
		<div id="footer">
			<div>
				<ul>
					<li><a href="http://www.me.uestc.edu.cn/old">旧版网站</a></li>
					<li><a href="${ctx}/front/tocontributions">我要投稿</a></li>
					<li><a href="http://www.uestc.edu.cn/?ch/70">公共服务</a></li>
					<li><a href="${ctx}/system/main">管理登陆</a></li>
				</ul>
				<div class="clear">
				</div>
				
				<p>All Copyrights Reserved  电子科技大学微电子与固体电子学院</p>
				<p><a href="#">技术支持 XXXXX</a></p>
			</div>
			<script type="text/javascript" src="${ctxsta}/front/team/js/teamPage.js"></script>
		</div>
	</div>
</body>
</html>