
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

/**初始化菜单树*/
function initMenuTree(treedata){
	treedata = eval('('+treedata+')');
	ztreeObject = $.fn.zTree.init($("#ztreedemo"), setting, treedata);
	//展开所有节点
	ztreeObject.expandAll(false);
}
/**节点点击事件*/
function onClick(event, treeId, treeNode, clickFlag) {
	$('#table').bootstrapTable('resetSearch', treeNode.name);
}

/*栏目-查看*/
function category_show(title,url,id,ope,w,h){
	if(id == null){
		layer_show(title,url,w,h);
	}else{
		layer_show(title,url+'/'+id+'/'+ope,w,h);
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
