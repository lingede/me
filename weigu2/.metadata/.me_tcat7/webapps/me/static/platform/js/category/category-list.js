
$(document).ready(function() {
	 // 多选框插件
	$('input').iCheck({
		checkboxClass : 'icheckbox_flat-green',
		radioClass : 'iradio_flat-green'
	});
});

var ztreeObject;
var setting = {
		data: {
			simpleData: {
				enable: true,
				idKey: "id",
				pIdKey: "categoryId",
				rootPId: 0
			},
			key: {
				name:'name',
				title:'name'
			}
		},
		check:{
			enable:false,
			nocheckInherit:true
		},
		callback: {
			onClick: onClick
		}
	};

/**初始化表格数据*/
function inittable(){
	$('#table').bootstrapTable({
		url: baselocation+"/platform/category/list/-1",
		search: true,
		striped: true,
		showRefresh: true,
		showToggle: true,
		showColumns: true,
		showExport: true,
		toolbar: '#toolbar',
		pagination: true,
		pageSize: 5,
        beforeContextMenuRow: function(e, row, buttonElement){
        	if(row.categoryId == null && row.isnavigation == 0){
        		$('#table').bootstrapTable('showContextMenu',{event:e, contextMenu:'#context-menu-add'});
        		$('#add').attr('href',baselocation+'/platform/category/list/'+row.id+'/upd?type=1');
        	}else if(row.categoryId == null && row.isnavigation == 1){
        		$('#table').bootstrapTable('showContextMenu',{event:e, contextMenu:'#context-menu-cancle'});
        		$('#cancle').attr('href',baselocation+'/platform/category/list/'+row.id+'/upd?type=0');
        	}else if(row.categoryId == null && row.isnavigation == null){
        		$('#table').bootstrapTable('showContextMenu',{event:e, contextMenu:'#context-menu-add'});
        		$('#add').attr('href',baselocation+'/platform/category/list/'+row.id+'/upd?type=1');
        	}
        },
	    columns: [{
	        field: 'name',
	        title: '栏目名称',
	        align: 'center'
	    }, {
	        field: 'type',
	        title: '种类',
	        align: 'center',
	        formatter: function(value,row,index){
	        	if(value == 1){
	        		return '列表类型';
	        	}else if(value == 2){
	        		return '超链接类型';
	        	}else if(value ==3){
	        		return '可维护页面类型';
	        	}else if(value ==4){
	        		return '静态页面类型';
	        	}
	        }
	    }, {
	        field: 'sortby',
	        title: '排序',
	        align: 'center'
	    },{
	        field: 'issubmit',
	        title: '是否允许投稿',
	        align: 'center',
	        formatter: function(value,row,index){
	        	if(value == 1){
	        		return '<span class="label label-primary">是</span>';
	        	}else if(value == 2){
	        		return '<span class="label label-danger">否</span>';
	        	}
	        }
	    },{
	    	field: 'id',
	    	title: '操作',
	    	align: 'center',
	    	formatter: function(value,row,index){
	    		var click="category_show('编辑栏目',"+value+",'edit','900',null)";
	    		var a = "<a class='edit m-l-sm text-warning' href='javascript:void(0)' onclick="+click+" title='编辑'>"+
	    				"<i class='glyphicon glyphicon-edit'></i></a>";
	    		var b = "<a class='remove m-l-sm text-danger' href='javascript:void(0)' onclick='category_del(this,"+value+")' title='删除'>"+
	    				"<i class='glyphicon glyphicon-remove'></i></a>";
	    		return a + b;
	    	}
	    }]
	});
}

/**初始化菜单树*/
function initMenuTree(treedata){
	treedata = eval('('+treedata+')');
	ztreeObject = $.fn.zTree.init($("#ztreedemo"), setting, treedata);
	//展开所有节点
	ztreeObject.expandAll(false);
}
/**节点点击事件*/
function onClick(event, treeId, treeNode, clickFlag) {
	$('#table').bootstrapTable('refresh',{url: baselocation+"/platform/category/list/"+treeNode.id});
}

/*栏目-查看*/
function category_show(title,id,ope,w,h){
	if(id == null){
		layer_show(title,baselocation+"/platform/category/list/add",w,h);
	}else{
		layer_show(title,baselocation+"/platform/category/list/"+id+"/"+ope,w,h);
	}
}

/*栏目-删除*/
function category_del(obj,id){
	layer.confirm('确认要删除吗？',{btn: ['确定','取消'] //按钮
	}, function(){
		$.ajax({
			type:'delete',
			dataType:'json',
			url:baselocation+'/platform/category/list/'+id+'/delete',
			success:function(result){
				if(result.success==true){
					layer.msg('已删除!',{icon:1,time:1000});
					location.reload();
				}else{
					layer.alert(result.message, {icon: 2});
				}
			}
		})
	});
}

/*弹出层*/
/*
	参数解释：
	title	标题
	url		请求的url
	id		需要操作的数据id
	w		弹出层宽度（缺省调默认值）
	h		弹出层高度（缺省调默认值）
*/
function layer_show(title,url,w,h){
	if (title == null || title == '') {
		title=false;
	};
	if (w == null || w == '') {
		w=800;
	};
	if (h == null || h == '') {
		h=($(window).height() - 50);
	};
	layer.open({
		type: 2,
		area: [w+'px', h +'px'],
		fix: false, //不固定
		maxmin: true,
		scrollbar: false,//屏蔽游览器滚动条
		shade:0.4,
		title: title,
		content: url
	});
}
