<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/layouts/base.jsp"%>
<!DOCTYPE html>

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta charset="UTF-8">
	<meta content="${ctxsta}/front/image/mediaDefault01.png" itemprop="image">
	
	<title>高级搜索-电子科技大学微电子与固体电子学院</title>

	<link rel="stylesheet" type="text/css" href="${ctxsta}/front/css/index.css">
	<link rel="stylesheet" type="text/css" href="${ctxsta}/front/css/global.css">
	<link rel="stylesheet" type="text/css" href="${ctxsta}/front/css/copyright.css">
	<link rel="stylesheet" type="text/css" href="${ctxsta}/front/css/advancedSearch.css">
	<link rel="stylesheet" type="text/css" href="${ctxsta}/front/css/page/advancedSearch.css">
	<link rel="stylesheet" type="text/css" href="${ctxsta}/front/jquery-ui-1.10.3.custom/css/start/jquery-ui-1.10.3.custom.css">
	
	<script type="text/javascript" src="${ctxsta}/front/js/jquery-1.11.0-min.js"></script>
	<script type="text/javascript" src="${ctxsta}/front/js/base/jquery-1.9.1.js"></script>
	<script type="text/javascript" src="${ctxsta}/front/js/common/dropMenu.js"></script>
	<script type="text/javascript" src="${ctxsta}/front/jquery-ui-1.10.3.custom/js/jquery-ui-1.10.3.custom.min.js"></script>
	<script type="text/javascript" src="${ctxsta}/front/jquery-ui-1.10.3.custom/js/jquery.ui.datepicker-zh-CN.js"></script>
	
	<script>
		$(function() {
			$(".datepicker").datepicker({
				dateFormat : "yy-mm-dd",
				autoSize : true
			});
			dropMenu(".drop-menu-effect");
			$("#submitButton").click(function(){
				$("#ss").submit();
			});
		})
	</script>
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
					<a href="http://www.me.uestc.edu.cn/"><img src="${ctxsta}/front/image/logo.png"></a>
				</div>
	
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
			</div>
		</div>

		<div id="content">
			<div id="cMiddle">
				<div id="cHead">
					<p>
						<img src="" alt="">
						<span style="font-size:17px;">高级搜索</span>
						<span id="fRight"><a href="">当前位置 </a>&gt;<a href="http://www.me.uestc.edu.cn/"> 网站首页 </a>&gt;<a href="http://www.me.uestc.edu.cn/list?type=9"> 新闻中心</a></span>
					</p>
				</div>
				<form action="${ctx}/front/search" method="post" id="form">
					<div id="searchInfo">
						<span>搜索信息</span>
						<div>
							<p>
								<label for="author">作   者</label>:
								<input type="text" name="author" id="author">
							</p>
							<p>
								<label for="keysearch">标题关键字</label>:
								<input type="text" name="keyword">
							</p>
							<p style="float:left">
								<label for="startStopTime" >起止时间</label>:
								<input type="text" name="startTime" class="datepicker">-
								<input type="text" name="endTime" class="datepicker">
							</p>
						</div>
					</div>
					
					<div id="typeOpt">
						<span>选择分类</span>
						<table id="classify" border="0" cellspacing="0" cellpadding="0">
						
							<tbody>
								<tr class="table-select">
									<td class="label">新闻分类：</td>
									<td colspan="5">
										<select name="firstLevel1" id="firstLevel1" onchange="refrush();">
											<option value="0">无</option>
										</select>
										<select class="secondeLevel1" name="categoryId" id="categoryId" style="display: none">
										</select>  
									</td>
								</tr>
								
							</tbody>
						</table>
					</div>
					<p style="width:100%; text-align:center;">
					<input type="submit" id="test" name="search" value="搜索一下"></p>
				</form>
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
				<div class="clear">
			</div>
			</div>
			
			<p>All Copyrights Reserved  电子科技大学微电子与固体电子学院</p>
			<p><a href="#">技术支持 XXXXX</a></p>
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
			<c:forEach items="${menu}" var="menu" varStatus="i">
				$("#firstLevel1").append("<option value='${menu.id}'>${menu.name }</option>");
			</c:forEach>
		</script>
		
		
		
		<script type="text/javascript" src="${ctxsta}/front/js/slideMenu.js"></script>
					<script>
							var loginForm = document.getElementById('form');
						    var go = document.getElementById('test');
						    go.onclick = function(){
						        var keyword = loginForm.keyword.value;
						        var author = loginForm.author.value;
						        var startTime = loginForm.startTime.value;
						        var endTime = loginForm.endTime.value;
						        var categoryId=loginForm.categoryId.value;
						        //这里判断了用户名的输入不能为空，且长度为6-16位
						        if((keyword && (typeof(keyword)!='undefined'))
						        		||(author && (typeof(author)!='undefined'))
						        				||(startTime && (typeof(startTime)!='undefined'))
						        				||(endTime && (typeof(endTime)!='undefined'))
						        				||(categoryId && (typeof(categoryId)!='undefined'))){
						            //验证通过，提交表单数据
						            loginForm.submit();
						        }else{
						            alert('请至少输入一个条件');
						            return false;
						        }
						    }
						    
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
</body></html>