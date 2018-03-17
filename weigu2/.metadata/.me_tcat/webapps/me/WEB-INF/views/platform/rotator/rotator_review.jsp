<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/layouts/base.jsp"%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>首页-电子科技大学微电子与固体电子学院</title>
<meta name="renderer" content="webkit">
<link rel="stylesheet" type="text/css"
	href="${ctxsta}/front/css/index.css">
<link rel="stylesheet" type="text/css"
	href="${ctxsta}/front/css/global.css">
<link rel="stylesheet" type="text/css"
	href="${ctxsta}/front/css/copyright.css">
<link rel="stylesheet" type="text/css"
	href="${ctxsta}/front/css/extra.css">
<style type="text/css">
#header {
	z-index: 3
}

#content {
	z-index: 3
}
#focus .abstract p {
    font-size: 12px;
    margin-top: 4px;
    color: #4e4e4e;
}
.abstract p{
    display: block;
    -webkit-margin-before: 1em;
    -webkit-margin-after: 1em;
    -webkit-margin-start: 0px;
    -webkit-margin-end: 0px;
}
.weixin {
	position: fixed;
	right: 0;
	bottom: 0;
	z-index: 999
}

.weixin .xixi {
	display: none
}

.weixin:hover .xixi {
	position: absolute;
	display: block;
	right: 60px;
	bottom: 0;
	z-index: 999;
	background-color: #fff
}

.twoLineEllipsis {
	max-height: 42px;
	overflow: hidden;
	text-overflow: ellipsis;
	display: -webkit-box;
	-webkit-line-clamp: 2;
	-webkit-box-orient: vertical;
}
</style>
<script type="text/javascript"
	src="${ctxsta}/front/js/jquery-1.11.0-min.js"></script>
