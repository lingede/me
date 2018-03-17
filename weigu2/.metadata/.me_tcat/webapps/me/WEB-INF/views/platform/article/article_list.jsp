<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/layouts/base.jsp"%>
<!DOCTYPE HTML>
<html>
  <head>
    <title>审核新闻管理</title>
    <link rel="stylesheet" href="${ctxsta}/common/bootstrap-table-master/bootstrap-table.min.css" />
    <link rel="stylesheet" href="${ctxsta}/common/bootstrap-datepicker-master/css/bootstrap-datepicker.min.css" />
  </head>
  
  <body class="gray-bg">
	<div class="wrapper wrapper-content animated fadeInRight">
         <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>新闻列表</h5>
                        <div class="ibox-tools">
                            <a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                            <a class="close-link"><i class="fa fa-times"></i></a>
                        </div>
                    </div>
                    <div class="ibox-content">
                        <div class="row row-lg">
                            <div class="col-sm-12">
                                <div class="example-wrap">
                                    <div class="example">
                               
                                        <table id="table"
                                           data-toggle="table"
                                           data-height="500"
                                           data-search="true"
                                           data-show-refresh="true"
                                           data-show-toggle="true"
                                           data-show-export="true"
                                           data-show-pagination-switch="true"
                                           data-show-columns="true"
                                           data-striped="true"
                                           data-pagination="true"
                                           data-sort-name="stargazers_count"
                                           data-sort-order="desc"
                                           data-toolbar="#toolbar">
                                        <thead>
                                        <tr>
                                            <th data-halign="center" data-align="center" data-sortable="true">栏目名称</th>
                                            <th data-halign="center" data-align="center" data-sortable="true">新闻标题</th>
                                            <th data-halign="center" data-align="center" data-sortable="true">标题图片</th>
                                            <th data-halign="center" data-align="center" data-sortable="true">作者</th>
                                            <th data-halign="center" data-align="center" data-sortable="true">提交时间</th>
                                            <th data-halign="center" data-align="center">操作</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${categoryhasarticle}" var="categoryHasArticle">
                                        <tr>
                                            <td>${categoryHasArticle.name}</td>
                                            <td>${categoryHasArticle.title}</td>
                                            <td>
                                            <button type="button" class="btn btn-info" onclick="showimage('${categoryHasArticle.titleimg}')">显示图片</button>
                                            </td>
                                            <td>${categoryHasArticle.author}</td>
                                            <td><fmt:formatDate value="${categoryHasArticle.createTime}" pattern="yyyy/MM/dd" /></td>
                                            <!-- 审核操作 -->
                                            <c:if test="${categoryHasArticle.state==0}">
                                             <td class="td-manage">  
                                            <a class="remove m-l-sm text-primary" href="javascript:void(0)" onclick="news_publish(this,${categoryHasArticle.id})" title="发布">
                                            <i class="glyphicon glyphicon-pause"></i>
                                            </a>
                                             <a class="remove m-l-sm text-danger" href="javascript:void(0)" onclick="window.open('${ctx}/front/view?type='+${categoryHasArticle.categoryId}+'&id='+${categoryHasArticle.articleId})" title="预览">
                                             <!--  onclick="member_show('创建团队','${ctx}/platform/team/list/add',null,null,'900',null)"-->
                                            <i class="glyphicon glyphicon-eye-open"></i>
                                            </a>
                                            <a class="edit m-l-sm text-warning" href="javascript:void(0)" onclick="news_show('编辑新闻内容','${ctx}/platform/categoryhasarticle/list','${categoryHasArticle.id}','edit','900',null)" title="编辑">
                                            <i class="glyphicon glyphicon-edit"></i>
                                            </a>
                                            <a class="remove m-l-sm text-primary" href="javascript:void(0)" onclick="news_back(this,${categoryHasArticle.id})" title="回退">
                                            <i class="glyphicon glyphicon-inbox"></i>
                                            </a>
                                            </td>
                                            </c:if>
                                            <!-- 发布操作 -->
                                            <c:if test="${categoryHasArticle.state==1}">
                                             <td class="td-manage">  
                                            <a class="remove m-l-sm text-primary" href="javascript:void(0)" onclick="news_toTop(this,${categoryHasArticle.id})" title="置顶">
                                            <i class="glyphicon glyphicon-arrow-up"></i>
                                            </a>
                                             <a class="remove m-l-sm text-danger" href="javascript:void(0)" onclick="news_cancel(this,${categoryHasArticle.id})" title="取消发布">
                                            <i class="glyphicon glyphicon-stop"></i>
                                            </a>
                                            <a class="edit m-l-sm text-warning" href="javascript:void(0)" onclick="news_play(this,${categoryHasArticle.id})" title="加入首页轮播">
                                            
                                            <i class="glyphicon glyphicon-play"></i>
                                            </a>
                                            </td>
                                            </c:if>
                                            <!-- 回收操作 -->
                                            <c:if test="${categoryHasArticle.state==2}">
                                             <td class="td-manage">  
                                            <a class="remove m-l-sm text-primary" href="javascript:void(0)" onclick="news_recheck(this,${categoryHasArticle.id})" title="重新审核">
                                            <i class="glyphicon glyphicon-check"></i>
                                            </a>
                                            <a class="remove m-l-sm text-primary" href="javascript:void(0)" onclick="news_del(this,${categoryHasArticle.id})" title="彻底删除">
                                            <i class="glyphicon glyphicon-remove"></i>
                                            </a>
                                            </td>
                                            </c:if>
		                                </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                    </div>
                                </div>
                        	</div>
                    	</div>
                    </div>
                </div>
            </div>
    	</div>
    </div>
    <meFooter>
    <!-- jquery-ui-->
    <script src="${ctxsta}/common/jquery/jquery-ui.min.js"></script>
    <!-- layer javascript -->
    <script src="${ctxsta}/common/layer/layer.js"></script>
    <!-- Bootstrap table -->
    <script src="${ctxsta}/common/bootstrap-table-master/bootstrap-table.min.js"></script>
    <script src="${ctxsta}/common/bootstrap-table-master/extensions/export/bootstrap-table-export.js"></script>
    <script src="${ctxsta}/common/bootstrap-table-master/tableExport.js"></script>
    <script src="${ctxsta}/common/bootstrap-table-master/locale/bootstrap-table-zh-CN.min.js"></script>
    <!-- Data picker -->
    <script src="${ctxsta}/common/bootstrap-datepicker-master/js/bootstrap-datepicker.min.js"></script>
    
    <!-- 自定义js -->
    <script src="${ctxsta}/platform/js/article/article-list.js"></script>
    </meFooter>

  </body>
</html>
