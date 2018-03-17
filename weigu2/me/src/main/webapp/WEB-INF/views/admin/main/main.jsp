<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/layouts/base.jsp"%>
<!DOCTYPE html>
<html>
  <head>
  	<title>后台管理系统</title>
  </head>
  <body>
  	    <div id="wrapper">
        <!--左侧导航开始-->
        <nav class="navbar-default navbar-static-side" role="navigation">
            <div class="nav-close"><i class="fa fa-times-circle"></i>
            </div>
            <div class="sidebar-collapse">
                <ul class="nav" id="side-menu">
                    <li class="nav-header">
                        <div class="dropdown profile-element">
                            <span>
                            <c:choose>
                                 <c:when test="${systemUser.picImg!=null && systemUser.picImg!=''}">
                                     <img src="${ctx }/${systemUser.picImg}" alt="头像加载中..." class="img-circle circle-size">
                                 </c:when>
                                 <c:otherwise>
                                     <img src="${ctx}/upload/icon/icon.jpg" alt="头像加载中..." class="img-circle  circle-size">
                                 </c:otherwise>
                             </c:choose>	
							</span>
                            <a data-toggle="dropdown" class="dropdown-toggle" href="">
                                <span class="clear">
                                <span class="block m-t-xs"><strong class="font-bold">　</strong></span>
                                <span class="text-muted text-xs block">${systemUser.userName }<b class="caret"></b></span>
                                </span>
                            </a>
                            <ul class="dropdown-menu animated fadeInRight m-t-xs">
                                <li><a class="J_menuItem" href="${ctx }/system/sysuser/upload">修改头像</a>
                                </li>
                                <li><a class="J_menuItem" href="${ctx }/system/sysuser/info">个人资料</a>
                                </li>
                                <li class="divider"></li>
                                <li><a href="${ctx}/system/logout">安全退出</a>
                                </li>
                            </ul>
                        </div>
                    </li>
					<c:forEach items="${systemMenus}" var="systemMenus">
						<c:choose>
							<c:when test="${systemMenus.childMenuList != null && systemMenus.childMenuList.size()>0}">
								<li>
			                        <a href="${ctx}${systemMenus.href}">
			                            <i class="fa ${systemMenus.icon}"></i>
			                            <span class="nav-label">${systemMenus.menuName}</span>
										<c:choose>
											<c:when test="${systemMenus.menuCode == 'order'}"><span class="label label-warning pull-right">16</span></c:when>
				                            <c:when test="${systemMenus.menuCode == 'message'}"><span class="label label-danger pull-right">16</span></c:when>
				                            <c:otherwise><span class="fa arrow"></span></c:otherwise>
										</c:choose>
			                        </a>
			                        <ul class="nav nav-second-level">
			                        <c:forEach items="${systemMenus.childMenuList}" var="childMenuList">
			                            <li>
			                                <a class="J_menuItem" href="${ctx}${childMenuList.href}">${childMenuList.menuName}</a>
			                            </li>
			                        </c:forEach>
			                        </ul>
			                    </li>
							</c:when>
							<c:otherwise>
								<li>
			                        <a class="J_menuItem" href="${ctx}${systemMenus.href}">
			                            <i class="fa ${systemMenus.icon}"></i>
			                            <span class="nav-label">${systemMenus.menuName}</span>
			                        </a>
			                    </li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
                </ul>
            </div>
        </nav>
        <!--左侧导航结束-->
        <!--右侧部分开始-->
        <div id="page-wrapper" class="gray-bg dashbard-1">
            <div class="row border-bottom">
                <nav class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0">
                    <div class="navbar-header">
                    	<a class="navbar-minimalize minimalize-styl-2 btn btn-primary " href="#"><i class="fa fa-bars"></i> </a>
                        <div role="search" class="navbar-form-custom">
                            <div class="form-group">
                                <a class="form-control" id="time"></a>
                            </div>
                        </div>
                    </div>
                    <ul class="nav navbar-top-links navbar-right">
                        <li class="dropdown hidden-xs">
                            <a class="right-sidebar-toggle" aria-expanded="false"><i class="fa fa-tasks"></i> 主题</a>
                        </li>
                    </ul>
                </nav>
            </div>
            <div class="row content-tabs">
                <button class="roll-nav roll-left J_tabLeft"><i class="fa fa-backward"></i>
                </button>
                <nav class="page-tabs J_menuTabs">
                    <div class="page-tabs-content">
                        <a href="javascript:;" class="active J_menuTab" data-id="index_v1.html">首页</a>
                    </div>
                </nav>
                <button class="roll-nav roll-right J_tabRight"><i class="fa fa-forward"></i>
                </button>
                <div class="btn-group roll-nav roll-right">
                    <button class="dropdown J_tabClose" data-toggle="dropdown">关闭操作<span class="caret"></span>

                    </button>
                    <ul role="menu" class="dropdown-menu dropdown-menu-right">
                        <li class="J_tabShowActive"><a>定位当前选项卡</a>
                        </li>
                        <li class="divider"></li>
                        <li class="J_tabCloseAll"><a>关闭全部选项卡</a>
                        </li>
                        <li class="J_tabCloseOther"><a>关闭其他选项卡</a>
                        </li>
                    </ul>
                </div>
                <a href="${ctx}/system/logout" class="roll-nav roll-right J_tabExit"><i class="fa fa fa-sign-out"></i> 退出</a>
            </div>
            <div class="row J_mainContent" id="content-main">
                <iframe class="J_iframe" name="iframe0" width="100%" height="100%" src="${ctx}/system/main/index"></iframe>
            </div>
            <div class="footer">
                <div class="pull-right">© 2016<a href="http://wpa.qq.com/msgrd?v=3&uin=810170512&site=qq&menu=yes" target="_Blank"> 电子科技大学</a>
                </div>
            </div>
        </div>
        <!--右侧部分结束-->
        <!--右侧边栏开始-->
        <div id="right-sidebar">
            <div class="sidebar-container">

                <ul class="nav nav-tabs navs-3">

                    <li class="active">
                        <a data-toggle="tab" href="#tab-1">
                            <i class="fa fa-gear"></i> 主题
                        </a>
                    </li>
                </ul>

                <div class="tab-content">
                    <div id="tab-1" class="tab-pane active">
                        <div class="sidebar-title">
                            <h3> <i class="fa fa-gear"></i> 主题设置</h3>
                            <small><i class="fa fa-tim"></i> 你可以从这里选择和预览主题的布局和样式，这些设置会被保存在本地，下次打开的时候会直接应用这些设置。</small>
                        </div>
                        <div class="skin-setttings">
                            <div class="title">主题设置</div>
                            <div class="setings-item">
                                <span>收起左侧菜单</span>
                                <div class="switch">
                                    <div class="onoffswitch">
                                        <input type="checkbox" name="collapsemenu" class="onoffswitch-checkbox" id="collapsemenu">
                                        <label class="onoffswitch-label" for="collapsemenu">
                                            <span class="onoffswitch-inner"></span>
                                            <span class="onoffswitch-switch"></span>
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="setings-item">
                                <span>固定顶部</span>
                                <div class="switch">
                                    <div class="onoffswitch">
                                        <input type="checkbox" name="fixednavbar" class="onoffswitch-checkbox" id="fixednavbar">
                                        <label class="onoffswitch-label" for="fixednavbar">
                                            <span class="onoffswitch-inner"></span>
                                            <span class="onoffswitch-switch"></span>
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="setings-item">
                                <span>固定宽度</span>
                                <div class="switch">
                                    <div class="onoffswitch">
                                        <input type="checkbox" name="boxedlayout" class="onoffswitch-checkbox" id="boxedlayout">
                                        <label class="onoffswitch-label" for="boxedlayout">
                                            <span class="onoffswitch-inner"></span>
                                            <span class="onoffswitch-switch"></span>
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="title">皮肤选择</div>
                            <div class="setings-item default-skin nb">
                                <span class="skin-name ">
                         			<a href="#" class="s-skin-0">默认皮肤</a>
                    			</span>
                            </div>
                            <div class="setings-item blue-skin nb">
                                <span class="skin-name ">
                        		<a href="#" class="s-skin-1">蓝色主题</a>
                    			</span>
                            </div>
                            <div class="setings-item yellow-skin nb">
                                <span class="skin-name ">
                        		<a href="#" class="s-skin-3">黄色/紫色主题</a>
                    			</span>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <!--右侧边栏结束-->
        <meFooter>
        <!-- 第三方插件 -->
		<script src="${ctxsta}/admin/main/js/pace/pace.min.js"></script>
        </meFooter>
    </div>
  </body>
</html>