<script src="${ctxsta}/front/js/jquery.cycle.all.js"></script>
<script src="${ctxsta}/front/js/jquery.easing.1.3.js"></script>
</head>
<body>
	<input type="hidden" value="${rotatorID}" id="rotatorID"/>
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
		<img src="${ctxsta}/front/image/indexBck.png" alt="indexBck"
			id="headBg">
		<div id="hMiddle">
			<div id="logo">
				<a href="http://www.me.uestc.edu.cn/"><img
					src="${ctxsta}/front/image/logo.png"></a>
			</div>
			<!-- NavBar Begin-->
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
			<!-- NavBar End-->

			<!-- SlidePage图片轮播 Begin -->
			<div class="showContainer">
				<div class="showBox">
					<a href="#" class="slidePrev" style="left: -40px;"><span>&lt;</span></a>
					<a href="#" class="slideNext" style="right: -40px;"><span>&gt;</span></a>
					<div class="slidePage"></div>
						<div class="slideBox" style="bottom: 0px;">
							<div class="data">
								<h2><a href="http:/#">最美银杏季0</a></h2>
							</div>
					</div>
					<div id="slide" class="slideshow"></div>
				</div>
			</div>
			<!-- SlidePage图片轮播 End -->
		</div>
	</div>
	<!-- header End -->
	<div id="content">
		<div id="leftSide">
			<div id="focus">
				<p>
					<img src="${ctxsta}/front/image/focus.png"> <span>焦点新闻</span>
					<a href="${ctx}/front/list?type=11">more</a>
				</p>
			</div>
			<div id="news">
				<p>
					<img src="${ctxsta}/front/image/news.png"> <span>综合新闻</span>
					<a href="${ctx}/front/list?type=10">more</a>
				</p>
			</div>
			<div id="academic">
				<p>
					<img src="${ctxsta}/front/image/academic.png"> <span>学术看板</span>
					<a href="${ctx}/front/list?type=12">more</a>
				</p>
			</div>
		</div>
		<!-- leftSide End -->

		<!-- rightSide Begin -->
		<div id="rightSide">
			<p>
				<a href="${ctx}/front/list?type=29"
					style="position: absolute; right: 0;">more</a>
			</p>
			<span id="navLeft"> <span><img id="triangle"
					src="${ctxsta}/front/image/triangle1.png" width="10" height="10">&nbsp;
					<span id="chgText">信息公告</span> </span>
			</span>
			<ul id="announceList">
			</ul>
			<a href="http://www.me.uestc.edu.cn/list?type=49"><img
				src="${ctxsta}/front/image/new_bottom.png" height="55px"
				width="365px"></a>
		</div>
		<!-- rightSide End -->
	</div>
	<div class="clear"></div>
	<div id="guide">
		<select id="hot"
			onChange="window.open(this.options[this.selectedIndex].value);">
			<option value="">学院热点链接</option>
			<option value=" http://www.etfid.uestc.edu.cn/">电子薄膜与集成器件国家重点实验室</option>
			<option value="http://www.erc.uestc.edu.cn/">国家电磁辐射控制材料工程技术研究中心</option>
			<option value="#">电子信息材料试验教学示范中心</option>
			<option value="http://www.me.uestc.edu.cn/stu">微固快讯</option>
		</select> <select id="school"
			onChange="window.open(this.options[this.selectedIndex].value);">
			<option value="">其他学院链接</option>
			<option value="http://www.scie.uestc.edu.cn/new/">通信与信息工程学院</option>
			<option value="http://www.ee.uestc.edu.cn/2008/index/index.php">电子工程学院</option>
			<option value="http://www.pe.uestc.edu.cn/">物理电子学院</option>
			<option value="http://www.ccse.uestc.edu.cn/">计算机工程学院</option>
			<option value="http://www.auto.uestc.edu.cn/">自动化工程学院</option>
			<option value="http://www.jxdz.uestc.edu.cn/">机械电子工程学院</option>
			<option value="http://www.soei.uestc.edu.cn/">光电信息学院</option>
			<option value="http://www.life.uestc.edu.cn/">生命科学与技术学院</option>
			<option value="http://www.math.uestc.edu.cn/">数学科学学院</option>
			<option value="http://www.mgmt.uestc.edu.cn/">经济与管理学院</option>
			<option value="http://www.rw.uestc.edu.cn/">政治与公共管理学院</option>
			<option value="http://www.fl.uestc.edu.cn/">外国语学院</option>
			<option value="http://www.sport.uestc.edu.cn/">体育部</option>
			<option value="http://www.ss.uestc.edu.cn/">软件学院</option>
			<option value="http://www1.cduestc.cn/newgt/index.asp">成都学院</option>
			<option value="http://www.zsc.edu.cn/">中山学院</option>
			<option value="http://www.iaa.uestc.edu.cn/">空天科学技术研究院</option>
			<option value="http://riest.uestc.edu.cn/">电子科学技术研究院</option>
		</select> <select id="department"
			onChange="window.open(this.options[this.selectedIndex].value);">
			<option value="">学校部门链接</option>
			<option value="http://202.112.14.184/department/default.aspx?site=64">学校办公室</option>
			<option value="http://jjs.uestc.edu.cn/">纪律检查委员会</option>
			<option value="http://202.112.14.184/department/Default.aspx?site=66">党委组织部</option>
			<option value="http://202.112.14.184/department/default.aspx?site=67">党委宣传部</option>
			<option value="http://202.112.14.184/department/Default.aspx?site=68">党委学生工作部</option>
			<option value="http://202.112.14.184/department/default.aspx?site=70">人事处</option>
			<option value="http://202.112.14.184/department/Default.aspx?site=71">教务处</option>
			<option value="http://202.112.14.184/department/default.aspx?site=72">科技处</option>
			<option value="http://202.112.14.184/department/default.aspx?site=73">研究生院</option>
			<option value="http://202.112.14.184/Department/Default.aspx?site=93">合作发展部</option>
			<option value="http://202.112.14.184/department/default.aspx?site=74">计划财务处</option>
			<option value="http://202.112.14.184/department/default.aspx?site=75">国有资产与实验管理处</option>
			<option value="http://www.oice.uestc.edu.cn/">国际合作交流处</option>
			<option value="http://202.112.14.184/department/default.aspx?site=77">产业处</option>
			<option value="http://202.112.14.184/department/default.aspx?site=78">保卫处</option>
			<option value="http://202.112.14.184/department/default.aspx?site=79">继续教育学院</option>
			<option value="http://202.112.14.184/department/default.aspx?site=80">基建处
			</option>
			<option value="http://202.112.14.184/department/Default.aspx?site=81">后勤管理处
			</option>
		</select>

		<div class="weixin">
			<img src="${ctxsta}/front/image/wx-icon.png" width="50" height="50">
			<div class="xixi">
				<img src="${ctxsta}/front/image/weixin.jpg" width="150" height="150">
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
			<p>All Copyrights Reserved 电子科技大学微电子与固体电子学院</p>
			<p>
				<a href="#">技术支持 XXXXX</a>
			</p>
		</div>
	</div>

	<script type="text/javascript" src="${ctxsta}/front/js/slideMenu.js"></script>

	<script>
					$(function() {
						getRotator();
						focusnews();
						generalnews();
						scienceBoard();
						information();
					});
					
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

	<script>
				function getRotator(){
					/* var id = $("#rotatorID").val();
					$.ajax({
						data:{id:id},
						ansync:false,
						dataType : 'json',
						type : 'post',
						url : '${ctx}/platform/rotator/list/review',
						success : function(result) {
							var str;
								$.each(result, function(index, rotator, array) {
									str = "<div id='"+rotator.id+"' class='slideItem'"+
									"style='position: absolute; top: 0px; left: 0px; width: 1180px; height: 435px; z-index: 4; display:none; opacity: 0;'>"+
									"<div class='image'>"+
										"<img src='${ctxsta}/front/"+rotator.path+"' height='400px' width='1180px'></div>"+
									"<div class='data'>";
									if(rotator.articleId){
										str = str + "<h2><a href='${ctx}/front/view?type="+rotator.type+"&id="+rotator.articleId+"'>"+rotator.title+"</a></h2>"
									}else{
										str = str + "<h2><a href='#'>"+rotator.title+"</a></h2>"
									}
									
								}); 
								$("#slide").html(str +"</div></div>");		
								slide();
						}
					})  */
					
					$.ajax({
						ansync:false,
						dataType : 'json',
						type : 'post',
						url : '${ctx}/front/rotatorFront',
						success : function(result) {
							var str;
								$.each(result, function(index, rotator, array) {
									str = "<div id='"+rotator.id+"' class='slideItem'"+
									"style='position: absolute; top: 0px; left: 0px; width: 1180px; height: 435px; z-index: 4; display:none; opacity: 0;'>"+
									"<div class='image'>"+
										"<img src='${ctxsta}/front/"+rotator.path+"' height='400px' width='1180px'></div>"+
									"<div class='data'>";
									if(rotator.articleId){
										str = str + "<h2><a href='${ctx}/front/view?type="+rotator.type+"&id="+rotator.articleId+"'>"+rotator.title+"</a></h2>"
									}else{
										str = str + "<h2><a href='#'>"+rotator.title+"</a></h2>"
									}
									
								}); 
								$("#slide").html(str +"</div></div>");		
								slide();
						}
					})
					
				}
				function slide(){
					$('#slide').cycle({
        				fx: 'fade',		
						speed:  900, 
						timeout: 5000, 
						pager: '.showBox .slidePage', 
        				prev: '.showBox .slidePrev',
        				next: '.showBox .slideNext',
						before: function(currSlideElement, nextSlideElement) {
							console.log(22);
							var data = $('.data', $(nextSlideElement)).html();
							$('.showBox .slideBox').stop(true, true).animate({ bottom:'-110px'}, 400, function(){
								$('.showBox .slideBox .data').html(data);
							});
							$('.showBox .slideBox').delay(100).animate({ bottom:'0'}, 400);
						}
   			  		});

					$('.showBox').mouseenter(function(){
						$('#slide').cycle('pause');
						$('.showBox .slidePrev').stop(true, true).animate({ left:'20px'}, 200);
						$('.showBox .slideNext').stop(true, true).animate({ right:'20px'}, 200);
    				}).mouseleave(function(){
						$('#slide').cycle('resume');
						$('.showBox .slidePrev').stop(true, true).animate({ left:'-40px'}, 200);
						$('.showBox .slideNext').stop(true, true).animate({ right:'-40px'}, 200);
    				});
				}
				</script>
				<script>
				function focusnews(){
					$.ajax({
						ansync:false,
						dataType : 'json',
						type : 'post',
						url : '${ctx}/front/focusNews',
						success : function(result) {
							alert(result[0]["path"]);
							var newsStr;
								$.each(result, function(index, focus, array) {
									newsStr = "id='"+focus.articleId+
									"'><a href='${ctx}/front/view?type="+focus.type+"&id="+focus.articleId+"' title='"+focus.title+"'>"+
									"<img src='${ctxsta}/front/upload/"+focus.titleimg+"'></a><p>"+focus.pdate+"</p>"+
								    "<div class='abstract'><h4><a href='${ctx}/front/view?type="+focus.type+"&id="+focus.articleId+"' title='"+focus.title+"' class='lineEllipsis'>"+
									focus.title+"</a></h4><p>"+focus.content;
									if(index<2&&focus.days<=7){
										newsStr = "<div style='margin-right: 10px;' "+newsStr+"<img src='${ctxsta}/front/image/new.png'></p></div></div>";
										}else if(index<2&&focus.days>7){
										newsStr = "<div style='margin-right: 10px;' "+newsStr+"</p></div></div>";
										}else if(index>1&&focus.days<=7){
										newsStr ="<div style='margin-right: 0px;' "+newsStr+"<img src='${ctxsta}/front/image/new.png'></p></div></div>";
										}else{
										newsStr ="<div style='margin-right: 0px;' "+newsStr+"</p></div></div>";
									}
									$("#focus").append(newsStr);
								}); 
								
						}
					})
					
				}
				
				</script>
				<script>
				function generalnews(){
					$.ajax({
						ansync:false,
						dataType : 'json',
						type : 'post',
						url : '${ctx}/front/generalNews',
						success : function(result) {
							var newsStr;
							var strs="";
							var secondStr;
								$.each(result, function(index, generalNews, array) {
									if(generalNews.days>7){
										newsStr="<li class='newsPart'><div class='leftPart'>"+
										"<span class='newsStar'>◆</span> <a href='${ctx}/front/view?type="+generalNews.type+"&id="+generalNews.articleId+
										"' title='"+generalNews.title+"' class='newsLine'>"+generalNews.title+"</a></div>"+
									"<div class='rightPart'><span>"+generalNews.pdate+"</span></div></li>";
										strs=strs+newsStr;
									}else{
									newsStr = "<li class='newsPart'><div class='leftPart'>"+
									"<span class='newsStar'>◆</span> <a href='${ctx}/front/view?type="+generalNews.type+"&id="+generalNews.articleId+
									"' title='"+generalNews.title+"' class='newsLine'>"+generalNews.title+"</a>"+
									<!--最近新闻图标-->
									"<span class='newsUpdate'><img src='${ctxsta}/front/image/new.png'></span></div>"+
								"<div class='rightPart'><span>"+generalNews.pdate+"</span></div></li>";
								strs=strs+newsStr;
									}
								
								}); 
								$("#news").append("<div style='width: 516px; height: 220px; margin: 15px auto'><ul>"+strs+"</ul></div>");
								
						}
					})
					
				}
				
				</script>
                <script>
				function scienceBoard(){
					$.ajax({
						ansync:false,
						dataType : 'json',
						type : 'post',
						url : '${ctx}/front/scienceBoard',
						success : function(result) {
							var newsStr;
							var strs="";
								$.each(result, function(index, scienceBoard, array) {
									newsStr ="<tr><td valign='top' width='4%'>◆</td><td width='80%'>"+
									"<a href='${ctx}/front/view?type="+scienceBoard.type+"&id="+scienceBoard.articleId+
									"' title='"+scienceBoard.title+"' class='twoLineEllipsis'>"+scienceBoard.title+"</a></td></tr>"
								strs=strs+newsStr;
								}); 
								$("#academic").append(
								"<div class='table' style='display: block; overflow: hidden; text-overflow: ellipsis'>"+
								"<table style='width: 100%'><tbody>"+strs+
										"</tbody></table></div>");
						}
					})
					
				}
				
				</script>
				<script>
				function information(){
					$.ajax({
						ansync:false,
						dataType : 'json',
						type : 'post',
						url : '${ctx}/front/information',
						success : function(result) {
							;
								$.each(result, function(index, information, array) {
									if(information.days>7){
										$("#announceList").append("<li><div class='leftList'>"+
												"<a href='${ctx}/front/view?type="+information.type+"&id="+information.articleId+
												"' title='"+information.title+"' class='announceLine'> <span class='dept'>["+information.name+"]</span>"+
												"<span>"+information.title+"</span></a>"+
											   "</div><span>"+information.pdate+"</span></li>");
									}else{
									
							   $("#announceList").append("<li><div class='leftList'>"+
										"<a href='${ctx}/front/view?type="+information.type+"&id="+information.articleId+
										"' title='"+information.title+"' class='announceLine'> <span class='dept'>["+information.name+"]</span>"+
										"<span>"+information.title+"</span></a> <span class='announceNew'>"+
										"<img src='${ctxsta}/front/image/new.png'></span>"+
									   "</div><span>"+information.pdate+"</span></li>");}
								}); 					
								
						}
					})
					
				}
				
				</script>
</body>
</html>