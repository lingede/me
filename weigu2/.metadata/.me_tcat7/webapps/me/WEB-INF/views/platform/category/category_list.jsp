<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/layouts/base.jsp"%>
<!DOCTYPE HTML>
<html>
  <head>
    <title>栏目列表</title>
    <link rel="stylesheet" href="${ctxsta}/common/bootstrap-table-master/bootstrap-table.min.css" />
    <link rel="stylesheet" href="${ctxsta}/common/bootstrap-datepicker-master/css/bootstrap-datepicker.min.css" />
    <link rel="stylesheet" href="${ctxsta}/common/icheck/flat/green.css" />
    <link type="text/css" rel="stylesheet" href="${ctxsta}/common/ztree/css/metroStyle/metroStyle.css" />
  </head>
  
  <body class="system-message gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight system-message">
        <div class="row">
            <div class="col-sm-5">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>栏目信息</h5>
                        <div class="ibox-tools">
                            <a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                            <a class="close-link"><i class="fa fa-times"></i></a>
                        </div>
                    </div>
                    <div class="ibox-content form-horizontal" id="system-info">
                    	<div id="ztreedemo" class="ztree"></div>
                    	<div style="margin-top: 20px;">
                    		"首页导航"为前台页面显示的导航条,可以将一级栏目设置为显示或不显示，设置方法为：点击左侧栏目树选择一个一级栏目,然后在右边表格数据中右键选择"取消导航"或"设为导航"
                    	</div>
                    </div>
                </div>
            </div>
            <div class="col-sm-7">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>列表</h5>
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
                                    	<div id="toolbar" class="btn-group m-t-sm">
                                            <button type="button" class="btn btn-default"  title="添加分类" onclick="category_show('创建栏目',null,null,'900',null)">
                                                <i class="glyphicon glyphicon-plus"></i>
                                            </button>
                                        </div>
                                        <table id="table"></table>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- context menu -->
						<ul id="context-menu-add" class="dropdown-menu">
						    <li data-item="show"><a id="add" href="javascript:void(0);">设为导航</a></li>
						</ul>
						<ul id="context-menu-cancle" class="dropdown-menu">
						    <li data-item="cancle"><a id="cancle" href="javascript:void(0);">取消导航</a></li>
						</ul>
                    </div>
                </div>
            </div>
        </div>			
    </div>
    <meFooter>
    <!-- layer javascript -->
    <script src="${ctxsta}/common/layer/layer.js"></script>
    <!-- bootstrapvalidator-master前端验证框架 -->
	<script src="${ctxsta}/common/bootstrapvalidator-master/js/bootstrapValidator.min.js"></script>
    <!-- Bootstrap table -->
    <script src="${ctxsta}/common/bootstrap-table-master/bootstrap-table.min.js"></script>
    <script src="${ctxsta}/common/bootstrap-table-master/extensions/export/bootstrap-table-export.js"></script>
    <script src="${ctxsta}/common/bootstrap-table-master/tableExport.js"></script>
    <script src="${ctxsta}/common/bootstrap-table-master/locale/bootstrap-table-zh-CN.min.js"></script>
    <!-- Data picker -->
    <script src="${ctxsta}/common/bootstrap-datepicker-master/js/bootstrap-datepicker.min.js"></script>
    <!-- iCheck -->
	<script src="${ctxsta}/common/icheck/icheck.min.js"></script>
	<!-- contextmenu -->
	<script src="${ctxsta}/common/bootstrap-table-master/extensions/contextmenu/bootstrap-table-contextmenu.min.js"></script>
    <!-- 自定义js -->
    <script type="text/javascript" src="${ctxsta}/common/ztree/jquery.ztree.all.min.js"></script>
	<!-- 自定义js -->
	<script type="text/javascript">
		var treedata='${jsonCategory}';
		$(function(){
			initMenuTree(treedata);
			inittable();
		});
	</script>
    <script src="${ctxsta}/platform/js/category/category-list.js"></script>
    </meFooter>

  </body>
</html>