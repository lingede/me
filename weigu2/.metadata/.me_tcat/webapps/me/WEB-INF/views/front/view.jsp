<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/layouts/base.jsp"%>
<!DOCTYPE HTML>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>${view.title }-电子科技大学微电子与固体电子学院</title>
		<meta charset="utf-8">
		<link rel="stylesheet" type="text/css" href="${ctxsta}/front/css/global.css">
		<link rel="stylesheet" type="text/css" href="${ctxsta}/front/css/copyright.css">
		<link rel="stylesheet" type="text/css" href="${ctxsta}/front/css/newsContent.css">
		
		<script type="text/javascript" src="${ctxsta}/front/js/jquery-1.11.0-min.js"></script>
		<script type="text/javascript" src="${ctxsta}/front/js/base/jquery-ui-1.9.2.min.js"></script>
		<script type="text/javascript" src="${ctxsta}/front/js/common/dropMenu.js"></script>
	</head>
	<body>
		<div id="header">
	        
            <div id="search">
				<div>
					<ul id="service">
						<li><a href="http://www.uestc.edu.cn/?ch/70">&nbsp;&nbsp;学生</a></li>
						<li><a href="http://www.uestc.edu.cn/?ch/76">&nbsp;&nbsp;教职工</a></li>
						<li><a href="http://www.uestc.edu.cn/?ch/79">&nbsp;&nbsp;校友</a></li>
						<li><a href="http://www.uestc.edu.cn/?ch/75">&nbsp;&nbsp;考生及访客</a></li>
					</ul>
					<form id="searchArea" action="/me/front/search" method="post">
						<input id="text" type="text" name="keyword" placeholder="搜索">
						<input id="submit" type="submit" value="" title="Click to search">
						<a href="${ctx}/front/advanceSearch">高级搜索</a>
					</form>
				</div>
			</div>
			
		    <img src="${ctxsta}/front/image/advSBg.jpg" alt="indexBck" id="advSHeadBg">
			
			<div id="hMiddle">			
				<div id="logo">
					<a href="${ctx}/front/index"><img src="${ctxsta}/front/image/logo.png"></a>
				</div>
	
				<!-- NavBar Begin-->
				<div id="navBar">
					<ul>
						<li class="dropEffect">
							<a href="${ctx}/front/index">首页</a>
						</li>
						<c:forEach items="${menu}" var="menu">
							<li class="dropEffect" style="background: white;">
								<a href="${ctx}/front/list?type=${menu.childCategory[0].id }"><span>${menu.name }</span></a>
								<ul class="submenu" style="display: block; padding-top: 0px; margin-top: 0px; padding-bottom: 0px; margin-bottom: 0px; height: 0px;">
									<c:forEach items="${menu.childCategory}" var="child">
										<li><a href="${ctx}/front/list?type=${child.id }">${child.name }</a></li>
									</c:forEach>
								</ul>
							</li>
						</c:forEach>
					</ul>
				</div>
				<!-- NavBar End-->
			</div>
		</div>
		<div id="content">
			<div id="newsList">
				<h2>${parent.name }</h2>
				<ul>
					<c:forEach items="${all}" var="all">
						<li <c:if test="${all.name == current.name }">id="currentTitle"</c:if>>
				 			<a href="list?type=${all.id }">${all.name }</a>
						</li>
					</c:forEach>
				</ul>
			</div>
			<div id="newsBox">
				<p>
					当前位置：<a href="${ctx}/front/index">网站首页</a> &gt; <a href="${ctx}/front/list?type=${all[0].id}">${parent.name }</a> &gt;
					<a href="#">${current.name }</a>
				</p>
				<div id="article">
					<div id="newsTitle">
						<h2>${view.title }</h2>
						<div>
							<h3>作者：${view.author }</h3>
							<h3>来源：${view.source }</h3>
							<h3>阅读次数：${view.numOfRead }</h3>
							<h3>日期：<fmt:formatDate value="${view.createTime }" pattern="yyyy/MM/dd"/></h3>
						</div>
					</div>
					<div id="photoArea" align="center" style="margin-top: 10px;">
						<c:if test="${view.titleimg != null}">
							<img alt="" src="${ctx }/${view.titleimg }">
						</c:if>
					</div>
					<div id="newsContent">
						<p>${view.content }</p>
						
					</div>
					
					<c:if test="${!empty file }">
						<div id="attachment">
						<img src="${ctxsta}/front/image/attachment.png">
						<div>
							<p>
								<c:forEach items="${file }" var="file">
									<a href="${ctx}/${file.path}">${file.info }</a>
								</c:forEach>
							</p>
						</div>
					</div>
					</c:if>
					
					<div id="preAndNext" style="font-size: 12px">
							<p id="pre">
							   <c:if test="${!empty preview}">
							   	上一篇：<a href="${ctx}/front/view?type=${preview.categoryId }&id=${preview.id }">${preview.title }</a>
							   </c:if> 
						    </p>
							<p id="next">
								<c:if test="${!empty nextview}">
								 下一篇：<a href="${ctx}/front/view?type=${nextview.categoryId }&id=${nextview.id }">${nextview.title }</a>
								</c:if>
							   
						    </p>
						</div>
				</div> 
					
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
			var loginForm = document.getElementById('searchArea');
		    var go = document.getElementById('submit');
		    go.onclick = function(){
		        var keyword = loginForm.keyword.value
		        //这里判断了用户名的输入不能为空，且长度为6-16位
		        if(keyword && (typeof(keyword)!='undefined')){
		            //验证通过，提交表单数据
		            loginForm.submit();
		        }else{
		            alert('请输入搜索关键字');
		            return false;
		        }
		    }
		</script>
		<script type="text/javascript" src="${ctxsta}/front/js/slideMenu.js"></script>
	
</body>
</html>